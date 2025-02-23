@extends('frontend.layout.master')

@push('titles')
    EcoBazaar - Bootstrap eCommerce Template
@endpush

@push('seo')
    <meta name="app-url" content=""/>
    <meta name="robots" content="index, follow"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>

    <!-- Open Graph data -->
    <meta property="og:title" content=""/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content=""/>
    <meta property="og:image" content="{{ asset($basic_info->light_logo) }}"/>
    <meta property="og:description" content=""/>

@endpush


@push('add-css')

    <style>

        /* Only for ( Banner section ) */
        .banner-page {
            /*background-color: #EDF2EE;*/
            {{--background: url("{{asset('public/backend/assets/images/uploads/banners/1725709289.webp')}}") no-repeat center center;--}}
            background-size: cover;
        }

        .banner-details span {
            color: var(--theme-green);
        }

        .banner-details h1 {
            color: var(--theme-black);
        }

        .banner-details h5 {
            color: var(--theme-black);
        }

        .banner-details h5 span {
            color: var(--theme-orange);
        }

        .banner-details p {
            color: var(--theme-paragraph-1);
        }

        .btn-color-change {
            background-color: var(--theme-green);
            color: var(--theme-white);
            border: 1px solid var(--theme-green);
        }

        .btn-color-change:hover {
            background-color: var(--theme-white);
            color: var(--theme-green);
            border: 1px solid var(--theme-green);
        }

        #bannerSlider button.owl-prev {
            background: var(--theme-white);
            color: var(--theme-green);
            border: 2px solid var(--theme-green);
        }

        #bannerSlider button.owl-next {
            background: var(--theme-white);
            color: var(--theme-green);
            border: 2px solid var(--theme-green);
        }

        #bannerSlider button.owl-next:hover,
        #bannerSlider button.owl-prev:hover {
            background: var(--theme-green);
            color: var(--theme-white);
            border: 2px solid var(--theme-green);
        }
    </style>

@endpush

@section('body-content')
    

    <!-- Start Banner Section -->
    <section class="banner-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 offset-lg-3">
                    <div class="owl-carousel owl-theme" id="bannerSlider">
                        @foreach($sliders as $slider)
                            <div class="banner-page" style="background-image: url('{{ asset($slider->slider_img) }}');">


                            </div>
                        @endforeach

                    </div><!-- End. bannerSlider -->
                </div><!-- End. col-lg-9 -->
            </div><!-- End. row -->
        </div><!-- End. container -->
    </section><!-- End. banner-section -->


 


    <!-- Start Category Section -->
    <section class="category-section">
        <div class="container">
            <div class="row">
                <div class="header-titles">
                    <h1>Popular Categories</h1>
                    <a href="{{route('product.all')}}" class="link_btn">View All <i
                                class="fa-solid fa-arrow-right ms-2"></i></a>
                </div>

                <div class="category-container">
                    @forelse($popular_categories as $popular_category)
                        <a href="{{route('product.by.category', $popular_category->slug)}}" class="category-details">
                            <img src="{{ asset($popular_category->category_img_path) }}" alt="">
                            <h2>{{$popular_category->category_name}}</h2>
                        </a>
                        <!-- End. category-container -->

                    @empty
                        <span class="text-center">No Categories found</span>
                    @endforelse

                </div><!-- End. category-container -->


                <!-- For responsive category-responsive -->
                <div class="owl-carousel owl-theme" id="categorySlider">

                    @forelse($popular_categories as $popular_category)
                        <a href="#" class="category-details">
                            <img src="{{ asset($popular_category->category_img_path) }}" alt="">
                            <h2>{{$popular_category->category_name}}</h2>
                        </a>
                    @empty
                    @endforelse

                </div><!-- End. categorySlider -->
            </div><!-- End. row -->
        </div><!-- End. container -->
    </section><!-- End. category-section -->

    
    <!-- Start Popular Products Section -->
    <section class="popular-products-section">
        <div class="container">
            <div class="row">
                <div class="header-titles">
                    <h1>Popular Products</h1>
                    <a href="{{route('product.all')}}" class="link_btn">View All <i
                                class="fa-solid fa-arrow-right ms-2"></i></a>
                </div><!-- End. header-titles -->

                <div class="products-container">
                    @forelse($popular_products as $popular_product)
                        <div class="products-description">
                            <div class="product-image">
                                <a href="{{url('/product-details/'.$popular_product->slug)}}"> <img
                                            src="{{ asset($popular_product->productDetail->productThumbnail_img) }}"
                                            alt=""></a>
                                @if(count($popular_product->colors)>0)
                                    <span class="badges sale_badge product-badges">Sale {{$popular_product->colors[0]->discount_percentage}}%</span>
                                @elseif(count($popular_product->weights)>0)
                                    <span class="badges sale_badge product-badges">Sale {{$popular_product->weights[0]->discount_percentage}}%</span>
                                @else
                                    <span class="badges sale_badge product-badges">Sale {{$popular_product->sizes[0]->discount_percentage}}%</span>

                                @endif

