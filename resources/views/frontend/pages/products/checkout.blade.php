@extends('frontend.layout.master')

@push('titles')
    EcoBazaar - Bootstrap eCommerce Template
@endpush

@push('add-css')

@endpush

@section('body-content')

    <!-- start Breadcrumb section -->
    <section class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-details">
                        <ul>
                            <li>
                                <a href="">
                                    <i class='bx bx-home'></i> <i class='bx bx-chevron-right'></i>
                                </a>
                            </li>
                            <li>
                                <a href="{{route('cart.index')}}">
                                    <span>Shopping Cart</span>
                                    <i class='bx bx-chevron-right'></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    Checkout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- start checkout section -->
    <section class="checkout-section">
        <div class="container">
            <div class="row">

                <div class="col-md-6 mb-5">
                    <div class="coupon-code">
                        <div>
                            <input type="text" id="coupon_code" class="coupon-form" placeholder="Enter Code">
                            <i class="bx bx-purchase-tag-alt"></i>
                            <button class="coupon-btn" onclick="applyCoupon()">Apply Coupon</button>
                        </div>
                    </div><!-- End. coupon-code -->
                </div><!-- End. col-md-6 -->
                {{--        <form action="{{route('order.store')}}" method="POST" id="codPaymentForm">--}}
                <form action="{{route('order.store')}}" method="POST" id="codPaymentForm">
                    @csrf
                    <div class="col-lg-12">
                        <div class="checkout-container">
                            <div class="checkout-billing">
                                <h3>Billing Information</h3>


                                <div class="checkout-form">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 mb-3">
                                            <label for="" class="form-labels">First name *</label>
                                            <input type="text" name="first_name" class="normal-forms" id=""
                                                   value="{{Auth::user()->name ?? old('first_name')}}" placeholder="Your first name"
                                                   required>
                                        </div>

                                        <div class="col-lg-4 col-md-4 mb-3">
                                            <label for="" class="form-labels">Last name</label>
                                            <input type="text" name="last_name" class="normal-forms" id="" value="{{old('last_name') ?? ''}}"
                                                   placeholder="Your last name">
                                        </div>

                                        <div class="col-lg-4 col-md-4 mb-3">
                                            <label for="" class="form-labels">Company name</label>
                                            <input type="text" name="company_name" class="normal-forms" id="" value="{{old('company_name') ?? ''}}"
                                                   placeholder="Company name">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 mb-3">
                                            <label for="" class="form-labels">Email *</label>
                                            <input type="email" name="email" class="normal-forms" id=""
                                                   placeholder="Email Address" value="{{Auth::user()->email ?? old('email')}}" required>
                                        </div>

                                        <div class="col-lg-4 col-md-4 mb-3">
                                            <label for="" class="form-labels">Phone *</label>
                                            <input type="text" name="phone" value="{{Auth::user()->phone ?? old('phone')}}" class="normal-forms" id=""
                                                   placeholder="Phone Number" required>
                                        </div>

                                        <div class="col-lg-4 col-md-4 mb-3">
                                            <label for="" class="form-labels">Gender *</label>
                                            <select name="gender" id="" class="normal-forms" required>
                                                <option value="male">Male</option>
                                                <option value="female">Female</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="" class="form-labels">Street Address *</label>
                                        <input type="text" name="address_1" class="normal-forms mb-2" id=""
                                               placeholder="Street Address" value="{{Auth::user()->address ?? old('address_1')}}" required>
                                        <input type="text" name="address_2" class="normal-forms" id="" value="{{old('address_2')}}"
                                               placeholder="Address ( Optional )">
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 mb-3">
                                            <label for="" class="form-labels">Country *</label>
                                            <select name="country" id="" class="normal-forms" required>
                                                <option value="Bangladesh" selected>Bangladesh</option>
                                            </select>   
                                        </div>

                                        <div class="col-lg-4 col-md-4 mb-3">
                                            <label for="" class="form-labels">States/Districts *</label>
                                            <select name="state_district" id="" class="normal-forms" required>
                                                <option value="Dhaka">Dhaka</option>
                                            </select>
                                        </div>

                                        <div class="col-lg-4 col-md-4 mb-3">
                                            <label for="" class="form-labels">Zip Code *</label>
                                            <input type="text" name="zip" class="normal-forms" id="" value="{{Auth::user()->zip ?? old('zip')}}"
                                                   placeholder="Zip Code" required>
                                        </div>
                                        
                                    </div>


                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 mb-3">
                                            <label for="" class="form-labels">Thana</label>
                                            <input type="text" name="thana" value="{{Auth::user()->thana ?? old('thana')}}" class="normal-forms" id=""
                                                   placeholder="Thana">
                                        </div>

                                        <div class="col-lg-4 col-md-4 mb-3">
                                            <label for="" class="form-labels">Area/Subarea</label>
                                            <input type="text" name="area" value="{{Auth::user()->area ?? old('area')}}"  class="normal-forms" id=""
                                                   placeholder="Area">
                                        </div>

                                        <div class="col-lg-4 col-md-4 mb-3">
                                            <label for="shipping_charge" class="form-labels">Shipping Charge</label>
                                            <select name="shipping_charge" id="shipping_charge" class="normal-forms" onchange="cartCalculation()" required>
                                               
                                                @forelse($deliveryCharges as $deliveryCharge)
                                                    <option value="{{$deliveryCharge->delivery_charge}}">{{$deliveryCharge->delivery_title}} ({{$deliveryCharge->delivery_charge}})</option>
                                                @empty
                                                @endforelse
                                            </select>
                                        </div>

                                    </div>
                                    
                                </div><!-- End. checkout-form -->

                                <div class="additional-info">
                                    <h3>Additional Info</h3>

                                    <div class="mb-3">
                                        <label for="" class="form-labels">Order Notes (Optional)</label>
                                        <textarea name="order_note" id="" class="normal-textarea"
                                                  placeholder="Notes about your order, e.g. special notes for delivery"></textarea>
                                    </div>
                                </div><!-- End. additional-info -->
                            </div><!-- End. checkout-billing -->

                            <div class="main-order-summary">
                                <div class="order-summary">
                                    <h2>Order Summery</h2>

                                    <ul class="all-products-container">
                                        @foreach(Cart::content() as $item)
                                            <li>
                                                <div class="all-products-show">
                                                    <div class="all-products-list">
                                                        <img src="{{ asset($item->options->image) }}" alt="">
                                                        <div class="all-products-details">
                                                            <p>{{ $item->name }}</p>
                                                            <span>{{ $item->qty }} X ৳ {{ $item->price }} </span>
                                                        </div>
                                                    </div><!-- End. all-products-list -->

                                                    <span>৳{{ $item->price }}</span>
                                                </div><!-- End. all-products-show -->
                                            </li>

                                        @endforeach
                                    </ul><!-- End. all-products-container -->

                                    <div id="orderSummery">

                                    </div>


                                    <div class="payment-method">
                                        <h2>Payment Method</h2>

                                        <div class="payment-form">
                                            <input type="radio" name="payment_method" id="cod" checked="" value="cod">
                                            <label for="cod" class="payment-label">Cash on Delivery</label>
                                        </div><!-- End. payment-form -->

