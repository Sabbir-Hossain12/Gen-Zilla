<?php

use App\Http\Controllers\Backend\AdminController;
use App\Http\Controllers\Backend\AdminPermissionController;
use App\Http\Controllers\Backend\AdminRoleController;
use App\Http\Controllers\Backend\AttributeController;
use App\Http\Controllers\Backend\AttrvalueController;
use App\Http\Controllers\Backend\Auth\LoginController;
use App\Http\Controllers\Backend\Auth\RegisterController;
use App\Http\Controllers\Backend\BannerController;
use App\Http\Controllers\Backend\BasicinfoController;
use App\Http\Controllers\Backend\BrandsController;
use App\Http\Controllers\Backend\CategoryController;
use App\Http\Controllers\Backend\CouponController;
use App\Http\Controllers\Backend\DashboardController;
use App\Http\Controllers\Backend\DeliveryChargeController;
use App\Http\Controllers\Backend\OrderController;
use App\Http\Controllers\Backend\PagesController;
use App\Http\Controllers\Backend\ProductsController;
use App\Http\Controllers\Backend\ProfileController;
use App\Http\Controllers\Backend\ReportController;
use App\Http\Controllers\Backend\ReviewController;
use App\Http\Controllers\Backend\SliderController;
use App\Http\Controllers\Backend\SubcategoryController;
use App\Http\Controllers\Backend\ThemeColorController;
use App\Http\Controllers\Backend\UserController;
use Illuminate\Support\Facades\Route;

//Admin Auth Routes
Route::prefix('admin')->group(function () {
    Route::get('register', [RegisterController::class, 'create'])
        ->name('admin.register');

    Route::post('register', [RegisterController::class, 'store'])->name('admin.register.store');

    Route::get('login', [LoginController::class, 'create'])
        ->name('admin.login');

    Route::post('login', [LoginController::class, 'store'])->name('admin.login.store');

});

Route::prefix('admin')->middleware('admin')->group(function () {


    Route::post('logout', [LoginController::class, 'destroy'])
        ->name('admin.logout');
});



//______ Admin Panel Starts _____//