{{--                                <ul class="product-icons-show">--}}
{{--                                    <li>--}}
{{--                                        <a href="#">--}}
{{--                                            <i class="ri-heart-line"></i>--}}
{{--                                        </a>--}}
{{--                                    </li>--}}
{{--                                    <li>--}}
{{--                                        <a href="#">--}}
{{--                                            <i class="ri-eye-line"></i>--}}
{{--                                        </a>--}}
{{--                                    </li>--}}
{{--                                </ul>--}}
                                <!-- End. product-icons-show -->
                            </div><!-- End. product-image -->

                            <div class="product-info">
                                <div class="product-bio">
                                    <a href="{{url('/product-details/'.$popular_product->slug)}}"
                                       class="product-title">{{ $popular_product->product_name }}</a>
                                    @if(count($popular_product->colors)>0)
                                        <p>{{$basic_info->currency_symbol}}{{$popular_product->colors[0]->productSalePrice}}
                                            <del>
                                                <span class="discount-price">{{$basic_info->currency_symbol}}{{$popular_product->colors[0]->productRegularPrice}}</span>
                                            </del>
                                        </p>

                                    @elseif(count($popular_product->weights)>0)
                                        <p>{{$basic_info->currency_symbol}}{{$popular_product->weights[0]->productSalePrice}}
                                            <del>
                                                <span class="discount-price">{{$basic_info->currency_symbol}}{{$popular_product->weights[0]->productRegularPrice}}</span>
                                            </del>
                                        </p>
                                    @else
                                        <p>{{$basic_info->currency_symbol}}{{$popular_product->sizes[0]->productSalePrice}}
                                            <del>
                                                <span class="discount-price">{{$basic_info->currency_symbol}}{{$popular_product->sizes[0]->productRegularPrice}}</span>
                                            </del>
                                        </p>
                                    @endif
                                    <div class="product-review">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- End. client-review -->
                                </div><!-- End. product-image -->

                                <a href="#">
                                    <i class='bx bx-shopping-bag'></i>
                                </a>
                            </div><!-- End. product-info -->
                        </div>

                    @empty
                    @endforelse

                </div><!-- End. products-container -->

                <!-- For responsive Popular product-responsive -->
                <div class="owl-carousel owl-theme" id="popularSlider">


                    @forelse($popular_products as $popular_product)
                        <div class="products-description">
                            <div class="product-image">
                                <a href="{{url('/product-details/'.$popular_product->slug)}}"> <img
                                            src="{{ asset($popular_product->productDetail->productThumbnail_img) }}"
                                            alt=""></a>
                                @if(count($popular_product->colors)>0)
                                    <span class="badges sale_badge product-badges">Sale {{$popular_product->colors[0]->discount_percentage}}%</span>
                                @elseif(count($popular_product->weights)>0)
                                    <span class="badges sale_badge product-badges">Sale {{$popular_product->weights[0]->discount_percentage}}%</span>
                                @else
                                    <span class="badges sale_badge product-badges">Sale {{$popular_product->sizes[0]->discount_percentage}}%</span>

                                @endif

