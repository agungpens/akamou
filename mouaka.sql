-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 30, 2023 at 12:54 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mouaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_users`
--

CREATE TABLE `detail_users` (
  `id` bigint UNSIGNED NOT NULL,
  `users_id` bigint UNSIGNED DEFAULT NULL,
  `nama_lengkap` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_users`
--

INSERT INTO `detail_users` (`id`, `users_id`, `nama_lengkap`, `jenis_kelamin`, `no_hp`, `alamat`, `foto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'AGUNG ALDI PRASETYA', 'L', '085807290527', 'Jalan Palem Desa Bangsri 2, RT.2/RW.4, Bangsri, Nglegok ( pak eko krupuk ) , KAB. BLITAR, NGLEGOK, JAWA TIMUR, ID, 66181', 'aku.jpeg', '2023-08-31 06:20:41', '2023-09-02 19:29:44', NULL),
(2, 2, 'fuqyfot', 'L', '+1 (942) 336-5667', 'Tempor sed mollitia', NULL, '2023-09-10 06:35:58', '2023-09-10 06:35:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `download_logs`
--

CREATE TABLE `download_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `download` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `feedback_mous`
--

CREATE TABLE `feedback_mous` (
  `id` bigint UNSIGNED NOT NULL,
  `mou_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `mou_detail_id` bigint UNSIGNED DEFAULT NULL,
  `feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_mous`
--

CREATE TABLE `kategori_mous` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leveling_mous`
--

CREATE TABLE `leveling_mous` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_menu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_users`
--

CREATE TABLE `menu_users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `menu_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
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
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2018_07_18_135349_create_roles_table', 1),
(3, '2018_07_18_135807_create_prodis_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_07_12_000000_create_users_table', 1),
(7, '2023_07_18_140141_create_detail_users_table', 1),
(8, '2023_07_18_140648_create_kategori_mous_table', 1),
(9, '2023_07_18_140926_create_leveling_mous_table', 1),
(10, '2023_07_18_141142_create_mous_table', 1),
(11, '2023_07_19_020317_create_mou_details_table', 1),
(12, '2023_07_19_020709_create_feedback_mous_table', 1),
(13, '2023_07_19_021159_create_download_logs_table', 1),
(14, '2023_08_10_130423_create_menus_table', 1),
(15, '2023_08_10_131150_create_menu_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mous`
--

CREATE TABLE `mous` (
  `id` bigint UNSIGNED NOT NULL,
  `kategori_mou_id` bigint UNSIGNED DEFAULT NULL,
  `leveling_mou_id` bigint UNSIGNED DEFAULT NULL,
  `judul_mou` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mou_details`
--

CREATE TABLE `mou_details` (
  `id` bigint UNSIGNED NOT NULL,
  `mou_id` bigint UNSIGNED DEFAULT NULL,
  `foto_kegiatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan_kegiatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prodis`
--

CREATE TABLE `prodis` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_prodi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prodis`
--

INSERT INTO `prodis` (`id`, `nama_prodi`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrasi Server Dan Jaringan Komputer', NULL, NULL, NULL, NULL),
(2, 'Penyutingan Audio Video', NULL, NULL, NULL, NULL),
(3, 'Pengolahan Hasil Ternak Unggas', NULL, NULL, NULL, NULL),
(4, 'Administrasi Perkantoran', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `nama_role`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', NULL, NULL, NULL, NULL),
(2, 'Dosen', NULL, NULL, NULL, NULL),
(3, 'Staff / Karyawan', NULL, NULL, NULL, NULL),
(4, 'Kaprodi', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `prodi_id` bigint UNSIGNED DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `password_lama` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `prodi_id`, `nama`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `password_lama`) VALUES
(1, 1, NULL, 'Agung Aldi', 'admin', '$2y$10$gwlKPgVVRrVVf7UwRkaZuesbzpK6In7gRFAedgtsha13lwP9/io2C', NULL, NULL, '2023-09-04 02:54:22', NULL, 'admin'),
(2, 2, 1, 'dosenasjk', 'dosenasjk', '$2y$10$yeMyzDzIvHgFBSxCyDd7HuvVTXkT/6i1pvcVBi0kMlrwwF2QOtxnu', NULL, NULL, NULL, NULL, 'dosenasjk'),
(3, 3, 1, 'userasjk', 'userasjk', '$2y$10$I/MDCLiXWeLptfsUlYR0zeHg.Ra6vXbZm0uywHhAJnb8zlNUSBkV2', NULL, NULL, NULL, NULL, 'userasjk'),
(4, 4, 1, 'kaprodiasjk', 'kaprodiasjk', '$2y$10$OPvf9zWSRtK.SWineQ4MtuBWD7poAIo.SJ9ntkzQ2571ubuEMPdM.', NULL, NULL, NULL, NULL, 'kaprodiasjk');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_users`
--
ALTER TABLE `detail_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_users_users_id_foreign` (`users_id`);

--
-- Indexes for table `download_logs`
--
ALTER TABLE `download_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback_mous`
--
ALTER TABLE `feedback_mous`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_mous_mou_id_foreign` (`mou_id`),
  ADD KEY `feedback_mous_user_id_foreign` (`user_id`),
  ADD KEY `feedback_mous_mou_detail_id_foreign` (`mou_detail_id`);

--
-- Indexes for table `kategori_mous`
--
ALTER TABLE `kategori_mous`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leveling_mous`
--
ALTER TABLE `leveling_mous`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_users`
--
ALTER TABLE `menu_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_users_user_id_foreign` (`user_id`),
  ADD KEY `menu_users_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mous`
--
ALTER TABLE `mous`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mous_kategori_mou_id_foreign` (`kategori_mou_id`),
  ADD KEY `mous_leveling_mou_id_foreign` (`leveling_mou_id`);

--
-- Indexes for table `mou_details`
--
ALTER TABLE `mou_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mou_details_mou_id_foreign` (`mou_id`);

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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prodis`
--
ALTER TABLE `prodis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_prodi_id_foreign` (`prodi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_users`
--
ALTER TABLE `detail_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `download_logs`
--
ALTER TABLE `download_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback_mous`
--
ALTER TABLE `feedback_mous`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_mous`
--
ALTER TABLE `kategori_mous`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leveling_mous`
--
ALTER TABLE `leveling_mous`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_users`
--
ALTER TABLE `menu_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mous`
--
ALTER TABLE `mous`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mou_details`
--
ALTER TABLE `mou_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodis`
--
ALTER TABLE `prodis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_users`
--
ALTER TABLE `detail_users`
  ADD CONSTRAINT `detail_users_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feedback_mous`
--
ALTER TABLE `feedback_mous`
  ADD CONSTRAINT `feedback_mous_mou_detail_id_foreign` FOREIGN KEY (`mou_detail_id`) REFERENCES `mou_details` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_mous_mou_id_foreign` FOREIGN KEY (`mou_id`) REFERENCES `mous` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_mous_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_users`
--
ALTER TABLE `menu_users`
  ADD CONSTRAINT `menu_users_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `menu_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `mous`
--
ALTER TABLE `mous`
  ADD CONSTRAINT `mous_kategori_mou_id_foreign` FOREIGN KEY (`kategori_mou_id`) REFERENCES `kategori_mous` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mous_leveling_mou_id_foreign` FOREIGN KEY (`leveling_mou_id`) REFERENCES `leveling_mous` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mou_details`
--
ALTER TABLE `mou_details`
  ADD CONSTRAINT `mou_details_mou_id_foreign` FOREIGN KEY (`mou_id`) REFERENCES `mous` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
