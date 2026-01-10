-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2026 at 12:50 AM
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
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `grade_id` bigint(20) UNSIGNED NOT NULL,
  `classroom_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `attendence_date` date NOT NULL,
  `attendence_status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `classrooms`
--

CREATE TABLE `classrooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name_Class` varchar(255) NOT NULL,
  `Grade_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classrooms`
--

INSERT INTO `classrooms` (`id`, `Name_Class`, `Grade_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"First grade\",\"ar\":\"الصف الاول\"}', 2, '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(2, '{\"en\":\"Second grade\",\"ar\":\"الصف الثاني\"}', 2, '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(3, '{\"en\":\"Third grade\",\"ar\":\"الصف الثالث\"}', 3, '2026-01-09 21:44:09', '2026-01-09 21:44:09');

-- --------------------------------------------------------

--
-- Table structure for table `degrees`
--

CREATE TABLE `degrees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quizze_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `score` double NOT NULL,
  `abuse` enum('0','1') NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `start` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `Grade_id` bigint(20) UNSIGNED NOT NULL,
  `Classroom_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `year` varchar(255) NOT NULL,
  `Fee_type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_invoices`
--

CREATE TABLE `fee_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_date` date NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `Grade_id` bigint(20) UNSIGNED NOT NULL,
  `Classroom_id` bigint(20) UNSIGNED NOT NULL,
  `fee_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fund_accounts`
--

CREATE TABLE `fund_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `receipt_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `Debit` decimal(8,2) DEFAULT NULL,
  `credit` decimal(8,2) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `Name`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Male\",\"ar\":\"ذكر\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(2, '{\"en\":\"Female\",\"ar\":\"انثي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `created_at`, `updated_at`, `Name`, `Notes`) VALUES
(1, '2026-01-09 21:44:09', '2026-01-09 21:44:09', '{\"en\":\"Primary stage\",\"ar\":\"المرحلة الابتدائية\"}', NULL),
(2, '2026-01-09 21:44:09', '2026-01-09 21:44:09', '{\"en\":\"middle School\",\"ar\":\"المرحلة الاعدادية\"}', NULL),
(3, '2026-01-09 21:44:09', '2026-01-09 21:44:09', '{\"en\":\"High school\",\"ar\":\"المرحلة الثانوية\"}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `imageable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `Grade_id` bigint(20) UNSIGNED NOT NULL,
  `Classroom_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2021_01_15_184804_create_Grades_table', 1),
(6, '2021_01_23_181414_create_Classrooms_table', 1),
(7, '2021_02_10_182227_create_sections_table', 1),
(8, '2021_02_17_191528_create_type__bloods_table', 1),
(9, '2021_02_17_192846_create_nationalities_table', 1),
(10, '2021_02_17_193627_create_religions_table', 1),
(11, '2021_02_23_191411_create_my__parents_table', 1),
(12, '2021_03_04_110235_create_parent_attachments_table', 1),
(13, '2021_03_05_181424_create_foreign_keys', 1),
(14, '2021_03_17_175656_create_genders_table', 1),
(15, '2021_03_17_175840_create_specializations_table', 1),
(16, '2021_03_18_174036_create_teachers_table', 1),
(17, '2021_03_28_155234_create_teacher_section_table', 1),
(18, '2021_04_10_181456_create_students_table', 1),
(19, '2021_04_28_195145_create_images_table', 1),
(20, '2021_05_11_193939_create_promotions_table', 1),
(21, '2021_06_01_174202_create_fees_table', 1),
(22, '2021_06_08_161640_create_fee_invoices_table', 1),
(23, '2021_06_08_163221_create_receipt_students_table', 1),
(24, '2021_06_08_181651_create_processing_fees_table', 1),
(25, '2021_06_08_181848_create_payment_students_table', 1),
(26, '2021_06_09_161830_create_student_accounts_table', 1),
(27, '2021_06_21_165112_create_fund_accounts_table', 1),
(28, '2021_07_16_185459_create_attendances_table', 1),
(29, '2021_07_28_192715_create_subjects_table', 1),
(30, '2021_08_13_132334_create_quizzes_table', 1),
(31, '2021_08_23_190623_create_questions_table', 1),
(32, '2021_10_23_180609_create_online_classes_table', 1),
(33, '2025_07_08_124007_create_libraries_table', 1),
(34, '2025_07_08_175941_create_settings_table', 1),
(35, '2025_07_19_150143_create_events_table', 1),
(36, '2025_07_21_181903_create_degrees_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `my__parents`
--

CREATE TABLE `my__parents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Name_Father` varchar(255) NOT NULL,
  `National_ID_Father` varchar(255) NOT NULL,
  `Passport_ID_Father` varchar(255) NOT NULL,
  `Phone_Father` varchar(255) NOT NULL,
  `Job_Father` varchar(255) NOT NULL,
  `Nationality_Father_id` bigint(20) UNSIGNED NOT NULL,
  `Blood_Type_Father_id` bigint(20) UNSIGNED NOT NULL,
  `Religion_Father_id` bigint(20) UNSIGNED NOT NULL,
  `Address_Father` varchar(255) NOT NULL,
  `Name_Mother` varchar(255) NOT NULL,
  `National_ID_Mother` varchar(255) NOT NULL,
  `Passport_ID_Mother` varchar(255) NOT NULL,
  `Phone_Mother` varchar(255) NOT NULL,
  `Job_Mother` varchar(255) NOT NULL,
  `Nationality_Mother_id` bigint(20) UNSIGNED NOT NULL,
  `Blood_Type_Mother_id` bigint(20) UNSIGNED NOT NULL,
  `Religion_Mother_id` bigint(20) UNSIGNED NOT NULL,
  `Address_Mother` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `my__parents`
--

INSERT INTO `my__parents` (`id`, `email`, `password`, `Name_Father`, `National_ID_Father`, `Passport_ID_Father`, `Phone_Father`, `Job_Father`, `Nationality_Father_id`, `Blood_Type_Father_id`, `Religion_Father_id`, `Address_Father`, `Name_Mother`, `National_ID_Mother`, `Passport_ID_Mother`, `Phone_Mother`, `Job_Mother`, `Nationality_Mother_id`, `Blood_Type_Mother_id`, `Religion_Mother_id`, `Address_Mother`, `created_at`, `updated_at`) VALUES
(1, 'samir.gamal77@yahoo.com', '$2y$12$sYWV0UsEWDug3CgJtzIpnODWf3274BQj2GJxDTqqWUidxuN0qUnuC', '{\"en\":\"samirgamal\",\"ar\":\"سمير جمال\"}', '1234567810', '1234567810', '1234567810', '{\"en\":\"programmer\",\"ar\":\"مبرمج\"}', 66, 4, 2, 'القاهرة', '{\"en\":\"SS\",\"ar\":\"سس\"}', '1234567810', '1234567810', '1234567810', '{\"en\":\"Teacher\",\"ar\":\"معلمة\"}', 137, 1, 3, 'القاهرة', '2026-01-09 21:44:11', '2026-01-09 21:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `nationalities`
--

CREATE TABLE `nationalities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nationalities`
--

INSERT INTO `nationalities` (`id`, `Name`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Afghan\",\"ar\":\"أفغانستاني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(2, '{\"en\":\"Albanian\",\"ar\":\"ألباني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(3, '{\"en\":\"Aland Islander\",\"ar\":\"آلاندي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(4, '{\"en\":\"Algerian\",\"ar\":\"جزائري\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(5, '{\"en\":\"American Samoan\",\"ar\":\"أمريكي سامواني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(6, '{\"en\":\"Andorran\",\"ar\":\"أندوري\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(7, '{\"en\":\"Angolan\",\"ar\":\"أنقولي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(8, '{\"en\":\"Anguillan\",\"ar\":\"أنغويلي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(9, '{\"en\":\"Antarctican\",\"ar\":\"أنتاركتيكي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(10, '{\"en\":\"Antiguan\",\"ar\":\"بربودي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(11, '{\"en\":\"Argentinian\",\"ar\":\"أرجنتيني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(12, '{\"en\":\"Armenian\",\"ar\":\"أرميني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(13, '{\"en\":\"Aruban\",\"ar\":\"أوروبهيني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(14, '{\"en\":\"Australian\",\"ar\":\"أسترالي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(15, '{\"en\":\"Austrian\",\"ar\":\"نمساوي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(16, '{\"en\":\"Azerbaijani\",\"ar\":\"أذربيجاني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(17, '{\"en\":\"Bahamian\",\"ar\":\"باهاميسي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(18, '{\"en\":\"Bahraini\",\"ar\":\"بحريني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(19, '{\"en\":\"Bangladeshi\",\"ar\":\"بنغلاديشي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(20, '{\"en\":\"Barbadian\",\"ar\":\"بربادوسي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(21, '{\"en\":\"Belarusian\",\"ar\":\"روسي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(22, '{\"en\":\"Belgian\",\"ar\":\"بلجيكي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(23, '{\"en\":\"Belizean\",\"ar\":\"بيليزي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(24, '{\"en\":\"Beninese\",\"ar\":\"بنيني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(25, '{\"en\":\"Saint Barthelmian\",\"ar\":\"سان بارتيلمي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(26, '{\"en\":\"Bermudan\",\"ar\":\"برمودي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(27, '{\"en\":\"Bhutanese\",\"ar\":\"بوتاني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(28, '{\"en\":\"Bolivian\",\"ar\":\"بوليفي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(29, '{\"en\":\"Bosnian / Herzegovinian\",\"ar\":\"بوسني/هرسكي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(30, '{\"en\":\"Botswanan\",\"ar\":\"بوتسواني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(31, '{\"en\":\"Bouvetian\",\"ar\":\"بوفيهي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(32, '{\"en\":\"Brazilian\",\"ar\":\"برازيلي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(33, '{\"en\":\"British Indian Ocean Territory\",\"ar\":\"إقليم المحيط الهندي البريطاني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(34, '{\"en\":\"Bruneian\",\"ar\":\"بروني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(35, '{\"en\":\"Bulgarian\",\"ar\":\"بلغاري\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(36, '{\"en\":\"Burkinabe\",\"ar\":\"بوركيني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(37, '{\"en\":\"Burundian\",\"ar\":\"بورونيدي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(38, '{\"en\":\"Cambodian\",\"ar\":\"كمبودي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(39, '{\"en\":\"Cameroonian\",\"ar\":\"كاميروني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(40, '{\"en\":\"Canadian\",\"ar\":\"كندي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(41, '{\"en\":\"Cape Verdean\",\"ar\":\"الرأس الأخضر\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(42, '{\"en\":\"Caymanian\",\"ar\":\"كايماني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(43, '{\"en\":\"Central African\",\"ar\":\"أفريقي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(44, '{\"en\":\"Chadian\",\"ar\":\"تشادي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(45, '{\"en\":\"Chilean\",\"ar\":\"شيلي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(46, '{\"en\":\"Chinese\",\"ar\":\"صيني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(47, '{\"en\":\"Christmas Islander\",\"ar\":\"جزيرة عيد الميلاد\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(48, '{\"en\":\"Cocos Islander\",\"ar\":\"جزر كوكوس\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(49, '{\"en\":\"Colombian\",\"ar\":\"كولومبي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(50, '{\"en\":\"Comorian\",\"ar\":\"جزر القمر\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(51, '{\"en\":\"Congolese\",\"ar\":\"كونغي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(52, '{\"en\":\"Cook Islander\",\"ar\":\"جزر كوك\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(53, '{\"en\":\"Costa Rican\",\"ar\":\"كوستاريكي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(54, '{\"en\":\"Croatian\",\"ar\":\"كوراتي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(55, '{\"en\":\"Cuban\",\"ar\":\"كوبي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(56, '{\"en\":\"Cypriot\",\"ar\":\"قبرصي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(57, '{\"en\":\"Curacian\",\"ar\":\"كوراساوي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(58, '{\"en\":\"Czech\",\"ar\":\"تشيكي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(59, '{\"en\":\"Danish\",\"ar\":\"دنماركي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(60, '{\"en\":\"Djiboutian\",\"ar\":\"جيبوتي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(61, '{\"en\":\"Dominican\",\"ar\":\"دومينيكي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(62, '{\"en\":\"Dominican\",\"ar\":\"دومينيكي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(63, '{\"en\":\"Ecuadorian\",\"ar\":\"إكوادوري\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(64, '{\"en\":\"Egyptian\",\"ar\":\"مصري\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(65, '{\"en\":\"Salvadoran\",\"ar\":\"سلفادوري\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(66, '{\"en\":\"Equatorial Guinean\",\"ar\":\"غيني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(67, '{\"en\":\"Eritrean\",\"ar\":\"إريتيري\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(68, '{\"en\":\"Estonian\",\"ar\":\"استوني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(69, '{\"en\":\"Ethiopian\",\"ar\":\"أثيوبي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(70, '{\"en\":\"Falkland Islander\",\"ar\":\"فوكلاندي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(71, '{\"en\":\"Faroese\",\"ar\":\"جزر فارو\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(72, '{\"en\":\"Fijian\",\"ar\":\"فيجي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(73, '{\"en\":\"Finnish\",\"ar\":\"فنلندي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(74, '{\"en\":\"French\",\"ar\":\"فرنسي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(75, '{\"en\":\"French Guianese\",\"ar\":\"غويانا الفرنسية\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(76, '{\"en\":\"French Polynesian\",\"ar\":\"بولينيزيي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(77, '{\"en\":\"French\",\"ar\":\"أراض فرنسية جنوبية وأنتارتيكية\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(78, '{\"en\":\"Gabonese\",\"ar\":\"غابوني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(79, '{\"en\":\"Gambian\",\"ar\":\"غامبي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(80, '{\"en\":\"Georgian\",\"ar\":\"جيورجي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(81, '{\"en\":\"German\",\"ar\":\"ألماني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(82, '{\"en\":\"Ghanaian\",\"ar\":\"غاني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(83, '{\"en\":\"Gibraltar\",\"ar\":\"جبل طارق\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(84, '{\"en\":\"Guernsian\",\"ar\":\"غيرنزي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(85, '{\"en\":\"Greek\",\"ar\":\"يوناني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(86, '{\"en\":\"Greenlandic\",\"ar\":\"جرينلاندي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(87, '{\"en\":\"Grenadian\",\"ar\":\"غرينادي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(88, '{\"en\":\"Guadeloupe\",\"ar\":\"جزر جوادلوب\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(89, '{\"en\":\"Guamanian\",\"ar\":\"جوامي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(90, '{\"en\":\"Guatemalan\",\"ar\":\"غواتيمالي\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(91, '{\"en\":\"Guinean\",\"ar\":\"غيني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(92, '{\"en\":\"Guinea-Bissauan\",\"ar\":\"غيني\"}', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(93, '{\"en\":\"Guyanese\",\"ar\":\"غياني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(94, '{\"en\":\"Haitian\",\"ar\":\"هايتي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(95, '{\"en\":\"Heard and Mc Donald Islanders\",\"ar\":\"جزيرة هيرد وجزر ماكدونالد\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(96, '{\"en\":\"Honduran\",\"ar\":\"هندوراسي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(97, '{\"en\":\"Hongkongese\",\"ar\":\"هونغ كونغي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(98, '{\"en\":\"Hungarian\",\"ar\":\"مجري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(99, '{\"en\":\"Icelandic\",\"ar\":\"آيسلندي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(100, '{\"en\":\"Indian\",\"ar\":\"هندي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(101, '{\"en\":\"Manx\",\"ar\":\"ماني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(102, '{\"en\":\"Indonesian\",\"ar\":\"أندونيسيي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(103, '{\"en\":\"Iranian\",\"ar\":\"إيراني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(104, '{\"en\":\"Iraqi\",\"ar\":\"عراقي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(105, '{\"en\":\"Irish\",\"ar\":\"إيرلندي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(106, '{\"en\":\"Italian\",\"ar\":\"إيطالي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(107, '{\"en\":\"Ivory Coastian\",\"ar\":\"ساحل العاج\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(108, '{\"en\":\"Jersian\",\"ar\":\"جيرزي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(109, '{\"en\":\"Jamaican\",\"ar\":\"جمايكي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(110, '{\"en\":\"Japanese\",\"ar\":\"ياباني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(111, '{\"en\":\"Jordanian\",\"ar\":\"أردني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(112, '{\"en\":\"Kazakh\",\"ar\":\"كازاخستاني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(113, '{\"en\":\"Kenyan\",\"ar\":\"كيني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(114, '{\"en\":\"I-Kiribati\",\"ar\":\"كيريباتي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(115, '{\"en\":\"North Korean\",\"ar\":\"كوري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(116, '{\"en\":\"South Korean\",\"ar\":\"كوري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(117, '{\"en\":\"Kosovar\",\"ar\":\"كوسيفي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(118, '{\"en\":\"Kuwaiti\",\"ar\":\"كويتي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(119, '{\"en\":\"Kyrgyzstani\",\"ar\":\"قيرغيزستاني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(120, '{\"en\":\"Laotian\",\"ar\":\"لاوسي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(121, '{\"en\":\"Latvian\",\"ar\":\"لاتيفي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(122, '{\"en\":\"Lebanese\",\"ar\":\"لبناني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(123, '{\"en\":\"Basotho\",\"ar\":\"ليوسيتي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(124, '{\"en\":\"Liberian\",\"ar\":\"ليبيري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(125, '{\"en\":\"Libyan\",\"ar\":\"ليبي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(126, '{\"en\":\"Liechtenstein\",\"ar\":\"ليختنشتيني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(127, '{\"en\":\"Lithuanian\",\"ar\":\"لتوانيي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(128, '{\"en\":\"Luxembourger\",\"ar\":\"لوكسمبورغي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(129, '{\"en\":\"Sri Lankian\",\"ar\":\"سريلانكي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(130, '{\"en\":\"Macanese\",\"ar\":\"ماكاوي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(131, '{\"en\":\"Macedonian\",\"ar\":\"مقدوني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(132, '{\"en\":\"Malagasy\",\"ar\":\"مدغشقري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(133, '{\"en\":\"Malawian\",\"ar\":\"مالاوي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(134, '{\"en\":\"Malaysian\",\"ar\":\"ماليزي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(135, '{\"en\":\"Maldivian\",\"ar\":\"مالديفي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(136, '{\"en\":\"Malian\",\"ar\":\"مالي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(137, '{\"en\":\"Maltese\",\"ar\":\"مالطي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(138, '{\"en\":\"Marshallese\",\"ar\":\"مارشالي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(139, '{\"en\":\"Martiniquais\",\"ar\":\"مارتينيكي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(140, '{\"en\":\"Mauritanian\",\"ar\":\"موريتانيي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(141, '{\"en\":\"Mauritian\",\"ar\":\"موريشيوسي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(142, '{\"en\":\"Mahoran\",\"ar\":\"مايوتي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(143, '{\"en\":\"Mexican\",\"ar\":\"مكسيكي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(144, '{\"en\":\"Micronesian\",\"ar\":\"مايكرونيزيي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(145, '{\"en\":\"Moldovan\",\"ar\":\"مولديفي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(146, '{\"en\":\"Monacan\",\"ar\":\"مونيكي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(147, '{\"en\":\"Mongolian\",\"ar\":\"منغولي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(148, '{\"en\":\"Montenegrin\",\"ar\":\"الجبل الأسود\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(149, '{\"en\":\"Montserratian\",\"ar\":\"مونتسيراتي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(150, '{\"en\":\"Moroccan\",\"ar\":\"مغربي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(151, '{\"en\":\"Mozambican\",\"ar\":\"موزمبيقي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(152, '{\"en\":\"Myanmarian\",\"ar\":\"ميانماري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(153, '{\"en\":\"Namibian\",\"ar\":\"ناميبي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(154, '{\"en\":\"Nauruan\",\"ar\":\"نوري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(155, '{\"en\":\"Nepalese\",\"ar\":\"نيبالي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(156, '{\"en\":\"Dutch\",\"ar\":\"هولندي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(157, '{\"en\":\"Dutch Antilier\",\"ar\":\"هولندي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(158, '{\"en\":\"New Caledonian\",\"ar\":\"كاليدوني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(159, '{\"en\":\"New Zealander\",\"ar\":\"نيوزيلندي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(160, '{\"en\":\"Nicaraguan\",\"ar\":\"نيكاراجوي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(161, '{\"en\":\"Nigerien\",\"ar\":\"نيجيري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(162, '{\"en\":\"Nigerian\",\"ar\":\"نيجيري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(163, '{\"en\":\"Niuean\",\"ar\":\"ني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(164, '{\"en\":\"Norfolk Islander\",\"ar\":\"نورفوليكي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(165, '{\"en\":\"Northern Marianan\",\"ar\":\"ماريني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(166, '{\"en\":\"Norwegian\",\"ar\":\"نرويجي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(167, '{\"en\":\"Omani\",\"ar\":\"عماني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(168, '{\"en\":\"Pakistani\",\"ar\":\"باكستاني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(169, '{\"en\":\"Palauan\",\"ar\":\"بالاوي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(170, '{\"en\":\"Palestinian\",\"ar\":\"فلسطيني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(171, '{\"en\":\"Panamanian\",\"ar\":\"بنمي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(172, '{\"en\":\"Papua New Guinean\",\"ar\":\"بابوي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(173, '{\"en\":\"Paraguayan\",\"ar\":\"بارغاوي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(174, '{\"en\":\"Peruvian\",\"ar\":\"بيري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(175, '{\"en\":\"Filipino\",\"ar\":\"فلبيني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(176, '{\"en\":\"Pitcairn Islander\",\"ar\":\"بيتكيرني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(177, '{\"en\":\"Polish\",\"ar\":\"بوليني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(178, '{\"en\":\"Portuguese\",\"ar\":\"برتغالي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(179, '{\"en\":\"Puerto Rican\",\"ar\":\"بورتي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(180, '{\"en\":\"Qatari\",\"ar\":\"قطري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(181, '{\"en\":\"Reunionese\",\"ar\":\"ريونيوني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(182, '{\"en\":\"Romanian\",\"ar\":\"روماني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(183, '{\"en\":\"Russian\",\"ar\":\"روسي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(184, '{\"en\":\"Rwandan\",\"ar\":\"رواندا\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(185, '{\"ar\":\"Kittitian/Nevisian\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(186, '{\"en\":\"St. Martian(French)\",\"ar\":\"ساينت مارتني فرنسي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(187, '{\"en\":\"St. Martian(Dutch)\",\"ar\":\"ساينت مارتني هولندي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(188, '{\"en\":\"St. Pierre and Miquelon\",\"ar\":\"سان بيير وميكلوني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(189, '{\"en\":\"Saint Vincent and the Grenadines\",\"ar\":\"سانت فنسنت وجزر غرينادين\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(190, '{\"en\":\"Samoan\",\"ar\":\"ساموي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(191, '{\"en\":\"Sammarinese\",\"ar\":\"ماريني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(192, '{\"en\":\"Sao Tomean\",\"ar\":\"ساو تومي وبرينسيبي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(193, '{\"en\":\"Saudi Arabian\",\"ar\":\"سعودي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(194, '{\"en\":\"Senegalese\",\"ar\":\"سنغالي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(195, '{\"en\":\"Serbian\",\"ar\":\"صربي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(196, '{\"en\":\"Seychellois\",\"ar\":\"سيشيلي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(197, '{\"en\":\"Sierra Leonean\",\"ar\":\"سيراليوني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(198, '{\"en\":\"Singaporean\",\"ar\":\"سنغافوري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(199, '{\"en\":\"Slovak\",\"ar\":\"سولفاكي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(200, '{\"en\":\"Slovenian\",\"ar\":\"سولفيني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(201, '{\"en\":\"Solomon Island\",\"ar\":\"جزر سليمان\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(202, '{\"en\":\"Somali\",\"ar\":\"صومالي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(203, '{\"en\":\"South African\",\"ar\":\"أفريقي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(204, '{\"en\":\"South Georgia and the South Sandwich\",\"ar\":\"لمنطقة القطبية الجنوبية\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(205, '{\"en\":\"South Sudanese\",\"ar\":\"سوادني جنوبي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(206, '{\"en\":\"Spanish\",\"ar\":\"إسباني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(207, '{\"en\":\"St. Helenian\",\"ar\":\"هيلاني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(208, '{\"en\":\"Sudanese\",\"ar\":\"سوداني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(209, '{\"en\":\"Surinamese\",\"ar\":\"سورينامي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(210, '{\"en\":\"Svalbardian/Jan Mayenian\",\"ar\":\"سفالبارد ويان ماين\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(211, '{\"en\":\"Swazi\",\"ar\":\"سوازيلندي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(212, '{\"en\":\"Swedish\",\"ar\":\"سويدي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(213, '{\"en\":\"Swiss\",\"ar\":\"سويسري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(214, '{\"en\":\"Syrian\",\"ar\":\"سوري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(215, '{\"en\":\"Taiwanese\",\"ar\":\"تايواني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(216, '{\"en\":\"Tajikistani\",\"ar\":\"طاجيكستاني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(217, '{\"en\":\"Tanzanian\",\"ar\":\"تنزانيي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(218, '{\"en\":\"Thai\",\"ar\":\"تايلندي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(219, '{\"en\":\"Timor-Lestian\",\"ar\":\"تيموري\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(220, '{\"en\":\"Togolese\",\"ar\":\"توغي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(221, '{\"en\":\"Tokelaian\",\"ar\":\"توكيلاوي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(222, '{\"en\":\"Tongan\",\"ar\":\"تونغي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(223, '{\"en\":\"Trinidadian/Tobagonian\",\"ar\":\"ترينيداد وتوباغو\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(224, '{\"en\":\"Tunisian\",\"ar\":\"تونسي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(225, '{\"en\":\"Turkish\",\"ar\":\"تركي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(226, '{\"en\":\"Turkmen\",\"ar\":\"تركمانستاني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(227, '{\"en\":\"Turks and Caicos Islands\",\"ar\":\"جزر توركس وكايكوس\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(228, '{\"en\":\"Tuvaluan\",\"ar\":\"توفالي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(229, '{\"en\":\"Ugandan\",\"ar\":\"أوغندي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(230, '{\"en\":\"Ukrainian\",\"ar\":\"أوكراني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(231, '{\"en\":\"Emirati\",\"ar\":\"إماراتي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(232, '{\"en\":\"British\",\"ar\":\"بريطاني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(233, '{\"en\":\"American\",\"ar\":\"أمريكي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(234, '{\"en\":\"US Minor Outlying Islander\",\"ar\":\"أمريكي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(235, '{\"en\":\"Uruguayan\",\"ar\":\"أورغواي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(236, '{\"en\":\"Uzbek\",\"ar\":\"أوزباكستاني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(237, '{\"en\":\"Vanuatuan\",\"ar\":\"فانواتي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(238, '{\"en\":\"Venezuelan\",\"ar\":\"فنزويلي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(239, '{\"en\":\"Vietnamese\",\"ar\":\"فيتنامي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(240, '{\"en\":\"American Virgin Islander\",\"ar\":\"أمريكي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(241, '{\"en\":\"Vatican\",\"ar\":\"فاتيكاني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(242, '{\"en\":\"Wallisian/Futunan\",\"ar\":\"فوتوني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(243, '{\"en\":\"Sahrawian\",\"ar\":\"صحراوي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(244, '{\"en\":\"Yemeni\",\"ar\":\"يمني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(245, '{\"en\":\"Zambian\",\"ar\":\"زامبياني\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(246, '{\"en\":\"Zimbabwean\",\"ar\":\"زمبابوي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `online_classes`
--

CREATE TABLE `online_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `integration` tinyint(1) NOT NULL,
  `Grade_id` bigint(20) UNSIGNED NOT NULL,
  `Classroom_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `meeting_id` varchar(255) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `start_at` datetime NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'minutes',
  `password` varchar(255) NOT NULL COMMENT 'meeting password',
  `start_url` text NOT NULL,
  `join_url` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parent_attachments`
--

CREATE TABLE `parent_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_students`
--

CREATE TABLE `payment_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `processing_fees`
--

CREATE TABLE `processing_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `from_grade` bigint(20) UNSIGNED NOT NULL,
  `from_Classroom` bigint(20) UNSIGNED NOT NULL,
  `from_section` bigint(20) UNSIGNED NOT NULL,
  `to_grade` bigint(20) UNSIGNED NOT NULL,
  `to_Classroom` bigint(20) UNSIGNED NOT NULL,
  `to_section` bigint(20) UNSIGNED NOT NULL,
  `academic_year` varchar(255) NOT NULL,
  `academic_year_new` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `answers` varchar(500) NOT NULL,
  `right_answer` varchar(500) NOT NULL,
  `score` int(11) NOT NULL,
  `quizze_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `grade_id` bigint(20) UNSIGNED NOT NULL,
  `classroom_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_students`
--

CREATE TABLE `receipt_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `Debit` decimal(8,2) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `religions`
--

CREATE TABLE `religions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `religions`
--

INSERT INTO `religions` (`id`, `Name`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Muslim\",\"ar\":\"مسلم\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(2, '{\"en\":\"Christian\",\"ar\":\"مسيحي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(3, '{\"en\":\"Other\",\"ar\":\"غيرذلك\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name_Section` varchar(255) NOT NULL,
  `Status` int(11) NOT NULL,
  `Grade_id` bigint(20) UNSIGNED NOT NULL,
  `Class_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `Name_Section`, `Status`, `Grade_id`, `Class_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"a\",\"ar\":\"ا\"}', 1, 1, 1, '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(2, '{\"en\":\"b\",\"ar\":\"ب\"}', 1, 3, 1, '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(3, '{\"en\":\"c\",\"ar\":\"ت\"}', 1, 3, 2, '2026-01-09 21:44:09', '2026-01-09 21:44:09');

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
('EK9ZVBoPKTcrFGoAm17FA7Mxpvxmas0mV957oehg', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoicnBHamlNc1hiVGlzM2VqcDJBYmg1S2ZRcmZMbXJVV1VwZXVYQjZ2cCI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2VuL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo2OiJsb2NhbGUiO3M6MjoiZW4iO30=', 1768002586);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'current_session', '2025-2026', NULL, NULL),
(2, 'school_title', 'MS', NULL, NULL),
(3, 'school_name', 'Mora Soft International Schools', NULL, NULL),
(4, 'end_first_term', '01-12-2021', NULL, NULL),
(5, 'end_second_term', '01-03-2022', NULL, NULL),
(6, 'phone', '0123456789', NULL, NULL),
(7, 'address', 'القاهرة', NULL, NULL),
(8, 'school_email', 'info@morasoft.com', NULL, NULL),
(9, 'logo', '1.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `specializations`
--

CREATE TABLE `specializations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specializations`
--

INSERT INTO `specializations` (`id`, `Name`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Arabic\",\"ar\":\"عربي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(2, '{\"en\":\"Sciences\",\"ar\":\"علوم\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(3, '{\"en\":\"Computer\",\"ar\":\"حاسب الي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10'),
(4, '{\"en\":\"English\",\"ar\":\"انجليزي\"}', '2026-01-09 21:44:10', '2026-01-09 21:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `nationalitie_id` bigint(20) UNSIGNED NOT NULL,
  `blood_id` bigint(20) UNSIGNED NOT NULL,
  `Date_Birth` date NOT NULL,
  `Grade_id` bigint(20) UNSIGNED NOT NULL,
  `Classroom_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL,
  `academic_year` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `password`, `gender_id`, `nationalitie_id`, `blood_id`, `Date_Birth`, `Grade_id`, `Classroom_id`, `section_id`, `parent_id`, `academic_year`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\":\"احمد ابراهيم\",\"en\":\"Ahmed Ibrahim\"}', 'youssef@gmail.com', '$2y$12$pJgCpATE2z6Bcd8vuPl3meG9C4oZgMKJFaVayVA7MHu2zXgfo8hpu', 1, 128, 4, '1995-01-01', 1, 1, 3, 1, '2025', NULL, '2026-01-09 21:44:11', '2026-01-09 21:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `student_accounts`
--

CREATE TABLE `student_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `type` varchar(255) NOT NULL,
  `fee_invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receipt_id` bigint(20) UNSIGNED DEFAULT NULL,
  `processing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `Debit` decimal(8,2) DEFAULT NULL,
  `credit` decimal(8,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `grade_id` bigint(20) UNSIGNED NOT NULL,
  `classroom_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Specialization_id` bigint(20) UNSIGNED NOT NULL,
  `Gender_id` bigint(20) UNSIGNED NOT NULL,
  `Joining_Date` date NOT NULL,
  `Address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_section`
--

CREATE TABLE `teacher_section` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type__bloods`
--

CREATE TABLE `type__bloods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type__bloods`
--

INSERT INTO `type__bloods` (`id`, `Name`, `created_at`, `updated_at`) VALUES
(1, 'O-', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(2, 'O+', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(3, 'A+', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(4, 'A-', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(5, 'B+', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(6, 'B-', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(7, 'AB+', '2026-01-09 21:44:09', '2026-01-09 21:44:09'),
(8, 'AB-', '2026-01-09 21:44:09', '2026-01-09 21:44:09');

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
(1, 'Youssef', 'you@gmail.com', NULL, '$2y$12$cGVnYOavSIlvMXnu2zMTC.YshuweeOkH9apSYf4OJPaMnZY1K3eV.', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_student_id_foreign` (`student_id`),
  ADD KEY `attendances_grade_id_foreign` (`grade_id`),
  ADD KEY `attendances_classroom_id_foreign` (`classroom_id`),
  ADD KEY `attendances_section_id_foreign` (`section_id`),
  ADD KEY `attendances_teacher_id_foreign` (`teacher_id`);

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
-- Indexes for table `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classrooms_grade_id_foreign` (`Grade_id`);

--
-- Indexes for table `degrees`
--
ALTER TABLE `degrees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `degrees_quizze_id_foreign` (`quizze_id`),
  ADD KEY `degrees_student_id_foreign` (`student_id`),
  ADD KEY `degrees_question_id_foreign` (`question_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_grade_id_foreign` (`Grade_id`),
  ADD KEY `fees_classroom_id_foreign` (`Classroom_id`);

--
-- Indexes for table `fee_invoices`
--
ALTER TABLE `fee_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_invoices_student_id_foreign` (`student_id`),
  ADD KEY `fee_invoices_grade_id_foreign` (`Grade_id`),
  ADD KEY `fee_invoices_classroom_id_foreign` (`Classroom_id`),
  ADD KEY `fee_invoices_fee_id_foreign` (`fee_id`);

--
-- Indexes for table `fund_accounts`
--
ALTER TABLE `fund_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fund_accounts_receipt_id_foreign` (`receipt_id`),
  ADD KEY `fund_accounts_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `library_grade_id_foreign` (`Grade_id`),
  ADD KEY `library_classroom_id_foreign` (`Classroom_id`),
  ADD KEY `library_section_id_foreign` (`section_id`),
  ADD KEY `library_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my__parents`
--
ALTER TABLE `my__parents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `my__parents_email_unique` (`email`),
  ADD KEY `my__parents_nationality_father_id_foreign` (`Nationality_Father_id`),
  ADD KEY `my__parents_blood_type_father_id_foreign` (`Blood_Type_Father_id`),
  ADD KEY `my__parents_religion_father_id_foreign` (`Religion_Father_id`),
  ADD KEY `my__parents_nationality_mother_id_foreign` (`Nationality_Mother_id`),
  ADD KEY `my__parents_blood_type_mother_id_foreign` (`Blood_Type_Mother_id`),
  ADD KEY `my__parents_religion_mother_id_foreign` (`Religion_Mother_id`);

--
-- Indexes for table `nationalities`
--
ALTER TABLE `nationalities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_classes`
--
ALTER TABLE `online_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_classes_grade_id_foreign` (`Grade_id`),
  ADD KEY `online_classes_classroom_id_foreign` (`Classroom_id`),
  ADD KEY `online_classes_section_id_foreign` (`section_id`);

--
-- Indexes for table `parent_attachments`
--
ALTER TABLE `parent_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_attachments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_students`
--
ALTER TABLE `payment_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_students_student_id_foreign` (`student_id`);

--
-- Indexes for table `processing_fees`
--
ALTER TABLE `processing_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `processing_fees_student_id_foreign` (`student_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotions_student_id_foreign` (`student_id`),
  ADD KEY `promotions_from_grade_foreign` (`from_grade`),
  ADD KEY `promotions_from_classroom_foreign` (`from_Classroom`),
  ADD KEY `promotions_from_section_foreign` (`from_section`),
  ADD KEY `promotions_to_grade_foreign` (`to_grade`),
  ADD KEY `promotions_to_classroom_foreign` (`to_Classroom`),
  ADD KEY `promotions_to_section_foreign` (`to_section`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_quizze_id_foreign` (`quizze_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quizzes_subject_id_foreign` (`subject_id`),
  ADD KEY `quizzes_grade_id_foreign` (`grade_id`),
  ADD KEY `quizzes_classroom_id_foreign` (`classroom_id`),
  ADD KEY `quizzes_section_id_foreign` (`section_id`),
  ADD KEY `quizzes_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `receipt_students`
--
ALTER TABLE `receipt_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipt_students_student_id_foreign` (`student_id`);

--
-- Indexes for table `religions`
--
ALTER TABLE `religions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_grade_id_foreign` (`Grade_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD KEY `students_gender_id_foreign` (`gender_id`),
  ADD KEY `students_nationalitie_id_foreign` (`nationalitie_id`),
  ADD KEY `students_blood_id_foreign` (`blood_id`),
  ADD KEY `students_grade_id_foreign` (`Grade_id`),
  ADD KEY `students_classroom_id_foreign` (`Classroom_id`),
  ADD KEY `students_section_id_foreign` (`section_id`),
  ADD KEY `students_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `student_accounts`
--
ALTER TABLE `student_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_accounts_fee_invoice_id_foreign` (`fee_invoice_id`),
  ADD KEY `student_accounts_receipt_id_foreign` (`receipt_id`),
  ADD KEY `student_accounts_processing_id_foreign` (`processing_id`),
  ADD KEY `student_accounts_payment_id_foreign` (`payment_id`),
  ADD KEY `student_accounts_student_id_foreign` (`student_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_grade_id_foreign` (`grade_id`),
  ADD KEY `subjects_classroom_id_foreign` (`classroom_id`),
  ADD KEY `subjects_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_email_unique` (`email`),
  ADD KEY `teachers_specialization_id_foreign` (`Specialization_id`),
  ADD KEY `teachers_gender_id_foreign` (`Gender_id`);

--
-- Indexes for table `teacher_section`
--
ALTER TABLE `teacher_section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_section_teacher_id_foreign` (`teacher_id`),
  ADD KEY `teacher_section_section_id_foreign` (`section_id`);

--
-- Indexes for table `type__bloods`
--
ALTER TABLE `type__bloods`
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
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `degrees`
--
ALTER TABLE `degrees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_invoices`
--
ALTER TABLE `fee_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fund_accounts`
--
ALTER TABLE `fund_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library`
--
ALTER TABLE `library`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `my__parents`
--
ALTER TABLE `my__parents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nationalities`
--
ALTER TABLE `nationalities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `online_classes`
--
ALTER TABLE `online_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parent_attachments`
--
ALTER TABLE `parent_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_students`
--
ALTER TABLE `payment_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `processing_fees`
--
ALTER TABLE `processing_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipt_students`
--
ALTER TABLE `receipt_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `religions`
--
ALTER TABLE `religions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `specializations`
--
ALTER TABLE `specializations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_accounts`
--
ALTER TABLE `student_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_section`
--
ALTER TABLE `teacher_section`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type__bloods`
--
ALTER TABLE `type__bloods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `classrooms`
--
ALTER TABLE `classrooms`
  ADD CONSTRAINT `classrooms_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `grades` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `degrees`
--
ALTER TABLE `degrees`
  ADD CONSTRAINT `degrees_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `degrees_quizze_id_foreign` FOREIGN KEY (`quizze_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `degrees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_classroom_id_foreign` FOREIGN KEY (`Classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `grades` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_invoices`
--
ALTER TABLE `fee_invoices`
  ADD CONSTRAINT `fee_invoices_classroom_id_foreign` FOREIGN KEY (`Classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_invoices_fee_id_foreign` FOREIGN KEY (`fee_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_invoices_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_invoices_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fund_accounts`
--
ALTER TABLE `fund_accounts`
  ADD CONSTRAINT `fund_accounts_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payment_students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fund_accounts_receipt_id_foreign` FOREIGN KEY (`receipt_id`) REFERENCES `receipt_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `library_classroom_id_foreign` FOREIGN KEY (`Classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `library_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `library_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `library_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `my__parents`
--
ALTER TABLE `my__parents`
  ADD CONSTRAINT `my__parents_blood_type_father_id_foreign` FOREIGN KEY (`Blood_Type_Father_id`) REFERENCES `type__bloods` (`id`),
  ADD CONSTRAINT `my__parents_blood_type_mother_id_foreign` FOREIGN KEY (`Blood_Type_Mother_id`) REFERENCES `type__bloods` (`id`),
  ADD CONSTRAINT `my__parents_nationality_father_id_foreign` FOREIGN KEY (`Nationality_Father_id`) REFERENCES `nationalities` (`id`),
  ADD CONSTRAINT `my__parents_nationality_mother_id_foreign` FOREIGN KEY (`Nationality_Mother_id`) REFERENCES `nationalities` (`id`),
  ADD CONSTRAINT `my__parents_religion_father_id_foreign` FOREIGN KEY (`Religion_Father_id`) REFERENCES `religions` (`id`),
  ADD CONSTRAINT `my__parents_religion_mother_id_foreign` FOREIGN KEY (`Religion_Mother_id`) REFERENCES `religions` (`id`);

--
-- Constraints for table `online_classes`
--
ALTER TABLE `online_classes`
  ADD CONSTRAINT `online_classes_classroom_id_foreign` FOREIGN KEY (`Classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_classes_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_classes_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parent_attachments`
--
ALTER TABLE `parent_attachments`
  ADD CONSTRAINT `parent_attachments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `my__parents` (`id`);

--
-- Constraints for table `payment_students`
--
ALTER TABLE `payment_students`
  ADD CONSTRAINT `payment_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `processing_fees`
--
ALTER TABLE `processing_fees`
  ADD CONSTRAINT `processing_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_from_classroom_foreign` FOREIGN KEY (`from_Classroom`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotions_from_grade_foreign` FOREIGN KEY (`from_grade`) REFERENCES `grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotions_from_section_foreign` FOREIGN KEY (`from_section`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotions_to_classroom_foreign` FOREIGN KEY (`to_Classroom`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotions_to_grade_foreign` FOREIGN KEY (`to_grade`) REFERENCES `grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotions_to_section_foreign` FOREIGN KEY (`to_section`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_quizze_id_foreign` FOREIGN KEY (`quizze_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `receipt_students`
--
ALTER TABLE `receipt_students`
  ADD CONSTRAINT `receipt_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `grades` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_blood_id_foreign` FOREIGN KEY (`blood_id`) REFERENCES `type__bloods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_classroom_id_foreign` FOREIGN KEY (`Classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_nationalitie_id_foreign` FOREIGN KEY (`nationalitie_id`) REFERENCES `nationalities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `my__parents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_accounts`
--
ALTER TABLE `student_accounts`
  ADD CONSTRAINT `student_accounts_fee_invoice_id_foreign` FOREIGN KEY (`fee_invoice_id`) REFERENCES `fee_invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_accounts_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payment_students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_accounts_processing_id_foreign` FOREIGN KEY (`processing_id`) REFERENCES `processing_fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_accounts_receipt_id_foreign` FOREIGN KEY (`receipt_id`) REFERENCES `receipt_students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_accounts_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subjects_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subjects_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_gender_id_foreign` FOREIGN KEY (`Gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teachers_specialization_id_foreign` FOREIGN KEY (`Specialization_id`) REFERENCES `specializations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_section`
--
ALTER TABLE `teacher_section`
  ADD CONSTRAINT `teacher_section_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_section_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
