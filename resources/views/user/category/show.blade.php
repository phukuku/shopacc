@extends('layouts.user.app')

@section('title', $category->name)

@section('content')
<!-- Hero Section -->
<x-hero-header
    title="{{ $category->name }}"
    description="Hiện có {{ $accounts->count() }} tài khoản đang bán" />
<!-- Account List Section -->
<section class="account-section">
    <div class="container">
        <!-- Filter Bar -->
        <form action="" method="GET" class="account-filter">
            <div class="account-filter__row">

                <div class="account-filter__group">
                    <label for="code" class="account-filter__label">Tìm kiếm:</label>
                    <input type="text"
                        id="code"
                        name="code"
                        class="account-filter__input"
                        placeholder="Nhập ..."
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
                        <option value="3000000"
                            {{ request('price_range') == '3000000' ? 'selected' : '' }}>
                            Trên 3M
                        </option>

                    </select>
                </div>

                
                <div class="account-filter__group">
                    <label for="sort" class="account-filter__label">Sắp xếp:</label>
                    <select id="sort"
                        name="sort"
                        class="account-filter__input account-filter__input--select"
                        onchange="this.form.submit()">

                        <option value="newest" {{ request('sort') == 'newest' ? 'selected' : '' }}>
                            Mới nhất
                        </option>

                        <option value="oldest" {{ request('sort') == 'oldest' ? 'selected' : '' }}>
                            Cũ nhất
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
                    @if($account->created_at >= now()->subDays(2))
                    <div class="badge-new">
                        &nbsp;Acc mới&nbsp;
                    </div>
                    @endif

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
                          <span class="new-price">
                            GIÁ:

                            @if($account->server)
                                <span class="old-price">
                                   @if($account->server >= 1000000)
    {{ floor($account->server / 1000000) }}m{{ floor(($account->server % 1000000) / 100000) ?: '' }}
                                    @elseif($account->server >= 1000)
                                        {{ number_format($account->server / 1000, 0, ',', '.') }}k
                                    @else
                                        {{ number_format($account->server) }}đ
                                    @endif
                                </span>
                            @endif

                           @if($account->price >= 1000000)
    {{ floor($account->price / 1000000) }}m{{ sprintf('%03d', floor(($account->price % 1000000) / 1000)) }}k
                            @elseif($account->price >= 1000)
                                {{ number_format($account->price / 1000, 0, ',', '.') }}k
                            @else
                                {{ number_format($account->price) }}đ
                            @endif
                        </span>
                       </div>
                        <a href="{{ route('account.show', ['id' => $account->id]) }}"
                            class="action-btn action-btn--detail">XEM CHI TIẾT</a>
                    </div>
                </a>
            </div>
            @empty
            <div class="no-data">
                <p class="no-data-text">Hiện đang hết tài khoản loại này</p>
            </div>
            @endforelse
        </div>

        <!-- Pagination -->
        {{-- {{ $accounts->links() }} --}}
    </div>
</section>
@endsection