<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Subcategory;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Yajra\DataTables\DataTables;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // $categories = Category::latest()->get();
        return view('backend.pages.categories.index');
    }

    public function getData()
    {
        // get all data
        $categories= Category::all();
        
        return DataTables::of($categories)
            
            ->addColumn('categoryImg', function ($category) {    
                return '<img src="'.asset( $category->category_img_path ).'" width="200px">';
            })

            ->addColumn('frontStatus', function ($category) {
                if ($category->front_status == 1) {
                    return '<a class="status" id="front-status" href="javascript:void(0)"
                        data-id="'.$category->id.'" data-status="'.$category->front_status.'"> <i
                        class="fa-solid fa-toggle-on fa-2x"></i>
                    </a>';
                } else {
                    return '<a class="status" id="front-status" href="javascript:void(0)"
                        data-id="'.$category->id.'" data-status="'.$category->front_status.'"> <i
                          class="fa-solid fa-toggle-off fa-2x" style="color: grey"></i>
                    </a>';
                }
            })

            ->addColumn('topCategoryStatus', function ($category) {
                if ($category->topCategory_status == 1) {
                    return ' <a class="status" id="topCategory_status" href="javascript:void(0)"
                        data-id="'.$category->id.'" data-status="'.$category->topCategory_status.'"> <i
                            class="fa-solid fa-toggle-on fa-2x"></i>
                    </a>';
                } else {
                    return '<a class="status" id="topCategory_status" href="javascript:void(0)"
                        data-id="'.$category->id.'" data-status="'.$category->topCategory_status.'"> <i
                            class="fa-solid fa-toggle-off fa-2x" style="color: grey"></i>
                    </a>';
                }
            })

            ->addColumn('status', function ($category) {
                if ($category->status == 1) {
                    return ' <a class="status" id="status" href="javascript:void(0)"
                        data-id="'.$category->id.'" data-status="'.$category->status.'"> <i
                            class="fa-solid fa-toggle-on fa-2x"></i>
                    </a>';
                } else {
                    return '<a class="status" id="status" href="javascript:void(0)"
                        data-id="'.$category->id.'" data-status="'.$category->status.'"> <i
                            class="fa-solid fa-toggle-off fa-2x" style="color: grey"></i>
                    </a>';
                }
            })

            ->addColumn('action', function ($category) {
                return '<div class="d-flex gap-3"> 
                    <a class="btn btn-sm btn-primary" id="editButton" href="javascript:void(0)" data-id="'.$category->id.'" data-bs-toggle="modal" data-bs-target="#editModal"><i class="fas fa-edit"></i></a>
                    <a class="btn btn-sm btn-danger" href="javascript:void(0)" data-id="'.$category->id.'" id="deleteBrandBtn"> <i class="fas fa-trash"></i></a>
                </div>';
            })
            
            ->rawColumns(['categoryImg','frontStatus','topCategoryStatus','status','action'])
            ->make(true);
    }

    public function changeCategoryFrontStatus(Request $request)
    {
        $id = $request->id;
        $Current_status = $request->status;

        if ($Current_status == 1) {
            $status = 0;
        } else {
            $status = 1;
        }

        $page = Category::findOrFail($id);
        $page->front_status = $status;
        $page->save();

        //Debugged this code --> return response()->json(['message' => 'success', 'status' => $status, 'id' => $id]);
        return response()->json(['message' => 'success', 'status' => $status, 'id' => $id]);
    }


    public function changeTopCategoryStatus(Request $request)
    {
        $id = $request->id;
        $Current_status = $request->status;

        if ($Current_status == 1) {
            $status = 0;
        } else {
            $status = 1;
        }

        $page = Category::findOrFail($id);
        $page->topCategory_status = $status;
        $page->save();

        //Debugged this code --> return response()->json(['message' => 'success', 'status' => $status, 'id' => $id]);
        return response()->json(['message' => 'success', 'status' => $status, 'id' => $id]);
    }


    public function changeCategoryStatus(Request $request)
    {
        $id = $request->id;
        $Current_status = $request->status;

        if ($Current_status == 1) {
            $status = 0;
        } else {
            $status = 1;
        }

        $page = Category::findOrFail($id);
        $page->status = $status;
        $page->save();

        //Debugged this code --> return response()->json(['message' => 'success', 'status' => $status, 'id' => $id]);
        return response()->json(['message' => 'success', 'status' => $status, 'id' => $id]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $category = new Category();

        $category->category_name          = $request->category_name;
        $category->slug                   = Str::slug($request->category_name);
        $category->front_status           = $request->front_status;
        $category->topCategory_status     = $request->topCategory_status;
        $category->status                 = $request->status;
        $category->gender                 = $request->gender;
        
        
        if( $request->file('category_img') ){
            $images = $request->file('category_img');

            $imageName          = $request->slug . rand(1, 99999999) . '.' . $images->getClientOriginalExtension();
            $imagePath          = 'public/backend/images/category/';
            $images->move($imagePath, $imageName);

            $category->category_img_path   =  $imagePath . $imageName;
            $category->category_img        =  $imageName;
        }
        
        // dd($category);
        $category->save();
        
        return response()->json(['message'=> "Successfully Category Created!", 'status' => true]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Category $category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Category $category)
    {
        // dd($category);
        return response()->json(['success' => $category]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Category $category)
    {
        
         $category->category_name          = $request->category_name;
         $category->slug                   = Str::slug($request->category_name);
         $category->front_status           = $request->front_status;
         $category->topCategory_status     = $request->topCategory_status;
         $category->status                 = $request->status;
         $category->gender                 = $request->gender;

         if( $request->file('category_img_path') ){
             $images = $request->file('category_img_path');

             if ( !is_null($category->category_img_path) && file_exists($category->category_img_path))  {
                 unlink($category->category_img_path); // Delete the existing category_img
             }

             $imageName          = $request->slug . rand(1, 99999999) . '.' . $images->getClientOriginalExtension();
             $imagePath          = 'public/backend/images/category/';
             $images->move($imagePath, $imageName);

             $category->category_img_path   =  $imagePath . $imageName;
         }

         $category->save();

         return response()->json(['message'=> "success"],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Category $category)
    {
        if ($category->category_img_path) {
            if (file_exists($category->category_img_path)) {
                unlink($category->category_img_path);
            }
        }
        $category->delete();
        
        return response()->json(['message' => 'Category has been deleted.'], 200);
    }

    public function getSubCategories(Request $request,Category $category)
    {
        $subcats= SubCategory::where('category_id', $category->id)->get();
        
        return response()->json(['message' => 'success', 'data' => $subcats], 200);
    }
}
