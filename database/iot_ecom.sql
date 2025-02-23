-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2025 at 06:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iot_ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT 'admin',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `type`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'SuperAdmin', 'admin@admin.com', '01926241906', NULL, '$2y$12$w2p7rPYEU7CgaglwkytIPelLC7m.CrwBA2SEFscV1beZ7UL7ONh8a', NULL, 0, 'EKGkSj34BZtehBIn1zDyicaDsGetSJlvWAQRrkqIWq29NJg6JmpolleMYhrz', '2024-06-23 12:20:31', '2025-01-30 06:01:00'),
(4, 'Sabbir hossain', 'h.sabbir36@yahoo.com', '01926241906', NULL, '$2y$12$S6oT3M.vQCbm/1mLmnkGOOTCUIMqErtyM3C58cVPkZcOdzngjyIYm', NULL, 1, '50za0lCA47imx3NWcFmOupd3ezBJr0c9qHrlkx4QpZbb2htevQZYTiL45UXO', '2024-06-28 12:13:29', '2024-11-20 05:08:15'),
(5, 'saif hossainnn', 'korbin95@gmail.com', NULL, NULL, '$2y$12$puIoaq.o0Z4NFFBwV.W2de4AAJXXD2I2jGBxzB9rLHCLgCGrkbjJ2', NULL, 1, NULL, '2024-06-28 12:21:08', '2024-07-03 11:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attribute_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Color', 1, NULL, NULL),
(2, 'Size', 1, NULL, NULL),
(3, 'Weight', 1, NULL, NULL),
(4, 'Tag', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attrvalues`
--

CREATE TABLE `attrvalues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(255) DEFAULT NULL,
  `value` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attrvalues`
--

INSERT INTO `attrvalues` (`id`, `attribute_id`, `attribute_name`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Color', 'Red', 1, NULL, NULL),
(5, 1, 'Color', 'Sky Blue', 0, '2024-07-07 08:01:35', '2024-07-07 08:01:35'),
(6, 4, 'Tag', 'Vegetables', 1, '2024-07-07 11:43:43', '2024-07-07 11:43:43'),
(7, 4, 'Tag', 'Healthy', 1, '2024-07-07 11:43:57', '2024-07-07 11:43:57'),
(9, 1, 'Color', 'Purple', 1, '2024-07-09 00:02:29', '2024-07-09 00:02:29'),
(10, 1, 'Color', 'Lavender', 1, '2024-07-09 00:02:42', '2024-07-09 00:02:42'),
(11, 3, 'Weight', '1 KG', 1, '2024-07-12 05:24:39', '2024-07-12 05:24:39'),
(12, 3, 'Weight', '3 KG', 1, '2024-07-12 05:24:52', '2024-07-12 05:24:52'),
(13, 4, 'Tag', 'Nutritents', 1, '2024-07-19 03:04:29', '2024-07-19 03:04:29'),
(14, 2, 'Size', 'S', 1, '2024-07-27 08:51:19', '2024-07-27 08:51:19'),
(15, 2, 'Size', 'M', 1, '2024-07-27 08:51:28', '2024-07-27 08:51:28'),
(16, 2, 'Size', 'L', 1, '2024-07-27 08:51:39', '2024-07-27 08:51:39'),
(17, 2, 'Size', 'XL', 1, '2024-07-27 08:51:48', '2024-07-27 08:51:48'),
(18, 4, 'Tag', 'Sharee', 1, '2024-08-03 00:00:42', '2024-08-03 00:00:42'),
(19, 4, 'Tag', 'Dress', 1, '2024-08-03 00:00:52', '2024-08-03 00:00:52'),
(20, 1, 'Color', 'Blue', 1, '2024-10-26 01:17:06', '2024-10-26 01:17:06'),
(21, 1, 'Color', 'Brown', 1, '2024-10-26 01:17:16', '2024-10-26 01:17:16'),
(22, 2, 'Size', '38', 1, '2024-10-26 01:18:30', '2024-10-26 01:18:30'),
(23, 2, 'Size', '39', 1, '2024-10-26 01:18:39', '2024-10-26 01:18:39'),
(24, 2, 'Size', '40', 1, '2024-10-26 01:18:47', '2024-10-26 01:18:47'),
(25, 2, 'Size', '41', 1, '2024-10-26 01:18:53', '2024-10-26 01:18:53'),
(26, 2, 'Size', '42', 1, '2024-10-26 01:18:58', '2024-10-26 01:18:58'),
(27, 2, 'Size', '43', 1, '2024-10-26 01:19:07', '2024-10-26 01:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `banner_img` text DEFAULT NULL,
  `banner_link` text DEFAULT NULL,
  `banner_type` varchar(255) DEFAULT 'small' COMMENT 'small,medium,large',
  `banner_title_1` varchar(255) DEFAULT NULL,
  `banner_title_2` varchar(255) DEFAULT NULL,
  `banner_title_3` varchar(255) DEFAULT NULL,
  `banner_btn_name` varchar(255) DEFAULT NULL,
  `banner_btn_link` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `slug`, `banner_img`, `banner_link`, `banner_type`, `banner_title_1`, `banner_title_2`, `banner_title_3`, `banner_btn_name`, `banner_btn_link`, `status`, `created_at`, `updated_at`) VALUES
(4, '100-fresh-cow-milk', 'public/backend/assets/images/uploads/banners/1725654699.webp', '#', 'small', '100% Fresh Cow Milk', 'Starting at $14.99', NULL, 'Shop Now', '#', 1, '2024-09-06 14:31:39', '2024-09-07 05:05:02'),
(5, 'drink-sale', 'public/backend/assets/images/uploads/banners/1725708631.webp', NULL, 'small', 'Drink Sale', 'Water & Soft Drink', NULL, 'Shop Now', NULL, 1, '2024-09-07 05:30:31', '2024-09-07 05:30:31'),
(6, '100-organic', 'public/backend/assets/images/uploads/banners/1725708669.webp', NULL, 'small', '100% Organic', 'Quick Breakfast', NULL, 'Shop Now', NULL, 1, '2024-09-07 05:31:09', '2024-09-07 05:31:09'),
(7, 'summer-sale', 'public/backend/assets/images/uploads/banners/1725709289.webp', NULL, 'large', 'Summer Sale', '37% OFF', 'Free on all your order, Free Shipping and 30 days money-back guarantee', 'Shop Now', NULL, 1, '2024-09-07 05:41:29', '2024-09-07 05:41:29'),
(8, 'eum-eos-eos-eaque', 'public/backend/assets/images/uploads/banners/1725737676.webp', 'Dolorum facere labor', 'medium', 'Eum eos eos eaque', 'Libero ex velit occ', 'Est sed consectetur', 'Uta Mills', 'Magni corrupti rati', 0, '2024-09-07 13:34:36', '2024-09-08 09:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `basic_infos`
--

CREATE TABLE `basic_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_name` varchar(255) DEFAULT NULL,
  `black_logo` text NOT NULL,
  `light_logo` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_1` varchar(255) DEFAULT NULL,
  `fb_link` varchar(255) DEFAULT NULL,
  `x_link` varchar(255) DEFAULT NULL,
  `p_link` varchar(255) DEFAULT NULL,
  `youtube_link` varchar(255) DEFAULT NULL,
  `insta_link` varchar(255) DEFAULT NULL,
  `inside_dhaka_charge` int(11) DEFAULT NULL,
  `outside_dhaka_charge` int(11) DEFAULT NULL,
  `store_location` text DEFAULT NULL,
  `short_desc` text NOT NULL,
  `fb_pixel` text DEFAULT NULL,
  `google_analytics` text DEFAULT NULL,
  `chatbox_script` text DEFAULT NULL,
  `marquee_text` text DEFAULT NULL,
  `currency_symbol` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_infos`
--

INSERT INTO `basic_infos` (`id`, `website_name`, `black_logo`, `light_logo`, `email`, `phone_1`, `fb_link`, `x_link`, `p_link`, `youtube_link`, `insta_link`, `inside_dhaka_charge`, `outside_dhaka_charge`, `store_location`, `short_desc`, `fb_pixel`, `google_analytics`, `chatbox_script`, `marquee_text`, `currency_symbol`, `created_at`, `updated_at`) VALUES
(1, 'Gen-zilla', 'public/backend/images/logo/1729705556Screenshot_2024-10-23_234348-removebg-preview.png', 'public/backend/images/logo/1729705556Screenshot_2024-10-23_234348-removebg-preview.png', 'info@ecobazar.com', '(219) 555-0114', 'facebook.com/ecobazar', 'x.com/ecobazar', 'pinterest.com/ecobazar', 'youtube.com', 'insta.com', NULL, NULL, 'Lincoln- 344, Illinois, Chicago, USA', 'Morbi cursus porttitor enim lobortis molestie. Duis gravida turpis dui, eget bibendum magna congue nec', NULL, NULL, NULL, NULL, '৳', '2024-06-20 14:09:21', '2024-10-23 11:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_image` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `slug`, `brand_name`, `brand_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'samsung', 'Samsung', 'https://yt3.googleusercontent.com/TtoYXLkyKZu3EDOHAbLjhtpPKwW9eBa0vKacVOmFfq4qzG_Si5KHqzS_u86KO1VIoZJp11scbw=s900-c-k-c0x00ffffff-no-rj', 1, NULL, '2024-07-05 12:14:57'),
(3, 'lg', 'LG', 'public/backend/assets/images/uploads/brand/1720033545.png', 0, '2024-07-03 13:05:45', '2024-07-06 08:32:37'),
(6, 'panasonic', 'Panasonic', 'public/backend/assets/images/uploads/brand/1720503371.avif', 1, '2024-07-08 23:33:43', '2024-07-08 23:36:11'),
(7, 'ncb', 'NCB', 'public/backend/assets/images/uploads/brand/1722533818.jpeg', 0, '2024-08-01 11:36:58', '2025-01-27 16:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL DEFAULT 'female' COMMENT 'male,female',
  `slug` varchar(255) NOT NULL,
  `category_img` text DEFAULT NULL,
  `category_img_path` text DEFAULT NULL,
  `front_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=active,0=inactive',
  `topCategory_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=active,0=inactive',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `gender`, `slug`, `category_img`, `category_img_path`, `front_status`, `topCategory_status`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Women\'s & Girls\' Fashion', 'female', 'womens-girls-fashion', '75338720.jpg', 'public/backend/images/category/92690879.webp', 1, 1, 1, '2024-08-01 10:29:54', '2024-11-08 13:24:51'),
(4, 'Health & Beauty', 'female', 'health-beauty', '2409603.jpeg', 'public/backend/images/category/2409603.jpeg', 1, 1, 1, '2024-08-01 10:30:59', '2024-08-01 10:30:59'),
(5, 'Watches, Bags, Jewellery', 'female', 'watches-bags-jewellery', '15934357.webp', 'public/backend/images/category/15934357.webp', 1, 1, 1, '2024-08-01 10:34:04', '2025-01-27 16:19:15'),
(6, 'Men\'s & Boys\' Fashion', 'male', 'mens-boys-fashion', '54306198.jpg', 'public/backend/images/category/7091697.avif', 1, 1, 1, '2024-08-01 10:43:25', '2024-08-04 09:08:25'),
(7, 'Mother & Baby', 'female', 'mother-baby', '45798660.jpeg', 'public/backend/images/category/26569002.webp', 1, 1, 1, '2024-08-01 10:45:06', '2025-02-04 19:08:53'),
(8, 'Gwendolyn Bender', 'male', 'gwendolyn-bender', '55331913.avif', 'public/backend/images/category/55331913.avif', 0, 0, 1, '2025-02-03 19:16:15', '2025-02-04 19:08:59');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attrvalue_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_title` varchar(255) NOT NULL,
  `productRegularPrice` decimal(10,2) DEFAULT NULL,
  `productSalePrice` decimal(10,2) NOT NULL,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `attrvalue_id`, `product_id`, `color_title`, `productRegularPrice`, `productSalePrice`, `discount_percentage`, `created_at`, `updated_at`) VALUES
