<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\Product;
use Carbon\Carbon;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $overallSales = OrderProduct::whereHas('order', function ($q) {
            $q->where('order_status', 'Delivered');
        })->with('order', 'order.customer', 'product')->get();

        $categorySales = OrderProduct::whereHas('order', function ($q) {
            $q->where('order_status', 'Delivered');
        })->with('order', 'order.customer', 'product', 'product.category')
            ->get()
            ->groupBy('product.category.category_name');

        $allOrderCount = Order::count();
        $allProductCount = Product::count();
        $allCategoryCount = Category::count();
        $allSaleCount = Order::where('order_status', 'Delivered')->sum('subtotal');
        $allPurchaseCount = OrderProduct::whereHas('order', function ($q) {
            $q->where('order_status', 'Delivered');
        })->sum('purchase_price');

        $profit = $allSaleCount - $allPurchaseCount;


        $last30Days = now()->subDays(30);

        $last30DaysOrderCount = Order::where('created_at', '>=', $last30Days)->count();
        $last30DaysProductCount = Product::where('created_at', '>=', $last30Days)->count();
        $last30DaysCategoryCount = Category::where('created_at', '>=', $last30Days)->count();

        $last30DaysSaleCount = Order::where('order_status', 'Delivered')->where('created_at', '>=',
            $last30Days)->sum('subtotal');
        $last30DaysPurchaseCount = OrderProduct::whereHas('order', function ($q) {
            $q->where('order_status', 'Delivered');
        })->where('created_at', '>=', $last30Days)->sum('purchase_price');

        $last30DaysProfit = $last30DaysSaleCount - $last30DaysPurchaseCount; //last 30 days profit

        //daily report


        $today = Carbon::today(); // Gets today's date

// Count all orders created today
        $todayOrderCount = Order::whereDate('created_at', $today)->count();

// Count all products added today
        $todayProductCount = Product::whereDate('created_at', $today)->count();

// Count all categories added today
        $todayCategoryCount = Category::whereDate('created_at', $today)->count();

// Sum of sales (subtotal) for delivered orders today
        $todaySaleCount = Order::where('order_status', 'Delivered')
            ->whereDate('created_at', $today)
            ->sum('subtotal');

// Sum of purchase prices for delivered orders today
        $todayPurchaseCount = OrderProduct::whereHas('order', function ($q) use ($today) {
            $q->where('order_status', 'Delivered');
        })->whereDate('created_at', $today)
            ->sum('purchase_price');

// Calculate today's profit
        $todayProfit = $todaySaleCount - $todayPurchaseCount;

//Last 7 days

        $last7Days = now()->subDays(7); // Get date 7 days ago

// Count all orders created in the last 7 days
        $last7DaysOrderCount = Order::where('created_at', '>=', $last7Days)->count();

// Count all products added in the last 7 days
        $last7DaysProductCount = Product::where('created_at', '>=', $last7Days)->count();

// Count all categories added in the last 7 days
        $last7DaysCategoryCount = Category::where('created_at', '>=', $last7Days)->count();

// Sum of sales (subtotal) for delivered orders in the last 7 days
        $last7DaysSaleCount = Order::where('order_status', 'Delivered')
            ->where('created_at', '>=', $last7Days)
            ->sum('subtotal');

// Sum of purchase prices for delivered orders in the last 7 days
        $last7DaysPurchaseCount = OrderProduct::whereHas('order', function ($q) use ($last7Days) {
            $q->where('order_status', 'Delivered');
        })->where('created_at', '>=', $last7Days)
            ->sum('purchase_price');

// Calculate last 7 days profit
        $last7DaysProfit = $last7DaysSaleCount - $last7DaysPurchaseCount;


        return view('backend.pages.dashboard.dashboard', compact(
            'allOrderCount', 'allProductCount', 'allCategoryCount',
            'allSaleCount', 'allPurchaseCount', 'profit', 'categorySales', 'overallSales',
            'last30DaysOrderCount', 'last30DaysProductCount', 'last30DaysCategoryCount',
            'last30DaysSaleCount', 'last30DaysPurchaseCount', 'last30DaysProfit',
            'todayOrderCount',
            'todayProductCount',
            'todayCategoryCount',
            'todaySaleCount',
            'todayPurchaseCount',
            'todayProfit',
            'last7DaysOrderCount',
            'last7DaysProductCount',
            'last7DaysCategoryCount',
            'last7DaysSaleCount',
            'last7DaysPurchaseCount',
            'last7DaysProfit'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
