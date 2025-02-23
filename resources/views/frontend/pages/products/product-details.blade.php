@extends('frontend.layout.master')

@push('titles')
    {{$product->product_name}} 
@endpush



    @push('seo')
        <meta name="app-url" content="{{ route('product-details', $product->slug) }}" />
        <meta name="robots" content="index, follow" />
        <meta name="description" content="{{ $product->short_desc }}" />
        <meta name="keywords" content="{{ $product->slug }}" />

        <!-- Twitter Card data -->
        <meta name="twitter:card" content="product" />
        <meta name="twitter:site" content="" />
        <meta name="twitter:title" content="{{ $product->product_name }}" />
        <meta name="twitter:description" content="{{ $product->short_desc }}" />
        <meta name="twitter:creator" content="" />
        <meta property="og:url" content="{{ route('product-details', $product->slug) }}" />
        <meta name="twitter:image" content="{{ asset($product->productDetail->productThumbnail_img) }}" />

        <!-- Open Graph data -->
        <meta property="og:title" content="{{ $product->product_name }}" />
        <meta property="og:type" content="product" />
        <meta property="og:url" content="{{ route('product-details', $product->slug) }}" />
        <meta property="og:image" content="{{ asset($product->productDetail->productThumbnail_img) }}" />
        <meta property="og:description" content="{{ $product->short_desc }}" />
        <meta property="og:site_name" content="" />
    @endpush


@push('add-css')

@endpush

