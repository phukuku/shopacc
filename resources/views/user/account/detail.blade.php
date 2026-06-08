
@extends('layouts.user.app')

@section('title', 'Chi tiết tài khoản #' . $account->id)

@section('content')
<section class="detail">
    <div class="container">
        <div class="detail__back">
            <a href="javascript:history.back()">
                <i class="fas fa-chevron-left"></i>
                Quay lại kho hàng
            </a>
        </div>


        <div class="detail__content">

            @php
            $allImages = collect([$account->thumb])->merge($images)->values();
            @endphp


            <!-- CỘT TRÁI -->
            <div class="detail__left">

                <div class="detail__viewer">
                    <button class="slider-btn prev" onclick="changeSlide(-1)">
                        ❮
                    </button>

                    <img id="mainImage"
                        src="{{ $allImages[0] }}"
                        class="detail__main-image"
                         onclick="openGallery()">
                    <button class="slider-btn next" onclick="changeSlide(1)">
                        ❯
                    </button>
                </div>

                <div class="detail__thumbs">
                    @foreach($allImages as $index => $image)
                    <img src="{{ $image }}"
                        class="detail__thumb {{ $index == 0 ? 'active' : '' }}"
                        onclick="selectImage({{ $index }})">
                    @endforeach
                </div>

            </div>

            <!-- CỘT PHẢI -->
            <div class="detail__right">

                <div class="detail__info">


                    <div class="detail__info-row">

                        <div class="detail__info-item">
                            <span class="detail__info-label">Mã:</span>
                            <span class="detail__info-value">
                                {{ ($account->account_name) }}
                            </span>
                        </div>
                    </div>
                  <div class="detail__info-row">
    <div class="detail__info-item">
        <span class="detail__info-label">Giá:</span>
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

            <span class="detail__info-value new-price">
                @if($account->price >= 1000000)
              {{ floor($account->price / 1000000) }}m{{ sprintf('%03d', floor(($account->price % 1000000) / 1000)) }}k
                @elseif($account->price >= 1000)
                    {{ number_format($account->price / 1000, 0, ',', '.') }}k
                @else
                    {{ number_format($account->price) }}đ
                @endif
            </span>
    </div>
</div>

                    <div class="detail__info-row">
                        <div class="detail__info-item">
                            <span class="detail__info-label">Đăng nhập:</span>
                            <span class="detail__info-value">
                                {{ display_dang_ky($account->registration_type) }}
                            </span>
                        </div>
                    </div>

                    @if ($account->note)
                    <div class="detail__info-row">
                        <div class="detail__info-item">
                            <span class="detail__info-label">Mô tả:</span>
                            <span class="detail__info-value">{{ $account->note }}</span>
                        </div>
                    </div>
                    @endif

                </div>

                <div class="detail__actions">
                    @if ($account->status === 'available')

                    <button class="detail__btn detail__btn--primary"
                        onclick="buyAccount({{ $account->id }})">
                        <i class="fas fa-shopping-cart"></i>
                        MUA NGAY
                    </button>

                   <button class="detail__btn detail__btn--wallet"
                        onclick="showInstallmentModal()">
                       <i class="fas fa-credit-card"></i>
                        TRẢ GÓP
                    </button>

                    @else

                    <div class="detail__purchased">
                        <h2 class="detail__purchased-title">
                            Tài khoản này đã được mua
                        </h2>
                    </div>

                    @endif
                </div>

            </div>

        </div>

    </div>
</section>


