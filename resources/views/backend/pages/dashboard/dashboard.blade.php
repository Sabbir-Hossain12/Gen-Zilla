@extends('backend.layout.master')

@push('backendCss')
    <link href="{{asset('public/backend')}}/assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css"
          rel="stylesheet" type="text/css">

    <style>
        .card-body thead {
            background: #EEF2F7;
        }
    </style>

@endpush

@section('contents')

    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">Overall</h4>

            </div>
        </div>

    </div>

    {{--  Overall Chart --}}

    <div class="row">
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Orders</span>
                            <h4 class="mb-3">
                                <span class="">{{$allOrderCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Products</span>
                            <h4 class="mb-3">
                                <span class="">{{$allProductCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Categories</span>
                            <h4 class="mb-3">
                                <span class="">{{$allCategoryCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Purchase</span>
                            <h4 class="mb-3">
                                ৳<span class="">{{$allPurchaseCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Sales</span>
                            <h4 class="mb-3">
                                ৳<span class="">{{$allSaleCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Profit</span>
                            <h4 class="mb-3">
                                ৳<span class="">{{$profit}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>

    </div>

{{--    Today --}}
    <div class="row mt-4">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">Today</h4>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Orders</span>
                            <h4 class="mb-3">
                                <span class="">{{$todayOrderCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Products</span>
                            <h4 class="mb-3">
                                <span class="">{{$todayProductCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Categories</span>
                            <h4 class="mb-3">
                                <span class="">{{$todayCategoryCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Purchase</span>
                            <h4 class="mb-3">
                                ৳<span class="">{{$todayPurchaseCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Sales</span>
                            <h4 class="mb-3">
                                ৳<span class="">{{$todaySaleCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Profit</span>
                            <h4 class="mb-3">
                                ৳<span class="">{{$todayProfit}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>

    </div>
    
{{--    Last 7 Days--}}
    <div class="row mt-4">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">Last 7 Days </h4>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Orders</span>
                            <h4 class="mb-3">
                                <span class="">{{$last7DaysOrderCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Products</span>
                            <h4 class="mb-3">
                                <span class="">{{$last7DaysProductCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Categories</span>
                            <h4 class="mb-3">
                                <span class="">{{$last7DaysCategoryCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Purchase</span>
                            <h4 class="mb-3">
                                ৳<span class="">{{$last7DaysPurchaseCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Sales</span>
                            <h4 class="mb-3">
                                ৳<span class="">{{$last7DaysSaleCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Profit</span>
                            <h4 class="mb-3">
                                ৳<span class="">{{$last7DaysProfit}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>

    </div>

    {{--   Last 30 Days --}}
    <div class="row mt-4">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">Last 30 Days</h4>


            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Orders</span>
                            <h4 class="mb-3">
                                <span class="">{{$last30DaysOrderCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Products</span>
                            <h4 class="mb-3">
                                <span class="">{{$last30DaysProductCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Categories</span>
                            <h4 class="mb-3">
                                <span class="">{{$last30DaysCategoryCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Purchase</span>
                            <h4 class="mb-3">
                                ৳<span class="">{{$last30DaysPurchaseCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Sales</span>
                            <h4 class="mb-3">
                                ৳<span class="">{{$last30DaysSaleCount}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <!-- card -->
            <div class="card card-h-100 shadow">
                <!-- card body -->
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-4 text-center  rounded">
                            <i class="fas fa-cart-plus h2"></i>
                        </div>

                        <div class="col-8">
                            <span class="text-muted mb-3 lh-1 d-block text-truncate">Profit</span>
                            <h4 class="mb-3">
                                ৳<span class="">{{$last30DaysProfit}}</span>
                            </h4>

                        </div>


                    </div>

                </div><!-- end card body -->
            </div>
        </div>

    </div>

    {{--   Overall Sales --}}
    <div class="row mt-4">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">

                    <div class="d-flex justify-content-between align-items-center">
                        <h4 class="card-title">Sales Report (Overall)</h4>

                        {{--                        <div>--}}
                        {{--                            <button class="btn btn-success" id="print" onclick="window.print()">Print</button>--}}
                        {{--                            <button class="btn btn-primary" id="print">Export</button>--}}

                        {{--                        </div>--}}

                    </div>

                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped mb-0  nowrap w-100 dataTable no-footer dtr-inline"
                               id="overallSaleReportTable">
                            <thead>
                            <tr>
                                <th>Invoice</th>
                                <th>Customer</th>
                                <th>Phone</th>
                                <th>Product</th>
                                <th>Category</th>
                                <th>Purchase</th>
                                <th>Sale</th>
                                <th>qty</th>
                                <th>Total</th>


                            </tr>
                            </thead>
                            <tbody>
                            @forelse($overallSales as $sale)
                                <tr>
                                    <td>{{$sale->order->invoiceID}}</td>
                                    <td>{{$sale->order->customer->first_name}}</td>
                                    <td>{{$sale->order->customer->phone}}</td>
                                    <td>{{$sale->product_name}}</td>
                                    <td>{{$sale->product->category->category_name}}</td>
                                    <td>{{$sale->purchase_price}}</td>
                                    <td>{{$sale->product_price}}</td>
                                    <td>{{$sale->quantity}}</td>
                                    <td>{{$sale->quantity *$sale->product_price}}</td>
                                </tr>
                            @empty
                            @endforelse
                            </tbody>

                            <tfoot>

                            <tr>
                                <td colspan="8" class="text-center mt-3">
                                    <h5><strong>Total Purchase = {{   $overallSales->sum('purchase_price')}}</strong>
                                    </h5>
                                    <h5><strong>Total Sales = {{$overallSales->sum('total')}}</strong></h5>
                                    <h5><strong>Total Profit
                                            = {{$overallSales->sum('total')-$overallSales->sum('purchase_price')}}</strong>
                                    </h5>
                                </td>
                            </tr>
                            </tfoot>

                        </table>
                    </div>

                </div>
                <!-- end card body -->
            </div>
            <!-- end card -->
        </div>
        <!-- end col -->
    </div>

    {{--  Category Sales  --}}
    <div class="row mt-4">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">

                    <div class="d-flex justify-content-between align-items-center">
                        <h4 class="card-title">Sales Report (Category Wise)</h4>

                        {{--                        <div>--}}
                        {{--                            <button class="btn btn-success" id="print" onclick="window.print()">Print</button>--}}
                        {{--                            <button class="btn btn-primary" id="print">Export</button>--}}

                        {{--                        </div>--}}

                    </div>

                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped mb-0  nowrap w-100 dataTable no-footer dtr-inline"
                               id="adminTable">
                            <thead>
                            <tr>

                                <th>Category</th>
                                <th>Purchase</th>
                                <th>Sale</th>
                                <th>qty</th>
                                <th>Total</th>


                            </tr>
                            </thead>
                            <tbody>
                            @forelse($categorySales as $categoryName => $orderProducts)
                                <tr>
                                    <td>{{ $categoryName }}</td> <!-- Category Name -->

                                    <td>{{ $orderProducts->sum('purchase_price') }}</td> <!-- Sum for this category -->
                                    <td>{{ $orderProducts->sum('total') }}</td> <!-- Sum for this category -->
                                    <td>{{ $orderProducts->sum('quantity') }}</td> <!-- Sum of quantity for category -->
                                    <td>
                                        {{ $orderProducts->sum(function ($orderProduct) {
                                            return $orderProduct->quantity * $orderProduct->product_price;
                                        }) }}
                                    </td>
                                </tr>
                            @empty
                            @endforelse
                            </tbody>

                            <tfoot>

                                                <tr>
                                                    <td colspan="8" class="text-center mt-3">
                                                        <h5><strong>Total Purchase = {{$allPurchaseCount}}</strong></h5>
                                                        <h5><strong>Total Sales = {{$allSaleCount}}</strong></h5>
                                                        <h5><strong>Total Profit
                                                                = {{$profit}}</strong>
                                                        </h5>
                                                    </td>
                                                </tr>
                            </tfoot>

                        </table>
                    </div>

                </div>
                <!-- end card body -->
            </div>
        </div>
    </div>

            <!-- end card -->
            <!-- end col -->

            @endsection

            @push('backendJs')
                <script src="{{asset('public/backend')}}/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
                <script src="{{asset('public/backend')}}/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>

                {{--    <script src=" {{asset('public/backend')}}/assets/libs/apexcharts/apexcharts.min.js"></script>--}}
                <script src=" {{asset('public/backend')}}/assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
                <script src="{{asset('public/backend')}}/assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-world-mill-en.js"></script>
    {{--    <script src=" {{asset('public/backend')}}/assets/js/pages/dashboard.init.js"></script>--}}

                <script>
                    
                    // $(document).ready(function () {
                    //
                    //     $("#overallSaleReportTable").DataTable({
                    //         'searching': false,
                    //         'bLengthChange': false,
                    //         'pageLength':10
                    //     })
                    // });
                </script>
    @endpush