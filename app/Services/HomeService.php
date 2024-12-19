<?php

namespace App\Services;

use App\Repository\Eloquent\ProductRepository;
use App\Repository\Eloquent\ProductReviewRepository;
use App\Repository\Eloquent\NewsRepository;
use App\Repository\Eloquent\BannerRepository;

class HomeService
{
    /**
     * @var ProductRepository
     */
    private $productRepository;

    /**
     * @var ProductReviewRepository
     */
    private $productReviewRepository;

    /**
     * @var BannerRepository
     */
    private $bannerRepository;

        /**
     * @var NewsRepository
     */
    private $newsRepository;

    /**
     * ProductService constructor.
     *
     * @param ProductRepository $productRepository
     */
    public function __construct(ProductRepository $productRepository,
        NewsRepository $newsRepository,
     ProductReviewRepository $productReviewRepository,
     BannerRepository $bannerRepository)
    {
        $this->productRepository = $productRepository;
        $this->productReviewRepository = $productReviewRepository;
        $this->bannerRepository = $bannerRepository;
        $this->newsRepository = $newsRepository;
    }

    /**
     * Display a listing of the users.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // lấy sản phẩm bán chạy nhất
        $bellingProducts = $this->productRepository->getBestSellingProduct();
        foreach($bellingProducts as $key => $bellingProduct) {
            $bellingProducts[$key]->avg_rating = $this->productReviewRepository->avgRatingProduct($bellingProduct->id)->avg_rating ?? 0;
        }

        // lấy sản phẩm mới nhất
        $newProducts = $this->productRepository->getNewProducts();
        foreach($newProducts as $key => $newProduct) {
            $newProducts[$key]->avg_rating = $this->productReviewRepository->avgRatingProduct($newProduct->id)->avg_rating ?? 0;
            $newProducts[$key]->sum = $this->productRepository->getQuantityBuyProduct($newProduct->id);
        }
        $banners = $this->bannerRepository->all();
        $news = $this->newsRepository->getNews();
        // trả dữ liệu cho controller
        return [
            'title' => TextLayoutTitle("payment_method"),
            'bellingProducts' => $bellingProducts,
            'newProducts' => $newProducts,
            'banners' => $banners,
            'news' => $news

        ];
    }
}
?>
