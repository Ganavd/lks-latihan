-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20261108.1d0362d214
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 12, 2026 at 03:43 AM
-- Server version: 8.4.3
-- PHP Version: 8.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lksweb1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--
CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--
CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--
CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_04_06_133234_create_pages_table', 1),
(5, '2026_04_06_133814_create_templates_table', 1),
(6, '2026_04_06_133821_create_template_fields_table', 1),
(7, '2026_04_06_133827_create_page_sections_table', 1),
(8, '2026_04_06_133835_create_section_field_values_table', 1),
(9, '2026_04_06_141420_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--
CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `summary`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'Homepage', 'Home Have Argana', 'homepage', 6, '2026-11-10 17:47:43', '2026-11-10 17:47:43'),
(3, 'About', 'is stroy', 'about', 6, '2026-11-10 20:59:43', '2026-11-10 20:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `page_sections`
--
CREATE TABLE `page_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` bigint UNSIGNED NOT NULL,
  `template_id` bigint UNSIGNED NOT NULL,
  `position` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_sections`
--

INSERT INTO `page_sections` (`id`, `name`, `page_id`, `template_id`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Services', 2, 2, 1, '2026-11-10 19:12:33', '2026-11-10 19:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--
CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'sanctum', '4e93ba662d4a4c7ceb16169992ababac7aecec7f2ede425d448c8c5d60a08fdd', '[\"*\"]', NULL, NULL, '2026-04-08 20:36:38', '2026-04-08 20:36:38'),
(2, 'App\\Models\\User', 1, 'sanctum', 'd48da4f3ed8ea1a7006cb2637b3130227222890880edc29b991f71c57af0bd76', '[\"*\"]', NULL, NULL, '2026-04-08 20:38:36', '2026-04-08 20:38:36'),
(3, 'App\\Models\\User', 6, 'tokenSaya', 'f596988be2edaf0d9cb50bd67918bff64666226d43c144f28275c196421d87fc', '[\"*\"]', NULL, NULL, '2026-11-10 00:52:35', '2026-11-10 00:52:35'),
(4, 'App\\Models\\User', 6, 'tokenSaya', 'b7a86bd891637334edc4f0baa10015b0abe003116ad5b71d7ff03428c7e504e5', '[\"*\"]', '2026-11-10 17:45:30', NULL, '2026-11-10 00:52:51', '2026-11-10 17:45:30'),
(5, 'App\\Models\\User', 6, 'tokenSaya', '9b37446e53781c636d2f44007acc5b165910397487004dc06ddb42617f075051', '[\"*\"]', NULL, NULL, '2026-11-10 01:19:08', '2026-11-10 01:19:08'),
(6, 'App\\Models\\User', 6, 'tokenSaya', 'a60374067b614225fa816aeec8cbbb08510b2d15fd2c9be141fbff975b06a98c', '[\"*\"]', NULL, NULL, '2026-11-10 01:19:11', '2026-11-10 01:19:11'),
(7, 'App\\Models\\User', 6, 'tokenSaya', 'aedc0f50a163b8ece59f72c7b8f64d72eb39e71d413f5ad589bd8e4af1b14a4a', '[\"*\"]', NULL, NULL, '2026-11-10 01:19:34', '2026-11-10 01:19:34'),
(8, 'App\\Models\\User', 6, 'tokenSaya', '186641e5bff78587c4fb134776af8e837f3d92004c79ddc1417ddb3c13b8c980', '[\"*\"]', NULL, NULL, '2026-11-10 01:21:42', '2026-11-10 01:21:42'),
(9, 'App\\Models\\User', 6, 'tokenSaya', '7df7dd774ac7aa98427a141182103258dea7665b83fddc0bd3529dad22f97d1a', '[\"*\"]', NULL, NULL, '2026-11-10 01:35:50', '2026-11-10 01:35:50'),
(10, 'App\\Models\\User', 6, 'tokenSaya', '0ea4ce10ae2d042135c9c5fa07dd763fda97651896ce1323148be55a874377bd', '[\"*\"]', NULL, NULL, '2026-11-10 02:10:32', '2026-11-10 02:10:32'),
(11, 'App\\Models\\User', 6, 'tokenSaya', 'c2fdc49bdcd9d17c944a4b2c3032afc23661ade22c642338ba049cf7a31c3890', '[\"*\"]', '2026-11-10 16:58:29', NULL, '2026-11-10 16:54:45', '2026-11-10 16:58:29'),
(12, 'App\\Models\\User', 6, 'tokenSaya', 'e058e02258a266b522bc390cc418e367d9affa284ee445e0e42753b3655e0cff', '[\"*\"]', '2026-11-10 19:12:33', NULL, '2026-11-10 17:46:13', '2026-11-10 19:12:33'),
(13, 'App\\Models\\User', 6, 'tokenSaya', 'b1133d3d6814611c17b0c199b59240041b1ac83c711464cbcc32f1c0e1c447e1', '[\"*\"]', '2026-11-10 17:48:29', NULL, '2026-11-10 17:48:28', '2026-11-10 17:48:29'),
(14, 'App\\Models\\User', 6, 'tokenSaya', '582464b1b897fdf814079e6bee8cc8568d557c0d3588a3e6a43ef6b1f6680e5d', '[\"*\"]', '2026-11-10 19:16:06', NULL, '2026-11-10 18:32:45', '2026-11-10 19:16:06'),
(15, 'App\\Models\\User', 6, 'tokenSaya', '41abd2e1651ba87b0840112c32598c5473f582b0ef15275023aa859827a4ba1f', '[\"*\"]', '2026-11-10 19:31:04', NULL, '2026-11-10 19:31:04', '2026-11-10 19:31:04'),
(16, 'App\\Models\\User', 6, 'tokenSaya', 'b2a18dfb507b7abdef1a31571c4b2c80c2700988f5e4ac515ee71e09cd56e06e', '[\"*\"]', '2026-11-10 21:59:24', NULL, '2026-11-10 19:40:35', '2026-11-10 21:59:24'),
(17, 'App\\Models\\User', 7, 'tokenSaya', 'c3ab600827bf8e366a7290682fc9bbe2a013299ac68fe0a203c3c3d52b9e8e4b', '[\"*\"]', NULL, NULL, '2026-11-10 23:48:26', '2026-11-10 23:48:26'),
(18, 'App\\Models\\User', 6, 'tokenSaya', '45a760032b3fb39d979f059bea6626191beb61ca00d8de1dfaf38cb740bcfafb', '[\"*\"]', NULL, NULL, '2026-11-10 23:49:21', '2026-11-10 23:49:21');

-- --------------------------------------------------------

--
-- Table structure for table `section_field_values`
--
CREATE TABLE `section_field_values` (
  `id` bigint UNSIGNED NOT NULL,
  `page_section_id` bigint UNSIGNED NOT NULL,
  `template_field_id` bigint UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7tiF9d9Vf4qmWBXRc74bsNpdoytBfU72uSDa4T9q', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiIxNGN2OWFGYTgyZDE3Q09yZGN6VEp1bWJ6Q0F5TXAyNnB0OFFmQVVwIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1794275562),
('nZuXMxcPCMGYGtYP3BwkAb6FjYWa9OKyCLkWSmhx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJ5YzdLQldrM0lQbWd5NE9KaTNsajAzUkRqUU53SVRBRzB0bFd5OHFkIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1794212362);

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--
CREATE TABLE `templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Hero Section', 'hero', '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(2, 'About Section', 'about', '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(3, 'Services Section', 'services', '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(4, 'Contact Section', 'contact', '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(5, 'Call To Action Section', 'cta', '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(6, 'Footer Section', 'footer', '2026-04-08 08:45:28', '2026-04-08 08:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `template_fields`
--
CREATE TABLE `template_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('image','text') COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `template_fields`
--

INSERT INTO `template_fields` (`id`, `name`, `type`, `template_id`, `created_at`, `updated_at`) VALUES
(1, 'title', 'text', 1, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(2, 'subtitle', 'text', 1, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(3, 'background_image', 'image', 1, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(4, 'heading', 'text', 2, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(5, 'description', 'text', 2, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(6, 'image', 'image', 2, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(7, 'title', 'text', 3, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(8, 'service_1_name', 'text', 3, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(9, 'service_1_icon', 'image', 3, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(10, 'service_2_name', 'text', 3, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(11, 'service_2_icon', 'image', 3, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(12, 'title', 'text', 4, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(13, 'email', 'text', 4, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(14, 'phone', 'text', 4, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(15, 'map_image', 'image', 4, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(16, 'title', 'text', 5, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(17, 'button_text', 'text', 5, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(18, 'background_image', 'image', 5, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(19, 'copyright_text', 'text', 6, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(20, 'logo', 'image', 6, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(21, 'facebook_link', 'text', 6, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(22, 'instagram_link', 'text', 6, '2026-04-08 08:45:28', '2026-04-08 08:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john.doe@gmail.com', NULL, '$2y$12$fPKbVALIOfWyBeThmRfTze61Qp88zdtVEbGbOeSzo/Ie0tbk7z8ze', NULL, '2026-04-08 08:45:27', '2026-04-08 08:45:27'),
(2, 'Richard Roe', 'richard.roe@gmail.com', NULL, '$2y$12$TNsA1dSYWqRhXHlJEr0YHeUinhNATPlTa6.26Opvm2AABooZYBRy2', NULL, '2026-04-08 08:45:27', '2026-04-08 08:45:27'),
(3, 'Jane Poe', 'jane.poe@gmail.com', NULL, '$2y$12$f5NJHdjwINfN9QF6UQDgjuTa5axR9WtRPvqHoQ.sF2L266pJbnFxS', NULL, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(4, 'Mahefud', 'mahefud@gmail.com', NULL, '$2y$12$V8QpAhE2PKHrGzD3cCai8.PXlXEy/xqiC/IZiXF.jSm5mx0WN2VK2', NULL, '2026-04-08 20:36:38', '2026-04-08 20:36:38'),
(5, 'Argana', 'argana@gmail.com', NULL, '$2y$12$rh45OdeuIatYQFXT/iMPDO89D6dPUgME65yHtd.rNEhxOgj9cqNJq', NULL, '2026-11-09 18:53:43', '2026-11-09 18:53:43'),
(6, 'Argana2', 'argana2@gmail.com', NULL, '$2y$12$czIpuu/Ycu8d2f4AclHeHOPlkQ42iBYKovOeG8keUorWN7bNleA.S', NULL, '2026-11-10 00:52:35', '2026-11-10 00:52:35'),
(7, 'B.Argana', 'Bargana10@gmail.com', NULL, '$2y$12$v/UPKRDfrje0ZtJlwsZSv.jUftOZ9FXlmdUlgCMjNEzd2CUm8yETy', NULL, '2026-11-10 23:48:26', '2026-11-10 23:48:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

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
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_user_id_foreign` (`user_id`);

--
-- Indexes for table `page_sections`
--
ALTER TABLE `page_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_sections_page_id_foreign` (`page_id`),
  ADD KEY `page_sections_template_id_foreign` (`template_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `section_field_values`
--
ALTER TABLE `section_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_field_values_page_section_id_foreign` (`page_section_id`),
  ADD KEY `section_field_values_template_field_id_foreign` (`template_field_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `templates_slug_unique` (`slug`);

--
-- Indexes for table `template_fields`
--
ALTER TABLE `template_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_fields_template_id_foreign` (`template_id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `page_sections`
--
ALTER TABLE `page_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `section_field_values`
--
ALTER TABLE `section_field_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `template_fields`
--
ALTER TABLE `template_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_sections`
--
ALTER TABLE `page_sections`
  ADD CONSTRAINT `page_sections_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `page_sections_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `section_field_values`
--
ALTER TABLE `section_field_values`
  ADD CONSTRAINT `section_field_values_page_section_id_foreign` FOREIGN KEY (`page_section_id`) REFERENCES `page_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `section_field_values_template_field_id_foreign` FOREIGN KEY (`template_field_id`) REFERENCES `template_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `template_fields`
--
ALTER TABLE `template_fields`
  ADD CONSTRAINT `template_fields_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