{{--                                        <div class="payment-form">--}}
{{--                                            <input type="radio" name="payment_method" id="ssl_commercez"--}}
{{--                                                   value="sslcommerzz">--}}
{{--                                            <label for="ssl_commercez" class="payment-label">SSL Commercez</label>--}}
{{--                                        </div><!-- End. payment-form -->--}}

{{--                                        <div class="payment-form">--}}
{{--                                            <input type="radio" name="payment_method" id="paypal" value="paypal">--}}
{{--                                            <label for="paypal" class="payment-label">Paypal</label>--}}
{{--                                        </div><!-- End. payment-form -->--}}

{{--                                        <div class="payment-form">--}}
{{--                                            <input type="radio" name="payment_method" id="stripe" value="stripe">--}}
{{--                                            <label for="stripe" class="payment-label">Stripe</label>--}}
{{--                                        </div><!-- End. payment-form -->--}}
                                    </div><!-- End. payment-method -->


                                    <input type="text" name="total" value="{{str_replace(',','',Cart::subtotal(0))}}"
                                           class="normal-forms" id="total_amount" hidden>
                                    <input type="text" name="subtotal" value="{{str_replace(',','',Cart::subtotal(0))}}"
                                           class="normal-forms" id="subTotal" hidden>


                                    <button id="cod-btn" form="codPaymentForm" type="submit" class="order-btn">Cash On
                                        Delivery
                                    </button>
                                    <button id="ssl-btn" class="btn order-btn d-none">Pay with SSL Commerz</button>
                                    <button id="paypal-btn" class="btn order-btn d-none">Pay with PayPal</button>
                                    <button id="stripe-btn" class="btn order-btn d-none">Pay with Stripe</button>

                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div><!-- End. row -->
        </div><!-- End. container -->
    </section><!-- End. checkout-section -->

