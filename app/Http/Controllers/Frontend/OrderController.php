<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Library\SslCommerz\SslCommerzNotification;
use App\Models\Customer;
use App\Models\Order;
use App\Models\OrderProduct;
use Exception;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

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
//        dd($request->all());
//        dd(Session::get('coupon'));

        if (Cart::content()->isEmpty()) {
            return redirect()->back()->with('error',
                'Your cart is empty. Please add items to your cart before placing an order.');
        }
        DB::beginTransaction();
        try {
//            dd($request->all());
            
//            $request->validate([
//                'first_name' => ['required', 'string', 'max:255'],
//                'last_name' => ['string', 'max:255'],
//                'company_name' => ['string', 'max:255'],
//                'address_1' => ['required', 'string', 'max:255'],
//                'address_2' => ['string', 'max:255'],
//                'state_district' => ['string', 'max:255'],
//                'zip' => ['required', 'string', 'max:255'],
//                'country' => ['required', 'string', 'max:255'],
//                'phone' => ['string', 'max:255'],
//                'email' => ['string', 'email', 'max:255'],
//                'area' => ['string', 'max:255'],
//                'thana' => ['string', 'max:255'],
//                'gender' => ['string', 'max:255'],
//                
//            ]);
            
            
//           Create Customer
            $customer = new Customer();
            $customer->first_name = $request->first_name;
            $customer->last_name = $request->last_name;
            $customer->company_name = $request->company_name;
            $customer->address_1 = $request->address_1;
            $customer->address_2 = $request->address_2;
            $customer->state_district = $request->state_district;
            $customer->zip = $request->zip;
            $customer->country = $request->country;
            $customer->phone = $request->phone;
            $customer->email = $request->email;
            $customer->area = $request->area;
            $customer->thana = $request->thana;
            $customer->gender = $request->gender;

            $customer->save();

            $tranId = uniqid();

//          Create Order
            $order = new Order();
            $order->customer_id = $customer->id;
            $order->user_id = auth()->user()->id ?? null;

            if (Session::has('coupon')) {
                $order->coupon_id = Session::get('coupon')['id'];
            }

            $order->invoiceID = 'BM'.rand('100000', '999999');
            $order->tran_id = $tranId;
            $order->payment_method = $request->payment_method;
            $order->shipping_charge = $request->shipping_charge;
            $order->order_note = $request->order_note;
            $order->subtotal = $request->subtotal;
            $order->total = $request->total;
            $order->order_date = today();
            $order->order_status = 'Pending';
            $order->payment_status = 'Pending';
            $order->payment_method = $request->payment_method;

            $order->save();

//          Create Order Products
            foreach (Cart::content() as $cartItem) {
                $orderProduct = new OrderProduct();
                $orderProduct->order_id = $order->id;
                $orderProduct->product_id = $cartItem->id;
                $orderProduct->product_name = $cartItem->name;


                $orderProduct->product_price = $cartItem->price;
                $orderProduct->quantity = $cartItem->qty;
                $orderProduct->total = $cartItem->qty * $cartItem->price;

                $orderProduct->color = $cartItem->options->color;
                $orderProduct->size = $cartItem->options->size;
                $orderProduct->weight = $cartItem->options->weight;
                $orderProduct->purchase_price = $cartItem->options->purchase_price;
                $orderProduct->save();
            }

            DB::commit();
            Cart::destroy();
            Session::forget('coupon');

            if ($request->payment_method == 'sslcommerzz') {
//                dd($request->all());

                $post_data = array();
                $post_data['total_amount'] = $request->total; # You cant not pay less than 10
                $post_data['currency'] = "BDT";
                $post_data['tran_id'] = $tranId; // tran_id must be unique

                # CUSTOMER INFORMATION
                $post_data['cus_name'] = $request->first_name.' '.$request->last_name;
                $post_data['cus_email'] = $request->email ?? 'customer@mail.com';
                $post_data['cus_add1'] = $request->address_1;
                $post_data['cus_add2'] = $request->address_2 ?? '';
                $post_data['cus_city'] = $request->state_district ?? 'Dhaka';
                $post_data['cus_state'] = $request->state_district ?? 'Dhaka';
                $post_data['cus_postcode'] = $request->zip ?? '';
                $post_data['cus_country'] = $request->country ?? 'Bangladesh';
                $post_data['cus_phone'] = $request->phone;
                $post_data['cus_fax'] = "123456";

                # SHIPMENT INFORMATION
                $post_data['ship_name'] = $request->first_name.' '.$request->last_name;
                $post_data['ship_add1'] = $request->address_1;
                $post_data['ship_add2'] = $request->address_2 ?? '';
                $post_data['ship_city'] = $request->state_district ?? 'Dhaka';
                $post_data['ship_state'] = $request->state_district ?? 'Dhaka';
                $post_data['ship_postcode'] = $request->zip ?? '';
                $post_data['ship_phone'] = $request->phone;
                $post_data['ship_country'] = $request->country ?? 'Bangladesh';

                $post_data['shipping_method'] = "NO";
                $post_data['product_name'] = "multivendor";
                $post_data['product_category'] = "Goods";
                $post_data['product_profile'] = "physical-goods";

                $sslc = new SslCommerzNotification();
                # initiate(Transaction Data , false: Redirect to SSLCOMMERZ gateway/ true: Show all the Payement gateway here )
                $payment_options = $sslc->makePayment($post_data, 'hosted');

                if (!is_array($payment_options)) {
                    print_r($payment_options);
                    $payment_options = array();
                }
            }
            return view('frontend.pages.orders.order-success', compact('order' ));
        } catch (Exception $exception) {
            DB::rollBack();
            
            dd($exception->getMessage());
        }
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