<!-- Purchase Modal -->
<div id="purchaseModal" class="modal">
    <div class="modal__content">
        <div class="modal__header">
            <h2 class="modal__title">XÁC NHẬN MUA MÃ: {{ $account->account_name }}</h2>
            <button class="modal__close" onclick="closePurchaseModal()">&times;</button>
        </div>

        <div class="modal__body">
            <div class="modal__info">
          
                <div class="modal__row">
                    <span class="modal__label">Mô tả:</span>
                    <span class="modal__value">{{ $account->note }}</span>
                </div>
                <div class="modal__row">
                    <span class="modal__label">Giá tiền:</span>
                    <span class="modal__value modal__value--price"
                        id="account-price">{{ number_format($account->price) }} đ</span>
                </div>
            </div>


            @auth
            @if (Auth::user()->balance < $account->price)
                <div class="modal__notice">
                    Bạn cần thêm {{ number_format($account->price - Auth::user()->balance) }}đ để mua tài khoản này.
                    Bạn hãy click vào nút nạp tiền để nạp thêm và mua tài khoản hoặc liên hệ admin hỗ trợ.
                </div>
                @endif
                @else
                <div class="modal__notice">
                    Vui lòng đăng nhập để thực hiện giao dịch.
                </div>
                @endauth
        </div>

        <div class="modal__footer">
            @auth
            @if (Auth::user()->balance < $account->price)
            <a href="https://zalo.me/0774412304" target="_blank" class="modal__btn modal__btn--zalo">
              <i class="fas fa-comment-dots"></i>
               LIÊN HỆ ZALO HỖ TRỢ 
            </a>
                <button class="modal__btn modal__btn--wallet" onclick="showRechargeModal('wallet')">NẠP TIỀN</button>
                @else
                <button class="modal__btn modal__btn--card" onclick="submitPurchase()">XÁC NHẬN
                    MUA</button>
            <a href="https://zalo.me/0774412304" target="_blank" class="modal__btn modal__btn--zalo">
              <i class="fas fa-comment-dots"></i>
               LIÊN HỆ ZALO HỖ TRỢ 
            </a>    
                @endif
                @else
            <a href="https://zalo.me/0774412304" target="_blank" class="modal__btn modal__btn--zalo">
              <i class="fas fa-comment-dots"></i>
               LIÊN HỆ ZALO HỖ TRỢ 
            </a>
                <a class="modal__btn modal__btn--wallet" href="{{ route('login') }}">ĐĂNG NHẬP</a>
                @endauth
                <!-- <button class="modal__btn modal__btn--close" onclick="closePurchaseModal()">ĐÓNG</button> -->
        </div>



           <div class="modal__body">
                <div class="seller-box">
                    <div class="seller-info">
                        <img class="seller-avatar"
                            src="https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/495369355_1035702681999185_7655716003355298532_n.jpg?stp=dst-jpg_tt6&cstp=mx600x600&ctp=s600x600&_nc_cat=108&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHhphAQR7JfdXY-VoJOnRb8h0PyVcwxrbSHQ_JVzDGttI1XhoG0mIgnNuuBJJ-c25iHgFMSm55PVaqkPHQtEU00&_nc_ohc=9by20A7WQ-sQ7kNvwEpzqA7&_nc_oc=AdqZXSuZJIUI81JjoyXtiT1bzyRRo7Tq2i7oqqdPoLU2BBgRL7LHrxRwc7j3GwyEjaY&_nc_zt=23&_nc_ht=scontent.fdad2-1.fna&_nc_gid=CeWaKpQtIZRKEjyaRPU20Q&_nc_ss=7b2a8&oh=00_Af_q94oPk1GiY78mox5qpWlld9gbd26npzfYLN4gsRFWJg&oe=6A2C4CAB"
                            alt="avatar">

                        <div class="seller-text">
                            <a href="https://www.facebook.com/100052288892328" target="_blank">
                                <span class="seller-name">
                                    Hoàng Thế Khang
                                    <i class="fas fa-check-circle verified"></i>
                                </span>
                            </a>

                            <a href="https://www.facebook.com/100066783877817" target="_blank">
                                <span class="seller-name">
                                    Văn Phú
                                    <i class="fas fa-check-circle verified"></i>
                                </span>
                            </a>
                        </div>
                    </div>

                    <div class="seller-social">
                        <a href="https://www.facebook.com/100052288892328"
                        target="_blank"
                        class="social-btn facebook">
                            <i class="fab fa-facebook-f"></i>
                        </a>

                        <a href="https://zalo.me/0774412304"
                        target="_blank"
                        class="social-btn zalo">
                            Zalo
                        </a>

                        <a href="https://m.me/100052288892328"
                        target="_blank"
                        class="social-btn messenger">
                            <i class="fab fa-facebook-messenger"></i>
                        </a>
                    </div>
               </div>
           </div>       
    </div>
</div>


    <!-- tra gop -->
