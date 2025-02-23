<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Order;
use App\Models\OrderProduct;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function salesReport(){
        
        $sales= OrderProduct::whereHas('order',function ($q)
        {
            $q->where('order_status','Delivered');
        })->with('order','order.customer','product')->get();
        return view('backend.pages.reports.sales-report',compact('sales'));
    }

    public function categorySalesReport()
    {
        $sales= OrderProduct::whereHas('order',function ($q)
        {
            $q->where('order_status','Delivered');
        })->with('order','order.customer','product','product.category')
            ->get()
            ->groupBy('product.category.category_name');
        
//      dd($sales);
        return view('backend.pages.reports.category-sales-report',compact('sales'));
    }
}