Route::prefix('admin')->middleware('admin')->group(function () {

    //______ Dashboard _____//
    Route::resource('/dashboard', DashboardController::class)->names('admin.dashboard');

    //______ Admins _____//
    Route::resource('/admins', AdminController::class)->names('admin.admins');
    Route::post('/change-admin-status', [AdminController::class, 'changeAdminStatus'])->name('admin.status');
    Route::get('/data', [AdminController::class, 'getData'])->name('admin.data');

    //______ Role and Permission _____//
    Route::resource('/roles', AdminRoleController::class)->names('admin.role');
    Route::resource('/permissions', AdminPermissionController::class)->names('admin.permission');
    Route::get('/roles-data', [AdminRoleController::class, 'getData'])->name('admin.role.data');
    Route::get('/permissions-data', [AdminPermissionController::class, 'getData'])->name('admin.permission.data');

    Route::get('/assign-permission-page/{id}', [AdminRoleController::class, 'assignPermissionsToRolePage'])->name('role.permission.edit');
    Route::put('role/{id}/permission/update', [AdminRoleController::class, 'assignPermissionsToRole'])->name('role.permission.update');


    //______ Users _____//
    Route::resource('/users', UserController::class)->names('admin.user');
    Route::get('/users-data', [UserController::class, 'getData'])->name('user.data');


    //______ Sliders _____//
    Route::resource('/sliders', SliderController::class)->names('admin.slider');


    //______ Banners _____//
    Route::resource('/banners', BannerController::class)->names('admin.banner');


    //______ Category _____//
    Route::resource('/categories', CategoryController::class)->names('admin.category');
    Route::get('/category-data', [CategoryController::class, 'getData'])->name('admin.category-data');
    Route::post('/categories/front-status', [CategoryController::class, 'changeCategoryFrontStatus'])->name('admin.category.frontStatus');
    Route::post('/categories/topCategory-status', [CategoryController::class, 'changeTopCategoryStatus'])->name('admin.category.topCategoryStatus');
    Route::post('/categories/status', [CategoryController::class, 'changeCategoryStatus'])->name('admin.category.status');
    Route::get('/categories/edit/{id}', [CategoryController::class, 'categoryEdit'])->name('category.edit');
    Route::get('/get-subcategory/{category}', [CategoryController::class, 'getSubCategories'])->name('admin.get.subcategory');

    //______ Subcategory _____//
    Route::resource('/subcategories', SubcategoryController::class)->names('admin.subcategory');
    Route::get('/subcategory-data', [SubcategoryController::class, 'getData'])->name('admin.subcategory-data');
    Route::post('/subcategory/status', [SubcategoryController::class, 'changeSubCategoryStatus'])->name('admin.subcategory.status');
    Route::get('/subcategory/edit/{id}', [SubcategoryController::class, 'subCategoryEdit'])->name('subcategory.edit');


    //______ Brand _____//
    Route::resource('/brands', BrandsController::class)->names('admin.brand');
    Route::get('/brand-data', [BrandsController::class, 'getData'])->name('admin.brand-data');
    Route::post('/change-brand-status', [BrandsController::class, 'changeBrandStatus'])->name('admin.brand.status');

    //______ Product _____//
    Route::resource('/products', ProductsController::class)->names('admin.product');
    Route::get('/product-data', [ProductsController::class, 'getData'])->name('admin.product-data');
    Route::get('/weight-variant-info',[ProductsController::class,'weightVariantInfo'])->name('admin.weight-variant-info');
    Route::get('/color-variant-info',[ProductsController::class,'colorVariantInfo'])->name('admin.weight-variant-info');
    Route::get('/size-variant-info',[ProductsController::class,'sizeVariantInfo'])->name('admin.weight-variant-info');

    Route::post('/change-product-status', [ProductsController::class, 'statusUpdate'])->name('admin.product.status');
    Route::post('/change-product-featured-status', [ProductsController::class, 'featuredStatusUpdate'])->name('admin.product.featuredStatus');
    Route::post('/change-product-hot-status', [ProductsController::class, 'hotStatusUpdate'])->name('admin.product.hotStatus');
    Route::post('/change-product-popular-status', [ProductsController::class, 'popularStatusUpdate'])->name('admin.product.popularStatus');

    Route::post('/upload-ckeditor-image', [ProductsController::class, 'uploadCkeditorImage'])->name('admin.ckeditor.upload');
    
    //______ Orders _____//
    Route::resource('/orders', OrderController::class)->names('admin.order');
    
    Route::get('/order-all-data', [OrderController::class, 'orderAllData'])->name('admin.order.all.data');
    Route::get('/order/{status}', [OrderController::class, 'orderStatusData'])->name('admin.order.status.data');
    Route::post('/order-status-change', [OrderController::class, 'orderStatusChange'])->name('admin.order.status.change');
    Route::post('/order-payment-status-change', [OrderController::class, 'orderPaymentStatusChange'])->name('admin.payment.status.change');
    
    //____Invoice and Print Invoice___//
    Route::get('/order-invoice/{id}', [OrderController::class, 'orderInvoice'])->name('admin.order.invoice');
    
    Route::post('/change-order-status', [OrderController::class, 'changeOrderStatus'])->name('admin.order.status');
    
    //______ Sliders _____//
    Route::resource('/sliders',SliderController::class)->names('admin.slider');
    Route::get('/slider-data',[SliderController::class,'getData'])->name('admin.slider-data');
    Route::post('/change-slider-status',[SliderController::class,'changeSliderStatus'])->name('admin.slider.status');

    //______ Banners _____//
    Route::resource('/banners',BannerController::class)->names('admin.banner');
    Route::get('/banners-data',[BannerController::class,'getData'])->name('admin.banner-data');
    Route::post('/change-banners-status',[BannerController::class,'changeBannerStatus'])->name('admin.banner.status');


    //______ Attribute _____//
    Route::resource('/attributes', AttributeController::class)->names('admin.attribute');
    Route::get('/attribute-data',[AttributeController::class,'getData'])->name('admin.attribute-data');

    //______ Attribute Value _____//
    Route::resource('/attribute-values', AttrvalueController::class)->names('admin.attribute-value');
    Route::get('/attribute-values-data',[AttrvalueController::class,'getData'])->name('admin.attrvalue-data');


    //______ Profile _____//
    Route::get('/profiles', [ProfileController::class, 'create'])->name('admin.profile');
    Route::post('/check-current-pass', [ProfileController::class, 'check_curr_pass']);
    Route::post('/update-password', [ProfileController::class, 'update_password']);
    Route::post('/update-admin-details', [ProfileController::class, 'update_admin_info']);


    //______ Pages _____//
    Route::resource('/pages', PagesController::class)->names('admin.pages');
    Route::post('/change-pages-status', [PagesController::class, 'changePagesStatus']);

    //______ Coupon _____//
    Route::resource('/coupons', CouponController::class)->names('admin.coupons');
    Route::get('/coupon-data', [CouponController::class, 'getData'])->name('admin.coupon-data');
    Route::post('/change-coupon-status', [CouponController::class, 'changeCouponStatus'])->name('admin.coupon.status');

    //______ Settings _____//
    Route::resource('/basic-info', BasicinfoController::class)->names('admin.basic');
    Route::resource('/delivery-charges', DeliveryChargeController::class)->names('admin.delivery');
    Route::post('/change-delivery-status', [DeliveryChargeController::class, 'changeDeliveryStatus'])->name('admin.delivery.status');
    
    //______ Review _____//
    Route::resource('/reviews', ReviewController::class)->names('admin.reviews');
    Route::get('/review-data', [ReviewController::class, 'getData'])->name('admin.review-data');
    Route::post('/change-review-status', [ReviewController::class, 'changeReviewStatus'])->name('admin.review.status');

    //______ Theme Color _____//
    Route::resource('/theme-colors', ThemeColorController::class)->names('admin.theme');
    
    //______Report_________//
    Route::get('/sales-report', [ReportController::class, 'salesReport'])->name('admin.sales.report');
    Route::get('/category-sales-report', [ReportController::class, 'categorySalesReport'])->name('admin.category-sales.report');
    
});
