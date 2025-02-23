<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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
    }

    /**
     * Display the specified resource.
     */
    public function show(Order $order)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Order $order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Order $order)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Order $order)
    {
        //
    }

    public function orderAllData(Request $request)
    {
        $orders = Order::with(['orderProducts', 'customer'])->orderBy( 'id','desc')->latest()->get();
        $allOrdersCount = Order::count();
        $pendingOrderCount = Order::where('order_status', 'Pending')->count();
        $processingOrderCount = Order::where('order_status', 'Processing')->count();
        $shippedOrderCount = Order::where('order_status', 'Shipped')->count();
        $droppedOffOrderCount = Order::where('order_status', 'Dropped_Off')->count();
        $outDeliveryOrderCount = Order::where('order_status', 'Out_Delivery')->count();
        $deliveredOrderCount = Order::where('order_status', 'Delivered')->count();
        $cancelledOrderCount = Order::where('order_status', 'Cancelled')->count();

        if (request()->ajax()) {
            return DataTables::of($orders)
                ->addColumn('customerInfo', function ($order) {
                    return '<span class="text-primary">Info</span>'.'<br>'. $order->customer->first_name.' '.$order->customer->first_name.'<br>'.
                        $order->customer->email.'<br>'.$order->customer->phone.'<br>'.$order->customer->gender
                        .'<br>' .'<span class="text-primary">Address</span>'.'<br>' .$order->customer->address_1.$order->customer->address_2.
                        '<br>' .$order->customer->zip.'<br>' .$order->customer->state_district.'<br>' .$order->customer->area.'<br>'.$order->customer->thana;
                })
                
                
                
                ->addColumn('date', function ($order) {
                    return $order->created_at->format('d M, Y').'<br>'.$order->created_at->format('h:i A');
                })
                ->addColumn('productInfo', function ($order) {
                    $productInfo = '';
                    foreach ($order->orderProducts as $orderProduct) {
                        if ($orderProduct->color && $orderProduct->size && $orderProduct->weight) {
                            $productInfo .= $orderProduct->product_name.'<br>'.
                                $orderProduct->quantity.' x '.$orderProduct->color.
                                ' x '.$orderProduct->size.' x '.$orderProduct->weight.'<br>';
                        } else {
                            if ($orderProduct->color && $orderProduct->size) {
                                $productInfo .= $orderProduct->product_name.'<br>'.
                                    $orderProduct->quantity.' x '.$orderProduct->color.
                                    ' x '.$orderProduct->size.'<br>';
                            } else {
                                if ($orderProduct->color) {
                                    $productInfo .= $orderProduct->product_name.'<br>'.
                                        $orderProduct->quantity.' x '.$orderProduct->color.
                                        '<br>';
                                } else {
                                    if ($orderProduct->size) {
                                        $productInfo .= $orderProduct->product_name.'<br>'.
                                            $orderProduct->quantity.' x '.$orderProduct->size.
                                            '<br>';
                                    } else {
                                        if ($orderProduct->weight) {
                                            $productInfo .= $orderProduct->product_name.'<br>'.
                                                $orderProduct->quantity.' x '.$orderProduct->weight.
                                                '<br>';
                                        }
                                    }
                                }
                            }
                        }
                    }
                    return $productInfo;
                })
                ->addColumn('action', function ($order) {
                    return '<div class="d-flex flex-column gap-2">
                             <a class="viewButton btn btn-sm btn-primary" href="'. route('admin.order.invoice', $order->id).'" ><i class="fas fa-print"></i></a>
                             <a class="editButton btn btn-sm btn-primary" href="javascript:void(0)" data-id="'.$order->id.'" data-bs-toggle="modal" data-bs-target="#editAdminModal"><i class="fas fa-edit"></i></a>
                             <a class="btn btn-sm btn-danger" href="javascript:void(0)" data-id="'.$order->id.'" id="deleteAdminBtn""> <i class="fas fa-trash"></i></a>
                            </div>';
                })
                ->addIndexColumn()
                ->rawColumns(['customerInfo', 'action'])
                ->escapeColumns([])
                ->make(true);
        }
        
        
        return view('backend.pages.order.index', compact([
            'orders', 'allOrdersCount', 'pendingOrderCount', 'processingOrderCount', 'shippedOrderCount',
            'droppedOffOrderCount', 'outDeliveryOrderCount', 'deliveredOrderCount', 'cancelledOrderCount'
        ]));
    }

    public function orderStatusData(string $status)
    {
        $Orders = Order::where('order_status', $status)->get();

        if (request()->ajax()) {
            return DataTables::of($Orders)
                ->addColumn('customerInfo', function ($order) {
                    return $order->customer->first_name.' '.$order->customer->first_name.'<br>'.
                        $order->customer->email.'<br>'.$order->customer->phone;
                })
                ->addColumn('date', function ($order) {
                    return $order->created_at->format('d M, Y').'<br>'.$order->created_at->format('h:i A');
                })
                ->addColumn('productInfo', function ($order) {
                    $productInfo = '';
                    foreach ($order->orderProducts as $orderProduct) {
                        if ($orderProduct->color && $orderProduct->size && $orderProduct->weight) 
                        {
                            $productInfo .= $orderProduct->product_name.'<br>'.
                                $orderProduct->quantity.' x '.$orderProduct->color.
                                ' x '.$orderProduct->size.' x '.$orderProduct->weight.'<br>';
                        } else {
                            if ($orderProduct->color && $orderProduct->size) 
                            {
                                $productInfo .= $orderProduct->product_name.'<br>'.
                                    $orderProduct->quantity.' x '.$orderProduct->color.
                                    ' x '.$orderProduct->size.'<br>';
                            } else {
                                if ($orderProduct->color) 
                                {
                                    $productInfo .= $orderProduct->product_name.'<br>'.
                                        $orderProduct->quantity.' x '.$orderProduct->color.
                                        '<br>';
                                } 
                                else 
                                {
                                    if ($orderProduct->size) {
                                        $productInfo .= $orderProduct->product_name.'<br>'.
                                            $orderProduct->quantity.' x '.$orderProduct->size.
                                            '<br>';
                                    } else {
                                        if ($orderProduct->weight) {
                                            $productInfo .= $orderProduct->product_name.'<br>'.
                                                $orderProduct->quantity.' x '.$orderProduct->weight.
                                                '<br>';
                                        }
                                    }
                                }
                            }
                        }
                    }
                    return $productInfo;
                })
                ->addColumn('action', function ($order) {
                    return '<div class="d-flex flex-column gap-2"><a class="viewButton btn btn-sm btn-primary" href="'. route('admin.order.invoice', $order->id).'"><i class="fas fa-print"></i></a>
                            <a class="editButton btn btn-sm btn-primary" href="javascript:void(0)" data-id="'.$order->id.'" data-bs-toggle="modal" data-bs-target="#editAdminModal"><i class="fas fa-edit"></i></a>
                                                             <a class="btn btn-sm btn-danger" href="javascript:void(0)" data-id="'.$order->id.'" id="deleteAdminBtn""> <i class="fas fa-trash"></i></a>
                                                           </div>';
                })
                ->addIndexColumn()
                ->rawColumns(['customerInfo', 'action'])
                ->escapeColumns([])
                ->make(true);
        }

        return view('backend.pages.order.order-status-data', compact('Orders', 'status'));
    }

    public function orderStatusChange(Request $request)
    {
        $order_status = $request->order_status;
        $order_id = $request->order_id;


        $order = Order::find($order_id);
        $order->order_status = $order_status;
        $order->update();

        return response()->json(['message' => 'Order Status Changed to '.$order_status], 200);
    }


    public function orderPaymentStatusChange(Request $request)
    {
        $order_payment_status = $request->order_payment_status;
        $order_id = $request->order_id;

        $order = Order::find($order_id);
        $order->payment_status = $order_payment_status;
        $order->update();

        return response()->json(['message' => 'Payment Status Changed to '.$order_payment_status], 200);
    }

    public function orderInvoice(string $id)
    {
        $order = Order::find($id);
        return view('backend.pages.order.invoice',compact('order'));
    }


}
