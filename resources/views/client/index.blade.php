@extends('layouts.client')
@section('content-client')
<style>
    .offer {
    position: absolute;
    top: 10px;
    left: 10px;
    padding: 5px 15px;
    background-color: #ff4500; /* Màu cam nổi bật */
    color: white;
    font-weight: bold;
    font-size: 16px;
    border-radius: 10px;
    text-transform: uppercase;
    letter-spacing: 1px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Thêm bóng cho phần text */
    transform: rotate(-10deg); /* Góc nghiêng để tạo sự độc đáo */
    z-index: 10; /* Đảm bảo phần này luôn hiển thị trên các thành phần khác */
}

/* Hiệu ứng hover */
.offer:hover {
    background-color: #ff6347; /* Màu cam sáng hơn khi hover */
    cursor: pointer;
    transform: rotate(0deg); /* Loại bỏ hiệu ứng nghiêng khi hover */
}
    .container_fullwidth{
        background-color: #f5f5f5;
    }
    .news-container {
    display: flex;
    justify-content: space-between;
    gap: 20px;
    flex-wrap: wrap;
}

.news-item {
    flex: 1;
    min-width: 22%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f9f9f9;
}

.news-item h2 {
    font-style: bold;
    font-size: 18px;
    margin-bottom: 10px;
}

.news-item p {
    font-size: 14px;
    color: #555;
}

#sequence {
    position: relative;
    width: 100%;
    height: 35vh;
    overflow: hidden;
}

.sequence-canvas {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    transition: transform 1s ease-in-out; /* Hiệu ứng chuyển slide */
}

.sequence-canvas li {

    position: relative;
    min-width: 100%;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    display: flex;
    align-items: center;
    justify-content: center;
    object-fit: cover;         /* Giữ tỷ lệ ảnh và cắt bớt phần thừa */
    object-position: center;   /* Căn giữa ảnh */
}

.flat-caption {
    position: relative;
    z-index: 2;
    color: #fff;
    text-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
}

.sequence-prev, .sequence-next {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    z-index: 3;
    font-size: 2rem;
    color: #fff;
    cursor: pointer;
}

.sequence-prev {
    left: 20px;
}

.sequence-next {
    right: 20px;
}


.style-header-index {
        text-align: center;
        background: #1c2f7f;
        border-radius: 10px;
        color: white;
        padding: 10px;
    }
/* Overlay che màn hình */
.popup-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6); /* Làm mờ nền */
    display: flex;
    justify-content: center; /* Căn giữa ngang */
    align-items: center;    /* Căn giữa dọc */
    z-index: 1000;
    display: none; /* Mặc định ẩn */
}

/* Nội dung popup */
.popup-content {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    left: 30%;
    top: 40%;
    position: relative;
    background: #fff;
    width: 800px;
    max-width: 90%;
    padding: 10px 20px;
    border-radius: 12px;
    box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.3);
    text-align: center;
    animation: popupFadeIn 0.5s ease; /* Hiệu ứng mờ dần */
}

/* Tiêu đề và mô tả */
.popup-content h2 {
    font-size: 24px;
    color: #333;
    margin-bottom: 10px;
    font-weight: bold;
}

.popup-content p {
    font-size: 16px;
    color: #555;
    margin-bottom: 20px;
}

/* Input email */
.popup-content input[type="email"] {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-sizing: border-box;
    outline: none;
    transition: all 0.3s ease;
}

.popup-content input[type="email"]:focus {
    border-color: #007bff;
    box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.5);
}

/* Nút đăng ký */
.subscribe-button {
    width: 100%;
    padding: 10px 15px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.subscribe-button:hover {
    background-color: #0056b3;
    color: white;
}

/* Nút đóng */
.close-button {
    position: absolute;
    top: 10px;
    right: 10px;
    background: none;
    border: none;
    font-size: 24px;
    color: #999;
    cursor: pointer;
    transition: color 0.3s ease;
}

.close-button:hover {
    color: #333;
}

/* Hiệu ứng xuất hiện */
@keyframes popupFadeIn {
    from {
        opacity: 0;
        transform: scale(0.9);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}
#toast {
    opacity: 0;
    transition: opacity 0.5s ease-in-out;
    visibility: hidden;
}

#toast.show {
    visibility: visible;
    opacity: 1;
}
.newletter-image img{
    width: 500px;
    height: 300px;
}
.newletter-content{
    padding: 10px  ;
}
</style>
<script>