<!-- Modal Trả Góp -->
<div id="installmentModal" class="modal">
    <div class="modal__content installment-modal">

        <div class="modal__header">
            <h3>Thông tin trả góp</h3>
            <button class="modal__close" onclick="closeInstallmentModal()">
                &times;
            </button>
        </div>

        <div class="modal__body">


            <div class="installment-contact-title">
                Bấm vào icon để liên hệ người bán thực hiện trả góp hoặc lên đời acc
            </div>

  <div class="seller-box">
    <div class="seller-info">
        <img class="seller-avatar"
             src="https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/495369355_1035702681999185_7655716003355298532_n.jpg?stp=dst-jpg_tt6&cstp=mx600x600&ctp=s600x600&_nc_cat=108&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHhphAQR7JfdXY-VoJOnRb8h0PyVcwxrbSHQ_JVzDGttI1XhoG0mIgnNuuBJJ-c25iHgFMSm55PVaqkPHQtEU00&_nc_ohc=9by20A7WQ-sQ7kNvwEpzqA7&_nc_oc=AdqZXSuZJIUI81JjoyXtiT1bzyRRo7Tq2i7oqqdPoLU2BBgRL7LHrxRwc7j3GwyEjaY&_nc_zt=23&_nc_ht=scontent.fdad2-1.fna&_nc_gid=CeWaKpQtIZRKEjyaRPU20Q&_nc_ss=7b2a8&oh=00_Af_q94oPk1GiY78mox5qpWlld9gbd26npzfYLN4gsRFWJg&oe=6A2C4CAB"
             alt="avatar">

        <div class="seller-text">
            <a href="https://www.facebook.com/100052288892328" target="_blank">
                <span class="seller-name">
                    Hoàng Thế Khang
                    <i class="fas fa-check-circle verified"></i>
                </span>
            </a>

            <a href="https://www.facebook.com/100066783877817" target="_blank">
                <span class="seller-name">
                    Văn Phú
                    <i class="fas fa-check-circle verified"></i>
                </span>
            </a>
        </div>
    </div>

    <div class="seller-social">
        <a href="https://www.facebook.com/100052288892328"
           target="_blank"
           class="social-btn facebook">
            <i class="fab fa-facebook-f"></i>
        </a>

        <a href="https://zalo.me/0774412304"
           target="_blank"
           class="social-btn zalo">
            Zalo
        </a>

        <a href="https://m.me/100052288892328"
           target="_blank"
           class="social-btn messenger">
            <i class="fab fa-facebook-messenger"></i>
        </a>
    </div>
</div>

        </div>
    </div>
</div>


<div id="galleryModal" class="gallery-modal">
    <div class="gallery-content">

        <button class="gallery-close" onclick="closeGallery()">
            ✕
        </button>

        <div class="gallery-thumbs">
            @foreach($allImages as $image)
                <img src="{{ $image }}">
            @endforeach
        </div>

    </div>
</div>
<script>
function openGallery() {
    document.getElementById('galleryModal').style.display = 'block';
    document.body.style.overflow = 'hidden';
}

function closeGallery() {
    document.getElementById('galleryModal').style.display = 'none';
    document.body.style.overflow = 'auto';
}
</script>
<script>
function showInstallmentModal() {
    document.getElementById('installmentModal').style.display = 'flex';
}

function closeInstallmentModal() {
    document.getElementById('installmentModal').style.display = 'none';
}
</script>

@push('scripts')
<script>
    const images = @json($allImages);
    let currentIndex = 0;

    function selectImage(index) {
        currentIndex = index;
        updateMainImage();
    }

    function changeSlide(direction) {
        currentIndex += direction;

        if (currentIndex < 0) {
            currentIndex = images.length - 1;
        }

        if (currentIndex >= images.length) {
            currentIndex = 0;
        }

        updateMainImage();
    }

    function updateMainImage() {
        document.getElementById('mainImage').src = images[currentIndex];

        document.querySelectorAll('.detail__thumb').forEach((thumb, index) => {
            thumb.classList.toggle('active', index === currentIndex);
        });
    }
</script>
     <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Initialize the lightbox for account images
                const lightbox = new SimpleLightbox('.detail__images-link', {
                    captionPosition: 'bottom',
                    captionsData: 'alt',
                    closeText: '×',
                    navText: ['←', '→'],
                    animationSpeed: 250,
                    enableKeyboard: true,
                    scaleImageToRatio: true,
                    disableRightClick: true
                });
            });

            function buyAccount(accountId) {
                const modal = document.getElementById('purchaseModal');
                if (modal) {
                    modal.style.display = 'block';
                    document.body.style.overflow = 'hidden';

                    // Initialize discount handler
                    initDiscountHandler('account', accountId, {{ $account->price }});
                }
            }

            function submitPurchase() {
                const accountId = {{ $account->id }};
                const discountInfo = getDiscountInfo();

                fetch(`/account/${accountId}/purchase`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                        },
                        body: JSON.stringify({
                            discount_code: discountInfo.discountCode
                        })
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            alert('Thành công! ' + data.message);
                            window.location.href = data.redirect_url;
                        } else {
                            alert('Lỗi! ' + data.message);
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('Lỗi! Đã xảy ra lỗi khi xử lý giao dịch');
                    });
            }

            function showRechargeModal(type) {
                window.open('/profile/deposit/atm', '_blank');
            }

            function closePurchaseModal() {
                const modal = document.getElementById('purchaseModal');
                if (modal) {
                    modal.style.display = 'none';
                    document.body.style.overflow = 'auto';
                }
            }

            // Close modal when clicking outside
            document.addEventListener('DOMContentLoaded', function() {
                const modal = document.getElementById('purchaseModal');
                if (modal) {
                    window.addEventListener('click', function(event) {
                        if (event.target === modal) {
                            closePurchaseModal();
                        }
                    });
                }
            });
        </script>
@endpush
@endsection