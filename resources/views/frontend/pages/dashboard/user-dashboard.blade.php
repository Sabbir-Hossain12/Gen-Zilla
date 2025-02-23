@extends('frontend.layout.master')

@push('titles')
    EcoBazaar - Bootstrap eCommerce Template
@endpush

@push('add-css')
    <link rel="stylesheet" href="{{ asset('public/frontend/assets/css/custom.css') }}">
@endpush

@section('body-content')

    <!--  dashboard section start -->
    <section class="dashboard-section section-b-space user-dashboard-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="dashboard-sidebar">
                        <div class="profile-top">
                            <div class="profile-image">
                                <img src="{{asset($user->profile_pic ?? 'public/frontend/assets/images/all-icons/avtar.jpg')}}"
                                     alt=""
                                     class="img-fluid" id="profile_id">
                                <form id="profileForm" method="post" action="{{route('update.profile.image')}}"
                                      enctype="multipart/form-data">
                                    @csrf
                                    <input class="form-control text-center mt-2" type="file" name="profile_pic"
                                           id="profile_pic"
                                           oninput="profile_id.src=window.URL.createObjectURL(this.files[0])" required>
                                    <div class="text-center mt-2">
                                        <button class="btn btn-danger text-center">Upload</button>
                                    </div>
                                </form>
                            </div>
                            <div class="profile-detail">
                                <h5>{{Auth::user()->name ?? ''}}</h5>
                                <h6>{{Auth::user()->email ?? ''}}</h6>
                            </div>
                        </div>

                        <div class="faq-tab">
                            <ul class="nav nav-tabs" id="top-tab" role="tablist">
                                <li class="nav-item"><a data-bs-toggle="tab" data-bs-target="#info"
                                                        class="nav-link active">Account Info</a></li>

                                <li class="nav-item"><a data-bs-toggle="tab" data-bs-target="#orders"
                                                        class="nav-link">My Orders</a></li>
                                <li class="nav-item"><a data-bs-toggle="tab" data-bs-target="#wishlist"
                                                        class="nav-link">My Wishlist</a></li>

                                <li class="nav-item"><a data-bs-toggle="tab" data-bs-target="#profile"
                                                        class="nav-link">Profile</a></li>

                                <li class="nav-item">
                                    <form action="{{route('logout')}}" method="post">
                                        @csrf
                                        <button type="submit" class="nav-link">Log Out</button>
                                    </form>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>

                <div class="col-lg-9">
                    <div class="faq-content tab-content" id="top-tabContent">
                        <div class="tab-pane fade show active" id="info">
                            <div class="counter-section">
                                <div class="welcome-msg">
                                    <h4>Hello, {{Auth::user()->name ?? ''}} !</h4>
                                    <p>From your My Account Dashboard you have the ability to view a snapshot of your
                                        recent
                                        account activity and update your account information. Select a link below to
                                        view or
                                        edit information.</p>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="counter-box">
                                            <img src="{{ asset('public/frontend/assets/images/all-icons/sale.png') }}"
                                                 class="img-fluid">
                                            <div>
                                                <h3>{{$total_orders ?? '0'}}</h3>
                                                <h5>Total Order</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="counter-box">
                                            <img src="{{ asset('public/frontend/assets/images/all-icons/homework.png') }}"
                                                 class="img-fluid">
                                            <div>
                                                <h3>{{$pending_orders ?? '0'}}</h3>
                                                <h5>Pending Orders</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="counter-box">
                                            <img src="{{ asset('public/frontend/assets/images/all-icons/order.png') }}"
                                                 class="img-fluid">
                                            <div>
                                                <h3>{{$wishlists ?? '0'}}</h3>
                                                <h5>Wishlist</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <div class="tab-pane fade" id="orders">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card dashboard-table mt-0">
                                        <div class="card-body">
                                            <div class="top-sec">
                                                <h3>My Orders</h3>
                                            </div>

                                            <div class="table-responsive-lg">
                                                <table class="table table-striped">
                                                    <thead>
                                                    <tr class="table-head">
                                                        <th scope="col">SL</th>
                                                        <th scope="col">Invoice Id</th>
                                                        <th scope="col">Product Details</th>
                                                        <th scope="col">Status</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">View</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    @forelse($user->orders as $key => $order)
                                                        <tr>
                                                            <td>
                                                                {{$loop->iteration}}
                                                            </td>
                                                            <td>
                                                                <p>{{$order->invoiceID}}</p>
                                                            </td>
                                                            <td>
                                                                @forelse($order->orderProducts as $product)
                                                                    <p class="fs-6 mb-1">{{$product->product_name}}
                                                                        X{{$product->quantity}}</p>

                                                                    @if(isset($product->size) && isset($product->color) && isset($product->weight))
                                                                        <p>Size: <span
                                                                                    class="text-primary">{{$product->size}}</span>
                                                                        </p>
                                                                        <p>Color : <span
                                                                                    class="text-primary">{{$product->color}}</span>
                                                                        </p>
                                                                        <p>Weight: <span
                                                                                    class="text-primary">{{$product->weight}}</span>
                                                                        </p>

                                                                    @elseif(isset($product->size) && isset($product->color))
                                                                        <p>Size: <span
                                                                                    class="text-primary">{{$product->size}}</span>
                                                                        </p>
                                                                        <p>Color: <span
                                                                                    class="text-primary">{{$product->color}}</span>
                                                                        </p>

                                                                    @elseif(isset($product->size))
                                                                        <p class="text-primary">Size:
                                                                            <span>{{$product->size}}</span></p>
                                                                    @endif

                                                                @empty
                                                                @endforelse
                                                            </td>
                                                            <td>
                                                                <span class="badge rounded-pill bg-danger custom-badge">{{$order->status}}</span>
                                                            </td>
                                                            <td>
                                                                <p class="theme-color fs-6">{{$basic_info->currency_symbol}}{{$order->total}}</p>
                                                            </td>
                                                            <td>
                                                                <a href="{{route('order.details', $order->id)}}">
                                                                    <i class="fa fa-eye text-theme"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    @empty
                                                    @endforelse
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="wishlist">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card dashboard-table mt-0">
                                        <div class="card-body">
                                            <div class="top-sec">
                                                <h3>My Wishlist</h3>
                                            </div>
                                            <div class="table-responsive-md">
                                                <table class="table table-striped">
                                                    <thead>
                                                    <tr class="table-head">
                                                        <th scope="col">image</th>
                                                        <th scope="col">Product Name</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Details</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    @forelse($user->wishlists as $key => $wishlist)
                                                        <tr>
                                                            <td>
                                                                <a href="javascript:void(0)">
                                                                    <img src="{{ asset($wishlist->product->productDetail->productThumbnail_img) }}"
                                                                         class="blur-up lazyloaded" alt="">
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <p class="mt-0">{{$wishlist->product->product_name}}</p>
                                                            </td>
                                                            <td>
                                                                @if(count($wishlist->product->weights)>0)
                                                                    <p>{{$basic_info->currency_symbol}}{{ $wishlist->product->weights[0]->productSalePrice }} </p>
                                                                @elseif(count($wishlist->product->sizes)>0)
                                                                    <p>{{$basic_info->currency_symbol}}{{ $wishlist->product->sizes[0]->productSalePrice }} </p>
                                                                @else
                                                                    <p>{{$basic_info->currency_symbol}}{{ $wishlist->product->colors[0]->productSalePrice }} </p>
                                                                @endif
                                                            </td>

                                                            <td>
                                                                <a href="{{route('product-details', $wishlist->product->slug)}}"
                                                                   class="btn btn-xs btn-solid">
                                                                    Product Details
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    @empty
                                                    @endforelse


                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="payment">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card mt-0">
                                        <div class="card-body">
                                            <div class="top-sec">
                                                <h3>Saved Cards</h3>
                                                <a href="#" class="btn btn-sm btn-solid">+ add new</a>
                                            </div>
                                            <div class="address-book-section">
                                                <div class="row g-4">
                                                    <div class="select-box active col-xl-4 col-md-6">
                                                        <div class="address-box">
                                                            <div class="bank-logo">
                                                                <img src="{{ asset('public/frontend/assets/images/all-icons/bank-logo.png') }}"
                                                                     class="bank-logo">
                                                                <img src="{{ asset('public/frontend/assets/images/all-icons/visa.png') }}"
                                                                     class="network-logo">
                                                            </div>
                                                            <div class="card-number">
                                                                <h6>Card Number</h6>
                                                                <h5>6262 6126 2112 1515</h5>
                                                            </div>
                                                            <div class="name-validity">
                                                                <div class="left">
                                                                    <h6>name on card</h6>
                                                                    <h5>Mark Jecno</h5>
                                                                </div>
                                                                <div class="right">
                                                                    <h6>validity</h6>
                                                                    <h5>XX/XX</h5>
                                                                </div>
                                                            </div>
                                                            <div class="bottom">
                                                                <a href="javascript:void(0)"
                                                                   data-bs-target="#edit-address"
                                                                   data-bs-toggle="modal" class="bottom_btn">edit</a>
                                                                <a href="#" class="bottom_btn">remove</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="select-box col-xl-4 col-md-6">
                                                        <div class="address-box">
                                                            <div class="bank-logo">
                                                                <img src="{{ asset('public/frontend/assets/images/all-icons/bank-logo1.png') }}"
                                                                     class="bank-logo">
                                                                <img src="{{ asset('public/frontend/assets/images/all-icons/visa.png') }}"
                                                                     class="network-logo">
                                                            </div>
                                                            <div class="card-number">
                                                                <h6>Card Number</h6>
                                                                <h5>6262 6126 2112 1515</h5>
                                                            </div>
                                                            <div class="name-validity">
                                                                <div class="left">
                                                                    <h6>name on card</h6>
                                                                    <h5>Mark Jecno</h5>
                                                                </div>
                                                                <div class="right">
                                                                    <h6>validity</h6>
                                                                    <h5>XX/XX</h5>
                                                                </div>
                                                            </div>
                                                            <div class="bottom">
                                                                <a href="javascript:void(0)"
                                                                   data-bs-target="#edit-address"
                                                                   data-bs-toggle="modal" class="bottom_btn">edit</a>
                                                                <a href="#" class="bottom_btn">remove</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="profile">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card mt-0">
                                        <div class="card-body">
                                            <div class="dashboard-box">
                                                <div class="dashboard-title">
                                                    <h4>profile</h4>

                                                </div>
                                                <div class="dashboard-detail">
                                                    <form id="updateProfileForm">
                                                        @csrf
                                                        <div class="form-group">
                                                            <input type="text" name="name" id="name"
                                                                   class="form-control" placeholder="Name">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" name="company_name" id="company_name"
                                                                   class="form-control"
                                                                   placeholder="Company Name (optional)">
                                                        </div>

                                                        <div class="form-group">
                                                            <input type="text" name="email" id="email"
                                                                   class="form-control" placeholder="Email">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" name="phone" id="phone"
                                                                   class="form-control" placeholder="Phone">
                                                        </div>

                                                        <div class="form-group">
                                                            <select name="gender" id="gender" class="form-control" required>
                                                                <option value="male">Male</option>
                                                                <option value="female">Female</option>
                                                                <option value="other">Other</option>

                                                            </select>
                                                        </div>

                                                        <div class="form-group">
                                                            <input type="text" name="address" id="address"
                                                                   class="form-control" placeholder="Address">
                                                        </div>

                                                        <div class="form-group">
                                                            <input type="text" name="state_district" id="state_district"
                                                                   class="form-control" placeholder="State/District">
                                                        </div>

                                                        <div class="form-group">
                                                            <input type="text" name="thana" id="thana" class="form-control"
                                                                   placeholder="Thana">
                                                        </div>

                                                        <div class="form-group">
                                                            <input type="text" name="area" id="area"  class="form-control"
                                                                   placeholder="area">
                                                        </div>
                                                        
                                                        <div class="form-group">
                                                            <input type="text" name="zip_code" id="zip_code"
                                                                   class="form-control" placeholder="Zip Code">
                                                        </div>


                                                        <button type="submit" class="btn btn-lg btn-danger">Save
                                                        </button>
                                                    </form>
                                                </div>


                                                <div class="dashboard-title mt-lg-5 mt-3">
                                                    <h4>Change Password</h4>

                                                </div>
                                                <div class="dashboard-detail">
                                                    <form id="changePasswordForm">
                                                        @csrf
                                                        <div class="form-group">
                                                            <input type="password" name="old_password"
                                                                   class="form-control" value=""
                                                                   placeholder="Old Password" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <input type="password" name="password" class="form-control"
                                                                   value="" placeholder="New Password" required>
                                                        </div>

                                                        <button type="submit" class="btn btn-lg btn-danger">Save
                                                        </button>

                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--  dashboard section end -->