document.addEventListener('DOMContentLoaded', function () {
    function showToast(email) {
        var toast = document.getElementById('toast');
        var toastEmail = document.getElementById('toast-email');

        toastEmail.innerText = email;

        toast.classList.add('show');

        setTimeout(function() {
            toast.classList.remove('show');
        }, 3000);
    }
    setTimeout(() => {
        const newsletterPopup = document.getElementById('newsletter-popup');
        if (newsletterPopup) {
            newsletterPopup.style.display = 'block';
        }
    }, 3000);

    const closePopupButton = document.getElementById('close-popup');
    if (closePopupButton) {
        closePopupButton.addEventListener('click', function () {
            const newsletterPopup = document.getElementById('newsletter-popup');
            if (newsletterPopup) {
                newsletterPopup.style.display = 'none';
            }
        });
    }

    // Xử lý gửi form
    const newsletterForm = document.getElementById('newsletter-form');
    if (newsletterForm) {
        $('#newsletter-form').submit(function (e) {
    e.preventDefault();

    const email = $('input[name="email"]').val(); // Lấy giá trị email

    $.ajax({
        url: '/newsletter', // URL gửi đến
        method: 'POST',
        data: {
            _token: $('meta[name="csrf-token"]').attr('content'),
            email: email
        },
        success: function (data) {
            console.log(data);
            if (data.success) {
                showToast(email);
                $('#newsletter-popup').hide();
            } else {
                showToast('Có lỗi xảy ra. Vui lòng thử lại!');
            }
        },
        error: function (error) {
            console.error('Lỗi:', error);
            showToast('Có lỗi xảy ra. Vui lòng thử lại!');
        }
    });
});

    }
});

</script>
{{-- newletter --}}
<div id="toast" style="display: none; position: fixed; top: 20px; right: 20px; background-color: #28a745; color: white; padding: 10px 20px; border-radius: 5px; font-size: 16px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); z-index: 1000;">
    Cảm ơn bạn đã đăng ký với email: <span id="toast-email"></span>
</div>
<div id="newsletter-popup" class="popup-overlay">
    <div class="popup-content">
        <div class="newletter-image">
            <img src="{{ asset("asset/client/images/newletter.jpg") }}"/>
        </div>
        <div class="newletter-content">
            <button id="close-popup" class="close-button">&times;</button>
            <h2>Đăng ký nhận bản tin</h2>
            <p>Nhận thông tin khuyến mãi và tin tức mới nhất từ chúng tôi!</p>
            <form id="newsletter-form">
                @csrf
                <input type="email" name="email" placeholder="Nhập email của bạn" required>
                <button type="submit" class="subscribe-button">Đăng ký</button>
            </form>
        </div>

    </div>
</div>

<div class="container" style="margin-top: 25px;">
    <div class="row">
        <div id="sequence">
            {{-- <div class="sequence-prev"><i class="fa fa-angle-left"></i></div>
            <div class="sequence-next"><i class="fa fa-angle-right"></i></div> --}}
            <ul class="sequence-canvas">
                @foreach($banners as $banner)
                <li class="animate-in" style="background-image: url('{{ asset("asset/client/images/banners/$banner->image") }}');">
                </li>
                @endforeach
            </ul>
        </div>
    </div>
</div>
<div class="container_fullwidth">
    <div class="container">
        {{-- <div class="hot-products">
            <h3 class="title style-header-index">Sản Phẩm Bán Chạy</h3>
            <div class="control"></div>
            <ul>
                <li>
                <div class="row">
                    @foreach ($bellingProducts as $bellingProduct)
                    <div class="col-md-3 col-sm-6">
                        <div class="products">
                            <div class="offer">Bán Chạy</div>
                            <div class="thumbnail">
                                <a href="{{ route('user.products_detail', $bellingProduct->id) }}"><img src="{{ asset("asset/client/images/products/small/$bellingProduct->img") }}" alt="Product Name"></a>
                            </div>
                            <div class="productname" style="height: 42px;">{{ $bellingProduct->name }}</div>
                            <h4 class="price">{{ format_number_to_money($bellingProduct->price_sell) }} VNĐ</h4>
                            <div class="productname" style="padding-bottom: 10px; padding-top: unset;">
                                <x-avg-stars :number="$bellingProduct->avg_rating" />
                                <span style="font-size: 14px;">Đã bán: {{ $bellingProduct->sum }}</span>
                            </div>
                            <div class="button_group"><a href="{{ route('user.products_detail', $bellingProduct->id) }}" class="button add-cart" type="button">Xem Chi Tiết</a></div>
                        </div>
                    </div>
                    @endforeach
                </div>
                </li>
            </ul>
        </div> --}}
        <div class="clearfix"></div>
        <div class="featured-products">
            <h3 class="title style-header-index">Sản Phẩm Mới Nhất</h3>
            <div class="control"></div>
            <ul>
                <li>
                <div class="row">
                    @foreach ($newProducts as $newProduct)
                        <div class="col-md-3 col-sm-6">
                            <div class="products">
                                <div class="offer">Mới Nhất</div>
                                <div class="thumbnail"><a href="{{ route('user.products_detail', $newProduct->id) }}"><img src="{{ asset("asset/client/images/products/small/$newProduct->img") }}" alt="Product Name"></a></div>
                                <div class="productname" style="height: 45px;">{{ $newProduct->name }}</div>
                                <h4 class="price">{{ format_number_to_money($newProduct->price_sell) }} VNĐ</h4>
                                <div class="productname" style="padding-bottom: 10px; padding-top: unset;">
                                    <x-avg-stars :number="$newProduct->avg_rating" />
                                    <span style="font-size: 14px;">Đã bán: {{ $newProduct->sum }}</span>
                                </div>
                                <div class="button_group"><a href="{{ route('user.products_detail', $newProduct->id) }}" class="button add-cart" type="button">Xem Chi Tiết</a></div>
                            </div>
                        </div>
                    @endforeach
                </div>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="clearfix"></div>