@section('body-content')
    <style>
        /*img {*/
        /*    max-width: 100%;*/
        /*    height: auto !important;*/
        /*}*/

        input[type="radio"] {
            /*display: none;*/

            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }

        /*input[type="radio"]:checked + label.colortext {*/
        /*    color: #fff;*/
        /*    background-color: #613EEA;*/
        /*}*/

        .sizetext {
            color: 000;
            background: #fff;
        }

        .colortext {
            color: #000;
            background: #fff;

            border: 1px solid #fe5200;
            font-size: 16px;
            font-weight: 600;
            padding: 0px 12px;
            border-radius: 4px;
        }

        .sizetext {
            color: #000;
            background: #fff;

            border: 1px solid #fe5200;
            font-size: 16px;
            font-weight: 600;
            padding: 0px 12px;
            border-radius: 4px;
        }

        .weighttext {
            color: #000;
            background: #fff;

            border: 1px solid #fe5200;
            font-size: 16px;
            font-weight: 600;
            padding: 0px 12px;
            border-radius: 4px;
        }

        .colortext:hover, .weighttext:hover, .sizetext:hover {
            cursor: pointer;
            background: #fe5200;
            color: white;
        }

        .variantText {
            font-size: 16px;
            margin-right: 10px;
        }
    </style>
    <section class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-details">
                        <ul>
                            <li>
                                <a href="{{url('/')}}">
                                    <i class='bx bx-home'></i> <i class='bx bx-chevron-right'></i>
                                </a>
                            </li>
                            <li>
                                <a href="{{route('product.by.category', $product->category->slug)}}">
                                    <span>{{$product->category->category_name}}</span>
                                    <i class='bx bx-chevron-right'></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    {{$product->product_name}}
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    <!-- Product Details Page section -->
    <section class="product-details-section">
        <div class="container">
            <div class="main-product-control-div">
                <div class="main-product-image-container">
                    <div class="single-product-image-container">
                        <div class="single-product-image">
                            <img src="{{ asset($product->productDetail->productThumbnail_img) }}" alt="">
                        </div>

                        <div class="multiple-product-image-show">
                            <div class="owl-carousel owl-theme" id="multi-product-slider">


                                @foreach($sliderimgs as $sliderimg)
                                    <img src="{{ asset('public/backend/assets/images/uploads/products/'.$sliderimg) }}"
                                         alt="" class="slider_images">
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>

                <div class="main-product-details-show">
                    <div class="single-product-details-show">
                        <div class="product-heading-title">
                            <h1>{{$product->product_name}}</h1>
                            <p>@if($product->productDetail->available_qty > 0)
                                    <span class="text-success">In Stock</span>
                                @else
                                    <span class="text-light bg-danger">Out Of Stock</span>
                                @endif</p>
                        </div>

                        <div class="product-rating-sku">
                            <div class="product-rating-review">
                                <div class="ratings-review">
                                    @for($i=0 ; $i < 5 ; $i++)
                                        @if($i< $reviewRatingAvg)
                                            <i class="fa-solid fa-star"></i>
                                        @else
                                            <i class="fa-regular fa-star"></i>
                                        @endif
                                    @endfor
                                </div>

                                <span>{{count($activeReviews)}} Review</span>
                            </div>

                            <div class="middle-dot"></div>
                            <p><span>SKU:</span> {{$product->productDetail->SKU}}</p>
                        </div>

                        <div class="product-price" id="priceSection">
                            @if(count($product->sizes) > 0)
                                <p>
                                    <del id="regularPrice">৳ {{$product->sizes[0]->productRegularPrice}}</del>
                                    <span id="salePrice">  ৳ {{$product->sizes[0]->productSalePrice}}</span>
                                </p>
                                <span class="discount-rate" id="discountRate">{{$product->sizes[0]->discount_percentage}}% Off</span>

                            @elseif(count($product->colors) > 0)
                                <p>
                                    <del id="regularPrice">৳ {{$product->colors[0]->productRegularPrice}}</del>
                                    <span id="salePrice">   ৳ {{$product->colors[0]->productSalePrice}}</span></p>
                                <span class="discount-rate" id="discountRate">{{$product->colors[0]->discount_percentage}}% Off</span>

                            @elseif(count($product->weights) > 0)
                                <p>
                                    <del id="regularPrice">৳ {{$product->weights[0]->productRegularPrice}}</del>
                                    <span id="salePrice"> ৳ {{$product->weights[0]->productSalePrice}}</span>
                                </p>
                                <span class="discount-rate" id="discountRate">{{$product->weights[0]->discount_percentage}}% Off</span>

                            @endif
                        </div>

                        <div class="product-social-brand-show">
                            @if(isset($product->brand->brand_image)) 
                            <div class="product-brand-show">
                                <p>Brands: <img src="{{ asset($product->brand->brand_image) }}" alt=""></p>
                            </div>
                            @endif

                            <div class="share-products-social-media">
                                <h4>Share Item:</h4>
                                <ul>
{{--                                    <li>--}}
{{--                                        <a href="{{Share::currentPage()->facebook()}}">--}}
{{--                                            <i class="fa-brands fa-facebook-f"></i>--}}
{{--                                        </a>--}}
{{--                                    </li>--}}
{{--                                    <li>--}}
{{--                                        <a href="">--}}
{{--                                            <i class="fa-brands fa-x-twitter"></i>--}}
{{--                                        </a>--}}
{{--                                    </li>--}}
{{--                                    <li>--}}
{{--                                        <a href="">--}}
{{--                                            <i class="fa-brands fa-pinterest-p"></i>--}}
{{--                                        </a>--}}
{{--                                    </li>--}}
{{--                                    <li>--}}
{{--                                        <a href="">--}}
{{--                                            <i class="fa-brands fa-instagram"></i>--}}
{{--                                        </a>--}}
{{--                                    </li>--}}
                                </ul>
                               
                                {!! $shareLinks !!}
                               
                            </div>
                        </div>

                        <div class="product-short-description">
                            <p>{{$product->short_desc}} </p>
                        </div>
                        <form id="addToCartForm">

                            <div class="products-quantity">
                                <div class="cart-quantity">
                                    <i class="bx bx-minus"></i>
                                    <input type="number" class="quantity" name="qty" readonly="" value="1" min="1"
                                           max="{{$product->productDetail->available_qty}}">
                                    <i class="bx bx-plus"></i>
                                </div>

                                <div class="product-action-buttons">


                                    @csrf
                                    <input type="hidden" name="id" value="{{ $product->id }}">
                                    <input type="hidden" name="name" value="{{ $product->product_name }}">
                                    <input type="hidden" name="image"
                                           value="{{ asset($product->productDetail->productThumbnail_img) }}">

                                    @if(count($product->sizes)>0)
                                        <input  type="number" hidden="" id="pSize" name="price"
                                               value="{{ $product->sizes[0]->productSalePrice }}">
                                    @elseif(count($product->colors)>0)
                                        <input id="pColor" type="number" hidden="" name="price"
                                               value="{{ $product->colors[0]->productSalePrice }}">

                                    @elseif(count($product->weights)>0)
                                        <input id="pWeight" type="number" hidden="" name="price"
                                               value="{{ $product->weights[0]->productSalePrice }}">
                                    @endif
                                    <input type="hidden" name="color" id="product_color">
                                    <input type="hidden" name="size" id="product_size">
                                    <input type="hidden" name="weight" id="product_weight">
                                    <input type="hidden" name="stock" id="product_weight" value="{{$product->productDetail->available_qty}}">
                                    


                                    <button type="submit" class="product-cart-action-btn">
                                        Add to Cart<i class="bx bx-shopping-bag"></i>
                                    </button>

                                    
                                    <button type="submit" form="addToWishlist" class="product-wishlist-action-btn ">
                                        <i class="bx bx-heart"></i>
                                    </button>
                                </div>

                            </div>
                        </form>
                        <form id="addToWishlist" method="post" action="{{route('wishlist.store')}}">
                            @csrf
                            <input type="hidden" name="product_id" id="pId" value="{{ $product->id }}">
                        </form>

                        <div class="products-list-details">
                            @if(count($product->sizes)>0)
                                <p><span class="variantText">Size:</span>
                                    @foreach($product->sizes as $size)
                                        <input type="radio" class="m-0 visually-hidden">
                                        <label id="sizeAttr{{$size->attrvalue_id}}" class="sizetext ms-0 mx-1" style=""
                                               onclick="getSize('{{ $size->attrvalue_id }}')">{{ $size->size_title }}</label>

                                    @endforeach
                                </p>
                            @endif

                            @if(count($product->colors)>0)
                                <p>
                                    <span class="variantText">Color:</span>

                                    @foreach($product->colors as $color)
                                        <input type="radio" class="m-0 visually-hidden">
                                        <label id="colorAttr{{$color->attrvalue_id}}" class="colortext ms-0 mx-1"
                                               style=""
                                               onclick="getColor('{{ $color->attrvalue_id }}')">{{ $color->color_title }}</label>

                                    @endforeach

                                </p>
                            @endif
                            @if(count($product->weights)>0)
                                <p><span class="variantText">Weight:</span>
                                    @foreach($product->weights as $weight)
                                        <input type="radio" class="m-0 visually-hidden">
                                        <label id="weightAttr{{$weight->attrvalue_id}}" class="weighttext ms-0 mx-1"
                                               style=""
                                               onclick="getWeight('{{ $weight->attrvalue_id }}')">{{ $weight->weight_title }}</label>

                                    @endforeach

                                </p>
                            @endif
                            {{--                            <p><span>Category:</span> {{$product->category->category_name}}</p>--}}
                            {{--                            <p><span>Sub Category:</span> {{$product->subcategory->subcategory_name}}</p>--}}


                            {{--                            <p class="d-flex align-items-center">--}}
                            {{--                                <span>Tag:</span>--}}
                            {{--                                @foreach($productTags as $productTag)--}}
                            {{--                                    <span class="badge bg-primary text-light mx-1">{{ $productTag }}</span>--}}
                            {{--                                @endforeach--}}
                            {{--                            </p>--}}
                        </div>
                    </div>
                </div>
            </div><!-- End. row -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="products-tab-menu-list">
                        <ul>
                            <li class="product-tab-menu active_desc">Descriptions</li>
                            <li class="product-tab-menu">Additional Information</li>
                            <li class="product-tab-menu">Customer Feedback</li>
                        </ul>

                        <!-- All Description contents show here -->
                        <div class="description-contents active_desc">
                            <div class="product-description-container">
                                <div class="product-description">
                                    {!! $product->productDetail->long_desc !!}
                                </div>

                                <div class="product-videos mt-2">
                                    <iframe width="560" height="315"
                                            src="{{$product->productDetail->youtube_embed_link}}"
                                            title="YouTube video player" frameborder="0"
                                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                            referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                                </div>

                            </div>
                        </div>
                        {{--Additional Info--}}
                        <div class="description-contents">
                            <div class="product-description-container">
                                <div class="additional-info">
                                    <ul>

                                        @if(count($product->colors)>0)
                                            <li>
                                                <div class="product-full-bio">
                                                    <h4>Color:</h4>
                                                    <span>
                                                    @foreach($product->colors as $color)
                                                            {{$color->color_title}},
                                                        @endforeach
                                                </span>
                                                </div>
                                            </li>
                                        @endif
                                        @if(count($product->sizes)>0)
                                            <li>
                                                <div class="product-full-bio">
                                                    <h4>Size:</h4>
                                                    <span>
                                                    @foreach($product->sizes as $size)
                                                            {{$size->size_title}},
                                                        @endforeach
                                                </span>
                                                </div>
                                            </li>
                                        @endif

                                        @if(count($product->weights)>0)
                                            <li>
                                                <div class="product-full-bio">
                                                    <h4>Weights:</h4>
                                                    <span>
                                                    @foreach($product->weights as $weight)
                                                            {{$weight->weight_title}},
                                                        @endforeach
                                                </span>
                                                </div>
                                            </li>
                                        @endif

                                        <li>
                                            <div class="product-full-bio">
                                                <h4>Category:</h4>
                                                <span>{{$product->category->category_name}}</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="product-full-bio">
                                                <h4>Sub Category:</h4>
                                                <span>{{$product->subcategory->subcategory_name ?? ''}}</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="product-full-bio">
                                                <h4>Brand:</h4>
                                                <span>{{$product->brand->brand_name ?? ''}}</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="product-full-bio">
                                                <h4>Stock Status:</h4>
                                                <span>@if($product->productDetail->available_qty > 0)
                                                        Available({{$product->productDetail->available_qty}})
                                                    @else
                                                        Out of Stock
                                                    @endif </span>
                                            </div>
                                        </li>
                                        <li>
                                            @if(isset($productTags)) 
                                            <div class="product-full-bio">
                                                <h4>Tags:</h4>
                                                <span>@foreach($productTags as $tag)
                                                        {{$tag}},
                                                    @endforeach</span>
                                            </div>
                                            @endif
                                        </li>
                                    </ul>
                                </div>

                                <div class="product-videos mt-2">
                                    <iframe width="560" height="315"
                                            src="{{$product->productDetail->youtube_embed_link}}"
                                            title="YouTube video player" frameborder="0"
                                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                            referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                                </div>
                            </div>
                        </div>
                        {{--Customer--}}
                        <div class="description-contents">
                            <div class="product-description-container" style="align-items: start;">
                                <div class="customer-feedback px-2" id="reviewData">


                                </div>

                                
                                @guest()
                                    <div class="customer-review">
                                        <a href="{{route('login')}}" class="review-btn">Please Login to Submit Review</a>

                                    </div>
                                @endguest
                                @auth('web')
                                <div class="customer-review">
                                    <h3>Reviews</h3>

                                    <form id="reviewSubmit">
                                        @csrf
                                        <input type="number" name="product_id" value="{{$product->id}}" hidden="">
                                        <div class="mb-3">
                                            <label class="review_label" for="ratings">Ratings</label>
                                            <select class="select-form-decoration" name="rating" id="ratings">
                                                <option value="" disabled selected>Select Ratings</option>
                                                <option value="1">1 Star</option>
                                                <option value="2">2 Star</option>
                                                <option value="3">3 Star</option>
                                                <option value="4">4 Star</option>
                                                <option value="5">5 Star</option>
                                            </select>
                                        </div>

                                        <div class="mb-3">
                                            <label class="review_label" for="text_review">Text Review</label>
                                            <textarea name="review_text" class="normal-forms" style="height: 100px;"
                                                      id="text_review" placeholder="Write Message"></textarea>
                                        </div>

                                        <button type="submit" class="review-btn">Submit Your Reviews</button>
                                    </form>
                                </div>
                                @endauth
                            </div>
                        </div>
                    </div>
                </div>
            </div>

         
            <!-- Related Product section -->
            @if(count($relatedProducts)>0)
                <div class="row">
                    <div class="relatedProductSlider">
                        <div class="header-titles" style="justify-content: center;">
                            <h1>Related Products</h1>
                        </div><!-- End. header-titles -->

                        <!-- For responsive product-responsive -->
                        <div class="owl-carousel owl-theme" id="relatedSlider">

                            @forelse($relatedProducts as $product)
                                <div class="products-description">
                                    <div class="product-image">
                                        <a href="{{url('/product-details/'.$product->slug)}}"> <img
                                                    src="{{ asset($product->productDetail->productThumbnail_img) }}"
                                                    alt=""></a>
                                        @if(count($product->colors)>0)
                                            <span class="badges sale_badge product-badges">Sale {{$product->colors[0]->discount_percentage}}%</span>
                                        @elseif(count($product->weights)>0)
                                            <span class="badges sale_badge product-badges">Sale {{$product->weights[0]->discount_percentage}}%</span>
                                        @else
                                            <span class="badges sale_badge product-badges">Sale {{$product->sizes[0]->discount_percentage}}%</span>

                                        @endif

                                        <ul class="product-icons-show">
                                            <li>
                                                <a href="#">
                                                    <i class="ri-heart-line"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="ri-eye-line"></i>
                                                </a>
                                            </li>
                                        </ul><!-- End. product-icons-show -->
                                    </div><!-- End. product-image -->

                                    <div class="product-info">
                                        <div class="product-bio">
                                            <a href="{{url('/product-details/'.$product->slug)}}"
                                               class="product-title">{{ $product->product_name }}</a>
                                            @if(count($product->colors)>0)
                                                <p>${{$product->colors[0]->productRegularPrice}}
                                                    <del>
                                                        <span class="discount-price">${{$product->colors[0]->productSalePrice}}</span>
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


                        </div><!-- End. featuredSlider -->
                    </div><!-- End. RelatedProductSlider -->
                </div>
            @endif
{{-- <input id="productId" class="form-control" value="{{$product->slug}}"/>--}}
        </div><!-- End. container -->
    </section><!-- End. product-details-section -->


    <!-- Subscription include -->
    @include('frontend.include.subscription')

