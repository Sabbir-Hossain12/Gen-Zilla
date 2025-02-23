@php
    use Gloudemans\Shoppingcart\Facades\Cart;$active_cat = Illuminate\Support\Facades\Request::segment(1);
//    print_r($active_cat);
@endphp

        <!-- Start header Section -->
<header>
    <!-- Start header-topBar -->
{{--    <div style="border-bottom: 1px solid var(--theme-secondary-1); padding: 10px 0;">--}}
{{--        <div class="container">--}}
{{--            <div class="header-topBar">--}}
{{--                <div class="address">--}}
{{--                    <i class='bx bx-map'></i>--}}
{{--                    <p> {{$basic_info->store_location}}</p>--}}
{{--                </div>--}}

{{--                <div class="localization">--}}
{{--                    <div class="language me-2">--}}
{{--                        <i class='bx bx-chevron-down'></i>--}}
{{--                        <select name="" class="select-form" id="">--}}
{{--                            <option value="eng">Eng</option>--}}
{{--                            <option value="ban">Ban</option>--}}
{{--                            <option value="spa">Spa</option>--}}
{{--                        </select>--}}
{{--                    </div>--}}

{{--                    <div class="currency">--}}
{{--                        <i class='bx bx-chevron-down'></i>--}}
{{--                        <select name="" class="select-form" id="">--}}
{{--                            <option value="USD">USD</option>--}}
{{--                            <option value="TAKA">TAKA</option>--}}
{{--                            <option value="PESO">PESO</option>--}}
{{--                        </select>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}
{{--        </div>--}}
{{--    </div>--}}

    <!-- Start logo-searchBar-section -->
    <div class="logo-searchBar-section">
        <div class="container">
            <div class="row">
                <div class="row align-items-center">
                    <div class="col-lg-4">
                        <div class="logo">
                            <a href="{{url('/')}}">
                                <img src="{{ asset($basic_info->black_logo) }}" style="height: 50px !important;" alt="">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="searchBar-form">
                            <form name="form" id="searchBar-form" method="post" action="{{route('search.product')}}">
                                @csrf
                            <input type="text" name="search" class="form_controls"
                                   style="height: 45px; padding-left: 42px;" placeholder="Search" id="">
                            <i class='bx bx-search'></i>
                            <button class="search-form">Search</button>
                            </form>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="customer-service">
                            <i class='bx bx-phone-call'></i>
                            <div class="support-system">
                                <h5>Customer Services</h5>
                                <p>{{ $basic_info->phone_1}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Start main-nav -->
    <nav class="main-nav">
        <div class="container">
            <div class="row">
                <div class="categories-menu">
                    <i class='bx bx-menu'></i>

                    <div class="category-dropdown">
                        <h4>All Categories </h4>
                        <i class='bx bx-chevron-down'></i>
                    </div><!-- End. category-dropdown -->

                    <div class="all-categories-show {{ $active_cat == '' ? '' : 'category_active' }}">
                        <ul>
                            @foreach($frontCategories as $frontCategory)
                                <li>
                                    <a href="{{route('product.by.category', $frontCategory->slug)}}">
                                        <img class="rounded" src="{{ asset($frontCategory->category_img_path) }}"
                                             alt="">
                                        <span>{{ $frontCategory->category_name }}</span>
                                    </a>
                                </li>
                            @endforeach

                            <li>
                                <a href="">
                                    <i class='bx bx-plus'></i>
                                    <span>View All Category</span>
                                </a>
                            </li>

                        </ul>
                    </div><!-- End. all-categories-show -->
                </div><!-- End. categories-menu -->

                <div class="menu-container">
                    <div class="menu-list">
                        <ul>
                            <li>
                                <a href="{{url('/')}}">Home</a>
                            </li>
                            <li>
                                <div class="menu-dropdown">
                                    <a href="javascript:0;">Shop</a>

                                    <div class="catSub-show">
                                        <ul class="category_menu">
                                            @foreach($navCategories as $navCategory)
                                                <li>
                                                    <div class="subCategory_menu">
                                                        <span>{{$navCategory->category_name}}</span>

                                                        <ul class="">
                                                            @foreach($navCategory->subCategories as $subCategory)
                                                                <li>
                                                                    <a href="{{route('product.by.subcategory', $subCategory->slug)}}">{{$subCategory->subcategory_name}}</a>
                                                                </li>

                                                            @endforeach
                                                        </ul>
                                                    </div>
                                                </li>

                                            @endforeach
                                        </ul>

                                        <a href="#" class="all-category-views">View All Shop <i
                                                    class="fa-solid fa-arrow-right ms-2"></i>
                                        </a>
                                    </div>
                                </div>
                            </li>
{{--                            <li>--}}
{{--                                <a href="">Blog</a>--}}
{{--                            </li>--}}
                            <li>
                                <a href="{{route('about')}}">About Us</a>
                            </li>
                            <li>
                                <a href="{{route('contact')}}">Contact Us</a>
                            </li>
                            @auth()
                                <li>
                                    <a href="{{route('user.dashboard')}}">Dashboard</a>
                                </li>
                            @endauth

                        </ul>
                    </div><!-- End. menu-list -->

                    <div class="menu-right">
                        <ul>
                            <li>
                                <a href="{{route('wishlist.index')}}" class="item-count">
                                    <i class='bx bx-heart'></i>
                                    <span>0</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;" class="item-count" id="shopping-cart">
                                    <i class='bx bx-shopping-bag'></i>
                                    <span class="cart-count">0</span>
                                </a>
                            </li>
                            @guest()
                                <li class="accounts-menu">
                                    <a href="javascript:;">
                                        <i class='bx bx-user'></i>
                                    </a>

                                    <div class="accounts-menu-list">
                                        <ul>
                                            <li>
                                                <a href="{{route('login')}}">Login</a>
                                            </li>
                                            <li>
                                                <a href="{{route('register')}}">Register</a>
                                            </li>
                                        </ul>
                                    </div><!-- End. accounts-menu-list -->
                                </li>
                            @endguest

                            {{-- Authenticated User   --}}
                            @auth()
                                <li class="accounts-menu">
                                    <a href="javascript:;">
                                        <i class='bx bxs-user'></i>
                                    </a>

                                    <div class="accounts-menu-list">
                                        <ul>
                                            <li>
                                                <a href="{{route('user.dashboard')}}">Dashboard</a>
                                            </li>
                                            <li>
                                                <form method="POST" action="{{ route('logout') }}">
                                                    @csrf
                                                    <button type="submit" class="btn">Logout</button>
                                                </form>
                                            </li>
                                        </ul>
                                    </div><!-- End. accounts-menu-list -->
                                </li>

                            @endauth
                        </ul>
                    </div><!-- End. menu-right -->
                </div>
            </div>
        </div>
    </nav><!-- End. menu-container -->

    <!-- cart sidebar section -->
    <div class="cart-sidebar-overlay"></div>
    <div class="cart-sidebar">
        <i class='bx bx-x' id="cart-close"></i>
        <div class="cart-titles">
            <h3>Shopping Card (<span class="cart-count">2</span>)</h3>
        </div>

        <div class="cart-item-list" id="cartData">
            

        </div>

        <div class="cart-buttons">
            <div class="cart-price">
                <p> <span class="cart-count">2</span> Product</p>
                <span id="cart-subtotal">$26.00</span>
            </div>

            <a href="{{route('checkout.index')}}" class="btn btns default_btn mb-2 f-w">Checkout</a>
            <a href="{{route('cart.index')}}" class="btn btns load_more_btn mb-2 f-w">Go To Cart</a>
        </div>
    </div>
</header><!-- End. header -->

<!-- Start header responsive Section -->
<div class="responsive-header">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="header-topBar">
                    <div class="address">
                        <i class='bx bx-map'></i>
                        <p>{{$basic_info->store_location}}</p>
                    </div>

                    <div class="localization">
                        <div class="language me-2">
                            <i class='bx bx-chevron-down'></i>
                            <select name="" class="select-form" id="">
                                <option value="eng">Eng</option>
                                <option value="ban">Ban</option>
                                <option value="spa">Spa</option>
                            </select>
                        </div>

                        <div class="currency">
                            <i class='bx bx-chevron-down'></i>
                            <select name="" class="select-form" id="">
                                <option value="USD">USD</option>
                                <option value="TAKA">TAKA</option>
                                <option value="PESO">PESO</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="header-bottom">
                    <div class="sidebar-icon">
                        <i class="fa-solid fa-bars" id="hamBurger-icon"></i>
                        <img src="{{ asset($basic_info->black_logo) }}" style="height: 50px" alt="">
                    </div>

                    <!-- <div class="header-main"> -->
                    <div class="header-right">
                        <div class="menu-right">
                            <ul>
                                <li>
                                    <a href="" class="item-count">
                                        <i class='bx bx-heart'></i>
                                        <span>0</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;" class="item-count">
                                        <i class='bx bx-shopping-bag'></i>
                                        <span>0</span>
                                    </a>
                                </li>
                            </ul>
                        </div><!-- End. menu-right -->
                    </div>
                    <!-- </div> -->
                </div>
            </div>
        </div>

        <!-- End. responsive-header-sidebar -->
        <div class="header-sidebar-overlay"></div>

        <div class="responsive-header-sidebar">
            <div class="mobile-menu-close">
                <i class='bx bx-x'></i>
            </div>

            <div class="responsive-topBar">
                <img src="{{ asset($basic_info->black_logo) }}" style="height: 50px" alt="">
            </div>

            <div class="mobile-search-form">
                <input type="text" class="mobile-form" placeholder="Search for item....">
                <i class='bx bx-search'></i>
            </div>

            <div class="menu-select">
                <div class="tab-menu">
                    <ul>
                        <li class="active_menu">Menu</li>
                        <li>Categories</li>
                    </ul>
                </div>

                <div class="menu-content active_menu">
                    <ul class="static-menu-list">
                        <li>
                            <a href="">Home</a>
                        </li>
                        <li>
                            <a href="">Shop</a>
                        </li>
{{--                        <li>--}}
{{--                            <a href="">Blog</a>--}}
{{--                        </li>--}}
                        <li>
                            <a href="">About Us</a>
                        </li>
                        <li>
                            <a href="">Contact Us</a>
                        </li>
                        <li>
                            <a href="">Log In</a> / <a href="">Sign Up</a>
                        </li>
                    </ul>

                    <div class="social-media-link">
                        <h4>Follow Us:</h4>
                        <ul>
                            <li>
                                <a href="">
                                    <i class="fa-brands fa-facebook-f"></i>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <i class="fa-brands fa-x-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <i class="fa-brands fa-pinterest-p"></i>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <i class="fa-brands fa-instagram"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="menu-content">
                    <ul class="static-menu-list">
                        <li>
                            <a href="">Chicken & Meat</a>
                        </li>
                        F
                        <li>
                            <a href="">Vegetables</a>
                        </li>
                        <li>
                            <a href="">Fruits</a>
                        </li>
                        <li>
                            <a href="">Snakes</a>
                        </li>
                        <li>
                            <a href="">Drinks & Beverage</a>
                        </li>
                        <li>
                            <a href="">Butter & Cream</a>
                        </li>
                        <li>
                            <a href="">Sweet & Yogurt</a>
                        </li>
                        <li>
                            <a href="">Electronics</a>
                        </li>
                        <li>
                            <a href="">Stationeries</a>
                        </li>
                        <li>
                            <a href="">Cloths</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!-- End. responsive-header -->


