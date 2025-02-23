@extends('frontend.layout.master')

@push('titles')
    EcoBazaar - Bootstrap eCommerce Template
@endpush

@push('add-css')

@endpush

@section('body-content')

    <!-- start Register section -->
    <section class="form-section">
        <div class="container">
            <div class="row">
                <div class="main-form-field">
                    <div class="form-field">
                        <form method="POST" action="{{ route('register') }}">
                            @csrf
                            <h3>Create Account</h3>
                            <div class="mb-3">
                                <input type="text" name="name" value="{{old('name')}}" class="normal-forms"
                                       placeholder="Name *" required>
                            </div>
                            
                            
                            <div class="mb-3">
                                <input type="email" value="{{old('email')}}" name="email" class="normal-forms"
                                       placeholder="Email *" required>
                            </div>


                            <div class="mb-3">
                                <textarea name="address" class="normal-forms"
                                          placeholder="Address">{{old('address')}}</textarea>
                            </div>

                            
                            <div class="mb-3">
                                <input type="text" name="thana" value="{{old('thana')}}" class="normal-forms"
                                       placeholder="Thana">
                            </div>

                            <div class="mb-3">
                                <input type="text" name="area" value="{{old('area')}}" class="normal-forms"
                                       placeholder="area">
                            </div>
                            
                            <div class="mb-3">
                               <select name="gender" id="" class="normal-forms" required>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>

                               </select>
                            </div>
                            
                            
                            <div class="mb-3 password-form">
                                <input type="password" name="password" class="normal-forms" id="password-form"
                                       placeholder="Password *" required>
                                <i class="ri-eye-line" id="password-icon"></i>
                            </div>

                            <div class="mb-3 password-form">
                                <input type="password" name="password_confirmation" class="normal-forms"
                                       id="confirm-password-form" placeholder="Confirm Password *" required>
                                <i class="ri-eye-line" id="confirm-password-icon"></i>
                            </div>

                            {{--                        <div class="remember-form mb-3">--}}
                            {{--                            <input type="checkbox" name="remember" class="remember">--}}
                            {{--                            <span>Accept all terms & Conditions</span>--}}
                            {{--                        </div>--}}

                            <button type="submit" class="form-btn">Sign In</button>

                            <p>Already have account? <a href="{{route('login')}}">Login</a></p>
                        </form>
                    </div><!-- End. form-field -->
                </div><!-- End. main-form-field -->
            </div><!-- End. row -->
        </div><!-- End. container -->
    </section><!-- End. form-section -->

@endsection


@push('add-scripts')

    <script>
        // Password Form icon show-hide
        let password_icon = document.getElementById('password-icon');
        let confirm_password_icon = document.getElementById('confirm-password-icon');
        let password_form = document.getElementById('password-form');
        let confirm_password_form = document.getElementById('confirm-password-form');


        password_icon.addEventListener("click", function () {
            let type = password_form.getAttribute("type");

            if (type === "password") {
                password_form.setAttribute("type", "text");
            } else {
                password_form.setAttribute("type", "password");
            }
        });

        confirm_password_icon.addEventListener("click", function () {
            let types = confirm_password_form.getAttribute("type");

            if (types === "password") {
                confirm_password_form.setAttribute("type", "text");
            } else {
                confirm_password_form.setAttribute("type", "password");
            }
        });
    </script>

@endpush