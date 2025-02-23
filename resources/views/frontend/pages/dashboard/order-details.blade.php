@extends('frontend.layout.master')
@push('titles')
    EcoBazaar 
@endpush

@push('add-css')
    <link rel="stylesheet" href="{{ asset('public/frontend/assets/css/custom.css') }}">
    
    <style>
        @media print {
           header, .responsive-header ,footer , #printBtn
           {
               display: none;
           }
            
        }
    </style>
@endpush

@section('body-content')

    <!--  Order Details section end -->
    <section class="section-b-space">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product-order">
                        @forelse($order->orderProducts as $product)
                            <div class="row product-order-detail align-items-center">
                                <div class="col-3"><img src="{{ asset($product->product->productDetail->productThumbnail_img) }}" alt="" class="img-fluid blur-up lazyloaded"></div>
                                <div class="col-5 order_detail">
                                    <div>
                                        <h4>product name</h4>
                                        <h5 class="fw-normal">{{$product->product_name}}</h5>
                                    </div>
                                </div>
                                <div class="col-2 order_detail">
                                    <div>
                                        <h4>quantity</h4>
                                        <h5>{{$product->quantity}}</h5>
                                    </div>
                                </div>
                                <div class="col-2 order_detail">
                                    <div>
                                        <h4>price</h4>
                                        <h5>{{$basic_info->currency_symbol}}{{$product->product_price}}</h5>
                                    </div>
                                </div>
                            </div>
                        @empty
                        @endforelse
                        <div class="total-sec">
                            <ul>
                                <li>subtotal <span>{{$basic_info->currency_symbol}}{{$order->subtotal}}</span></li>
                                <li>shipping <span>{{$basic_info->currency_symbol}}{{$order->shipping_charge}}</span></li>
                                {{--                                <li>Coupon discount <span>-{{$basic_info->currency_symbol}} {{$order->coupon_discount}}</span></li>--}}
                            </ul>
                        </div>
                        <div class="final-total mt-4 mb-4">
                            <h3>total <span>{{$basic_info->currency_symbol}}{{$order->total}}</span></h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="order-success-sec">
                        <div class="row">
                            <div class="col-sm-6">
                                <h4>summery</h4>
                                <ul class="order-detail">
                                    <li>Order ID: {{$order->id}}</li>
                                    <li>invoice ID: {{$order->invoiceID}}</li>
                                    {{--                                    <li>Order Date: {{$order->order_date->format('d M Y')}}</li>--}}
                                    <li>Order Total: {{$basic_info->currency_symbol}}{{$order->total}}</li>
                                </ul>
                            </div>
                            <div class="col-sm-6">
                                <h4>shipping address</h4>
                                <ul class="order-detail">
                                    <li>{{$order->customer->address_1}}</li>
                                    <li>{{$order->customer->address_2}}</li>
                                    <li>{{$order->customer->state_district}},{{$order->customer->state_district}}</li>
                                    <li>Contact No. {{$order->customer->phone}}</li>
                                </ul>
                            </div>
                            <div class="col-sm-12 payment-mode mt-3">
                                <h4>payment method</h4>
                                @if($order->payment_status=='paid')
                                    <p>Cash on Delivery</p>
                                @else
                                    <p class="text-uppercase"> {{$order->payment_method}}</p>
                                @endif
                            </div>
                            {{--                            <div class="col-md-12">--}}
                            {{--                                <div class="delivery-sec">--}}
                            {{--                                    <h3>expected date of delivery: <span>october 22, 2018</span></h3>--}}
                            {{--                                    <a href="order-tracking.html">track order</a>--}}
                            {{--                                </div>--}}
                            {{--                            </div>--}}
                        </div>
                    </div>

                    <div class="row" id="printBtn">
                        <div class="col-12 d-flex justify-content-center align-items-center mt-4">
                            <a href="javascript:void(0)" onclick="window.print()" class="btn btn-solid btn-info">Print</a>
                        </div>
                    </div>
                </div>


            </div>


        </div>


    </section>
    <!--  Order Details section end -->

@endsection


@push('add-scripts')

@endpush