{{--                                <ul class="product-icons-show">--}}
{{--                                    <li>--}}
{{--                                        <a href="#">--}}
{{--                                            <i class="ri-heart-line"></i>--}}
{{--                                        </a>--}}
{{--                                    </li>--}}
{{--                                    <li>--}}
{{--                                        <a href="#">--}}
{{--                                            <i class="ri-eye-line"></i>--}}
{{--                                        </a>--}}
{{--                                    </li>--}}
{{--                                </ul><!-- End. product-icons-show -->--}}
                            </div><!-- End. product-image -->

                            <div class="product-info">
                                <div class="product-bio">
                                    <a href="{{url('/product-details/'.$popular_product->slug)}}"
                                       class="product-title">{{ $popular_product->product_name }}</a>
                                    @if(count($popular_product->colors)>0)
                                        
                                        <p>{{$basic_info->currency}}{{$popular_product->colors[0]->productSalePrice}}
                                            <del>
                                                <span class="discount-price">{{$basic_info->currency}}{{$popular_product->colors[0]->productRegularPrice}}</span>
                                            </del>
                                        </p>

                                     @elseif(count($popular_product->sizes)>0)
                                        
                                         <p>{{$basic_info->currency}}{{$popular_product->sizes[0]->productSalePrice}}
                                              <del>
                                                    <span class="discount-price">{{$basic_info->currency}}{{$popular_product->sizes[0]->productRegularPrice}}</span>
                                              </del>
                                         </p>
                                        
                                    @else
                                        
                                        <p>{{$basic_info->currency}}{{$popular_product->weights[0]->productSalePrice}}
                                            <del>
                                                <span class="discount-price">{{$basic_info->currency}}{{$popular_product->weights[0]->productRegularPrice}}</span>
                                            </del>
                                        </p>  
                                        
                                    @endif
                                    <div class="product-review">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- End. client-review -->
                                </div><!-- End. product-image -->

                                <a href="#">
                                    <i class='bx bx-shopping-bag'></i>
                                </a>
                            </div><!-- End. product-info -->
                        </div>

                    @empty
                    @endforelse
                </div>

            </div><!-- End. row -->
        </div><!-- End. container -->
    </section>
    <!-- End. popular-product-section -->

    
    
    
    <!-- Start Campaign Banner Section -->

    <section class="campaign-banner-section">
        <div class="container">
            <div class="campaign-banner-container"
                 style="background-image: url('{{ asset('public/frontend/assets/images/campaign_image/discount_bannar.png') }}');">
                <div class="row">
                    <div class="col-lg-5 offset-lg-7">
                        <div class="campaign-banner-details">
                            <h5>{{$largeBanner->banner_title_1}}</h5>
                            <h1>{{$largeBanner->banner_title_2}}</h1>
                            <p>{{$largeBanner->banner_title_3}}</p>
                            <div class="btn-customize">
                                <a href="{{$largeBanner->banner_btn_link}}"
                                   class="btns shop_btn">{{$largeBanner->banner_btn_name}} <i
                                            class="fa-solid fa-arrow-right ms-2"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- End. row -->
        </div><!-- End. container -->
    </section>
    
    <!-- End. campaign-section -->


    <!-- Start Featured Products Section -->
    @if(count($featured_products)>0)
        <section class="featured-products-section">
            <div class="container">
                <div class="row">
                    <div class="header-titles">
                        <h1>Featured Products</h1>
                        <a href="{{route('product.all')}}" class="link_btn">View All <i
                                    class="fa-solid fa-arrow-right ms-2"></i></a>
                    </div><!-- End. header-titles -->

                    <div class="products-container">


                        @forelse($featured_products as $popular_product)
                            <div class="products-description">
                                <div class="product-image">
                                    <a href="{{url('/product-details/'.$popular_product->slug)}}"> <img
                                                src="{{ asset($popular_product->productDetail->productThumbnail_img) }}"
                                                alt=""></a>
                                    @if(count($popular_product->colors)>0)
                                        <span class="badges sale_badge product-badges">Sale {{$popular_product->colors[0]->discount_percentage}}%</span>
                                    @elseif(count($popular_product->weights)>0)
                                        <span class="badges sale_badge product-badges">Sale {{$popular_product->weights[0]->discount_percentage}}%</span>
                                    @else
                                        <span class="badges sale_badge product-badges">Sale {{$popular_product->sizes[0]->discount_percentage}}%</span>

                                    @endif

