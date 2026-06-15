@extends('layouts.user.app')

@section('title', $title)

@section('content')
    <section class="profile-section">
        <div class="container">
            <div class="profile-container">
                <div class="profile-header">
                    <h1 class="profile-title"><i class="fa-solid fa-box me-2"></i> TÀI KHOẢN ĐÃ MUA</h1>
                </div>

                <div class="profile-content">
                    @include('layouts.user.sidebar')

                    <div class="profile-main">
                        <div class="profile-info-card">
                            <div class="info-header">
                                <div class="balance-info">
                                    <span class="balance-label"><i class="fa-solid fa-wallet me-2"></i> SỐ DƯ HIỆN TẠI:
                                        {{ number_format($user->balance) }} VND</span>
                                </div>
                            </div>

                            <div class="info-content">
                                @if (session('error'))
                                    <div class="alert alert-danger">
                                        <i class="fa-solid fa-circle-exclamation me-2"></i> {{ session('error') }}
                                    </div>
                                @endif

                                @if (session('success'))
                                    <div class="alert alert-success">
                                        <i class="fa-solid fa-circle-check me-2"></i> {{ session('success') }}
                                    </div>
                                @endif

                                <div class="transaction-history">
                                    <div class="history-table-container">
                                        <table class="history-table">
                                            <thead>
                                                <tr>                                              
                                                    <th>Mã acc</th>                                  
                                                    <th>Số tiền</th>
                                                    <th>Xem acc</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @forelse($transactions as $transaction)
                                                    <tr>
                                                        <td class="text-bold">{{ $transaction->account_name }}</td>
                                                        <td class="amount text-danger">
                                                            -{{ number_format($transaction->price) }} VND</td>
                                                        <td>
                                                            <a href="{{ route('account.show', ['id' => $transaction->id]) }}"
                                                                class="btn btn-sm btn-info" target="_blank">
                                                              <i class="fa-solid fa-eye"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                         <div class="installment-contact-title">
                                                            <h5>📞 Nhắn với người bán để nhận acc 💬 </h5>
                                                        </div>
                                                        <div class="modal__body">                                     
                                                                <div class="seller-box">
                                                                    <div class="seller-info">
                                                                        <img class="seller-avatar"
                                                                            src="https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/495369355_1035702681999185_7655716003355298532_n.jpg?stp=dst-jpg_tt6&cstp=mx600x600&ctp=s600x600&_nc_cat=108&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHhphAQR7JfdXY-VoJOnRb8h0PyVcwxrbSHQ_JVzDGttI1XhoG0mIgnNuuBJJ-c25iHgFMSm55PVaqkPHQtEU00&_nc_ohc=9by20A7WQ-sQ7kNvwEpzqA7&_nc_oc=AdqZXSuZJIUI81JjoyXtiT1bzyRRo7Tq2i7oqqdPoLU2BBgRL7LHrxRwc7j3GwyEjaY&_nc_zt=23&_nc_ht=scontent.fdad2-1.fna&_nc_gid=CeWaKpQtIZRKEjyaRPU20Q&_nc_ss=7b2a8&oh=00_Af_q94oPk1GiY78mox5qpWlld9gbd26npzfYLN4gsRFWJg&oe=6A2C4CAB"
                                                                            alt="avatar">

                                                                        <div class="seller-text">
                                                                            <a href="{{ config_get('telegram', '#') }}" target="_blank">
                                                                                <span class="seller-name">
                                                                                    Văn Phú
                                                                                    <i class="fas fa-check-circle verified"></i>
                                                                                </span>
                                                                            </a>

                                                                            <a href="{{ config_get('tiktok', '#') }}" target="_blank">
                                                                                <span class="seller-name">
                                                                                    Hoàng Thế Khang
                                                                                    <i class="fas fa-check-circle verified"></i>
                                                                                </span>
                                                                            </a>
                                                                        </div>
                                                                    </div>

                                                                        <div class="seller-social">
                                                                            <a href="{{ config_get('facebook', '#') }}"
                                                                            target="_blank"
                                                                            class="social-btn facebook">
                                                                                <i class="fab fa-facebook-f"></i>
                                                                            </a>

                                                                            <a href="https://zalo.me/{{ config_get('zalo') }}"
                                                                            target="_blank"
                                                                            class="social-btn zalo">
                                                                                Zalo
                                                                            </a>

                                                                            <a href="{{ config_get('youtube', '#') }}"
                                                                            target="_blank"
                                                                            class="social-btn messenger">
                                                                                <i class="fab fa-facebook-messenger"></i>
                                                                            </a>
                                                                        </div>
                                                                </div>
                                                            </div>  
                                                        </td>
                                                    </tr>
                                                @empty
                                                    <tr>
                                                        <td colspan="7" class="no-data">Không có dữ liệu</td>
                                                    </tr>
                                                @endforelse
                                            </tbody>
                                        </table>


                                    <div class="pagination">
                                        {{ $transactions->links() }}
                                    </div>
                                </div>      
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
