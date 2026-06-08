<!-- Mobile Menu (Bottom Navigation) -->
<div class="menu-mobile">
    <ul class="menu-mobile__list">
        <li class="menu-mobile__item">
            <a href="/" class="menu-mobile__link {{ request()->is('/') ? 'active' : '' }}">
                <i class="fas fa-home"></i>
                <span>Trang chủ</span>
            </a>
        </li>
        <li class="menu-mobile__item">
            <a href="{{ route('category.show-all') }}"
                class="menu-mobile__link {{ request()->routeIs('category*') ? 'active' : '' }}">
                <i class="fas fa-gamepad"></i>
                <span>Danh mục</span>
            </a>
        </li>

          <li class="menu-mobile__item">
            <a href="{{ route('account') }}"
                class="menu-mobile__link {{ request()->routeIs('account') || request()->routeIs('account.*') ? 'active' : '' }}">
                <i class="fas fa-search"></i>
                <span>Tìm acc</span>
            </a>
        </li>

        <li class="menu-mobile__item">
            <a href="{{ route('profile.index') }}"
                class="menu-mobile__link {{ request()->routeIs('profile*') ? 'active' : '' }}">
                <i class="fas fa-user"></i>
                <span>Tài khoản</span>
            </a>
        </li>
    </ul>
</div>

<!-- Mobile Overlay Menu (Fullscreen) - Hidden by default -->
<div class="mobile-overlay-menu">
    <div class="mobile-overlay-menu__header">
        <h2 class="mobile-overlay-menu__title">Menu</h2>
        <button class="mobile-overlay-menu__close">
            <i class="fas fa-times"></i>
        </button>
    </div>
    <div class="mobile-overlay-menu__content">
        <div class="mobile-overlay-menu__section">
            <h3 class="mobile-overlay-menu__section-title">Tài khoản</h3>
            <ul class="mobile-overlay-menu__links">
                @guest
                <li>
                    <a href="{{ route('login') }}" class="mobile-overlay-menu__link">
                        <i class="fas fa-sign-in-alt"></i> Đăng nhập
                    </a>
                </li>
                <li>
                    <a href="{{ route('register') }}" class="mobile-overlay-menu__link">
                        <i class="fas fa-user-plus"></i> Đăng ký
                    </a>
                </li>
                @else
                <li>
                    <a href="{{ route('profile.index') }}" class="mobile-overlay-menu__link">
                        <i class="fas fa-user-circle"></i> {{ Auth::user()->username }}
                    </a>
                </li>
                <li>
                    <a href="{{ route('profile.deposit-atm') }}" class="mobile-overlay-menu__link">
                        <i class="fas fa-wallet"></i> Số dư: {{ number_format(Auth::user()->balance) }}đ
                    </a>
                </li>
                <li>
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <button type="submit" class="mobile-overlay-menu__link mobile-overlay-menu__button">
                            <i class="fas fa-sign-out-alt"></i> Đăng xuất
                        </button>
                    </form>
                </li>
                @endguest
            </ul>
        </div>
        <div class="mobile-overlay-menu__section">
            <h3 class="mobile-overlay-menu__section-title">Danh mục</h3>
            <ul class="mobile-overlay-menu__links">
                <li>
                    <a href="{{ route('category.show-all') }}" class="mobile-overlay-menu__link">
                        <i class="fas fa-gamepad"></i> Tài khoản Game
                    </a>
                    <a href="{{ route('account') }}" class="mobile-overlay-menu__link">
                        <i class="fas fa-search"></i> Tìm acc
                    </a>
                </li>

                <li>
                    @if (Auth::check() && Auth()->user()->role == 'admin')
                    <a href="{{ route('admin.index') }}" target="_blank" class="mobile-overlay-menu__link">
                        <i class="fas fa-gamepad"></i> ADMIN PANEL</a>
                    @endif

                </li>
            </ul>
        </div>
    </div>
</div>

<!-- Overlay backdrop for mobile menu -->
<div class="mobile-overlay"></div>