{{--                                    <ul class="product-icons-show">--}}
{{--                                        <li>--}}
{{--                                            <a href="#">--}}
{{--                                                <i class="ri-heart-line"></i>--}}
{{--                                            </a>--}}
{{--                                        </li>--}}
{{--                                        <li>--}}
{{--                                            <a href="#">--}}
{{--                                                <i class="ri-eye-line"></i>--}}
{{--                                            </a>--}}
{{--                                        </li>--}}
{{--                                    </ul><!-- End. product-icons-show -->--}}
                                </div><!-- End. product-image -->

                                <div class="product-info">
                                    <div class="product-bio">
                                        <a href="{{url('/product-details/'.$popular_product->slug)}}"
                                           class="product-title">{{ $popular_product->product_name }}</a>
                                        @if(count($popular_product->colors)>0)
                                            <p>{{$basic_info->currency_symbol}}{{$popular_product->colors[0]->productSalePrice}}
                                                <del>
                                                    <span class="discount-price">{{$basic_info->currency_symbol}}{{$popular_product->colors[0]->productRegularPrice}}</span>
                                                </del>
                                            </p>

                                        @elseif(count($popular_product->weights)>0)
                                            <p>{{$basic_info->currency_symbol}}{{$popular_product->weights[0]->productSalePrice}}
                                                <del>
                                                    <span class="discount-price">{{$basic_info->currency_symbol}}{{$popular_product->weights[0]->productRegularPrice}}</span>
                                                </del>
                                            </p>
                                        @else
                                            <p>{{$basic_info->currency_symbol}}{{$popular_product->sizes[0]->productSalePrice}}
                                                <del>
                                                    <span class="discount-price">{{$basic_info->currency_symbol}}{{$popular_product->sizes[0]->productRegularPrice}}</span>
                                                </del>
                                            </p>
                                        @endif
                                        <div class="product-review">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div><!-- End. client-review -->
                                    </div><!-- End. product-image -->

                                    <a href="#">
                                        <i class='bx bx-shopping-bag'></i>
                                    </a>
                                </div><!-- End. product-info -->
                            </div>

                        @empty
                        @endforelse


                    </div><!-- End. products-container -->

                    <!-- For responsive product-responsive -->
                    <div class="owl-carousel owl-theme" id="featuredSlider">


                        @forelse($featured_products as $popular_product)
                            <div class="products-description">
                                <div class="product-image">
                                    <a href="{{url('/product-details/'.$popular_product->slug)}}"> <img
                                                src="{{ asset($popular_product->productDetail->productThumbnail_img) }}"
                                                alt=""></a>
                                    @if(count($popular_product->colors)>0)
                                        <span class="badges sale_badge product-badges">Sale {{$popular_product->colors[0]->discount_percentage}}%</span>
                                    @elseif(count($popular_product->weights)>0)
                                        <span class="badges sale_badge product-badges">Sale {{$popular_product->weights[0]->discount_percentage}}%</span>
                                    @else
                                        <span class="badges sale_badge product-badges">Sale {{$popular_product->sizes[0]->discount_percentage}}%</span>

                                    @endif

{{--                                    <ul class="product-icons-show">--}}
{{--                                        <li>--}}
{{--                                            <a href="#">--}}
{{--                                                <i class="ri-heart-line"></i>--}}
{{--                                            </a>--}}
{{--                                        </li>--}}
{{--                                        <li>--}}
{{--                                            <a href="#">--}}
{{--                                                <i class="ri-eye-line"></i>--}}
{{--                                            </a>--}}
{{--                                        </li>--}}
{{--                                    </ul><!-- End. product-icons-show -->--}}
                                </div><!-- End. product-image -->

                                <div class="product-info">
                                    <div class="product-bio">
                                        <a href="{{url('/product-details/'.$popular_product->slug)}}"
                                           class="product-title">{{ $popular_product->product_name }}</a>
                                        @if(count($popular_product->colors)>0)
                                            <p>{{$basic_info->currency_symbol}}{{$popular_product->colors[0]->productSalePrice}}
                                                <del>
                                                    <span class="discount-price">{{$basic_info->currency_symbol}}{{$popular_product->colors[0]->productRegularPrice}}</span>
                                                </del>
                                            </p>

                                        @elseif(count($popular_product->weights)>0)
                                            <p>{{$basic_info->currency_symbol}}{{$popular_product->weights[0]->productSalePrice}}
                                                <del>
                                                    <span class="discount-price">{{$basic_info->currency_symbol}}{{$popular_product->weights[0]->productRegularPrice}}</span>
                                                </del>
                                            </p>
                                        @else
                                            <p>{{$basic_info->currency_symbol}}{{$popular_product->sizes[0]->productSalePrice}}
                                                <del>
                                                    <span class="discount-price">{{$basic_info->currency_symbol}}{{$popular_product->sizes[0]->productRegularPrice}}</span>
                                                </del>
                                            </p>
                                        @endif
                                        <div class="product-review">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div><!-- End. client-review -->
                                    </div><!-- End. product-image -->

                                    <a href="#">
                                        <i class='bx bx-shopping-bag'></i>
                                    </a>
                                </div><!-- End. product-info -->
                            </div>

                        @empty
                        @endforelse
                    </div>

                </div>
            </div>
        </section>

    @endif
    <!-- End. featured-product-section -->
    
    
    <!-- Start Subscription Section -->
    <section class="subscription-section">
        <div class="container">
            <div class="subscription-container">
                <div class="subscription-details">
                    <h2>Subcribe our Newsletter</h2>
                    <p>Pellentesque eu nibh eget mauris congue mattis mattis nec tellus. Phasellus imperdiet elit eu
                        magna.</p>
                </div><!-- End. subscription-details -->


