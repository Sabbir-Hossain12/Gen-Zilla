<?php

use App\Http\Controllers\CartController;
use App\Http\Controllers\Frontend\CheckoutController;
use App\Http\Controllers\Frontend\DashboardController;
use App\Http\Controllers\Frontend\OrderController;
use App\Http\Controllers\Frontend\ProductController;
use App\Http\Controllers\Frontend\WebviewController;
use App\Http\Controllers\Frontend\WishlistController;
use App\Http\Controllers\SslCommerzPaymentController;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Route;


//Webview Routes

Route::get('/',[WebviewController::class,'index'])->name('home');

//product routes
Route::get('/product-details/{product:slug}',[ProductController::class,'productDetails'])->name('product-details');
Route::get('/get/price-by-color',[ProductController::class,'getPriceByColor'])->name('get-price-by-color');
Route::get('/get/price-by-size',[ProductController::class,'getPriceBySize'])->name('get-price-by-size');
Route::get('/get/price-by-weight',[ProductController::class,'getPriceByWeight'])->name('get-price-by-weight');

//Cart Routes
Route::resource('/carts',CartController::class)->names('cart');
Route::post('/add-to-cart',[CartController::class,'addToCart'])->name('add-to-cart');
Route::get('cart-data',[CartController::class,'cartData'])->name('cart-data');
Route::post('remove-cart-item',[CartController::class,'removeCartItem'])->name('remove-cart-item');

//Orders
Route::resource('/orders', OrderController::class)->names('order');

//Coupon

Route::post('/apply-coupon',[CheckoutController::class,'applyCoupon'])->name('apply.coupon');

//Checkout
Route::resource('/checkouts', CheckoutController::class)->names('checkout');
Route::post('/shipping-charge-update',[CheckoutController::class,'shippingChargeUpdate'])->name('shipping.charge.update');
Route::get('/cart-calculate',[CheckoutController::class,'cartCalculate'])->name('cart.calculate');


//Webview Controller
Route::get('/about', [WebviewController::class, 'aboutPage'])->name('about');
Route::get('/contact', [WebviewController::class, 'contactPage'])->name('contact');
Route::post('/search-product', [WebviewController::class, 'searchProduct'])->name('search.product');
Route::get('/get-product-by-category/{category:slug}', [WebviewController::class, 'productByCategory'])->name('product.by.category');
Route::get('/get-product-by-subcategory/{subcategory:slug}', [WebviewController::class, 'productBySubCategory'])->name('product.by.subcategory');
Route::get('/get-all-products', [WebviewController::class, 'allProducts'])->name('product.all');

//Route::view('/order-success', 'frontend.pages.orders.order-success')->name('order.success');
Route::view('/order-tracking', 'frontend.pages.orders.order-tracking');
Route::view('/user-profile', 'frontend.pages.dashboard.user-profile');
Route::view('/shop', 'frontend.pages.products.shop-page');

//Wishlist
Route::resource('/wishlists', WishlistController::class)->names('wishlist');
Route::post('/wishlists',[WishlistController::class,'store'])->name('wishlist.store')->middleware('auth');
Route::get('/wishlist-validate', [WishlistController::class, 'wishlistValidate'])->name('wishlist-validate');
//review
Route::get('/get-reviews/{id}', [WebviewController::class, 'getReviews'])->name('get.reviews');
Route::post('/submit-review', [WebviewController::class, 'submitReview'])->name('submit.review');
//Dynamic Theme Color 
Route::get('/get-theme-color',[WebviewController::class,'getThemeColor'])->name('get.theme.color');

//User Dashboard
Route::get('/user-dashboard',[DashboardController::class,'index'])->name('user.dashboard');
Route::post('/update-profile-image',[DashboardController::class,'updateProfileImage'])->name('update.profile.image');
Route::get('/get-profile-details',[DashboardController::class,'getProfileDetails'])->name('get.profile.details');
Route::post('/update-profile-details',[DashboardController::class,'updateProfileDetails'])->name('update.profile.details');
Route::post('/update-password',[DashboardController::class,'updatePassword'])->name('update.password');
Route::get('/order-details/{id}',[DashboardController::class,'orderDetails'])->name('order.details');
// SSLCOMMERZ 
Route::post('/success', [SslCommerzPaymentController::class, 'success']);
Route::post('/fail', [SslCommerzPaymentController::class, 'fail']);
Route::post('/cancel', [SslCommerzPaymentController::class, 'cancel']);
Route::post('/ipn', [SslCommerzPaymentController::class, 'ipn']);

Route::get('check',function (){

    Toastr::success('Success','Your message has been sent successfully.');

    return redirect()->back();
});



require __DIR__.'/auth.php';
require __DIR__.'/admin.php';


//Route::fallback(function () {
//    
//    return view('frontend.pages.static-pages.404');
//});