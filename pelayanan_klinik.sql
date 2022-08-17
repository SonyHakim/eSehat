-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2022 at 12:37 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pelayanan_klinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun_akun`
--

CREATE TABLE `akun_akun` (
  `id` int(11) NOT NULL,
  `jenis_akun` varchar(20) NOT NULL,
  `akun_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun_akun`
--

INSERT INTO `akun_akun` (`id`, `jenis_akun`, `akun_id`, `pegawai_id`) VALUES
(1, 'pegawai_admin', 2, 1),
(2, 'perawat', 3, 3),
(3, 'dokter', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `akun_datapegawai`
--

CREATE TABLE `akun_datapegawai` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` longtext NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `golongan_darah` varchar(10) NOT NULL,
  `no_telepon` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun_datapegawai`
--

INSERT INTO `akun_datapegawai` (`id`, `nama`, `alamat`, `jenis_kelamin`, `golongan_darah`, `no_telepon`) VALUES
(1, 'Ahmad Khasiful Anwar', 'Besuki Situbondo', 'pria', 'A', '082318037428'),
(2, 'Ahmad Kholid Fauzi', 'Karanganyar Paiton', 'pria', 'A', '082333233354'),
(3, 'Dzurrotun Nafila', 'Besuk Probolinggo', 'wanita', 'A', '083834611794');

-- --------------------------------------------------------

--
-- Table structure for table `akun_user`
--

CREATE TABLE `akun_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_pegawaiadmin` tinyint(1) NOT NULL,
  `is_dokter` tinyint(1) NOT NULL,
  `is_apoteker` tinyint(1) NOT NULL,
  `is_perawat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun_user`
--

INSERT INTO `akun_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `is_pegawaiadmin`, `is_dokter`, `is_apoteker`, `is_perawat`) VALUES
(1, 'pbkdf2_sha256$320000$r3hRMmuLeoBzYRxQtnDI2U$ZXypwbc+ITHFPjUYWMM5clVFDkLq1eJD4Wpi3n3oMM4=', '2022-08-14 09:26:26.961573', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2022-08-14 08:35:33.829280', 0, 0, 0, 0),
(2, 'pbkdf2_sha256$320000$1bHE2Vo0qioSdEDLOpT7b2$BmjnFJAqn/iJZfSHl2+iYuUWKHdKUXpkJ3yLwm8fg7c=', '2022-08-17 04:31:46.923340', 0, 'pegawaiadmin', '', '', '', 0, 1, '2022-08-14 09:31:19.000000', 1, 0, 0, 0),
(3, 'pbkdf2_sha256$320000$8I2QVZslcI3lNCdRhAYO3X$Bz3YlF/VFBMOMyylykXKcNYM89DfULuzkjuk2w6ieyU=', '2022-08-16 04:12:49.221373', 0, 'perawat', '', '', '', 0, 1, '2022-08-14 09:52:53.000000', 0, 0, 0, 1),
(4, 'pbkdf2_sha256$320000$tnMcEECpRbdH9FrP32NWK7$TBBzKknBr6sb6oUJRqWulf0T1/1PJXGCAm1XLnOIu74=', '2022-08-16 04:13:16.231127', 0, 'dokter', '', '', '', 0, 1, '2022-08-14 09:56:28.000000', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `akun_user_groups`
--

CREATE TABLE `akun_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `akun_user_user_permissions`
--

CREATE TABLE `akun_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add data pegawai', 7, 'add_datapegawai'),
(26, 'Can change data pegawai', 7, 'change_datapegawai'),
(27, 'Can delete data pegawai', 7, 'delete_datapegawai'),
(28, 'Can view data pegawai', 7, 'view_datapegawai'),
(29, 'Can add akun', 8, 'add_akun'),
(30, 'Can change akun', 8, 'change_akun'),
(31, 'Can delete akun', 8, 'delete_akun'),
(32, 'Can view akun', 8, 'view_akun'),
(33, 'Can add temp_ obat', 9, 'add_temp_obat'),
(34, 'Can change temp_ obat', 9, 'change_temp_obat'),
(35, 'Can delete temp_ obat', 9, 'delete_temp_obat'),
(36, 'Can view temp_ obat', 9, 'view_temp_obat'),
(37, 'Can add rekam medis', 10, 'add_rekammedis'),
(38, 'Can change rekam medis', 10, 'change_rekammedis'),
(39, 'Can delete rekam medis', 10, 'delete_rekammedis'),
(40, 'Can view rekam medis', 10, 'view_rekammedis'),
(41, 'Can add diagnosa', 11, 'add_diagnosa'),
(42, 'Can change diagnosa', 11, 'change_diagnosa'),
(43, 'Can delete diagnosa', 11, 'delete_diagnosa'),
(44, 'Can view diagnosa', 11, 'view_diagnosa'),
(45, 'Can add rawat inap', 12, 'add_rawatinap'),
(46, 'Can change rawat inap', 12, 'change_rawatinap'),
(47, 'Can delete rawat inap', 12, 'delete_rawatinap'),
(48, 'Can view rawat inap', 12, 'view_rawatinap'),
(49, 'Can add biaya pemeriksaan', 13, 'add_biayapemeriksaan'),
(50, 'Can change biaya pemeriksaan', 13, 'change_biayapemeriksaan'),
(51, 'Can delete biaya pemeriksaan', 13, 'delete_biayapemeriksaan'),
(52, 'Can view biaya pemeriksaan', 13, 'view_biayapemeriksaan'),
(53, 'Can add pendaftaran', 14, 'add_pendaftaran'),
(54, 'Can change pendaftaran', 14, 'change_pendaftaran'),
(55, 'Can delete pendaftaran', 14, 'delete_pendaftaran'),
(56, 'Can view pendaftaran', 14, 'view_pendaftaran'),
(57, 'Can add pembayaran', 15, 'add_pembayaran'),
(58, 'Can change pembayaran', 15, 'change_pembayaran'),
(59, 'Can delete pembayaran', 15, 'delete_pembayaran'),
(60, 'Can view pembayaran', 15, 'view_pembayaran'),
(61, 'Can add antrian', 16, 'add_antrian'),
(62, 'Can change antrian', 16, 'change_antrian'),
(63, 'Can delete antrian', 16, 'delete_antrian'),
(64, 'Can view antrian', 16, 'view_antrian'),
(65, 'Can add daerah', 17, 'add_daerah'),
(66, 'Can change daerah', 17, 'change_daerah'),
(67, 'Can delete daerah', 17, 'delete_daerah'),
(68, 'Can view daerah', 17, 'view_daerah'),
(69, 'Can add lembaga', 18, 'add_lembaga'),
(70, 'Can change lembaga', 18, 'change_lembaga'),
(71, 'Can delete lembaga', 18, 'delete_lembaga'),
(72, 'Can view lembaga', 18, 'view_lembaga'),
(73, 'Can add pasien', 19, 'add_pasien'),
(74, 'Can change pasien', 19, 'change_pasien'),
(75, 'Can delete pasien', 19, 'delete_pasien'),
(76, 'Can view pasien', 19, 'view_pasien');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-08-14 09:27:27.494929', '1', 'Ahmad Khasiful Anwar', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-08-14 09:27:58.314442', '2', 'Ahmad Kholid Fauzi', 1, '[{\"added\": {}}]', 7, 1),
(3, '2022-08-14 09:28:37.285715', '3', 'Dzurrotun Nafila', 1, '[{\"added\": {}}]', 7, 1),
(4, '2022-08-14 09:31:20.170109', '2', 'pegawaiadmin', 1, '[{\"added\": {}}]', 6, 1),
(5, '2022-08-14 09:31:44.519372', '2', 'pegawaiadmin', 2, '[]', 6, 1),
(6, '2022-08-14 09:32:07.868899', '1', 'Akun object (1)', 1, '[{\"added\": {}}]', 8, 1),
(7, '2022-08-14 09:52:54.198090', '3', 'perawat', 1, '[{\"added\": {}}]', 6, 1),
(8, '2022-08-14 09:52:57.532303', '3', 'perawat', 2, '[]', 6, 1),
(9, '2022-08-14 09:53:22.633810', '2', 'Akun object (2)', 1, '[{\"added\": {}}]', 8, 1),
(10, '2022-08-14 09:53:32.887752', '1', 'Akun object (1)', 2, '[{\"changed\": {\"fields\": [\"Jenis akun\"]}}]', 8, 1),
(11, '2022-08-14 09:55:04.005634', '1', 'Daerah Sunan Gunung Jati | Wilayah Syeikh Ibrahim Asmoroqondi (A)', 1, '[{\"added\": {}}]', 17, 1),
(12, '2022-08-14 09:55:11.014543', '1', 'Universitas Nurul Jadid', 1, '[{\"added\": {}}]', 18, 1),
(13, '2022-08-14 09:56:29.052100', '4', 'dokter', 1, '[{\"added\": {}}]', 6, 1),
(14, '2022-08-14 09:56:31.051630', '4', 'dokter', 2, '[]', 6, 1),
(15, '2022-08-14 09:56:56.582908', '3', 'Akun object (3)', 1, '[{\"added\": {}}]', 8, 1),
(16, '2022-08-14 10:02:23.964780', '1', 'D64.8. Anemia', 1, '[{\"added\": {}}]', 11, 1),
(17, '2022-08-14 10:02:39.747068', '2', 'G 56.8. Neuropati', 1, '[{\"added\": {}}]', 11, 1),
(18, '2022-08-14 11:31:15.136192', '2', 'Sunan Kalijaga | Wilayah Syeikh Ibrahim Asmoroqondi (A)', 1, '[{\"added\": {}}]', 17, 1),
(19, '2022-08-14 11:31:27.323085', '2', 'Daerah Sunan Kalijaga | Wilayah Syeikh Ibrahim Asmoroqondi (A)', 2, '[{\"changed\": {\"fields\": [\"Nama daerah\"]}}]', 17, 1),
(20, '2022-08-14 11:31:38.891301', '3', 'Daerah Sunan Kudus | Wilayah Syeikh Ibrahim Asmoroqondi (A)', 1, '[{\"added\": {}}]', 17, 1),
(21, '2022-08-14 11:31:53.692478', '4', 'Daerah I\'dadiyah SLTP | Wilayah Syekh Maulana Malik Ibrahim (B)', 1, '[{\"added\": {}}]', 17, 1),
(22, '2022-08-14 11:31:59.910768', '5', 'Daerah I\'dadiyah SLTP | Wilayah Syekh Maulana Malik Ibrahim (B)', 1, '[{\"added\": {}}]', 17, 1),
(23, '2022-08-14 11:32:15.688273', '6', 'Daerah Sunan Bonang | Maulana Syekh Maulana Ishaq (C)', 1, '[{\"added\": {}}]', 17, 1),
(24, '2022-08-14 11:32:25.740500', '7', 'Daerah Sunan Giri | Maulana Syekh Maulana Ishaq (C)', 1, '[{\"added\": {}}]', 17, 1),
(25, '2022-08-14 11:32:46.571625', '8', 'Daerah Sunan Muria | Maulana Syekh Maulana Ishaq (C)', 1, '[{\"added\": {}}]', 17, 1),
(26, '2022-08-14 11:32:55.920796', '9', 'Daerah Nawawi Al-Bantani | Wilayah Syeikh Jumadil Kubro (D)', 1, '[{\"added\": {}}]', 17, 1),
(27, '2022-08-14 11:33:06.605078', '10', 'Daerah Abu Hasan Asy-Syadzili | Wilayah Syeikh Jumadil Kubro (D)', 1, '[{\"added\": {}}]', 17, 1),
(28, '2022-08-14 11:33:15.990363', '11', 'Daerah Abu Aswad Ad-Du\'ali (Diniyah) | Wilayah Syeikh Jumadil Kubro (D)', 1, '[{\"added\": {}}]', 17, 1),
(29, '2022-08-14 11:33:40.249029', '12', 'Daerah Abu Hasan Asy-Syadzili | Wilayah Syeikh Jumadil Kubro (D)', 1, '[{\"added\": {}}]', 17, 1),
(30, '2022-08-14 11:33:48.948529', '13', 'Daerah Yasin Al-Fadani (PPIQ Tahsin) | Wilayah Syeikh Jumadil Kubro (D)', 1, '[{\"added\": {}}]', 17, 1),
(31, '2022-08-14 11:33:58.076719', '14', 'Daerah Sa\'id Al-Makki Al-Manduri (PPIQ Tahfidz) | Wilayah Syeikh Jumadil Kubro (D)', 1, '[{\"added\": {}}]', 17, 1),
(32, '2022-08-14 11:34:07.143317', '15', 'Daerah KH. Zaini Mun\'im  | Wilayah Syeikh Jumadil Kubro (D)', 1, '[{\"added\": {}}]', 17, 1),
(33, '2022-08-14 11:35:24.771072', '16', 'Sayyidah Hafsoh (A) | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(34, '2022-08-14 11:35:48.384129', '17', 'Robiatul Adawiyah (B) | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(35, '2022-08-14 11:35:55.301160', '18', 'Aminatuz Zuhriyah (C) | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(36, '2022-08-14 11:36:08.352689', '19', 'Sayyidah Aisyah (D) | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(37, '2022-08-14 11:36:19.961186', '20', 'Tsuwaibah Al-Aslamiyah ( E ) | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(38, '2022-08-14 11:36:31.872761', '21', 'Khodijah Al-Kubro (F)  | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(39, '2022-08-14 11:36:51.845862', '22', 'Sayyidah Zainab (G) | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(40, '2022-08-14 11:37:09.378175', '23', 'Sayyidah Saroh (H)  | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(41, '2022-08-14 11:37:17.923899', '24', 'Dewi Masyithah (I) | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(42, '2022-08-14 11:37:26.361002', '25', 'Sayyidah Maryam (J)  | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(43, '2022-08-14 11:37:36.475541', '26', 'Halimatus Sa\'diyah (K) | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(44, '2022-08-14 11:37:58.985281', '27', 'Sayyidah Ummu Salamah (L) | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(45, '2022-08-14 11:38:11.629670', '28', 'Sayyidah Fatimah Az-Zahro\' (M) | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(46, '2022-08-14 11:38:26.752568', '29', 'Daerah Khusus | Wilayah Az-Zainiyah', 1, '[{\"added\": {}}]', 17, 1),
(47, '2022-08-14 11:40:21.587150', '30', 'Riyadlul Jinan | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(48, '2022-08-14 11:40:28.028237', '31', 'El Farodies | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(49, '2022-08-14 11:40:34.794379', '32', 'An Nuriyah | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(50, '2022-08-14 11:40:42.605930', '33', 'An Najwa  | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(51, '2022-08-14 11:40:57.982763', '34', 'Al Maziyah | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(52, '2022-08-14 11:41:05.103929', '35', 'Laila United | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(53, '2022-08-14 11:41:12.469326', '36', 'Zahroil Batul | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(54, '2022-08-14 11:41:18.689257', '37', 'As Shofwah | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(55, '2022-08-14 11:41:28.928592', '38', 'Khaula Al Azwar | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(56, '2022-08-14 11:41:39.259783', '39', 'Al Masruriyah | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(57, '2022-08-14 11:41:45.709775', '40', 'Rumaisha Al Milhany | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(58, '2022-08-14 11:41:52.974586', '41', 'Al Munawwaroh | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(59, '2022-08-14 11:42:11.515062', '42', 'Kantor Pesantren | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(60, '2022-08-14 11:42:18.123068', '43', 'Kantor BK | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(61, '2022-08-14 11:42:45.618721', '44', 'Kantor IT | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(62, '2022-08-14 11:42:54.492795', '45', 'Kantor Keamanan | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(63, '2022-08-14 11:43:01.113453', '46', 'Kantor BPA | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(64, '2022-08-14 11:43:11.511931', '47', 'Koperasi | Wilayah Al-Hasyimiyah', 1, '[{\"added\": {}}]', 17, 1),
(65, '2022-08-14 11:43:54.549500', '48', 'Wilayah Fatimatuz Zahroh', 1, '[{\"added\": {}}]', 17, 1),
(66, '2022-08-14 11:44:02.901317', '49', 'Wilayah Jalaluddin Ar-Rumi', 1, '[{\"added\": {}}]', 17, 1),
(67, '2022-08-14 11:44:06.959995', '50', 'Wilayah Al-Mawaddah', 1, '[{\"added\": {}}]', 17, 1),
(68, '2022-08-14 11:44:21.577757', '51', 'Wilayah Al-Amiri', 1, '[{\"added\": {}}]', 17, 1),
(69, '2022-08-14 11:45:27.111032', '52', 'Wilayah Al-Lathifiyah', 1, '[{\"added\": {}}]', 17, 1),
(70, '2022-08-14 11:45:33.647816', '53', 'Zaid bin Tsabit', 1, '[{\"added\": {}}]', 17, 1),
(71, '2022-08-14 11:45:40.715598', '53', 'Zaid bin Tsabit | Putra', 2, '[{\"changed\": {\"fields\": [\"Nama daerah\"]}}]', 17, 1),
(72, '2022-08-14 11:45:54.910415', '54', 'Zaid bin Tsabit | Putra', 1, '[{\"added\": {}}]', 17, 1),
(73, '2022-08-14 11:46:00.491225', '54', 'Zaid bin Tsabit | Putri', 2, '[{\"changed\": {\"fields\": [\"Nama daerah\"]}}]', 17, 1),
(74, '2022-08-14 11:46:09.706927', '55', 'Wilayah An-Nafi\'iyah', 1, '[{\"added\": {}}]', 17, 1),
(75, '2022-08-14 15:20:45.774804', '2', 'SMA Nurul Jadid', 1, '[{\"added\": {}}]', 18, 1),
(76, '2022-08-14 15:21:33.639258', '3', 'MA Nurul Jadid', 1, '[{\"added\": {}}]', 18, 1),
(77, '2022-08-14 15:21:37.706081', '4', 'SMK Nurul Jadid', 1, '[{\"added\": {}}]', 18, 1),
(78, '2022-08-14 15:21:41.667047', '5', 'MAN 1 Probolinggo', 1, '[{\"added\": {}}]', 18, 1),
(79, '2022-08-14 15:21:56.426801', '6', 'SMP Nurul Jadid', 1, '[{\"added\": {}}]', 18, 1),
(80, '2022-08-14 15:22:00.524611', '7', 'MTs Nurul Jadid', 1, '[{\"added\": {}}]', 18, 1),
(81, '2022-08-14 15:22:05.034788', '8', 'MTs Negeri Paiton', 1, '[{\"added\": {}}]', 18, 1),
(82, '2022-08-14 15:29:13.559757', '56', 'Luaran', 1, '[{\"added\": {}}]', 17, 1),
(83, '2022-08-14 15:30:42.669488', '57', 'Karyawan', 1, '[{\"added\": {}}]', 17, 1),
(84, '2022-08-14 15:30:50.225514', '9', 'Tidak Ada', 1, '[{\"added\": {}}]', 18, 1),
(85, '2022-08-14 15:57:45.282475', '3', 'J 45. Asma', 1, '[{\"added\": {}}]', 11, 1),
(86, '2022-08-14 15:57:56.996699', '4', 'J40. BRONCITIS', 1, '[{\"added\": {}}]', 11, 1),
(87, '2022-08-14 15:58:06.288823', '5', 'R51. CHEPALGIA', 1, '[{\"added\": {}}]', 11, 1),
(88, '2022-08-14 15:58:17.477770', '6', 'R07.4. CHEST PAIN', 1, '[{\"added\": {}}]', 11, 1),
(89, '2022-08-14 15:58:27.454304', '7', 'N89.8. FLOUR ALBUS', 1, '[{\"added\": {}}]', 11, 1),
(90, '2022-08-14 15:58:45.124948', '8', 'Covid 19. SUSPECT', 1, '[{\"added\": {}}]', 11, 1),
(91, '2022-08-14 15:58:57.015400', '9', 'A 91. DHF / DEMAM BERDARAH', 1, '[{\"added\": {}}]', 11, 1),
(92, '2022-08-14 15:59:05.194318', '10', 'L30.8. DERMATITIS', 1, '[{\"added\": {}}]', 11, 1),
(93, '2022-08-14 16:00:12.173245', '11', 'E 10. DIABETES MELITUS BERGANTUNG INSULIN', 1, '[{\"added\": {}}]', 11, 1),
(94, '2022-08-14 16:00:20.839103', '12', 'E 12. DIABETES MELITUS BERHUBUNGAN MALNUTRIS', 1, '[{\"added\": {}}]', 11, 1),
(95, '2022-08-14 16:00:29.766082', '13', 'O 24. DIABETES MELITUS DALAM KEHAMILAN', 1, '[{\"added\": {}}]', 11, 1),
(96, '2022-08-14 16:00:42.092538', '14', 'E 11. DIABETES MELITUS TIDAK BERGANTUNG INSULIN', 1, '[{\"added\": {}}]', 11, 1),
(97, '2022-08-14 16:00:51.211773', '15', 'E 13. DIABETES MELITUS YDT LAINNYA', 1, '[{\"added\": {}}]', 11, 1),
(98, '2022-08-14 16:00:59.395693', '16', 'E 13. DIABETES MELITUS YTT', 1, '[{\"added\": {}}]', 11, 1),
(99, '2022-08-14 16:01:18.998443', '17', 'T14.3. FRAKTUR / DISLOKASI', 1, '[{\"added\": {}}]', 11, 1),
(100, '2022-08-14 16:01:39.508342', '18', 'K29.7. GASTRITIS', 1, '[{\"added\": {}}]', 11, 1),
(101, '2022-08-14 16:02:41.352377', '19', 'P54.1. MELENA BAYI', 1, '[{\"added\": {}}]', 11, 1),
(102, '2022-08-14 16:02:53.926149', '20', 'K92.1. MELENA DEWASA', 1, '[{\"added\": {}}]', 11, 1),
(103, '2022-08-14 16:03:40.081954', '21', 'I84.9. HEMOROID', 1, '[{\"added\": {}}]', 11, 1),
(104, '2022-08-14 16:06:36.306419', '22', 'B37.9. CANDIDIASIS', 1, '[{\"added\": {}}]', 11, 1),
(105, '2022-08-14 16:06:43.873912', '23', 'K 76.6. HIPERTENSI PORTAL', 1, '[{\"added\": {}}]', 11, 1),
(106, '2022-08-14 16:06:51.236123', '24', 'H00.0. HORDEOLUM', 1, '[{\"added\": {}}]', 11, 1),
(107, '2022-08-14 16:06:58.619659', '25', 'L00. IMPETIGO BULOSE', 1, '[{\"added\": {}}]', 11, 1),
(108, '2022-08-14 16:07:06.064184', '26', 'J 10 – J 11. INFLUENSA', 1, '[{\"added\": {}}]', 11, 1),
(109, '2022-08-14 16:07:18.322950', '27', 'N39.0. ISK', 1, '[{\"added\": {}}]', 11, 1),
(110, '2022-08-14 16:07:24.971122', '28', 'J06.9. ISPA', 1, '[{\"added\": {}}]', 11, 1),
(111, '2022-08-14 16:07:33.924740', '29', 'L91,0. KELOID', 1, '[{\"added\": {}}]', 11, 1),
(112, '2022-08-14 16:08:03.382846', '30', 'N39.0. ISK', 1, '[{\"added\": {}}]', 11, 1),
(113, '2022-08-14 16:08:21.490234', '31', 'J06.9. ISPA', 1, '[{\"added\": {}}]', 11, 1),
(114, '2022-08-14 16:11:27.270357', '32', 'L91,0. KELOID', 1, '[{\"added\": {}}]', 11, 1),
(115, '2022-08-14 16:11:36.224198', '33', 'H 10 – H 13. KONJUNGTIVITIS DAN GANGGUAN LAIN KONJUNGTIVA', 1, '[{\"added\": {}}]', 11, 1),
(116, '2022-08-14 16:11:47.006377', '34', 'L02.9. KONTROL / RAWAT LUKA', 1, '[{\"added\": {}}]', 11, 1),
(117, '2022-08-14 16:12:07.490552', '35', 'A 18.2. LIMFADENITIS TUBERKULOSA', 1, '[{\"added\": {}}]', 11, 1),
(118, '2022-08-14 16:12:16.837811', '36', 'M79.1. MYALGIA', 1, '[{\"added\": {}}]', 11, 1),
(119, '2022-08-14 16:12:24.886645', '37', 'H66.9. OTITIS EXTERNA/ OE', 1, '[{\"added\": {}}]', 11, 1),
(120, '2022-08-14 16:12:35.352480', '38', 'K11.2. PAROTITIS/MUMPS', 1, '[{\"added\": {}}]', 11, 1),
(121, '2022-08-14 16:12:43.183101', '39', 'J 12 – J 18. PNEUMONIA / PPOK', 1, '[{\"added\": {}}]', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'akun', 'akun'),
(7, 'akun', 'datapegawai'),
(6, 'akun', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(11, 'dokter', 'diagnosa'),
(12, 'dokter', 'rawatinap'),
(10, 'dokter', 'rekammedis'),
(9, 'dokter', 'temp_obat'),
(17, 'pasien', 'daerah'),
(18, 'pasien', 'lembaga'),
(19, 'pasien', 'pasien'),
(16, 'pegawaiadmin', 'antrian'),
(13, 'pegawaiadmin', 'biayapemeriksaan'),
(15, 'pegawaiadmin', 'pembayaran'),
(14, 'pegawaiadmin', 'pendaftaran'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-08-14 08:34:37.318982'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-08-14 08:34:37.456022'),
(3, 'auth', '0001_initial', '2022-08-14 08:34:38.030611'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-08-14 08:34:38.185443'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-08-14 08:34:38.198772'),
(6, 'auth', '0004_alter_user_username_opts', '2022-08-14 08:34:38.218761'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-08-14 08:34:38.236752'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-08-14 08:34:38.243747'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-08-14 08:34:38.271731'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-08-14 08:34:38.291723'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-08-14 08:34:38.315727'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-08-14 08:34:38.357683'),
(13, 'auth', '0011_update_proxy_permissions', '2022-08-14 08:34:38.380668'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-08-14 08:34:38.399659'),
(15, 'akun', '0001_initial', '2022-08-14 08:34:39.569920'),
(16, 'admin', '0001_initial', '2022-08-14 08:34:39.865923'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-08-14 08:34:39.891860'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-08-14 08:34:39.912393'),
(19, 'akun', '0002_user_is_perawat_alter_akun_jenis_akun', '2022-08-14 08:34:40.037018'),
(20, 'pasien', '0001_initial', '2022-08-14 08:34:40.352217'),
(21, 'pegawaiadmin', '0001_initial', '2022-08-14 08:34:41.072915'),
(22, 'dokter', '0001_initial', '2022-08-14 08:34:41.496802'),
(23, 'dokter', '0002_rekammedis_rawat_inap', '2022-08-14 08:34:41.566930'),
(24, 'dokter', '0003_diagnosa', '2022-08-14 08:34:41.666746'),
(25, 'dokter', '0004_rawatinap_rekammedis_idrawatinap', '2022-08-14 08:34:42.170690'),
(26, 'dokter', '0005_alter_rawatinap_tanggal_selesai', '2022-08-14 08:34:42.287113'),
(27, 'dokter', '0006_remove_rekammedis_diagnosa_rekammedis_id_diagnosa', '2022-08-14 08:34:42.470588'),
(28, 'dokter', '0007_rekammedis_id_diagnosa2_rekammedis_id_diagnosa3', '2022-08-14 08:34:42.935210'),
(29, 'pasien', '0002_pasien_status', '2022-08-14 08:34:43.018435'),
(30, 'pasien', '0003_alter_pasien_status', '2022-08-14 08:34:43.040458'),
(31, 'pegawaiadmin', '0002_antrian_statusapoteker', '2022-08-14 08:34:43.086432'),
(32, 'sessions', '0001_initial', '2022-08-14 08:34:43.193387');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0d7ki2h6cbvxaueeazykxlx8dc7wl9ed', '.eJxVjkEOgjAQRa9CujaEQmmtO90az0A-dJQqFAMSFsa7OyhGXU0y78-bfxcFxltdjAP1hXdiI1Kx-t2VqC4UZuDOCKcurrpw630Zz5F4oUN86Bw1uyX7J6gx1HwtjV3ntqoSa0jZJMtI5jJLVE4kVek0aaO0sZLHGqo0GiAgT01qtTQyY-mVTpjgXzXlSgS0WFbs39YtXLTnb_44NtE2TOj55kzBDwUuY-DMRwDX-sBw7scW-qI3eTwBDsxbjQ:1oOAiY:kPvxt3coSrvpiD5yvR2euuD72VHyCVoucp_H5Him6-Y', '2022-08-31 04:31:46.943336'),
('k8t2690p4xygl1ahlh0mkkj79axkfwyt', '.eJxVjM0OwiAQhN-FsyEB5M-jd5-BLLusVA1NSntqfHcl6UFvk_m-mV0k2Naatl6WNJG4CCVOv10GfJY2AD2g3WeJc1uXKcuhyIN2eZupvK6H-3dQodexjt57G7GQIT5_M2sN0WqLGpCViY5QEVO2ik0sARwGUiYAomONWbw_9Vw42g:1oN9t4:WRWlQDd6roucwdd0paT_pKmDrAmKyjQWVrFaojbShQM', '2022-08-28 09:26:26.969653');

-- --------------------------------------------------------

--
-- Table structure for table `dokter_diagnosa`
--

CREATE TABLE `dokter_diagnosa` (
  `id` int(11) NOT NULL,
  `code_diagnosa` varchar(200) NOT NULL,
  `nama_diagnosa` varchar(200) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter_diagnosa`
--

INSERT INTO `dokter_diagnosa` (`id`, `code_diagnosa`, `nama_diagnosa`, `updated_on`, `created_on`) VALUES
(1, 'D64.8', 'Anemia', '2022-08-14 10:02:23.960708', '2022-08-14 10:02:23.960708'),
(2, 'G 56.8', 'Neuropati', '2022-08-14 10:02:39.747068', '2022-08-14 10:02:39.747068'),
(3, 'J 45', 'Asma', '2022-08-14 15:57:45.280498', '2022-08-14 15:57:45.280498'),
(4, 'J40', 'BRONCITIS', '2022-08-14 15:57:56.994678', '2022-08-14 15:57:56.994678'),
(5, 'R51', 'CHEPALGIA', '2022-08-14 15:58:06.286688', '2022-08-14 15:58:06.286688'),
(6, 'R07.4', 'CHEST PAIN', '2022-08-14 15:58:17.475503', '2022-08-14 15:58:17.475503'),
(7, 'N89.8', 'FLOUR ALBUS', '2022-08-14 15:58:27.449156', '2022-08-14 15:58:27.449156'),
(8, 'Covid 19', 'SUSPECT', '2022-08-14 15:58:45.121749', '2022-08-14 15:58:45.121749'),
(9, 'A 91', 'DHF / DEMAM BERDARAH', '2022-08-14 15:58:57.011277', '2022-08-14 15:58:57.011277'),
(10, 'L30.8', 'DERMATITIS', '2022-08-14 15:59:05.189320', '2022-08-14 15:59:05.189320'),
(11, 'E 10', 'DIABETES MELITUS BERGANTUNG INSULIN', '2022-08-14 16:00:12.170773', '2022-08-14 16:00:12.170773'),
(12, 'E 12', 'DIABETES MELITUS BERHUBUNGAN MALNUTRIS', '2022-08-14 16:00:20.837184', '2022-08-14 16:00:20.837184'),
(13, 'O 24', 'DIABETES MELITUS DALAM KEHAMILAN', '2022-08-14 16:00:29.762075', '2022-08-14 16:00:29.762075'),
(14, 'E 11', 'DIABETES MELITUS TIDAK BERGANTUNG INSULIN', '2022-08-14 16:00:42.090793', '2022-08-14 16:00:42.090793'),
(15, 'E 13', 'DIABETES MELITUS YDT LAINNYA', '2022-08-14 16:00:51.207706', '2022-08-14 16:00:51.207706'),
(16, 'E 13', 'DIABETES MELITUS YTT', '2022-08-14 16:00:59.389697', '2022-08-14 16:00:59.390679'),
(17, 'T14.3', 'FRAKTUR / DISLOKASI', '2022-08-14 16:01:18.994381', '2022-08-14 16:01:18.994381'),
(18, 'K29.7', 'GASTRITIS', '2022-08-14 16:01:39.503352', '2022-08-14 16:01:39.503352'),
(19, 'P54.1', 'MELENA BAYI', '2022-08-14 16:02:41.348429', '2022-08-14 16:02:41.348429'),
(20, 'K92.1', 'MELENA DEWASA', '2022-08-14 16:02:53.922848', '2022-08-14 16:02:53.922848'),
(21, 'I84.9', 'HEMOROID', '2022-08-14 16:03:40.078212', '2022-08-14 16:03:40.078212'),
(22, 'B37.9', 'CANDIDIASIS', '2022-08-14 16:06:36.301420', '2022-08-14 16:06:36.301420'),
(23, 'K 76.6', 'HIPERTENSI PORTAL', '2022-08-14 16:06:43.871583', '2022-08-14 16:06:43.871583'),
(24, 'H00.0', 'HORDEOLUM', '2022-08-14 16:06:51.232123', '2022-08-14 16:06:51.232123'),
(25, 'L00', 'IMPETIGO BULOSE', '2022-08-14 16:06:58.614649', '2022-08-14 16:06:58.614649'),
(26, 'J 10 – J 11', 'INFLUENSA', '2022-08-14 16:07:06.061186', '2022-08-14 16:07:06.061186'),
(27, 'N39.0', 'ISK', '2022-08-14 16:07:18.321950', '2022-08-14 16:07:18.321950'),
(28, 'J06.9', 'ISPA', '2022-08-14 16:07:24.969103', '2022-08-14 16:07:24.969103'),
(29, 'L91,0', 'KELOID', '2022-08-14 16:07:33.921741', '2022-08-14 16:07:33.921741'),
(30, 'N39.0', 'ISK', '2022-08-14 16:08:03.380827', '2022-08-14 16:08:03.380827'),
(31, 'J06.9', 'ISPA', '2022-08-14 16:08:21.487250', '2022-08-14 16:08:21.487250'),
(32, 'L91,0', 'KELOID', '2022-08-14 16:11:27.265357', '2022-08-14 16:11:27.265357'),
(33, 'H 10 – H 13', 'KONJUNGTIVITIS DAN GANGGUAN LAIN KONJUNGTIVA', '2022-08-14 16:11:36.219236', '2022-08-14 16:11:36.219236'),
(34, 'L02.9', 'KONTROL / RAWAT LUKA', '2022-08-14 16:11:47.005273', '2022-08-14 16:11:47.005273'),
(35, 'A 18.2', 'LIMFADENITIS TUBERKULOSA', '2022-08-14 16:12:07.487536', '2022-08-14 16:12:07.487536'),
(36, 'M79.1', 'MYALGIA', '2022-08-14 16:12:16.833763', '2022-08-14 16:12:16.833763'),
(37, 'H66.9', 'OTITIS EXTERNA/ OE', '2022-08-14 16:12:24.882655', '2022-08-14 16:12:24.882655'),
(38, 'K11.2', 'PAROTITIS/MUMPS', '2022-08-14 16:12:35.349077', '2022-08-14 16:12:35.349077'),
(39, 'J 12 – J 18', 'PNEUMONIA / PPOK', '2022-08-14 16:12:43.181258', '2022-08-14 16:12:43.181258');

-- --------------------------------------------------------

--
-- Table structure for table `dokter_rawatinap`
--

CREATE TABLE `dokter_rawatinap` (
  `id` int(11) NOT NULL,
  `tanggal_selesai` datetime(6) DEFAULT NULL,
  `tanggal_masuk` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `idantrian_id` int(11) NOT NULL,
  `iddokter_id` int(11) DEFAULT NULL,
  `idpendaftaran_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter_rawatinap`
--

INSERT INTO `dokter_rawatinap` (`id`, `tanggal_selesai`, `tanggal_masuk`, `updated_on`, `created_on`, `idantrian_id`, `iddokter_id`, `idpendaftaran_id`) VALUES
(1, '2022-08-14 17:00:00.000000', '2022-08-14 10:03:11.308196', '2022-08-15 13:50:00.470259', '2022-08-14 10:03:11.308196', 1, NULL, 1),
(2, '2022-08-14 17:00:00.000000', '2022-08-15 07:35:39.702683', '2022-08-15 13:50:09.496925', '2022-08-15 07:35:39.702683', 2, NULL, 2),
(3, NULL, '2022-08-16 01:03:23.993569', '2022-08-16 01:03:23.993569', '2022-08-16 01:03:23.993569', 3, NULL, 3),
(4, NULL, '2022-08-16 04:14:53.715928', '2022-08-16 04:14:53.715928', '2022-08-16 04:14:53.715928', 3, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `dokter_rekammedis`
--

CREATE TABLE `dokter_rekammedis` (
  `id` int(11) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `idantrian_id` int(11) NOT NULL,
  `iddokter_id` int(11) DEFAULT NULL,
  `idpendaftaran_id` int(11) NOT NULL,
  `rawat_inap` varchar(1) NOT NULL,
  `idRawatInap_id` int(11) DEFAULT NULL,
  `id_diagnosa_id` int(11) DEFAULT NULL,
  `id_diagnosa2_id` int(11) DEFAULT NULL,
  `id_diagnosa3_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter_rekammedis`
--

INSERT INTO `dokter_rekammedis` (`id`, `updated_on`, `created_on`, `idantrian_id`, `iddokter_id`, `idpendaftaran_id`, `rawat_inap`, `idRawatInap_id`, `id_diagnosa_id`, `id_diagnosa2_id`, `id_diagnosa3_id`) VALUES
(1, '2022-08-14 14:11:21.598331', '2022-08-14 09:55:48.846505', 1, NULL, 1, 't', NULL, 2, 1, NULL),
(2, '2022-08-14 10:03:26.504639', '2022-08-14 10:03:26.504639', 1, NULL, 1, 'y', 1, 2, NULL, NULL),
(3, '2022-08-15 07:35:39.710751', '2022-08-15 07:12:17.055652', 2, NULL, 2, 'y', NULL, 39, NULL, NULL),
(4, '2022-08-16 04:14:53.723909', '2022-08-16 01:00:09.779904', 3, NULL, 3, 'y', NULL, 39, NULL, NULL),
(5, '2022-08-16 01:51:24.374813', '2022-08-16 01:51:24.374813', 3, NULL, 3, 'y', 3, 39, NULL, NULL),
(6, '2022-08-16 04:12:35.845376', '2022-08-16 04:12:35.845376', 4, NULL, 4, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dokter_temp_obat`
--

CREATE TABLE `dokter_temp_obat` (
  `id` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `nama_obat` longtext DEFAULT NULL,
  `jumlah_obat` bigint(20) NOT NULL,
  `harga_obat` bigint(20) NOT NULL,
  `url` longtext DEFAULT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pasien_daerah`
--

CREATE TABLE `pasien_daerah` (
  `id` int(11) NOT NULL,
  `nama_daerah` varchar(200) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien_daerah`
--

INSERT INTO `pasien_daerah` (`id`, `nama_daerah`, `updated_on`, `created_on`) VALUES
(1, 'Daerah Sunan Gunung Jati | Wilayah Syeikh Ibrahim Asmoroqondi (A)', '2022-08-14 09:55:04.001623', '2022-08-14 09:55:04.001623'),
(2, 'Daerah Sunan Kalijaga | Wilayah Syeikh Ibrahim Asmoroqondi (A)', '2022-08-14 11:31:27.319086', '2022-08-14 11:31:15.132194'),
(3, 'Daerah Sunan Kudus | Wilayah Syeikh Ibrahim Asmoroqondi (A)', '2022-08-14 11:31:38.887306', '2022-08-14 11:31:38.887306'),
(4, 'Daerah I\'dadiyah SLTP | Wilayah Syekh Maulana Malik Ibrahim (B)', '2022-08-14 11:31:53.688474', '2022-08-14 11:31:53.688474'),
(5, 'Daerah I\'dadiyah SLTP | Wilayah Syekh Maulana Malik Ibrahim (B)', '2022-08-14 11:31:59.906711', '2022-08-14 11:31:59.906711'),
(6, 'Daerah Sunan Bonang | Maulana Syekh Maulana Ishaq (C)', '2022-08-14 11:32:15.688273', '2022-08-14 11:32:15.688273'),
(7, 'Daerah Sunan Giri | Maulana Syekh Maulana Ishaq (C)', '2022-08-14 11:32:25.738572', '2022-08-14 11:32:25.738572'),
(8, 'Daerah Sunan Muria | Maulana Syekh Maulana Ishaq (C)', '2022-08-14 11:32:46.567644', '2022-08-14 11:32:46.571625'),
(9, 'Daerah Nawawi Al-Bantani | Wilayah Syeikh Jumadil Kubro (D)', '2022-08-14 11:32:55.916723', '2022-08-14 11:32:55.916723'),
(10, 'Daerah Abu Hasan Asy-Syadzili | Wilayah Syeikh Jumadil Kubro (D)', '2022-08-14 11:33:06.605078', '2022-08-14 11:33:06.605078'),
(11, 'Daerah Abu Aswad Ad-Du\'ali (Diniyah) | Wilayah Syeikh Jumadil Kubro (D)', '2022-08-14 11:33:15.990363', '2022-08-14 11:33:15.990363'),
(12, 'Daerah Abu Hasan Asy-Syadzili | Wilayah Syeikh Jumadil Kubro (D)', '2022-08-14 11:33:40.244962', '2022-08-14 11:33:40.244962'),
(13, 'Daerah Yasin Al-Fadani (PPIQ Tahsin) | Wilayah Syeikh Jumadil Kubro (D)', '2022-08-14 11:33:48.944540', '2022-08-14 11:33:48.944540'),
(14, 'Daerah Sa\'id Al-Makki Al-Manduri (PPIQ Tahfidz) | Wilayah Syeikh Jumadil Kubro (D)', '2022-08-14 11:33:58.072719', '2022-08-14 11:33:58.072719'),
(15, 'Daerah KH. Zaini Mun\'im  | Wilayah Syeikh Jumadil Kubro (D)', '2022-08-14 11:34:07.139316', '2022-08-14 11:34:07.139316'),
(16, 'Sayyidah Hafsoh (A) | Wilayah Az-Zainiyah', '2022-08-14 11:35:24.767019', '2022-08-14 11:35:24.767019'),
(17, 'Robiatul Adawiyah (B) | Wilayah Az-Zainiyah', '2022-08-14 11:35:48.384129', '2022-08-14 11:35:48.384129'),
(18, 'Aminatuz Zuhriyah (C) | Wilayah Az-Zainiyah', '2022-08-14 11:35:55.296499', '2022-08-14 11:35:55.296499'),
(19, 'Sayyidah Aisyah (D) | Wilayah Az-Zainiyah', '2022-08-14 11:36:08.348689', '2022-08-14 11:36:08.348689'),
(20, 'Tsuwaibah Al-Aslamiyah ( E ) | Wilayah Az-Zainiyah', '2022-08-14 11:36:19.961186', '2022-08-14 11:36:19.961186'),
(21, 'Khodijah Al-Kubro (F)  | Wilayah Az-Zainiyah', '2022-08-14 11:36:31.868730', '2022-08-14 11:36:31.868730'),
(22, 'Sayyidah Zainab (G) | Wilayah Az-Zainiyah', '2022-08-14 11:36:51.841860', '2022-08-14 11:36:51.841860'),
(23, 'Sayyidah Saroh (H)  | Wilayah Az-Zainiyah', '2022-08-14 11:37:09.378175', '2022-08-14 11:37:09.378175'),
(24, 'Dewi Masyithah (I) | Wilayah Az-Zainiyah', '2022-08-14 11:37:17.919863', '2022-08-14 11:37:17.919863'),
(25, 'Sayyidah Maryam (J)  | Wilayah Az-Zainiyah', '2022-08-14 11:37:26.356984', '2022-08-14 11:37:26.356984'),
(26, 'Halimatus Sa\'diyah (K) | Wilayah Az-Zainiyah', '2022-08-14 11:37:36.471542', '2022-08-14 11:37:36.471542'),
(27, 'Sayyidah Ummu Salamah (L) | Wilayah Az-Zainiyah', '2022-08-14 11:37:58.981210', '2022-08-14 11:37:58.981210'),
(28, 'Sayyidah Fatimah Az-Zahro\' (M) | Wilayah Az-Zainiyah', '2022-08-14 11:38:11.629670', '2022-08-14 11:38:11.629670'),
(29, 'Daerah Khusus | Wilayah Az-Zainiyah', '2022-08-14 11:38:26.750708', '2022-08-14 11:38:26.750708'),
(30, 'Riyadlul Jinan | Wilayah Al-Hasyimiyah', '2022-08-14 11:40:21.587150', '2022-08-14 11:40:21.587150'),
(31, 'El Farodies | Wilayah Al-Hasyimiyah', '2022-08-14 11:40:28.028237', '2022-08-14 11:40:28.028237'),
(32, 'An Nuriyah | Wilayah Al-Hasyimiyah', '2022-08-14 11:40:34.794379', '2022-08-14 11:40:34.794379'),
(33, 'An Najwa  | Wilayah Al-Hasyimiyah', '2022-08-14 11:40:42.601932', '2022-08-14 11:40:42.601932'),
(34, 'Al Maziyah | Wilayah Al-Hasyimiyah', '2022-08-14 11:40:57.982763', '2022-08-14 11:40:57.982763'),
(35, 'Laila United | Wilayah Al-Hasyimiyah', '2022-08-14 11:41:05.099929', '2022-08-14 11:41:05.099929'),
(36, 'Zahroil Batul | Wilayah Al-Hasyimiyah', '2022-08-14 11:41:12.465327', '2022-08-14 11:41:12.465327'),
(37, 'As Shofwah | Wilayah Al-Hasyimiyah', '2022-08-14 11:41:18.689257', '2022-08-14 11:41:18.689257'),
(38, 'Khaula Al Azwar | Wilayah Al-Hasyimiyah', '2022-08-14 11:41:28.928592', '2022-08-14 11:41:28.928592'),
(39, 'Al Masruriyah | Wilayah Al-Hasyimiyah', '2022-08-14 11:41:39.255768', '2022-08-14 11:41:39.255768'),
(40, 'Rumaisha Al Milhany | Wilayah Al-Hasyimiyah', '2022-08-14 11:41:45.705720', '2022-08-14 11:41:45.705720'),
(41, 'Al Munawwaroh | Wilayah Al-Hasyimiyah', '2022-08-14 11:41:52.970587', '2022-08-14 11:41:52.970587'),
(42, 'Kantor Pesantren | Wilayah Al-Hasyimiyah', '2022-08-14 11:42:11.511076', '2022-08-14 11:42:11.511076'),
(43, 'Kantor BK | Wilayah Al-Hasyimiyah', '2022-08-14 11:42:18.123068', '2022-08-14 11:42:18.123068'),
(44, 'Kantor IT | Wilayah Al-Hasyimiyah', '2022-08-14 11:42:45.614731', '2022-08-14 11:42:45.614731'),
(45, 'Kantor Keamanan | Wilayah Al-Hasyimiyah', '2022-08-14 11:42:54.492795', '2022-08-14 11:42:54.492795'),
(46, 'Kantor BPA | Wilayah Al-Hasyimiyah', '2022-08-14 11:43:01.113453', '2022-08-14 11:43:01.113453'),
(47, 'Koperasi | Wilayah Al-Hasyimiyah', '2022-08-14 11:43:11.507931', '2022-08-14 11:43:11.507931'),
(48, 'Wilayah Fatimatuz Zahroh', '2022-08-14 11:43:54.545430', '2022-08-14 11:43:54.545430'),
(49, 'Wilayah Jalaluddin Ar-Rumi', '2022-08-14 11:44:02.897290', '2022-08-14 11:44:02.897290'),
(50, 'Wilayah Al-Mawaddah', '2022-08-14 11:44:06.955996', '2022-08-14 11:44:06.955996'),
(51, 'Wilayah Al-Amiri', '2022-08-14 11:44:21.577757', '2022-08-14 11:44:21.577757'),
(52, 'Wilayah Al-Lathifiyah', '2022-08-14 11:45:27.107892', '2022-08-14 11:45:27.107892'),
(53, 'Zaid bin Tsabit | Putra', '2022-08-14 11:45:40.711599', '2022-08-14 11:45:33.643799'),
(54, 'Zaid bin Tsabit | Putri', '2022-08-14 11:46:00.491225', '2022-08-14 11:45:54.910415'),
(55, 'Wilayah An-Nafi\'iyah', '2022-08-14 11:46:09.706927', '2022-08-14 11:46:09.706927'),
(56, 'Luaran', '2022-08-14 15:29:13.556166', '2022-08-14 15:29:13.556166'),
(57, 'Karyawan', '2022-08-17 06:10:04.512454', '2022-08-14 15:30:42.666849');

-- --------------------------------------------------------

--
-- Table structure for table `pasien_lembaga`
--

CREATE TABLE `pasien_lembaga` (
  `id` int(11) NOT NULL,
  `nama_lembaga` varchar(200) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien_lembaga`
--

INSERT INTO `pasien_lembaga` (`id`, `nama_lembaga`, `updated_on`, `created_on`) VALUES
(1, 'Universitas Nurul Jadid', '2022-08-14 09:55:11.010529', '2022-08-14 09:55:11.010529'),
(2, 'SMA Nurul Jadid', '2022-08-14 15:20:45.772662', '2022-08-14 15:20:45.772662'),
(3, 'MA Nurul Jadid', '2022-08-14 15:21:33.635216', '2022-08-14 15:21:33.635216'),
(4, 'SMK Nurul Jadid', '2022-08-14 15:21:37.703089', '2022-08-14 15:21:37.703089'),
(5, 'MAN 1 Probolinggo', '2022-08-14 15:21:41.662048', '2022-08-14 15:21:41.662048'),
(6, 'SMP Nurul Jadid', '2022-08-14 15:21:56.423822', '2022-08-14 15:21:56.423822'),
(7, 'MTs Nurul Jadid', '2022-08-14 15:22:00.522414', '2022-08-14 15:22:00.522414'),
(8, 'MTs Negeri Paiton', '2022-08-14 15:22:05.032808', '2022-08-14 15:22:05.032808'),
(9, 'Tidak Ada', '2022-08-17 06:10:20.177595', '2022-08-14 15:30:50.223449');

-- --------------------------------------------------------

--
-- Table structure for table `pasien_pasien`
--

CREATE TABLE `pasien_pasien` (
  `id` int(11) NOT NULL,
  `norm` varchar(25) NOT NULL,
  `namapasien` varchar(200) NOT NULL,
  `ttl` date NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `golongan_darah` varchar(10) NOT NULL,
  `alamat` longtext NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `daerah_id` int(11) NOT NULL,
  `lembaga_id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien_pasien`
--

INSERT INTO `pasien_pasien` (`id`, `norm`, `namapasien`, `ttl`, `jenis_kelamin`, `golongan_darah`, `alamat`, `notelp`, `updated_on`, `created_on`, `daerah_id`, `lembaga_id`, `status`) VALUES
(1, 'AZ13202208141655', 'Moh. Nuris', '2022-08-14', 'pria', 'A', 'Jetis Bondowoso', '082232418137', '2022-08-14 14:43:53.161031', '2022-08-14 09:55:40.741180', 1, 1, 'Santri'),
(2, 'AZ87202208142149', 'Ahmad Fauzan', '2000-09-20', 'pria', 'A', 'Tamanan Bondowoso', '-', '2022-08-14 15:22:15.412879', '2022-08-14 15:20:05.254839', 49, 1, 'Santri'),
(3, 'AZ94202208142224', 'Vivian Robianti', '1998-11-08', 'wanita', 'A', 'Paiton Probolinggo', '-', '2022-08-14 15:25:49.361303', '2022-08-14 15:25:49.361303', 39, 1, 'Santri'),
(4, 'AZ35202208142229', 'Nurul Huda', '1995-08-18', 'pria', 'B', 'Besuki Probolinggo', '-', '2022-08-14 15:30:20.462592', '2022-08-14 15:30:20.462592', 56, 8, 'UMUM');

-- --------------------------------------------------------

--
-- Table structure for table `pegawaiadmin_antrian`
--

CREATE TABLE `pegawaiadmin_antrian` (
  `id` int(11) NOT NULL,
  `noantrian` int(11) NOT NULL,
  `statusdokter` varchar(10) DEFAULT NULL,
  `is_dokterumum` tinyint(1) NOT NULL,
  `is_doktergigi` tinyint(1) NOT NULL,
  `is_dokterkia` tinyint(1) NOT NULL,
  `is_doktergizi` tinyint(1) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `idpendaftaran_id` int(11) NOT NULL,
  `statusapoteker` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawaiadmin_antrian`
--

INSERT INTO `pegawaiadmin_antrian` (`id`, `noantrian`, `statusdokter`, `is_dokterumum`, `is_doktergigi`, `is_dokterkia`, `is_doktergizi`, `updated_on`, `created_on`, `idpendaftaran_id`, `statusapoteker`) VALUES
(1, 1, 'belum', 1, 0, 0, 0, '2022-08-14 09:55:48.842491', '2022-08-14 09:55:48.842491', 1, NULL),
(2, 1, 'belum', 1, 0, 0, 0, '2022-08-15 07:12:17.043602', '2022-08-15 07:12:17.043602', 2, NULL),
(3, 1, 'belum', 1, 0, 0, 0, '2022-08-16 01:00:09.762429', '2022-08-16 01:00:09.762429', 3, NULL),
(4, 2, 'belum', 1, 0, 0, 0, '2022-08-16 04:12:35.837378', '2022-08-16 04:12:35.837378', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pegawaiadmin_biayapemeriksaan`
--

CREATE TABLE `pegawaiadmin_biayapemeriksaan` (
  `id` int(11) NOT NULL,
  `biaya_pemeriksaan` bigint(20) DEFAULT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pegawaiadmin_pembayaran`
--

CREATE TABLE `pegawaiadmin_pembayaran` (
  `id` int(11) NOT NULL,
  `total_harga` bigint(20) DEFAULT NULL,
  `uang_dibayarkan` bigint(20) DEFAULT NULL,
  `statusbayar` varchar(10) DEFAULT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `idpendaftaran_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pegawaiadmin_pendaftaran`
--

CREATE TABLE `pegawaiadmin_pendaftaran` (
  `id` int(11) NOT NULL,
  `gejalaawal` longtext NOT NULL,
  `tujuanpoli` varchar(20) DEFAULT NULL,
  `tglantrian` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `norm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawaiadmin_pendaftaran`
--

INSERT INTO `pegawaiadmin_pendaftaran` (`id`, `gejalaawal`, `tujuanpoli`, `tglantrian`, `updated_on`, `created_on`, `norm_id`) VALUES
(1, 'Panas', 'Poli Umum', '2022-08-14 09:55:48.810498', '2022-08-14 09:57:36.177482', '2022-08-14 09:55:48.834490', 1),
(2, 'kurang makan', 'Poli Umum', '2022-08-15 07:12:17.031584', '2022-08-15 16:40:33.480421', '2022-08-15 07:12:17.035584', 2),
(3, 'panas dan sering mules', 'Poli Umum', '2022-08-16 01:00:09.748666', '2022-08-16 01:02:05.666371', '2022-08-16 01:00:09.752319', 4),
(4, 'panas', 'Poli Umum', '2022-08-16 04:12:35.769399', '2022-08-16 04:13:04.944847', '2022-08-16 04:12:35.805390', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun_akun`
--
ALTER TABLE `akun_akun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `akun_akun_akun_id_ae201a11_fk_akun_user_id` (`akun_id`),
  ADD KEY `akun_akun_pegawai_id_bfd21e78_fk_akun_datapegawai_id` (`pegawai_id`);

--
-- Indexes for table `akun_datapegawai`
--
ALTER TABLE `akun_datapegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `akun_user`
--
ALTER TABLE `akun_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `akun_user_groups`
--
ALTER TABLE `akun_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `akun_user_groups_user_id_group_id_48e2c11b_uniq` (`user_id`,`group_id`),
  ADD KEY `akun_user_groups_group_id_fcb717dd_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `akun_user_user_permissions`
--
ALTER TABLE `akun_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `akun_user_user_permissions_user_id_permission_id_420c1e07_uniq` (`user_id`,`permission_id`),
  ADD KEY `akun_user_user_permi_permission_id_0b18c30f_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_akun_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `dokter_diagnosa`
--
ALTER TABLE `dokter_diagnosa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dokter_rawatinap`
--
ALTER TABLE `dokter_rawatinap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokter_rawatinap_idantrian_id_1281a798_fk_pegawaiad` (`idantrian_id`),
  ADD KEY `dokter_rawatinap_iddokter_id_94b5603a_fk_akun_user_id` (`iddokter_id`),
  ADD KEY `dokter_rawatinap_idpendaftaran_id_74eb6582_fk_pegawaiad` (`idpendaftaran_id`);

--
-- Indexes for table `dokter_rekammedis`
--
ALTER TABLE `dokter_rekammedis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokter_rekammedis_idantrian_id_6fc59e25_fk_pegawaiad` (`idantrian_id`),
  ADD KEY `dokter_rekammedis_iddokter_id_931fb9cb_fk_akun_user_id` (`iddokter_id`),
  ADD KEY `dokter_rekammedis_idpendaftaran_id_c0a334a2_fk_pegawaiad` (`idpendaftaran_id`),
  ADD KEY `dokter_rekammedis_idRawatInap_id_d04bbe3d_fk_dokter_rawatinap_id` (`idRawatInap_id`),
  ADD KEY `dokter_rekammedis_id_diagnosa_id_0f20f0e2_fk_dokter_diagnosa_id` (`id_diagnosa_id`),
  ADD KEY `dokter_rekammedis_id_diagnosa2_id_dad74e37_fk_dokter_diagnosa_id` (`id_diagnosa2_id`),
  ADD KEY `dokter_rekammedis_id_diagnosa3_id_18678b77_fk_dokter_diagnosa_id` (`id_diagnosa3_id`);

--
-- Indexes for table `dokter_temp_obat`
--
ALTER TABLE `dokter_temp_obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien_daerah`
--
ALTER TABLE `pasien_daerah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien_lembaga`
--
ALTER TABLE `pasien_lembaga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien_pasien`
--
ALTER TABLE `pasien_pasien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `norm` (`norm`),
  ADD KEY `pasien_pasien_daerah_id_dfc5bf51_fk_pasien_daerah_id` (`daerah_id`),
  ADD KEY `pasien_pasien_lembaga_id_929e7019_fk_pasien_lembaga_id` (`lembaga_id`);

--
-- Indexes for table `pegawaiadmin_antrian`
--
ALTER TABLE `pegawaiadmin_antrian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idpendaftaran_id` (`idpendaftaran_id`);

--
-- Indexes for table `pegawaiadmin_biayapemeriksaan`
--
ALTER TABLE `pegawaiadmin_biayapemeriksaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawaiadmin_pembayaran`
--
ALTER TABLE `pegawaiadmin_pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idpendaftaran_id` (`idpendaftaran_id`);

--
-- Indexes for table `pegawaiadmin_pendaftaran`
--
ALTER TABLE `pegawaiadmin_pendaftaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pegawaiadmin_pendaftaran_norm_id_88012874_fk_pasien_pasien_id` (`norm_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun_akun`
--
ALTER TABLE `akun_akun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `akun_datapegawai`
--
ALTER TABLE `akun_datapegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `akun_user`
--
ALTER TABLE `akun_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `akun_user_groups`
--
ALTER TABLE `akun_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `akun_user_user_permissions`
--
ALTER TABLE `akun_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `dokter_diagnosa`
--
ALTER TABLE `dokter_diagnosa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `dokter_rawatinap`
--
ALTER TABLE `dokter_rawatinap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dokter_rekammedis`
--
ALTER TABLE `dokter_rekammedis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dokter_temp_obat`
--
ALTER TABLE `dokter_temp_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pasien_daerah`
--
ALTER TABLE `pasien_daerah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `pasien_lembaga`
--
ALTER TABLE `pasien_lembaga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pasien_pasien`
--
ALTER TABLE `pasien_pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pegawaiadmin_antrian`
--
ALTER TABLE `pegawaiadmin_antrian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pegawaiadmin_biayapemeriksaan`
--
ALTER TABLE `pegawaiadmin_biayapemeriksaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawaiadmin_pembayaran`
--
ALTER TABLE `pegawaiadmin_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawaiadmin_pendaftaran`
--
ALTER TABLE `pegawaiadmin_pendaftaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `akun_akun`
--
ALTER TABLE `akun_akun`
  ADD CONSTRAINT `akun_akun_akun_id_ae201a11_fk_akun_user_id` FOREIGN KEY (`akun_id`) REFERENCES `akun_user` (`id`),
  ADD CONSTRAINT `akun_akun_pegawai_id_bfd21e78_fk_akun_datapegawai_id` FOREIGN KEY (`pegawai_id`) REFERENCES `akun_datapegawai` (`id`);

--
-- Constraints for table `akun_user_groups`
--
ALTER TABLE `akun_user_groups`
  ADD CONSTRAINT `akun_user_groups_group_id_fcb717dd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `akun_user_groups_user_id_de432874_fk_akun_user_id` FOREIGN KEY (`user_id`) REFERENCES `akun_user` (`id`);

--
-- Constraints for table `akun_user_user_permissions`
--
ALTER TABLE `akun_user_user_permissions`
  ADD CONSTRAINT `akun_user_user_permi_permission_id_0b18c30f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `akun_user_user_permissions_user_id_d6b38c73_fk_akun_user_id` FOREIGN KEY (`user_id`) REFERENCES `akun_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_akun_user_id` FOREIGN KEY (`user_id`) REFERENCES `akun_user` (`id`);

--
-- Constraints for table `dokter_rawatinap`
--
ALTER TABLE `dokter_rawatinap`
  ADD CONSTRAINT `dokter_rawatinap_idantrian_id_1281a798_fk_pegawaiad` FOREIGN KEY (`idantrian_id`) REFERENCES `pegawaiadmin_antrian` (`id`),
  ADD CONSTRAINT `dokter_rawatinap_iddokter_id_94b5603a_fk_akun_user_id` FOREIGN KEY (`iddokter_id`) REFERENCES `akun_user` (`id`),
  ADD CONSTRAINT `dokter_rawatinap_idpendaftaran_id_74eb6582_fk_pegawaiad` FOREIGN KEY (`idpendaftaran_id`) REFERENCES `pegawaiadmin_pendaftaran` (`id`);

--
-- Constraints for table `dokter_rekammedis`
--
ALTER TABLE `dokter_rekammedis`
  ADD CONSTRAINT `dokter_rekammedis_idRawatInap_id_d04bbe3d_fk_dokter_rawatinap_id` FOREIGN KEY (`idRawatInap_id`) REFERENCES `dokter_rawatinap` (`id`),
  ADD CONSTRAINT `dokter_rekammedis_id_diagnosa2_id_dad74e37_fk_dokter_diagnosa_id` FOREIGN KEY (`id_diagnosa2_id`) REFERENCES `dokter_diagnosa` (`id`),
  ADD CONSTRAINT `dokter_rekammedis_id_diagnosa3_id_18678b77_fk_dokter_diagnosa_id` FOREIGN KEY (`id_diagnosa3_id`) REFERENCES `dokter_diagnosa` (`id`),
  ADD CONSTRAINT `dokter_rekammedis_id_diagnosa_id_0f20f0e2_fk_dokter_diagnosa_id` FOREIGN KEY (`id_diagnosa_id`) REFERENCES `dokter_diagnosa` (`id`),
  ADD CONSTRAINT `dokter_rekammedis_idantrian_id_6fc59e25_fk_pegawaiad` FOREIGN KEY (`idantrian_id`) REFERENCES `pegawaiadmin_antrian` (`id`),
  ADD CONSTRAINT `dokter_rekammedis_iddokter_id_931fb9cb_fk_akun_user_id` FOREIGN KEY (`iddokter_id`) REFERENCES `akun_user` (`id`),
  ADD CONSTRAINT `dokter_rekammedis_idpendaftaran_id_c0a334a2_fk_pegawaiad` FOREIGN KEY (`idpendaftaran_id`) REFERENCES `pegawaiadmin_pendaftaran` (`id`);

--
-- Constraints for table `pasien_pasien`
--
ALTER TABLE `pasien_pasien`
  ADD CONSTRAINT `pasien_pasien_daerah_id_dfc5bf51_fk_pasien_daerah_id` FOREIGN KEY (`daerah_id`) REFERENCES `pasien_daerah` (`id`),
  ADD CONSTRAINT `pasien_pasien_lembaga_id_929e7019_fk_pasien_lembaga_id` FOREIGN KEY (`lembaga_id`) REFERENCES `pasien_lembaga` (`id`);

--
-- Constraints for table `pegawaiadmin_antrian`
--
ALTER TABLE `pegawaiadmin_antrian`
  ADD CONSTRAINT `pegawaiadmin_antrian_idpendaftaran_id_b3ec1e15_fk_pegawaiad` FOREIGN KEY (`idpendaftaran_id`) REFERENCES `pegawaiadmin_pendaftaran` (`id`);

--
-- Constraints for table `pegawaiadmin_pembayaran`
--
ALTER TABLE `pegawaiadmin_pembayaran`
  ADD CONSTRAINT `pegawaiadmin_pembaya_idpendaftaran_id_b3b54feb_fk_pegawaiad` FOREIGN KEY (`idpendaftaran_id`) REFERENCES `pegawaiadmin_pendaftaran` (`id`);

--
-- Constraints for table `pegawaiadmin_pendaftaran`
--
ALTER TABLE `pegawaiadmin_pendaftaran`
  ADD CONSTRAINT `pegawaiadmin_pendaftaran_norm_id_88012874_fk_pasien_pasien_id` FOREIGN KEY (`norm_id`) REFERENCES `pasien_pasien` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