{{--                <div class="subscription">--}}
{{--                    <form action="">--}}
{{--                        <input type="text" class="subscription-form" placeholder="Your email address">--}}
{{--                        <button class="btns default_btn btn_position">Subscriptions</button>--}}
{{--                    </form>--}}
{{--                </div><!-- End. subscription -->--}}
            </div><!-- End. row -->
        </div><!-- End. container -->
    </section>
    <!-- End. subscription-section -->
    
    <!-- Subscription include -->
    @include('frontend.include.subscription')

@endsection


@push('add-scripts')

    <script>
        // Testimonial section 
        $('#testimonial').owlCarousel({
            loop: true,
            margin: 30,
            nav: true,
            dots: true,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: true,
            navText: ['<i class="fa-solid fa-arrow-left"></i>', '<i class="fa-solid fa-arrow-right"></i>'],
            responsive: {
                0: {
                    nav: true,
                    items: 1
                },
                780: {
                    nav: true,
                    items: 2
                },
                1000: {
                    nav: true,
                    items: 3
                },
            }
        })


        // Category section 
        $('#categorySlider').owlCarousel({
            loop: true,
            margin: 30,
            nav: true,
            dots: true,
            autoplay: true,
            autoplayTimeout: 2500,
            autoplayHoverPause: true,
            navText: ['<i class="fa-solid fa-arrow-left"></i>', '<i class="fa-solid fa-arrow-right"></i>'],
            responsive: {
                0: {
                    nav: true,
                    dots: false,
                    items: 2
                },
                600: {
                    nav: true,
                    dots: false,
                    items: 3
                },
                768: {
                    nav: true,
                    dots: false,
                    items: 4
                },
                992: {
                    nav: false,
                    dots: false,
                    items: 6
                },
            }
        })


        // Popular Products section 
        $('#popularSlider').owlCarousel({
            loop: true,
            margin: 10,
            nav: true,
            dots: true,
            autoplay: true,
            autoplayTimeout: 2500,
            autoplayHoverPause: true,
            navText: ['<i class="fa-solid fa-arrow-left"></i>', '<i class="fa-solid fa-arrow-right"></i>'],
            responsive: {
                0: {
                    nav: true,
                    dots: false,
                    items: 1
                },
                360: {
                    nav: true,
                    dots: false,
                    items: 2
                },
                600: {
                    nav: true,
                    dots: false,
                    items: 3
                },
                768: {
                    nav: true,
                    dots: false,
                    items: 4
                },
                992: {
                    nav: false,
                    dots: false,
                    items: 6
                },
            }
        })


        // Featured Products section 
        $('#featuredSlider').owlCarousel({
            loop: true,
            margin: 10,
            nav: true,
            dots: true,
            autoplay: true,
            autoplayTimeout: 2500,
            autoplayHoverPause: true,
            navText: ['<i class="fa-solid fa-arrow-left"></i>', '<i class="fa-solid fa-arrow-right"></i>'],
            responsive: {
                0: {
                    nav: true,
                    dots: false,
                    items: 1
                },
                360: {
                    nav: true,
                    dots: false,
                    items: 2
                },
                600: {
                    nav: true,
                    dots: false,
                    items: 3
                },
                768: {
                    nav: true,
                    dots: false,
                    items: 4
                },
                992: {
                    nav: false,
                    dots: false,
                    items: 6
                },
            }
        })


        // Business Logo section 
        $('#businessLogo').owlCarousel({
            loop: true,
            margin: 10,
            nav: true,
            dots: true,
            autoplay: true,
            autoplayTimeout: 2500,
            autoplayHoverPause: true,
            navText: ['<i class="fa-solid fa-arrow-left"></i>', '<i class="fa-solid fa-arrow-right"></i>'],
            responsive: {
                0: {
                    nav: false,
                    dots: false,
                    items: 2
                },
                500: {
                    nav: false,
                    dots: false,
                    items: 3
                },
                768: {
                    nav: false,
                    dots: false,
                    items: 4
                },
                992: {
                    nav: false,
                    dots: false,
                    items: 6
                },
            }
        })


        // Business Logo section 
        $('#bannerSlider').owlCarousel({
            loop: true,
            margin: 10,
            nav: true,
            dots: true,
            autoplay: true,
            autoplayTimeout: 2500,
            autoplayHoverPause: true,
             navText: ['<i class="fa-solid fa-arrow-left"></i>', '<i class="fa-solid fa-arrow-right"></i>'],
            responsive: {
                0: {
                    nav: false,
                    dots: true,
                    items: 1
                },
                577: {
                    nav: true,
                    dots: false,
                    items: 1
                },
                768: {
                    nav: true,
                    dots: false,
                    items: 1
                },
                992: {
                    nav: false,
                    dots: true,
                    items: 1
                },
            }
        })

    </script>

@endpush