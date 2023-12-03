-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2023 at 10:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `token`
--

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_30_154513_create_tokens_table', 1),
(6, '2023_11_30_194519_add_counter_to_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'OperatorToken', '014f8e2c814458ac94de9909fe8b1595af43d0ce5eb1400ddc47d387d6fc8e6c', '[\"*\"]', NULL, '2023-12-01 11:16:59', '2023-12-01 11:16:59'),
(2, 'App\\Models\\User', 2, 'OperatorToken', '3145fd4b65fc1817338221b307ab368ad69f23095706a753b6593603cdfedf9c', '[\"*\"]', NULL, '2023-12-01 12:42:27', '2023-12-01 12:42:27'),
(3, 'App\\Models\\User', 2, 'OperatorToken', '140c791013a2048e086a39b772c13d4598441291aaa7cf667158e44a9fa39d6e', '[\"*\"]', NULL, '2023-12-01 13:29:20', '2023-12-01 13:29:20'),
(4, 'App\\Models\\User', 2, 'OperatorToken', '8025120e2b387080aaf22057715349bdd6e33b4a70dca3627be10da18e55aec4', '[\"*\"]', NULL, '2023-12-01 13:36:08', '2023-12-01 13:36:08'),
(5, 'App\\Models\\User', 2, 'OperatorToken', '109da1773ea8eb0087adae722f2ef0edaebe94bafba6331e02223a80e4f82f9d', '[\"*\"]', NULL, '2023-12-01 13:47:50', '2023-12-01 13:47:50'),
(6, 'App\\Models\\User', 2, 'OperatorToken', '79b88d8e38fb444ed80ab43777458a03bfa895c143247021f7a78612319832fa', '[\"*\"]', NULL, '2023-12-01 13:48:51', '2023-12-01 13:48:51'),
(7, 'App\\Models\\User', 2, 'OperatorToken', 'c192f301756e256ca7fe706c68b304729fa2b74341feb33406ef7c9f23dead9d', '[\"*\"]', NULL, '2023-12-01 13:51:23', '2023-12-01 13:51:23'),
(8, 'App\\Models\\User', 2, 'OperatorToken', '132c581ae02dca2cfc0ee758b521b56bfe718a85810d9245bd5302238a30c024', '[\"*\"]', NULL, '2023-12-01 13:55:26', '2023-12-01 13:55:26'),
(9, 'App\\Models\\User', 2, 'OperatorToken', '6e1275c70e247ec6e83acbdded86ac218dcde4b319cb7b8df4f8be64d9af4377', '[\"*\"]', NULL, '2023-12-01 14:02:32', '2023-12-01 14:02:32'),
(10, 'App\\Models\\User', 2, 'OperatorToken', '94bed271bee461d26dcde2a68705798d272d05f0c50b6ca8c04da72b0f2960af', '{\"user_id\":2}', NULL, '2023-12-01 14:07:39', '2023-12-01 14:07:39'),
(11, 'App\\Models\\User', 2, 'OperatorToken', 'eefba1b64fd3c8aa58b16620385e98845ccc14a6e2cd5db4bb818a63ea183319', '{\"user_id\":2}', NULL, '2023-12-01 14:19:41', '2023-12-01 14:19:41'),
(12, 'App\\Models\\User', 2, 'OperatorToken', 'f1066c754fb0af417a1da13c6f6d5426745007396eba708ddae12d166ec7effc', '{\"user_id\":2}', '2023-12-02 17:19:14', '2023-12-01 16:52:03', '2023-12-02 17:19:14'),
(13, 'App\\Models\\User', 2, 'OperatorToken', 'e5af8ca075d34f18464ea0373968bd220dd228262065046cae9fd3fef625198c', '{\"user_id\":2}', NULL, '2023-12-01 18:30:37', '2023-12-01 18:30:37'),
(14, 'App\\Models\\User', 2, 'OperatorToken', '73c9a8064d79ed33eda289dc65bc34e71ee90ab2a4e7501626cfc7e5c1d1634d', '{\"user_id\":2}', NULL, '2023-12-01 18:36:39', '2023-12-01 18:36:39'),
(15, 'App\\Models\\User', 2, 'OperatorToken', '4fb2cc89289e4bbf1266500a2c8e62b4c889f77971f239b1871e00ce95bd059d', '{\"user_id\":2}', NULL, '2023-12-01 18:42:24', '2023-12-01 18:42:24'),
(16, 'App\\Models\\User', 2, 'OperatorToken', 'b57ea0400b42b6b237beb803ecd578c24fc0f21a71039b90e196efc2dc810b4c', '{\"user_id\":2}', NULL, '2023-12-01 23:59:28', '2023-12-01 23:59:28'),
(17, 'App\\Models\\User', 2, 'OperatorToken', '0fef114cc56df693e7f7837834ed9650b756843a4e7e2688d3b00675e3b77ede', '{\"user_id\":2}', NULL, '2023-12-02 02:01:25', '2023-12-02 02:01:25'),
(18, 'App\\Models\\User', 2, 'OperatorToken', '84265d7f741906742967754a69a5c48e214d9a62258a1559ae92b93e04b64dd0', '{\"user_id\":2}', NULL, '2023-12-02 09:52:14', '2023-12-02 09:52:14'),
(19, 'App\\Models\\User', 2, 'OperatorToken', 'aabfb06753001d027ee527720c7896c4a8e5a5e25aa8c94fb14358cd8a301b01', '{\"user_id\":2}', NULL, '2023-12-02 10:26:27', '2023-12-02 10:26:27'),
(20, 'App\\Models\\User', 2, 'OperatorToken', '2b456f343d8cd6f7dc413084a62ad1e66f11e26f29f15b49eeff6356db19a514', '{\"user_id\":2}', '2023-12-02 11:28:39', '2023-12-02 11:26:35', '2023-12-02 11:28:39'),
(21, 'App\\Models\\User', 2, 'OperatorToken', 'bde6dcb9560ab914f8088e61dd5ecf795e9a585e1260fcb6eb14614ddd7bd024', '{\"user_id\":2}', NULL, '2023-12-02 13:04:25', '2023-12-02 13:04:25'),
(22, 'App\\Models\\User', 2, 'OperatorToken', '0b97b00d3339d576f56caa160911b9404b92688f4bf78ae88ca45781a6b24529', '{\"user_id\":2}', NULL, '2023-12-02 13:18:36', '2023-12-02 13:18:36'),
(23, 'App\\Models\\User', 1, 'OperatorToken', '0344eb4117152366676d693a3945e29a5332d5a119ba805ab49f0cef9eb9805d', '{\"user_id\":1}', '2023-12-03 19:37:45', '2023-12-02 17:18:03', '2023-12-03 19:37:45'),
(24, 'App\\Models\\User', 3, 'OperatorToken', 'ff732b90f4d8ba793e1b0717d2508ed6b98caecf024a452424cb8f47da43a5d1', '{\"user_id\":3}', NULL, '2023-12-03 05:38:27', '2023-12-03 05:38:27'),
(25, 'App\\Models\\User', 3, 'OperatorToken', '0eb41f44fdda28895c0dd322e6f0b4a4ac3b2fa0aaf3491790add0c34e3a671d', '{\"user_id\":3}', NULL, '2023-12-03 05:38:31', '2023-12-03 05:38:31'),
(26, 'App\\Models\\User', 3, 'OperatorToken', '9d6f7b6e85a5f27db73c122bebaabb92dc46c2ae82477e7e6f4b6b044ba7449e', '{\"user_id\":3}', NULL, '2023-12-03 05:39:09', '2023-12-03 05:39:09'),
(27, 'App\\Models\\User', 3, 'OperatorToken', '53873430d9f7ac2de77fed5444bf197c419e305aef3bb58b92e2d2349d5dd15b', '{\"user_id\":3}', NULL, '2023-12-03 05:40:44', '2023-12-03 05:40:44'),
(28, 'App\\Models\\User', 3, 'OperatorToken', 'c2216f6f0432f0e0936f992bd7e6e370ac5613e12aedc5b2b7d2ed865bcc199d', '{\"user_id\":3}', NULL, '2023-12-03 05:41:45', '2023-12-03 05:41:45'),
(29, 'App\\Models\\User', 3, 'OperatorToken', '16a21a6b5bca0916e806efdddc36872e50128d455c9b260a9ebb632aa5601596', '{\"user_id\":3}', NULL, '2023-12-03 05:41:49', '2023-12-03 05:41:49'),
(30, 'App\\Models\\User', 3, 'OperatorToken', '94447e996b4d58443d9a25320cb165d5c61c1fff696664b6d3834e9b366872b4', '{\"user_id\":3}', NULL, '2023-12-03 05:42:43', '2023-12-03 05:42:43'),
(31, 'App\\Models\\User', 3, 'OperatorToken', '9b6a0393d4ecb532c46d581e82ce18f7f7e9ab9e8be7b9956eead1d8f00401ea', '{\"user_id\":3}', NULL, '2023-12-03 05:43:08', '2023-12-03 05:43:08'),
(32, 'App\\Models\\User', 1, 'OperatorToken', 'ffa5fc365452daa1ddcad9fb24a1a1efe201532ca43362754b314a44999d9663', '{\"user_id\":1}', NULL, '2023-12-03 05:43:43', '2023-12-03 05:43:43'),
(33, 'App\\Models\\User', 3, 'OperatorToken', 'a30903c617bc6bd8d2338a10516d325c59c2e6be1fe95eb9568cc5557ba965e8', '{\"user_id\":3}', NULL, '2023-12-03 05:44:12', '2023-12-03 05:44:12'),
(34, 'App\\Models\\User', 3, 'OperatorToken', '4dec1a5ee14d9d4855822be77b3df198ca85197cdee5b2bf197f789f377ac87d', '{\"user_id\":3}', NULL, '2023-12-03 05:45:47', '2023-12-03 05:45:47'),
(35, 'App\\Models\\User', 1, 'OperatorToken', '765310b08ad3caa1017aa39a4580107ff63fbc34375228a3aa258391c2308538', '{\"user_id\":1}', '2023-12-03 06:39:09', '2023-12-03 05:56:37', '2023-12-03 06:39:09'),
(36, 'App\\Models\\User', 1, 'OperatorToken', '7f3796142e5d97ec5897589e00237a7c23b783e45bfbab0dfac51e80d5a39aa3', '{\"user_id\":1}', '2023-12-03 07:33:38', '2023-12-03 07:14:28', '2023-12-03 07:33:38'),
(37, 'App\\Models\\User', 1, 'OperatorToken', '306394c9cc21b81dea7e19389c0c1c6f161abda0daff54853b64b6eb07072249', '{\"user_id\":1}', '2023-12-03 07:27:18', '2023-12-03 07:16:30', '2023-12-03 07:27:18'),
(38, 'App\\Models\\User', 1, 'OperatorToken', '0edb7a1faa0a963b43916f6196b49c0223ceff37fa5b049079996d8cec23cc11', '{\"user_id\":1}', '2023-12-03 13:06:47', '2023-12-03 10:44:09', '2023-12-03 13:06:47'),
(39, 'App\\Models\\User', 1, 'OperatorToken', '42b7bad0f49efbcf8830ee47c0f03a92e79b8b8fccd8e88d84b08e5662456b43', '{\"user_id\":1}', '2023-12-03 19:55:34', '2023-12-03 12:30:33', '2023-12-03 19:55:34'),
(40, 'App\\Models\\User', 1, 'OperatorToken', 'cffaae9b613e3f9e2922cb7bc620e4f8e22711f5df6159edc8443ea79d27b0c2', '{\"user_id\":1}', '2023-12-03 13:10:14', '2023-12-03 13:07:45', '2023-12-03 13:10:14'),
(41, 'App\\Models\\User', 3, 'OperatorToken', '89198e37a660aaf2f236c68d4f4f20de43fefca433c3e1922946e3bc079dfb05', '{\"user_id\":3}', '2023-12-03 13:13:26', '2023-12-03 13:11:01', '2023-12-03 13:13:26'),
(42, 'App\\Models\\User', 1, 'OperatorToken', '66ce28f320290657ccd67c93f5cd61ccbde76a3d78df4c31b57ef5a3ce4a98a3', '{\"user_id\":1}', '2023-12-03 15:37:53', '2023-12-03 15:32:12', '2023-12-03 15:37:53'),
(43, 'App\\Models\\User', 2, 'OperatorToken', 'b68800ac804d70d0c79f3046666f8f30a023aa37b96d50695702beb6e2ff2f5b', '{\"user_id\":2}', '2023-12-03 18:14:45', '2023-12-03 15:38:27', '2023-12-03 18:14:45'),
(44, 'App\\Models\\User', 2, 'OperatorToken', '9a66dc3d725c249ce811900bbf9c6a14241f09bb7f1be8a4e07d1b38fdaca048', '{\"user_id\":2}', NULL, '2023-12-03 18:43:51', '2023-12-03 18:43:51'),
(45, 'App\\Models\\User', 2, 'OperatorToken', 'f91aef93a37b094ffe2eeb461a796f793bce012e2dda73f309c747fcf3952862', '{\"user_id\":2}', '2023-12-03 20:21:51', '2023-12-03 19:34:47', '2023-12-03 20:21:51'),
(46, 'App\\Models\\User', 1, 'OperatorToken', 'c44e9089b2c2ebf8f2a0156ad3566bf109caab6bff1667f3f7cd8380bc36c4de', '{\"user_id\":1}', '2023-12-03 19:57:49', '2023-12-03 19:55:39', '2023-12-03 19:57:49'),
(47, 'App\\Models\\User', 2, 'OperatorToken', '56030a9e743c70a4ef1673eae319a9dc8adcd6b301d18a3e3d5405a2812cf2bc', '{\"user_id\":2}', '2023-12-03 20:48:35', '2023-12-03 20:23:02', '2023-12-03 20:48:35'),
(48, 'App\\Models\\User', 2, 'OperatorToken', '745fc3226ab835cd1c87661a5a7fd0d66df36554bb1122169f90ecac3631be9c', '{\"user_id\":2}', '2023-12-03 20:28:49', '2023-12-03 20:27:53', '2023-12-03 20:28:49'),
(49, 'App\\Models\\User', 2, 'OperatorToken', 'a149e51e7a7732705a706da401784e845279ba8ffd3319868b6f6956f768be6d', '{\"user_id\":2}', NULL, '2023-12-03 21:17:41', '2023-12-03 21:17:41'),
(50, 'App\\Models\\User', 2, 'OperatorToken', '099bfd863afd7734dc5d35efc3ff6dc805b5bce31e8c893bb5c090bc24ec78ab', '{\"user_id\":2}', NULL, '2023-12-03 21:18:08', '2023-12-03 21:18:08'),
(51, 'App\\Models\\User', 2, 'OperatorToken', '20802fea7ed1565ce3d0716f805ee870cb3a76ca900ad5a17c9c9eb5f2fb64ff', '{\"user_id\":2}', '2023-12-03 21:19:31', '2023-12-03 21:19:09', '2023-12-03 21:19:31'),
(52, 'App\\Models\\User', 2, 'OperatorToken', 'af548c12996a572cb8b47d2ea1c641e94a8abf37b2a6b4af8adbfefd80486ddc', '{\"user_id\":2}', '2023-12-03 21:35:15', '2023-12-03 21:20:47', '2023-12-03 21:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `date_time` datetime NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `counter` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `mobile_number`, `service`, `date_time`, `status`, `counter`, `created_at`, `updated_at`) VALUES
(1, '254710699139', 'Decoder Renewal', '2023-12-01 14:17:07', '0', '1', '2023-12-01 11:17:07', '2023-12-01 11:17:07'),
(2, '254710699139', 'General Enquiries', '2023-12-01 14:17:22', '0', '2', '2023-12-01 11:17:22', '2023-12-01 11:17:22'),
(3, '254710699139', 'General Enquiries', '2023-12-01 14:47:58', '0', '3', '2023-12-01 11:47:58', '2023-12-01 11:47:58'),
(4, '254710699139', 'General Enquiries', '2023-12-01 14:48:19', '1', '3', '2023-12-01 11:48:19', '2023-12-01 11:48:19'),
(5, '254710699139', 'Decoder Renewal', '2023-12-01 15:24:39', '1', '1', '2023-12-01 12:24:39', '2023-12-01 12:24:39'),
(6, '254710699139', 'Decoder Renewal', '2023-12-01 15:24:43', '1', '1', '2023-12-01 12:24:43', '2023-12-01 12:24:43'),
(7, '254710699139', 'Decoder Renewal', '2023-12-01 16:29:59', '1', '2', '2023-12-01 13:29:59', '2023-12-01 17:05:53'),
(8, '254710699139', 'Decoder Renewal', '2023-12-01 18:59:36', '0', '2', '2023-12-01 15:59:36', '2023-12-01 16:57:13'),
(9, '254710699139', 'Decoder Renewal', '2023-12-01 21:43:46', '0', '2', '2023-12-01 18:43:46', '2023-12-02 10:28:17'),
(10, '254710699139', 'General Enquiries', '2023-12-01 21:44:05', '0', '2', '2023-12-01 18:44:05', '2023-12-02 10:31:51'),
(11, '254710699139', 'General Enquiries', '2023-12-01 22:56:22', '0', '2', '2023-12-01 19:56:22', '2023-12-02 11:27:03'),
(12, '254710699139', 'General Enquiries', '2023-12-01 23:28:18', '1', '2', '2023-12-01 20:28:18', '2023-12-02 11:28:39'),
(13, '254710699139', 'General Enquiries', '2023-12-01 23:38:53', '0', '3', '2023-12-01 20:38:53', '2023-12-01 20:38:53'),
(14, '254710699139', 'General Enquiries', '2023-12-02 01:01:58', '1', '2', '2023-12-01 22:01:58', '2023-12-01 22:01:58'),
(15, '254710699139', 'General Enquiries', '2023-12-02 01:06:37', '1', '2', '2023-12-01 22:06:38', '2023-12-01 22:06:38'),
(16, '254710699139', 'General Enquiries', '2023-12-02 03:35:26', '1', '3', '2023-12-02 00:35:26', '2023-12-02 00:35:26'),
(17, '254710699139', 'Decoder Renewal', '2023-12-02 03:37:47', '1', '3', '2023-12-02 00:37:47', '2023-12-02 00:37:47'),
(18, '254710699139', 'Decoder Renewal', '2023-12-02 03:39:21', '1', '1', '2023-12-02 00:39:21', '2023-12-02 17:18:59'),
(19, '254710699139', 'General Enquiries', '2023-12-02 04:10:40', '1', '1', '2023-12-02 01:10:40', '2023-12-02 17:19:08'),
(20, '254710699139', 'General Enquiries', '2023-12-02 13:28:30', '1', '1', '2023-12-02 10:28:30', '2023-12-02 17:19:14'),
(21, '254713839182', 'Decoder Renewal', '2023-12-02 13:53:27', '1', '1', '2023-12-02 10:53:27', '2023-12-03 06:39:09'),
(22, '254713839182', 'Decoder Renewal', '2023-12-02 13:53:30', '1', '1', '2023-12-02 10:53:30', '2023-12-03 07:33:38'),
(23, '254713839182', 'General Enquiries', '2023-12-02 13:54:07', '1', '1', '2023-12-02 10:54:07', '2023-12-03 10:44:39'),
(24, '254713839182', 'General Enquiries', '2023-12-02 13:54:49', '1', '1', '2023-12-02 10:54:49', '2023-12-03 11:04:31'),
(25, '254713839182', 'Decoder Renewal', '2023-12-02 14:03:49', '1', '1', '2023-12-02 11:03:49', '2023-12-03 11:10:23'),
(26, '254713839182', 'Decoder Renewal', '2023-12-02 14:05:59', '1', '1', '2023-12-02 11:05:59', '2023-12-03 11:10:32'),
(27, '254713839182', 'Decoder Renewal', '2023-12-02 14:06:54', '1', '1', '2023-12-02 11:06:54', '2023-12-03 11:12:06'),
(28, '254713839182', 'General Enquiries', '2023-12-02 14:08:51', '1', '1', '2023-12-02 11:08:51', '2023-12-03 12:45:36'),
(29, '254713839182', 'Decoder Renewal', '2023-12-02 14:12:24', '0', '1', '2023-12-02 11:12:24', '2023-12-03 12:46:44'),
(30, '254713839182', 'Decoder Renewal', '2023-12-02 14:21:20', '0', '1', '2023-12-02 11:21:20', '2023-12-03 12:47:01'),
(31, '254710699139', 'General Enquiries', '2023-12-03 00:14:05', '0', '1', '2023-12-02 21:14:05', '2023-12-03 12:47:37'),
(32, '254710699139', 'General Enquiries', '2023-12-03 08:20:52', '0', '1', '2023-12-03 05:20:52', '2023-12-03 13:06:47'),
(33, '254710699139', 'General Enquiries', '2023-12-03 12:23:13', '0', '1', '2023-12-03 09:23:13', '2023-12-03 13:07:55'),
(34, '254710699139', 'General Enquiries', '2023-12-03 12:26:34', '1', '1', '2023-12-03 09:26:34', '2023-12-03 15:34:01'),
(35, '254710699139', 'General Enquiries', '2023-12-03 12:28:46', '1', '1', '2023-12-03 09:28:46', '2023-12-03 13:08:31'),
(36, '254710699139', 'General Enquiries', '2023-12-03 12:29:17', '1', '1', '2023-12-03 09:29:17', '2023-12-03 13:10:14'),
(37, '254710699139', 'General Enquiries', '2023-12-03 12:31:22', '1', '3', '2023-12-03 09:31:22', '2023-12-03 13:11:36'),
(38, '254710699139', 'General Enquiries', '2023-12-03 12:31:30', '1', '3', '2023-12-03 09:31:30', '2023-12-03 13:13:26'),
(39, '254710699139', 'General Enquiries', '2023-12-03 12:32:16', '0', '2', '2023-12-03 09:32:16', '2023-12-03 15:43:00'),
(40, '254710699139', 'General Enquiries', '2023-12-03 12:33:03', '0', '2', '2023-12-03 09:33:03', '2023-12-03 16:06:55'),
(41, '254710699139', 'General Enquiries', '2023-12-03 12:33:21', '1', '2', '2023-12-03 09:33:21', '2023-12-03 18:14:45'),
(42, '254710699139', 'General Enquiries', '2023-12-03 12:34:30', '0', '1', '2023-12-03 09:34:30', '2023-12-03 19:37:45'),
(43, '254710699139', 'General Enquiries', '2023-12-03 12:37:35', '0', '2', '2023-12-03 09:37:35', '2023-12-03 19:40:49'),
(44, '254710699139', 'General Enquiries', '2023-12-03 12:37:39', '0', '2', '2023-12-03 09:37:39', '2023-12-03 19:44:31'),
(45, '254710699139', 'General Enquiries', '2023-12-03 12:38:40', '1', '2', '2023-12-03 09:38:40', '2023-12-03 20:24:21'),
(46, '254710699139', 'General Enquiries', '2023-12-03 12:38:58', '1', '2', '2023-12-03 09:38:58', '2023-12-03 20:28:29'),
(47, '+254710699139', 'General Enquiries', '2023-12-03 12:40:31', '0', '2', '2023-12-03 09:40:31', '2023-12-03 20:28:44'),
(48, '+254710699139', 'General Enquiries', '2023-12-03 12:43:21', '0', '2', '2023-12-03 09:43:21', '2023-12-03 20:32:23'),
(49, '+254710699139', 'General Enquiries', '2023-12-03 12:43:53', '0', '2', '2023-12-03 09:43:53', '2023-12-03 20:40:27'),
(50, '254710699139', 'General Enquiries', '2023-12-03 12:45:37', '0', '2', '2023-12-03 09:45:37', '2023-12-03 20:43:26'),
(51, '254710699139', 'General Enquiries', '2023-12-03 19:12:47', '0', '2', '2023-12-03 16:12:47', '2023-12-03 20:45:37'),
(52, '254710699139', 'Decoder Renewal', '2023-12-03 19:14:01', '1', '2', '2023-12-03 16:14:01', '2023-12-03 21:19:20'),
(53, '254710699139', 'General Enquiries', '2023-12-03 19:20:33', '1', '2', '2023-12-03 16:20:33', '2023-12-03 21:35:05'),
(54, '254710699139', 'Decoder Renewal', '2023-12-03 19:22:41', '0', '2', '2023-12-03 16:22:41', '2023-12-03 21:35:11'),
(55, '254710699139', 'Decoder Renewal', '2023-12-03 21:50:37', '0', NULL, '2023-12-03 18:50:37', '2023-12-03 18:50:37'),
(56, '254710699139', 'General Enquiries', '2023-12-03 21:53:09', '0', NULL, '2023-12-03 18:53:09', '2023-12-03 18:53:09'),
(57, '254710699139', 'General Enquiries', '2023-12-03 21:59:31', '0', NULL, '2023-12-03 18:59:31', '2023-12-03 18:59:31'),
(58, '254710699139', 'Decoder Renewal', '2023-12-03 21:59:59', '0', NULL, '2023-12-03 18:59:59', '2023-12-03 18:59:59'),
(59, '254710699139', 'Decoder Renewal', '2023-12-03 22:02:32', '0', NULL, '2023-12-03 19:02:32', '2023-12-03 19:02:32'),
(60, '254710699139', 'Decoder Renewal', '2023-12-03 22:02:42', '0', NULL, '2023-12-03 19:02:42', '2023-12-03 19:02:42'),
(61, '254710699139', 'General Enquiries', '2023-12-03 22:06:04', '0', NULL, '2023-12-03 19:06:04', '2023-12-03 19:06:04'),
(62, '254710699139', 'General Enquiries', '2023-12-03 22:09:33', '0', NULL, '2023-12-03 19:09:33', '2023-12-03 19:09:33'),
(63, '254710699139', 'General Enquiries', '2023-12-03 22:12:35', '0', NULL, '2023-12-03 19:12:35', '2023-12-03 19:12:35'),
(64, '254713839182', 'General Enquiries', '2023-12-03 22:16:16', '0', NULL, '2023-12-03 19:16:16', '2023-12-03 19:16:16'),
(65, '254710699139', 'Decoder Renewal', '2023-12-03 22:20:58', '0', NULL, '2023-12-03 19:20:58', '2023-12-03 19:20:58'),
(66, '254710699139', 'General Enquiries', '2023-12-03 22:23:53', '0', NULL, '2023-12-03 19:23:53', '2023-12-03 19:23:53'),
(67, '254710699139', 'Decoder Renewal', '2023-12-03 22:26:55', '0', NULL, '2023-12-03 19:26:56', '2023-12-03 19:26:56'),
(68, '254710699139', 'Decoder Renewal', '2023-12-03 22:27:11', '0', NULL, '2023-12-03 19:27:11', '2023-12-03 19:27:11'),
(69, '254713839182', 'General Enquiries', '2023-12-03 22:28:46', '0', NULL, '2023-12-03 19:28:46', '2023-12-03 19:28:46'),
(70, '254713839182', 'General Enquiries', '2023-12-03 22:29:45', '0', NULL, '2023-12-03 19:29:45', '2023-12-03 19:29:45'),
(71, '254710699139', 'General Enquiries', '2023-12-03 22:32:49', '0', NULL, '2023-12-03 19:32:49', '2023-12-03 19:32:49'),
(72, '254710699139', 'General Enquiries', '2023-12-03 22:33:55', '0', NULL, '2023-12-03 19:33:55', '2023-12-03 19:33:55'),
(73, '254710699139', 'General Enquiries', '2023-12-04 00:17:02', '0', NULL, '2023-12-03 21:17:02', '2023-12-03 21:17:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Qsys', 'qsys@gmail.com', NULL, '$2y$10$r59FSUpmDd2POVBxm/mYEuguzE9vpquqbeKfmqtI9vqt2f1g5u6kq', NULL, '2023-12-01 11:15:02', '2023-12-01 11:15:02'),
(2, 'Kirui', 'kiruidavid8@gmail.com', NULL, '$2y$10$wFWohW9q94Kl8JEbntO7yeV6tO.BCzmFut9DKMwfaJEX0gP.s0K9G', NULL, '2023-12-01 11:16:07', '2023-12-01 11:16:07'),
(3, 'Operator Test', 'op@gmail.com', NULL, '$2y$10$S.CWIRNpXF7XwtkKNkwkXu0E9ZOIkoEt28Wz0Va14IGoQY.d7ecWO', NULL, '2023-12-01 11:16:26', '2023-12-01 11:16:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
