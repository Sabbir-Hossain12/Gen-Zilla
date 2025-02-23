@extends('backend.layout.master')

@push('backendCss')
    {{--    <meta name="csrf_token" content="{{ csrf_token() }}" />--}}

    <link href="{{asset('public/backend')}}/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css"
          rel="stylesheet" type="text/css">
    <link href="{{asset('public/backend')}}/assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css"
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
                <h4 class="mb-sm-0 font-size-18">Category Wise Sales Report</h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Pages</a></li>
                        <li class="breadcrumb-item active">Category Sales</li>
                    </ol>
                </div>


            </div>
        </div>
    </div>

    {{-- Table Starts--}}

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">

                    <div class="d-flex justify-content-between align-items-center">
                        <h4 class="card-title">Category Wise Sales Report</h4>

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
                            @forelse($sales as $categoryName => $orderProducts)
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
{{--                                <td colspan="8" class="text-center mt-3">--}}
{{--                                    <h5><strong>Total Purchase = {{$sales->sum('purchase_price')}}</strong></h5>--}}
{{--                                    <h5><strong>Total Sales = {{$sales->sum('product_price')}}</strong></h5>--}}
{{--                                    <h5><strong>Total Profit = {{$sales->sum('product_price')-$sales->sum('purchase_price')}}</strong></h5>--}}
{{--                                </td>--}}
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

    {{--    Table Ends--}}

@endsection

@push('backendJs')

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="{{asset('public/backend')}}/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="{{asset('public/backend')}}/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>


    <script>

        $(document).ready(function () {


            var token = $("input[name='_token']").val();

            //Show Data through Datatable 
            let adminTable = $('#adminTable').DataTable(
                {
                    'searching': false,

                }
            )
        })
    </script>
@endpush