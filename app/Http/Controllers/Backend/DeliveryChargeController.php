<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\DeliveryCharge;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Yajra\DataTables\Facades\DataTables;

class DeliveryChargeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $deliveryCharges = DeliveryCharge::all();


            return DataTables::of($deliveryCharges)
                ->addColumn('status', function ($deliveryCharge) {
//                    if(Auth::guard('admin')->user()->can('Status Admin')) {
                    if ($deliveryCharge->status == 1) {
                        return ' <a class="status" id="adminStatus" href="javascript:void(0)"
                                               data-id="'.$deliveryCharge->id.'" data-status="'.$deliveryCharge->status.'"> <i
                                                        class="fa-solid fa-toggle-on fa-2x"></i>
                                            </a>';
                    } else {
                        return '<a class="status" id="adminStatus" href="javascript:void(0)"
                                               data-id="'.$deliveryCharge->id.'" data-status="'.$deliveryCharge->status.'"> <i
                                                        class="fa-solid fa-toggle-off fa-2x" style="color: grey"></i>
                                            </a>';
                    }
//                    }

                })
                ->addColumn('action', function ($deliveryCharge) {
                    $editAction = '';
                    $deleteAction = '';

//                    if(Auth::guard('admin')->user()->can('Edit Admin')) {

                    $editAction = '<a class="editButton btn btn-sm btn-primary" href="javascript:void(0)"
                                    data-id="'.$deliveryCharge->id.'" data-bs-toggle="modal" data-bs-target="#editAdminModal">
                                    <i class="fas fa-edit"></i></a>';

//                    }

//                    if(Auth::guard('admin')->user()->can('Delete Admin')) {

                    $deleteAction = '<a class="btn btn-sm btn-danger" href="javascript:void(0)"
                                    data-id="'.$deliveryCharge->id.'" id="deleteAdminBtn""> 
                                    <i class="fas fa-trash"></i></a>';

//                    }

                    return '<div class="d-flex gap-3"> '.$editAction.$deleteAction.'</div>';
                })
                ->rawColumns(['action', 'status'])
                ->make(true);
        }

        return view('backend.pages.delivery-charge.index');
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
        $request->validate([
            'delivery_title' => 'required|string',
            'delivery_charge' => 'required|integer'
        ]);


        $deliveryCharge = new DeliveryCharge();
        $deliveryCharge->delivery_title = $request->delivery_title;
        $deliveryCharge->slug = Str::slug($request->delivery_title);
        $deliveryCharge->delivery_charge = $request->delivery_charge;
        $deliveryCharge->save();

        return response()->json(['message' => 'success'], 201);
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
        $deliveryCharge = DeliveryCharge::findOrFail($id);

        return response()->json(['message' => 'success', 'data' => $deliveryCharge], 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'delivery_title' => 'string',
            'delivery_charge' => 'integer'
        ]);


        $deliveryCharge = DeliveryCharge::findOrFail($id);
        $deliveryCharge->delivery_title = $request->delivery_title;
        $deliveryCharge->slug = Str::slug($request->delivery_title);
        $deliveryCharge->delivery_charge = $request->delivery_charge;
        $deliveryCharge->save();

        return response()->json(['message' => 'success'], 201);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $deliveryCharge = DeliveryCharge::where('id', $id)->first()->delete();

        return response()->json(['message' => 'success'], 200);
    }

    public function changeDeliveryStatus(Request $request)
    {
        $id = $request->id;
        $status = $request->status;


        if ($status == 1) {
            $stat = 0;
        } else {
            $stat = 1;
        }

        $page = DeliveryCharge::findOrFail($id);
        $page->status = $stat;
        $page->save();

        return response()->json(['message' => 'success', 'status' => $stat, 'id' => $id]);
    }
}
