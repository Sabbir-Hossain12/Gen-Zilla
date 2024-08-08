<?php

use App\Http\Controllers\Frontend\ProductController;
use App\Http\Controllers\Frontend\WebviewController;
use Illuminate\Support\Facades\Route;


//Webview Routes

Route::get('/',[WebviewController::class,'index'])->name('home');
Route::get('/product-details/{product:slug}',[ProductController::class,'productDetails'])->name('product-details');
Route::get('/get/price-by-color',[ProductController::class,'getPriceByColor'])->name('get-price-by-color');
Route::get('/get/price-by-size',[ProductController::class,'getPriceBySize'])->name('get-price-by-size');
Route::get('/get/price-by-weight',[ProductController::class,'getPriceByWeight'])->name('get-price-by-weight');


Route::get('/user-dashboard',[WebviewController::class,'userDashboard'])->name('user-dashboard');


Route::view('/checkout', 'frontend.pages.products.checkout');
Route::view('/cart', 'frontend.pages.products.cart');
Route::view('/wishlist', 'frontend.pages.products.wishlist');


Route::view('/about', 'frontend.pages.static-pages.about');
Route::view('/contact', 'frontend.pages.static-pages.contact');
Route::view('/order-success', 'frontend.pages.orders.order-success');
Route::view('/order-tracking', 'frontend.pages.orders.order-tracking');
Route::view('/user-profile', 'frontend.pages.dashboard.user-profile');
Route::view('/shop', 'frontend.pages.products.shop-page');






require __DIR__.'/auth.php';
require __DIR__.'/admin.php';


Route::fallback(function () {
    
    return view('frontend.pages.static-pages.404');
});