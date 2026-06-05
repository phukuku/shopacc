@extends('layouts.user.app')

@section('title', 'Tất cả tài khoản')

@section('content')
<!-- Hero Section -->
<x-hero-header
    title="Tất cả tài khoản game"
    description="Danh sách tất cả tài khoản đang bán"
/>

<!-- Account List Section -->
<section class="account-section">
    <div class="container">
        <!-- Filter Bar -->
        <form action="" method="GET" class="account-filter">
            <div class="account-filter__row">

                <div class="account-filter__group">
                    <label for="code" class="account-filter__label">Mã Số:</label>
                    <input type="text"
                        id="code"
                        name="code"
                        class="account-filter__input"
                        placeholder="Nhập Mã Số"
                        value="{{ request('code') }}"
                        oninput="clearTimeout(window.searchTimer); window.searchTimer=setTimeout(()=>this.form.submit(),500);">
                </div>

                <div class="account-filter__group">
                    <label for="price_range" class="account-filter__label">Giá:</label>
                    <select id="price_range"
                        name="price_range"
                        class="account-filter__input account-filter__input--select"
                        onchange="this.form.submit()">

                        <option value="">Tất cả</option>

                        <option value="0-500000"
                            {{ request('price_range') == '0-500000' ? 'selected' : '' }}>
                            Dưới 500K
                        </option>

                        <option value="500000-1000000"
                            {{ request('price_range') == '500000-1000000' ? 'selected' : '' }}>
                            500K - 1M
                        </option>

                        <option value="1000000-3000000"
                            {{ request('price_range') == '1000000-3000000' ? 'selected' : '' }}>
                            1M - 3M
                        </option>

                        <option value="3000000-5000000"
                            {{ request('price_range') == '3000000-5000000' ? 'selected' : '' }}>
                            3M - 5M
                        </option>

                        <option value="5000000"
                            {{ request('price_range') == '5000000' ? 'selected' : '' }}>
                            Trên 5M
                        </option>

                    </select>
                </div>

                <div class="account-filter__group">
                    <label for="status" class="account-filter__label">Trạng thái:</label>
                    <select id="status"
                        name="status"
                        class="account-filter__input account-filter__input--select"
                        onchange="this.form.submit()">

                        <option value="">Trạng Thái</option>

                        <option value="available"
                            {{ request('status') == 'available' ? 'selected' : '' }}>
                            Chưa bán
                        </option>

                        <option value="sold"
                            {{ request('status') == 'sold' ? 'selected' : '' }}>
                            Đã bán
                        </option>

                    </select>
                </div>

            </div>

            <div class="account-filter__actions">
                <a href="{{ request()->url() }}"
                    class="account-filter__button account-filter__button--outline">
                    <i class="fa-solid fa-rotate"></i> ĐẶT LẠI
                </a>
            </div>
        </form>

        <!-- Account Grid -->
        <div class="account-grid">
            @forelse($accounts as $account)
            <div class="account-card">
                <div class="account-media">
                    <a href="{{ route('account.show', ['id' => $account->id]) }}">
                        <img src="{{ $account->thumb }}" alt="Account Preview" class="account-img">
                        <div class="account-code">Mã: {{ $account->account_name }}</div>
                    </a>



                </div>

                <a href="{{ route('account.show', ['id' => $account->id]) }}">

                    <div class="account-note">
                        <div class="card-note">
                            {{($account->note) }}
                        </div>

                    </div>

                    <div class="account-actions">
                        <div class="card-price">
                            GIÁ: {{ number_format($account->price) }} đ
                        </div>
                        <a href="{{ route('account.show', ['id' => $account->id]) }}"
                            class="action-btn action-btn--detail">XEM CHI TIẾT</a>
                    </div>
                </a>
            </div>
            @empty
            <div class="no-data">
                <p class="no-data-text">Không có tài khoản nào</p>
            </div>
            @endforelse
        </div>

        <!-- Pagination -->
        {{-- {{ $accounts->links() }} --}}
    </div>
</section>
@endsection