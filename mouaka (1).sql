-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 01, 2024 at 03:45 PM
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
  `nama_lengkap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_kelamin` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_users`
--

INSERT INTO `detail_users` (`id`, `users_id`, `nama_lengkap`, `jenis_kelamin`, `no_hp`, `alamat`, `foto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'AGUNG ALDI PRASETYA', 'L', '085807290527', 'Jalan Palem Desa Bangsri 2, RT.2/RW.4, Bangsri, Nglegok ( pak eko krupuk ) , KAB. BLITAR, NGLEGOK, JAWA TIMUR, ID, 66181', 'aku.jpeg', '2023-08-31 06:20:41', '2023-10-19 02:36:56', NULL),
(2, 2, 'fuqyfot', 'L', '+1 (942) 336-5667', 'Tempor sed mollitia', NULL, '2023-09-10 06:35:58', '2023-09-10 06:35:58', NULL),
(3, 19, 'AGUNG ALDI PRASETYA', 'L', '085807290527', 'BLITAR', NULL, '2024-01-24 03:48:03', '2024-01-24 03:48:03', NULL),
(4, 19, 'AGUNG ALDI PRASETYA', 'L', '085807290527', 'BLITAR', NULL, '2024-01-24 03:48:03', '2024-01-24 03:48:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_moa`
--

CREATE TABLE `dokumen_moa` (
  `id` int NOT NULL,
  `nomor_mou` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nomor_moa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tanggal_dibuat` date DEFAULT NULL,
  `tanggal_berakhir` date DEFAULT NULL,
  `file_moa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `level_moa` int DEFAULT NULL,
  `jenis_doc` int NOT NULL,
  `kategori_moa` int DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `relevansi_prodi` int DEFAULT NULL,
  `kerja_sama_dengan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dokumen_moa`
--

INSERT INTO `dokumen_moa` (`id`, `nomor_mou`, `nomor_moa`, `tanggal_dibuat`, `tanggal_berakhir`, `file_moa`, `file_path`, `level_moa`, `jenis_doc`, `kategori_moa`, `status`, `relevansi_prodi`, `kerja_sama_dengan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, '61876187', '0112345', '2024-01-28', '2024-02-01', 'j253rayupnzoqv6mx4hfw1s9i7t8dkelgcb.pdf', '/file/2024/01/', 7, 6, 10, 'AKTIF', 4, 'test', '2024-01-28 15:53:45', '2024-01-30 12:09:39', NULL),
(8, NULL, '1', '2024-01-30', '2024-01-31', '9u4vwfrq8mhxg1j3yc2s5pnla6tkei7zbdo.pdf', '/file/2024/01/', 4, 6, 4, 'TIDAK AKTIF', 1, '1', '2024-01-30 01:54:34', '2024-01-30 12:52:33', NULL),
(10, '61876187', '33333', '2024-01-30', '2024-01-31', '1r7zxkmqfna6bseojv34thpgi2yl5d9u8wc.pdf', '/file/2024/01/', 7, 6, 6, 'AKTIF', 1, 'AKN PACITAN', '2024-01-30 12:14:54', '2024-01-30 12:14:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_mou`
--

CREATE TABLE `dokumen_mou` (
  `id` int NOT NULL,
  `nomor_mou` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tanggal_dibuat` date DEFAULT NULL,
  `tanggal_berakhir` date DEFAULT NULL,
  `file_mou` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `level_mou` int DEFAULT NULL,
  `jenis_doc` int NOT NULL,
  `kategori_mou` int DEFAULT NULL,
  `relevansi_prodi` int DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `kerja_sama_dengan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dokumen_mou`
--

INSERT INTO `dokumen_mou` (`id`, `nomor_mou`, `tanggal_dibuat`, `tanggal_berakhir`, `file_mou`, `file_path`, `level_mou`, `jenis_doc`, `kategori_mou`, `relevansi_prodi`, `status`, `kerja_sama_dengan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, '61876187', '2024-01-25', '2024-01-25', 'azxsb1qgi5eyrjvt7kw8o4h2c6n39duflmp.jpg', '/file/2024/02/', 4, 5, 9, 4, 'AKTIF', 'dsdsdsdsd', '2024-01-25 12:48:34', '2024-02-01 04:14:42', NULL),
(7, '12345678910', '2024-01-01', '2024-01-31', 'hufd7q6tjp5si839lmgxck4b1azry2wveno.pdf', '/file/2024/01/', 4, 5, 5, 1, 'AKTIF', 'UNISBA BLITAR', '2024-01-30 13:55:34', '2024-01-30 13:55:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_doc`
--

CREATE TABLE `jenis_doc` (
  `id` int NOT NULL,
  `nama_jenis` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jenis_doc`
--

INSERT INTO `jenis_doc` (`id`, `nama_jenis`, `keterangan`, `created_at`, `updated_at`) VALUES
(5, 'Momerandum Of Understanding (MOU)', '<p><br></p>', '2024-01-24 04:32:27', '2024-01-24 04:32:27'),
(6, 'Memorandum of Agreement ( MOA)', '<p><br></p>', '2024-01-24 04:32:51', '2024-01-24 04:32:51');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_doc`
--

CREATE TABLE `kategori_doc` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_doc`
--

INSERT INTO `kategori_doc` (`id`, `nama_kategori`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'Pemerintah', '<p><br></p>', '2024-01-24 04:08:39', '2024-01-24 04:08:39', NULL),
(5, 'Perguruan Tinggi (PT)', '<p><br></p>', '2024-01-24 04:09:01', '2024-01-24 04:09:01', NULL),
(6, 'Sekolah', '<p><br></p>', '2024-01-24 04:09:14', '2024-01-24 04:09:14', NULL),
(7, 'Dunia Usaha', '<p><br></p>', '2024-01-24 04:09:20', '2024-01-24 04:09:20', NULL),
(8, 'Industri UMKM', '<p><br></p>', '2024-01-24 04:09:38', '2024-01-24 04:09:38', NULL),
(9, 'Lembaga Pelatihan', '<p><br></p>', '2024-01-24 04:09:48', '2024-01-24 04:09:48', NULL),
(10, 'Sertifikasi', '<p><br></p>', '2024-01-24 04:09:56', '2024-01-24 04:09:56', NULL),
(11, 'Keuangan', '<p><br></p>', '2024-01-24 04:10:02', '2024-01-24 04:10:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` int NOT NULL,
  `nomor_mou` varchar(100) DEFAULT NULL,
  `nomor_moa` varchar(100) DEFAULT NULL,
  `kegiatan` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `nomor_mou`, `nomor_moa`, `kegiatan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, '12345678910', '33333', '<p>tester</p>', '2024-02-01 15:14:33', '2024-02-01 15:22:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lampiran_kegiatan`
--

CREATE TABLE `lampiran_kegiatan` (
  `id` int NOT NULL,
  `kegiatan_id` int DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lampiran_kegiatan`
--

INSERT INTO `lampiran_kegiatan` (`id`, `kegiatan_id`, `file`, `file_path`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 9, 'wh8s6cu4v2fmdgo9aptirenj3xzblq7k15y.pdf', '/lampiran/2024/02/', NULL, '2024-02-01 15:14:33', '2024-02-01 15:14:33', NULL),
(6, 9, 'sxzo2qfgt9rjbip7cmaew6n5uy81v43hkdl.pdf', '/lampiran/2024/02/', 'asasasas', '2024-02-01 15:14:33', '2024-02-01 15:14:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leveling_doc`
--

CREATE TABLE `leveling_doc` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leveling_doc`
--

INSERT INTO `leveling_doc` (`id`, `nama_level`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'Lokal / Regional', '<p><br></p>', '2024-01-24 05:35:19', '2024-01-24 05:35:19', NULL),
(6, 'Nasional', '<p><br></p>', '2024-01-24 05:38:01', '2024-01-24 05:38:01', NULL),
(7, 'Internasional', '<p><br></p>', '2024-01-24 05:40:08', '2024-01-25 06:02:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log_user`
--

CREATE TABLE `log_user` (
  `id` int NOT NULL,
  `id_users` int DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `nama_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `action` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `log_user`
--

INSERT INTO `log_user` (`id`, `id_users`, `content`, `nama_username`, `ip`, `action`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-01-25 05:14:45', NULL, NULL),
(16, 19, '{\"data\":{\"id\":null,\"nama_level\":\"coba\",\"keterangan\":\"<p><br><\\/p>\"},\"user_id\":\"19\"}', 'admin', '::1', 'TAMBAH LEVELING', '2024-01-25 05:56:14', NULL, NULL),
(17, 19, '{\"id\":\"35\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE LEVELING', '2024-01-25 05:56:54', NULL, NULL),
(18, 19, '{\"data\":{\"id\":\"7\",\"nama_level\":\"Internasional 2\",\"keterangan\":\"<p><br><\\/p>\"},\"user_id\":\"19\"}', 'admin', '::1', 'UPDATE LEVELING', '2024-01-25 05:59:53', NULL, NULL),
(19, 19, '{\"data\":{\"id\":\"7\",\"nama_level\":\"Internasional\",\"keterangan\":\"<p><br><\\/p>\"},\"user_id\":\"19\"}', 'admin', '::1', 'UPDATE LEVELING', '2024-01-25 06:02:53', NULL, NULL),
(20, 19, '{\"data\":{\"id\":null,\"nama_jenis\":\"test moa\",\"keterangan\":\"<p><br><\\/p>\"},\"user_id\":\"19\"}', 'admin', '::1', 'TAMBAH JENIS MOU / DOKUMEN', '2024-01-25 06:03:14', NULL, NULL),
(21, 19, '{\"data\":{\"id\":\"7\",\"nama_jenis\":\"test moa 2\",\"keterangan\":\"<p><br><\\/p>\"},\"user_id\":\"19\"}', 'admin', '::1', 'UPDATE JENIS MOU / DOKUMEN', '2024-01-25 06:03:41', NULL, NULL),
(22, 19, '{\"id\":\"7\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE JENIS MOU / DOKUMEN', '2024-01-25 06:03:55', NULL, NULL),
(23, 19, '{\"data\":{\"id\":null,\"nama_jenis\":\"6\",\"nama_template\":\"Template MOA dari AKN PSF\",\"keterangan\":\"<p>Template MoA AKB untuk pemerintahan<\\/p>\",\"dokumen\":\"MoA AKB.docx\",\"dokumen_path\":\"berkas\\/9c73iFxr0cgLLvU0r1aBE3mWm8HEieF83RFFj8Ql.docx\"},\"user_id\":\"19\"}', 'admin', '::1', 'TAMBAH MASTER TEMPLATE DOKUMEN', '2024-01-25 06:12:18', NULL, NULL),
(24, 19, '{\"data\":{\"id\":\"4\",\"nama_jenis\":\"6\",\"nama_template\":\"Template MOA dari AKNPSF\",\"keterangan\":\"<p>Template MoA AKB untuk pemerintahan<\\/p>\",\"dokumen\":\"MoA AKB.docx\",\"dokumen_path\":\"berkas\\/9c73iFxr0cgLLvU0r1aBE3mWm8HEieF83RFFj8Ql.docx\"},\"user_id\":\"19\"}', 'admin', '::1', 'UPDATE MASTER TEMPLATE DOKUMEN', '2024-01-25 06:13:12', NULL, NULL),
(25, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-01-25 10:28:20', NULL, NULL),
(26, 19, '{\"data\":{\"id\":null,\"nama_kategori\":\"Coba\",\"keterangan\":\"<p><br><\\/p>\"},\"user_id\":\"19\"}', 'admin', '::1', 'TAMBAH KATEGORI DOKUMEN', '2024-01-25 10:32:29', NULL, NULL),
(27, 19, '{\"data\":{\"id\":\"12\",\"nama_kategori\":\"Coba 2\",\"keterangan\":\"<p><br><\\/p>\"},\"user_id\":\"19\"}', 'admin', '::1', 'UPDATE KATEGORI DOKUMEN', '2024-01-25 10:32:48', NULL, NULL),
(28, 19, '{\"id\":\"12\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE KATEGORI DOKUMEN', '2024-01-25 10:34:42', NULL, NULL),
(29, 19, '{\"data\":{\"id\":null,\"nomor_mou\":\"61876187\",\"tanggal_dibuat\":\"2024-01-25\",\"tanggal_berakhir\":\"2024-01-27\",\"jenis\":\"6\",\"kategori\":\"7\",\"level\":\"4\",\"kerja_sama_dengan\":\"adadsad\",\"dokumen\":\"MoA AKB.pdf\",\"dokumen_path\":\"berkas\\/O6bKBoC7h9gGJfAq6hsnvH0OcOuG5B8nus4WPnTf.pdf\"},\"user_id\":\"19\"}', 'admin', '::1', 'TAMBAH MASTER DOCUMENT', '2024-01-25 12:36:41', NULL, NULL),
(30, 19, '{\"data\":{\"id\":null,\"nama_jenis\":\"5\",\"nama_template\":\"Template MOU dari AKN PSF\",\"keterangan\":\"<p>Template MOU <\\/p>\",\"dokumen\":\"MoU AKB.docx\",\"dokumen_path\":\"berkas\\/ZIMpF0cu16RPwqLnaE3VgOUugYeLxQPI9w14Zz6O.docx\"},\"user_id\":\"19\"}', 'admin', '::1', 'TAMBAH MASTER TEMPLATE DOKUMEN', '2024-01-25 12:47:47', NULL, NULL),
(31, 19, '{\"data\":{\"id\":null,\"nomor_mou\":\"61876187\",\"tanggal_dibuat\":\"2024-01-25\",\"tanggal_berakhir\":\"2024-02-10\",\"jenis\":\"5\",\"kategori\":\"9\",\"level\":\"4\",\"kerja_sama_dengan\":\"dsdsdsdsd\",\"dokumen\":\"MoU AKB.pdf\",\"dokumen_path\":\"file\\/2M51LiEiboxqXYBwuZDYh1EUQ4p33AO77jTD00ah.pdf\"},\"user_id\":\"19\"}', 'admin', '::1', 'TAMBAH MASTER DOCUMENT', '2024-01-25 12:48:34', NULL, NULL),
(32, 19, '{\"data\":{\"id\":null,\"nomor_mou\":\"1-20394857\",\"tanggal_dibuat\":\"2024-01-24\",\"tanggal_berakhir\":\"2024-02-07\",\"jenis\":\"6\",\"kategori\":\"8\",\"level\":\"6\",\"kerja_sama_dengan\":\"cvcvcvcvc\",\"dokumen\":\"MoA AKB.pdf\",\"dokumen_path\":\"file\\/cisoL3WM2nZcr6MiWiJNqL97OhnJzZji9xfCVJpP.pdf\"},\"user_id\":\"19\"}', 'admin', '::1', 'TAMBAH MASTER DOCUMENT', '2024-01-25 12:50:33', NULL, NULL),
(33, 19, '{\"data\":{\"id\":\"4\",\"nomor_mou\":\"1-2039485712\",\"tanggal_dibuat\":\"2024-01-24\",\"tanggal_berakhir\":\"2024-01-24\",\"jenis\":\"6\",\"kategori\":\"8\",\"level\":\"6\",\"kerja_sama_dengan\":\"cvcvcvcvc\",\"dokumen\":\"MoA AKB.pdf\",\"dokumen_path\":\"file\\/cisoL3WM2nZcr6MiWiJNqL97OhnJzZji9xfCVJpP.pdf\"},\"user_id\":\"19\"}', 'admin', '::1', 'UPDATE MASTER DOCUMENT', '2024-01-25 13:06:34', NULL, NULL),
(34, 19, '{\"id\":\"4\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE MASTER DOCUMENT', '2024-01-25 13:10:05', NULL, NULL),
(35, 19, '{\"id\":\"5\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE MASTER TEMPLATE DOKUMEN', '2024-01-25 13:11:09', NULL, NULL),
(36, 19, '{\"data\":{\"id\":null,\"nama_jenis\":\"5\",\"nama_template\":\"Template MOU dari AKN PSF\",\"keterangan\":\"<p>Template MOU AKN<\\/p>\",\"dokumen\":\"MoU AKB.docx\",\"dokumen_path\":\"berkas\\/MVlPlRsmmgIJBmCLdtbzTI2p7FmRbHO1s4RD7Mda.docx\"},\"user_id\":\"19\"}', 'admin', '::1', 'TAMBAH MASTER TEMPLATE DOKUMEN', '2024-01-25 13:16:57', NULL, NULL),
(37, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-01-26 02:18:56', NULL, NULL),
(38, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-01-26 02:48:05', NULL, NULL),
(39, 19, '{\"ip_address\":\"192.168.1.6\",\"browser\":\"Safari Browser\",\"os\":\"Android\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '192.168.1.6', 'LOGIN', '2024-01-26 02:53:28', NULL, NULL),
(40, 19, '{\"data\":{\"id\":\"3\",\"nomor_mou\":\"61876187\",\"tanggal_dibuat\":\"2024-01-25\",\"tanggal_berakhir\":\"2024-01-25\",\"jenis\":\"5\",\"kategori\":\"9\",\"level\":\"4\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"dsdsdsdsd\",\"dokumen\":\"MoU AKB.pdf\",\"dokumen_path\":\"file\\/2M51LiEiboxqXYBwuZDYh1EUQ4p33AO77jTD00ah.pdf\"},\"user_id\":\"19\"}', 'admin', '::1', 'UPDATE MASTER DOCUMENT', '2024-01-26 03:10:33', NULL, NULL),
(41, 19, '{\"data\":{\"id\":\"3\",\"nomor_mou\":\"61876187\",\"tanggal_dibuat\":\"2024-01-25\",\"tanggal_berakhir\":\"2024-01-25\",\"jenis\":\"5\",\"kategori\":\"9\",\"level\":\"4\",\"status\":\"TIDAK AKTIF\",\"kerja_sama_dengan\":\"dsdsdsdsd\",\"dokumen\":\"MoU AKB.pdf\",\"dokumen_path\":\"file\\/2M51LiEiboxqXYBwuZDYh1EUQ4p33AO77jTD00ah.pdf\"},\"user_id\":\"19\"}', 'admin', '::1', 'UPDATE MASTER DOCUMENT', '2024-01-26 03:44:54', NULL, NULL),
(42, 19, '{\"data\":{\"id\":\"3\",\"nomor_mou\":\"61876187\",\"tanggal_dibuat\":\"2024-01-25\",\"tanggal_berakhir\":\"2024-01-25\",\"jenis\":\"5\",\"kategori\":\"9\",\"level\":\"4\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"dsdsdsdsd\",\"dokumen\":\"MoU AKB.pdf\",\"dokumen_path\":\"file\\/2M51LiEiboxqXYBwuZDYh1EUQ4p33AO77jTD00ah.pdf\"},\"user_id\":\"19\"}', 'admin', '::1', 'UPDATE MASTER DOCUMENT', '2024-01-26 03:45:18', NULL, NULL),
(43, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-01-26 08:48:41', NULL, NULL),
(44, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-01-28 10:40:58', NULL, NULL),
(45, 19, '[{\"id\":null,\"nomor_mou\":\"61876187 - dsdsdsdsd\",\"nomor_moa\":\"1111\",\"tanggal_dibuat\":\"2024-01-28\",\"tanggal_berakhir\":\"2024-01-31\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"123456qrftui\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"4 - Pemerintah\",\"level_moa\":\"6 - Nasional\",\"relevansi_prodi\":\"1 - Administrasi Server Dan Jaringan Komputer\",\"file_moa\":\"nzvj54opcayk93fsbw1xt6ldu8mhqreg7i2.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"}]', 'admin', '::1', 'TAMBAH DOKUMEN MOA', '2024-01-28 15:48:29', NULL, NULL),
(46, 19, '[{\"id\":null,\"nomor_mou\":null,\"nomor_moa\":\"0000\",\"tanggal_dibuat\":\"2024-01-28\",\"tanggal_berakhir\":\"2024-01-31\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"voba yang tanpa nomor MOU\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"6 - Sekolah\",\"level_moa\":\"4 - Lokal \\/ Regional\",\"relevansi_prodi\":\"2 - Penyutingan Audio Video\",\"file_moa\":\"52rwp8gnjmus9yet61a3oxh7zbifkdc4lqv.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"}]', 'admin', '::1', 'TAMBAH DOKUMEN MOA', '2024-01-28 15:49:42', NULL, NULL),
(47, 19, '[{\"id\":null,\"nomor_mou\":\"61876187\",\"nomor_moa\":\"01\",\"tanggal_dibuat\":\"2024-01-28\",\"tanggal_berakhir\":\"2024-02-01\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"test\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"10 - Sertifikasi\",\"level_moa\":\"7 - Internasional\",\"relevansi_prodi\":\"4 - Administrasi Perkantoran\",\"file_moa\":\"laqud8e63ihsbprtm7knzxv914ojfwyc2g5.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"}]', 'admin', '::1', 'TAMBAH DOKUMEN MOA', '2024-01-28 15:53:46', NULL, NULL),
(48, 19, '[{\"id\":null,\"nomor_mou\":\"61876187 - dsdsdsdsd\",\"nomor_moa\":\"12\",\"tanggal_dibuat\":\"2024-01-28\",\"tanggal_berakhir\":\"2024-01-29\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"312\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"4 - Pemerintah\",\"level_moa\":\"7 - Internasional\",\"relevansi_prodi\":\"4 - Administrasi Perkantoran\",\"file_moa\":\"tp6f8veujq7o5w142xzhdinb3yrmg9sclka.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"}]', 'admin', '::1', 'TAMBAH DOKUMEN MOA', '2024-01-28 15:56:31', NULL, NULL),
(49, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGOUT', '2024-01-28 16:45:58', NULL, NULL),
(50, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-01-28 16:46:38', NULL, NULL),
(51, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-01-29 08:27:12', NULL, NULL),
(52, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-01-29 12:26:51', NULL, NULL),
(53, 19, '{\"id\":\"7\",\"nomor_mou\":\"61876187\",\"nomor_moa\":\"1223234\",\"tanggal_dibuat\":\"2024-01-28\",\"tanggal_berakhir\":\"2024-01-29\",\"status\":\"TIDAK AKTIF\",\"kerja_sama_dengan\":\"312\",\"jenis_doc\":\"6\",\"kategori_moa\":\"4\",\"level_moa\":\"7\",\"relevansi_prodi\":\"4\",\"file_moa\":\"\",\"file_path\":\"\"}', 'admin', '::1', 'UPDATE DOKUMEN MOA', '2024-01-29 15:18:03', NULL, NULL),
(54, 19, '{\"id\":\"7\",\"nomor_mou\":\"61876187\",\"nomor_moa\":\"12sdsdsd\",\"tanggal_dibuat\":\"2024-01-28\",\"tanggal_berakhir\":\"2024-01-29\",\"status\":\"TIDAK AKTIF\",\"kerja_sama_dengan\":\"312\",\"jenis_doc\":\"6\",\"kategori_moa\":\"4\",\"level_moa\":\"7\",\"relevansi_prodi\":\"4\",\"file_moa\":\"\",\"file_path\":\"\"}', 'admin', '::1', 'UPDATE DOKUMEN MOA', '2024-01-29 15:24:52', NULL, NULL),
(55, 19, '{\"id\":\"7\",\"nomor_mou\":\"61876187\",\"nomor_moa\":\"12sdsdsd\",\"tanggal_dibuat\":\"2024-01-28\",\"tanggal_berakhir\":\"2024-01-29\",\"status\":\"TIDAK AKTIF\",\"kerja_sama_dengan\":\"312\",\"jenis_doc\":\"6\",\"kategori_moa\":\"4\",\"level_moa\":\"7\",\"relevansi_prodi\":\"4\",\"file_moa\":\"ymhlsrk4f9qz8vdueco6apgin523jb17wtx.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"}', 'admin', '::1', 'UPDATE DOKUMEN MOA', '2024-01-29 15:25:16', NULL, NULL),
(56, 19, '{\"id\":\"7\",\"nomor_mou\":\"61876187\",\"nomor_moa\":\"12sdsdsd\",\"tanggal_dibuat\":\"2024-01-28\",\"tanggal_berakhir\":\"2024-01-29\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"312\",\"jenis_doc\":\"6\",\"kategori_moa\":\"4\",\"level_moa\":\"7\",\"relevansi_prodi\":\"4\",\"file_moa\":\"\",\"file_path\":\"\"}', 'admin', '::1', 'UPDATE DOKUMEN MOA', '2024-01-29 15:25:40', NULL, NULL),
(57, 19, '{\"id\":\"7\",\"nomor_mou\":\"61876187\",\"nomor_moa\":\"12sdsdsd\",\"tanggal_dibuat\":\"2024-01-28\",\"tanggal_berakhir\":\"2024-01-29\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"312\",\"jenis_doc\":\"6\",\"kategori_moa\":\"4\",\"level_moa\":\"7\",\"relevansi_prodi\":\"4\",\"file_moa\":\"8an1yzudk42w3tfvs7c6l5pbxhog9rijemq.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"}', 'admin', '::1', 'UPDATE DOKUMEN MOA', '2024-01-29 15:30:51', NULL, NULL),
(58, 19, '{\"id\":\"7\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE DOKUMEN MOA', '2024-01-29 15:37:44', NULL, NULL),
(59, 19, '{\"id\":\"4\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE DOKUMEN MOA', '2024-01-29 15:43:32', NULL, NULL),
(60, 19, '{\"id\":\"5\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE DOKUMEN MOA', '2024-01-29 15:45:04', NULL, NULL),
(61, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-01-30 01:52:46', NULL, NULL),
(62, 19, '[{\"id\":null,\"nomor_mou\":null,\"nomor_moa\":\"1\",\"tanggal_dibuat\":\"2024-01-30\",\"tanggal_berakhir\":\"2024-01-31\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"1\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"4 - Pemerintah\",\"level_moa\":\"4 - Lokal \\/ Regional\",\"relevansi_prodi\":\"1 - Administrasi Server Dan Jaringan Komputer\",\"file_moa\":\"9u4vwfrq8mhxg1j3yc2s5pnla6tkei7zbdo.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"}]', 'admin', '::1', 'TAMBAH DOKUMEN MOA', '2024-01-30 01:54:34', NULL, NULL),
(63, 19, '[{\"id\":null,\"nomor_mou\":\"61876187 - dsdsdsdsd\",\"nomor_moa\":\"2\",\"tanggal_dibuat\":\"2024-01-30\",\"tanggal_berakhir\":\"2024-01-31\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"2\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"5 - Perguruan Tinggi (PT)\",\"level_moa\":\"6 - Nasional\",\"relevansi_prodi\":\"2 - Penyutingan Audio Video\",\"file_moa\":\"k1bnaupxfrjvcqg3iwl6med79y582tso4hz.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"}]', 'admin', '::1', 'TAMBAH DOKUMEN MOA', '2024-01-30 04:06:01', NULL, NULL),
(64, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-01-30 11:55:01', NULL, NULL),
(65, 19, '[{\"id\":\"6\",\"nomor_mou\":\"61876187 - dsdsdsdsd\",\"nomor_moa\":\"0112345\",\"tanggal_dibuat\":\"2024-01-28\",\"tanggal_berakhir\":\"2024-02-01\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"test\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"10 - Sertifikasi\",\"level_moa\":\"7 - Internasional\",\"relevansi_prodi\":\"4 - Administrasi Perkantoran\",\"file_moa\":\"j253rayupnzoqv6mx4hfw1s9i7t8dkelgcb.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"},{\"id\":\"9\",\"nomor_mou\":\"61876187 - dsdsdsdsd\",\"nomor_moa\":\"2\",\"tanggal_dibuat\":\"2024-01-30\",\"tanggal_berakhir\":\"2024-01-31\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"2\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"5 - Perguruan Tinggi (PT)\",\"level_moa\":\"6 - Nasional\",\"relevansi_prodi\":\"2 - Penyutingan Audio Video\",\"file_moa\":\"j253rayupnzoqv6mx4hfw1s9i7t8dkelgcb.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"}]', 'admin', '::1', 'TAMBAH DOKUMEN MOA', '2024-01-30 12:09:39', NULL, NULL),
(66, 19, '[{\"id\":\"6\",\"nomor_mou\":\"61876187 - dsdsdsdsd\",\"nomor_moa\":\"0112345\",\"tanggal_dibuat\":\"2024-01-28\",\"tanggal_berakhir\":\"2024-02-01\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"test\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"10 - Sertifikasi\",\"level_moa\":\"7 - Internasional\",\"relevansi_prodi\":\"4 - Administrasi Perkantoran\",\"file_moa\":null,\"file_path\":null},{\"id\":\"9\",\"nomor_mou\":\"61876187 - dsdsdsdsd\",\"nomor_moa\":\"11111\",\"tanggal_dibuat\":\"2024-01-30\",\"tanggal_berakhir\":\"2024-01-31\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"2\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"5 - Perguruan Tinggi (PT)\",\"level_moa\":\"6 - Nasional\",\"relevansi_prodi\":\"2 - Penyutingan Audio Video\",\"file_moa\":\"gkcsfzp7vn4ltmiqxbea59w1yohj2u3rd86.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"}]', 'admin', '::1', 'TAMBAH DOKUMEN MOA', '2024-01-30 12:13:48', NULL, NULL),
(67, 19, '[{\"id\":\"6\",\"nomor_mou\":\"61876187 - dsdsdsdsd\",\"nomor_moa\":\"0112345\",\"tanggal_dibuat\":\"2024-01-28\",\"tanggal_berakhir\":\"2024-02-01\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"test\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"10 - Sertifikasi\",\"level_moa\":\"7 - Internasional\",\"relevansi_prodi\":\"4 - Administrasi Perkantoran\",\"file_moa\":null,\"file_path\":null},{\"id\":\"9\",\"nomor_mou\":\"61876187 - dsdsdsdsd\",\"nomor_moa\":\"11111\",\"tanggal_dibuat\":\"2024-01-30\",\"tanggal_berakhir\":\"2024-01-31\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"2\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"5 - Perguruan Tinggi (PT)\",\"level_moa\":\"6 - Nasional\",\"relevansi_prodi\":\"2 - Penyutingan Audio Video\",\"file_moa\":null,\"file_path\":null},{\"id\":null,\"nomor_mou\":\"61876187 - dsdsdsdsd\",\"nomor_moa\":\"33333\",\"tanggal_dibuat\":\"2024-01-30\",\"tanggal_berakhir\":\"2024-01-31\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"3333\",\"jenis_doc\":\"6 - Memorandum of Agreement ( MOA)\",\"kategori_moa\":\"6 - Sekolah\",\"level_moa\":\"7 - Internasional\",\"relevansi_prodi\":\"1 - Administrasi Server Dan Jaringan Komputer\",\"file_moa\":\"1r7zxkmqfna6bseojv34thpgi2yl5d9u8wc.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"}]', 'admin', '::1', 'TAMBAH DOKUMEN MOA', '2024-01-30 12:14:54', NULL, NULL),
(68, 19, '{\"id\":\"9\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE DOKUMEN MOA', '2024-01-30 12:16:34', NULL, NULL),
(69, 19, '{\"id\":\"8\",\"nomor_mou\":null,\"nomor_moa\":\"1\",\"tanggal_dibuat\":\"2024-01-30\",\"tanggal_berakhir\":\"2024-01-31\",\"status\":\"TIDAK AKTIF\",\"kerja_sama_dengan\":\"1\",\"jenis_doc\":\"6\",\"kategori_moa\":\"4\",\"level_moa\":\"4\",\"relevansi_prodi\":\"1\",\"file_moa\":\"\",\"file_path\":\"\"}', 'admin', '::1', 'UPDATE DOKUMEN MOA', '2024-01-30 12:52:34', NULL, NULL),
(70, 19, '{\"id\":null,\"nomor_mou\":\"12345678910\",\"tanggal_dibuat\":\"2024-01-01\",\"tanggal_berakhir\":\"2024-01-31\",\"status\":\"AKTIF\",\"kerja_sama_dengan\":\"UNISBA BLITAR\",\"jenis_doc\":\"5\",\"kategori_moa\":\"5\",\"level_moa\":\"4\",\"relevansi_prodi\":\"1\",\"file_mou\":\"hufd7q6tjp5si839lmgxck4b1azry2wveno.pdf\",\"file_path\":\"\\/file\\/2024\\/01\\/\"}', 'admin', '::1', 'TAMBAH MASTER DOCUMENT', '2024-01-30 13:55:34', NULL, NULL);
INSERT INTO `log_user` (`id`, `id_users`, `content`, `nama_username`, `ip`, `action`, `created_at`, `updated_at`, `deleted_at`) VALUES
(71, 19, '{\"data\":{\"id\":\"3\",\"nomor_mou\":\"61876187\",\"tanggal_dibuat\":\"2024-01-25\",\"tanggal_berakhir\":\"2024-01-25\",\"jenis\":\"5\",\"kategori\":\"9\",\"level\":\"4\",\"status\":\"AKTIF\",\"relevansi_prodi\":\"4\",\"kerja_sama_dengan\":\"dsdsdsdsd\",\"file\":\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQEAYABgAAD\\/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT\\/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT\\/wAARCAF2Aj4DASIAAhEBAxEB\\/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL\\/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6\\/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL\\/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6\\/9oADAMBAAIRAxEAPwD4SooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiitnw34XuvEk7LERFBH\\/AKyZhkD2A7ms6lSFGDnUdkjtwWCxGY4iOFwkHOctkv6+97IxqK9Ot\\/hbp8f+uuriU\\/7O1R\\/I1oQ\\/DzQ4x81s8v8Avyt\\/QivFlnWFjtd\\/L\\/Ox+m0PDHP6yvPkh6y\\/+RUjyGivY\\/8AhA9C\\/wCfAf8Af1\\/\\/AIquf8RfDWFLaS40tnEiDd9nc7g3sp65p0s5w1SSi7r1\\/wCHIx\\/hpnmCoSrxcKltWot3+ScVf0WvkeeUUUV7p+UBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAV7P+y7\\/AMK4\\/wCE2f8A4WT5P9l\\/L9n24+0eZh+nnf6L5WPv+d82fL8vndXjFFMTVz6y+D\\/h\\/wAL6vp\\/xZn8LXHgvS4Y7vRLbQ9W8VaQ2oW9sk0kiFZBc205SZ\\/lEjBBGHDFWWMKa43xR8LtG+JX7QXj7TfD2jeItM0zTJ2U6T4X8NPqd55qMsUzJarKiQw+aHbDSgIHRVB6DyXQ\\/iBqPh\\/wP4n8LW8Ns+n+IHtJLqWRWMqG3dnTyyGAGS5zkHtjFd7J+03q1\\/J4kGr+FPDWt2niSCwTVbO6S8jjuprQERXJaG5jcSnJL7WCMSTtzRpdPt\\/kvys\\/VtbasNdfO39fP8Ne9jX1r9mbTPBerfEGPxV4wudK07wlJp+ZLfQ3mu7tLyNpIlFu8sYilAC7kdwFO8byVG7P1H9nex8P+JvGK6v4u+z+EPDdrZ3kms22nGW6ulvI1e0jitWkQeawcFlaUKoVzuOBnn\\/G3x81\\/wAeJ4rS90\\/SbRPEZ037UljbtEkX2KIxQiFd5CAqfmGCP7u0cVah\\/aI1yTV9cuNS0XQ9a0zXNPstO1DRL6Gf7JOtpFHHbyZjlWVJFEYO5JF5ZuxxUq+t\\/wCtPzv8vIp7\\/wBeX4bkHgP4U6V8RvF2rWGg3fi7WdKs4Fmi\\/sfwmb7VJgSqkm0juDHGiscFmn\\/u4BJwOt1r9mbTPBerfEGPxV4wudK07wlJp+ZLfQ3mu7tLyNpIlFu8sYilAC7kdwFO8byVG7kvDvxw\\/wCEbtfFemQeCPDU\\/hnxG1q914fnfUDbRPbljE8cguxODlnJDSsDuPGAAGeNvj5r\\/jxPFaXun6TaJ4jOm\\/aksbdoki+xRGKEQrvIQFT8wwR\\/d2jih7af1t\\/wfLZ+SFu7nS6j+zrpvh3WfG8mseLbgeFvDMGnXH9paZpIuLy6W+VHtiLV54wg2t85aXCnCgsWFWdS\\/ZrsbX4va\\/4L07VfFXiWPRrWGeV9B8IPeX8jSKjfLarcbVjUSLuaSVCCcbSa7D4N\\/tGwQ2vjbUtS8Q6X4U8WakmkWlt9rfWLWxktbSBoT++0xjdCXAjJUsImyxIJCheU8Z\\/G\\/wAOeGvEfi3TfCmhaX4r8K+JYbCbWbfWJNRa2uNRgBeS4tpDcR3YjMryEec5Y7juHQCnaLS3X9b\\/AI\\/Oy7slXkm9np+l7f1tqM1r9mbTPBerfEGPxV4wudK07wlJp+ZLfQ3mu7tLyNpIlFu8sYilAC7kdwFO8byVG7zT4tfD9fhj47vvD8WprrFtFHBc298sJhM0M0KTRM0ZJ2NskXK5ODkZPWtvxt8fNf8AHieK0vdP0m0TxGdN+1JY27RJF9iiMUIhXeQgKn5hgj+7tHFct488cX\\/xE8RHWdSit4Lo2trabLVWVNkEEcCHDMTkrGpPPUnGBxUa9f60\\/wAy9L\\/1vp\\/wT1v9nnSLq6+F\\/wAStQ0iy8KTa9aXGlJbXXiyLS2ghjdrjzAraiPJVm2r0O4446V0viD4E6J8YviD4w1jwZBfP4e0S30+PU4fAmhvq3napNHicWNuska\\/ZxJHM27eqKANgKsgr5\\/0nxxf6N4L8QeGIYrdrDW5rWe4kkVjKjW5kKBCGAAPmNnIPQYxWn4D+KN34J0jWtFm0fS\\/Evh7WDC93pGsLP5LSxMTFMrwSxSo67nGVcAh2DAirdm2\\/S33JP5b6d7MjVbdf6+\\/z7XPcNJ\\/Ybnl8Uatomr+MP7Gnh1Kx03T\\/M0eQvcteWstzAZY2dWtyFiIkVtxQhgN5ADLL8CfB3gn4e+OBrPiZbjSpLPQNYsdfXQg9+sVyLkmGGAy4VmKgHdMilVBJBAWvNfBv7SGr\\/D26ZvDfhvw\\/pNn\\/bNrrkdgi3csUU8EE0KqpkuGkKMJ3YhnJ3YwQBipV\\/aW1O80iXSda8J+G\\/EOly6bp2mNaXwvY12WQk8h90FzG2\\/96275tp4+UVMtU+Xuvusr\\/Pm+XyKjote34835cv8AVy\\/H+zaJPiJeaBbX\\/iHxDpg0q01mxuPDHheXUb+7tbmOOSOQ2olRYgBIA+6Xg8LvzVvWv2ZtM8F6t8QY\\/FXjC50rTvCUmn5kt9Dea7u0vI2kiUW7yxiKUALuR3AU7xvJUbsGD9pTXZ5vFia3oWheJdK8SCzW40m\\/juYra3S0yLVIPs88TosanaBvII+9uPNZvjb4+a\\/48TxWl7p+k2ieIzpv2pLG3aJIvsURihEK7yEBU\\/MMEf3do4ofl\\/Wv5pX8uvWyF1v5ffpf5PXzOl1H9nXTfDus+N5NY8W3A8LeGYNOuP7S0zSRcXl0t8qPbEWrzxhBtb5y0uFOFBYsKg+KP7Plh4Bbx6dP8TXOrJ4Tl0yCQ3WlC0a4e7R34UTybAgVevJLEELt59A+Df7RsENr421LUvEOl+FPFmpJpFpbfa31i1sZLW0gaE\\/vtMY3QlwIyVLCJssSCQoXj\\/Gnxo8N+GfGHie28KaHpXivwx4gt7KTWLXWjfyWtxqUXzyXNtI06XYQytIR50hZhI28cgBz0aSf9aP\\/ADXTW3qKLum7f1\\/w\\/wCBDN+ztomhr4su\\/EPjW40\\/S\\/D1ro9xJJZ6N9pnuTf23nLHHGZ0UMhwuWdQQCcggKYY\\/wBnEH4pa54Uhv8AX\\/EFrp9nb38E3hXwzLqV9cwTxxyxObUSIsYCypv3S\\/KSAu+uc8afHzxB46i8VR39jpNuviP+zfta2Ns0Kx\\/YojFCIlDbUBU\\/MMY\\/uhRxWpD+0nrEp8SQ6t4b8P6\\/pniC2023vdNvlu44T9giEVvIrQ3EcgbaDn59pLH5egDVrtv+v66fpuLbTy\\/HT\\/gm7rX7M2meC9W+IMfirxhc6Vp3hKTT8yW+hvNd3aXkbSRKLd5YxFKAF3I7gKd43kqN3mnxa+H6\\/DHx3feH4tTXWLaKOC5t75YTCZoZoUmiZoyTsbZIuVycHIyetbfjb4+a\\/wCPE8Vpe6fpNoniM6b9qSxt2iSL7FEYoRCu8hAVPzDBH93aOK5bx544v\\/iJ4iOs6lFbwXRtbW02WqsqbIII4EOGYnJWNSeepOMDio16\\/wBaf5l6X\\/rfT\\/gno\\/w21j\\/hEPgH4y8Q2elaHeaxH4h0uyjudY0Sz1IxwyQXrOiLcxSBdzRoSQAflHNeh+Jv2XYvH3iCbxNoWlaxpmgXHh\\/R9budH8J6HLq1zFdX0bExW1v5qfuQ0Ur7nkARSqjOVFeI+A\\/i0fBfhfVfDt34V0LxXpGo3tvqElvrRu12TQLKkbKbe4hOMTOCGJByOOK1\\/wDhozxHqWoeJJPEenaR4s0zX\\/s\\/2rRtShlitIzbjFsYRbSRPD5SEooRwNrEMGrSdpNteVvlFJr5vX1S7siOi+\\/7+a6f3afM663\\/AGR7+D4m+KvCd\\/ql+8mi6dDqkFppGjm51jUIZvLMYi0+SWJvMVJN0qF8x7W+\\/jNcd4N+DUXjDx54g0K2TxjcRaTuza6Z4Se81g4cIfMslnCQ7W4bdPwcAbicDAsPHmiWevahqEvw68M3trdBBDpc9xqgt7MqMExMl6spLdT5kj+2K6w\\/tMa9qGp+N7jXtC0LxNZ+L5bWbUNN1BLmOFWtsi38toJ45BsU7fmdtw5bceamPS\\/b9f8AL5N9r6N7O3dflr+Pz9Tt\\/hj8G9O+Hv7W1j4F169t7+8W6gh06PVvDAv7O6NzCGjF7ayXMLRFUlUsoZyrrjnGT5t4C+F+ieKfDnjLxJ4h8TTeHdL8Oz20UiWOlfbZrkztKqrEhljUEGMcM6jBPzZADa2m\\/tManZ\\/Fw\\/Ee58IeF9R8Rxm0azE0V3DbWLW8SxI0UUFzGvKouVfcvHAUcVyuqfFSW60XxPpGneHtH0DSvEE1pPcWtgbp1ie33lTG088jDcZGLbi3bG2lryrv\\/wAFf8H8Clb3vl+F7\\/mvxK3xa+H6\\/DHx3feH4tTXWLaKOC5t75YTCZoZoUmiZoyTsbZIuVycHIyetb2h6RYzfs4eL9Teyt31KDxNpUEV40SmaON7a+Lor4yFYohIBwSq56CuT8eeOL\\/4ieIjrOpRW8F0bW1tNlqrKmyCCOBDhmJyVjUnnqTjA4rT8B\\/FC58E6RrOi3GjaX4m8P6uYZLrSdY+0CEzREmKZWt5YpFdQzrw+CHYEHjFfZlHvb8Gn+SJvqpf1qrfmz6R8D2OlaT+0d8L\\/D8Xhvw5caNrnhDSZ9QtL7QbK6WaX+zWlMgMsTFHZ\\/mZlILH7xNfN\\/hjSdR+NnxS0vTpBY2V1q91HHPLY2MFlbW0QA8yXyoESNFSNWdiqjhWJ5zXU+H\\/ANpbWdF+KE3j658NeHta11UjisEvUuo7fTIUiMKRQRwXEY2CIhAJN5woOd2Scvw78TNF0C38c6jY6HHoevaxpw0rS7XS\\/NeysYZSFu33zzSTB2iUoPmYYnk5AAFF\\/flUavrJperbS\\/JOwre6op20Sv6JJv8AXU7Hx9ceGPFfw0+JXiDQNB0\\/TrG38WaTYaS8NpHHLFZLa3qAbgoOZBDG7\\/3n5OTzXrnhT4V+Hfil440j4Vt4d0\\/TYvEHgXRdXi8RWOmxCfS7yO0jkknkkG0mOYMyOCTud4z15r5c8B\\/FC58E6RrOi3GjaX4m8P6uYZLrSdY+0CEzREmKZWt5YpFdQzrw+CHYEHjG\\/r37R3irXdP8UW\\/k6bp03iF7SO4vLCB4poLO1AFvYwHeRHbqUjOAN7GNdztjl6Ws9dn90OX8\\/e+Xcbu9tNGv\\/Jk\\/y93\\/AIBk\\/HLWNP1X4maxBpHh+HwxpGlyf2VZ6bHbpFLHFATGGnIALzsVLO75YsxGcAV1\\/wCznceFW0\\/xXp17f+HdE8c3q2sfh\\/VfGNhHeaTGolP2iOQSxSxRO67NsskZVQrDcmc1wHxR+JWofFrxW\\/iPV7KwtdXnt4oryawjdPtkiIFNxIGZh5rgAsV2gkZ2gkk1\\/B\\/izS\\/DK3Q1HwXofiwzFSjaxNfxmDGchPstzDnORndu6DGOcxTvGNpPXv8Ar8\\/+HHOzd4rTt+ny2O48VfB\\/xBdWnj3Vde+zaZ4w8PXFjLe+H7GwtoYJLS5wi3MBtiItgdoBiNNpE6sG5rc0f9l+LU\\/H\\/iTwqPEN7f6h4c0yC51Cw0PSUvtRlvG2Ce1tLb7Qn2jyGdg771I8tjsrQ+GXx6Wz+I2vfFPxXrmn\\/bU06XTrfwfbWU5F6nkCK1gUbDCltERExLyl\\/wBwPldjk+P+H\\/G9tp+ralqOu+F9J8aXN85ldtamvU2SFizOptbiEksTzuJHoBT0TS6W+7ol+r13drpC3V\\/P\\/Jvt6Ly13PVPgv8ACz4e654v+IGkeKbvxKraLo2p3Ftb3GhrBPEYISTNLGL1Sk0bA4gJZWIwzrWX8Ov2fbX4qS+JtS8NXfizWfC+hi2R5NN8Ki71aeabdtVLKK6ZAi+XIWdpwAAvGWC1hRftBeJf+Fsat4+urfTdQ1DVoJrO+0+5hc2c9rJD5DW7Krh9gj2qCH3\\/ACgli2SY9J+NP9i\\/29YweC\\/Dj+FtaFu114Yla\\/ezE0JJjnSQ3X2hJBufpNgh2BBGADs32S+d3dv5PTz30Do153+Wmn4P5eZ65pP7Dc8vijVtE1fxh\\/Y08OpWOm6f5mjyF7lry1luYDLGzq1uQsREituKEMBvIAbxj4zfDG2+FniLS7Kx1ptf0\\/U9JtdXtb17Q2rmOZSQGj3vtIIP8RyMHjoN7wb+0hq\\/w9umbw34b8P6TZ\\/2za65HYIt3LFFPBBNCqqZLhpCjCd2IZyd2MEAYri\\/HvxC1H4iXGizalDawNpOlW2jwC1RlDQwqQjNuY5cg8kYHsKUr9O6+7l1+fMONre92\\/Hm\\/wDkTmK9R+GF1DJocturATRylnXvggYP6Y\\/CvLqms7640+cTW0zwSjgMhwa4cdhfrdF007M+t4Wz1cO5lHGyhzxs011s+3mvx203PfKK8SufFWr3fEmoz46YR9g\\/TFZ0txLOcyyPIf8AaYmvnI5DUfx1Evlf\\/I\\/Z8R4tYWL\\/ANnwkpf4pKP5KR76GDdCDS15x8KZ9t5fw5+9Gr\\/kSP8A2avR68PGYf6rWdK97H6rw5nS4gy2nmChyc11a97WbW9l67HiPii0Wx8Q38KjaolLAegPIH61l10\\/xHh8rxRK3\\/PSNH\\/TH9K5iv0TCT9ph6cn1SP404gw6wmb4uhFWUakrenM7fgFFFFdR4AUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFbXhPxffeC9SkvtPg0u4meIwldW0m11KLaSDkR3MUiBuB8wGQMjOCcsDFr0z4U+D\\/C2r+D\\/HfiTxTa6xqFv4dtrSWGz0fUIrJ5WmuVhO6SS3mGAGzgL261wGtavPr2q3WoXMdrFPcOZHSytIrWEE\\/3IolVEHsqge1d\\/wDCn4xXnwr8H+O7XR9S1jRfEGt21pBY6jo87QPD5dyskm6RXVlDICvy5znB4pLzFLyL\\/wAHfhv4e+MHxgtdLs9M1a38LyOA2lr4h01dXkyhCpBJdC3imcyYO1UyFPQnk8d4S+GmvePLrVU0W2txbaaoku7vUr+3sba3VnCIJJ55EiVmYgBd2WOcA4Ndt8Evijo+h\\/GjTPiH8Rdf8TalqOmX8F+HtrRNRuL9k4KyzT3MRTAVQG+f6DHPrH7Pfh\\/w9rPg34rwaVpWt\\/EPw9dXWlD+zR4ekudQLBp3802FpqEbKit8vnC5wM7Sh3nbSjtft+q\\/r\\/hw5vi+Vvxv+n9I8mT9kn4qTaxqelQeG4Lq\\/wBNkihu4rXV7Kby5ZEZ44spMQZGVTiMEsTgAZIBw734A+N9L8STaHf6bZabeQ2kV9JPfavZW9msMv8Aq2N08wgy3IC78khhjIIH0jrXxm0v4H\\/E67h8UXV9r2o3PiLSPFEy6fpsVpJYwpYXERsZbczt5M8Xnxp5e98BDufdxXC2vx++HWpRodT0q8t9Vt\\/DOkaLZaxc+G7DXBayWxf7SFtLqYRFZAUAkJ3rtPA3Go31T6pf+S3f3S0\\/LWw7NL3t7f8At1l\\/5LqfPvi7wjrHgPxHfaDr1i+narZPsmt3KtjIBDKykqysCGVlJVgQQSCDU\\/geXwxHr0Q8XWerXmjyDY\\/9i3cVvcREsP3g8yKRXAG7938m44+da6b9oL4iaV8VPipqXiTRLW6s9MuLezhigvIoYpF8m1ihbKw4jAzGcBAoxjCr0Ff4I+PLX4b+ODrdzqmvaMU0+8ghvfDfki8jllgeNNplBCrlvmZcOoyUIYA1UGt5r\\/g+XzCW6S8v6+RV+Mnw2l+EHxO8Q+D5r5NTbSrjylvEjMfnIVV0YoSdjFWGVydpyMnGa4yp76+udUvri8vLiW7vLiRppridy8krsSWZmPJYkkknkk1BURuopS3G7X0CiiiqEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAHYfC5tviCcf3rZv\\/Qlr1KvKfhn\\/wAjIf8Arg38xXq1fBZ1\\/vXyR\\/XHhlLmyBLtOX6Hl3xSXGv259bZf\\/Qmrjq7T4qf8hi0\\/wCvf\\/2Y1xdfV5b\\/ALpT9D+fONI8vEOMS\\/m\\/RBRRRXpHxQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRW14Tu\\/DlnqUj+J9K1TV7AxEJBpOpx2EokyMMZJLecFcbht2A5IORjBYGLXXeFfhdrfjTwprOu6UsVzHpl9Y6e1ku83M8120iwrEoUhuYmByQeVxntz2tTadPqt1JpNrdWWms5MFve3K3M0a9g8ixxhz7hF+lfQn7L3xa0P4U\\/DT4iXGrNFJNeX+kwxww3CxajHEyXkc11ZAsP38KyhlYgqrFc4yCHHWLb8v8A0pL8nv03E\\/I8P8feC5fh74ou9AudT07VL2zwly+lytLFDNj54S5VQzIcqxTcuQcMw5o0nwPf6z4L8QeJ4ZbdbDRJrWC4jkZhK7XBkCFAFIIHltnJHUYzX0d8IbHw78LJPiNo9j4uttR8S3H2CfQtd8P+LrPQJbnTyztKsd\\/Oki20p3QGS3cpIQhXJAIbYX4ialq1x8YJvCd74f8AAfjC\\/fRPLZvGGlF53SOYXNzDfhooTM+4M7wFWDSOOCWrPVLu\\/wDhuj6LZ9U+9itNe39fnv2fzR8cVs+F\\/B2seNLi\\/g0a0+2S2NjPqVwvmomy3hTfK\\/zEZwozgZJ7A19O+NNa0b4pw\\/FDQ9M8UaFL4kvLbw61zqGpalb6fbateWsbRX08U8zJGx8x92d2ZAGdd2a1tF+Lr+G\\/2hPFekaF8SIrDSNV8Hx6fZ6jY601tpkmpJo8McMhlLKsbCRCokfaUbg7TnFdJd0nbzsunq9F320ey+0l00v5Xav919e1rnxnXQ6T4Hv9Z8F+IPE8Mtuthok1rBcRyMwldrgyBCgCkEDy2zkjqMZr2vSYde8X+E\\/il4Z8U+NtH1HxtqEmj3cN3rXi20njuooXlDhb5p2hZkWVDs83dgEAZUiuw8dfFiHwTB8Vp\\/CHjPTxq0tr4VtbHUtIu0MsoisTHO9q5AkUqflLKFddxB25IpX0b9Lfh\\/w339h9bL+v63PkOivsm11vSNc+KfxA8V6f44FjrsmlaK8SaH4p0\\/w7calPLbQm9ddSnVlQpIGMkaYaRm5+6RUXxQ+LVn4R1T42an4H8XWNpqupS+HXtNR0i\\/ia4uH+zP8Aa5YZkVGMm9m8yVFRsu24LuK05e7v\\/Wq\\/z3+W6Yo+9t5fp+Oux8d13fgb4Uf8Jj4V1fxJeeKtD8K6Ppt5b2ElxrC3jmSaZJXRUW2t5j92F8kgAYHrWt+0trtn4n+Lt\\/q9le2uoi9sNOnuLqzdHSW5axgNwxKcFzL5m7vu3Z5zWx8M9FHjH4C+MPDlpq+hWOry+ItKvI4Na1u003fCkF6kjqbmVAwUypkLk\\/MOKpL3ZO2qt\\/6Uk\\/wuLS8ddH\\/k3+Z5v4+8B6t8NvFF1oOspCLuFUkSa1mWaC4idA8U0Ui8PG6MrAjsecHIrnq+3tH+Jvgy4uPEGmaD4gnfxPougaFoOna5p\\/ia38NS3sNqrreG1v7qFljQyNF8h2NIkfBIyp5XSfibeSfGzx3qOl6FpGhzanptta3t5p\\/xF0rTr+KUCNmubXVRtgeSZk3TCKNg29gwBJqV8XKnfez7ro\\/n17P0H0u9Nvle1\\/uu\\/W3mfJddB4B8If8ACeeLdP0H+29H8O\\/bGZf7T1+7+y2UGELZklwdoO3A46kDvX0h4Ng0bTfid8WNR0n4papqmo20tvHp18vi2y0LUdWWR8zt\\/a10rqwixtby8efww+UAV1Hh7xULT9uR\\/EXhnxzo+k+EPtOlz67qCeKbSyt7+M28TTl2Z4BdkyiRnCx5LElkUnFEdeXzX9f8P8t0yajcVO3T+vv8j4pkTy5GTcrbSRuU5B9xTa+gvCPinVvgn8P\\/AIr2un+JtP0nxTcXmlGzuNF1i1uZmjLXJka3ngkfDBXAZo23KHKkjcQeO\\/aW12z8T\\/F2\\/wBXsr211EXthp09xdWbo6S3LWMBuGJTguZfM3d927POalO+39aXNpxUZyivO3pcw\\/APwrvfHOj65rcuraZ4b8O6L5K3usauZzCkszFYolSCKWV3ba5+VCAEJYjjPMa5p1vpOrXNna6paa1bxNtS\\/sVmWGYY+8omjjkA7fMinjpXp3wB17xlocus\\/wDCOT+E7rR7oQx6toXjLU9Nt7HUUVi8avDeTR79pBIeIh0zwy7ufV9B0XwV40+I3jv4OeGNRgtPCmuQW2p2VzHM9zZ6fqllD5t0YZXYl4fL+2xiQklh5ZywAJ0a107flq2\\/le1vR9zJPR3\\/AK6f8P5a+R8mVs+F\\/B2seNLi\\/g0a0+2S2NjPqVwvmomy3hTfK\\/zEZwozgZJ7A19E+B\\/jRfa\\/8VvG2p6HbW1po1xp8OjaZIvjC18NajpWnwMq2y2d5dPhSUiUSKqNu3NkDdmr3w5+JUvgX9oD4j6HovxZ1O40jWdO1KCy13UdcaGK51BrU+RJPcbxGZEkzGLkkKSAykKwqL3V11i2u91srf1rpfqPZ2f8yT9Ha7v9\\/wAtfI+T6K+sfhJ4outLk+Ii+LPF1xqHxRuF077FrNn8QbGyuZbNS\\/nRw6zJ58KnmDdHvVmVNoPysp9O+HHxp0Gz8Zaxc3tz4f8AB02peLNIj1S2bxBYagt3bjTrpbmeS4hCwyLLJ5ZlZAFLSFW+8QW9Ff0\\/FpfhfXzVvMXW3r+Cb\\/G2n9I+AKK9l\\/aj8WW3jbxV4R1ePVbfWb6bwppo1G6gmSVjdCMiRZCp4ccAqeRgDArxqkr3afRtfc7FtWt6L8VcKKKKZIUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAdb8Mf+Rjf\\/r3b+a16rXlfwv8A+Ril\\/wCvdv8A0Ja9Ur4LOv8Aevkj+uPDJf8ACAv8cv0PMfin\\/wAhq1\\/69x\\/6E1cXXZfFL\\/kO23\\/XsP8A0Jq42vq8t\\/3Sn6H8+caf8lDjP8X6IKKKK9I+KCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiitrwn4fsfEepSW2oeJdL8LQrEZBeatHdPEzAgbALaCZ9xyTyoGFPOcAsDFrovB\\/w48W\\/EKS6Twr4X1rxM9qFNwuj6fNdmENnaX8tTtzg4z1waytasINL1W6tLbUrXWLeFyqX1ksqwzj+8glRHA\\/3kU+1ex\\/Bu60Gz+BPxVk8SabqOrab9t0UG30vUI7GbdvucHzHgmGBzkbOfUUlazf8AW6QO+x4xqml3uh6ldadqNnPp+oWsrQ3FrdRNHLDIpwyOjAFWBBBBGRiq1fVf7QngW31q6+K\\/iS6tZbzVbNPDUun5EqzafbXNsQLeZN7bpVVYY2Z8ksMjaWxXQeBdG0X4V\\/Gj4heFbfwNYTzJ4CmuTBqUt\\/8AaVlOjxS3FuVW4T5XdpCwxvXkKyY4Wyk3vFP8Ff8A4f8AUN5RiutvxaX66bfI+NKK+l\\/2ZfG2j33i\\/wAe+R8O\\/DkLXHhHVpIrSCfU2AVLRi0CbrwsVkAJbJLjnYyVy\\/hix8Nah8O\\/HHxJl8AaTfHS77TtLg8OQ3eoDT7NZ1lL3UpFybg5MKxrmdV3SnrgLTfuv5J\\/e3H8\\/wCrahH3l82vuSf5P+noeIUV9TeKPhv4C+HuleOvEE\\/gpdTntbLw\\/fWnh\\/U9Rukj0qe\\/hlkntpTFIkrohA2qzLIAE3Mfm3+P\\/tBeFtG8H\\/FK\\/sdAsm03SZrSxv4bJpmmFv8AaLSGdo1dssyq0hALEnAGSTzS2bj20fr\\/AF8h\\/wCV\\/lp\\/mec0UUUxBRRRQAUUUUAFFFFABXS+HviNr\\/hPw\\/q+jaRdQWFrq0ZhvJorKD7XJE2N0QuSnnJGwUBo1cKwyCDk1zVFHSwdbhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAdh8Lf+Rgn\\/69m\\/8AQkr1KvLvhb\\/yMFx\\/16t\\/6Gleo18DnP8Avb9Ef134Z\\/8AJPx\\/xy\\/M8u+KX\\/Ift\\/8Ar1X\\/ANDeuOrsPil\\/yMEH\\/Xsv\\/oT1x9fW5d\\/ulP0P534y\\/wCSgxn+P9EFFFFeifGBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRW14T8EeI\\/H2pSaf4Y0DVPEd\\/HEZ3tdJspLqVYwQC5SNSQoLKM4xkj1p7gYtdF4P+JHi34eyXT+FfFGteGXugouG0fUJrQzBc7Q\\/lsN2MnGemTWVrWiaj4b1W60zVrC60vUrVzHPZ3sLQzQsOqujAFT7EV7P+x7qwuPjJoHhm90jQdX0bVJpTdQaxoVlfM223kZQsk8TugyoOEYA45pJ6XTE10Z5doPxI8XeFdcvtZ0TxTrWj6xfbvteoWGoTQXFxubc3mSIwZst8xyTk81Xh8ceI7XxJB4hh8QapFr9uFEOqpeyC6jCoI1CyhtwwgCjB4Ax0r1H4ffC\\/Xf2jm8ReJrq0ulstFS2t57fwN4QhnuZZJS4jEdla\\/Z4sAJIzyMy4AUfMSBV26\\/ZQ1CL4jeI\\/h\\/DrTSeNba0h1DQ9LuLE2\\/9rwuiymNjI4a3uFibcYWVuUddwwCzScWl1\\/p\\/lr+I7p3\\/H+vwPKbj4leLrzxbH4qn8U61P4njwU1qTUZmvUwu0YmLbxheOvTirkHxi8e2vii48Sw+N\\/EcPiO4hFtNrEerXC3ksQ24jaYPvK\\/Kvyk4+Uelev\\/AAz+DvwruvG\\/jnQtV8V6n4mXRfD1\\/dLeaZo6i18+GAtJNC\\/2xGlEbj5AyhZcZOwEZ8F8TW+iWurSx+HtQv8AVNLAXy7nU7FLKZjj5gYkmmUAHODvOevHSpuotJdr\\/fdfoOzabfe33Wf6iXXijWr5dUW41e\\/uBqkwudQEty7fbJQWYSS5P7xgWY7mycsfU1X1TV7\\/AFy8+1ale3GoXWxIvPupWlfYihEXcxJwqqqgdgABwK9r\\/Zv0ie+8F\\/FC902y8MXGu2NlYNZXHiqLTWtrfddqshDagPIUlCRzgnOBzirnwO0q38QftPaXYeK38OtrV1dx2ttaWXh\\/T9W0K4mkTYBLFaXMEAjAYNuiLfOORkGnbVJESnZSm+h8+0V638IvgHqPxah8U6pHFrUul6HJDFNF4Z0J9WvpZZmcIsdsJIxtAjdmZpFCgAfMWAr0D4W\\/DW7+Dv7Xnhz4e63ZaTr2m6pfWUc8etaFBOZrScLIgMVzG7W0u1gHVcMrAruIGSLdJ7v+v68tSqn7vn68t7\\/I+ZKK9D8I\\/DfTdd0fxN4n8QazNoHhjR7qGzeTT7Fb26muJzIYoooWliUgLFIzM0igBeNxOK2v2rtD0jw58btVsNCtIbLS47HTXhigtktlO6xgYuY0JVWYsWOCeWPJ60r\\/ANfiXKPLOUe1\\/wAHY8iooopkBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB2XwtH\\/ABPbk\\/8ATsf\\/AEJa9QrzP4Vr\\/wATW8b0hx\\/48K9Mr8\\/zj\\/e36I\\/r\\/wANo24epvvKX5nlnxQbPiKL2t1H\\/jzVyFdV8Sm3eJiPSFB\\/OuVr7HL1bC0\\/Q\\/m7i6XNn+Mf99\\/gFFFFd58iFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFeq+CfgnP8Rvhb\\/anh22vdU8Xv4kj0iPT4pYxE0DWks+7BAO\\/ML87sYB4zQ9IuXa34tL9Q6pd\\/0Tf5I8qrpvhr8QNR+FvjbTPFGlQ2txqGns7RR3is0R3Rsh3BWU9GPQjnFet+DP2edI1\\/4jfD7RZl1O8sdZ0G21TUrO11fTbO\\/kmnMoSOzF28aPysXyfM2C3tXl\\/gv4S+KPiRNrP\\/AAjWlm+h0hVmvpZbmGBLWJn2CSV5HVVQH7zk7VALMQBmjq4+v4Oz\\/IN483p+Kuh\\/gP4o3fgnSNa0WbR9L8S+HtYML3ekaws\\/ktLExMUyvBLFKjrucZVwCHYMCKuaZ8Y7rwyviNvDGgaR4UudaSKEXmlvdm4sIkKs8dtJLcOyCQoN5YsxGVDBSVpF+A\\/jb\\/hItT0aXTLW0uNNt4bq7u7zVLS3sIoZQphk+2SSi3Kybl2ESHfn5c811fwl\\/Zh8WeMvipceGdb8L+Io7HSTK+sSaTZtM0QS3edIllCvGGmCBY3O5W8xSocEZabfvX6fgv6t+HkL+v6\\/P8TG\\/wCGgtZ\\/4WrqHjxdE0JL\\/VLWa01XTkt5VstQWaIxzmVBLuDSZLMY2T5uV21wXibWLTXtWlvLLQ7Dw5buFA0\\/THuHhTAwSDcSyyZPU5c9eMDivQ9Q+BniPxR4q1yw8LeA9f8ADq6HbQz6pp\\/inUYRc2KORiaaSSG2CRYZWLMgCr8zNt5GG3wQ8YQ+Jr7QbixsrG8soIrme4vtWs7ayWKVQ0Ti7klWBg4YFCsh3fw5wahJaWXp6a\\/hvp0K2v8A12\\/HbXqYug+OL\\/w94V8T+H7aK3ez8QR28V1JKrGRBDMsyeWQwAJZQDkHj061sfCH4qP8H\\/FVt4jtPDWi6\\/q9nNHcWM2sNd4tJEJIZFgniDZyMiQMOBgDnO1pP7L\\/AMT9c1XWtNsvCsst7o9ylneRNd26YmdC8aoWkAl8xVJTy9wfI27twzTuf2d\\/Htj4gvNHvNItbC4s7OG\\/uLq81WzgsooJSBE7XbyiAbydqjfkkEAZBAu9n\\/Xa\\/wCWvoQ4qSae39L89PwH6b8bTpcniG0j8GeHJPDGueRJd+GZTfNZiaEkxzpJ9q+0JINz9JsESMCCMAHgL40wfDn4hL4v0jwF4Y+3W88Nzp9rcSak9vp8kf8AFEPtgdtx5IlaQZ6ADiuL8WeE9X8DeIb3Q9dsZNN1WzfZNby4OMgEMGBIZWBDKykqwIIJBBrJpR7ouXvXUuv9f13PT9J+OjaM3iG0h8EeGJfDmuPbz3Hh24+3SWaXEBYxzoxuvPD\\/ADyZBlKEOQVIwBzPxO+I+qfFjxld+JtZhs4NRuooIpE0+DyYcRQpEpVMkLlYwSBgZJwAMActRS\\/r+vy9El0QXbbfcKKKKYgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA7v4Ur\\/pmoN6RqP1P+Fej1wHwnj+TU5MdTGo\\/8e\\/xrv6\\/PM2d8ZP5fkj+yfD2nycN4Z9+d\\/8Ak8jyP4itu8Uzj0RB\\/wCOiuZrf8eSeZ4svz2BRfyRawK+3wathqa8l+R\\/LXEs\\/aZ3jZL\\/AJ+T\\/wDSmFFFFdh82FFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVteE\\/F994L1KS+0+DS7iZ4jCV1bSbXUotpIORHcxSIG4HzAZAyM4Jzi0U9gLutavPr2q3WoXMdrFPcOZHSytIrWEE\\/3IolVEHsqge1ew\\/BP4\\/WXwl+GXjLS0trw+Krq9s77Qr2BEMNtKiTQzmQlg4zDO4XbnJPOB18RruPAHwsbxz4f1\\/XLjxLovhfSNFe2jubrWFu3DPOXEaottBMx\\/1bZyABxTi3FNLb\\/goUrNps9qk+PHwuuv2mND+IkaeKNG8OeHhYNp+lwaXb3M85hGZEkZrtBGN33WG8kHkDHPmFv488NeFvC\\/xN0DRL3WtSt\\/E1vZRWl3eWEVm2YrpJ5FmjS4lAXCkDDNkgZC9uT+JHw71b4W+Kp9B1c28syxx3EF3ZS+bb3dvIgeKeJ8AlHRgwyARnBAIIHMVlGKStHz\\/Hf8S7vd9eX8Nn+P4+h7j8Ifj7B4d8L+JvDviy5uriLU1sDaatPotn4ge0FoJEjg+yXzCMxeXKwUq6mPaMZBIqvb\\/G62X43z+LtV1LUPEVguj3WlQXC6NaaZNtfTpbWFfssEhhjRC6jCuflXPX5a8Woq5e9dvqmvvVvyJj7ux3fgnx9aeGfhv8Q\\/D8q3X2zxJbWUFu8AHljybpJnEh3A4KrxgHnGcda6n4R\\/Fbw3o9j4hHjY3l9rc1rZ2eja3c6JaeIv7PghY74Ba30qxBWTYqsDlAmFADGvG6Kadv6\\/r+rrZsVv6\\/r0PsG3\\/bA8E2\\/j651pNJ1xLCTxDouqxwra2qusFnpk1pIu1HSMMXkUqFCrtB+5wtYln+1N4WuNBbw\\/c2V1Y2kug6LZNqc\\/h3T9aaK6sVlVh9ju38p4nWd8PvR1IHBBIrxTwN8KP+Ex8K6v4kvPFWh+FdH028t7CS41hbxzJNMkroqLbW8x+7C+SQAMD1rF8feA9W+G3ii60HWUhF3CqSJNazLNBcROgeKaKReHjdGVgR2PODkUpae7LrZ\\/dFJfhZ2HHbTtb5Xv+fU0fi544l+IHja41V9Xn1uJYILW3u7jSLbSn8qONURPstu7RRhQNoCseADx0HG0UUkrDbuFFdB4B8If8J54t0\\/Qf7b0fw79sZl\\/tPX7v7LZQYQtmSXB2g7cDjqQO9YMieXIyblbaSNynIPuKYhtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB6r8MrXyfD7ykczTM2fYAD+YNdbWb4as\\/7P0CwgxgrEpb6nk\\/qTVjVLwafpt1ck48qJnH1A4r8xxUnXxM3Hq9P0P7pyOhHKckw9Opp7OmnL1teX43PFvEF19t1y\\/mHR5mx9M4H6VQoJJOTyaK\\/S4RUIqK6H8PYmtLE15157ybb+buFFFFWc4UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFWtM0u91q+istOs7i\\/vJiRHb2sTSSPgEnCqCTwCfwoAq1teE7vw5Z6lI\\/ifStU1ewMRCQaTqcdhKJMjDGSS3nBXG4bdgOSDkYwc\\/TNLvdavorLTrO4v7yYkR29rE0kj4BJwqgk8An8K2PB\\/w48W\\/EKS6Twr4X1rxM9qFNwuj6fNdmENnaX8tTtzg4z1waav0E\\/Mytam06fVbqTSbW6stNZyYLe9uVuZo17B5FjjDn3CL9K9Y+EfjLRPCvwa+JcWq6ZoviC4u7vSfs+jaxczxCcK1xvdBbzwyts3LnDYG4ZHIryPVNLvdD1K607UbOfT9QtZWhuLW6iaOWGRThkdGAKsCCCCMjFVqlfDZf11Ke+p9GeEP2htbn8O\\/F\\/xNPqun6T4nvNN0uz0eGEJEbSOK6jVUskYllMMS\\/Ky5dMb9275q0fBfxc1v4heGfGupaX4j0rwh8XLj+yYRrEmqJpFxqNhBG8dwVvp5FAuHk+zSS\\/vEMgQ4BwVr5ioquln\\/AMHe\\/wCPXvdk7O6\\/rS34dOx9fWfxGS3+MXii48PT6RqV7d6BY6frfiTTfFtn4Zu31FFjNzc2F9cMFbzJY2EjKjCUEt0YMX+CNd8K+HfGHxit9K8canr3ime8s20rxI3i620LULu1DMbpE1W4jkjLB2iDEFfOWLch2\\/Kfj6il5+v4u+nZdPTS4+lvT8FbXz0+\\/Wx9aaT8TbyT42eO9R0vQtI0ObU9NtrW9vNP+IuladfxSgRs1za6qNsDyTMm6YRRsG3sGAJNeB\\/G+Kxh+LHidNN8T3fjOy+1kprl9P589zkAtvlyRKVOU8xflfbuXgiuHoqbbeX+dx33Xf8Ayt\\/X+Z7T8M9FHjH4C+MPDlpq+hWOry+ItKvI4Na1u003fCkF6kjqbmVAwUypkLk\\/MOK910f4m+DLi48QaZoPiCd\\/E+i6BoWg6drmn+Jrfw1Lew2qut4bW\\/uoWWNDI0XyHY0iR8EjKn4hrQ0Dw7qvivV7fStE0y81jVLgkQ2On27zzykAkhUQFjgAngdAa0k3Jvzs\\/mlyr8L39WTstfP7m7\\/n+R9SaT8TbyT42eO9R0vQtI0ObU9NtrW9vNP+IuladfxSgRs1za6qNsDyTMm6YRRsG3sGAJNR+DYNG034nfFjUdJ+KWqapqNtLbx6dfL4tstC1HVlkfM7f2tdK6sIsbW8vHn8MPlAFfKM0L28rxSo0ciMVZHGCpHBBHY1u+Efh\\/4p+IFxcW\\/hfw1q\\/iSe3QSTRaRYS3TRKTgMwjUkDPc1MdLNdE\\/zv936bNaWctmn3X4af1+Nz658PeKhaftyP4i8M+OdH0nwh9p0ufXdQTxTaWVvfxm3iacuzPALsmUSM4WPJYksik4rynwj4p1b4J\\/D\\/wCK9rp\\/ibT9J8U3F5pRs7jRdYtbmZoy1yZGt54JHwwVwGaNtyhypI3EHw7Q\\/DereKNYg0jRtLvdW1WdisVjY27zTyEAkhY1BYkAE8DoDUcGh6ldaffX8On3U1jYMi3d1HAzRW5ckIJGAwhYggZxkg4pfZUV\\/Wq\\/r5ldZX62\\/C\\/+b\\/pHon7S2u2fif4u3+r2V7a6iL2w06e4urN0dJblrGA3DEpwXMvmbu+7dnnNeXUUU\\/QntcKK0NA8Par4q1a30rRNMvNY1S4JENlp9u880pALEKiAscAE8DoDVBlKMVYFWBwQRyKAEorpfB\\/wx8Y\\/EJbpvCvhPXPEy2pUXDaPps12IS2dofy1O3ODjPXBrn7yzn0+6mtbqGS2uYHaKWGZCjxupwysp5BBBBBo2dmHmRUUVoaB4e1XxVq1vpWiaZeaxqlwSIbLT7d55pSAWIVEBY4AJ4HQGgDPopWUoxVgVYHBBHIrY8KeC\\/EPjzU207w1oOp+ItQWMzG00mzkupQgIBbZGpOASOcY5FG+wPTcxqKva5oOp+F9WudL1nTrvSdTtW2T2V9A0M0TYzhkYBlOCOo71Ro31QBRWhoHh7VfFWrW+laJpl5rGqXBIhstPt3nmlIBYhUQFjgAngdAaoMpRirAqwOCCORQAlFdF4P+HHi34hSXSeFfC+teJntQpuF0fT5rswhs7S\\/lqducHGeuDWNqml3uh6ldadqNnPp+oWsrQ3FrdRNHLDIpwyOjAFWBBBBGRijYCtRRRQAUUUUAFFFWtM0u91q+istOs7i\\/vJiRHb2sTSSPgEnCqCTwCfwoAq0Va0zS73Wr6Ky06zuL+8mJEdvaxNJI+AScKoJPAJ\\/CqtABRRRQAVLaw\\/aLqGL\\/AJ6OF\\/M4qKtTwvD5\\/iLTVIyPPRvyOf6VnUlyQlLsjtwNH6ziqVD+aUV97SPblUKoAGAOAK5z4hXBt\\/C9yAcGRlT\\/AMeBP6Cujri\\/inPt0e1i\\/vz7vyU\\/41+cYCPPiqa8\\/wAtT+1eLq\\/1XIcZNae41\\/4F7v6nmNFFFfpZ\\/DoUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABXrv7OHxusvgj4oudQ1HRl1+zugiSWV4q3FmNobEjWrFRLKCQEcyLsDScNu48iop3E1fc+gfhr+09ZeD\\/izrPi7UfD8uqWerGLzNJ1Gdb+yg2IQNtuwjDiM4WAF18mMlf3nWtPw\\/wCJtB+JHw6+M2teI7vWPD+m3l9obkWNvHqksDD7QoijR5bcLCuNqLu\\/doqJ8+3J+a6t2+sX9rpt3p8N7cQ2F2yPcWscrLFMyZ2F1BwxXc2MjjJx1qbK1vT80\\/0H38z6UvvGXgn4ty\\/E\\/wAe614VuNag8NaNpFno0N9eyQzXLRyRWqzXjRMNxkUZdVOcfKrggSVhQaV8PLrwP4x+JOh+CDqtrp8ukaefDepXV0tlp89xFIbmctDOJ3h8yDy4t8w\\/13zbiAK8ItdYv7GxvbK2vbi3s74It1bxSssdwFYMgkUHDAMARnOCM1f8J+OPEfgHUpNQ8Ma\\/qnhy\\/kiMD3Wk3klrK0ZIJQvGwJUlVOM4yB6VXR9+\\/wA7v79fTpsLb0\\/S1l91vn13PrPwDpHh34b\\/ABW8ZaTp3gqxmbU\\/h9c6ydM1O5vHudPebTRNLpw8udCY+T99fOCY+cEFj5D4YsfDWofDvxx8SZfAGk3x0u+07S4PDkN3qA0+zWdZS91KRcm4OTCsa5nVd0p64C15PZ+MNe0\\/xN\\/wkdrreo23iHzmuf7Whu5Eu\\/NbO6TzQd+45OWzk5NbEHxi8e2vii48Sw+N\\/EcPiO4hFtNrEerXC3ksQ24jaYPvK\\/Kvyk4+UelJ6u\\/lb095v56Pl1\\/xbjWit539dEvlqr\\/hsfT3gHSPDvw3+K3jLSdO8FWMzan8PrnWTpmp3N49zp7zaaJpdOHlzoTHyfvr5wTHzggsfHfAfhXRfjrpXjLSdD8I6fonjaNbXUdEtdKubto5IUfy7uALcTyliVkWbklh5L4IHFeV2fjDXtP8Tf8ACR2ut6jbeIfOa5\\/taG7kS781s7pPNB37jk5bOTk133g\\/496h4b1jVfFuonWPEvxHmtpbOw8R6rrLypZxyQmFnMTIXlkWNnCEyhV3AlG2ih2b5mum3zbSv80n5JvdsFdLlXff5JPT5X07+R391ofww0DT\\/ilqln4Pt\\/FFp4Sm0rSNOe51C8hhvLhhPFcXcojlDMskkZcIjRgAJgr8wbp7z4G+AdFuvHHiS5tdE0q20yw0GZfD\\/iK61SWx0ue\\/t\\/NnjmNkrXR2MuxNzAAyDexIAPg\\/w5+NuvfCvwf4q0jw5e6joupa5LZuNX0vUZLSaBYDKSnyYLB\\/M5+YY29+3OaF8Q\\/FXhfxBda9o3ibWNI1y63\\/AGjU7G\\/lhuZt7bn3yqwZtzAE5PJ5NGvXfTX5a6bau\\/p00B7u239dfl8+pr\\/Gax8GWPxAvl8BaguoeG5I4Zoygn8uGVo1M0MbTxpK0aSFlVnUMVAzk5J9H\\/Zp8M6pZ+EvH3jjSrrTLDVrG2g0fSbjVtWttMj+1XMgMpSa4kjTetvFN8obP7yvEvEPiTV\\/F2sXGra7ql7rWqXGDNfahcPPPJgBRudyWOAAOT0AqH+2L\\/8Asn+y\\/ttx\\/Znn\\/afsXmt5PnbdvmbM7d23jdjOOKcG4J23\\/q\\/4XQSSk1fb\\/L\\/g7n1n8V\\/Ang\\/wjrvxa8aar4TsfFMc7aPq+iwDVZBYqdQSZ5vntZR50Syq6jY4yYhhsZDZHg7whpHgv9uD4ZWmi2P9j211c6NqEuj+e8x02eeCKWW2LOS52M5xuJYAgEk15R4I\\/aH8X+AfA+u6FpOua3ZXl8LOGz1Oz1aaCSwt4JJpDBGF5CO07HaGUA5ODmuY8O\\/Fbxt4Q1HUtQ0Lxhr+iX+pP5l9dadqc9vLdNktulZGBc5Zjls8sfWpilCStstvRLb\\/ADe912JqJ1IST3at89Lv89PM9H\\/ZRvLRf2kPDWm3WmJd\\/wBqaqlkLyO\\/vbK6sg7lWeCW1niZXKkj5twweldn+y74J0bx94B+K3h\\/XtaGhaZdaloqPcMfnlYXE+yFHb5UeRsIHkIRS25jgYPiVr8cviPYa1faxbfEDxTb6vfrGl3fxa1crPcKgIRZJA+5woJwCTjPFZWufEXxX4nk1KTWPE+s6tJqXlC+a+1CWY3Xlf6rzSzHfsydu7O3PGKa0SX9bp\\/p1+d0a1Jc8qkl9pp\\/n\\/n+Hnp7B4d8B6dqnij4g63qfgXw74M0Hw1JBZz6X4o1DV2tdPmlkMcaSra7ruaZtjfMpSMEMSoBVa2fFPgH4W\\/DP46+OfD+u29pZQR6faXGiW+unUn0qC5mihmljnNuEvQiq8ix5G4YXzATmvF7H40fEHS9Yn1az8d+JrTVZ4EtZb6DV7hJ5IU+5Gzh9xReyk4Hao9J+MHj3QNWvNV0vxt4j03U7yOOK5vbTVriKadI1Cxq7q4ZgoAABPAGBQtLej\\/r9fLbW13D3fy\\/T\\/hvPyPavg74ebwH+2Rp3hHWfDel2lxdavDZKdF1XUoFsI5QCJbO4iukm+eNwR5rOcNhlByK+br9Qt9cqM4EjDk5PU966PQPix448KanqepaJ4y8QaPqOqP5t\\/d6fqk8Et2+S26V0cFzlmOWJ5Y+tZPibxVrfjTVpdV8Q6xf67qkoVZL3U7p7iZwowoLuSxAAAHPFTraK7FX1n52\\/C\\/+f4Ho3htXk\\/Zf8ZrGrM7eLNGCqoySfs2oYAr2z4j+BrfWvGl74j8U2fh64u9C8K6DD4muvFd5qKwQ6rNCE2zx2Cm5kuGVADgqqlW35JAr5e8H\\/E7xj8PVul8K+LNc8MrdFTcLo+pTWgmK52l\\/LYbsZOM9Mmm+GfiT4u8E6he3\\/h3xTrWg316MXV1pmozW0s\\/O752RgW55571pJqUr+j+6Kjb57+tt7awtFb1X3y5v+B959E+L\\/hP8Pvht4s+NEt94Wk1e08N6fpF9pWlyX11DFDcXTQFonY7JmhBlZdr7ZdqgbkfLjD+AuveC9U\\/ai8HReG\\/DEun6ZrUtlaSRPqN\\/az6XcOgS6NlPb3aybCxcKZXc7WwRXg+oeNPEGqtqDXuu6leNqKRRXpuLyRzcpFt8pZMn5wm1dobO3aMYxVrwf8SPFvw9kun8K+KNa8MvdBRcNo+oTWhmC52h\\/LYbsZOM9Mmpjpa\\/QVROUWl1\\/wCB\\/l+JiX6hb65UZwJGHJyep716Z8H\\/AIoeHvDHhvxT4N8Y6TqF94T8TvaNd3eiXCQ6haPbyF0ePepSVfmbMT4BO0hlIzXAeJvFWt+NNWl1XxDrF\\/ruqShVkvdTunuJnCjCgu5LEAAAc8Vo+D\\/id4x+Hq3S+FfFmueGVuipuF0fUprQTFc7S\\/lsN2MnGemTRHSPKzWpLmm5R01ufQWlfs3+Gvh7J8RbzxHquh6xF4fXSPsTeI49St7Ty76MyiS5h08PcRyKoWMJvCB3OWb5Q0ej\\/C\\/4b6xqPxJ13wfDonivTNLi0saZZeI9Xn0rSUnuSTcxi4nktJXMZjkEQd0LIGLbyvPz7ovxG8WeG\\/EV34g0nxPrOl69d7\\/tOqWWoTQ3U29tz75VYM25gCcnkjJr0v4bftNap4Tt\\/FR1248U6prGvzWs0viXRvEz6drAEKuoia6eKcvEwZcpgcxpzwBT63\\/r\\/g9XfTyM\\/L+vXy9NTv8A4eX3gWL9tTSdF8H+HtOTwzdajbaVbXelavqsUlsWULPNb3KXayFizSIHJKMoBC88\\/Ld+oW+uVGcCRhycnqe9eq+OP2mvGWveOrzxH4b1vW\\/BklxZ2thK2naxMLu8jt49kcl5cJsNxMRktIyjJPAA4rzfxN4q1vxpq0uq+IdYv9d1SUKsl7qd09xM4UYUF3JYgAADnioV7LyuXoubzt+F\\/wDP8PM9c+DdroN38CfirH4j1LUdK037bopNxpenx3027fc4HlvPCMHud\\/Hoa9CjuvB\\/xyl8e\\/ErVotLisfDlvo2h2Efi+XUDHNH5bQ\\/a73+zVaYysIFA2sEDSYLNtXd8sW+sX9rpt3p8N7cQ2F2yPcWscrLFMyZ2F1BwxXc2MjjJx1q94U8aeIfAeptqPhrXtT8O6g0ZhN3pN5JaylCQSu+NgcEgcZxwKvRt\\/L70rfldfO+6I9P6W\\/5pP5HvV94f+Emj6b8TvFGgaNbeOdK0t9HGlwXF3fwWltNcrN9piz+4nliR1IQtschEJY\\/NuteIPgp4Y8UeJvHng\\/wjoDWnihbPSfEOgQC8lkbyZbeF7yzG98OFFyJFJBfbA2WPf5+1rx54l8STalNq3iHVtUl1NonvpL29lma7aMERGUsx3lASFLZxnjFdh8PfjRJ4DvdQ8Rta6jq\\/j1rSSx03XLzVS0NjE8H2ct5Pll5JFiLKhMoRcr8jbRSXVy17L5bff13toN3urf1tr919urvY9a0r4ZfDOab4la1bLoR0bwbJpuiW7+IZtVNjeTPvS4v5hY75x5kkJ8tVMcY8xc8gBp\\/+FG\\/C34mWuqjwRrcOn2Ftr9mLnxA32qWGxt7iwmkaBY5xEzxrdQNGkjqrkOu4mvmvwp408Q+A9TbUfDWvan4d1BozCbvSbyS1lKEgld8bA4JA4zjgVY1T4jeLNbk1iTUfE+s38mseV\\/aTXWoSyG+8rHlecWY+ZswNu7OMcYo3VpeW2mt1f79fS9tg63X+fl+H4vV6n0LdfA3RPCd5PJqWheH7WHw34d0r+35\\/FN9qYs01K8Z3AaKyDXDOU2qAhSNdhLZ3DM9x4x8Pfsi\\/tH+JrC38PHUtCkjs5f7Jvt91ZwGS2WZs204jklaN5SsTSujxqX3BmY14DYfGTx9pWvX+uWXjjxJZ63fosd5qVvq1wlzcqoAVZJA+5wAAACTjArndZ1zUvEeoPf6tqF1ql86qjXV5M00rKqhVBZiSQFUKPQADtS1vf1\\/HX8OnZWXS7elrW6L8La\\/ge6fDX9p6y8H\\/FnWfF2o+H5dUs9WMXmaTqM639lBsQgbbdhGHEZwsALr5MZK\\/vOteRfETxh\\/wn3jLUde8ia0+2MrfZprjzxBhAvlxnau2JcbY48fIgRMttyeboostPIL7+YUUUUxBXR\\/D+3Nx4ptTjIjDuf++SB+pFc5XoXwq0\\/5b2+I54hX+bf+y15uY1PZYWb7q336H2vBmBlj8\\/wtNbRkpP0h736W+Z6BXnvxXnG7TYR1Adz\\/AOOgfyNehV5J8Rb\\/AO2eJJI1OVt0WL8ep\\/U\\/pXyWT03PFqXZN\\/p+p\\/RPiTi44fh+pSb1qSjFffzflE5iiiivvz+QQooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACvZ\\/2Xf8AhXH\\/AAmz\\/wDCyfJ\\/sv5fs+3H2jzMP087\\/RfKx9\\/zvmz5fl87q8YopiaufRXwi\\/4U1\\/wujVP+Ei+x\\/wDCGZj\\/ALK+z+b9p\\/1Zxv8Atn+j9P8AX+Zx5mPI+Wtb4f6Rpl1oPxa1DwDZeDphaXOkJpN14mismhht387eGbVx5azsFXzNp2lw3l\\/IFr5frodJ8cX+jeC\\/EHhiGK3aw1ua1nuJJFYyo1uZCgQhgAD5jZyD0GMVPT+u6Ge4+Nvhh4A+IXjPx\\/r2k+JdP8L+H\\/DOm6fdao2j2JubS4vZDHFdJYIHUbDMzeWMiM54ZI8MOTuPgX4a0211vxDd+PGuPAtimnrBqmk6Yl3e3FxeRNKlu1t9oWOKSNY5vNDT\\/KUAG4sBXnWg+OL\\/AMPeFfE\\/h+2it3s\\/EEdvFdSSqxkQQzLMnlkMACWUA5B49OtavgP4qXXgrQ9Z0G50XSfFHhzVnhmudI1pJvKE8RPlTxvBLFLHIoeRcq4BV2DA8YdtHbf8N9fw2+Vwvrr\\/AMHb\\/Pfvd9T2H4f\\/AAB8CWPjLxXpXizXNQ1a0j8J3HiLRrrTdMBSW1a08+G5cG6jZJkBH+jkMhYEGTGGPnej\\/C7wlqmk+IvFEnizWbTwNpM1rYpfPoEbajdXc6uyxLai78tVCxSsXaccKMAlsCC1\\/aC8SQfEqfxjLa6XdPPYPpD6LLbsunjT2gMAs1jR1ZYljwo2uGG0HcWySmk\\/GwaPDr2mxeCPDM3hTWTbyz+GZzfPZx3EOfLuIpDdfaUkAaQEibBEjAgjAA9XddtP\\/Anv\\/wBuvp9r+7YForPv+i2\\/7eT36eZ6Z8P\\/AIA+BLHxl4r0rxZrmoataR+E7jxFo11pumApLataefDcuDdRskyAj\\/RyGQsCDJjDHzD\\/AIVjofiDwj4u17wl4h1DVR4fks2ax1PSY7O4ntp2MTTBY7mYDZMYkK5ORKpyPu1Ja\\/tBeJIPiVP4xltdLunnsH0h9Flt2XTxp7QGAWaxo6ssSx4UbXDDaDuLZJ6z4J\\/FLw54D8Zax4\\/lGjeHoodPnsofA+mw39wNSkeLbHl52lVYhLslYvPuBi+VDkUOzfM9kvno215Xasm+99kkC0XL1v8ALZJ\\/jdq+m3Vsbc\\/s6eHtBfxmfEPjubT4fCCafFqgs9GF3Ib24SQyWsIFwqs0UieWWdkBIc\\/LtAbR079kK\\/1LW\\/ED2d7rmveGdNstNv7a88N+HJL\\/AFG9jvovNtytn5qhMIH8wtLhSuAWLDPNfDv4raNoXw7+JMXiTT7DxTrOvX2nXMOnav8AbFjuWR7hppS9tLEwZTIp5cA7uh7Uf+GitevtQ8Rtruk6N4k0bXBbLPoOoRTR2cAthttRB5EscsXlJlF2ycqxD7s5o1676em2vn6emoPd22\\/H\\/L19dDC+M3wqv\\/gz8QL7wxqEzXDwxw3MMzwPbyPDLGskZkif5opNrANGclWBGTjJ6X9n2y0\\/R5fFPj3WtJs9a0nwrYLItjqFqtzb3F3cSrBAjxuNrAB5JMH\\/AJ5V5p4h1S21rWLi8s9HstAt5MbdP0953giwADtM8kknJGfmc8k4wMAdZ4N+OXjL4deDr3w94U1m68NJe36X9zqOkXM1reylI2RImljcZiG9m24+8c56U4ScU29\\/8\\/8AJfiKaUml0\\/r83p6M9L8Zfs9+GdN8YfFC\\/wBR8UzeHPCfh+6s7mxWz0s3011a36PNarEnmxqGCeWPnZVwWO4EANe+EHgeD4b\\/ALVXgzwjINI8X+GPEcumzLPrGg284u7G5RJUIiuEkMD7X2tsbIII3EVSs\\/2mI\\/Evw58VJ4707S\\/F3iOWDSLG2j1dr8tqUdvJdM09xNDOjNKizIu4uu4BeGIJrj\\/Dv7RuraH8UP8AhPrvw5oGva\\/byW76b\\/aC3aQaWsChYY4I4LiIbFQIoWTfwg7liZiuSSj0Wnqrfm\\/u3W4qt6kZd2vulp+C189i\\/wDsu6LomtfH7Q9O1NrU3FzffZbCz1LQE1fTp5ZNyAXMLXMBCKG3AqWOQOOK3fgL8H7j4ufDb4rabpelWN1rlvdaW0GoXMSqunwedObiXzCCYowiZbHJCgYY4B4nwX8cIfAPxFXxlpPw+8LJqNvNFc2NvLLqbwWMyZPmRj7ZuYseSJGdeOABxTNN+Pms+GBr48K6VpfhBdXubG8P9lNdM1pNau0kbwvNPIwLMxLBiwPQBRxTWyT\\/AK1T\\/wA+v3bmtSXNKo49WmvxuvxXfr87fhT4P6J458dazpHhvV\\/FHinSNPhEiXXh\\/wAIyXl9dfMFLpaCcBIgT9+SVGwV+TJKjqLX9k+4\\/wCFqeM\\/B9zrF\\/cSeHbKG\\/jtdI0c3OsX8cojZFisHliPmIkoaVPMJj2tjfjNc5D+0XcrP4vSbwN4Tn0jxU1rNqWiiK8gtGngZmSaMQ3KPGxZ3JVXEfPCAYrN1z41jxd441PxR4l8EeGNeur2C2t1s5RfWttbCGJIlMSW11ERlUXIJKjHyhelC6X7P7\\/+H+9Wva7Sh7u3l+n6X9Htc6z9nnwj4fX9pTTfD17JO0o1E6fY2fijwpHdwzTNujK31mbxPK2kk4V5CGUccV4fer5d5OvyjbIw+UYHXsO1eraL+0lq+m\\/F67+JV\\/4b0DX\\/ABRJdQ3drJqIu1isXiAWMRJDcR7gFVF\\/e+YSEBJJJJ858Va5beI9bnv7TRLDw9DLj\\/QNMe4eFDjkgzyyyZJ5OXI54wOKnW0b72KVrz+Vvxv+a\\/E9S+G2sf8ACIfAPxl4hs9K0O81iPxDpdlHc6xolnqRjhkgvWdEW5ikC7mjQkgA\\/KOa6vxl8CdL8YfEmyl0XS9d0+z1jwvp3iWTQ\\/CHh6bWJ4JbmNfMWGHzUCwB8tl5RtDqqhug8p8B\\/Fo+C\\/C+q+HbvwroXivSNRvbfUJLfWjdrsmgWVI2U29xCcYmcEMSDkccVvw\\/tLeIbqbxaPEOkaL4ssPE32P7ZpupRTwW8Qtci2WEWs0LRrGrFQgbbjqD1rSVpSv6fdypNfN6\\/LzbUK6jb1+\\/mvf7tPmb1\\/8Asv2nhzxN8R7DxH4x\\/sbTvBltZ30ly2kyNcXUNy0flxi3Z1KXG2VR5bNtD5UuqgvV\\/wCCnw98Jab+0l4Z0SLxJp3im01EWr6TJeeH4tUsp3uYv9Vf232xPKaPeQyq8hV0rgPF\\/wAfNf8AGk\\/jGW70\\/SbX\\/hKLWwtLyOyt2ijhS08ryvJXfhM+UuRyOTgLxjO+EPxUf4P+KrbxHaeGtF1\\/V7OaO4sZtYa7xaSISQyLBPEGzkZEgYcDAHOZj0uKom4yUd3\\/AMD\\/AIJxl6vl3k6\\/KNsjD5Rgdew7V7N+znceFW0\\/xXp17f8Ah3RPHN6trH4f1XxjYR3mkxqJT9ojkEsUsUTuuzbLJGVUKw3JnNeU+KtctvEetz39polh4ehlx\\/oGmPcPChxyQZ5ZZMk8nLkc8YHFX\\/B\\/izS\\/DK3Q1HwXofiwzFSjaxNfxmDGchPstzDnORndu6DGOckPhszWq1Kbcdr\\/ANf193c9Z0X9mvxl498UeNbnxNpOpWFxoTWv22x8G+HIdQnkkuFLQ\\/ZrW1aKDyjGpkMiuqY2kbi4zBr37L48C6943Txb4gu9O0LwzBYXD3NjpBnv51vSDbA2ks0PlEKT5geQbGG0byRnAuP2kfEGsap4kl1\\/SNF8R6Rrq2qz6DfRTx2cIthttfJMEscsflJlBiTlWO\\/eTmvQPgB8atB8IaX48ls7\\/Rvh5rOrT2BtLKS412HThBEJfNC3FjLJeh9zKdry+WdxyCVUK0l02X9f8Na6t3Ib77\\/1+HrZkvw9+EPhbwH+1tpngeXXP7fmjngtrU674RiurG5uJ4s7bi1N8hWNVkU53Ftw5QY5+aL1fLvJ1+UbZGHyjA69h2r3TWPjR4V+G\\/xuPjDwJ4c0nxJcwi1vBfaxLqbwR6kq5uJ7YNcpM0TyEsPtRdvUDOK8b8Va5beI9bnv7TRLDw9DLj\\/QNMe4eFDjkgzyyyZJ5OXI54wOKhXsr+f9f15Fbcy9Lfjf81+Pkezfs86RdXXwv+JWoaRZeFJtetLjSktrrxZFpbQQxu1x5gVtRHkqzbV6HcccdK6XxB8CdE+MXxB8Yax4Mgvn8PaJb6fHqcPgTQ31bztUmjxOLG3WSNfs4kjmbdvVFAGwFWQV8\\/6T44v9G8F+IPDEMVu1hrc1rPcSSKxlRrcyFAhDAAHzGzkHoMYrT8B\\/FG78E6RrWizaPpfiXw9rBhe70jWFn8lpYmJimV4JYpUddzjKuAQ7BgRVuzbfpb7kn8t9O9mRqtuv9ff59rnuGk\\/sNzy+KNW0TV\\/GH9jTw6lY6bp\\/maPIXuWvLWW5gMsbOrW5CxESK24oQwG8gBovhn8GfDvgn9pLwPoc+u2\\/iGDXbOzvdHbVvCyXtlcm6RlC3ds15GVVckgq7nIU7R0rzvwb+0hq\\/wAPbpm8N+G\\/D+k2f9s2uuR2CLdyxRTwQTQqqmS4aQowndiGcndjBAGKm8P\\/ALS+qaH4y8OeKZ\\/CfhvWNZ8O2FlYaXNfC9VbYWwYRybYrlA7nd82\\/cvAwo5yut1tdfdy6\\/Pm\\/qwpJuDXWz+\\/m\\/Ll\\/q5Z\\/ZUuI\\/8AhojwtoV5pmjatpWsatDY3trqukWt7G8Rk5CCeN\\/LJ\\/vIQ3vTf2XdF0TWvj9oenam1qbi5vvsthZ6loCavp08sm5ALmFrmAhFDbgVLHIHHFY3gv44Q+AfiKvjLSfh94WTUbeaK5sbeWXU3gsZkyfMjH2zcxY8kSM68cADijwX8cIfAPxFXxlpPw+8LJqNvNFc2NvLLqbwWMyZPmRj7ZuYseSJGdeOABxRH7N\\/P+vzKq+97Xk62t+P+a+70O2+AvwfuPi58Nvitpul6VY3WuW91pbQahcxKq6fB505uJfMIJijCJlsckKBhjgGP4H6b8HNJ+LF\\/Z+JtabxD4VhKpZ6lNYiyuZ5Qr7mSKd3thB1yZyJD+6KKrbgOK034+az4YGvjwrpWl+EF1e5sbw\\/2U10zWk1q7SRvC808jAszEsGLA9AFHFcn498YDx54ovNcOi6VoM12d81ro0TxWxk\\/idUZ22FjyVXCgn5VA4pa\\/16L+v876XUtKUmtun3\\/wBf8C2vtXwi\\/wCFNf8AC6NU\\/wCEi+x\\/8IZmP+yvs\\/m\\/af8AVnG\\/7Z\\/o\\/T\\/X+Zx5mPI+WvGfiJ\\/YP\\/CZaj\\/wjHk\\/2BuX7F5Pn58vYMeZ53zeb\\/z0x8m\\/fs+TbXN0UW2J7klvby3UyxQxtLKxwEQZJrTbwjrK4zp0\\/wCC5rsvhXZwjT7u6wDcNL5ZPcKAD+pP6V3NfMYzOJ4es6UIrTufu\\/Dfhxhs2yynjsVXknU1SjayV7a3vd\\/dbY8Wh8G61cHC6dMP9\\/CfzIr03wXo82iaHHb3KhJy7Oygg4yeOR7AVuUV4mLzOrjIezkkkfqXDvA+A4cxLxlCpKc2nH3rWs7dElrp3AkKCTwBXgd9cm8vbidjkyyM5z7nNey+LNXj0fQ7mVmAkdDHEueSxGP06\\/hXilezkNJqM6rW9kfmnixjoTrYXBQlrFSk162S\\/JhRRRX1R+ABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAa\\/hzxNdeG7lnhAkik\\/1kLHhvf2NdlH8VrUj57CZT\\/suDXm1FedXy\\/D4mXPUjqfZZTxfnOS0Pq2DrWh2aTS9Lq69Foeky\\/Fa1Ufu7CZz\\/tOF\\/xrNuvipeyAiCzgh9C5LkfyriKKyhlWDhryX9Wz0cRx\\/wAR4hWeJ5V\\/djFfja\\/4lzVNYvNauPOvJ2mYcAdAo9AO1U6KK9SMYwSjFWR8HWr1cTUlWrycpPdt3b9WwoooqjAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACuz+F3wj8R\\/GDW20vw1bJd3SYMiBi8iKQfn8pA0rqCMFkRgpZdxG4Vxldn8Lvi54j+D+ttqnhq5S0unwJHClJHUA\\/J5qFZUUk5Ko6hiq7gdop6Cd+hteH\\/gHqmpW3iy51nX9C8I2\\/hhrWPUpNVlnn8uS4LBI8WkM53gqVdSAUbKtgggcr8RPAeqfDHxlqXhrWPIa+smXMtrJ5kMyOivHJG2BlXRlYZAOGGQDkD2j4SfGx9B8AfFTXtYbw\\/q+vX15ocv9mazYWkq6msc0nnEwOhDsVwXlC78uXLbjuPa6Ounr8Vfih4psviVJNqF+tpqGkHS\\/GVhol9eW9y5d421K4D+S1uoWN4AFZsDoqgEs7r8fWyt9936JO+1wvv8AL\\/g\\/d+qsfH9FfYnxQ+LVn4R1T42an4H8XWNpqupS+HXtNR0i\\/ia4uH+zP9rlhmRUYyb2bzJUVGy7bgu4rUN541stU8ffE3UvC3ivQ9J+IWq6Losul69LqFvZBpTbQnUhDeMyxwXLsSGYupP71c7iRUrW\\/wDXS\\/3f1Yp6O39dPx1PkGivpr4QyarF4l+IGr+JfiJcnx3bxWccUmn+PdO0+71JXb52TWpjMm2NFQNHGxL5AJ+Qiuq+KHxas\\/COqfGzU\\/A\\/i6xtNV1KXw69pqOkX8TXFw\\/2Z\\/tcsMyKjGTezeZKio2XbcF3FaHor\\/10\\/wA9\\/Vbpgldtdj47or7o0HULTxP4i+LniPS\\/FzeGtRvbLw2o8YaDdWdvOlxJbLJeRi5nurWEGSSNvMUTrIzL91griqOqaxq+sfGX4k+KNf8AEmq+GPELWWmnQrGLxpp2j3Wo2EgGJodWk82ER7VEjRQMVdpSASEOas00n\\/X9fgrvZE3urry\\/G39fgfEtFfYnxQ+LVn4R1T42an4H8XWNpqupS+HXtNR0i\\/ia4uH+zP8Aa5YZkVGMm9m8yVFRsu24LuK14Z+0trtn4n+Lt\\/q9le2uoi9sNOnuLqzdHSW5axgNwxKcFzL5m7vu3Z5zUXv\\/AF5XLtrb5\\/l\\/mY3gD4WN458P6\\/rlx4l0XwvpGivbR3N1rC3bhnnLiNUW2gmY\\/wCrbOQAOKzviR8O9W+FviqfQdXNvLMscdxBd2Uvm293byIHinifAJR0YMMgEZwQCCB33wj8ZaJ4V+DXxLi1XTNF8QXF3d6T9n0bWLmeIThWuN7oLeeGVtm5c4bA3DI5FekfBz4xQ+Mv+FhavqupNpHjy6TToNHGk+I7bwu1tp0JZHtbS+uI5EhVR9nzGWV5FQ\\/MxDBra1dulvyX43fpa\\/Ui9t\\/6\\/wCBa\\/nex8pV0Ok+B7\\/WfBfiDxPDLbrYaJNawXEcjMJXa4MgQoApBA8ts5I6jGa+3vhx8adBs\\/GWsXN7c+H\\/AAdNqXizSI9Utm8QWGoLd24066W5nkuIQsMiyyeWZWQBS0hVvvEHE1r4mX\\/iHw3rt34T8c6FaeOdQ8N+GfM1C41+xsLgzRrdC52TzyoEmQMinYwdQwHAOKmV0nbXVL70pX9On4+RUdVd9r\\/+TctvXr\\/Vz4bor7KtPEmh+IPiV448Rab47kh8T2ek6RYzXGj+JrHw3Nrd6I0jv7mHUrlCAgeMllQAzbg2SBzD8UPi1Z+EdU+Nmp+B\\/F1jaarqUvh17TUdIv4muLh\\/sz\\/a5YZkVGMm9m8yVFRsu24LuK0PT+vO33db\\/qmgWt\\/l+n4o+O6K+6NB1C08T+Ivi54j0vxc3hrUb2y8NqPGGg3VnbzpcSWyyXkYuZ7q1hBkkjbzFE6yMy\\/dYK4rnPipf618S9W+MGla9qNnomu60dC1DRYfEviG0SK70+ISASxXZl+zNuWVZdkchGWkCbtppyvHTr\\/w36a9NmJNNX6f1\\/wx8dUV9d+O\\/ixF4Jg+K0\\/g\\/wAa2KatLa+FbWx1PRrxRLMIrEx3D2z8SKVPysyhXUMVbbkir1rreka58U\\/iB4r0\\/wAcCx12TStFeJND8U6f4duNSnltoTeuupTqyoUkDGSNMNIzc\\/dIppXbS2X9f8P29ELbfe1\\/y\\/zPjaivsT4ofFqz8I6p8bNT8D+LrG01XUpfDr2mo6RfxNcXD\\/Zn+1ywzIqMZN7N5kqKjZdtwXcVrwz9pbXbPxP8Xb\\/V7K9tdRF7YadPcXVm6Okty1jAbhiU4LmXzN3fduzzmovf+vK5dtbfP8v8zJ8DfCj\\/AITHwrq\\/iS88VaH4V0fTby3sJLjWFvHMk0ySuiottbzH7sL5JAAwPWsXx94D1b4beKLrQdZSEXcKpIk1rMs0FxE6B4popF4eN0ZWBHY84ORXpHwz0UeMfgL4w8OWmr6FY6vL4i0q8jg1rW7TTd8KQXqSOpuZUDBTKmQuT8w4r3XR\\/ib4MuLjxBpmg+IJ38T6LoGhaDp2uaf4mt\\/DUt7Daq63htb+6hZY0MjRfIdjSJHwSMqdJqzdvLTunFNv5N29L9iIvT7\\/AL+ayXzWv\\/DnxDRX1ppPxNvJPjZ471HS9C0jQ5tT022tb280\\/wCIuladfxSgRs1za6qNsDyTMm6YRRsG3sGAJNR+DYNG034nfFjUdJ+KWqapqNtLbx6dfL4tstC1HVlkfM7f2tdK6sIsbW8vHn8MPlAFTHW3mr\\/jb\\/g36LfZ2b0TfmvxX9K3XofN\\/gHwh\\/wnni3T9B\\/tvR\\/Dv2xmX+09fu\\/stlBhC2ZJcHaDtwOOpA71gyJ5cjJuVtpI3Kcg+4r7W8PeKhaftyP4i8M+OdH0nwh9p0ufXdQTxTaWVvfxm3iacuzPALsmUSM4WPJYksik4rynwj4p1b4J\\/D\\/4r2un+JtP0nxTcXmlGzuNF1i1uZmjLXJka3ngkfDBXAZo23KHKkjcQVf3VJ\\/1qv8AP8ykvi8rfje\\/3afgfPtdD4d8D3\\/ibw74n1m1lt47Xw9axXd0kzMHdJJ44FEYCkE7pFJyRwD34rsP2ltds\\/E\\/xdv9Xsr211EXthp09xdWbo6S3LWMBuGJTguZfM3d927POav\\/AANtY9a8D\\/FXQk1LSbDUtU0e1js49X1W209J3S\\/t5GVZLiREyERmxuzxVJMi6919Hb8bHj9FfRnwE8M\\/8IPe+NmuvGMOj+JrK3tEs7Xw5430rSZL1JHJlMerMZYlEahd0UZ3PuAP3CK7j4ofFqz8I6p8bNT8D+LrG01XUpfDr2mo6RfxNcXD\\/Zn+1ywzIqMZN7N5kqKjZdtwXcVpSslf+un+f5rdMau7+R8d16Nc\\/BHUdN+LFt4B1TxD4d0S9mihmbVtTvWt9OhWW2W4TzJWTK\\/Kyr937xxz1r3\\/AFjxhBrmufEfUPBfjTRdA+IWpQ+H7mPXv7Yg015oTZqdRWK8MiKspuDG0qqwd9rjDYYVraH45uZv24o\\/E+i\\/EXS4PCyto39uau3iiCwt7+BbSESbvOlja4G5X3JtZgfvKDxVWfNyv+tPy6X7p9iJS9xyXa\\/5fj5eh8TSJ5cjJuVtpI3Kcg+4ptfQXhHxTq3wT+H\\/AMV7XT\\/E2n6T4puLzSjZ3Gi6xa3MzRlrkyNbzwSPhgrgM0bblDlSRuIPs2g6haeJ\\/EXxc8R6X4ubw1qN7ZeG1HjDQbqzt50uJLZZLyMXM91awgySRt5iidZGZfusFcVMfe9Fb8bG1RKM3FfL0ufC9dx4A+FjeOfD+v65ceJdF8L6Ror20dzdawt24Z5y4jVFtoJmP+rbOQAOK6r9rTWvEXiT436xqniK3vLd7uG3lsBd30d75lmYl8mVJoneJlkGZP3TFAzsATin\\/CPxlonhX4NfEuLVdM0XxBcXd3pP2fRtYuZ4hOFa43ugt54ZW2blzhsDcMjkUoyvFy\\/rdImSs7HA\\/Ej4d6t8LfFU+g6ubeWZY47iC7spfNt7u3kQPFPE+ASjowYZAIzggEEDmK+nPhF4+u\\/iDr3jjxhqnix\\/D3iSG1srPS9I0TxFZeF3a1DbPKt766VxFFDGiAxL80gILMdpz6wkmkax48+Nmt+G\\/F48Ovcx6DHb+MvD1\\/ZpKJXhEl0q3k89lCTK8bGQCSOR2GdhAkUVy66\\/12\\/PW3W63VhX3+X6X\\/4F9bHwXRX3VfePJrj4jfFO\\/wDEFzqmheONTi0qbw\\/cDxrY6RczaSFO5rbVnWa2USZhlaOJwG+dVY7WB+Xv2iPEcPiv4r6rqUekWejTSxwC5jstXttVSeYRKJJ2ubZVhkeQ5dygA3s2ec1F9v6\\/q2z7PQaW\\/l\\/X\\/BXkebV03xG+H+o\\/DHxZP4f1Sa1uL2GC3uGks2Zo9s0KTIAWVTkLIoPHUHr1r074A6lNafD\\/AMcQeGPE+n+D\\/iHLc6ebPVLzVY9KmOnhpftUcF1I6BDvNuzKrBnVSAGGRXsura9o+u\\/Gz4leJ9L+I3maqmm6LFZTaJ4ss9An1TNtCtw6ando2wIU+eIAO5bDY2EVpy62\\/rb\\/AINm+ln0TZKe7\\/rdL+l6HxNXQeAfCH\\/CeeLdP0H+29H8O\\/bGZf7T1+7+y2UGELZklwdoO3A46kDvX1L4++LGl+EfFvx41fwj4i0n+0dS0zQ\\/7P1C0uoZ5JrktbNczwSBU3XAbzXaVUV1bc+EYcc5+zn8XPFXi39o7w\\/4x1DxPpnha0gfT7fxJeTeIItKGpW8ShDLcCe4U3TsE3PtDZJyVGRUx96wqj5Yya\\/rb\\/P8D5fkTy5GTcrbSRuU5B9xTa2vGXh+58M+I7yxu57C4mVt\\/maZqNvfQkNyMTQO8ZODyA2R0ODXuP7Nt54osfg\\/8VpfB2s2nh\\/XPtGkLHqN1qlrphhQtdBzHc3DosbkEgFWD4LAcE0o6x5v67GtRKM2ltc+dKK+uvEfxsstFuvi\\/q+geJLGXxVNoOhWLazG0Ye+1KKSBLy7tCQCz7ldhMg3ZBkUjhqwvBfxc1v4heGfGupaX4j0rwh8XLj+yYRrEmqJpFxqNhBG8dwVvp5FAuHk+zSS\\/vEMgQ4BwVprVNrW3+drruuvprYjrZ6f8Nez\\/L1Pnvwv4O1jxpcX8GjWn2yWxsZ9SuF81E2W8Kb5X+YjOFGcDJPYGsavsrw78ahpfx08R6do\\/j9NKfVvCUthfatZam1jpl94iFhsa7Mu5Y9zTqcXB2hmJcHDbjyfhHxB4uh0P4gW5+Itla\\/GSefTXj1+68YWpludMVZBNBBqpnMasHa2ZoxMrMsZHO0rQ99Nrfe+ZrT5Wl\\/h18gW2u9\\/u0T1+ba9dPM+evC\\/g7WPGlxfwaNafbJbGxn1K4XzUTZbwpvlf5iM4UZwMk9gaxq+yvDvxqGl\\/HTxHp2j+P00p9W8JS2F9q1lqbWOmX3iIWGxrsy7lj3NOpxcHaGYlwcNuPI\\/DVPEHxR8SeL\\/AIU+P\\/Fa6tf+IbeHVLfXJtaj1mO3urJGl3m5jlkTBtftEZwxI+QHpij7Vlta9+mjd9fRXXW1u+h9m73v+aja\\/wA20\\/R9tfmOivsLwl8SvEvjjQfjNrPgPVbbwu0M+i6bok13q1vpv2DTohcwxRxXNzIgifygMlGViXfH3jWzp3xI8Jah4q+IVxp3iB5PH8tholu2vaX4mtfDcmoSww7NSkttRniaNd8wjZh8pmCFlZhkMb6ry9dfLy69geja\\/wCG6dfy7nxJXQ2fge+vvAOqeLkltxpunahbabLEzN5zSTxzOhUbcFQIHySQclcA846j9ojxHD4r+K+q6lHpFno00scAuY7LV7bVUnmESiSdrm2VYZHkOXcoAN7NnnNa\\/wAM4Lbxd8FvGng631XS9P8AEE2rabq9rDrGo2+nw3MMKXMUqrPcOkYdTcI20sCQGwDg4S96Da30\\/NX\\/AAuxuykk9v8Agf52Qvhn9mfVfEXjTRvCsvirw5pGs6zpVpq+nxXxvStxFcQGcIGitnCuiD5t2BnhS1eY69o8Gla3NYWGrWfiGFSqx32mxzrDMSAfkWaKOTgnHzIOQcZGCfrDwbqmjan+1V4O1C28S+Hl0Lwbodho1\\/q97rVrZ28s0OntA7QGeRDMnm5UNGGGMN90gnxz4QeDf+ER+Ieqa94gXT73TvA9odbuBaXsF9aXFwu0WcAmhd4nDzvCGAY\\/KJB1Uiq053f4U5fOKbs\\/PT7ydeVJb2X3tLTy1+4w\\/G3wO1zwHp\\/iK61C902b+wNQstLvobaSQulzcwSTCMbowCY\\/JdH54cYG4c1oap+zj4l03wxfazHfaVqD2Wladrc+mWcsrXa2V4itHMEaMBlQuiPtYlS46g7q1\\/Bd83xN+FvxB0GfW9Nt\\/F2pa7YeIF\\/trUbfT4rxUW6SfE87pEHDXKNtLAkbsA4OPavDvxW8JfCr4nv8R21+z16PwX4d0vwnaaTpt+obW71bZIbhlXkvaxBZG8wjYzrFtJyKdtLPR6f+kXf\\/AJPaPzG3\\/Lro\\/v5kl\\/5Ld\\/jsfKnxK+HWofCvxO3h7V7uyn1eGCKW8t7N3f7FK6BjbyEqB5qAgMELKCcbiQccrXoHx40LT9E+KGsy6R4jt\\/FekapJ\\/atnqkNyk0jxzkyBZ9pJSdSxV1bBDKTjBFef1lFtxvJWf5eXyKkknaLuvz8\\/mFFFFWSFFFFABRRRQAUUUUAFFFbXhPw\\/Y+I9SkttQ8S6X4WhWIyC81aO6eJmBA2AW0Ez7jknlQMKec4BYGLXReD\\/AIceLfiFJdJ4V8L614me1Cm4XR9PmuzCGztL+Wp25wcZ64NZWtWEGl6rdWltqVrrFvC5VL6yWVYZx\\/eQSojgf7yKfavY\\/g3daDZ\\/An4qyeJNN1HVtN+26KDb6XqEdjNu33OD5jwTDA5yNnPqKStZv+t0gd9jxjVNLvdD1K607UbOfT9QtZWhuLW6iaOWGRThkdGAKsCCCCMjFVq+vvjX4T0ux1b4j\\/EXWdCh8Z3FodAtrTRdRluoI9Mtruy3o14IJVmaSNIY4MmVQzuWIJIQY3jX4S+EPh1oXi3xpH4QXWjbw6Ew8J6peXXkaI+oW7zy+eYZI5yqNGIow8ikeaN+9gMjvFPm6WT9Xsv6uvMa963L1V16f13s32PCfBXxY8SfD\\/TdR03Sbixk0zUHjludP1XSrTUraSSPcEfyrmKRA4DsAwAOCRmsvxj401rx9rkmr69em+vmRIlIjSKOKNFCpHHGgCRoqgBURQoA4Ar6y8A6R4d+G\\/xW8ZaTp3gqxmbU\\/h9c6ydM1O5vHudPebTRNLpw8udCY+T99fOCY+cEFj4j8NtY+G2veJPEN34p0PQvDZksUGjWNw2qyaJHcB13m4MM0l58yBtpV2UMeRiiXx8r3tf7nJW\\/8lsrb9NNWo\\/DzLq7feov\\/wBuu\\/6R5BRX1l8HdPHw1+MPxX8L6r4G8NzalD4Z1aWOG0utQlh8r7EZFhgIugzQyxkMS+ZQD95CCB598PF8D+IPDXxQ8Ya14Csduh2NhLpui6bf3sVok8lykRLs87ysjAksvmZIyEaMkMFfVLur\\/i\\/8v63Do32dvy\\/z+77jw6ivoDwn4X8FeMtQ8T+MdJ8O6PpXhDSrHT1vIPF17qQ0+yvpwEeOJLFpLuZWdJTGWcbVB35O0V1vjz4X+AfhRq3xeu7jwbHryaFJoh0zTb3UL2G3tXvbd5JUbBineNWICq5ST5F3MDvDN+7v\\/X\\/D3VvJ3Ba7HylRXpn7Q\\/hDSPBfxGFpotj\\/AGPbXWl6fqEuj+e8x02ee1jlltizkudjOcbiWAIBJNeZ0h9n31+8KKKKYjr\\/AAV8WPEnw\\/03UdN0m4sZNM1B45bnT9V0q01K2kkj3BH8q5ikQOA7AMADgkZrL8Y+NNa8fa5Jq+vXpvr5kSJSI0ijijRQqRxxoAkaKoAVEUKAOAKxKKHrqwWmwUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABXX+Cvix4k+H+m6jpuk3FjJpmoPHLc6fqulWmpW0kke4I\\/lXMUiBwHYBgAcEjNchRQBt+MfGmtePtck1fXr0318yJEpEaRRxRooVI440ASNFUAKiKFAHAFYlFFLbYArr\\/AAV8WPEnw\\/03UdN0m4sZNM1B45bnT9V0q01K2kkj3BH8q5ikQOA7AMADgkZrkKKYG34x8aa14+1yTV9evTfXzIkSkRpFHFGihUjjjQBI0VQAqIoUAcAViUUUttgCiiimAUUUUAFa1h4r1XTPDmraDbXXl6VqskEt5b+Wh81oSxiO4jcMF26EZzznismigAooooAKKKKACul8PfEbX\\/Cfh\\/V9G0i6gsLXVozDeTRWUH2uSJsbohclPOSNgoDRq4VhkEHJrmqKOlg63Naw8V6rpnhzVtBtrry9K1WSCW8t\\/LQ+a0JYxHcRuGC7dCM55zxWTRRQAUUUUAFXLfWtQtNLvNNgv7qHTrx45LmzjmZYZ2j3eWzoDhiu5sEjjccdap0UAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFbXhPwR4j8falJp\\/hjQNU8R38cRne10mykupVjBALlI1JCgsozjGSPWnuBi10Xg\\/4keLfh7JdP4V8Ua14Ze6Ci4bR9QmtDMFztD+Ww3YycZ6ZNZWtaJqPhvVbrTNWsLrS9StXMc9newtDNCw6q6MAVPsRW58O\\/GN94R1yNrK10e7F28cMqaxotnqSbdw+6tzFIEPuoB96qnH2klGL3Jm+VNtbFfQfiN4s8K6\\/ea7ovifWdH1u8Di51Kw1CWC5n3sHffIjBm3MAxyeSATTtD+JHi7wz4ivdf0fxTrWla7e7\\/tWqWOoTQ3U+9g775VYM25gGOTyQCa9n8ffBuy8ZftNfE\\/Q9L0\\/WLXTtL1K4aHS\\/BfhptTuFj83aBHbRvFGka5GSzqBkABicDmviF+znJ4EPxAtv7ce81XwlJYzyWMmnvbvNYXSrtnYM26ORGlgR4Sp2mXhztrGnLmhGS6rT0f9frsaSj70o9n+J5jZ+MNe0\\/xN\\/wAJHa63qNt4h85rn+1obuRLvzWzuk80HfuOTls5OTW9a\\/G\\/4jWOu3ut23j\\/AMUW+s3yJFd6jFrNytxcIgwiySB9zBewJOO1dzH+zei\\/EjUvB41DxBrl9pOnW9xqNv4V8Mvql3FdSIjSwLEsyqUhZ9jyPInzDAQ1o2v7J9x\\/wtTxn4PudYv7iTw7ZQ38drpGjm51i\\/jlEbIsVg8sR8xElDSp5hMe1sb8Zq10S8\\/w3\\/rqiL319Pxtb816M8Xs\\/GGvaf4m\\/wCEjtdb1G28Q+c1z\\/a0N3Il35rZ3SeaDv3HJy2cnJqxrnxC8U+JrjUbjWPEusatPqSRx30t9fyzNdLGQY1lLMS4UgFQ2cYGK7HQfhDpuoah41vNU1zUvD\\/hTwoyx3l1faOBqjyyOY4oFsvP2iYurblaYBVRiW4wZ\\/Bfwl8K+NLfxzrCeNLzS\\/C\\/he2trs3moaKou7tZZViMaW6XDqJNzYUGXa3G5oxkqlZpJev9dindN332\\/rucP4R+IPin4f3FxceFvEuseGri4QRzS6Rfy2rSqDkKxjYEjPODXZeEv2ifGHg\\/w\\/4tt7LXdch8QeIHsN3iG31eaK7hjthIBGXHzOrK6rjcAAgGD27j4KfD3wlpv7SXhnRIvEmneKbTURavpMl54fi1Syne5i\\/1V\\/bfbE8po95DKryFXSuD+H\\/wu0PxX4d8Z+JPEXiiXw3pXh2e2jdLPSjezXLTmUKkSebGoYGIcO6rgn5gQAze39dHt9\\/QSW\\/y\\/G9vyPOb6+udUvri8vLiW7vLiRppridy8krsSWZmPJYkkknkk1BX014F\\/Z\\/8A6b448WaP4o1zVdXs4vCM3iLR7qy0jasts9kLiK5YG7jZZU3D9wdyMykFwOa+efE1volrq0sfh7UL\\/VNLAXy7nU7FLKZjj5gYkmmUAHODvOevHSlpFqPl+rVvw\\/TcavJc39bJ\\/qv+GMuiiimIKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigArp\\/AfjW38E6g91c+F9E8UpuSSO31pbjZFIjZV1ME0T9yCpYo2fmU4UjmK9R+H\\/wR1T4lfCvxLrvhzRdc8Q+IdL1axs00\\/R7V7ofZ5orlpJHjRGfhoYwGyANxBByMUrxTkun+aX6iaUvdfX\\/hxNF\\/aC1y1k8bDXdJ0nxlb+MbqG91a31lbhFknikeRJFNtNCy4Mj\\/AChtuDjHAqeP9pDxCvxaufH0mk6HNd3dnHYXWjtayLps8CQJEqNEsgIA8qNwFYAMgIAAxXonhz4AeCLP42eHPht4q0rxdFqWraVY3s00WqQWUljPJYC4nieCSzcnEm5QCylRwdxGaw\\/DHwQ8M\\/Fb4V+MPE3hCx1\\/Tda068tbXStHv9TgvvthKs9yC6W0J3BMOoCgAI+d3ZK8b8n2dNP\\/AAH\\/AIHp5IJWk1z7y119Ob5d\\/XzOJ8L\\/AB11bQ7fxla6tpGleL7LxbcQ3mq22tm5AknjkeRJQ9vNFIDukfI3YOeRS658ax4u8can4o8S+CPDGvXV7BbW62covrW2thDEkSmJLa6iIyqLkElRj5QvSvQvit+zr4T8FL4wfRtX1PUoNH8L6brFtcTPFtmuJryO2mzhOYuXZAMEZXJPOfnOoi19npp92n6aeVi3d3k+v6pP9Ueqt+0d4iv\\/ABT4w1fWtM0fxDZ+K1iTVNF1CGUWkgix9n2mKVJkaIKAriTcRncWyc87J8TJYNM8XaZpWhaTomleJY7aK4srM3MiW4glWVfJaaaR+WXJ3s\\/U4xxjjKKdtvInudz8Ifio\\/wAH\\/FVt4jtPDWi6\\/q9nNHcWM2sNd4tJEJIZFgniDZyMiQMOBgDnPb+E\\/jF4V0\\/wP8R0vfB3h\\/7RrNzpb2fhpn1M2b+UZ\\/NkEi3XmhhvU4abBLHAOMDw+im9Vb+v60BaXt1\\/r+v+CelWPx+8SWvxKu\\/Gc8GnX891ZSaXNpNxAwsGsWg8j7IERlZYli2qu1ww2g7ick8T4m1i017Vpbyy0Ow8OW7hQNP0x7h4UwMEg3EssmT1OXPXjA4rLopdv6\\/r\\/gh\\/X9fcvkFFFFMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK2vCfi++8F6lJfafBpdxM8RhK6tpNrqUW0kHIjuYpEDcD5gMgZGcE5xaKewF3WtXn17VbrULmO1inuHMjpZWkVrCCf7kUSqiD2VQPauq0vxxY2PwZ8Q+EXiuDqWo63YalFKqr5KxwQ3SOGO7IYmdMAAjAbJHGeIrr\\/h\\/wDDK\\/8AH8Wr3i6hp2haHo8KzajrWrySLbWwc7Y1IjR5Hd2+VUjRmPJxgEhW91x6f5NP9Avqpdf89P1PR\\/D\\/AMd9A0n46eBPGk1nqTaXoOh2OmXMKRRmd5IdPFs5QF9pUuMglgdvYHiua8H\\/ABpufAPwyttK8P3F1p3ii38QvqqXyRRtCIWs2typ3E5b534K4AYkHNV9H+CM+s\\/8JFfL4s8O2\\/hbQxb\\/AGnxRK901k7z\\/wCpjREt2uC7Yb5TCCuxt23HMXh74NS+Il8S6hF4q0G18K6A0Md14nuVvBZPJMcRRxxi2NwzNh+PJGAjE4GCR+8pJ9dX96fyu7adQ\\/lfbRfdb56dT0G2+NXgbWvCL+HtZk8RaZFceDLHw9Ne2WnQXjJc2+oG6LrG1zFujK4XJcHJPy46+HeJrfRLXVpY\\/D2oX+qaWAvl3Op2KWUzHHzAxJNMoAOcHec9eOlQ65p1vpOrXNna6paa1bxNtS\\/sVmWGYY+8omjjkA7fMinjpVGj4nzd7v723+oL3Vy+n4JL8kFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVteE7vw5Z6lI\\/ifStU1ewMRCQaTqcdhKJMjDGSS3nBXG4bdgOSDkYwcWimBd1qbTp9VupNJtbqy01nJgt725W5mjXsHkWOMOfcIv0r1z4Tyad4w+CvjrwCdY03Q\\/ENzqNhrentq97FZW18IEnjktzPKVjR8Th13sAxUjOevi1FL7Lh0f6NNfikGvMpLdf8ADP8ABs9v+Eq+N\\/h3r2v6ZoepeBdX06RbePWtH1\\/XtKfStRAPmJGftE6JMUbI8yBiUOdrjPPWQ3r+Dvip4utfhJd+Dr3wTMlnFq2geKNasBpF7KqK8kUf2+dGuIo5xKEmjbeBgh\\/mDN8yUU79\\/wCv+B5f8G56f15+um\\/\\/AALd\\/wDHjT\\/CGl\\/E\\/VbXwPJE+gxpCNtrO89vHceUn2hIJXJaSJZfMCOSdygHLDDHgKKKlaIbCiiimIKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK7Pw\\/8OJ9TtUubyc2sbjKRquXI7E+lbifCzTR9+6um\\/3So\\/8AZa8ipmuFpScXK7XY\\/RMDwDn+OoxrwoqMZarmkk7em6+aPMKK9UHwx0j\\/AJ6XR\\/7aL\\/8AE0f8Kw0j\\/npdf9\\/F\\/wDiax\\/trC+f3Hqf8Qyz\\/tD\\/AMC\\/4B5XRXqn\\/CsNI\\/56XX\\/fxf8A4mg\\/DHSP+el0P+2i\\/wDxNH9tYXz+4P8AiGWf9of+Bf8AAPK6K9Rf4W6UynbcXansd6n\\/ANlrnfEXw7uNJt3urWb7XAg3OpXDqPX3Fb0s0wtaSgpWb7nlZhwDn2XUZYidJSjHV8rTaXpv9yOQooor1j88CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK9n\\/Zd\\/4Vx\\/wmz\\/8ACyfJ\\/sv5fs+3H2jzMP087\\/RfKx9\\/zvmz5fl87q8YopiaufRXwi\\/4U1\\/wujVP+Ei+x\\/8ACGZj\\/sr7P5v2n\\/VnG\\/7Z\\/o\\/T\\/X+Zx5mPI+Wlj8E+BfFHwz+Id1per+HfDOl23iPSI9M1jUrW\\/kZYGtbwmFmSCaYSsVVpAFEReNtp2iOvnSuhs\\/HF9Y+AdU8IpFbnTdR1C21KWVlbzlkgjmRAp3YCkTvkEE5C4I5yvsNddP8A0pP8kyl8V\\/X8mj3Lxp8D9N8UfE2x0bR01K8tLTwjo123\\/CCeGZtTnvXezh33CwHyMKzNvZ5WRsuPlLEgZdr+yfcf8LU8Z+D7nWL+4k8O2UN\\/Ha6Ro5udYv45RGyLFYPLEfMRJQ0qeYTHtbG\\/Ga5yz\\/aT1hdN1PS9U8N+H\\/EGjajp2l6bcadfrdpGy6fH5dtIGguI5A+M7vn2kk\\/KOMZuufGseLvHGp+KPEvgjwxr11ewW1utnKL61trYQxJEpiS2uoiMqi5BJUY+UL0p6c77e9+N7f8ADfl0XReSj+CV\\/wBdTrP2efCPh9f2lNN8PXsk7SjUTp9jZ+KPCkd3DNM26MrfWZvE8raSThXkIZRxxVP9lS4j\\/wCGiPC2hXmmaNq2laxq0Nje2uq6Ra3sbxGTkIJ438sn+8hDe9UdF\\/aS1fTfi9d\\/Eq\\/8N6Br\\/iiS6hu7WTURdrFYvEAsYiSG4j3AKqL+98wkICSSSTS8F\\/HCHwD8RV8ZaT8PvCyajbzRXNjbyy6m8FjMmT5kY+2bmLHkiRnXjgAcUR+y5fP+vv8AIionKNSMetrfj\\/mvPc83v1CX1yqgKokYAAcDk17D8NtY\\/wCEQ+AfjLxDZ6Vod5rEfiHS7KO51jRLPUjHDJBes6ItzFIF3NGhJAB+Uc15b4q1y28R63Pf2miWHh6GXH+gaY9w8KHHJBnllkyTycuRzxgcV0\\/gP4tHwX4X1Xw7d+FdC8V6RqN7b6hJb60btdk0CypGym3uITjEzghiQcjjiiGkGtnp+Ek3+CZtUalVcktLv8U7fcz27xN+y7F4+8QTeJtC0rWNM0C48P6Prdzo\\/hPQ5dWuYrq+jYmK2t\\/NT9yGilfc8gCKVUZyorlrf9ke\\/g+Jvirwnf6pfvJounQ6pBaaRo5udY1CGbyzGItPklibzFSTdKhfMe1vv4zXI\\/8ADRniPUtQ8SSeI9O0jxZpmv8A2f7Vo2pQyxWkZtxi2MItpInh8pCUUI4G1iGDVzth480Sz17UNQl+HXhm9tboIIdLnuNUFvZlRgmJkvVlJbqfMkf2xSVubRWWvy7L5dPJaka211enz2v9+vnr9+\\/4N+DUXjDx54g0K2TxjcRaTuza6Z4Se81g4cIfMslnCQ7W4bdPwcAbicD0T4Y\\/BvTvh7+1tY+Bdevbe\\/vFuoIdOj1bwwL+zujcwhoxe2slzC0RVJVLKGcq645xk8Qf2mNe1DU\\/G9xr2haF4ms\\/F8trNqGm6glzHCrW2Rb+W0E8cg2KdvzO24ctuPNSab+0xqdn8XD8R7nwh4X1HxHGbRrMTRXcNtYtbxLEjRRQXMa8qi5V9y8cBRxRH7N+2v8AX9Lr5KaibU1H5f12\\/EyfAXwv0TxT4c8ZeJPEPiabw7pfh2e2ikSx0r7bNcmdpVVYkMsaggxjhnUYJ+bIAbC+LXw\\/X4Y+O77w\\/Fqa6xbRRwXNvfLCYTNDNCk0TNGSdjbJFyuTg5GT1qzqnxUlutF8T6Rp3h7R9A0rxBNaT3FrYG6dYnt95UxtPPIw3GRi24t2xtrI8eeOL\\/4ieIjrOpRW8F0bW1tNlqrKmyCCOBDhmJyVjUnnqTjA4qVf+vT\\/ADNptOcmtnf8\\/wDI7v8AZ9stP0eXxT491rSbPWtJ8K2CyLY6harc29xd3EqwQI8bjawAeSTB\\/wCeVdX40\\/Z98NaX4v8AifqGoeJpvD3hTQLuyubFbLS\\/ts91a36vNbLGhljUME8v7zKMbvmBADea+Dfjl4y+HXg698PeFNZuvDSXt+l\\/c6jpFzNa3spSNkSJpY3GYhvZtuPvHOelafjL9orxX4\\/8M3Wka79kv5ry1sbW71abzXvboWjzNDJLI0hDPicqWI5VE7gk1U1s49NPv1b9U9EZw0Tv11+7RL0td+p6P4F+AfgHS\\/iN488N+LNd1PVk0vw1c6xp1xYaVhHhNktzFcsDdxssqLIp8g7kYgguBzXnHgf4UaN8RfF2p2Hh298Ya5pdnbLOv9k+ETeapLkhWP2SK5aNEUnl2nHVcAk4EVl8fNfs\\/iM\\/jBrDS7m5m0tdFutOmhkNpdWgtFtDHIokD\\/NGgJKup3cgjpUug\\/HRfD1r4o0y28CeGH8NeIvsjXfh+V9RNssluWaORJBdicNl2JBlKnd06YbtzJ9LW+d3r9zXzVnZCV+Vp73v+EdPvT+Wu51V\\/wDsv2nhzxN8R7DxH4x\\/sbTvBltZ30ly2kyNcXUNy0flxi3Z1KXG2VR5bNtD5UuqgvW14J\\/ZF0Tx5dzHTfiXay6dPeafY6bcxaaJmmmu7WW4SOdEnIgePynWRdzlcHG44U+a+L\\/j5r\\/jSfxjLd6fpNr\\/AMJRa2FpeR2Vu0UcKWnleV5K78JnylyORycBeMHws+PniD4R2MVro9nptzHHrNvrgN9FI58+GGaJF+WRfkK3DkjrkLyOQUvg130\\/NX\\/C4P4tNtf\\/AEnT\\/wAmOg+JH7Olt4H8N6xrtj4obWNPtbHR7+1Z9ONu9xHfiXG5fMbyyhhP97cGH3eleg+CP2ZbjVvC\\/wAUPCmlw2Wt65BB4cv4NYu7ZYRp8FxE1zcOXJYxxojYcg5YIOCSFrzKH9pbWZrN9P1bw14d8QaPJpOn6RJpuoQ3IidbJmNvNuinSQSDc4OHCsGIK0X37UfjO61TxDqVqum6PqOtSaVK9zpdu0BtX09QsBgUPtTOBuXBXsAo4oWjknqr6el9O3z27X7OXl2\\/HS\\/6\\/wCRB4U+D+ieOfHWs6R4b1fxR4p0jT4RIl14f8IyXl9dfMFLpaCcBIgT9+SVGwV+TJKj0TwD8M\\/AHwf+Pms+FPildR3unWXkPaTm3Nvdt5sPmpviuf8AR4xscCVJiWVwgjJwxPAQ\\/tF3Kz+L0m8DeE59I8VNazalooivILRp4GZkmjENyjxsWdyVVxHzwgGK4z4mfETUPip4yuvEmqWtjZXlxFBCbfTYTDbosMKQoETJ2jbGvA4znAAwAtVb+v6\\/y130T0d\\/w\\/D+n+Gh7D8Iv+FNf8Lo1T\\/hIvsf\\/CGZj\\/sr7P5v2n\\/VnG\\/7Z\\/o\\/T\\/X+Zx5mPI+WvGfiJ\\/YP\\/CZaj\\/wjHk\\/2BuX7F5Pn58vYMeZ53zeb\\/wA9MfJv37Pk21zdFFtg7hRRRTEFFFFABSxsFkUsNyg5I9aSigadnc99tbiK8t454WDxSKGVh3FS14bp3iHUtJjMdpdyQxnnYOV+uDT5PE2ryZJ1K65\\/uysP5GvjJZFU5nyzVj+l6XixgvYx9rhpe0trZq1\\/J3v+B7fRXhJ1rUGOTf3RP\\/XZv8aP7a1EdL+6H\\/bZv8af9gz\\/AOfi+4j\\/AIi1hf8AoEl\\/4Ev8j3aivCf7a1E9b+6P\\/bZv8a0fDt3f6lrllbG9uikko3ATN90cnv6A1E8jlTi5uorLyOnDeKVDFV4YenhJc02kveW7dl0PZaR9pRg+NuOc9MUvTgcCuc8fax\\/ZWgSIhxNc\\/ulx2B+8fy\\/nXgUaUq1SNOO7Z+vZnj6WV4Krja\\/wwi369l83oeRTbfNfZ9zcdv07U2iiv1Q\\/gRu7bCiiigQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFeu\\/s4fBGy+N3ii50\\/UdZXQLO1CPJe3jLb2Z3BsRtdMGEUpIBRDG28LJyu3nyKrWmape6LfRXunXlxYXkJJjuLWVo5EyCDhlII4JH40xO\\/Q93+Gv7MNl4w+LOs+EdR8QS6XZ6SYvM1bUYFsLKfehI23DGQIJDhoCUbzowW\\/d9Kpyfsw6pe+HPGo8Oab4i8WeIfD+safYpDpumO6zW89vcSSXCxIHdoi0UZjl3AOkisVG8AeKaZql7ot9Fe6deXFheQkmO4tZWjkTIIOGUgjgkfjXW6X44sbH4M+IfCLxXB1LUdbsNSilVV8lY4IbpHDHdkMTOmAARgNkjjK+w++n\\/pSv+Fyl8Xlr+T\\/U6nx9+zzq2g+NLfw9pltJZ3EOhabqWpnxJfW+mpZ3FxbxvJFJLcGJIyJGZVRjv+XHJBrm4PgZ41l8U654el0mKw1DQ0EmpSalf21na2yMVCM1zNIsO1y67CHw+4FdwNep6T8c\\/h7dXF7PqumXdvqf\\/CO6HpFhq9x4csNc+ySWkCR3QFpdSrEVlKLtkzvUL0G4ima18f8Aw\\/rfxi8U+J7HXNd8KaFqunWVh\\/Z\\/\\/CMadq8d2kVvFGyXFpLPFbbQ0W5MKQOCFTGKdvfa6e9+tvl+P4XXRekfyV\\/nv5HFfBX4Mp44+L1v4W1ofbrOGUxXcHh\\/X9KS6uGKkItnLPOIJ2L7eEZuM4qH9n3wT4W+IPxe0bwd4ntNZe31m+jsILjStQhtZLVmfBdw8EokAH8I2f71dV4I+KPw00T9pQ\\/EVrLWfDXh7TtVh1HTdE0bS4Ljzgp+cNuuYltwxG4KnmKu8qOFBOZ8IfF3w4+G\\/wAcNM8X3Ot+KbzSNFvoNQtEi8P2wnu2BLPHIpvtsIBwAwaTPUhelEfs83z\\/AK\\/pkVL8tRR30t+P\\/A8vuPHLuIW91NEuSqOyjPXg4rsvA\\/gex8TeB\\/iFrN1LcR3Xh7Tra7tUhZQjvJeQwMJAVJI2yMRgjkDtxWB4uXRF1+5Ph6\\/v9S0tjvjuNTsUs5iTywMSTTKADkA7znrgdK7L4R+MPDGh+HvHeheKLnVrC08RadBaRXmkWEV68Lx3cM+WjknhBBERHD8Z6VMdVqb1eX2nu7X\\/AAv\\/AJHK+D\\/AmseOri5i0pLNEtkEk91qWoW9hbRAnChp7iRI1JPAUtk4OAcGuns\\/2d\\/iBe6t4j07+w47Sfw48S6tJf6ja2tvaCQMYneaWVY\\/LcL8sgYo25ME71z0vw08Z\\/DDwDJ4ttpG1LUnvYrVdI8Q6l4Q0\\/UZbXaxa4RtPubp4Bv+UCTzGYBeANxFaPxc+Pnhvx4nxITSrDUrWPxG2hfYVuIIIxEtlbmKUSCIhFySNojXbjsnApy0Wn9bf18u1m811ucAvwJ8bf8ACUa5oE+kw6ff6IqPqMuo6ja2lpbK5HllrqWRYcPuXYQ\\/z5+XNeoR\\/s06PH+00Ph\\/vv8AU9Ct4LN7iGz1vTINSuHntI5Nlq9zJHDMfNkwAm47PXqYNa+OHgfx1Z+K9D11PEOmaNq0egzwX2nWkM9wlxYWYtpI3hadFMcgeQq+\\/K7VJQ5wLlh8cvh7eftQWXxQv28TaZpOlSaZNZaZb6db3k85t7aKJ45JDcwqnMfDqrbgclV6VVvet07\\/AC\\/z6eV+qIk3yNre23npp\\/weh4\\/4N+EPif4iR61c6BYQy2Gjsgv7u+1C2s4bRXLhGllmkRFBKMNxOM4GcsoNyP4D+N28T67oE2kwaffaGqPqUupala2lpbK5URlrqWVYcPuXZhzvByuRWjc+NvC2h+B\\/H\\/hnRbnWNUi167025s7y\\/wBPitGXyGmaVZI1uJdvMoC4Zs4JO3pX0P8ADHWtK+L2j\\/FDUYfC2qeK9Iubfw1YSaHbaTNql75ltatG032S2vLZwgeI4mE4wG2lDvO2Y669Fb9P6\\/U1qOKm1Hbp9\\/8AlqfJnxC+Heu\\/C3xNP4e8SW9vaavbqry29vfQXYj3DIDPC7qGxg7ScgEcciur+GPhHwlffD3xr4r8VWWtammiT6fb29no+pQ2Jc3DTBmd5LefOPKGAFHU81a\\/ak0m80v4yapJqGrR6re3sFteSxrZCylsd8KYs5rcSSCGSFQsZTzHI2jLE5qr8MfjRqHwu+HvjXS9C1bWtC8Q61Pp7W2oaPctblI4WmMqvIjq43eYuAAQcHOKmMrwb6\\/8HUUlZ2NX4lfs9XOifEy+0HwvcJPpiafaar5viC\\/tdPawjuYkkS3uppnjiWZd+3GVL4yFGdo5m3+BPjabxNrugy6TDp99oSq2pS6nqFtZWtsrsFjLXM0iwkSFl2EOd4OV3Dmui+EHxN8LaIvjG68aR3N54l1cwyWfiK40Kz8QvAwkZ7jfbXsixs0uV\\/ekl12nH3jX0L4P8TaH8cJPjBrmn+EtV8S+H9QPh61Hh+30ZtRvlNvbunm\\/YrK6tNqBoyBKkqqobb5eHwtqP3f8H9L211duzuTzd\\/L57X089Xpoj5ivv2d\\/HWm+KtV8PXmnafaahpMMc+oSz63YpaWayECMTXRn8iN2JGEZwxzwK6v4Ofsy3XjX4kar4T8XXb+D7jSWT7VLqDJBafMGKqbv51V3G1osI6yqHIYAAn0rxl8TbP4XeOPiD4d8VahHey+KF0vVv7Qi8J2F\\/NpUsUTBbC40u7kaJGjjlaMgTF4yi\\/M25hXz98SfiZqXib4iP4isvEV9eTwQw21nqY0yDRp0ijiEaotvau0cQVRsARjlQOmcVClt\\/X9WennuVyvW\\/wDX\\/Dr7tj0X4a\\/sw2XjD4s6z4R1HxBLpdnpJi8zVtRgWwsp96EjbcMZAgkOGgJRvOjBb930ryL4ieD\\/APhAfGWo6D58139jZV+0zW3kCfKBvMjG5t0TZ3RyZ+dCj4XdgYumape6LfRXunXlxYXkJJjuLWVo5EyCDhlII4JH41Vp66B3CiiimIKKKKACiiigAooooAKKKKACiiigAooooAK674Y2nn+IHmPSGFmH1JA\\/kTXI13\\/woh\\/ealL6CNR+O4\\/0FeZmU+TCVH5fm7H3PA+HWJ4iwkGtpOX\\/AIDFy\\/NHodeafFS88zUrO1ByIoy5Hux\\/wUfnXpdeP\\/EGXzPFV2M5CBF\\/8dB\\/rXyuSw5sVfsm\\/wBP1P37xOxMqGQezX\\/LycY\\/nL\\/21HO0UUV96fyQFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFdn8LvhH4j+MGttpfhq2S7ukwZEDF5EUg\\/P5SBpXUEYLIjBSy7iNwrjK7P4XfFzxH8H9bbVPDVylpdPgSOFKSOoB+TzUKyopJyVR1DFV3A7RT0E79DS8I\\/AHxl418aXXhXTrGGTWrMqLq2juEnkgypJ3RQl5DtI2vtU+WxCybDxWbq3wm13QfDeuaxqH2O2XRdRtdLvLQXAkmSeeKWRV+TcoKiB1dSwZG+UrkMBpeEfj94y8FeNLrxVp19DHrV4VN1cx26QST4Ug7pYQkg3E7n2sPMYBpN55rrfC2tTfFr4X+PdDvNa0i28YX2r6ZrMf9q3dppUV6kMVzDMfOlaKIzZnR23Nvk+dvmbcaWvK2t9PzV\\/wuNW5tdv+A\\/1PPvEnwv1Dwp4k8OaPqOoabBJrljYajDdNMy28EN2ivGZnZRt2qw34BAwcE07Sfhn\\/AGr8UZPBX\\/CV+GbPZdzWn\\/CRXeo7NIbyw370XG3mNtvytt53L616v44+MOq+HfjH4esfAnjXULS20\\/S9F8P3994f1GWC3v5LWGOOTDIy+bGH3hW5BGSMg5PfeDdY1fw5+354y1S28V2nhbw\\/b+M7g64954it9LjntftchKsks0ZuFGDlFD44yORVNe8rbNzt6Jq34NESbjTk7apQ+9p3+d1sfHMieXIyblbaSNynIPuK634f\\/DK\\/8fxaveLqGnaFoejwrNqOtavJIttbBztjUiNHkd3b5VSNGY8nGASMrxl4fufDPiO8sbuewuJlbf5mmajb30JDcjE0DvGTg8gNkdDg16f8J5NO8YfBXx14BOsabofiG51Gw1vT21e9isra+ECTxyW5nlKxo+Jw672AYqRnPWIu8HJau36q\\/wByu\\/lY2qRUanKnpff8vv0XzueU+JNFi8P6xPZQarYa5AgVo9Q01pDBMrKGBXzERx1wVdFYEEECr2k+B7\\/WfBfiDxPDLbrYaJNawXEcjMJXa4MgQoApBA8ts5I6jGa9o+FcN74J8H+PdC8M+MtE8O\\/E\\/wC06e8OqW\\/iG2s1l08CQ3NvbakZFiDiV7cuqSjeIyFLhSK9IuvHkl0vxNTwN4x8P2Pje4tfD8V3rQ1ez0tb++iimXULq1uLiSMFi7HM0ZVn3MwJD5Ll7q012\\/HW\\/otm+j6ErXV6f8Pa3k3ul2Pi6ivsq08SaH4g+JXjjxFpvjuSHxPZ6TpFjNcaP4msfDc2t3ojSO\\/uYdSuUICB4yWVADNuDZIHPiX7WGpaPrHx38QX2hX1lqdhcxWcrXthcJPHPM1pCZpDIiIHcyby7bFJYsSqnICejS\\/r5d0\\/+BvdAtb\\/AC\\/TT1Vzl\\/APwrvfHOj65rcuraZ4b8O6L5K3usauZzCkszFYolSCKWV3ba5+VCAEJYjjMHh74f2\\/ib4iQeFrXxf4ct7eaRkTxFqFxNZ6ZgIX3M80SyIDjaN0YO4gY5zXXfAHXvGWhy6z\\/wAI5P4TutHuhDHq2heMtT023sdRRWLxq8N5NHv2kEh4iHTPDLu59e+Etxo\\/gf8Aa8trv4e+L9P8M+AbO7sP7bL+KIrKzddim5hja4nVryBZRIFx5mVCnkEMbt7yX9fPy8\\/v88pSahJrdf1Zefl\\/S+R5E8uRk3K20kblOQfcVr+F\\/B2seNLi\\/g0a0+2S2NjPqVwvmomy3hTfK\\/zEZwozgZJ7A17b8E7rW\\/hj438Y2EJ0WWa8s1hk1TSvH+maPeWqtIJFay1EzPHk7QsiKHyp2sFrqvhz8SpfAv7QHxH0PRfizqdxpGs6dqUFlruo640MVzqDWp8iSe43iMyJJmMXJIUkBlIVhUfZ035W\\/munn\\/SN5pRm10Ukvk7a\\/wBeux8n0V9Y\\/CTxRdaXJ8RF8WeLrjUPijcLp32LWbP4g2Nlcy2al\\/Ojh1mTz4VPMG6PerMqbQflZT6d8OPjToNn4y1i5vbnw\\/4Om1LxZpEeqWzeILDUFu7caddLczyXEIWGRZZPLMrIApaQq33iC3or+n4tL8L6+at5mfW3r+Cb\\/G2n9I+M\\/hd8I\\/Efxg1ttL8NWyXd0mDIgYvIikH5\\/KQNK6gjBZEYKWXcRuFaXhH4A+MvGvjS68K6dYwya1ZlRdW0dwk8kGVJO6KEvIdpG19qny2IWTYeK9T+KX7ROt+FfiL4T8V+Ftes77WLnwppa6pe28itM9wsTiSKSeIrKhGV3Rq652oGBCgDyzwj8fvGXgrxpdeKtOvoY9avCpurmO3SCSfCkHdLCEkG4nc+1h5jANJvPNLq12uvudvuKaa\\/D8UmcZ4i8O3\\/AIT1i40rVIkg1C2IWaFJklMTEAlGKEgOucMpO5WBVgGBAza0vEXiK\\/8AFmsXGq6pKk+oXJDTTJCkRlYAAuwQAF2xlmI3MxLMSxJObQr21B26BRRRTEFFFFABRRRQAUUUUAFFFFABRRRQAUUV0nhPwXL4kV53l+z2qnbu25Zj7VjWrU8PB1Kjsj08ty3F5tiY4TBQ5pvp+rb0SObor09fhZpv8V1dH6Mo\\/wDZalX4Y6QvWS6b6yL\\/APE15DznCd39x+hx8M+IJbxgv+3v8rnldFetJ8N9FXrHM\\/8AvSn+lWY\\/AehR9LEMf9qRz\\/Ws3nmGWyf3L\\/M7afhZncviqU1\\/29L9InjlKkbSNtRS7eijJr3CDw3pVt\\/q9OtgfUxAn8zV6KGOFcRxrGPRVArmln0PsU\\/xPboeEuIl\\/vGLS9It\\/m0eJW3hrVbvBi0+4IPRjGVH5mvRPh9od7odtdrew+S0jKyjcG6A+hrrKK8rFZrVxVN0nFJM\\/QOH\\/D\\/A5DjIY6Fac6kb2vZLVNPS1+vcK8X8Z\\/8AI0aj3\\/ef0FeyzTJbwvLIwSNAWZj0AHU14brV8NT1a7ulGFlkZlz6Z4\\/SuvIov2s59LHznixiKawGGw9\\/ec728lFq\\/wB7RSooor7Q\\/mQKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigDqvAPxO8QfDO7kudAmsYpnkjmDX2mWt8I5YyTHLGLiNxHIu5sOmGGTzXOahf3Oq31ze3txLd3lzI009xM5eSWRiSzMx5JJJJJ65qCijfVhsFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAV6p8NdRguNCForKJ4GYsncgnIb9cfhXldPhnkt5BJFI0Ug6MhII\\/GuDHYVYyl7O9up9dwvxBLhvMFjVDnTTi1to7PR97pfke\\/0V4cfEmrNx\\/ad3\\/3\\/b\\/Gom1rUZPvX9031mY\\/1r5tZDU6zR+1S8WcH9nCyf8A28v+Ce7U15EjXLsqD1Y4rwVr64k+9PK31cmoSxY5Jya1WQvrU\\/D\\/AIJxVPFyP\\/LvBffP\\/wC0PdJte022z5t\\/bIfQyrn8s1nz+OtDt85vlc+kaM38hXjdFdEcior4pt\\/d\\/wAE8Wv4r5lL+Bh4R9eaX5OJ6jc\\/FDTI+IYLiY\\/7oUfz\\/pWVc\\/FaZs\\/Z9PjT3kkLfoAK4Oiu2GUYSG8b+rZ8xifETiLEaRrKC\\/uxj+bTf4mzrXi7UteTy7iYLDnPlRDav49z+NY1FFerTpwpR5aasj4LGY3E5hVdfF1HOb6t3YUUUVocQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB\\/\\/Z\",\"tipe\":\"jpg\"},\"user_id\":\"19\"}', 'admin', '::1', 'UPDATE MASTER DOCUMENT', '2024-01-30 14:29:44', NULL, NULL);
INSERT INTO `log_user` (`id`, `id_users`, `content`, `nama_username`, `ip`, `action`, `created_at`, `updated_at`, `deleted_at`) VALUES
(72, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-02-01 03:48:53', NULL, NULL),
(73, 19, '{\"ip_address\":\"::1\",\"browser\":\"Chrome\",\"os\":\"Windows 10\",\"device\":\"WIN-PLG1H1TETVL\"}', 'admin | AGUNG ALDI PRASETYA', '::1', 'LOGIN', '2024-02-01 10:20:33', NULL, NULL),
(74, 19, '[{\"id\":null,\"nomor_mou\":\"12345678910 - UNISBA BLITAR\",\"nomor_moa\":\"8 - 1\",\"kegiatan\":\"<p>bbbbbbbbbbbb<\\/p>\"}]', 'admin', '::1', 'TAMBAH KEGIATAN', '2024-02-01 13:19:49', NULL, NULL),
(75, 19, '{\"id\":\"1\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE LAMPIRAN KEGIATAN', '2024-02-01 14:30:34', NULL, NULL),
(76, 19, '[{\"id\":\"8\",\"nomor_mou\":\"12345678910 - UNISBA BLITAR\",\"nomor_moa\":\"10 - 3333\",\"kegiatan\":\"<p>bbbbbbbbbbbb<\\/p>\"}]', 'admin', '::1', 'TAMBAH KEGIATAN', '2024-02-01 14:55:41', NULL, NULL),
(77, 19, '[{\"id\":\"8\",\"nomor_mou\":\"12345678910 - UNISBA BLITAR\",\"nomor_moa\":null,\"kegiatan\":\"<p>bbbbbbbbbbbb<\\/p>\"}]', 'admin', '::1', 'TAMBAH KEGIATAN', '2024-02-01 14:59:12', NULL, NULL),
(78, 19, '[{\"id\":\"8\",\"nomor_mou\":\"12345678910 - UNISBA BLITAR\",\"nomor_moa\":\"10 - 3333\",\"kegiatan\":\"<p>bbbbbbbbbbbb<\\/p>\"}]', 'admin', '::1', 'TAMBAH KEGIATAN', '2024-02-01 15:01:18', NULL, NULL),
(81, 19, '{\"id\":\"8\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE KEGIATAN DAN LAMPIRANYA', '2024-02-01 15:13:50', NULL, NULL),
(82, 19, '[{\"id\":null,\"nomor_mou\":\"12345678910 - UNISBA BLITAR\",\"nomor_moa\":\"10 - 3333\",\"kegiatan\":\"<p>tester<\\/p>\"}]', 'admin', '::1', 'TAMBAH KEGIATAN', '2024-02-01 15:14:34', NULL, NULL),
(83, 19, '[{\"id\":\"9\",\"nomor_mou\":\"12345678910 - UNISBA BLITAR\",\"nomor_moa\":\"33333 - AKN PACITAN\",\"kegiatan\":\"<p>tester<\\/p>\"}]', 'admin', '::1', 'TAMBAH KEGIATAN', '2024-02-01 15:22:59', NULL, NULL),
(84, 19, '[{\"id\":null,\"nomor_mou\":\"12345678910 - UNISBA BLITAR\",\"nomor_moa\":null,\"kegiatan\":\"<p><br><\\/p>\"}]', 'admin', '::1', 'TAMBAH KEGIATAN', '2024-02-01 15:39:19', NULL, NULL),
(85, 19, '{\"id\":\"7\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE LAMPIRAN KEGIATAN', '2024-02-01 15:43:46', NULL, NULL),
(86, 19, '{\"id\":\"10\",\"user_id\":\"19\"}', 'admin', '::1', 'DELETE KEGIATAN DAN LAMPIRANYA', '2024-02-01 15:43:55', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_template_doc`
--

CREATE TABLE `master_template_doc` (
  `id` int NOT NULL,
  `jenis_doc_id` int DEFAULT NULL,
  `nama_template` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dokumen_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_template_doc`
--

INSERT INTO `master_template_doc` (`id`, `jenis_doc_id`, `nama_template`, `file`, `keterangan`, `dokumen_path`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 5, 'Template MOU dari AKN PSF', 'MoU AKB.docx', '<p>Template MOU AKN</p>', 'berkas/MVlPlRsmmgIJBmCLdtbzTI2p7FmRbHO1s4RD7Mda.docx', '2024-01-25 13:16:57', '2024-01-25 13:16:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_parrent` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `nama_menu`, `logo`, `link`, `menu_parrent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Data Dokumen', '-', 'data-dokumen', NULL, '2023-10-27 08:08:05', '2023-10-27 08:08:05', NULL),
(2, 'Kategori', '-', 'data-dokumen/kategori', 1, '2023-10-27 08:09:42', '2023-10-27 08:09:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_users`
--

CREATE TABLE `menu_users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `menu_id` bigint UNSIGNED DEFAULT NULL,
  `insert` int DEFAULT NULL,
  `update` int DEFAULT NULL,
  `delete` int DEFAULT NULL,
  `view` int DEFAULT NULL,
  `approve` int DEFAULT NULL,
  `print` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_users`
--

INSERT INTO `menu_users` (`id`, `user_id`, `menu_id`, `insert`, `update`, `delete`, `view`, `approve`, `print`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-10-27 08:12:42', '2023-10-27 08:12:42', NULL),
(2, 1, 2, 1, 1, 1, 1, 1, 1, '2023-10-27 08:13:07', '2023-10-27 08:13:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `nama_prodi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `nama_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Table structure for table `semua_dokumen`
--

CREATE TABLE `semua_dokumen` (
  `id` int NOT NULL,
  `mou_id` int DEFAULT NULL,
  `moa_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `prodi_id` bigint UNSIGNED DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `password_lama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `prodi_id`, `nama`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `password_lama`) VALUES
(19, 1, 1, 'admin', 'admin', '$2y$10$de116mO9Y2RGoUoMMdapqu5I14KWSrWq455L2mLdyR5GKj/EDXe1a', NULL, '2024-01-24 03:43:01', '2024-01-24 03:43:01', NULL, 'admin');

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
-- Indexes for table `dokumen_moa`
--
ALTER TABLE `dokumen_moa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dokumen_mou`
--
ALTER TABLE `dokumen_mou`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_doc`
--
ALTER TABLE `jenis_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_doc`
--
ALTER TABLE `kategori_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lampiran_kegiatan`
--
ALTER TABLE `lampiran_kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leveling_doc`
--
ALTER TABLE `leveling_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_user`
--
ALTER TABLE `log_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_template_doc`
--
ALTER TABLE `master_template_doc`
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
-- Indexes for table `semua_dokumen`
--
ALTER TABLE `semua_dokumen`
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dokumen_moa`
--
ALTER TABLE `dokumen_moa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dokumen_mou`
--
ALTER TABLE `dokumen_mou`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jenis_doc`
--
ALTER TABLE `jenis_doc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kategori_doc`
--
ALTER TABLE `kategori_doc`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lampiran_kegiatan`
--
ALTER TABLE `lampiran_kegiatan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `leveling_doc`
--
ALTER TABLE `leveling_doc`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `log_user`
--
ALTER TABLE `log_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `master_template_doc`
--
ALTER TABLE `master_template_doc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_users`
--
ALTER TABLE `menu_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodis`
--
ALTER TABLE `prodis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `semua_dokumen`
--
ALTER TABLE `semua_dokumen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