@endsection


@push('add-scripts')

    <script>
        orderSummery();
        $(document).ready(function () {
            $("#cod").click(function () {
                $('#cod-btn').removeClass('d-none');
                $("#ssl-btn").addClass("d-none");
                $("#paypal-btn").addClass("d-none");
                $("#stripe-btn").addClass("d-none");
            });
            $("#ssl_commercez").click(function () {
                $('#cod-btn').addClass('d-none');
                $("#ssl-btn").removeClass("d-none");
                $("#paypal-btn").addClass("d-none");
                $("#stripe-btn").addClass("d-none");
            });
            $("#paypal").click(function () {
                $('#cod-btn').addClass('d-none');
                $("#ssl-btn").addClass("d-none");
                $("#paypal-btn").removeClass("d-none");
                $("#stripe-btn").addClass("d-none");
            });
            $("#stripe").click(function () {
                $('#cod-btn').addClass('d-none');
                $("#ssl-btn").addClass("d-none");
                $("#paypal-btn").addClass("d-none");
                $("#stripe-btn").removeClass("d-none");
            });


        });

        //Order Summery
        function orderSummery() {
            $('#orderSummery').append(
                `<div class="order-summary-details">
                                    <p>Subtotal:</p>
                                    <span>৳ {{Cart::subtotal(0) }}</span>
                                </div>

                                <div class="order-summary-details">
                                    <p>Coupon Discount:</p>
                                    <span >৳ <span id="couponCode">0.00</span></span>
                                </div>
                        
                                <div class="order-summary-details">
                                    <p>Shipping:</p>
                                    <span>৳ <span id="ship_charge">0.00</span></span>
                                </div>
                                

                                <div class="order-summary-details">
                                    <p>Total:</p>
                                    <span>৳ <span id="totalAmount">{{Cart::subtotal(0) }}</span></span>
                                </div>`
            )
        }
        
        {{--function shippingChargeUpdate()--}}
        {{--{--}}
        {{--    let shipping_charge = $('#shipping_charge').val();--}}
        
        {{--    $.ajax({--}}
        {{--        type: "POST",--}}
        {{--        url: "{{ route('shipping.charge.update') }}",--}}
        {{--        data:--}}
        {{--            {--}}
        {{--                shipping_charge: shipping_charge--}}
        {{--            },--}}
        {{--       --}}
        {{--        success: function (res) {--}}
        {{--       --}}
        {{--            console.log(res);--}}
        {{--            $('#ship_charge').text(shipping_charge)--}}
        {{--            cartCalculation()   --}}
        {{--            --}}
        {{--        },--}}
        {{--        error: function (err) {--}}
        {{--            console.error('Error:', err);--}}
        {{--            --}}
        {{--          --}}
        {{--        }--}}
        {{--    });--}}
        
        {{--}--}}
        
        function applyCoupon() {
            let coupon_code = $('#coupon_code').val();
            
            $.ajax({
                type: "POST",
                url: "{{ route('apply.coupon') }}",
                data:
                    {
                        coupon_code: coupon_code
                    },

                success: function (res) {
                    
                    if (res.status === 'success')
                    {

                        cartCalculation()
                      
                        toastr.options.closeButton = true;
                        toastr.success(res.message, 'Success!')
                        
                        $('#coupon_code').val('')
                    }
                    else if (res.status==="failed")
                    {
                        toastr.options.closeButton = true;
                        toastr.error(res.message, 'Failed!')
                    }
                    
                   
                },
                error: function (err) {
                    console.error('Error:', err);
                    // toastr.success('Have fun storming the castle!', 'Miracle Max Says')
                }
            });
        }

        cartCalculation()
        function cartCalculation()
        {
            let shipping_charge = $('#shipping_charge').val(); 
            $.ajax({
                type: "GET",
                url: "{{ route('cart.calculate') }}",
                data: {
                    'shipping_charge': shipping_charge,
                },
                success: function (res) {

                    if (res.status === 'success')
                    {

                        $('#couponCode').text(res.discount_amount)
                        $("#totalAmount").text(res.total_amount)
                        $('#ship_charge').text(shipping_charge)
                        
                        
                        $('#total_amount').val(res.total_amount)
                    }
                    else 
                    {
                        console.log('failed')
                    }


                },
                error: function (err) {
                    console.error('Error:', err);
                    // toastr.success('Have fun storming the castle!', 'Miracle Max Says')
                }
            });
        }

    </script>

@endpush