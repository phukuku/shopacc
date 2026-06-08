<?php

/**
 * Copyright (c) 2025 FPT University
 *
 * @author    Phạm Hoàng Tuấn
 * @email     phamhoangtuanqn@gmail.com
 * @facebook  fb.com/phamhoangtuanqn
 */

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\GameAccount;
use App\Models\GameCategory;
use Illuminate\Http\Request;

class GameCategoryController extends Controller
{
    public function index(string $slug, Request $request)
    {
        $category = GameCategory::where("slug", $slug)->firstOrFail();

        // Get all accounts linked to this category
        $accounts = GameAccount::where('game_category_id', $category->id);
        if (!$request->filled('status')) {
            $accounts->where('status', 'available');
        }

        // Apply filters if any are set
        if ($request->hasAny(['code', 'price_range', 'status', 'server'])) {
            // Filter by code/ID
            if ($request->filled('code')) {
                $accounts->where(function ($query) use ($request) {
                    $query->where('account_name', 'LIKE', '%' . $request->code . '%')
                        ->orWhere('note', 'LIKE', '%' . $request->code . '%');
                });
            }

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
        return view('user.category.show', compact('category', 'accounts'));
    }

    public function showAll()
    {
        $title = 'Danh mục bán nick game';

        // Get all categories with additional statistics
        $categories = Category::where('active', 1)->get();

        foreach ($categories as $category) {
            // Total accounts in this category
            $category->allAccount = GameAccount::where('game_category_id', $category->id)->count();

            // Sold accounts in this category
            $category->soldCount = GameAccount::where('game_category_id', $category->id)
                ->where('status', 'sold')
                ->count();
        }

        return view('user.category.show-all', compact('categories', 'title'));
    }
}
