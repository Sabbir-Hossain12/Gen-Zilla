<?php

namespace App\Http\Controllers;


use App\Models\ProductDetail;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data=Cart::content();
        $itemCount=Cart::count();
        $subTotal=Cart::subtotal(0);
        return view('frontend.pages.products.cart',compact('data','itemCount','subTotal'));
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

    public function addToCart(Request $request)
    {
//        dd($request->all());
       $productDetails= ProductDetail::where('product_id', $request->id)->first();
      
        Cart::add([
            'id' => $request->id,
            'name' => $request->name,
            'qty' => $request->qty,
            'price' => $request->price,
            'weight' => 0,
            'options' => [
                'image' => $request->image, 
                'color' => $request->color, 
                'size' => $request->size,
                'weight' => $request->weight,
                'stock'=>$request->stock,
                'purchase_price'=>$productDetails->purchase_price*$request->qty,
                
            ],
        ]);
        
//        dd(Cart::content());
//        return redirect()->back()->with('success', 'Product added to cart successfully.');
        return response()->json(['message'=>'success'],200);
    }

    public function cartData()
    {
        $data=Cart::content();
        $itemCount=Cart::count();
        $subTotal=Cart::subtotal(0);
        
//        dd($data);
      
       
     
        return response()->json(['data'=>$data,'count'=>$itemCount,'subTotal'=>$subTotal],200);
    }

    public function removeCartItem(Request $request)
    {
        $rowId=$request->rowId;
        Cart::remove($rowId);
        return response()->json(['message'=>'success'],200);
        
    }
}
