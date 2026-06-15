<?php



namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;

use App\Models\GameAccount;
use App\Models\MoneyTransaction;
use App\Models\DiscountCode;
use App\Http\Controllers\DiscountCodeController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GameAccountController extends Controller
{
public function show($id)
{
    $account = GameAccount::findOrFail($id);

    $images = json_decode($account->images) ?? [];

    $relatedAccounts = GameAccount::where(
        'game_category_id',
        $account->game_category_id
    )
    ->where('id', '!=', $account->id)
    ->where('status', 'available')
    ->latest()
    ->take(10)
    ->get();

    $categoryCount = GameAccount::where(
        'game_category_id',
        $account->game_category_id
    )
    ->where('status', 'available')
    ->count();

    return view(
        'user.account.detail',
        compact(
            'account',
            'images',
            'relatedAccounts',
            'categoryCount'
        )
    );
}
    public function showAllAcc(Request $request)
    {
        $title = 'Tất cả tài khoản game';

        $accounts = GameAccount::with('category');

        // Mặc định chỉ hiện acc chưa bán
        if (!$request->filled('status')) {
            $accounts->where('status', 'available');
        }

        // Tìm kiếm theo mã acc hoặc nội dung note
        if ($request->filled('code')) {
            $accounts->where(function ($query) use ($request) {
                $query->where('account_name', 'LIKE', '%' . $request->code . '%')
                    ->orWhere('note', 'LIKE', '%' . $request->code . '%');
            });
        }

        // Lọc giá
        if ($request->filled('price_range')) {
            $range = explode('-', $request->price_range);

            if (count($range) === 2) {
                $accounts->whereBetween('price', [
                    (int) $range[0],
                    (int) $range[1]
                ]);
            } else {
                $accounts->where('price', '>=', (int) $range[0]);
            }
        }

        // Sắp xếp
        if ($request->filled('sort')) {

            if ($request->sort == 'oldest') {
                $accounts->orderBy('id', 'ASC');
            } else {
                $accounts->orderBy('id', 'DESC');
            }
        } else {

            // Mặc định mới nhất
            $accounts->orderBy('id', 'DESC');
        }

        $accounts = $accounts->get();

        return view('user.account.show-all', compact('title', 'accounts'))->with('totalAccounts', $accounts->count());
    }


    public function purchase(Request $request, $id)
    {
        try {
            DB::beginTransaction();

            $account = GameAccount::where('id', $id)
                ->where('status', 'available')
                ->lockForUpdate()
                ->firstOrFail();

            $user = Auth::user();
            $finalPrice = $account->price;
            $discountAmount = 0;
            $discountCodeController = new DiscountCodeController();

            

            if ($user->balance < $finalPrice) {
                DB::rollBack();
                return response()->json([
                    'success' => false,
                    'message' => 'Số dư không đủ để mua tài khoản này'
                ]);
            }

            // Update user balance
            $balanceBefore = $user->balance;
            $balanceAfter = $balanceBefore - $finalPrice;

            // Use direct DB update instead of model save
            DB::table('users')
                ->where('id', $user->id)
                ->update(['balance' => $balanceAfter]);

            // Update account status
            DB::table('game_accounts')
                ->where('id', $account->id)
                ->update([
                    'status' => 'sold',
                    'buyer_id' => $user->id
                ]);

            // Thêm lịch sử biến động số dư
            DB::table('money_transactions')->insert([
                'user_id' => $user->id,
                'type' => 'purchase',
                'amount' => -$finalPrice,
                'balance_before' => $balanceBefore,
                'balance_after' => $balanceAfter,
                'description' => 'Mua tài khoản #' . $account->id . ($discountAmount > 0 ? ' (Giảm giá: ' . number_format($discountAmount) . 'đ)' : ''),
                'reference_id' => $account->id,
                'created_at' => now(),
                'updated_at' => now()
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Mua tài khoản thành công!',
                'data' => [
                    'new_balance' => $balanceAfter
                ],
                'redirect_url' => route('profile.purchased-accounts')
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi mua tài khoản: ' . $e->getMessage()
            ]);
        }
    }
}
