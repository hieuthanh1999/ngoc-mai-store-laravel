-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2025 at 05:23 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bike-store-ngocmai`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ward` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apartment_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `city`, `district`, `ward`, `apartment_number`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '264', '1980', '70510', '32434', '2024-12-13 18:03:19', '2024-12-13 18:03:33', NULL),
(2, 2, '263', '2044', '130625', '123', '2024-12-14 08:28:52', '2024-12-14 08:28:52', NULL),
(3, 3, '201', '3440', '13006', 'sadsad', '2024-12-20 08:26:56', '2024-12-20 08:26:56', NULL),
(4, 4, '202', '1453', '21105', 'An Dương', '2024-12-24 16:33:38', '2024-12-24 16:33:38', NULL),
(5, 5, '226', '1599', '260101', '412 lý bôn', '2024-12-27 08:27:39', '2024-12-27 08:27:39', NULL),
(6, 6, '269', '2264', '90816', 'thái bình', '2025-01-06 15:51:05', '2025-01-06 15:51:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `description`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Ngọc Mai Store', '1735288915.jpg', 'This is the first banner.1221321312', 1, '2024-12-14 16:26:56', '2024-12-27 08:41:55'),
(4, 'Banner 2', 'banner2.jpg', 'This is the second banner.', 1, '2024-12-14 16:26:56', '2024-12-14 16:26:56');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'TOPRIGHT', NULL, NULL, NULL),
(2, 'Concorde', NULL, NULL, NULL),
(3, 'HILAND', NULL, NULL, NULL),
(4, 'LESVINA', NULL, NULL, NULL),
(5, 'GIANT', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `parent_id`, `slug`) VALUES
(1, 'Xe đạp', NULL, NULL, NULL, 0, 'xe-dap'),
(2, 'Xe đạp topright', NULL, NULL, NULL, 0, 'xe-dap-topright'),
(3, 'Xe đạp concorde', NULL, NULL, NULL, 0, 'xe-dap-concorde'),
(4, 'Xe đạp giant', NULL, NULL, NULL, 0, 'xe-dap-giant'),
(5, 'Sửa xe và bảo dưỡng', NULL, NULL, NULL, 0, 'sua-xe-va-bao-duong'),
(8, 'Xe đạp đường phố - City Bike', '2024-12-14 08:07:51', '2024-12-14 08:07:51', NULL, 1, 'xe-dap-duong-pho-city-bike'),
(9, 'Xe đạp hiệu topright', '2024-12-19 09:53:34', '2024-12-19 09:53:34', NULL, 2, 'xe-dap-hieu-topright'),
(10, 'xe đạp hiệu giant', '2024-12-19 09:53:44', '2024-12-19 09:53:44', NULL, 4, 'xe-dap-hieu-giant');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Trắng', NULL, NULL, NULL),
(2, 'Đen', NULL, NULL, NULL),
(3, 'Xám', NULL, NULL, NULL),
(4, 'Đỏ', NULL, NULL, NULL),
(5, 'Vàng', NULL, NULL, NULL),
(6, 'Xanh', NULL, NULL, NULL),
(7, 'Tím', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_02_06_054552_create_roles_table', 1),
(3, '2023_02_06_093103_create_users_table', 1),
(4, '2023_02_06_093104_create_addresses_table', 1),
(5, '2023_02_09_141232_create_user_verifies_table', 1),
(6, '2023_02_17_101710_create_brands_table', 1),
(7, '2023_03_13_104142_create_colors_table', 1),
(8, '2023_03_13_104200_create_sizes_table', 1),
(9, '2023_03_15_111222_create_categories_table', 1),
(10, '2023_03_16_130121_create_products_table', 1),
(11, '2023_03_16_140642_create_products_color_table', 1),
(12, '2023_03_16_140906_create_products_size_table', 1),
(13, '2023_03_23_091419_create_payments_table', 1),
(14, '2023_03_23_095605_create_orders_table', 1),
(15, '2023_03_27_001440_create_order_details_table', 1),
(16, '2023_03_28_004112_alert_orders_table', 1),
(17, '2023_03_28_004113_alert_orders_table', 1),
(18, '2023_03_28_143413_alert_products_size_table', 1),
(19, '2023_03_28_144341_alert_products_color_table', 1),
(20, '2023_03_28_144345_alert_products_table', 1),
(21, '2023_03_28_144347_alert_orders_table', 1),
(22, '2023_03_28_144348_create_reduce_quantity_product_trigger', 1),
(23, '2023_03_28_144349_create_trigger_group_by_quantity', 1),
(24, '2023_04_11_111222_alter_categories_table', 1),
(25, '2023_04_11_111223_alter_categories_table', 1),
(26, '2023_04_13_114627_create_product_reviews_table', 1),
(27, '2023_04_13_114628_alter_products_size_table ', 1),
(28, '2023_04_17_180428_drop_personal_access_tokens_table', 1),
(29, '2023_04_18_180428_create_setting_table', 1),
(30, '2023_04_19_180428_alter_setting_table', 1),
(31, '2023_04_30_114628_alter_product_table ', 1),
(32, '2023_05_1_114628_alter_payments_table ', 1),
(33, '2024_12_14_211641_create_banners_table', 2),
(34, '2024_12_17_234559_add_priority_to_news_table', 3),
(35, '2024_12_19_140855_create_newsletters_table', 4),
(36, '2024_12_19_154156_remove_unique_from_email_in_newsletters_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `priority`, `created_at`, `updated_at`) VALUES
(2, 'Ưu Đãi Phụ Kiện', 'Tặng ngay combo 3 món phụ kiện khi mua xe hoặc giảm giá đến 20% khi mua phụ kiện tại showroom GIGABIKE.', 0, NULL, NULL),
(3, 'Ưu đãi Khuyến Mại Xả Kho', 'Hàng trăm sản phẩm có giá khuyến mãi cực sốc, giảm giá 50% tất cả các mẫu xe đạp.', 1, NULL, NULL),
(4, 'Miễn Phí Giao Hàng', 'Miễn phí giao hàng nội thành Hà Nội cho đơn hàng từ 3 triệu đồng!', 2, NULL, NULL),
(5, 'Ưu Đãi Sửa Chữa và Bảo Dưỡng', 'Giảm giá sửa chữa và bảo dưỡng xe đạp, ưu đãi lên đến 20%.', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'n.hieuthanhps@gmail.com', '2024-12-19 08:29:22', '2024-12-19 08:29:22'),
(2, 'n.hieuthanhps@gmail.com', '2024-12-19 08:46:36', '2024-12-19 08:46:36'),
(3, 'n.hieuthanhps@gmail.com', '2024-12-19 08:46:47', '2024-12-19 08:46:47'),
(4, 'n.hieuthanhps@gmail.com', '2024-12-19 08:47:15', '2024-12-19 08:47:15'),
(5, 'n.hieuthanhps@gmail.com', '2024-12-19 08:48:58', '2024-12-19 08:48:58'),
(6, 'n.hieuthanhps@gmail.com', '2024-12-19 08:50:29', '2024-12-19 08:50:29'),
(7, 'vuongvantu2211@gmail.com', '2024-12-24 16:30:06', '2024-12-24 16:30:06'),
(8, 'vuongvantu2211@gmail.com', '2024-12-24 16:30:11', '2024-12-24 16:30:11'),
(9, 'laiducanh02@gmail.com', '2025-01-06 15:42:37', '2025-01-06 15:42:37'),
(10, 'laiducanh02@gmail.com', '2025-01-06 15:42:42', '2025-01-06 15:42:42');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `total_money` double NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `transport_fee` double NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `payment_id`, `total_money`, `order_status`, `created_at`, `updated_at`, `deleted_at`, `transport_fee`, `note`, `payment_status`) VALUES
(1734462918481, 2, 3, 2000000, 3, '2024-12-17 19:16:09', '2024-12-17 19:16:55', NULL, 0, 'đã giao hàng', 0),
(1735282986333, 4, 3, 123213213, 3, '2024-12-27 07:03:54', '2024-12-27 09:17:52', NULL, 0, 'Ok', 0),
(1735288377436, 5, 3, 236642131, 2, '2024-12-27 08:33:23', '2024-12-27 08:33:31', NULL, 0, NULL, 0),
(1735288465997, 5, 1, 3212131, 3, '2024-12-27 08:34:25', '2024-12-27 08:35:02', NULL, 0, NULL, 0),
(1735290830760, 4, 3, 1200000, 0, '2024-12-27 09:14:49', '2024-12-27 09:14:49', NULL, 0, NULL, 0),
(1735290974464, 5, 3, 123213213, 3, '2024-12-27 09:17:37', '2024-12-27 09:19:03', NULL, 0, NULL, 0),
(1735877521850, 2, 3, 233430000, 0, '2025-01-03 04:12:33', '2025-01-03 04:12:33', NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_size_id` bigint(20) UNSIGNED NOT NULL,
  `unit_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_size_id`, `unit_price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1734462918481, 1, 2000000, 1, '2024-12-17 19:16:09', '2024-12-17 19:16:09'),
(2, 1735282986333, 17, 123213213, 1, '2024-12-27 07:03:54', '2024-12-27 07:03:54'),
(3, 1735288377436, 20, 3212131, 1, '2024-12-27 08:33:23', '2024-12-27 08:33:23'),
(4, 1735288377436, 22, 233430000, 1, '2024-12-27 08:33:23', '2024-12-27 08:33:23'),
(5, 1735288465997, 20, 3212131, 1, '2024-12-27 08:34:25', '2024-12-27 08:34:25'),
(6, 1735290830760, 14, 1200000, 1, '2024-12-27 09:14:49', '2024-12-27 09:14:49'),
(7, 1735290974464, 17, 123213213, 1, '2024-12-27 09:17:37', '2024-12-27 09:17:37'),
(8, 1735877521850, 22, 233430000, 1, '2025-01-03 04:12:33', '2025-01-03 04:12:33');

--
-- Triggers `order_details`
--
DELIMITER $$
CREATE TRIGGER `group_by_quantity` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
                declare _record int;
                declare _quantity int;
                select count(*) into _record from order_details where product_size_id = new.product_size_id and order_id = new.order_id;
                if (_record >= 2) then
                    select sum(quantity) into _quantity from order_details where product_size_id = new.product_size_id and order_id = new.order_id;
                    update order_details set quantity = _quantity where product_size_id = new.product_size_id and order_id = new.order_id;
                    SIGNAL sqlstate "45001" set message_text = "error";
                end if;
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reduce_quantity_product` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
                    declare _quantity int;
                    select quantity into _quantity from products_size where id = new.product_size_id;
                    if (new.quantity <= 0 || _quantity < new.quantity) then
                        SIGNAL sqlstate "45001" set message_text = "error";
                    else
                        update products_size set quantity = _quantity - new.quantity where id = new.product_size_id;
                    end if;
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `status`, `img`) VALUES
(1, 'Khi nhận hàng', NULL, NULL, NULL, 1, '1682960154.png'),
(2, 'Ví điện tử Momo', NULL, NULL, NULL, 0, '1682960202.png'),
(3, 'VNPAY', NULL, '2023-09-17 10:15:35', NULL, 1, '1694970935.png');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_import` double NOT NULL,
  `price_sell` double NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price_import`, `price_sell`, `img`, `description`, `status`, `category_id`, `brand_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Xe đạp trẻ em Hiland HIM033 bánh 20 Icnh 7 tốc độ, phanh đĩa', 1000000, 2000000, '1734461067.webp', '<div class=\"panel-title\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); position: relative; font-family: Quicksand, sans-serif;\"><h2 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 20px 0px; font-weight: bold; font-size: 15px; text-transform: uppercase; cursor: pointer;\">THông tin sản phẩm</h2></div><div class=\"panel-description \" style=\"margin: 0px; padding: 0px 0px 20px; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><div class=\"description-productdetail typeList-style\" style=\"margin: 0px; padding: 0px;\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Xe đạp trẻ em Hiland HIM033 bánh 20 Icnh 7 tốc độ, phanh đĩa</span></p><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 0px 20px; list-style: initial; max-width: 100%;\"><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Xe đạp leo núi trẻ em 20 \'\'</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Khung hợp kim magiê - Nhẹ và bền</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Shimano 7 tốc độ - Nhiều lựa chọn tốc độ</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Phanh đĩa kép &amp; phuộc treo hợp kim - Hấp thụ các cú sốc hiệu quả</li></ul><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Chất liệu khung nâng cao</span><br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Khung hợp kim magiê nhẹ hơn nhưng vẫn đủ chắc chắn để trẻ dễ dàng điều khiển.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Vành nhôm hai thành cho độ bền cao hơn. Bộ quây Seel Carbon cao giúp hệ thống truyền động tổng thể trơn tru.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Thiết kế độc nhất</span><br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Đúc một mảnh thời trang thể hiện các đường nét mượt mà ngắn gọn và hiện đại.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Các dây cáp bên trong giúp cho xe đạp có thời gian sử dụng lâu hơn, chống ăn mòn tốt hơn. Các decal phong cách làm cho chiếc xe đạp này nổi bật so với những người khác.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Hiệu suất cao. Hệ thống truyền lực</span><br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Với phanh Đĩa trước và sau, hệ thống truyền động 7 đơn giản giúp đơn giản hóa việc chuyển số, lốp rộng 20 \'\' * 2.0 \'\', trẻ em có thể tập trung vào việc vui chơi!</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Hướng dẫn lắp ráp &amp; kích thước</span><br style=\"margin: 0px; padding: 0px; max-width: 100%;\">85% xe đã được lắp ráp. Bao bì bao gồm tất cả các công cụ cần thiết để hoàn thành việc lắp ráp.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Kích thước: Chiều Cao Ghế (65cm-75cm). Thích hợp cho trẻ cao 3\'8-4\'8 Cho trẻ 5-8 tuổi.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Thông số sản phẩm:&nbsp;</span></p><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 0px 20px; list-style: initial; max-width: 100%;\"><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Chất liệu khung: Đĩa hợp kim nhôm</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Chất liệu: Vành thép</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Chất liệu: Lốp hợp kim nhôm</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Chiều rộng: 20 * 1.95</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Loại khung: Khung cứng (Bộ giảm chấn không phía sau)</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Loại bàn đạp: Bàn đạp hạt Tên sản phẩm: Hợp kim nhôm Khung</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">MTB : Hợp kim nhôm Phuộc: Hệ thống treo Phanh phuộc: Phanh đĩa Lốp: 20 * 1.95 OEM &amp; ODM: Bánh răng có gắn: 7 tốc độ Logo: Hiland, Yên xe tùy chỉnh : Hình dạng siêu mềm</li></ul></div></div>', 1, 8, 3, '2024-12-17 18:44:27', '2024-12-17 18:44:27', NULL),
(2, 'Xe Đạp Đua Đường Trường Road HILAND DARING HIR018 700C', 1000000, 20000000, '1734599930.webp', '<div class=\"panel-title\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); position: relative; font-family: Quicksand, sans-serif;\"><h2 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 20px 0px; font-weight: bold; font-size: 15px; text-transform: uppercase; cursor: pointer;\">THông tin sản phẩm</h2></div><div class=\"panel-description \" style=\"margin: 0px; padding: 0px 0px 20px; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><div class=\"description-productdetail typeList-style\" style=\"margin: 0px; padding: 0px;\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Xe Đạp Đua Đường Trường Road HILAND DARING HIR018 700C</span>&nbsp;thuộc dòng xe đạp đua trong tầm trung của Hiland cũng được rất nhiều người mong ước sở hữu. Thiết kế bởi những chuyên gia hàng đầu có nhiều kinh nghiệm, mẫu xe này mang tới một cấu hình vô cùng mạnh mẽ với những trải nghiệm đặc biệt trong những chuyến đi đường dài hay cuộc đua mang tính cạnh tranh.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Đặc trưng:</span></p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">• Chiếc xe đạp này có khung nhôm siêu nhẹ chất lượng cao và thiết kế dây cáp&nbsp;bên trong</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">• Hệ thống phanh bao gồm phanh Calibre đôi. Và đề SHIMANO 3 * 7 tốc độ sang số đảm bảo kiểm soát hoàn toàn trong mọi tình huống.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">• Có thể sử dụng xe đạp để chạy thoải mái trong thành phố hay đi đường trường. Bánh xe 700C mang lại trải nghiệm tốc độ cao của một chiếc xe đạp đua tốc độ.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">• Xe được lắp đặt hoàn thiện 100% và điều chỉnh chuyên nghiệp</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: center;\"><img src=\"https://file.hstatic.net/200000449633/file/z3809627169059_1686ae581c84a68ecd155f2b8454b7cf_a5c6b872f6e24b79bdf705bb473651b5_grande.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; max-width: 100%;\"></p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Đạp xe đường trường là một cách thú vị để cải thiện thể chất của bạn, gặp gỡ với những người mới và tận hưởng thiên nhiên xung quanh với tốc độ chậm hơn có thể từ một chiếc ô tô đang chạy tốc độ cao. Những chiếc xe đạp này cung cấp tốc độ, sự nhanh nhẹn và hiệu quả. Hiland Celerite, với hệ thống truyền động 3x7 được nâng cấp nhẹ, đơn giản và dễ sử dụng, khiến nó trở thành lựa chọn tuyệt vời cho những người đi làm hàng ngày hoặc đi xe đạp đường dài.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">KHUNG NHÔM&nbsp;ALUXX-Grade Aluminum</span><br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Chiếc xe đạp này có khung nhôm siêu nhẹ chất lượng cao và thiết kế dây bên trong， mang đến cho bạn trải nghiệm đạp xe nhẹ và đáng tin cậy hơn. Khung xe được làm từ hợp kim Nhôm&nbsp;<a href=\"https://gigabike.vn/blogs/news/xe-dap-hiland-chinh-hang-gia-tot\" style=\"margin: 0px; padding: 0px; color: var(--shop-color-main); outline: none; transition: 0.3s ease-in-out; max-width: 100%;\">HILAND</a>&nbsp;Alloy chắc chắn, có khả năng chịu va đập tốt và có kích thước 700cc*46cm phù hợp với những người có chiều cao từ 1m65 đến 1m80. Thiết kế của khung xe tạo cảm giác mạnh mẽ, mang phong cách rất chuyên nghiệp nhưng không kém phần năng động.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: center;\"><img src=\"https://file.hstatic.net/200000449633/file/z3809627112878_62d7da3b3defa726c62af295dac50a81_37dbb723fe45462e9669cd2b674fa75b_grande.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; max-width: 100%;\"></p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">BỘ ĐỀ SHIMANO CHẤT LƯỢNG</span><br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Hộp số Shimano 21 tốc độ có thể được sử dụng cho nhiều phần khác nhau của chuyến đi. Bộ truyền động Shimano cao cấp với 21 tốc độ với khả năng chuyển đề linh hoạt. Đề trước Shimano TZ510, Đề sau Shimano TZ510 rất chuẩn và nhạy đảm bảo mang đến cho bạn những trải nghiệm tuyệt vời trong suốt hành trình đua.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">THÔNG SỐ SẢN PHẨM</span></p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Khung: nhôm Hiland siêu nhẹ</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Fork: 700C Fork</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Bánh xích: Bánh xe 30 * 40 * 52 răng</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Bộ số ： Shimano A050</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Đề trước Derailleur ： Shimano TZ510</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Đề sau Derailleur ： Shimano TZ510</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Phuộc sau Derailleur ： Shimano TY300D</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Tay quay: Chiều dài 170 mm</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Bộ líp: răng shimano 14-28T</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Xích ： KMC Z7</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Lốp: 700c x 25c</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Ống: 700c x 25c, van Presta 48 mm</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Vành: Tường đôi bằng nhôm H 19mm</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Trụ ghế: Nhôm 27,2 mm x 300 mm</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Bàn đạp: 9/16 inch</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: justify;\">Điều kiện giao hàng: 100% được lắp ráp hoàn thiện</p></div></div>', 1, 8, 3, '2024-12-19 09:18:50', '2024-12-19 09:18:50', NULL),
(3, 'Xe đạp đường phố Hiland HIR020bk 700C', 100000, 200000, '1734600050.webp', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><a href=\"https://gigabike.vn/blogs/news/xe-dap-hiland-chinh-hang-gia-tot\" style=\"margin: 0px; padding: 0px; color: var(--shop-color-main); outline: none; transition: 0.3s ease-in-out; max-width: 100%;\">Xe đạp Touring Hiland</a>&nbsp;HIR020bk 700C - Lựa chọn được nâng cấp<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Khung nhôm HILAND, cùng với thiết kế phanh đĩa cơ.<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Thật dễ dàng để trang bị phụ kiện với giá đỡ, chân chống, chắn bùn, đèn chiếu sáng và hơn thế nữa!</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\">Dành cho dân đạp xe chuyên nghiệp<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Tốc độ xe đạp đường trường và tính linh hoạt của xe đạp hybrid. Hệ thống thay đổi tốc độ SHIMANO 24 (3 * 8gears) mang đến trải nghiệm thay đổi tốc độ ổn định.<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Vành nhôm, băng SHIMANO 12-32T và lốp KENDA 700 * 40C Hiệu suất cao, trải nghiệm lái tốt.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\">Clifford HIR020 700C Đen</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: center;\"><img src=\"https://product.hstatic.net/200000449633/product/xe_dap_duong_pho_hiland_hir020bk_8_7ee9e7518fff4ad88a99938ba694b9b2_grande.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; max-width: 100%;\"></p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: center;\"><em style=\"margin: 0px; padding: 0px; max-width: 100%;\">Xe đạp Touring Hiland HIR020bk 700C&nbsp;trang bị bộ đề Shimano Altus</em></p><div style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">THÔNG SỐ SẢN PHẨM</span></div><div style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><div style=\"margin: 0px; padding: 0px; max-width: 100%;\"><div style=\"margin: 0px; padding: 0px; max-width: 100%;\"><table cellspacing=\"0\" style=\"margin: 0px; padding: 0px; border-spacing: 0px; background-color: transparent; width: 142px; max-width: 100%;\"><tbody style=\"margin: 0px; padding: 0px; max-width: 100%;\"><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Số tốc độ:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">24</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Chất liệu khung:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">Nhôm</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Kiểu phanh:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">&nbsp;Đĩa</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Trọng lượng sản phẩm:</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">32 Pounds</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Size:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">700C&nbsp;</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Frame Height:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">&nbsp;530mm</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Đề trước:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">Shimano TZ500 tourney</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Đề sau:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">Shimano Altus\"</td></tr></tbody></table></div></div></div>', 1, 8, 4, '2024-12-19 09:20:50', '2024-12-19 09:20:50', NULL),
(4, 'Xe đạp địa hình MTB TOPRIGHT H350 - Bánh 24 Inchs (Xanh nhạt)', 2000000, 2323000, '1734600199.webp', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Từ nhà đến công viên hay đến trường, đến nơi làm việc, hay đi phượt Xe đạp địa hình MTB TOPRIGHT H350 - Bánh 24 Inchs có thể giúp bạn cải thiện cuộc sống và sức khoẻ. Xe đạp địa hình MTB TOPRIGHT H350 - Bánh 24 Inchs là sự lựa chọn mà rất nhiều người dùng mong muốn sở hữu.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Với chất liệu khung TOPRIGHT Alloy bền bỉ và có trọng lượng nhẹ, kích thước phù hợp cho hầu hết người Châu Á. Khung xe được sơn tĩnh điện 3 lớp với công nghệ sơn cao cấp cho các chi tiết trên khung xe được sắc nét. Phong cách phối màu cho dòng Xe đạp địa hình MTB TOPRIGHT H350 - Bánh 24 Inchs đơn giản nhưng lại rất bắt mắt và trẻ trung.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Phuộc trước SR Suntour M3030A chắc chắn và hoạt động tốt trên những con đường gồ ghề. Phuộc dài 100mm không nhiều nhưng đủ để bạn thoải mái khi đi lại, tham quan và đi trên những con đường phức tạp.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Bộ truyền động Shimano Tourney hoàn hảo cho mọi mục đích sử dụng trên cả đường gồ ghề và đường thành phố cùng với một loạt các bánh răng để leo trèo và tăng tốc nhanh.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Với pô tăng TOPRIGHT Sport, alloy 15-degree, ghi đông TOPRIGHT Sport kiểu tay lái quen thuộc của một chiếc xe đạp địa hình truyền thống. Bạn có thể tự tin đi trên đường bằng phẳng, gồ ghề hoặc lầy lội.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Đường kính bánh xe 24 inch cùng với lốp xe Quickcross là loại lốp hoàn hảo cho một chiếc xe đạp toàn diện như MTB TOPRIGHT H350 - Bánh 24 Inchs</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Xe đạp địa hình MTB TOPRIGHT H350 - Bánh 24 Inchs là một trong những mẫu xe đạp thể thao đang rất được ưa chuộng. Sản phẩm có những ưu điểm vượt trội sẽ mang đến cho bạn những trải nghiệm thú vị khi sử dụng.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Sở hữu Xe đạp địa hình MTB TOPRIGHT H350 - Bánh 24 Inchs và có những chuyến trải nghiệm hết sức thú vị. Để được tư vấn chi tiết hơn, xin liên hệ hotline: 0977958718</p><h2 style=\"margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; font-family: Quicksand, sans-serif; font-weight: bold; font-size: 30px; max-width: 100%; text-align: justify;\">THÔNG SỐ SẢN PHẨM</h2><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 0px 20px; list-style: initial; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Khung sườn: Nhôm hợp kim, đi dây cáp âm</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Phuộc: Nhôm hợp kim</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Bộ truyền động: Shimano Touney</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Số tốc độ: 3 x 7 (21 speed)</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Phanh: Đĩa hợp kim</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Size bánh: 24 inch x 2.1, Lốp Kenda</li><li style=\"margin: 5px 0px; padding: 0px; max-width: 100%; text-align: justify;\">Màu sắc: Xanh dương</li></ul>', 1, 8, 5, '2024-12-19 09:23:19', '2024-12-19 09:23:19', NULL),
(5, 'Xe Đạp Đường Phố MOMENTUM iNeed Latte 26 – Bánh 26 Inches', 1200000, 1200000, '1734600376.webp', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Xe Đạp Đường Phố Touring MOMENTUM iNeed Latte 26 – Bánh 26 Inches</span></p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Mẫu Momentum iNeed Latte 26 với kiểu dáng thanh lịch nhẹ nhàng, phù hợp với chị em có nhu cầu di chuyển trong thành phố, đi chợ, đi chơi khá phù hợp với nhu cầu mua sắm của nhiều gia đình.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: center;\"><img src=\"https://product.hstatic.net/200000449633/product/latte-26-2022-white_eb7d3b2ada134f6a9ff77ec1a3c6215a_grande.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; max-width: 100%;\"></p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Bộ khung được thiết kế với kiểu dáng cổ điển phù hợp với mọi người, mọi tầm vóc chính là đặc điểm nổi bật của iNeed Latte 26. Kế thừa công nghệ sản xuất khung nhôm cao cấp của GIANT nên iNeed Latte 26 có bộ khung nhẹ nhưng không kém phần chắc chắn.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Bên cạnh đó dòng sản phẩm iNeed Latte 26 cũng được trang bị chuyển líp Shimano Tourney và tay đề Shimano Revoshift tiện lợi cho người sử dụng khi di chuyển ở những địa hình khác nhau hoặc sử dụng cho mục đích tập thể dục hay tăng tốc.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Momentum iNeed Latte 26 thiết kế tỉ mỉ và chăm chút ở mọi chi tiết, yên bọc da êm ái, thiết kế bản rộng phù hợp với xương hông của phụ nữ giảm khả năng chèn mạch máu và đau mỏi khi ngồi với thời gian dài.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Lớp sơn ngoài được xử lý tinh tế giúp xe luôn sáng bóng, có độ bền cao, đồng thời có thể khắc phục những nhược điểm của các dòng xe đạp thông thường như hoen gỉ, xỉn màu.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Ngoài ra, xe còn trang bị giá đỡ bình nước và để cốc cà phê tiện dụng khi dạo phố, giỏ xe hiện đại và thời trang tích hợp để đồ tiện dụng.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Xe sử dụng bộ thắng ARTEK NT 210 có hiệu suất hãm cao đảm bảo độ an toàn ngay cả khi đi trong điều kiện đường trơn trượt do thời tiết.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\">Chiếc Momentum iNeed Latte 26 trang bị gác baga chở hàng tiện dụng khỏe khắn, chắc chắn.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">THÔNG SỐ SẢN PHẨM</span></p><table style=\"margin: 0px; padding: 0px; border-spacing: 0px; width: 540px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><tbody style=\"margin: 0px; padding: 0px; max-width: 100%;\"><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Chất liệu khung/Frame</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">GIANT ALUXX aluminum alloy frame</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Phuộc/Fork</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">GIANT steel fork</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Giảm xóc/Shock</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">N/A</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Vành xe/Rims</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">Alloy 32h/28</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Đùm/Hubs</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">Alloy 32h/28</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Căm/Spokes</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">Stainless steel</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Lốp xe/Tires</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">CST 26″</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Ghi đông/Handlebar</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">Aluminum alloy</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Pô tăng/Stem</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">Aluminum alloy</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Cốt yên/Seatpost</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">Aluminum alloy 30.9</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Yên/Saddle</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">Selle Royal</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Bàn đạp/Pedals</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">Giant City pedal</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Tay đề/Shifters</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">Shimano Revoshift 7-speed</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Chuyển đĩa/Front Derailleur</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">N/A</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Chuyển líp/Rear Derailleur</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">Shimano Tourney 7-speed</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Bộ thắng/Brakes</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">ARTEK NT210</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Tay thắng/Brake Levers</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">70KGF-CM</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Bộ líp/Cassette</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">14-28T</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Sên xe/Chain</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">KMC</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">Giò dĩa/Crankset</th><td style=\"margin: 0px; padding: 0px; max-width: 100%;\">42T</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><th style=\"margin: 0px; padding: 0px; text-align: left; max-width: 100%;\">&nbsp;</th></tr></tbody></table>', 1, 8, 5, '2024-12-19 09:26:16', '2024-12-19 09:26:16', NULL),
(6, 'Xe Đạp Địa Hình MTB CONCORDE DELTA Trắng - phanh đĩa, bánh 24 inch', 1233333, 123213213, '1734601905.webp', '<div style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Đặc trưng sản phẩm</span></div><span style=\"color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\">Xe Đạp Địa Hình MTB Concorde DELTA&nbsp;có vẻ ngoài cá tính, năng động kết hợp với màu sơn thời thượng. Đây sẽ lựa chọn tuyệt vời cho các hoạt động ngoài trời, phù hợp với các bạn trẻ đam mê vượt thử thách, leo núi, đạp xe rèn luyện sức khỏe.</span><div style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\">Khung sườn<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Xe Đạp Địa Hình MTB Concorde DELTA&nbsp;sở hữu bộ khung sườn hợp kim cao cấp, bền chắc có khả năng chịu tải lớn. Phần thân xe được bảo vệ tốt, chống ăn mòn nhờ lớp sơn tĩnh điện phủ bên ngoài, tăng tính thẩm mỹ thêm cho chiếc xe của bạn.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\">Điểm cộng của dòng Xe Đạp Địa Hình MTB Concorde DELTA&nbsp;khi kết hợp hệ thống thắng đĩa&nbsp;và tay thắng cao cấp, có độ chính xác cao, đảm bảo an toàn cho người dùng trên các con đường núi xấu. Các phượt thủ cũng có thể tự tin chinh phục các đoạn đường núi dốc mà vẫn được bảo vệ an toàn.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\">Bánh xe<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Xe Đạp Địa Hình MTB Concorde DELTA&nbsp;sở hữu hệ thống bánh xe chuyên dụng với kích thước 24 inch nhiều đường vân, bám đường tốt kết hợp với vành hợp kim cùng căm Stainless cứng cáp, đây sẽ là sự kết hợp hoàn hảo, đem đến cho người dùng những trải nghiệm tuyệt vời trên những cung đường mới.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\">Phuộc<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Xe Đạp Địa Hình MTB Concorde DELTA&nbsp;được trang bị cặp phuộc trước chuyên dụng cho các dòng xe đạp địa hình với hành trình phuộc 80mm, hỗ trợ giảm xóc tốt, chịu được xung lực lớn, thích hợp khi di chuyển trên những địa hình gồ ghề.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\">Yên xe<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Xe Đạp Địa Hình MTB Concorde DELTA&nbsp;được ưu ái với thiết kế yên xe Concorde custom êm ái, độ rộng vừa phải, hạn chế tình trạng nhức mỏi cho người sử dụng khi di chuyển lâu. Ngoài ra, phần cốt yên Sport có thể điều chỉnh độ cao phù hợp với thể trạng của từng người với thao tác đơn giản, dễ dàng.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\">Phụ kiện<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Xe được trang bị chắn bùn bánh trước và sau giúp tránh bắn bẩn khi di chuyển trong thời tiết mưa. Ngoài ra xe còn được trang bị baga hợp kim thép chắc chắn tải trọng lên đến 80kg.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Thông số kĩ thuật:</span><br style=\"margin: 0px; padding: 0px; max-width: 100%;\">&nbsp;-Khung: hợp kim thép<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">&nbsp;-Phuộc: Phuộc nhún<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">&nbsp;-Phanh: Đĩa hợp kim<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">&nbsp;-Size bánh: 24 x 1.95 inch</p></div>', 1, 8, 4, '2024-12-19 09:51:45', '2024-12-19 09:51:45', NULL),
(7, 'Xe đạp đường phố Hiland HIR020bk 700C', 2132, 3212131, '1734602052.webp', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><a href=\"https://gigabike.vn/blogs/news/xe-dap-hiland-chinh-hang-gia-tot\" style=\"margin: 0px; padding: 0px; color: var(--shop-color-main); outline: none; transition: 0.3s ease-in-out; max-width: 100%;\">Xe đạp Touring Hiland</a>&nbsp;HIR020bk 700C - Lựa chọn được nâng cấp<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Khung nhôm HILAND, cùng với thiết kế phanh đĩa cơ.<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Thật dễ dàng để trang bị phụ kiện với giá đỡ, chân chống, chắn bùn, đèn chiếu sáng và hơn thế nữa!</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\">Dành cho dân đạp xe chuyên nghiệp<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Tốc độ xe đạp đường trường và tính linh hoạt của xe đạp hybrid. Hệ thống thay đổi tốc độ SHIMANO 24 (3 * 8gears) mang đến trải nghiệm thay đổi tốc độ ổn định.<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Vành nhôm, băng SHIMANO 12-32T và lốp KENDA 700 * 40C Hiệu suất cao, trải nghiệm lái tốt.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\">Clifford HIR020 700C Đen</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: center;\"><img src=\"https://product.hstatic.net/200000449633/product/xe_dap_duong_pho_hiland_hir020bk_8_7ee9e7518fff4ad88a99938ba694b9b2_grande.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; max-width: 100%;\"></p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px; text-align: center;\"><em style=\"margin: 0px; padding: 0px; max-width: 100%;\">Xe đạp Touring Hiland HIR020bk 700C&nbsp;trang bị bộ đề Shimano Altus</em></p><div style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">THÔNG SỐ SẢN PHẨM</span></div><div style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><div style=\"margin: 0px; padding: 0px; max-width: 100%;\"><div style=\"margin: 0px; padding: 0px; max-width: 100%;\"><table cellspacing=\"0\" style=\"margin: 0px; padding: 0px; border-spacing: 0px; background-color: transparent; width: 142px; max-width: 100%;\"><tbody style=\"margin: 0px; padding: 0px; max-width: 100%;\"><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Số tốc độ:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">24</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Chất liệu khung:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">Nhôm</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Kiểu phanh:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">&nbsp;Đĩa</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Trọng lượng sản phẩm:</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">32 Pounds</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Size:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">700C&nbsp;</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Frame Height:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">&nbsp;530mm</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Đề trước:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">Shimano TZ500 tourney</td></tr><tr style=\"margin: 0px; padding: 0px; max-width: 100%;\"><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 103px;\">Đề sau:&nbsp;</td><td style=\"margin: 0px; padding: 0px; max-width: 100%; width: 34px;\">Shimano Altus\"</td></tr></tbody></table></div></div></div>', 1, 9, 1, '2024-12-19 09:54:12', '2024-12-19 09:54:12', NULL),
(8, 'Xe Đạp Địa Hình MTB CONCORDE DELTA Trắng - phanh đĩa, bánh 24 inch', 2132000, 233430000, '1734602179.webp', '<div style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Đặc trưng sản phẩm</span></div><span style=\"color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\">Xe Đạp Địa Hình MTB Concorde DELTA&nbsp;có vẻ ngoài cá tính, năng động kết hợp với màu sơn thời thượng. Đây sẽ lựa chọn tuyệt vời cho các hoạt động ngoài trời, phù hợp với các bạn trẻ đam mê vượt thử thách, leo núi, đạp xe rèn luyện sức khỏe.</span><div style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Quicksand, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\">Khung sườn<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Xe Đạp Địa Hình MTB Concorde DELTA&nbsp;sở hữu bộ khung sườn hợp kim cao cấp, bền chắc có khả năng chịu tải lớn. Phần thân xe được bảo vệ tốt, chống ăn mòn nhờ lớp sơn tĩnh điện phủ bên ngoài, tăng tính thẩm mỹ thêm cho chiếc xe của bạn.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\">Điểm cộng của dòng Xe Đạp Địa Hình MTB Concorde DELTA&nbsp;khi kết hợp hệ thống thắng đĩa&nbsp;và tay thắng cao cấp, có độ chính xác cao, đảm bảo an toàn cho người dùng trên các con đường núi xấu. Các phượt thủ cũng có thể tự tin chinh phục các đoạn đường núi dốc mà vẫn được bảo vệ an toàn.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\">Bánh xe<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Xe Đạp Địa Hình MTB Concorde DELTA&nbsp;sở hữu hệ thống bánh xe chuyên dụng với kích thước 24 inch nhiều đường vân, bám đường tốt kết hợp với vành hợp kim cùng căm Stainless cứng cáp, đây sẽ là sự kết hợp hoàn hảo, đem đến cho người dùng những trải nghiệm tuyệt vời trên những cung đường mới.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\">Phuộc<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">Xe Đạp Địa Hình MTB Concorde DELTA&nbsp;được trang bị cặp phuộc trước chuyên dụng cho các dòng xe đạp địa hình với hành trình phuộc 80mm, hỗ trợ giảm xóc tốt, chịu được xung lực lớn, thích hợp khi di chuyển trên những địa hình gồ ghề.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\"><br></p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; max-width: 100%;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;\">Thông số kĩ thuật:</span><br style=\"margin: 0px; padding: 0px; max-width: 100%;\">&nbsp;-Khung: hợp kim thép<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">&nbsp;-Phuộc: Phuộc nhún<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">&nbsp;-Phanh: Đĩa hợp kim<br style=\"margin: 0px; padding: 0px; max-width: 100%;\">&nbsp;-Size bánh: 24 x 1.95 inch</p></div>', 1, 10, 3, '2024-12-19 09:56:19', '2024-12-27 08:40:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_color`
--

CREATE TABLE `products_color` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_color`
--

INSERT INTO `products_color` (`id`, `img`, `color_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1734461112.webp', 4, 1, '2024-12-17 18:45:12', '2024-12-17 18:45:12', NULL),
(2, '1734461228.webp', 2, 1, '2024-12-17 18:47:08', '2024-12-17 18:47:08', NULL),
(3, '1734599945.webp', 6, 2, '2024-12-19 09:19:05', '2024-12-19 09:19:05', NULL),
(4, '1734600059.webp', 2, 3, '2024-12-19 09:20:59', '2024-12-19 09:20:59', NULL),
(5, '1734600066.webp', 6, 3, '2024-12-19 09:21:06', '2024-12-19 09:21:06', NULL),
(6, '1734600220.webp', 2, 4, '2024-12-19 09:23:40', '2024-12-19 09:23:40', NULL),
(7, '1734600229.webp', 4, 4, '2024-12-19 09:23:49', '2024-12-19 09:23:49', NULL),
(8, '1734600385.webp', 2, 5, '2024-12-19 09:26:25', '2024-12-19 09:26:25', NULL),
(9, '1734600393.webp', 5, 5, '2024-12-19 09:26:33', '2024-12-19 09:26:33', NULL),
(10, '1734601914.webp', 1, 6, '2024-12-19 09:51:54', '2024-12-19 09:51:54', NULL),
(11, '1734601922.jpg', 4, 6, '2024-12-19 09:52:02', '2024-12-19 09:52:02', NULL),
(12, '1734601928.webp', 2, 6, '2024-12-19 09:52:08', '2024-12-19 09:52:08', NULL),
(13, '1734602060.webp', 1, 7, '2024-12-19 09:54:20', '2024-12-19 09:54:20', NULL),
(14, '1734602069.webp', 4, 7, '2024-12-19 09:54:30', '2024-12-19 09:54:30', NULL),
(15, '1734602187.webp', 2, 8, '2024-12-19 09:56:27', '2024-12-19 09:56:27', NULL),
(16, '1734602195.jpg', 7, 8, '2024-12-19 09:56:35', '2024-12-19 09:56:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_size`
--

CREATE TABLE `products_size` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_color_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_size`
--

INSERT INTO `products_size` (`id`, `product_color_id`, `size_id`, `created_at`, `updated_at`, `quantity`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, 99, NULL),
(2, 1, 3, NULL, NULL, 50, NULL),
(3, 1, 4, NULL, NULL, 100, NULL),
(4, 2, 1, NULL, NULL, 20, NULL),
(5, 2, 3, NULL, NULL, 10, NULL),
(6, 2, 4, NULL, NULL, 10, NULL),
(7, 1, 2, NULL, NULL, 10, NULL),
(8, 3, 1, NULL, NULL, 233, NULL),
(9, 3, 4, NULL, NULL, 100, NULL),
(10, 4, 1, NULL, NULL, 23, NULL),
(11, 5, 3, NULL, NULL, 22, NULL),
(12, 6, 1, NULL, NULL, 23, NULL),
(13, 7, 4, NULL, NULL, 32, NULL),
(14, 8, 1, NULL, NULL, 231, NULL),
(15, 9, 3, NULL, NULL, 223, NULL),
(16, 9, 2, NULL, NULL, 2323, NULL),
(17, 10, 1, NULL, NULL, 2130, NULL),
(18, 11, 4, NULL, NULL, 22, NULL),
(19, 12, 3, NULL, NULL, 2222, NULL),
(20, 13, 1, NULL, '2024-12-27 08:33:31', 20, NULL),
(21, 14, 3, NULL, NULL, 222, NULL),
(22, 15, 1, NULL, '2024-12-27 08:33:31', 2322, NULL),
(23, 16, 4, NULL, NULL, 2323, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rating`, `content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 8, 4, 'sss', '2024-12-30 03:13:23', '2024-12-30 03:13:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Quản trị viên'),
(2, 'Nhân Viên'),
(3, 'Khách hàng');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maintenance` int(11) NOT NULL,
  `notification` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduction` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `logo`, `name`, `email`, `address`, `phone_number`, `maintenance`, `notification`, `introduction`, `created_at`, `updated_at`) VALUES
(1, '1734169090.png', 'Bike Store Ngoc Mai', 'bike-store-ngocmai@gmail.com', '412 Lý Bôn Thành phố Thái Bình', '0123456789', 2, '<b>WEBSITE tạm thời bảo trì để nâng cấp xin  quay lại sau</b>', '<h3 style=\"text-align: center; \">\r\n                            <b>VỀ CHÚNG TÔI</b>\r\n                            </h3><h5><br></h5><h5><span style=\"font-family: \" source=\"\" sans=\"\" pro\";\"=\"\" times=\"\" new=\"\" roman\"; \"=\"\">\r\n                            Bike Store Ngoc Mai là thương hiệu xe đạp được thiết kế bởi người Việt với mục tiêu trở thành thương hiệu xe đạp quốc gia Việt Nam có chất lượng và tiêu chuẩn quốc tế.\r\n                            Bike Store Ngoc Mai đáp ứng nhu cầu của người tiêu dùng Việt cho một sản phẩm xe đạp chất lượng, phân phối và bảo hành uy tín toàn quốc, thiết kế đẹp và đa dạng mẫu mã, phù hợp cho mọi lứa tuổi và nhu cầu.\r\n                            </span><br></h5><h5><br></h5><h5>\r\n                            Đối với chúng tôi, thời trang là một niềm đam mê và một nghệ thuật.\r\n                            Chúng tôi không chỉ cung cấp cho khách hàng những sản phẩm thời trang đẹp và chất lượng,\r\n                            mà còn mang đến cho họ những trải nghiệm mua sắm tuyệt vời. Chúng tôi luôn nỗ lực để đáp ứng nhu cầu của khách hàng,\r\n                            từ việc cung cấp những sản phẩm mới nhất đến việc cải tiến dịch vụ khách hàng.\r\n                            <br></h5><h5><br></h5><h5>\r\n                            Xe đạp Bike Store Ngoc Mai tự hào là thương hiệu xe đạp Việt cho người Việt. Các sản phẩm xe đạp và phụ kiện của GIGABIKE luôn được cập nhật liên tục hàng năm với mẫu mã, kiểu dáng phong phú, đa dạng,\r\n                            đáp ứng mọi nhu cầu của thị trường từ phân khúc phổ thông cho đến cao cấp cho tất cả các dòng xe đạp từ xe đạp địa hình (MTB),\r\n                            xe đạp đường phố thời trang và xe đạp trẻ em. Slogan: Bike Store Ngoc Mai - Xe đạp Việt cho sức khoẻ Việt”\r\n                            </h5>', NULL, '2024-12-30 08:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'S', NULL, NULL, NULL),
(2, 'M', NULL, NULL, NULL),
(3, 'L', NULL, NULL, NULL),
(4, 'XL', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `disable_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `email_verified_at`, `phone_number`, `role_id`, `active`, `disable_reason`, `created_by`, `updated_by`, `deleted_by`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$mIRxYPyXUAgV0LuNtmToYOiOqpSFyYsURLTMpXqANn9kpk6fToSEO', '2024-12-13 16:18:25', '000 000-0000', 1, 1, NULL, NULL, 1, NULL, NULL, NULL, '2024-12-13 18:03:19', NULL),
(2, 'dev', 'n.hieuthanhps@gmail.com', '$2y$10$uBB.dH/Wg8b7DBfwgsuWc.oHJtd0A6.IpeNBqVNK/dZqgLX.2FVQG', '2024-12-14 08:32:18', '0355668062', 3, 1, NULL, NULL, NULL, NULL, NULL, '2024-12-14 08:28:48', '2024-12-14 08:32:18', NULL),
(3, 'dev dev', 'n.hieuthanhhaui@gmail.com', '$2y$10$5H55JneKhoYSBB4Qh2Wkpu9lGVyiRXkE3hs2Dd3WP6CYuuHRilr8e', NULL, '0355668062', 3, 1, NULL, NULL, NULL, NULL, NULL, '2024-12-20 08:26:51', '2024-12-20 08:26:51', NULL),
(4, 'Vương Văn Tú', 'vuongvantu2211@gmail.com', '$2y$10$Ffv24u8JeS/LDEMOWs74H.qELyEJOqDSyR2TTbaGs.DLx8K5OF6eK', '2024-12-24 16:40:15', '0338376563', 3, 1, NULL, NULL, 4, NULL, NULL, '2024-12-24 16:33:27', '2024-12-27 07:01:55', NULL),
(5, 'Lại Đức Anh', 'laiducanh02@gmail.com', '$2y$10$X8Fe7LFNIrM4ig1H37oV8OpkLtiOd5t8DMQFCDN6CgwQGmv3QxJyS', '2024-12-27 08:31:18', '097 844-3322', 3, 1, NULL, NULL, 5, NULL, NULL, '2024-12-27 08:27:34', '2025-01-10 03:21:15', NULL),
(6, 'Lại Đức Anh', 'anhld16@mbbank.com.vn', '$2y$10$xKZXE9JJtjQuJSeIFn7jQuxWUIFsUcQ68yR6xCN/xB9oewLcDphNu', NULL, '0977731202', 3, 1, NULL, NULL, NULL, NULL, NULL, '2025-01-06 15:51:02', '2025-01-06 15:51:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_verifies`
--

CREATE TABLE `user_verifies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `email_verify` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_verifies`
--

INSERT INTO `user_verifies` (`id`, `user_id`, `token`, `expires_at`, `email_verify`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 3, 'iqVJUnM1XL03PTHMcUmEyjLM7k891257YybZNXJ7eM8MKLTDVELxIvTtOOh9qYHD', '2024-12-20 09:26:51', NULL, '2024-12-20 08:26:51', '2024-12-20 08:26:51', NULL),
(6, 5, '0iwdAXg8xs5vTjI7PuWDNHRNkjYFTvXXswXeGhbOfhJFNPpWEQ3ELaBpIJF4Deve', '2025-01-06 16:48:01', NULL, '2024-12-27 09:04:05', '2025-01-06 15:48:01', NULL),
(7, 6, 'KVQOaHOrFbTTtiPIIDDmgS9awUoAgdCNEA5hNBuu0HlC1inb76QKyFbUf41iGFc1', '2025-01-06 16:51:02', NULL, '2025-01-06 15:51:02', '2025-01-06 15:51:02', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_size_id_foreign` (`product_size_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `products_color`
--
ALTER TABLE `products_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_color_color_id_foreign` (`color_id`),
  ADD KEY `products_color_product_id_foreign` (`product_id`);

--
-- Indexes for table `products_size`
--
ALTER TABLE `products_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_size_product_color_id_foreign` (`product_color_id`),
  ADD KEY `products_size_size_id_foreign` (`size_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_verifies`
--
ALTER TABLE `user_verifies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1735877521851;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products_color`
--
ALTER TABLE `products_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products_size`
--
ALTER TABLE `products_size`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_verifies`
--
ALTER TABLE `user_verifies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_product_size_id_foreign` FOREIGN KEY (`product_size_id`) REFERENCES `products_size` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `products_color`
--
ALTER TABLE `products_color`
  ADD CONSTRAINT `products_color_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `products_color_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products_size`
--
ALTER TABLE `products_size`
  ADD CONSTRAINT `products_size_product_color_id_foreign` FOREIGN KEY (`product_color_id`) REFERENCES `products_color` (`id`),
  ADD CONSTRAINT `products_size_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`);

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
