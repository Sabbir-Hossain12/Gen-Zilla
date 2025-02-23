<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Coupon;
use App\Models\DeliveryCharge;
use App\Models\Order;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class CheckoutController extends Controller
{
    public function index()
    {
        $deliveryCharges= DeliveryCharge::where('status',1)->get();
        return view('frontend.pages.products.checkout',compact('deliveryCharges'));
    }


    public function shippingChargeUpdate(Request $request)
    {
        $shipping_charge = $request->input('shipping_charge');

        $subtotal = str_replace(',', '', Cart::subtotal(0));


        // Calculate the new total
        $total = $subtotal + $shipping_charge;


        return response()->json([
            'subtotal' => $subtotal,
            'shipping_charge' => $shipping_charge,
            'total' => $total,
        ]);
    }




    public function applyCoupon(Request $request)
    {
        $coupon_code = $request->coupon_code;

        // Ensure the user is logged in
        if (!auth()->check()) {
            return response()->json([
                'status' => 'failed',
                'message' => 'You must be logged in to use a coupon'
            ]);
        }

        // Check if the coupon code is provided
        if (empty($coupon_code)) {
            return response()->json([
                'status' => 'failed',
                'message' => 'Please enter a coupon code'
            ]);
        }

        // Find the coupon that meets all the criteria
        $coupon = Coupon::where('code', $coupon_code)
            ->where('status', 1)
            ->where('quantity', '>', 0)
            ->where('start_date', '<=', now()->format('Y-m-d'))
            ->where('expire_date', '>=', now()->format('Y-m-d'))
            ->first();

        // Check if the coupon exists and is valid
        if (!$coupon) {
            return response()->json([
                'status' => 'failed',
                'message' => 'Coupon not found or expired'
            ]);
        }

        // Check if the user has exceeded the maximum usage limit for this coupon
        $usageCount = Order::where('user_id', auth()->id())
            ->where('coupon_id', $coupon->id)
            ->count();

        if ($usageCount >= $coupon->max_used) {
            return response()->json([
                'status' => 'failed',
                'message' => 'You have already used this coupon the maximum number of times'
            ]);
        }

        // Calculate discount and new total amount
        $subtotal = (float) str_replace(',', '', Cart::subtotal(0));
        $discount_amount = ($subtotal * ($coupon->discount / 100));
        $total_amount = $subtotal - $discount_amount;

        // Store coupon details in the session
        Session::put('coupon', [
            'id' => $coupon->id,
            'code' => $coupon->code,
            'discount' => $coupon->discount,
        ]);

        // Return success response
        return response()->json([
            'status' => 'success',
            'message' => 'Coupon applied successfully',
            
        ]);
    }

    public function cartCalculate(Request $request)
    {
        $shippingCharge = $request->input('shipping_charge',0);
        if (Session::has('coupon')) {
            $coupon=Session::get('coupon');
            
            $sub = Cart::subtotal();

            $subtotal = (int) str_replace(',', '', $sub);

            $discount_amount =(int) ($subtotal * ($coupon['discount'] / 100));
            $total_amount = ($subtotal - $discount_amount) + $shippingCharge;
            
            
            return response()->json([
                'status' => 'success',
                'discount_amount' => $discount_amount,
                'total_amount' => $total_amount,
                'shippingCharge' => $shippingCharge
                
            ]);
        }
        else
        {
            $sub = Cart::subtotal();

            $subtotal = (int) str_replace(',', '', $sub);

            
            $total_amount = $subtotal  + $shippingCharge;
            
            return response()->json([
                'status' => 'success',
                'total_amount'=> $total_amount,
                'shippingCharge' => $shippingCharge

            ]);
        }
        
    }

}