<div class="hom-slider">
    <div class="container">

    </div>


    {{-- <li>
    <div class="flat-caption caption2 formLeft delay400 text-center">
        <h1>FLAT SHOP</h1>
    </div>
    <div class="flat-caption caption3 formLeft delay500 text-center">
        <p>Chào mừng đến với shop thời trang của chúng tôi - nơi cung cấp các sản phẩm đa dạng và chất lượng cao. Đến với chúng tôi để tìm kiếm phong cách của bạn!</p>
        <p>Phong cách của bạn là niềm đam mê của chúng tôi - Hãy để chúng tôi giúp bạn thể hiện nó</p>
    </div>
    <div class="flat-image formBottom delay200" data-bottom="true"><img src="{{ asset('asset/client/images/slider-image-03.png') }}" alt=""></div> --}}
    {{-- <div class="promotion-banner">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="promo-box"><img src="{{ asset('asset/client/images/promotion-01.png') }}" alt=""></div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="promo-box"><img src="{{ asset('asset/client/images/promotion-02.png') }}" alt=""></div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="promo-box"><img src="{{ asset('asset/client/images/promotion-03.png') }}" alt=""></div>
                </div>
            </div>
        </div>
    </div> --}}
</div>
<div class="container" style="margin-top: 25px;">
    <div class="row">
        <img src="{{ asset("asset/client/images/banner-new.jpg") }}">
    </div>
</div>

<div class="container_fullwidth">
    <div class="container">
        <div class="clearfix"></div>
        <div class="news-container">
            @foreach ($news as $item)
                <div class="news-item">
                    <h2>{{ $item->title }}</h2>
                    <p>{{ $item->description }}</p>
                </div>
            @endforeach
        </div>

    </div>
</div>


<div class="clearfix"></div>
<div class="container_fullwidth" style="margin: 0; padding: 5px 0">
    <div class="container">
        <div class="hot-products">
            <h3 class="title style-header-index">Sản Phẩm Bán Chạy</h3>
            <div class="control"></div>
            <ul>
                <li>
                <div class="row">
                    @foreach ($bellingProducts as $bellingProduct)
                    <div class="col-md-3 col-sm-6">
                        <div class="products">
                            <div class="offer">Bán Chạy</div>
                            <div class="thumbnail">
                                <a href="{{ route('user.products_detail', $bellingProduct->id) }}"><img src="{{ asset("asset/client/images/products/small/$bellingProduct->img") }}" alt="Product Name"></a>
                            </div>
                            <div class="productname" style="height: 45px;">{{ $bellingProduct->name }}</div>
                            <h4 class="price">{{ format_number_to_money($bellingProduct->price_sell) }} VNĐ</h4>
                            <div class="productname" style="padding-bottom: 10px; padding-top: unset;">
                                <x-avg-stars :number="$bellingProduct->avg_rating" />
                                <span style="font-size: 14px;">Đã bán: {{ $bellingProduct->sum }}</span>
                            </div>
                            <div class="button_group"><a href="{{ route('user.products_detail', $bellingProduct->id) }}" class="button add-cart" type="button">Xem Chi Tiết</a></div>
                        </div>
                    </div>
                    @endforeach
                </div>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="container" style="padding: 5px 0">
    <div class="row">
        <img src="{{ asset("asset/client/images/20180608085816-xedapthethao.jpg") }}">
    </div>
</div>
@endsection
