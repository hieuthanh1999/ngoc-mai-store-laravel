<?php

namespace App\Repository\Eloquent;

use App\Models\News;
use App\Models\Color;

/**
 * Class BrandRepository
 * @package App\Repositories\Eloquent
 */
class NewsRepository extends BaseRepository
{
    /**
     * BrandRepository constructor.
     *
     * @param Banner $brand
     */
    public function __construct(News $brand)
    {
        parent::__construct($brand);
    }
    public function getNews($limit = 4)
    {
        return News::orderBy('priority')  // Sắp xếp theo priority
                    ->take($limit)      // Lấy 4 bài viết
                    ->get();            // Trả về kết quả
    }


}

?>
