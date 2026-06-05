-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 04, 2026 lúc 12:14 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopgame`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `auto_confirm` tinyint(1) NOT NULL DEFAULT 0,
  `prefix` varchar(255) NOT NULL DEFAULT 'naptien',
  `access_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `bank_name`, `account_name`, `account_number`, `branch`, `note`, `is_active`, `auto_confirm`, `prefix`, `access_token`, `created_at`, `updated_at`) VALUES
(2, 'Vietcombank', 'Lê Văn Phú', '9774412304', 'Đà Nẵng', 'Chụp bill gửi zalo 0774412304', 1, 0, 'naptien', NULL, '2026-05-31 08:06:24', '2026-06-03 08:39:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bank_deposits`
--

CREATE TABLE `bank_deposits` (
  `transaction_id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `bank` enum('VPBank','TPBank','VietinBank','ACB','BIDV','MBBank','OCB','KienLongBank','MSB') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `card_deposits`
--

CREATE TABLE `card_deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `telco` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `received_amount` int(11) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `status` enum('success','error','processing') NOT NULL DEFAULT 'processing',
  `response` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `configs`
--

CREATE TABLE `configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `configs`
--

INSERT INTO `configs` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Khangphu.com  - Shop acc Free Fire Khang Phú', '2025-04-07 07:25:37', '2026-05-31 09:31:50'),
(2, 'site_description', 'Shop Khang Phú, cần bán acc nhắn zalo hoặc facebook ở liên kết', '2025-04-07 07:25:37', '2026-06-03 08:18:11'),
(3, 'site_keywords', 'shop game, free fire, liên quân, tài khoản game, game online, mua bán tài khoản game', '2025-04-07 07:25:37', '2026-05-31 09:31:50'),
(4, 'site_logo', '/storage/config/1780219910_f8a1e78cfc556abd7077d988232c0651.jpg', '2025-04-07 07:25:37', '2026-05-31 09:31:50'),
(5, 'site_logo_footer', '/storage/config/1780219910_f8a1e78cfc556abd7077d988232c0651.jpg', '2025-04-07 07:25:37', '2026-05-31 09:31:50'),
(6, 'site_share_image', '/storage/config/1780219910_9e0f8784ffebf6865c83c5e526274f31.jpg', '2025-04-07 07:25:37', '2026-05-31 09:31:50'),
(7, 'site_banner', '/storage/config/1780219910_9e0f8784ffebf6865c83c5e526274f31.jpg', '2025-04-07 07:25:37', '2026-05-31 09:31:50'),
(8, 'site_favicon', 'https://i.postimg.cc/sg1tCBGL/favicon.png', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(9, 'address', 'Việt Nam', '2025-04-07 07:25:37', '2026-05-31 09:31:50'),
(10, 'phone', '0774412304', '2025-04-07 07:25:37', '2026-05-31 09:31:50'),
(11, 'email', 'vanphule22@gmail.com', '2025-04-07 07:25:37', '2026-05-31 09:31:50'),
(12, 'facebook', 'https://www.facebook.com/hoangthekhangnew', '2025-04-07 07:25:37', '2026-05-31 07:47:25'),
(13, 'zalo', '0774412304', '2025-04-07 07:25:37', '2026-05-31 07:47:25'),
(14, 'youtube', 'https://www.youtube.com/@htuanqn', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(15, 'discord', NULL, '2025-04-07 07:25:37', '2026-05-31 07:47:25'),
(16, 'telegram', 'https://t.me/example', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(17, 'tiktok', NULL, '2025-04-07 07:25:37', '2026-05-31 07:47:25'),
(19, 'home_notification', 'Chào mừng bạn đến với Shop Bán Acc Game của chúng tôi. Mọi vấn đền vui lòng nhắn zalo 0774412304 để được hỗ trợ', '2025-04-07 07:25:37', '2026-06-01 01:43:47'),
(20, 'welcome_modal', '1', '2025-04-07 07:25:37', '2026-06-01 01:43:58'),
(21, 'mail_mailer', 'smtp', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(22, 'mail_host', 'smtp.gmail.com', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(23, 'mail_port', '587', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(24, 'mail_username', '', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(25, 'mail_password', '', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(26, 'mail_encryption', 'tls', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(27, 'mail_from_address', 'support@tuanori.vn', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(28, 'mail_from_name', 'TUANORI.VN - Shop Game Ngọc Rồng', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(29, 'payment.card.active', '1', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(30, 'payment.card.partner_website', 'thesieure.com', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(31, 'payment.card.partner_id', '', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(32, 'payment.card.partner_key', '', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(33, 'payment.card.discount_percent', '20', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(34, 'payment.bank.active', '1', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(35, 'payment.momo.active', '1', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(36, 'login_social.google.active', '1', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(37, 'login_social.google.client_id', '695655624016-tnn916t7g53oqulsiq0d9vvn7bof1568.apps.googleusercontent.com', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(38, 'login_social.google.client_secret', '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', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(39, 'login_social.google.redirect', 'http://localhost:8000/auth/google/callback', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(40, 'login_social.facebook.active', '1', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(41, 'login_social.facebook.client_id', '713944317580357', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(42, 'login_social.facebook.client_secret', '481beed7538a8b7318c45e94401f4e3c', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(43, 'login_social.facebook.redirect', 'http://localhost:8000/auth/facebook/callback', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(44, 'working_hours', NULL, '2026-05-31 07:47:25', '2026-05-31 07:47:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount_codes`
--

CREATE TABLE `discount_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `discount_type` enum('percentage','fixed_amount') NOT NULL DEFAULT 'percentage',
  `discount_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_discount_value` decimal(10,2) DEFAULT NULL,
  `min_purchase_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_active` enum('1','0') NOT NULL DEFAULT '1',
  `usage_limit` int(11) DEFAULT NULL,
  `usage_count` int(11) NOT NULL DEFAULT 0,
  `per_user_limit` int(11) DEFAULT NULL,
  `applicable_to` enum('account','random_account','service') DEFAULT NULL,
  `item_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_ids`)),
  `expire_date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount_code_usages`
--

CREATE TABLE `discount_code_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_code_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `context` enum('account','random_account','service') NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `original_price` decimal(10,2) NOT NULL,
  `discounted_price` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `used_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `game_accounts`
--

CREATE TABLE `game_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `game_category_id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` enum('available','sold') NOT NULL DEFAULT 'available',
  `server` varchar(255) NOT NULL,
  `registration_type` enum('virtual','real') NOT NULL,
  `buyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `thumb` text NOT NULL,
  `images` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `game_accounts`
--

INSERT INTO `game_accounts` (`id`, `game_category_id`, `account_name`, `price`, `status`, `server`, `registration_type`, `buyer_id`, `note`, `thumb`, `images`, `created_at`, `updated_at`) VALUES
(2, 1, '1456', '1200000', 'available', '11', 'real', 5, 'Vip 7 ,Lãng khách - kim long, Súng đồ ok, 15 nc, nhiều đồ cổ', 'https://i.postimg.cc/8kJvtYgW/20250328090315screenshot-2025-03-26-091731.jpg', '[\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\"]', '2025-04-07 07:25:37', '2026-06-02 03:15:06'),
(12, 1, '133', '1200000', 'available', '13', 'virtual', NULL, '1', '/storage/accounts/thumbnails/1780293463_22eb2540b6f5e33f90d08105954b05e4.jfif', NULL, '2026-06-01 05:57:43', '2026-06-01 09:02:45'),
(14, 1, '8', '50000', 'sold', '8', 'virtual', 5, '8', '/storage/accounts/thumbnails/1780294455_22eb2540b6f5e33f90d08105954b05e4.jfif', NULL, '2026-06-01 06:09:12', '2026-06-01 08:55:53'),
(23, 1, '66', '50000000', 'available', '66', 'real', NULL, '66', '/storage/accounts/thumbnails/1780301239_22eb2540b6f5e33f90d08105954b05e4.jfif', NULL, '2026-06-01 08:07:19', '2026-06-01 09:02:33'),
(24, 1, '133', '800000', 'sold', '125', 'real', 5, '12', '/storage/accounts/thumbnails/1780303368_22eb2540b6f5e33f90d08105954b05e4.jfif', '[\"\\/storage\\/accounts\\/images\\/1780384431_f8a1e78cfc556abd7077d988232c0651.jpg\",\"\\/storage\\/accounts\\/images\\/1780384431_9e0f8784ffebf6865c83c5e526274f31.jpg\",\"\\/storage\\/accounts\\/images\\/1780384431_22eb2540b6f5e33f90d08105954b05e4.jfif\"]', '2026-06-01 08:42:48', '2026-06-02 07:13:51'),
(26, 5, '133', '1', 'available', '12', 'real', NULL, '2', '/storage/accounts/thumbnails/1780393843_22eb2540b6f5e33f90d08105954b05e4.jfif', NULL, '2026-06-02 09:50:43', '2026-06-02 09:50:43'),
(27, 9, '2', '2', 'sold', '2', 'virtual', 5, '2', '/storage/accounts/thumbnails/1780470808_22eb2540b6f5e33f90d08105954b05e4.jfif', NULL, '2026-06-03 07:13:28', '2026-06-03 07:14:07'),
(28, 9, '3', '3', 'sold', '3', 'virtual', 5, '3', '/storage/accounts/thumbnails/1780477178_0061981ca2e4539ced799d3c90fa7040.jpg', NULL, '2026-06-03 08:59:38', '2026-06-03 08:59:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `game_categories`
--

CREATE TABLE `game_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `game_categories`
--

INSERT INTO `game_categories` (`id`, `name`, `slug`, `thumbnail`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'ACC FREE FIRE', 'acc-free-fire', 'https://i.postimg.cc/qq3pynYh/20240215164859nickhsnr.jpg', 'Danh mục tài khoản game Free Fire', 1, '2025-04-07 07:25:37', '2026-05-31 02:01:33'),
(5, 'ACC LIÊN QUÂN', 'acc-lien-quan', 'https://i.postimg.cc/Jzc4pNhj/NRO-ITEM.png', 'Danh mục tài khoản game Liên Quân', 1, '2025-04-07 07:25:37', '2026-05-31 02:02:19'),
(9, 'ACC LIÊN QUÂN 100- 200', 'acc-lien-quan-100-200', '/storage/categories/1780470760_9e0f8784ffebf6865c83c5e526274f31.jpg', 'accff', 1, '2026-06-03 07:12:40', '2026-06-03 07:12:40'),
(10, 'ACC FREE FIRE 11m', 'acc-free-fire-11m', '/storage/categories/1780477253_0061981ca2e4539ced799d3c90fa7040.jpg', 'g', 1, '2026-06-03 09:00:53', '2026-06-03 09:00:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2025_03_28_181908_create_users_table', 1),
(3, '2025_03_28_181914_create_game_categories_table', 1),
(4, '2025_03_28_181917_create_game_accounts_table', 1),
(5, '2025_03_28_181929_create_purchase_history_table', 1),
(6, '2025_03_28_181932_create_money_transactions_table', 1),
(7, '2025_03_29_015110_create_card_deposits_table', 1),
(8, '2025_03_29_154334_create_game_services_table', 1),
(9, '2025_03_29_154343_create_service_packages_table', 1),
(10, '2025_03_29_154350_create_service_histories_table', 1),
(11, '2025_03_30_231218_create_configs_table', 1),
(12, '2025_03_31_050014_create_bank_deposits_table', 1),
(13, '2025_03_31_065843_create_bank_accounts_table', 1),
(14, '2025_04_01_031303_create_random_categories_table', 1),
(15, '2025_04_01_031307_create_random_category_accounts_table', 1),
(16, '2025_04_01_035918_create_discount_codes_table', 1),
(17, '2025_04_01_040223_create_discount_code_usages_table', 1),
(18, '2025_04_02_060346_create_lucky_wheels_table', 1),
(19, '2025_04_02_060438_create_lucky_wheel_histories_table', 1),
(20, '2025_04_02_060504_create_withdrawal_histories_table', 1),
(21, '2025_04_04_043941_create_money_withdrawal_histories_table', 1),
(22, '2025_04_05_101214_create_notifications_table', 1),
(23, '2025_04_07_022109_create_password_reset_tokens_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `money_transactions`
--

CREATE TABLE `money_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('deposit','withdraw','purchase','refund') NOT NULL,
  `amount` bigint(20) NOT NULL,
  `balance_before` bigint(20) NOT NULL,
  `balance_after` bigint(20) NOT NULL,
  `description` text DEFAULT NULL,
  `reference_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `money_transactions`
--

INSERT INTO `money_transactions` (`id`, `user_id`, `type`, `amount`, `balance_before`, `balance_after`, `description`, `reference_id`, `created_at`, `updated_at`) VALUES
(1, 5, 'deposit', 10000000, 0, 10000000, 'Admin cập nhật số dư', NULL, '2026-06-01 08:17:07', '2026-06-01 08:17:07'),
(2, 5, 'purchase', -8, 10000000, 9999992, 'Mua tài khoản #14', '14', '2026-06-01 08:19:08', '2026-06-01 08:19:08'),
(3, 6, 'deposit', 10000, 0, 10000, 'Admin cập nhật số dư', NULL, '2026-06-01 08:29:46', '2026-06-01 08:29:46'),
(4, 6, 'purchase', -8, 10000, 9992, 'Mua tài khoản #14', '14', '2026-06-01 08:33:41', '2026-06-01 08:33:41'),
(5, 6, 'purchase', -12, 9992, 9980, 'Mua tài khoản #2', '2', '2026-06-02 00:56:01', '2026-06-02 00:56:01'),
(6, 5, 'purchase', -1200000, 9999992, 8799992, 'Mua tài khoản #2', '2', '2026-06-02 03:33:58', '2026-06-02 03:33:58'),
(7, 5, 'purchase', -1200000, 8799992, 7599992, 'Mua tài khoản #2', '2', '2026-06-02 04:28:02', '2026-06-02 04:28:02'),
(8, 5, 'purchase', -1200000, 7599992, 6399992, 'Mua tài khoản #2', '2', '2026-06-02 08:42:54', '2026-06-02 08:42:54'),
(9, 5, 'purchase', -1200000, 6399992, 5199992, 'Mua tài khoản #2', '2', '2026-06-02 08:53:55', '2026-06-02 08:53:55'),
(10, 5, 'purchase', -50000, 5199992, 5149992, 'Mua tài khoản #14', '14', '2026-06-02 12:57:11', '2026-06-02 12:57:11'),
(11, 5, 'purchase', -800000, 5149992, 4349992, 'Mua tài khoản #24', '24', '2026-06-02 14:37:11', '2026-06-02 14:37:11'),
(12, 5, 'purchase', -2, 4349992, 4349990, 'Mua tài khoản #27', '27', '2026-06-04 00:33:25', '2026-06-04 00:33:25'),
(13, 5, 'purchase', -3, 4349990, 4349987, 'Mua tài khoản #28', '28', '2026-06-04 09:35:43', '2026-06-04 09:35:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `money_withdrawal_histories`
--

CREATE TABLE `money_withdrawal_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` bigint(20) NOT NULL,
  `user_note` text DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `status` enum('processing','success','error') NOT NULL DEFAULT 'processing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `money_withdrawal_histories`
--

INSERT INTO `money_withdrawal_histories` (`id`, `user_id`, `amount`, `user_note`, `admin_note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 500000, 'Rút tiền về tài khoản Vietcombank', 'Đã chuyển khoản thành công', 'success', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 2, 1000000, 'Rút tiền về Momo', NULL, 'processing', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 3, 300000, 'Rút tiền về Techcombank', 'Lỗi hệ thống ngân hàng', 'error', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_favicon` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `class_favicon`, `content`, `created_at`, `updated_at`) VALUES
(1, 'fa-user-circle', 'Tài khoản Free Fire Liên Quân giá rẻ, uy tín', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 'fa-credit-card', 'Giao dịch nhanh gọn, cam kết bảo mật', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(4, 'fa-headset', 'Hỗ trợ 24/7, giải quyết mọi vấn đề nhanh chóng', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('levanphu2002qb@gmail.com', '$2y$12$8SROz0RIgCAuRkS0selFKuzdQwvFyN1fJqDfpXA5pPkEueLyfala2', '2026-06-03 07:51:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `purchase_history`
--

CREATE TABLE `purchase_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_account_id` bigint(20) UNSIGNED NOT NULL,
  `amount` bigint(20) NOT NULL,
  `account_details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `random_categories`
--

CREATE TABLE `random_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `random_categories`
--

INSERT INTO `random_categories` (`id`, `name`, `slug`, `thumbnail`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'THỬ VẬN MAY NGỌC RỒNG VIP 1', 'thu-van-may-ngoc-rong-vip-1', 'https://i.postimg.cc/htqt8yKS/Th-V-n-May-Ng-c-R-ng-Vip-1.jpg', 'Danh mục chứa tài khoản thử vận may Ngọc Rồng VIP 1.', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 'THỬ VẬN MAY NGỌC RỒNG VIP 2', 'thu-van-may-ngoc-rong-vip-2', 'https://i.postimg.cc/8PvC6QQK/Th-V-n-May-Ng-c-R-ng-Vip-2.jpg', 'Danh mục chứa tài khoản thử vận may Ngọc Rồng VIP 2.', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `random_category_accounts`
--

CREATE TABLE `random_category_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `random_category_id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `status` enum('available','sold') NOT NULL DEFAULT 'available',
  `server` int(11) NOT NULL,
  `buyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `note_buyer` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `random_category_accounts`
--

INSERT INTO `random_category_accounts` (`id`, `random_category_id`, `account_name`, `password`, `price`, `status`, `server`, `buyer_id`, `note`, `note_buyer`, `thumbnail`, `created_at`, `updated_at`) VALUES
(2, 1, 'player2', 'pass456', 750000, 'sold', 2, 1, 'Tài khoản có skin hiếm.', NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 1, 'player3', 'pass789', 300000, 'available', 3, NULL, NULL, NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(4, 1, NULL, NULL, 1000000, 'available', 4, NULL, 'Tài khoản đặc biệt.', NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(5, 1, 'player5', 'pass101', 450000, 'sold', 5, 2, NULL, NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(6, 1, 'player6', 'pass202', 600000, 'available', 6, NULL, 'Tài khoản VIP.', NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(8, 1, 'player8', 'pass404', 250000, 'sold', 8, 3, 'Tài khoản đã qua sử dụng.', NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service_histories`
--

CREATE TABLE `service_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_service_id` bigint(20) UNSIGNED NOT NULL,
  `service_package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `game_account` varchar(255) NOT NULL,
  `game_password` varchar(255) NOT NULL,
  `server` int(11) NOT NULL,
  `amount` bigint(20) NOT NULL DEFAULT 0,
  `price` bigint(20) NOT NULL,
  `discount_code` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','processing','completed','cancelled') NOT NULL DEFAULT 'pending',
  `admin_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service_packages`
--

CREATE TABLE `service_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `game_service_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` bigint(20) NOT NULL,
  `estimated_time` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `role` enum('member','admin') NOT NULL DEFAULT 'member',
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `total_deposited` bigint(20) NOT NULL DEFAULT 0,
  `gold` bigint(20) NOT NULL DEFAULT 0,
  `gem` bigint(20) NOT NULL DEFAULT 0,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `ip_address` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `google_id`, `facebook_id`, `role`, `balance`, `total_deposited`, `gold`, `gem`, `banned`, `ip_address`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$KLjfjkm2ZyWu5GOsbDcnY.QSsHzGtsBn.AXYwsPRJfnnFXQc/Jt6a', 'example@example.com', NULL, NULL, 'admin', 1000000, 5000000, 0, 0, 0, '192.168.1.1', 'lRaoXja369', '2025-04-07 07:25:36', '2025-04-07 07:25:36', '2025-04-07 07:25:36'),
(2, 'moderator', '$2y$12$CxLo6hCEZd1RvstM5WydguSj.y91QbkP/QXO/ReZnXgG4x94Z1EB2', 'moderator@example.com', NULL, NULL, 'admin', 1000000, 5000000, 0, 0, 0, '192.168.1.1', '8bnvSMHGTd', '2025-04-07 07:25:37', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 'staff', '$2y$12$uMtrfctT9TmhDS7jYxLScekgnVyhDoPU1frrKT743Rl78VAvjptbC', 'staff@example.com', NULL, NULL, 'member', 1000000, 5000000, 0, 0, 0, '192.168.1.1', 'DJsz7k22qZ', '2025-04-07 07:25:37', '2025-04-07 07:25:37', '2026-06-02 00:53:26'),
(4, 'phu', '$2y$12$ROCKgkXalCffgplNj.1Qi.0OYcQVk85Ev0anCFHClNiRzZXUNqOc.', 'vanphule22@gmail.com', NULL, NULL, 'admin', 0, 0, 0, 0, 0, '127.0.0.1', NULL, NULL, '2026-05-30 12:49:37', '2026-06-03 08:33:40'),
(5, 'levanphu2002qb@gmail.com', '$2y$12$ZeSh/km8KV34X8xxh4BaDOFpKpHintU0e.MjrmWj6dXE.1tpU7XRe', 'levanphu2002qb@gmail.com', NULL, NULL, 'member', 4349987, 0, 0, 0, 0, '127.0.0.1', NULL, NULL, '2026-05-31 00:52:02', '2026-06-01 08:17:07'),
(6, 'phu23', '$2y$12$uruTt1mIlLI2KOqhr0mKmOEt6Sc5b/KGLWz7zuvS3Fl.OZgJGXnGa', 'levanphu20022qb@gmail.com', NULL, NULL, 'member', 9980, 0, 0, 0, 0, '127.0.0.1', NULL, NULL, '2026-05-31 08:10:47', '2026-06-01 08:29:46'),
(7, 'abc', '$2y$12$nXl2tu5HD.AXIO/6QVh9luCtQcNI18aiPUnyU52RSez/StsIwLO3.', 'vanphule202@gmail.com', NULL, NULL, 'member', 0, 0, 0, 0, 0, '127.0.0.1', NULL, NULL, '2026-06-03 07:56:26', '2026-06-03 07:56:26'),
(8, 'nguyen ba lam', '$2y$12$Xnq7m7aUNwg3ZBuntw7AjOcZZjoCEHw7.yUAIAkN8TH8nxR/S0pni', 'levanphu200@gmail.com', NULL, NULL, 'member', 0, 0, 0, 0, 0, '127.0.0.1', NULL, NULL, '2026-06-03 07:58:33', '2026-06-03 07:58:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `withdrawal_histories`
--

CREATE TABLE `withdrawal_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `type` enum('gold','gem') NOT NULL,
  `character_name` varchar(255) NOT NULL,
  `server` int(11) NOT NULL,
  `user_note` varchar(255) DEFAULT NULL,
  `admin_note` varchar(255) DEFAULT NULL,
  `status` enum('success','error','processing') NOT NULL DEFAULT 'processing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `withdrawal_histories`
--

INSERT INTO `withdrawal_histories` (`id`, `user_id`, `amount`, `type`, `character_name`, `server`, `user_note`, `admin_note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1000, 'gold', 'Hero123', 1, NULL, NULL, 'processing', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 2, 200, 'gem', 'MageXYZ', 2, NULL, NULL, 'processing', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bank_deposits`
--
ALTER TABLE `bank_deposits`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `bank_deposits_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `card_deposits`
--
ALTER TABLE `card_deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_deposits_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `configs_key_unique` (`key`);

--
-- Chỉ mục cho bảng `discount_codes`
--
ALTER TABLE `discount_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `discount_codes_code_unique` (`code`);

--
-- Chỉ mục cho bảng `discount_code_usages`
--
ALTER TABLE `discount_code_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_code_usages_discount_code_id_foreign` (`discount_code_id`),
  ADD KEY `discount_code_usages_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `game_accounts`
--
ALTER TABLE `game_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_accounts_game_category_id_foreign` (`game_category_id`),
  ADD KEY `game_accounts_buyer_id_foreign` (`buyer_id`);

--
-- Chỉ mục cho bảng `game_categories`
--
ALTER TABLE `game_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `money_transactions`
--
ALTER TABLE `money_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `money_transactions_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `money_withdrawal_histories`
--
ALTER TABLE `money_withdrawal_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `money_withdrawal_histories_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_history_user_id_foreign` (`user_id`),
  ADD KEY `purchase_history_game_account_id_foreign` (`game_account_id`);

--
-- Chỉ mục cho bảng `random_categories`
--
ALTER TABLE `random_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `random_categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `random_category_accounts`
--
ALTER TABLE `random_category_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `random_category_accounts_random_category_id_foreign` (`random_category_id`),
  ADD KEY `random_category_accounts_buyer_id_foreign` (`buyer_id`);

--
-- Chỉ mục cho bảng `service_histories`
--
ALTER TABLE `service_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_histories_user_id_foreign` (`user_id`),
  ADD KEY `service_histories_game_service_id_foreign` (`game_service_id`),
  ADD KEY `service_histories_service_package_id_foreign` (`service_package_id`);

--
-- Chỉ mục cho bảng `service_packages`
--
ALTER TABLE `service_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_packages_game_service_id_foreign` (`game_service_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `withdrawal_histories`
--
ALTER TABLE `withdrawal_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawal_histories_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `card_deposits`
--
ALTER TABLE `card_deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `configs`
--
ALTER TABLE `configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `discount_codes`
--
ALTER TABLE `discount_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `discount_code_usages`
--
ALTER TABLE `discount_code_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `game_accounts`
--
ALTER TABLE `game_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `game_categories`
--
ALTER TABLE `game_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `money_transactions`
--
ALTER TABLE `money_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `money_withdrawal_histories`
--
ALTER TABLE `money_withdrawal_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `random_categories`
--
ALTER TABLE `random_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `random_category_accounts`
--
ALTER TABLE `random_category_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `service_histories`
--
ALTER TABLE `service_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `service_packages`
--
ALTER TABLE `service_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `withdrawal_histories`
--
ALTER TABLE `withdrawal_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bank_deposits`
--
ALTER TABLE `bank_deposits`
  ADD CONSTRAINT `bank_deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `card_deposits`
--
ALTER TABLE `card_deposits`
  ADD CONSTRAINT `card_deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `discount_code_usages`
--
ALTER TABLE `discount_code_usages`
  ADD CONSTRAINT `discount_code_usages_discount_code_id_foreign` FOREIGN KEY (`discount_code_id`) REFERENCES `discount_codes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discount_code_usages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `game_accounts`
--
ALTER TABLE `game_accounts`
  ADD CONSTRAINT `game_accounts_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `game_accounts_game_category_id_foreign` FOREIGN KEY (`game_category_id`) REFERENCES `game_categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `money_transactions`
--
ALTER TABLE `money_transactions`
  ADD CONSTRAINT `money_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `money_withdrawal_histories`
--
ALTER TABLE `money_withdrawal_histories`
  ADD CONSTRAINT `money_withdrawal_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD CONSTRAINT `purchase_history_game_account_id_foreign` FOREIGN KEY (`game_account_id`) REFERENCES `game_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `random_category_accounts`
--
ALTER TABLE `random_category_accounts`
  ADD CONSTRAINT `random_category_accounts_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `random_category_accounts_random_category_id_foreign` FOREIGN KEY (`random_category_id`) REFERENCES `random_categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `service_histories`
--
ALTER TABLE `service_histories`
  ADD CONSTRAINT `service_histories_game_service_id_foreign` FOREIGN KEY (`game_service_id`) REFERENCES `game_services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_histories_service_package_id_foreign` FOREIGN KEY (`service_package_id`) REFERENCES `service_packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `service_packages`
--
ALTER TABLE `service_packages`
  ADD CONSTRAINT `service_packages_game_service_id_foreign` FOREIGN KEY (`game_service_id`) REFERENCES `game_services` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `withdrawal_histories`
--
ALTER TABLE `withdrawal_histories`
  ADD CONSTRAINT `withdrawal_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