@endsection


@push('add-scripts')
    <script>
        getProfileData();

        //Read Profile Info
        function getProfileData() {

            $.ajax({
                type: "GET",
                url: "{{route('get.profile.details')}}",
                success: function (response) {
                    $('#name').val(response.name);
                    $('#company_name').val(response.company_name);
                    $('#email').val(response.email);
                    $('#phone').val(response.phone);
                    $('#address').val(response.address);
                    $('#state_district').val(response.state_district);
                    $('#zip_code').val(response.zip_code);
                    $('#gender').val(response.gender);
                    $('#thana').val(response.thana);
                    $('#area').val(response.area);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }


        //Update Profile Info
        $('#updateProfileForm').submit(function (e) {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "{{route('update.profile.details')}}",
                data: new FormData(this),
                processData: false,
                contentType: false,

                success: function (response) {
                    getProfileData();
                    toastr.success(response.message);

                },
                error: function (error) {
                    toastr.error(error.responseJSON.message);
                }
            });
        });


        //Change Password
        $('#changePasswordForm').submit(function (e) {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "{{route('update.password')}}",
                data: new FormData(this),
                processData: false,
                contentType: false,

                success: function (response, xyz, status) {

                    $('#changePasswordForm').trigger('reset');
                    toastr.success(response.message);

                },
                error: function (error) {
                    toastr.error(error.responseJSON.message);
                }
            });
        });


    </script>
@endpush