@endsection


@push('add-scripts')

    <script>
        let product_id = $('#pId').val();
        $(document).ready(function () {

            //Add To Cart
            $('#addToCartForm').submit(function (e) {
                e.preventDefault();

                if ($('#product_color').val() === '' && $('#product_weight').val() === '' && $('#product_size').val() === '') {

                    swal.fire({
                        title: 'Error',
                        text: 'Please Select Color, Weight or Size',
                        icon: 'error'
                    })
                } else {


                    $.ajax({
                        type: 'POST',
                        url: '{{ url('/add-to-cart') }}',
                        data: new FormData(this),
                        processData: false,  // Prevent jQuery from processing the data
                        contentType: false,  // Prevent jQuery from setting contentType
                        success: function (res) {
                            cartData();
                            swal.fire({
                                title: 'success',
                                text: 'Product Added to Cart',
                                icon: 'success'
                            })

                        },
                        error: function (e) {
                            console.log(e)
                        }

                    });
                }

            });

        });

        {{--let product_id = {{$product->id}};--}}
        
        wishlistValidate();
        loadReview();
        //Get Price Based on Product Color
        function getColor(color) {


            $.ajax({
                type: 'GET',
                url: '{{ url('/get/price-by-color') }}',
                data: {
                    // _token: token,
                    product_id: product_id,
                    attrvalue_id: color
                },

                success: function (res) {
                    $('#product_color').val(res.color_title);
                    $('#product_colorW').val(res.id);
                    $('#pColor').val(res.productSalePrice);

                    $('#product_colorOr').val(res.color_title);
                    $('#priceSection').find('#regularPrice').text('৳ ' + res.productRegularPrice);
                    $('#priceSection').find('#salePrice').text('৳ ' + res.productSalePrice);
                    $('#priceSection').find('#discountRate').text(res.discount_percentage + '% Off');

                    $('.colortext').css('color', '#000');
                    $('.colortext').css('background', '#fff');
                    $('#colorAttr' + color).css('color', '#fff');
                    $('#colorAttr' + color).css('background', '#fe5200');

                },
                error: function (error) {
                    console.log('error');


                }
            });

           
            
        }

        //Get Price Based on Product Size
        function getSize(size) {

            console.log(product_id,size);

            $.ajax({
                type: 'GET',
                url: '{{ url('/get/price-by-size') }}',
                data: {
                    product_id: product_id,
                    attrvalue_id: size
                },

                success: function (res) {
                    $('#product_size').val(res.size_title);
                    $('#product_sizeW').val(res.id);
                    $('#pSize').val(res.productSalePrice);

                    $('#priceSection').find('#regularPrice').text('৳ ' + res.productRegularPrice);
                    $('#priceSection').find('#salePrice').text('৳ ' + res.productSalePrice);
                    $('#priceSection').find('#discountRate').text(res.discount_percentage + '% Off');

                    $('.sizetext').css('color', '#000');
                    $('.sizetext').css('background', '#fff');
                    $('#sizeAttr' + size).css('color', '#fff');
                    $('#sizeAttr' + size).css('background', '#fe5200');

                },
                error: function (error) {
                    console.log('error');


                }
            });

            // $('#product_color').val(color);
            //
            // $('#product_colorOr').val(color);


        }

        //Get Price Based on Product Weight
        function getWeight(weight) {


            $.ajax({
                type: 'GET',
                url: '{{ url('/get/price-by-weight') }}',
                data: {
                    product_id: product_id,
                    attrvalue_id: weight
                },

                success: function (res) {
                    
                    $('#product_weight').val(res.weight_title);
                    $('#product_weightW').val(res.id);
                    $('#pWeight').val(res.productSalePrice);

                    $('#priceSection').find('#regularPrice').text('৳ ' + res.productRegularPrice);
                    $('#priceSection').find('#salePrice').text('৳ ' + res.productSalePrice);
                    $('#priceSection').find('#discountRate').text(res.discount_percentage + '% Off');

                    $('.weighttext').css('color', '#000');
                    $('.weighttext').css('background', '#fff');
                    $('#weightAttr' + weight).css('color', '#fff');
                    $('#weightAttr' + weight).css('background', '#fe5200');

                },
                error: function (error) {
                    console.log('error');


                }
            });

            // $('#product_color').val(color);
            //
            // $('#product_colorOr').val(color);


        }

        //Load All Reviews
        function loadReview()
        {
            $.ajax({
                type: 'GET',
                url: '{{ url('/get-reviews' ) }}/' + product_id,
               
                success: function (res) {

                  
                    
                  res.reviews.forEach(function (item, index) {

                      
                      let starRatings = '';
                      for (let i = 0; i < 5; i++) {
                          if (i < item.rating) {
                              starRatings += '<i class="fa-solid fa-star"></i>';
                          } else {
                              starRatings += '<i class="fa-regular fa-star"></i>';
                          }
                      }
                      
                      
                      let content = `<div class="customer-message">
                                            <div class="customer-content">
                                                <div class="customer-bio">
                                                    <img src="{{asset('')}}/${item.user.profile_pic}"
                                                         alt="" width="40px" style="border-radius: 50%">

                                                    <div class="customer-ratings">
                                                        <h5>${item.user.name}</h5>

                                                      <div class="star-ratings">
                                                          ${starRatings}
                                                      
                                                       </div>
                                                       
                                                       <span>${item.review_date}</span>
                                                       
                                                      </div>
                                                      
                                                </div>

                                            </div>
            

                                            <p> ${item.review_text} </p>
                                      </div>`;
                      
                      $('#reviewData').append(content);
                      
                      
                  });
                    
                    
                    // $('#reviewData').html(res);
                },
                error: function (error) {
                    console.log('error');
                }
            });
        }
        
        //Load Wish Icon
        function wishlistValidate()
        {
            $.ajax({
                type: 'GET',
                url: '{{ route('wishlist-validate') }}',
                data: {
                    product_id: product_id
                },
                success: function (res) {

                    if (res.check === true)
                    {
                        $('.bx-heart').addClass('wish-active')  
                    }
                },
                error: function (error) 
                {
                    console.log(error);
                }
            })
        }
        //Add to Wishlist
        $('#addToWishlist').on('submit', function (e) {
            e.preventDefault();
            
           
                $.ajax({
                    type: 'POST',
                    url: '{{ route('wishlist.store') }}',
                    data: new FormData(this),
                    processData: false,
                    contentType: false,
                    success: function (res,xyz,jqXHR) {
                        
                        if (jqXHR.status===204)
                        {
                            $('.bx-heart').removeClass('wish-active')
                            toastr.error('Product Removed From Wishlist');
                        }
                        else if (jqXHR.status===200)
                        {
                            $('.bx-heart').addClass('wish-active')
                            toastr.success(res.message);
                        }
                        $('#addToWishlist').trigger('reset');
                        
                        
                    },
                    error: function (error,xyz,jqXHR) {

                       
                        if (error.status===401)
                        {
                            Swal.fire({
                                // title: "Are you sure?",
                                text: "You are not logged in",
                                icon: "info",
                                showCancelButton: true,
                                confirmButtonColor: "#3085d6",
                                cancelButtonColor: "#d33",
                                confirmButtonText: "Log In"
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    window.location.href = '{{ route('login') }}';
                                }
                            });
                            
                            

                            
                        }
                        else
                        {
                        toastr.error(error.responseJSON.message);
                            
                        }

                        
                    }
                });
            
        });
        
        //Submit Review
        $('#reviewSubmit').on('submit', function (e) {
            
            e.preventDefault();
            $.ajax({
                type: 'POST',
                url: '{{ url('/submit-review') }}',
                data: new FormData(this),
                processData: false,
                contentType: false,
                success: function (res) {
                    
                    $('#reviewSubmit').trigger('reset');
                    // console.log(res.message);
                    
                    toastr.success(res.message);
                    
                },
                error: function (error) {
                    toastr.error(error.responseJSON.message);
                }
            });
        });
            
                    
    </script>

@endpush