(11, 1, 32, 'Red', 5000.00, 4750.00, 5, '2024-08-01 11:45:05', '2024-08-08 16:08:09'),
(12, 9, 32, 'Purple', 5500.00, 5225.00, 5, '2024-08-01 11:45:05', '2024-08-08 16:08:09'),
(13, 10, 32, 'Lavender', 6000.00, 5400.00, 10, '2024-08-01 11:45:05', '2024-08-08 16:08:09'),
(14, 20, 34, 'Blue', 2000.00, 1900.00, 5, '2024-10-26 01:22:03', '2024-10-27 05:25:17'),
(15, 21, 34, 'Brown', 2000.00, 1900.00, 5, '2024-10-26 01:22:03', '2024-10-27 05:25:17'),
(16, 1, 35, 'Red', 2000.00, 1000.00, 50, '2024-11-01 11:25:21', '2024-11-02 11:56:01'),
(17, 10, 35, 'Lavender', 2000.00, 1000.00, 50, '2024-11-01 11:25:21', '2024-11-02 11:56:01'),
(18, 20, 35, 'Blue', 2000.00, 1000.00, 50, '2024-11-01 11:25:21', '2024-11-02 11:56:01'),
(27, 1, 44, 'Red', 500.00, 475.00, 5, '2025-02-05 16:58:51', '2025-02-05 17:04:40'),
(28, 9, 44, 'Purple', 600.00, 570.00, 5, '2025-02-05 16:58:51', '2025-02-05 17:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_name` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `max_used` int(11) DEFAULT 1,
  `total_used` int(11) DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1=active, 0=deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_name`, `code`, `discount`, `amount`, `start_date`, `expire_date`, `quantity`, `max_used`, `total_used`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Eid Special 2024', 'EID2024', 2, NULL, '2024-01-15', '2025-06-05', 50, 4, 0, 1, '2024-09-02 12:21:58', '2024-09-02 13:02:53');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `address_1` text NOT NULL,
  `address_2` text DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `thana` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `state_district` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT 'Bangladesh',
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `company_name`, `address_1`, `address_2`, `area`, `thana`, `gender`, `state_district`, `zip`, `country`, `phone`, `email`, `status`, `created_at`, `updated_at`) VALUES
(8, 'Jennifer', 'Yolanda', 'Geoffrey', 'Joel', 'Moses', NULL, NULL, NULL, 'Dhaka', 'Iris', 'Bangladesh', 'Lester', 'Lucius', 1, '2024-08-16 15:20:58', '2024-08-16 15:20:58'),
(9, 'Jennifer', 'Yolanda', 'Geoffrey', 'Joel', 'Moses', NULL, NULL, NULL, 'Dhaka', 'Iris', 'Bangladesh', 'Lester', 'Lucius', 1, '2024-08-16 15:21:42', '2024-08-16 15:21:42'),
(10, 'Amela', 'Mallory', 'Mariko', 'Cedric', 'Remedios', NULL, NULL, NULL, 'Dhaka', 'Amelia', 'Bangladesh', '01318503492', 'Louis@gmail.com', 1, '2024-08-20 14:46:29', '2024-08-20 14:46:29'),
(11, 'Dexter', 'Colorado', 'Elton', 'Ira', 'Hall', NULL, NULL, NULL, 'Dhaka', 'Scott', 'Bangladesh', 'Hasad', 'August', 1, '2024-08-28 14:10:16', '2024-08-28 14:10:16'),
(12, 'Denise', 'Buffy', 'Joseph', 'Alea', 'Colton', NULL, NULL, NULL, 'Dhaka', 'Nell', 'Bangladesh', 'Adria', 'Christian', 1, '2024-08-28 14:11:19', '2024-08-28 14:11:19'),
(37, 'Sybill', 'Lunea', 'Mona', 'Vladimir', 'Paul', NULL, NULL, NULL, 'Dhaka', 'Ann', 'Bangladesh', 'Teegan', 'Thomas', 1, '2024-08-30 08:36:48', '2024-08-30 08:36:48'),
(39, 'Nero', 'Lynn', 'Fitzgerald', 'Ignatius', 'Emerald', NULL, NULL, NULL, 'Dhaka', 'Lucius', 'Bangladesh', 'Nicole', 'Madeline', 1, '2024-08-30 08:40:07', '2024-08-30 08:40:07'),
(42, 'Iris', 'Gail', 'Clio', 'Reese', 'Otto', NULL, NULL, NULL, 'Dhaka', 'Guinevere', 'Bangladesh', 'Magee', 'Quincy', 1, '2024-08-30 08:47:59', '2024-08-30 08:47:59'),
(43, 'Colt', 'Basia', 'Mari', 'Raja', 'Carl', NULL, NULL, NULL, 'Dhaka', 'Emma', 'Bangladesh', 'Baker', 'Ima', 1, '2024-08-30 08:48:45', '2024-08-30 08:48:45'),
(44, 'Callie', 'Kyra', 'Blair', 'Jaime', 'Illiana', NULL, NULL, NULL, 'Dhaka', 'Hermione', 'Bangladesh', 'Nicole', 'Farrah', 1, '2024-08-30 08:56:15', '2024-08-30 08:56:15'),
(45, 'Cora', 'Haviva', 'Blossom', 'Jena', 'Zoe', NULL, NULL, NULL, 'Dhaka', 'Jelani', 'Bangladesh', 'Mara', 'Orla', 1, '2024-08-30 09:11:34', '2024-08-30 09:11:34'),
(46, 'Joelle', 'Wendy', 'Theodore', 'Keane', 'Jael', NULL, NULL, NULL, 'Dhaka', 'Christine', 'Bangladesh', 'September', 'August', 1, '2024-08-30 09:15:47', '2024-08-30 09:15:47'),
(53, 'Price', 'Sharon', 'Axel', 'Eliana', 'Quinn', NULL, NULL, NULL, 'Dhaka', 'Raymond', 'Bangladesh', 'Shea', 'Phyllis', 1, '2024-08-30 14:52:01', '2024-08-30 14:52:01'),
(54, 'Vielka', 'James', 'Nicholas', 'Odette', 'Michael', NULL, NULL, NULL, 'Dhaka', 'Pearl', 'Bangladesh', '0192624190', 'Dolan', 1, '2024-09-11 11:05:21', '2024-09-11 11:05:21'),
(55, 'Reagan', 'Evan', 'Mariam', 'Joy', 'David', NULL, NULL, NULL, 'Dhaka', 'Carol', 'Bangladesh', '025757353', 'Summer', 1, '2024-09-11 11:53:48', '2024-09-11 11:53:48'),
(56, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 11:55:27', '2024-09-11 11:55:27'),
(57, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 11:55:54', '2024-09-11 11:55:54'),
(58, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 11:57:48', '2024-09-11 11:57:48'),
(59, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 11:58:16', '2024-09-11 11:58:16'),
(60, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 11:58:30', '2024-09-11 11:58:30'),
(61, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:35:29', '2024-09-11 12:35:29'),
(62, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:39:53', '2024-09-11 12:39:53'),
(63, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:40:53', '2024-09-11 12:40:53'),
(64, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:41:57', '2024-09-11 12:41:57'),
(65, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:45:06', '2024-09-11 12:45:06'),
(66, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:45:17', '2024-09-11 12:45:17'),
(67, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:45:46', '2024-09-11 12:45:46'),
(68, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:45:56', '2024-09-11 12:45:56'),
(69, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:46:21', '2024-09-11 12:46:21'),
(70, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:46:27', '2024-09-11 12:46:27'),
(71, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:48:53', '2024-09-11 12:48:53'),
(72, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:49:00', '2024-09-11 12:49:00'),
(73, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:50:03', '2024-09-11 12:50:03'),
(74, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:50:45', '2024-09-11 12:50:45'),
(75, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:51:04', '2024-09-11 12:51:04'),
(76, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:51:17', '2024-09-11 12:51:17'),
(77, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:51:36', '2024-09-11 12:51:36'),
(78, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:52:06', '2024-09-11 12:52:06'),
(79, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:52:37', '2024-09-11 12:52:37'),
(80, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:53:32', '2024-09-11 12:53:32'),
(81, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:02:12', '2024-09-11 13:02:12'),
(82, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:02:39', '2024-09-11 13:02:39'),
(83, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:03:35', '2024-09-11 13:03:35'),
(84, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:06:13', '2024-09-11 13:06:13'),
(85, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:06:28', '2024-09-11 13:06:28'),
(86, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:06:59', '2024-09-11 13:06:59'),
(87, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:08:11', '2024-09-11 13:08:11'),
(88, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:09:38', '2024-09-11 13:09:38'),
(89, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:09:59', '2024-09-11 13:09:59'),
(90, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:10:34', '2024-09-11 13:10:34'),
(91, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:10:40', '2024-09-11 13:10:40'),
(92, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:11:33', '2024-09-11 13:11:33'),
(93, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:11:50', '2024-09-11 13:11:50'),
(94, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:12:14', '2024-09-11 13:12:14'),
(95, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:12:48', '2024-09-11 13:12:48'),
(96, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:13:16', '2024-09-11 13:13:16'),
(97, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:13:33', '2024-09-11 13:13:33'),
(98, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:14:04', '2024-09-11 13:14:04'),
(99, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:14:17', '2024-09-11 13:14:17'),
(100, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:15:04', '2024-09-11 13:15:04'),
(101, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:15:26', '2024-09-11 13:15:26'),
(102, 'Cedric', 'Uta', 'Jasmine', 'Heidi', 'Tarik', NULL, NULL, NULL, 'Dhaka', 'Sylvester', 'Bangladesh', '01318503492', 'Raymond', 1, '2024-09-13 08:07:02', '2024-09-13 08:07:02'),
(103, 'Gage', 'Sebastian', 'Carson', 'Herman', 'Ethan', NULL, NULL, NULL, 'Dhaka', 'Remedios', 'Bangladesh', 'Leila', 'Maya', 1, '2024-10-24 04:43:32', '2024-10-24 04:43:32'),
(104, 'Kirestin', 'Chase', 'Christine', 'Minerva', 'Venus', NULL, NULL, NULL, 'Dhaka', 'Odette', 'Bangladesh', 'Keely', 'Galena', 1, '2024-11-04 12:35:46', '2024-11-04 12:35:46'),
(105, 'Keiko', 'Emmanuel', 'Hammett', 'Cadman', 'Nevada', NULL, NULL, NULL, 'Dhaka', 'Lucas', 'Bangladesh', 'Glenna', 'Adam', 1, '2024-11-04 12:37:20', '2024-11-04 12:37:20'),
(106, 'Graham', 'Cruz', 'Byron', 'Tanek', 'Melvin', NULL, NULL, NULL, 'Dhaka', 'Upton', 'Bangladesh', 'Guy', 'Kirk', 1, '2024-11-04 12:38:10', '2024-11-04 12:38:10'),
(107, 'Grace', 'Kermit', 'Fulton', 'Gary', 'Mari', NULL, NULL, NULL, 'Dhaka', 'Mara', 'Bangladesh', 'Hermione', 'Eve', 1, '2024-11-04 12:48:29', '2024-11-04 12:48:29'),
(108, 'Orson', 'Brianna', 'Yetta', 'Burke', 'Sawyer', NULL, NULL, NULL, 'Dhaka', 'Tate', 'Bangladesh', 'Kelly', 'Carol', 1, '2024-11-20 04:59:24', '2024-11-20 04:59:24'),
(109, 'Nathan', 'Eric', 'Driscoll', 'Nadine', 'Jenna', NULL, NULL, NULL, 'Dhaka', 'Tate', 'Bangladesh', 'Jerome', 'Erica', 1, '2024-11-20 05:00:38', '2024-11-20 05:00:38'),
(110, 'Mohsin', 'Mea', 'SR group', 'Mipur 12', 'Dhaka', NULL, NULL, NULL, 'Dhaka', '1216', 'Bangladesh', '01718756084', 'admin@gmail.com', 1, '2025-01-19 04:14:14', '2025-01-19 04:14:14'),
(111, 'Mohsin', 'Mea', 'SR group', 'Mipur 12', 'Dhaka', NULL, NULL, NULL, 'Dhaka', '1216', 'Bangladesh', '01718756084', 'h.sabbir36@yahoo.com', 1, '2025-01-19 04:15:34', '2025-01-19 04:15:34'),
(112, 'Lysandra', 'Brett', 'Austin', 'Dhaka', 'Mirpur', NULL, NULL, NULL, 'Dhaka', 'Patrick', 'Bangladesh', '01926241906', 'Kennan@gmail.com', 1, '2025-01-27 09:34:35', '2025-01-27 09:34:35'),
(113, 'Judith', 'Sierra', 'Clayton', 'Keaton', 'Anne', NULL, NULL, NULL, 'Dhaka', 'Driscoll', 'Bangladesh', '01772554516', 'Tamara@gmail.com', 1, '2025-01-27 09:38:09', '2025-01-27 09:38:09'),
(114, 'Carol', 'Yasir', 'Sophia', 'Dhaka', 'Zahir', NULL, NULL, NULL, 'Dhaka', 'Garrett', 'Bangladesh', '01318503492', 'Rose@gmail.com', 1, '2025-01-27 15:40:47', '2025-01-27 15:40:47'),
(115, 'Nell', 'Nayda', 'Willa', 'Chelsea', 'Dieter', 'Jonas', 'Ciara', 'male', 'Dhaka', 'Rama', 'Bangladesh', 'Shannon', 'jakyji@mailinator.com', 1, '2025-01-29 08:49:41', '2025-01-29 08:49:41'),
(116, 'Stuff', NULL, NULL, 'asdas', NULL, NULL, NULL, 'male', 'Dhaka', '1240', 'Bangladesh', '01318503492', 'sh1389045@gmail.com', 1, '2025-01-30 18:23:48', '2025-01-30 18:23:48'),
(117, 'Sabbir hossain', NULL, NULL, 'Dhaka North City corporation, Dhaka', NULL, NULL, NULL, 'male', 'Dhaka', '1230', 'Bangladesh', '01926241905', 'h.sabbir36@yahoo.com', 1, '2025-01-30 18:42:30', '2025-01-30 18:42:30'),
(118, 'Hollee', 'Zenaida', 'Hermione', 'Duncan', 'Jada', 'Burton', 'Cyrus', 'female', 'Dhaka', 'Jamal', 'Bangladesh', 'Dale', 'wuziji@mailinator.com', 1, '2025-02-03 18:41:19', '2025-02-03 18:41:19'),
(119, 'Sacha', 'Leroy', 'Brock', 'Ila', 'Baxter', 'Stacey', 'Gwendolyn', 'male', 'Dhaka', 'Tiger', 'Bangladesh', 'Emily', 'xuduton@mailinator.com', 1, '2025-02-05 16:24:02', '2025-02-05 16:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_charges`
--

CREATE TABLE `delivery_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `delivery_charge` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_charges`
--

INSERT INTO `delivery_charges` (`id`, `delivery_title`, `slug`, `delivery_charge`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Inside Dhaka', 'inside-dhaka', 60, 1, NULL, '2025-01-30 06:24:40'),
(2, 'Outside Dhaka', 'outside-dhaka', 120, 1, '2025-01-30 06:00:56', '2025-01-30 06:13:51'),
(5, 'Sub area', 'sub-area', 60, 1, '2025-01-30 15:23:37', '2025-01-30 15:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '0001_01_01_000000_create_users_table', 1),
(11, '0001_01_01_000001_create_cache_table', 1),
(12, '0001_01_01_000002_create_jobs_table', 1),
(13, '2024_06_16_134501_create_admins_table', 1),
(14, '2024_06_17_194041_create_pages_table', 1),
(15, '2024_06_19_130434_create_basic_infos_table', 1),
(17, '2024_06_20_192342_create_subcategories_table', 1),
(18, '2024_06_20_192432_create_brands_table', 1),
(19, '2024_06_21_155212_create_sliders_table', 2),
(20, '2024_06_21_160221_create_banners_table', 3),
(21, '2024_06_21_163121_create_products_table', 4),
(22, '2024_06_21_163158_create_product_details_table', 4),
(23, '2024_06_21_173303_create_tags_table', 5),
(24, '2024_06_21_173846_create_product_tag_table', 5),
(26, '2024_06_21_193623_create_permission_tables', 7),
(27, '2024_07_05_181617_create_attributes_table', 8),
(28, '2024_07_05_181657_create_attrvalues_table', 8),
(29, '2024_06_20_191855_create_categories_table', 9),
(31, '2024_07_13_143822_create_coupons_table', 10),
(32, '2024_06_21_181703_create_reviews_table', 11),
(34, '2024_07_19_100337_create_weights_table', 12),
(35, '2024_07_19_100338_create_sizes_table', 12),
(36, '2024_07_19_100422_create_colors_table', 12),
(37, '2024_08_16_184705_create_customers_table', 13),
(38, '2024_08_16_184709_create_orders_table', 13),
(39, '2024_08_16_184728_create_order_products_table', 13),
(40, '2024_09_13_063359_create_theme_colors_table', 14),
(41, '2024_09_13_142429_create_wishlists_table', 15),
(42, '2025_01_30_112509_create_delivery_charges_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 2),
(7, 'App\\Models\\Admin', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `invoiceID` varchar(255) NOT NULL,
  `tran_id` longtext DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_amount` int(11) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `currency` varchar(255) NOT NULL DEFAULT 'BDT',
  `shipping_charge` int(11) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `subtotal` int(11) NOT NULL,
  `discount_amount` varchar(255) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `complete_date` date DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `coupon_id`, `customer_id`, `invoiceID`, `tran_id`, `payment_method`, `payment_amount`, `payment_status`, `order_status`, `currency`, `shipping_charge`, `tax`, `order_note`, `subtotal`, `discount_amount`, `total`, `order_date`, `delivery_date`, `complete_date`, `admin_id`, `status`, `created_at`, `updated_at`) VALUES
(6, 3, 4, 8, 'BM630216', NULL, 'COD', NULL, 'Paid', 'Processing', 'BDT', 60, NULL, 'Magna ipsum eum elig', 37800, NULL, 370800, '2024-08-16', NULL, NULL, NULL, 'Pending', '2024-08-16 15:20:58', '2024-11-09 02:45:51'),
(8, 3, 4, 10, 'BM249326', NULL, 'COD', NULL, 'Paid', 'Processing', 'BDT', 120, NULL, 'Accusamus aliquid ev', 11050, NULL, 110050, '2024-08-20', NULL, NULL, NULL, 'Pending', '2024-08-20 14:46:29', '2024-11-09 02:45:57'),
(9, 3, 4, 11, 'BM471092', NULL, 'cod', NULL, 'Paid', 'Delivered', 'BDT', 120, NULL, 'Quaerat illo officia', 5600, NULL, 50600, '2024-08-28', NULL, NULL, NULL, 'Pending', '2024-08-28 14:10:16', '2025-02-02 20:05:34'),
(10, NULL, NULL, 12, 'BM449527', NULL, 'sslcommerzz', NULL, 'Pending', 'Delivered', 'BDT', 120, NULL, 'Beatae qui sequi qui', 5600, NULL, 50600, '2024-08-28', NULL, NULL, NULL, 'Pending', '2024-08-28 14:11:19', '2025-02-02 20:32:59'),
(35, NULL, NULL, 37, 'BM362611', NULL, 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Voluptate provident', 5600, NULL, 5600, '2024-08-30', NULL, NULL, NULL, 'Pending', '2024-08-30 08:36:48', '2024-08-30 08:36:48'),
(37, NULL, NULL, 39, 'BM610691', NULL, 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Fuga Dolorem volupt', 5600, NULL, 5600, '2024-08-30', NULL, NULL, NULL, 'Pending', '2024-08-30 08:40:07', '2024-08-30 08:40:07'),
(40, NULL, NULL, 42, 'BM594288', NULL, 'cod', NULL, 'Pending', 'Delivered', 'BDT', 120, NULL, 'Officia quo dolore s', 5600, NULL, 5600, '2024-08-30', NULL, NULL, NULL, 'Pending', '2024-08-30 08:47:59', '2025-02-02 20:33:01'),
(41, NULL, NULL, 43, 'BM655011', NULL, 'sslcommerzz', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Fuga Reprehenderit', 5600, NULL, 5600, '2024-08-30', NULL, NULL, NULL, 'Pending', '2024-08-30 08:48:45', '2024-08-30 08:48:45'),
(42, NULL, NULL, 44, 'BM696044', '66d1dd8f5a707', 'sslcommerzz', NULL, 'Pending', 'Delivered', 'BDT', 120, NULL, 'Consequuntur est mai', 5600, NULL, 5600, '2024-08-30', NULL, NULL, NULL, 'Pending', '2024-08-30 08:56:15', '2025-02-02 20:33:04'),
(43, NULL, NULL, 45, 'BM539543', '66d1e126ee96b', 'sslcommerzz', NULL, 'Pending', 'Pending', 'BDT', 120, NULL, 'Fugit inventore vol', 5600, NULL, 5600, '2024-08-30', NULL, NULL, NULL, 'Pending', '2024-08-30 09:11:34', '2024-08-30 09:11:34'),
(44, NULL, NULL, 46, 'BM146562', '66d1e2232b7ab', 'sslcommerzz', NULL, 'Pending', 'Processing', 'BDT', 120, NULL, 'Veniam tempora eum', 5600, NULL, 5600, '2024-08-30', NULL, NULL, NULL, 'Pending', '2024-08-30 09:15:47', '2024-11-09 02:45:45'),
(45, NULL, NULL, 53, 'BM952564', '66d230f1e455f', 'cod', NULL, 'Pending', 'Delivered', 'BDT', 120, NULL, 'Voluptate aut deseru', 5600, NULL, 5720, '2024-08-30', NULL, NULL, NULL, 'Pending', '2024-08-30 14:52:01', '2025-02-02 20:33:06'),
(46, NULL, NULL, 54, 'BM624875', '66e1cdd18b8a1', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Adipisci nostrum nec', 5600, NULL, 5660, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 11:05:21', '2024-09-11 11:05:21'),
(47, NULL, NULL, 55, 'BM882129', '66e1d92c419d4', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Lorem ea sint dolore', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 11:53:48', '2024-09-11 11:53:48'),
(48, NULL, NULL, 56, 'BM810500', '66e1d98feb3e7', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 11:55:27', '2024-09-11 11:55:27'),
(49, NULL, NULL, 57, 'BM434611', '66e1d9aa566ae', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 11:55:54', '2024-09-11 11:55:54'),
(50, NULL, NULL, 58, 'BM971446', '66e1da1cb0521', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 11:57:48', '2024-09-11 11:57:48'),
(51, NULL, NULL, 59, 'BM435217', '66e1da38a5aa4', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 11:58:16', '2024-09-11 11:58:16'),
(52, NULL, NULL, 60, 'BM570547', '66e1da46658ed', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 11:58:30', '2024-09-11 11:58:30'),
(53, NULL, NULL, 61, 'BM708440', '66e1e2f1d5b7f', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:35:29', '2024-09-11 12:35:29'),
(54, NULL, NULL, 62, 'BM923420', '66e1e3f9d41ff', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:39:53', '2024-09-11 12:39:53'),
(55, NULL, NULL, 63, 'BM652270', '66e1e435a9a82', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:40:53', '2024-09-11 12:40:53'),
(56, NULL, NULL, 64, 'BM770350', '66e1e4757692d', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:41:57', '2024-09-11 12:41:57'),
(57, NULL, NULL, 65, 'BM545141', '66e1e5329bff9', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:45:06', '2024-09-11 12:45:06'),
(58, NULL, NULL, 66, 'BM585655', '66e1e53d0b57c', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:45:17', '2024-09-11 12:45:17'),
(59, NULL, NULL, 67, 'BM295617', '66e1e55ae07d9', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:45:46', '2024-09-11 12:45:46'),
(60, NULL, NULL, 68, 'BM713340', '66e1e564dde88', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:45:56', '2024-09-11 12:45:56'),
(61, NULL, NULL, 69, 'BM912489', '66e1e57d96563', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:46:21', '2024-09-11 12:46:21'),
(62, NULL, NULL, 70, 'BM985193', '66e1e5836bf0f', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:46:27', '2024-09-11 12:46:27'),
(63, NULL, NULL, 71, 'BM849039', '66e1e615187bd', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:48:53', '2024-09-11 12:48:53'),
(64, NULL, NULL, 72, 'BM238922', '66e1e61cd2445', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:49:00', '2024-09-11 12:49:00'),
(65, NULL, NULL, 73, 'BM527541', '66e1e65bbafe7', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:50:03', '2024-09-11 12:50:03'),
(66, NULL, NULL, 74, 'BM802244', '66e1e68597890', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:50:45', '2024-09-11 12:50:45'),
(67, NULL, NULL, 75, 'BM919315', '66e1e69806a32', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:51:04', '2024-09-11 12:51:04'),
(68, NULL, NULL, 76, 'BM871497', '66e1e6a548717', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:51:17', '2024-09-11 12:51:17'),
(69, NULL, NULL, 77, 'BM723410', '66e1e6b8a2b1a', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:51:36', '2024-09-11 12:51:36'),
(70, NULL, NULL, 78, 'BM387304', '66e1e6d608aa3', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:52:06', '2024-09-11 12:52:06'),
(71, NULL, NULL, 79, 'BM957006', '66e1e6f55365d', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:52:37', '2024-09-11 12:52:37'),
(72, NULL, NULL, 80, 'BM311866', '66e1e72c14f16', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorum veniam qui', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 12:53:32', '2024-09-11 12:53:32'),
(73, NULL, NULL, 81, 'BM515845', '66e1e934a64a9', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:02:12', '2024-09-11 13:02:12'),
(74, NULL, NULL, 82, 'BM310201', '66e1e94f1969f', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:02:39', '2024-09-11 13:02:39'),
(75, NULL, NULL, 83, 'BM146384', '66e1e987e1eea', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:03:35', '2024-09-11 13:03:35'),
(76, NULL, NULL, 84, 'BM395101', '66e1ea253278a', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:06:13', '2024-09-11 13:06:13'),
(77, NULL, NULL, 85, 'BM147506', '66e1ea344b849', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:06:28', '2024-09-11 13:06:28'),
(78, NULL, NULL, 86, 'BM167376', '66e1ea5354b89', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:06:59', '2024-09-11 13:06:59'),
(79, NULL, NULL, 87, 'BM605557', '66e1ea9b7f824', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:08:11', '2024-09-11 13:08:11'),
(80, NULL, NULL, 88, 'BM998241', '66e1eaf2ae7ef', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:09:38', '2024-09-11 13:09:38'),
(81, NULL, NULL, 89, 'BM849035', '66e1eb07da897', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:09:59', '2024-09-11 13:09:59'),
(82, NULL, NULL, 90, 'BM803323', '66e1eb2a61dac', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:10:34', '2024-09-11 13:10:34'),
(83, NULL, NULL, 91, 'BM687381', '66e1eb30321b9', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:10:40', '2024-09-11 13:10:40'),
(84, NULL, NULL, 92, 'BM306151', '66e1eb656a2c0', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:11:33', '2024-09-11 13:11:33'),
(85, NULL, NULL, 93, 'BM339681', '66e1eb7654033', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:11:50', '2024-09-11 13:11:50'),
(86, NULL, NULL, 94, 'BM737783', '66e1eb8e9a67b', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:12:14', '2024-09-11 13:12:14'),
(87, NULL, NULL, 95, 'BM362496', '66e1ebb0b346b', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:12:48', '2024-09-11 13:12:48'),
(88, NULL, NULL, 96, 'BM917705', '66e1ebccb03d7', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:13:16', '2024-09-11 13:13:16'),
(89, NULL, NULL, 97, 'BM242275', '66e1ebdd9132b', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:13:33', '2024-09-11 13:13:33'),
(90, NULL, NULL, 98, 'BM493286', '66e1ebfcdc6b9', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:14:04', '2024-09-11 13:14:04'),
(91, NULL, NULL, 99, 'BM299649', '66e1ec090b5e6', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:14:17', '2024-09-11 13:14:17'),
(92, NULL, NULL, 100, 'BM972842', '66e1ec38cea8f', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:15:04', '2024-09-11 13:15:04'),
(93, NULL, NULL, 101, 'BM948960', '66e1ec4e096eb', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Anim veritatis aut s', 11125, NULL, 11185, '2024-09-11', NULL, NULL, NULL, 'Pending', '2024-09-11 13:15:26', '2024-09-11 13:15:26'),
(94, 4, NULL, 102, 'BM563210', '66e4470607dec', 'cod', NULL, 'Pending', 'Processing', 'BDT', 60, NULL, 'Assumenda consectetu', 16800, NULL, 16860, '2024-09-13', NULL, NULL, NULL, 'Pending', '2024-09-13 08:07:02', '2024-10-24 04:26:53'),
(95, 4, NULL, 103, 'BM127709', '671a24d4e93b1', 'stripe', NULL, 'Pending', 'Pending', 'BDT', 120, NULL, 'Alias similique labo', 10800, NULL, 10920, '2024-10-24', NULL, NULL, NULL, 'Pending', '2024-10-24 04:43:32', '2024-10-24 04:44:44'),
(96, NULL, NULL, 104, 'BM793820', '67291402af5f1', 'sslcommerzz', NULL, 'Paid', 'Pending', 'BDT', 60, NULL, 'Ut amet fuga Est c', 1000, NULL, 1060, '2024-11-04', NULL, NULL, NULL, 'Pending', '2024-11-04 12:35:46', '2024-11-04 12:35:46'),
(97, NULL, NULL, 105, 'BM282177', '67291460c7d0b', 'cod', NULL, 'Pending', 'Pending', 'BDT', 120, NULL, 'Fuga Nihil adipisic', 1000, NULL, 1120, '2024-11-04', NULL, NULL, NULL, 'Pending', '2024-11-04 12:37:20', '2024-11-04 12:37:20'),
(98, NULL, NULL, 106, 'BM666499', '6729149249e43', 'sslcommerzz', NULL, 'Paid', 'Pending', 'BDT', 60, NULL, 'Qui labore ut et non', 784, NULL, 844, '2024-11-04', NULL, NULL, NULL, 'Pending', '2024-11-04 12:38:10', '2024-11-04 12:38:10'),
(99, NULL, NULL, 107, 'BM787354', '672916fd9219e', 'sslcommerzz', NULL, 'Pending', 'Processing', 'BDT', 120, NULL, 'Nostrud quos et et i', 1000, NULL, 1120, '2024-11-04', NULL, NULL, NULL, 'Pending', '2024-11-04 12:48:29', '2024-11-09 00:21:32'),
(100, NULL, NULL, 108, 'BM144960', '673dc10caa66e', 'paypal', NULL, 'Pending', 'Pending', 'BDT', 120, NULL, 'Tempor amet iusto e', 2000, NULL, 2120, '2024-11-20', NULL, NULL, NULL, 'Pending', '2024-11-20 04:59:24', '2024-11-20 04:59:24'),
(101, NULL, NULL, 109, 'BM392836', '673dc156f0802', 'sslcommerzz', NULL, 'Pending', 'Delivered', 'BDT', 120, NULL, 'Dolor dignissimos eu', 1000, NULL, 1120, '2024-11-20', NULL, NULL, NULL, 'Pending', '2024-11-20 05:00:38', '2025-02-03 04:46:42'),
(102, NULL, NULL, 110, 'BM681957', '678cd0767f8ab', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, NULL, 1900, NULL, 1960, '2025-01-19', NULL, NULL, NULL, 'Pending', '2025-01-19 04:14:14', '2025-01-19 04:14:14'),
(103, NULL, NULL, 111, 'BM185170', '678cd0c6466fb', 'sslcommerzz', NULL, 'Paid', 'Pending', 'BDT', 60, NULL, NULL, 1900, NULL, 1960, '2025-01-19', NULL, NULL, NULL, 'Pending', '2025-01-19 04:15:34', '2025-02-03 17:57:03'),
(104, NULL, NULL, 112, 'BM251913', '6797a78bb0841', 'sslcommerzz', NULL, 'Paid', 'Pending', 'BDT', 60, NULL, 'Id mollit eiusmod q', 10275, NULL, 10335, '2025-01-27', NULL, NULL, NULL, 'Pending', '2025-01-27 09:34:35', '2025-01-27 09:34:35'),
(105, NULL, NULL, 113, 'BM305925', '6797a86174b0c', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dicta tempora magna', 11050, NULL, 11110, '2025-01-27', NULL, NULL, NULL, 'Pending', '2025-01-27 09:38:09', '2025-01-27 09:38:09'),
(106, NULL, NULL, 114, 'BM700565', '6797a8ff9a25e', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Labore voluptas beat', 1000, NULL, 1060, '2025-01-27', NULL, NULL, NULL, 'Pending', '2025-01-27 15:40:47', '2025-01-27 15:40:47'),
(107, NULL, NULL, 115, 'BM415341', '6799eba587e84', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Qui aperiam porro ve', 5400, NULL, 5460, '2025-01-29', NULL, NULL, NULL, 'Pending', '2025-01-29 08:49:41', '2025-01-30 06:28:07'),
(108, 13, NULL, 116, 'BM598569', '679bc3b4b583f', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, NULL, 1000, NULL, 1060, '2025-01-31', NULL, NULL, NULL, 'Pending', '2025-01-30 18:23:48', '2025-01-30 18:23:48'),
(109, 4, NULL, 117, 'BM387966', '679bc8160f735', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, NULL, 1000, NULL, 1060, '2025-01-31', NULL, NULL, NULL, 'Pending', '2025-01-30 18:42:30', '2025-01-30 18:42:30'),
(110, NULL, NULL, 118, 'BM257676', '67a10dcf618f6', 'cod', NULL, 'Pending', 'Delivered', 'BDT', 60, NULL, 'Magni quia quidem di', 1568, NULL, 1628, '2025-02-04', NULL, NULL, NULL, 'Pending', '2025-02-03 18:41:19', '2025-02-03 18:41:45'),
(111, 4, NULL, 119, 'BM371446', '67a390a2c7c3b', 'cod', NULL, 'Pending', 'Pending', 'BDT', 60, NULL, 'Dolorem non est arch', 1900, NULL, 1960, '2025-02-05', NULL, NULL, NULL, 'Pending', '2025-02-05 16:24:02', '2025-02-05 16:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_SKU` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `purchase_price` int(11) NOT NULL DEFAULT 0,
  `size` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `length` varchar(255) DEFAULT NULL,
  `product_discount` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `vendor_id`, `product_name`, `product_SKU`, `quantity`, `product_price`, `purchase_price`, `size`, `color`, `weight`, `length`, `product_discount`, `total`, `created_at`, `updated_at`) VALUES
(4, 6, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5400, 0, 'M', NULL, NULL, NULL, NULL, 5400, '2024-08-16 15:20:58', '2024-08-16 15:20:58'),
(5, 6, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5400, 0, 'M', 'Purple', NULL, NULL, NULL, 5400, '2024-08-16 15:20:58', '2024-08-16 15:20:58'),
(6, 6, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 5, 5400, 0, 'M', 'Lavender', NULL, NULL, NULL, 27000, '2024-08-16 15:20:58', '2024-08-16 15:20:58'),
(7, 8, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', 'Purple', NULL, NULL, NULL, 5525, '2024-08-20 14:46:29', '2024-08-20 14:46:29'),
(8, 8, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', 'Red', NULL, NULL, NULL, 5525, '2024-08-20 14:46:29', '2024-08-20 14:46:29'),
(9, 9, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-08-28 14:10:16', '2024-08-28 14:10:16'),
(10, 10, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-08-28 14:11:19', '2024-08-28 14:11:19'),
(35, 35, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-08-30 08:36:48', '2024-08-30 08:36:48'),
(37, 37, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-08-30 08:40:07', '2024-08-30 08:40:07'),
(40, 40, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-08-30 08:47:59', '2024-08-30 08:47:59'),
(41, 41, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-08-30 08:48:46', '2024-08-30 08:48:46'),
(42, 42, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-08-30 08:56:15', '2024-08-30 08:56:15'),
(43, 43, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-08-30 09:11:34', '2024-08-30 09:11:34'),
(44, 44, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-08-30 09:15:47', '2024-08-30 09:15:47'),
(45, 45, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-08-30 14:52:01', '2024-08-30 14:52:01'),
(46, 46, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 11:05:21', '2024-09-11 11:05:21'),
(47, 47, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 11:53:48', '2024-09-11 11:53:48'),
(48, 47, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 11:53:48', '2024-09-11 11:53:48'),
(49, 48, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 11:55:27', '2024-09-11 11:55:27'),
(50, 48, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 11:55:27', '2024-09-11 11:55:27'),
(51, 49, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 11:55:54', '2024-09-11 11:55:54'),
(52, 49, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 11:55:54', '2024-09-11 11:55:54'),
(53, 50, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 11:57:48', '2024-09-11 11:57:48'),
(54, 50, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 11:57:48', '2024-09-11 11:57:48'),
(55, 51, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 11:58:16', '2024-09-11 11:58:16'),
(56, 51, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 11:58:16', '2024-09-11 11:58:16'),
(57, 52, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 11:58:30', '2024-09-11 11:58:30'),
(58, 52, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 11:58:30', '2024-09-11 11:58:30'),
(59, 53, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:35:29', '2024-09-11 12:35:29'),
(60, 53, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:35:29', '2024-09-11 12:35:29'),
(61, 54, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:39:53', '2024-09-11 12:39:53'),
(62, 54, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:39:53', '2024-09-11 12:39:53'),
(63, 55, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:40:53', '2024-09-11 12:40:53'),
(64, 55, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:40:53', '2024-09-11 12:40:53'),
(65, 56, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:41:57', '2024-09-11 12:41:57'),
(66, 56, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:41:57', '2024-09-11 12:41:57'),
(67, 57, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:45:06', '2024-09-11 12:45:06'),
(68, 57, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:45:06', '2024-09-11 12:45:06'),
(69, 58, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:45:17', '2024-09-11 12:45:17'),
(70, 58, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:45:17', '2024-09-11 12:45:17'),
(71, 59, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:45:46', '2024-09-11 12:45:46'),
(72, 59, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:45:46', '2024-09-11 12:45:46'),
(73, 60, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:45:56', '2024-09-11 12:45:56'),
(74, 60, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:45:56', '2024-09-11 12:45:56'),
(75, 61, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:46:21', '2024-09-11 12:46:21'),
(76, 61, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:46:21', '2024-09-11 12:46:21'),
(77, 62, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:46:27', '2024-09-11 12:46:27'),
(78, 62, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:46:27', '2024-09-11 12:46:27'),
(79, 63, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:48:53', '2024-09-11 12:48:53'),
(80, 63, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:48:53', '2024-09-11 12:48:53'),
(81, 64, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:49:00', '2024-09-11 12:49:00'),
(82, 64, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:49:00', '2024-09-11 12:49:00'),
(83, 65, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:50:03', '2024-09-11 12:50:03'),
(84, 65, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:50:03', '2024-09-11 12:50:03'),
(85, 66, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:50:45', '2024-09-11 12:50:45'),
(86, 66, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:50:45', '2024-09-11 12:50:45'),
(87, 67, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:51:04', '2024-09-11 12:51:04'),
(88, 67, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:51:04', '2024-09-11 12:51:04'),
(89, 68, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:51:17', '2024-09-11 12:51:17'),
(90, 68, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:51:17', '2024-09-11 12:51:17'),
(91, 69, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:51:36', '2024-09-11 12:51:36'),
(92, 69, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:51:36', '2024-09-11 12:51:36'),
(93, 70, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:52:06', '2024-09-11 12:52:06'),
(94, 70, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:52:06', '2024-09-11 12:52:06'),
(95, 71, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:52:37', '2024-09-11 12:52:37'),
(96, 71, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:52:37', '2024-09-11 12:52:37'),
(97, 72, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:53:32', '2024-09-11 12:53:32'),
(98, 72, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:53:32', '2024-09-11 12:53:32'),
(99, 73, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:02:12', '2024-09-11 13:02:12'),
(100, 73, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:02:12', '2024-09-11 13:02:12'),
(101, 74, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:02:39', '2024-09-11 13:02:39'),
(102, 74, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:02:39', '2024-09-11 13:02:39'),
(103, 75, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:03:35', '2024-09-11 13:03:35'),
(104, 75, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:03:35', '2024-09-11 13:03:35'),
(105, 76, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:06:13', '2024-09-11 13:06:13'),
(106, 76, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:06:13', '2024-09-11 13:06:13'),
(107, 77, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:06:28', '2024-09-11 13:06:28'),
(108, 77, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:06:28', '2024-09-11 13:06:28'),
(109, 78, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:06:59', '2024-09-11 13:06:59'),
(110, 78, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:06:59', '2024-09-11 13:06:59'),
(111, 79, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:08:11', '2024-09-11 13:08:11'),
(112, 79, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:08:11', '2024-09-11 13:08:11'),
(113, 80, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:09:38', '2024-09-11 13:09:38'),
(114, 80, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:09:38', '2024-09-11 13:09:38'),
(115, 81, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:09:59', '2024-09-11 13:09:59'),
(116, 81, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:09:59', '2024-09-11 13:09:59'),
(117, 82, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:10:34', '2024-09-11 13:10:34'),
(118, 82, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:10:34', '2024-09-11 13:10:34'),
(119, 83, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:10:40', '2024-09-11 13:10:40'),
(120, 83, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:10:40', '2024-09-11 13:10:40'),
(121, 84, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:11:33', '2024-09-11 13:11:33'),
(122, 84, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:11:33', '2024-09-11 13:11:33'),
(123, 85, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:11:50', '2024-09-11 13:11:50'),
(124, 85, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:11:50', '2024-09-11 13:11:50'),
(125, 86, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:12:14', '2024-09-11 13:12:14'),
(126, 86, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:12:14', '2024-09-11 13:12:14'),
(127, 87, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:12:48', '2024-09-11 13:12:48'),
(128, 87, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:12:48', '2024-09-11 13:12:48'),
(129, 88, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:13:16', '2024-09-11 13:13:16'),
(130, 88, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:13:16', '2024-09-11 13:13:16'),
(131, 89, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:13:33', '2024-09-11 13:13:33'),
(132, 89, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:13:33', '2024-09-11 13:13:33'),
(133, 90, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:14:04', '2024-09-11 13:14:04'),
(134, 90, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:14:04', '2024-09-11 13:14:04'),
(135, 91, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:14:17', '2024-09-11 13:14:17'),
(136, 91, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:14:17', '2024-09-11 13:14:17'),
(137, 92, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:15:04', '2024-09-11 13:15:04'),
(138, 92, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:15:04', '2024-09-11 13:15:04'),
(139, 93, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:15:26', '2024-09-11 13:15:26'),
(140, 93, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:15:26', '2024-09-11 13:15:26'),
(141, 94, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 3, 5600, 0, 'XL', 'Purple', '1 KG', NULL, NULL, 16800, '2024-09-13 08:07:02', '2024-09-13 08:07:02'),
(142, 95, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 2, 5400, 0, 'M', NULL, NULL, NULL, NULL, 10800, '2024-10-24 04:43:32', '2024-10-24 04:43:32'),
(143, 96, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'S', NULL, NULL, NULL, NULL, 1000, '2024-11-04 12:35:46', '2024-11-04 12:35:46'),
(144, 97, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'S', 'Red', NULL, NULL, NULL, 1000, '2024-11-04 12:37:20', '2024-11-04 12:37:20'),
(145, 98, 40, NULL, 'New Design Half Silk Skin Printer Saree', NULL, 1, 784, 0, 'L', NULL, NULL, NULL, NULL, 784, '2024-11-04 12:38:10', '2024-11-04 12:38:10'),
(146, 99, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'S', NULL, NULL, NULL, NULL, 1000, '2024-11-04 12:48:29', '2024-11-04 12:48:29'),
(147, 100, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'L', NULL, NULL, NULL, NULL, 1000, '2024-11-20 04:59:24', '2024-11-20 04:59:24'),
(148, 100, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'M', NULL, NULL, NULL, NULL, 1000, '2024-11-20 04:59:24', '2024-11-20 04:59:24'),
(149, 101, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'M', NULL, NULL, NULL, NULL, 1000, '2024-11-20 05:00:38', '2024-11-20 05:00:38'),
(150, 102, 34, NULL, 'Men\'s casual shoes Vulcanized Work loafers Mesh Lightweight Man sports shoes Canvas Shoes for Men zapatos para hombres2024', NULL, 1, 1900, 0, '41', NULL, NULL, NULL, NULL, 1900, '2025-01-19 04:14:14', '2025-01-19 04:14:14'),
(151, 103, 34, NULL, 'Men\'s casual shoes Vulcanized Work loafers Mesh Lightweight Man sports shoes Canvas Shoes for Men zapatos para hombres2024', NULL, 1, 1900, 0, NULL, 'Blue', NULL, NULL, NULL, 1900, '2025-01-19 04:15:34', '2025-01-19 04:15:34'),
(152, 104, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 4750, 0, 'S', 'Purple', '1 KG', NULL, NULL, 4750, '2025-01-27 09:34:35', '2025-01-27 09:34:35'),
(153, 104, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', 'Purple', '1 KG', NULL, NULL, 5525, '2025-01-27 09:34:35', '2025-01-27 09:34:35'),
(154, 105, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 2, 5525, 0, 'L', NULL, NULL, NULL, NULL, 11050, '2025-01-27 09:38:09', '2025-01-27 09:38:09'),
(155, 106, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'S', NULL, NULL, NULL, NULL, 1000, '2025-01-27 15:40:47', '2025-01-27 15:40:47'),
(156, 107, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5400, 0, 'M', NULL, NULL, NULL, NULL, 5400, '2025-01-29 08:49:41', '2025-01-29 08:49:41'),
(157, 108, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'S', NULL, NULL, NULL, NULL, 1000, '2025-01-30 18:23:48', '2025-01-30 18:23:48'),
(158, 109, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'M', NULL, NULL, NULL, NULL, 1000, '2025-01-30 18:42:30', '2025-01-30 18:42:30'),
(159, 110, 40, NULL, 'New Design Half Silk Skin Printer Saree', NULL, 2, 784, 0, 'L', NULL, NULL, NULL, NULL, 1568, '2025-02-03 18:41:19', '2025-02-03 18:41:19'),
(160, 111, 34, NULL, 'Men\'s casual shoes Vulcanized Work loafers Mesh Lightweight Man sports shoes Canvas Shoes for Men zapatos para hombres2024', NULL, 1, 1900, 0, '42', NULL, NULL, NULL, NULL, 1900, '2025-02-05 16:24:02', '2025-02-05 16:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `desc` longtext DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_desc` text DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `url`, `desc`, `meta_title`, `meta_desc`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 'About Us', NULL, NULL, 'More Content are coming Soon', NULL, NULL, NULL, 1, NULL, '2024-07-07 08:04:31'),
(2, 'Terms and Condition', NULL, NULL, 'More Content are coming Soon', NULL, NULL, NULL, 1, NULL, NULL),
(3, 'Contact Us', NULL, NULL, 'More Content are coming Soon', NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(13, 'Create Admin', 'admin', '2024-06-28 11:49:44', '2024-06-28 11:49:44'),
(14, 'View Admin', 'admin', '2024-06-28 11:49:59', '2024-06-28 11:49:59'),
(15, 'Edit Admin', 'admin', '2024-06-28 11:50:08', '2024-06-28 11:50:08'),
(16, 'Delete Admin', 'admin', '2024-06-28 11:50:17', '2024-06-28 11:50:17'),
(17, 'Status Admin', 'admin', '2024-06-29 01:26:59', '2024-06-29 01:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `short_desc` text DEFAULT NULL,
  `isPopular` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=active,0=inactive',
  `isHot` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=active,0=inactive',
  `isFeatured` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=active,0=inactive',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `brand_id`, `product_name`, `slug`, `color`, `size`, `weight`, `tag`, `short_desc`, `isPopular`, `isHot`, `isFeatured`, `status`, `created_at`, `updated_at`) VALUES
(32, 3, 5, 7, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', 'tangail-tat-multi-colour-trendy-moslin-jamdani-saree-for-women', NULL, NULL, NULL, '[\"Sharee\",\"Dress\"]', 'The Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women is a traditional Bangladeshi saree known for its intricate handwoven design and vibrant colors. Made from fine muslin fabric, it features elaborate Jamdani patterns that reflect skilled craftsmanship. This saree combines traditional aesthetics with contemporary style, making it suitable for festive occasions and cultural events. Its lightweight and airy texture ensure comfort, while the multi-color design adds a touch of elegance and sophistication.', 1, 1, 1, 1, '2024-08-01 11:45:05', '2024-09-06 14:22:19'),
(34, 6, NULL, 7, 'Men\'s casual shoes Vulcanized Work loafers Mesh Lightweight Man sports shoes Canvas Shoes for Men zapatos para hombres2024', 'mens-casual-shoes-vulcanized-work-loafers-mesh-lightweight-man-sports-shoes-canvas-shoes-for-men-zapatos-para-hombres2024', NULL, NULL, NULL, NULL, 'Men\'s casual shoes Vulcanized Work loafers Mesh Lightweight Man sports shoes Canvas Shoes for Men zapatos para hombres2024', 1, 1, 1, 1, '2024-10-26 01:22:02', '2024-10-26 13:39:09'),
(35, 3, 5, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', 'short-sleeve-t-shirt-for-women-jersey-fabric', NULL, NULL, NULL, '[\"Dress\"]', 'Good Quality Short Sleeve T Shirt For Women Jersey Fabric', 1, 1, 1, 1, '2024-11-01 11:25:19', '2024-11-01 11:26:22'),
(40, 3, 5, NULL, 'New Design Half Silk Skin Printer Saree', 'new-design-half-silk-skin-printer-saree', NULL, NULL, NULL, '[\"Sharee\"]', 'New Design Half Silk Skin Printer Saree', 1, 1, 1, 1, '2024-11-02 12:12:51', '2024-11-02 12:23:20'),
(41, 3, 5, NULL, 'Tangail Half-Silk Muslin Than Saree - Stylish Casual & Party Wear - Suitable for Every Season', 'tangail-half-silk-muslin-than-saree-stylish-casual-party-wear-suitable-for-every-season', NULL, NULL, NULL, '[\"Sharee\"]', 'Tangail Half-Silk Muslin Than Saree - Stylish Casual & Party Wear - Suitable for Every Season', 1, 1, 1, 1, '2024-11-02 12:18:59', '2024-11-02 12:23:26'),
(42, 3, 5, NULL, 'Tangail Halfsilk plus pair saree for women by Ashraf fashion', 'tangail-halfsilk-plus-pair-saree-for-women-by-ashraf-fashion', NULL, NULL, NULL, '[\"Sharee\"]', 'Tangail Halfsilk plus pair saree for women by Ashraf fashion', 1, 1, 1, 1, '2024-11-02 12:22:03', '2024-11-02 12:23:33'),
(44, 3, 5, 6, 'Shelly Velazquez', 'shelly-velazquez', NULL, NULL, NULL, '[\"Vegetables\",\"Healthy\",\"Nutritents\",\"Dress\"]', 'Sequi sed minim illo', 0, 0, 0, 1, '2025-02-05 16:58:49', '2025-02-05 16:58:49');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `SKU` varchar(255) DEFAULT NULL,
  `purchase_price` int(11) NOT NULL DEFAULT 0,
  `regular_price` decimal(8,2) DEFAULT NULL,
  `sale_price` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `long_desc` longtext DEFAULT NULL,
  `initial_stock` int(11) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT 0,
  `available_qty` int(11) DEFAULT 0,
  `sold_qty` int(11) DEFAULT 0,
  `youtube_embed_link` text DEFAULT NULL,
  `productThumbnail_img` text NOT NULL,
  `product_img` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_desc` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `product_id`, `SKU`, `purchase_price`, `regular_price`, `sale_price`, `discount`, `long_desc`, `initial_stock`, `total_qty`, `available_qty`, `sold_qty`, `youtube_embed_link`, `productThumbnail_img`, `product_img`, `meta_title`, `meta_key`, `meta_desc`, `created_at`, `updated_at`) VALUES
(20, 32, 'EB-76815581', 500, NULL, NULL, NULL, '<h3>Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women 2</h3><p>&nbsp;</p><p><strong>Description:</strong></p><p>The Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women is a masterpiece of traditional Bangladeshi weaving. This exquisite saree is crafted from premium quality muslin, a lightweight and breathable fabric that offers unparalleled comfort and elegance. The intricate Jamdani patterns, painstakingly handwoven by skilled artisans, reflect a rich heritage of craftsmanship and artistry.</p><p><strong>Key Features:</strong></p><ul><li><strong>Material:</strong> High-quality muslin</li><li><strong>Design:</strong> Handwoven Jamdani patterns</li><li><strong>Color:</strong> Multi-color palette that adds vibrancy and charm</li><li><strong>Occasion:</strong> Perfect for festive occasions, cultural events, and special gatherings</li><li><strong>Length:</strong> Standard saree length of 5.5 meters</li><li><strong>Blouse Piece:</strong> Includes an unstitched blouse piece</li></ul><p><strong>Details:</strong></p><p><strong>Fabric Quality:</strong> The saree is made from the finest muslin fabric, known for its softness, lightness, and breathability. It drapes beautifully, offering a graceful silhouette.</p><p><strong>Handwoven Jamdani Patterns:</strong> The saree features traditional Jamdani motifs, which are meticulously handwoven by artisans. These intricate designs are a hallmark of Bangladeshi heritage and craftsmanship.</p><p><strong>Multi-Color Design:</strong> The saree showcases a vibrant mix of colors, creating a lively and eye-catching look. The combination of hues adds a modern touch to the traditional design.</p><p><strong>Comfort and Style:</strong> The lightweight muslin fabric ensures comfort, making it easy to wear for extended periods. The saree effortlessly combines traditional elegance with contemporary style.</p><p>&nbsp;</p><p><strong>Images:</strong></p><p><img src=\"http://localhost/Eco%20Bazar/public/backend/assets/images/uploads/products/ckeditor/d036fb6a614fb386469e062f7084fbc7.jpg_750x750.jpg__1722535820.webp\" width=\"750\" height=\"750\"></p><p>&nbsp;</p><p><strong>Care Instructions:</strong></p><p>To maintain the beauty and longevity of the saree, it is recommended to dry clean only. Avoid exposure to direct sunlight for extended periods to prevent color fading.</p><p><strong>Conclusion:</strong></p><p>The Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women is a timeless piece that brings together traditional craftsmanship and modern aesthetics. Its exquisite design, comfortable fabric, and vibrant colors make it a perfect choice for special occasions. Embrace the elegance and heritage of Bangladeshi weaving with this stunning saree.</p>', 20, 20, 20, 0, 'https://www.youtube.com/embed/OzIQ6GWI4NE?si=Xw3JRQ3yFbMHve3C', 'public/backend/assets/images/uploads/products/Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women1722534305.webp', '[\"66abc9a1cd445Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women-1722534305.webp\",\"66abc9a1dc9a7Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women-1722534305.webp\",\"66abc9a1f11eeTangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women-1722534305.webp\"]', NULL, NULL, NULL, '2024-08-01 11:45:05', '2024-08-03 14:23:49'),
(21, 34, 'EB-99814727', 0, NULL, NULL, NULL, NULL, 25, 0, 0, 0, NULL, 'public/backend/assets/images/uploads/products/Men\'s casual shoes Vulcanized Work loafers Mesh Lightweight Man sports shoes Canvas Shoes for Men zapatos para hombres20241729927323.webp', '[\"671c989b7c09aMen\'s casual shoes Vulcanized Work loafers Mesh Lightweight Man sports shoes Canvas Shoes for Men zapatos para hombres2024-1729927323.webp\"]', NULL, NULL, NULL, '2024-10-26 01:22:03', '2024-10-27 05:25:17'),
(22, 35, 'EB-91937125', 0, NULL, NULL, NULL, '<h2>Product details of Good Quality Short Sleeve T Shirt For Women Jersey Fabric</h2><p>&nbsp;</p><ul><li>Type : Short Sleeve T Shirt For WomenFabric :&nbsp;</li><li>JerseyType : Round NeckGSM: 160+</li><li>Color:NavyBlue/White</li><li>Main Material: JerseySize: M,L,XL</li><li>M- Chest 36” length 27”</li><li>L-Chest 38” length 28”</li><li>XL-Chest 40” length 29’’</li><li>Type : Short Sleeve T Shirt For Women</li><li>Fabric : Jersey</li><li>Type : Round Neck</li><li>GSM: 160+Color:NavyBlue/White</li><li>Main Material: Jersey</li><li>Size: M,L,XL</li><li>M- Chest 36” length 27”</li><li><p>L-Chest 38” length 28”</p><p>&nbsp;</p></li></ul><h2><img src=\"http://localhost/Eco%20Bazar/public/backend/assets/images/uploads/products/ckeditor/9b406db5e67cdb7ee7b4d812fd5cbea5.jpg_720x720q80.jpg__1730569793.webp\" width=\"479\" height=\"720\"></h2><p>&nbsp;</p><h2>Specifications of Good Quality Short Sleeve T Shirt For Women Jersey Fabric</h2><ul><li>Brand</li><li>No Brand</li><li>SKU: 342303281_BD-1672151919</li><li>Main Material: Jersey,Polyester</li></ul><p><strong>What’s in the box</strong></p><p>Good Quality Short Sleeve T Shirt For Women Jersey Fabric</p>', 20, 20, 20, 0, NULL, 'public/backend/assets/images/uploads/products/Short Sleeve T Shirt For Women Jersey Fabric1730481921.webp', '[\"67250f0158615Short Sleeve T Shirt For Women Jersey Fabric-1730481921.webp\",\"67250f01661cfShort Sleeve T Shirt For Women Jersey Fabric-1730481921.webp\",\"67250f0172afaShort Sleeve T Shirt For Women Jersey Fabric-1730481921.webp\",\"67250f017f201Short Sleeve T Shirt For Women Jersey Fabric-1730481921.webp\"]', NULL, NULL, NULL, '2024-11-01 11:25:21', '2024-11-02 11:56:01'),
(25, 40, 'EB-86365156', 0, NULL, NULL, NULL, '<h2>Product details of Working of New Design Half Silk Skin Printer Saree</h2><ul><li>Introducing the New Design Half Silk Skin Printer Saree, a stunning addition to your traditional clothing collection. Crafted with high-quality silk, this saree boasts a unique skin printer design that exudes elegance and sophistication. Perfect for formal wear, this saree is a versatile choice for various occasions, adding a touch of grace to your ensemble. Elevate your style with the exquisite craftsmanship and luxurious feel of this half silk saree.Specifications of Working of New Design Half Silk Skin Printer Saree</li></ul><h2><strong>Product details of Working of New Design Half Silk Skin Printer Saree</strong></h2><ul><li>New design half silk skin printer work in stock available</li><li>Product Type: Saree Fabric: Half Silk</li><li>Length: 5.8mtr (12 hands)</li><li>Blouse: No Work:</li><li>Skin Print Color Guarantee Fashionable and elegant design Product color may vary slightly due to photographic light sources or your monitor settings.</li><li>Note – Pay the delivery man first and get the product. Check the product while the delivery man is there. No complaints will be entertained after the delivery man h</li></ul><h2>Specifications of Working of New Design Half Silk Skin Printer Saree</h2><ul><li><p>Brand</p><p>No Brand</p></li><li><p>SKU</p><p>392540190_BD-1957972785</p></li><li><p>Main Material</p><p>Silk</p></li></ul><p>What’s in the box</p><p>Working of New Design Half Silk Skin Printer Saree</p>', 60, 60, 60, 0, NULL, 'public/backend/assets/images/uploads/products/New Design Half Silk Skin Printer Saree1730571171.webp', '[\"67266ba3a592fNew Design Half Silk Skin Printer Saree-1730571171.webp\",\"67266ba3b2587New Design Half Silk Skin Printer Saree-1730571171.webp\",\"67266ba3c5aa0New Design Half Silk Skin Printer Saree-1730571171.webp\"]', NULL, NULL, NULL, '2024-11-02 12:12:51', '2024-11-02 12:12:51'),
(26, 41, 'EB-18417854', 0, NULL, NULL, NULL, '<h2>Product details of Tangail Half-Silk Muslin Than Saree - Stylish Casual &amp; Party Wear - Suitable for Every Season</h2><ul><li>Brand. Ashraf fashion</li><li>Colour. Same as picture</li><li>Size. 12 hat</li><li>Quality. Best product</li><li>Product Type: Saree</li><li>Main Material: Dhupian Silk</li><li>Sharee Style: Regular Saree</li><li>Color: Same As Picture</li><li>Best Quality</li><li>Long: 13 Haat Saree</li><li>Bohor: 46 inch</li><li>Product Size : Saree - 4.80 mtrs</li><li>No Lace Will Be Fitted</li><li>Authentic Color</li><li>Occasion: Casual, Party &amp; Festive</li><li>Product color may slightly vary due to photographic lighting sources or your monitor settings.</li><li>Tangail halfsilk saree For women</li><li>Muslin halfsilk mixed suti kapor</li><li>Product Type: Saree</li><li>Main Material: Dhupian Silk</li><li>Sharee Style: Regular Saree</li><li>Color: Same As Picture</li><li>Best Quality</li><li>Long: 13 Haat Saree</li><li>Bohor: 46 inch</li><li>Product Size : Saree - 4.80 mtrs</li><li>No Lace Will Be Fitted</li><li>Authentic Color</li><li>Occasion: Casual, Party &amp; Festive</li><li>Product color may slightly vary due to photographic lighting sources or your monitor settings.</li><li><figure class=\"image\"><img style=\"aspect-ratio:625/625;\" src=\"https://img.drz.lazcdn.com/static/bd/p/8cd22392ba547740ce9a5be7a900dc38.jpg_2200x2200q80.jpg_.webp\" width=\"625\" height=\"625\"></figure><p><br>&nbsp;</p></li></ul><h2>Specifications of Tangail Half-Silk Muslin Than Saree - Stylish Casual &amp; Party Wear - Suitable for Every Season</h2><ul><li><p>Brand</p><p>No Brand</p></li><li><p>SKU</p><p>252828631_BD-1718579378</p></li><li><p>Main Material</p><p>Half Silk</p></li></ul><p>What’s in the box</p><p>Moslin Than Saree for womens-Levendour color</p>', 2, 2, 2, 0, NULL, 'public/backend/assets/images/uploads/products/Tangail Half-Silk Muslin Than Saree - Stylish Casual & Party Wear - Suitable for Every Season1730571539.webp', '[\"67266d13b86caTangail Half-Silk Muslin Than Saree - Stylish Casual & Party Wear - Suitable for Every Season-1730571539.webp\",\"67266d13be027Tangail Half-Silk Muslin Than Saree - Stylish Casual & Party Wear - Suitable for Every Season-1730571539.webp\"]', NULL, NULL, NULL, '2024-11-02 12:18:59', '2024-11-02 12:18:59'),
(27, 42, 'EB-18656295', 0, NULL, NULL, NULL, '<h2>Product details of Tangail Halfsilk plus pair saree for women by Ashraf fashion</h2><ul><li>Brand. Ashraf fashion</li><li>Colour. Same as picture</li><li>Size 12 hat.</li><li>Quality best product</li><li>Very comfortable</li><li>Colourr.same as picture</li><li>Size.12 hat</li><li>Quality best product</li><li>Very comfortable</li></ul><h2>Specifications of Tangail Halfsilk plus pair saree for women by Ashraf fashion</h2><ul><li><p>Brand</p><p>No Brand</p></li><li><p>SKU</p><p>338447173_BD-1654479117</p></li><li><p>Main Material</p><p>Half Silk</p></li></ul><p>What’s in the box</p><p>Saree</p>', 3, 3, 3, 0, NULL, 'public/backend/assets/images/uploads/products/Tangail Halfsilk plus pair saree for women by Ashraf fashion1730571723.webp', '[\"67266dcbc24d0Tangail Halfsilk plus pair saree for women by Ashraf fashion-1730571723.webp\",\"67266dcbd2b97Tangail Halfsilk plus pair saree for women by Ashraf fashion-1730571723.webp\",\"67266dcbe52c0Tangail Halfsilk plus pair saree for women by Ashraf fashion-1730571723.webp\"]', NULL, NULL, NULL, '2024-11-02 12:22:03', '2024-11-02 12:22:03'),
(29, 44, 'EB-70333838', 5000, NULL, NULL, NULL, '<p>desc</p>', 40, 40, 40, 0, NULL, 'public/backend/assets/images/uploads/products/Shelly Velazquez1738774730.webp', '[\"67a398cb2fee7Shelly Velazquez-1738774731.webp\",\"67a398cb6fb3fShelly Velazquez-1738774731.webp\"]', NULL, NULL, NULL, '2025-02-05 16:58:51', '2025-02-05 17:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `review_text` longtext NOT NULL,
  `rating` varchar(255) NOT NULL,
  `review_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `review_text`, `rating`, `review_date`, `status`, `created_at`, `updated_at`) VALUES
(2, 4, 32, 'good product', '4', '2024-10-25', 0, '2024-08-03 20:41:45', '2024-10-24 04:23:13'),
(5, 4, 32, 'abc', '1', '2024-10-24', 1, '2024-10-24 02:21:34', '2024-10-24 04:22:35'),
(8, 4, 32, 'good man', '2', '2024-10-24', 1, '2024-10-24 04:25:01', '2024-10-24 04:25:16'),
(9, 4, 32, 'need to improve the quality better.', '2', '2024-10-27', 0, '2024-10-27 02:33:41', '2024-10-27 02:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'admin', NULL, NULL),
(7, 'Admin', 'admin', '2024-06-28 11:54:57', '2024-06-28 11:54:57'),
(8, 'Stuff', 'admin', '2024-06-28 11:55:05', '2024-06-28 11:55:05'),
(11, 'dummy2', 'admin', '2024-09-18 12:11:21', '2024-09-18 12:11:21');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(13, 1),
(13, 7),
(13, 11),
(14, 1),
(14, 7),
(14, 8),
(15, 1),
(15, 8),
(15, 11),
(16, 1),
(17, 1),
(17, 7),
(17, 11);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('reGm8lS8Im3d83RKIzRm9ER6B1hZtm2vELBL3EbA', 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiWjFDaHBtT3ZENVJ6YVVCSUxuRmtZY0VTYWZFTE5DUFJLcVZwQzdFUSI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMjoiaHR0cDovL2xvY2FsaG9zdC9pb3QlMjBlY29tbWVyY2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O3M6NDoiY2FydCI7YToxOntzOjc6ImRlZmF1bHQiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjE6e3M6MzI6ImVlNDI0MzM2ZDg1NGY0ZDlhMDk1NjI0ZGNjMGY0NDg4IjtPOjMyOiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbSI6MTE6e3M6NToicm93SWQiO3M6MzI6ImVlNDI0MzM2ZDg1NGY0ZDlhMDk1NjI0ZGNjMGY0NDg4IjtzOjI6ImlkIjtzOjI6IjQ0IjtzOjM6InF0eSI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MTY6IlNoZWxseSBWZWxhenF1ZXoiO3M6NToicHJpY2UiO2Q6NTcwO3M6Njoid2VpZ2h0IjtkOjA7czo3OiJvcHRpb25zIjtPOjM5OiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbU9wdGlvbnMiOjI6e3M6ODoiACoAaXRlbXMiO2E6Njp7czo1OiJpbWFnZSI7czoxMTA6Imh0dHA6Ly9sb2NhbGhvc3QvaW90JTIwZWNvbW1lcmNlL3B1YmxpYy9iYWNrZW5kL2Fzc2V0cy9pbWFnZXMvdXBsb2Fkcy9wcm9kdWN0cy9TaGVsbHkgVmVsYXpxdWV6MTczODc3NDczMC53ZWJwIjtzOjU6ImNvbG9yIjtzOjY6IlB1cnBsZSI7czo0OiJzaXplIjtOO3M6Njoid2VpZ2h0IjtOO3M6NToic3RvY2siO3M6MjoiNDAiO3M6MTQ6InB1cmNoYXNlX3ByaWNlIjtpOjUwMDA7fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo3OiJ0YXhSYXRlIjtpOjIxO3M6NDk6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBhc3NvY2lhdGVkTW9kZWwiO047czo0NjoiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGRpc2NvdW50UmF0ZSI7aTowO3M6ODoiaW5zdGFuY2UiO3M6NzoiZGVmYXVsdCI7fX1zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fX1zOjUyOiJsb2dpbl9hZG1pbl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1738776970);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attrvalue_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size_title` varchar(255) NOT NULL,
  `productRegularPrice` decimal(10,2) DEFAULT NULL,
  `productSalePrice` decimal(10,2) NOT NULL,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `attrvalue_id`, `product_id`, `size_title`, `productRegularPrice`, `productSalePrice`, `discount_percentage`, `created_at`, `updated_at`) VALUES
(9, 14, 32, 'S', 5000.00, 4750.00, 5, '2024-08-08 16:05:35', '2024-08-08 16:08:09'),
(10, 15, 32, 'M', 6000.00, 5400.00, 10, '2024-08-08 16:05:35', '2024-08-08 16:08:09'),
(11, 16, 32, 'L', 6500.00, 5525.00, 15, '2024-08-08 16:05:35', '2024-08-08 16:08:09'),
(12, 17, 32, 'XL', 7000.00, 5600.00, 20, '2024-08-08 16:05:35', '2024-08-08 16:08:09'),
(13, 25, 34, '41', 2000.00, 1900.00, 5, '2024-10-26 01:22:03', '2024-10-27 05:25:17'),
(14, 26, 34, '42', 2000.00, 1900.00, 5, '2024-10-26 01:22:03', '2024-10-27 05:25:17'),
(15, 27, 34, '43', 2000.00, 1900.00, 5, '2024-10-26 01:22:03', '2024-10-27 05:25:17'),
(16, 14, 35, 'S', 2000.00, 1000.00, 50, '2024-11-01 11:25:21', '2024-11-02 11:56:01'),
(17, 15, 35, 'M', 2000.00, 1000.00, 50, '2024-11-01 11:25:21', '2024-11-02 11:56:01'),
(18, 16, 35, 'L', 2000.00, 1000.00, 50, '2024-11-01 11:25:21', '2024-11-02 11:56:01'),
(19, 16, 40, 'L', 800.00, 784.00, 2, '2024-11-02 12:12:51', '2024-11-02 12:12:51'),
(20, 17, 41, 'XL', 900.00, 855.00, 5, '2024-11-02 12:18:59', '2024-11-02 12:18:59'),
(21, 16, 42, 'L', 950.00, 931.00, 2, '2024-11-02 12:22:03', '2024-11-02 12:22:03');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `slider_img` text DEFAULT NULL,
  `slider_title_1` varchar(255) DEFAULT NULL,
  `slider_title_2` varchar(255) DEFAULT NULL,
  `slider_title_3` varchar(255) DEFAULT NULL,
  `slider_text` text DEFAULT NULL,
  `slider_btn_name` varchar(255) DEFAULT NULL,
  `slider_btn_link` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slug`, `slider_img`, `slider_title_1`, `slider_title_2`, `slider_title_3`, `slider_text`, `slider_btn_name`, `slider_btn_link`, `status`, `created_at`, `updated_at`) VALUES
(5, 'asd', 'public/backend/assets/images/uploads/sliders/1731094534.webp', 'Welcome to Uthao Bazar', 'Womens and Girls Fashion', 'Sale up to <span>30% OFF</span>', 'Free shipping on all your order. we deliver, you enjoy', 'Shop Now', '#', 1, '2024-07-10 10:00:23', '2024-11-08 13:35:34'),
(11, 'welcome-to-uthao-bazar', 'public/backend/assets/images/uploads/sliders/1731094547.webp', 'Welcome to Uthao Bazar', 'Mothers and Baby', 'Sale up to <span>20% OFF</span>', 'Free Shipping on all of Our Featured Product', 'Shop Now', '#', 1, '2024-08-04 09:14:23', '2024-11-08 13:35:47'),
(12, 'one', 'public/backend/assets/images/uploads/sliders/1731096628.webp', 'one', 'two', 'three', 'sada', 'sadas', '#', 1, '2024-11-08 14:10:28', '2024-11-08 14:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_img` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `subcategory_name`, `slug`, `category_id`, `subcategory_img`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Traditional Wear', 'traditional-wear', 3, 'public/backend/images/subCategory/84909767.webp', 1, '2024-08-01 11:29:50', '2024-08-01 11:29:50'),
(6, 'Muslim Wear', 'muslim-wear', 3, 'public/backend/images/subCategory/80039571.jpg', 1, '2024-08-01 11:34:17', '2024-08-01 11:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `tag_icon` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active, 0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theme_colors`
--

CREATE TABLE `theme_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `primary_color_key` varchar(255) DEFAULT NULL,
  `primary_color_value` varchar(255) DEFAULT NULL,
  `secondary_color_key` varchar(255) DEFAULT NULL,
  `secondary_color_value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `theme_colors`
--

INSERT INTO `theme_colors` (`id`, `primary_color_key`, `primary_color_value`, `secondary_color_key`, `secondary_color_value`, `created_at`, `updated_at`) VALUES
(2, NULL, '#fe5200', NULL, '#191919', '2024-09-13 02:31:50', '2024-09-13 04:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_pic` text DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `thana` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `state_district` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `profile_pic`, `name`, `email`, `phone`, `address`, `thana`, `area`, `gender`, `company_name`, `state_district`, `zip_code`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'public/frontend/images/upload/profile/172655352366e91db39fa18.jpg', 'Sabbir hossain', 'h.sabbir36@yahoo.com', '01926241905', 'Dhaka North City corporation, Dhaka', 'Dakshinkhan', 'Ashkona', 'male', 'Gen-Zilla', 'Dhaka', '1230', NULL, '$2y$12$ElwNwruoltBWuQpvaoHoweh2aif/NXc79Yb.UjGpm49UVwImijmq.', 1, 'k41VqSlutHKixa0EKk2bIhdFLnpROoWc49flK0kW0FCqi9kzJ4Jx2voiZmX7', '2024-09-06 13:30:09', '2025-02-04 18:49:52'),
(12, NULL, 'Rifat Khan', 'rifat@gmail.com', NULL, 'test address', 'Dakshinkhan', 'Ashkona', 'male', NULL, NULL, NULL, NULL, '$2y$12$a4BV5vIahFbXzqmr//xVUOqWHNIlhiM2JTOqpLsd.rAbJbexRYs0C', 1, NULL, '2025-01-30 17:49:27', '2025-01-30 17:49:27'),
(13, NULL, 'Stuff', 'sh1389045@gmail.com', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, '$2y$12$CvGifb.u9ohR5V6Ax7dE3O6p9se6ezn5PSyFQHaKS/QvR9AQjblhe', 1, NULL, '2025-01-30 18:03:23', '2025-01-30 18:03:23'),
(14, NULL, 'saif hossain', 'sf@gmail.com', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, '$2y$12$S.TSA1KrqrNEYnwfo/t3UePl4iGMWV3tOABqOUjRDyQNuqR5Ol9J2', 1, NULL, '2025-01-30 18:26:18', '2025-01-30 18:26:18'),
(15, NULL, 'Sabbir hossain', 'sh139045@gmail.com', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, '$2y$12$Rqhm3ZHpKoqPAgPHRO4JqO.d4HVKnTO/3GNrX.45SAXf1fbExCdxq', 1, NULL, '2025-01-30 18:26:48', '2025-01-30 18:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `weights`
--

CREATE TABLE `weights` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attrvalue_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `weight_title` varchar(255) NOT NULL,
  `productRegularPrice` decimal(10,2) DEFAULT NULL,
  `productSalePrice` decimal(10,2) NOT NULL,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weights`
--

INSERT INTO `weights` (`id`, `attrvalue_id`, `product_id`, `weight_title`, `productRegularPrice`, `productSalePrice`, `discount_percentage`, `created_at`, `updated_at`) VALUES
(9, 11, 32, '1 KG', 6000.00, 5100.00, 15, '2024-08-08 16:08:09', '2024-08-08 16:08:09'),
(10, 12, 32, '3 KG', 6500.00, 5200.00, 20, '2024-08-08 16:08:09', '2024-08-08 16:08:09');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `weight_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attrvalues`
--
ALTER TABLE `attrvalues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attrvalues_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `basic_infos`
--
ALTER TABLE `basic_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `colors_attrvalue_id_foreign` (`attrvalue_id`),
  ADD KEY `colors_product_id_foreign` (`product_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_charges_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tag_product_id_foreign` (`product_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sizes_attrvalue_id_foreign` (`attrvalue_id`),
  ADD KEY `sizes_product_id_foreign` (`product_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sliders_slug_unique` (`slug`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subcategories_slug_unique` (`slug`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `theme_colors`
--
ALTER TABLE `theme_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `weights`
--
ALTER TABLE `weights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weights_attrvalue_id_foreign` (`attrvalue_id`),
  ADD KEY `weights_product_id_foreign` (`product_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attrvalues`
--
ALTER TABLE `attrvalues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `basic_infos`
--
ALTER TABLE `basic_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_colors`
--
ALTER TABLE `theme_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `weights`
--
ALTER TABLE `weights`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attrvalues`
--
ALTER TABLE `attrvalues`
  ADD CONSTRAINT `attrvalues_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `colors`
--
ALTER TABLE `colors`
  ADD CONSTRAINT `colors_attrvalue_id_foreign` FOREIGN KEY (`attrvalue_id`) REFERENCES `attrvalues` (`id`),
  ADD CONSTRAINT `colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sizes`
--
ALTER TABLE `sizes`
  ADD CONSTRAINT `sizes_attrvalue_id_foreign` FOREIGN KEY (`attrvalue_id`) REFERENCES `attrvalues` (`id`),
  ADD CONSTRAINT `sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `weights`
--
ALTER TABLE `weights`
  ADD CONSTRAINT `weights_attrvalue_id_foreign` FOREIGN KEY (`attrvalue_id`) REFERENCES `attrvalues` (`id`),
  ADD CONSTRAINT `weights_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
