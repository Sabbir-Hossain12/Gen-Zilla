<?php

namespace App\Providers;

use App\Models\Banner;
use App\Models\BasicInfo;
use App\Models\Category;
use App\Models\Product;
use App\Models\Slider;
use App\Models\ThemeColor;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;
use Illuminate\View\View;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
//        
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        View()->composer('frontend.include.header', function ($view) {
//           
            $frontCategories = Category::where('status', 1)->where('front_status', 1)->limit(9)->get();
            $navCategories = Category::where('status', 1)->where('front_status', 1)->limit(6)->get();

            $view->with([
                'frontCategories' => $frontCategories, 'navCategories' => $navCategories
            ]);
        });


// 
//        
        View()->composer('*', function ($view)
        {
            $basic_info = BasicInfo::first();
            $themeColor= ThemeColor::first();
            $view->with(['basic_info'=> $basic_info,'themeColor'=> $themeColor]);
        }
        );
        

        View()->composer('frontend.pages.webview', function ($view) {
         
            $popular_categories = Category::where('status', 1)->where('topCategory_status', 1)->select('category_name','slug','category_img_path')->get();
//            $frontend_categories = Category::where('status', 1)->where('front_status', 1)->latest()->get();
            $sliders= Slider::where('status', 1)->select('slider_img')->get();
            
            $largeBanner= Banner::where('status', 1)->where('banner_type', 'large')
                ->select('banner_img','banner_link','banner_title_1','banner_title_2','banner_title_3','banner_btn_name','banner_btn_link')->first();


            if(Auth::guard('web')->check())
            {
                $userGender = Auth::guard('web')->user()->gender;
                $maleCategories = ['Men', 'Male', 'Gents', 'Boys', 'Man', 'Menswear'];
                $femaleCategories = ['Women', 'Female', 'Ladies', 'Girls', 'Woman', 'Womenswear'];
                if($userGender == 'male')
                {
                    
                    $popular_products = Product::with([
                            'productDetail:id,product_id,productThumbnail_img',
                            'weights:id,product_id,productRegularPrice,productSalePrice,discount_percentage',
                            'colors:id,product_id,productRegularPrice,productSalePrice,discount_percentage',
                            'sizes:id,product_id,productRegularPrice,productSalePrice,discount_percentage'
                        ])
                        ->where('status', 1)
                        ->where('isPopular', 1)
                        ->whereHas('category', function ($query) 
                        {
                            $query->where(function ($q)  {
                               
                                    $q->Where('gender', 'male');
                                
                            });
                        })
//                            $query->whereIn('category_name', $maleCategories)
//                                ->orWhere('category_name', 'like', '%male%'); // If you still need "male"
                        
                        ->select('id','product_name','slug')->get();
                }
                else
                {
                    $popular_products = Product:: with([
                        'productDetail:id,product_id,productThumbnail_img',
                        'weights:id,product_id,productRegularPrice,productSalePrice,discount_percentage',
                        'colors:id,product_id,productRegularPrice,productSalePrice,discount_percentage',
                        'sizes:id,product_id,productRegularPrice,productSalePrice,discount_percentage'
                    ])
                        ->where('status', 1)
                        ->where('isPopular', 1)

                        ->whereHas('category', function ($query)
                        {
                            $query->where(function ($q)  {

                                $q->Where('gender', 'female');

                            });
                        })
                        ->select('id','product_name','slug')->get();
                }
          
            }
            else
            {
                $popular_products = Product
                    :: with([
                        'productDetail:id,product_id,productThumbnail_img',
                        'weights:id,product_id,productRegularPrice,productSalePrice,discount_percentage',
                        'colors:id,product_id,productRegularPrice,productSalePrice,discount_percentage',
                        'sizes:id,product_id,productRegularPrice,productSalePrice,discount_percentage'

                    ])
                    ->where('status', 1)
                    ->where('isPopular', 1)
                    
                    ->select('id','product_name','slug')->get();
            }
      
            
            $featured_products= Product
                :: with([
                'productDetail:id,product_id,productThumbnail_img', 
                'weights:id,product_id,productRegularPrice,productSalePrice,discount_percentage',
                'colors:id,product_id,productRegularPrice,productSalePrice,discount_percentage',
                'sizes:id,product_id,productRegularPrice,productSalePrice,discount_percentage'
                    
            ])
                ->where('status', 1)
                ->where('isFeatured', 1)
                ->select('id','product_name','slug')->get();
            
            $view->with([
                 'popular_categories' => $popular_categories,
                'popular_products' => $popular_products,
                'sliders' => $sliders,
                'featured_products' => $featured_products,
                'largeBanner' => $largeBanner,
               
            ]);
        });
    }
}
