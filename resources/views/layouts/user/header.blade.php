


<!-- Announcement -->
<header class="announcement">
    <div class="container row">
        <div class="announcement__media">
            <a class="social-btn facebook" href="https://www.facebook.com/100052288892328">
                <i class="fa-brands fa-facebook"></i>
            </a>

            <a class="social-btn messenger" href="https://m.me/100052288892328">
                <i class="fa-brands fa-facebook-messenger"></i>
            </a>

            <a class="social-btn zalo" href="https://zalo.me/0774412304" target="_blank">
                Zalo
            </a>
        </div>


    </div>
</header>

<!-- Nav -->
<nav class="nav">
    <div class="container row">
        <a href="/" style="display: flex; align-items: center">
            <img src="{{ config_get('site_logo') }}" alt="{{ config_get('site_name') }}" class="nav__logo" />
        </a>
        <div class="nav__menu">
            <a href="/" class="text menu__item {{ request()->is('/') ? 'active' : '' }}">Trang chủ</a>
            <a href="{{ route('profile.deposit-atm') }}"
                class="text menu__item {{ request()->routeIs('profile.deposit-atm') ? 'active' : '' }}">Nạp tiền</a>

            <a href="{{ route('category.show-all') }}"
                class="text menu__item {{ request()->routeIs('category.*') ? 'active' : '' }}">Nick game</a>

            <a href="{{ route('account') }}"
                class="text menu__item {{ request()->routeIs('account') || request()->routeIs('account.*') ? 'active' : '' }}">Tìm acc</a>

            @if (Auth::check() && Auth()->user()->role == 'admin')
            <a href="{{ route('admin.index') }}" target="_blank" class="text menu__item">ADMIN PANEL</a>
            @endif
        </div>
        <button class="menu-toggle" aria-label="Toggle Menu">
            <i class="fas fa-bars"></i>
        </button>
        <div class="nav__action">
            @guest
            <a href="{{ route('login') }}" class="text action__link"><i class="fa-solid fa-user"></i> Đăng nhập</a>
            <a href="{{ route('register') }}" class="text action__link action__link--primary"><i
                    class="fa-solid fa-key"></i> Đăng ký</a>
            @else
            <a href="{{ route('profile.index') }}" class="text"><i class="fa-solid fa-user"></i>
                {{ Auth::user()->username }}
                -
                <span class="balance-value">{{ number_format(Auth::user()->balance) }}đ</span></a>
            <form method="POST" action="{{ route('logout') }}" style="display: inline;">
                @csrf
                <button type="submit" class="text action__link action__link--primary">
                    <i class="fa-solid fa-sign-out-alt"></i> Đăng xuất
                </button>
            </form>
            @endguest
        </div>
    </div>
</nav>