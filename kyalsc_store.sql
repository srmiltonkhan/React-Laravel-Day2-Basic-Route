-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 05, 2022 at 03:55 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kyalsc_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `damage_receive_childs`
--

DROP TABLE IF EXISTS `damage_receive_childs`;
CREATE TABLE IF NOT EXISTS `damage_receive_childs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `damage_receive_parent_id` bigint(20) UNSIGNED NOT NULL,
  `requisition_child_id` bigint(20) UNSIGNED NOT NULL,
  `damage_received_quantity` decimal(15,0) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `damage_receive_childs_damage_receive_parent_id_foreign` (`damage_receive_parent_id`),
  KEY `damage_receive_childs_requisition_child_id_foreign` (`requisition_child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `damage_receive_childs`
--

INSERT INTO `damage_receive_childs` (`id`, `damage_receive_parent_id`, `requisition_child_id`, `damage_received_quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2', '2022-01-25 04:12:22', '2022-01-25 04:12:22'),
(2, 1, 2, '3', '2022-01-25 04:12:22', '2022-01-25 04:12:22'),
(3, 2, 5, '1', '2022-01-25 21:40:53', '2022-01-25 21:40:53'),
(4, 3, 5, '1', '2022-01-25 21:45:34', '2022-01-25 21:45:34'),
(5, 4, 3, '1', '2022-01-26 21:42:43', '2022-01-26 21:42:43'),
(6, 4, 4, '1', '2022-01-26 21:42:44', '2022-01-26 21:42:44'),
(7, 5, 6, '1', '2022-01-26 21:42:48', '2022-01-26 21:42:48'),
(8, 6, 7, '4', '2022-01-27 01:58:13', '2022-01-27 01:58:13'),
(9, 6, 8, '4', '2022-01-27 01:58:14', '2022-01-27 01:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `damage_receive_parents`
--

DROP TABLE IF EXISTS `damage_receive_parents`;
CREATE TABLE IF NOT EXISTS `damage_receive_parents` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `damage_receive_parent_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requisition_parent_id` bigint(20) UNSIGNED NOT NULL,
  `received_by` bigint(20) UNSIGNED NOT NULL,
  `damage_receive_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `damage_receive_parents_damage_receive_parent_id_unique` (`damage_receive_parent_id`),
  KEY `damage_receive_parents_requisition_parent_id_foreign` (`requisition_parent_id`),
  KEY `damage_receive_parents_received_by_foreign` (`received_by`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `damage_receive_parents`
--

INSERT INTO `damage_receive_parents` (`id`, `damage_receive_parent_id`, `requisition_parent_id`, `received_by`, `damage_receive_date`, `created_at`, `updated_at`) VALUES
(1, '20220125101222155', 1, 1, '2022-01-25', '2022-01-25 04:12:22', '2022-01-25 04:12:22'),
(2, '20220126034053140', 3, 1, '2022-01-26', '2022-01-25 21:40:53', '2022-01-25 21:40:53'),
(3, '20220126034534104', 3, 1, '2022-01-26', '2022-01-25 21:45:34', '2022-01-25 21:45:34'),
(4, '20220127034243102', 2, 1, '2022-01-27', '2022-01-26 21:42:43', '2022-01-26 21:42:43'),
(5, '20220127034248154', 4, 1, '2022-01-27', '2022-01-26 21:42:48', '2022-01-26 21:42:48'),
(6, '20220127075813133', 5, 1, '2022-01-27', '2022-01-27 01:58:13', '2022-01-27 01:58:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issued_list_childs`
--

DROP TABLE IF EXISTS `issued_list_childs`;
CREATE TABLE IF NOT EXISTS `issued_list_childs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `requisition_child_id` bigint(20) UNSIGNED NOT NULL,
  `issued_list_parents_id` bigint(20) UNSIGNED NOT NULL,
  `issued_quantity` decimal(15,0) NOT NULL,
  `issued_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issued_list_childs_requisition_child_id_foreign` (`requisition_child_id`),
  KEY `issued_list_childs_issued_list_parents_id_foreign` (`issued_list_parents_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issued_list_childs`
--

INSERT INTO `issued_list_childs` (`id`, `requisition_child_id`, `issued_list_parents_id`, `issued_quantity`, `issued_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '5', '2022-01-25', '2022-01-25 04:10:43', '2022-01-25 04:10:43'),
(2, 2, 1, '5', '2022-01-25', '2022-01-25 04:10:43', '2022-01-25 04:10:43'),
(3, 5, 2, '5', '2022-01-26', '2022-01-25 21:37:54', '2022-01-25 21:37:54'),
(4, 3, 3, '5', '2022-01-27', '2022-01-26 21:32:46', '2022-01-26 21:32:46'),
(5, 4, 3, '5', '2022-01-27', '2022-01-26 21:32:46', '2022-01-26 21:32:46'),
(6, 6, 4, '5', '2022-01-27', '2022-01-26 21:42:13', '2022-01-26 21:42:13'),
(7, 7, 5, '1', '2022-01-27', '2022-01-27 01:56:06', '2022-01-27 01:56:06'),
(8, 8, 5, '1', '2022-01-27', '2022-01-27 01:56:07', '2022-01-27 01:56:07'),
(9, 7, 6, '4', '2022-01-27', '2022-01-27 01:56:28', '2022-01-27 01:56:28'),
(10, 8, 6, '4', '2022-01-27', '2022-01-27 01:56:28', '2022-01-27 01:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `issued_list_parents`
--

DROP TABLE IF EXISTS `issued_list_parents`;
CREATE TABLE IF NOT EXISTS `issued_list_parents` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `issued_by` bigint(20) UNSIGNED NOT NULL,
  `requisition_vou_no` bigint(20) UNSIGNED NOT NULL,
  `issued_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issued_list_parents_issued_by_foreign` (`issued_by`),
  KEY `issued_list_parents_requisition_vou_no_foreign` (`requisition_vou_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issued_list_parents`
--

INSERT INTO `issued_list_parents` (`id`, `issued_by`, `requisition_vou_no`, `issued_id`, `issued_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'IS-20220125101043132', '2022-01-25', '2022-01-25 04:10:43', '2022-01-25 04:10:43'),
(2, 1, 3, 'IS-20220126033754142', '2022-01-26', '2022-01-25 21:37:54', '2022-01-25 21:37:54'),
(3, 1, 2, 'IS-20220127033246135', '2022-01-27', '2022-01-26 21:32:46', '2022-01-26 21:32:46'),
(4, 1, 4, 'IS-20220127034213139', '2022-01-27', '2022-01-26 21:42:13', '2022-01-26 21:42:13'),
(5, 1, 5, 'IS-20220127075606178', '2022-01-27', '2022-01-27 01:56:06', '2022-01-27 01:56:06'),
(6, 1, 5, 'IS-20220127075628140', '2022-01-27', '2022-01-27 01:56:28', '2022-01-27 01:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_19_040044_create_permission_tables', 1),
(6, '2021_12_27_044117_create_signitures_table', 1),
(7, '2021_12_27_044118_create_product_categories_table', 1),
(8, '2021_12_28_043431_create_product_types_table', 1),
(9, '2021_12_28_072109_create_product_brands_table', 1),
(10, '2021_12_28_092320_create_suppliers_table', 1),
(11, '2021_12_29_045754_create_product_units_table', 1),
(12, '2021_12_29_095155_create_products_table', 1),
(13, '2021_12_29_095156_create_purchase_orders_table', 1),
(14, '2021_12_30_100025_create_purchases_table', 1),
(15, '2022_01_04_045554_create_warehouses_table', 1),
(16, '2022_01_06_102737_requisition', 1),
(17, '2022_01_10_111400_create_issue_products_table', 1),
(18, '2022_01_18_082536_return_receive', 1),
(19, '2022_01_23_040828_damage_receive', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.view', 'web', 'dashboard', '2022-01-24 05:05:11', '2022-01-24 05:05:11'),
(2, 'dashboard.action', 'web', 'dashboard', '2022-01-24 05:05:11', '2022-01-24 05:05:11'),
(3, 'mis.view', 'web', 'mis', '2022-01-24 05:05:11', '2022-01-24 05:05:11'),
(4, 'mis.action', 'web', 'mis', '2022-01-24 05:05:11', '2022-01-24 05:05:11'),
(5, 'role.view', 'web', 'role', '2022-01-24 05:05:12', '2022-01-24 05:05:12'),
(6, 'role.create', 'web', 'role', '2022-01-24 05:05:12', '2022-01-24 05:05:12'),
(7, 'role.show', 'web', 'role', '2022-01-24 05:05:12', '2022-01-24 05:05:12'),
(8, 'role.edit', 'web', 'role', '2022-01-24 05:05:12', '2022-01-24 05:05:12'),
(9, 'role.delete', 'web', 'role', '2022-01-24 05:05:12', '2022-01-24 05:05:12'),
(10, 'user.view', 'web', 'user', '2022-01-24 05:05:12', '2022-01-24 05:05:12'),
(11, 'user.create', 'web', 'user', '2022-01-24 05:05:12', '2022-01-24 05:05:12'),
(12, 'user.edit', 'web', 'user', '2022-01-24 05:05:12', '2022-01-24 05:05:12'),
(13, 'user.delete', 'web', 'user', '2022-01-24 05:05:12', '2022-01-24 05:05:12'),
(14, 'signature.view', 'web', 'signature', '2022-01-24 05:05:12', '2022-01-24 05:05:12'),
(15, 'signature.create', 'web', 'signature', '2022-01-24 05:05:13', '2022-01-24 05:05:13'),
(16, 'signature.edit', 'web', 'signature', '2022-01-24 05:05:13', '2022-01-24 05:05:13'),
(17, 'signature.delete', 'web', 'signature', '2022-01-24 05:05:13', '2022-01-24 05:05:13'),
(18, 'productSetupArea.menuView', 'web', 'productSetupArea', '2022-01-24 05:05:13', '2022-01-24 05:05:13'),
(19, 'productCategory.view', 'web', 'productCategory', '2022-01-24 05:05:13', '2022-01-24 05:05:13'),
(20, 'productCategory.create', 'web', 'productCategory', '2022-01-24 05:05:13', '2022-01-24 05:05:13'),
(21, 'productCategory.edit', 'web', 'productCategory', '2022-01-24 05:05:13', '2022-01-24 05:05:13'),
(22, 'productCategory.delete', 'web', 'productCategory', '2022-01-24 05:05:13', '2022-01-24 05:05:13'),
(23, 'productType.view', 'web', 'productType', '2022-01-24 05:05:13', '2022-01-24 05:05:13'),
(24, 'productType.create', 'web', 'productType', '2022-01-24 05:05:13', '2022-01-24 05:05:13'),
(25, 'productType.edit', 'web', 'productType', '2022-01-24 05:05:13', '2022-01-24 05:05:13'),
(26, 'productType.delete', 'web', 'productType', '2022-01-24 05:05:13', '2022-01-24 05:05:13'),
(27, 'productBrand.view', 'web', 'productBrand', '2022-01-24 05:05:14', '2022-01-24 05:05:14'),
(28, 'productBrand.create', 'web', 'productBrand', '2022-01-24 05:05:14', '2022-01-24 05:05:14'),
(29, 'productBrand.edit', 'web', 'productBrand', '2022-01-24 05:05:14', '2022-01-24 05:05:14'),
(30, 'productBrand.delete', 'web', 'productBrand', '2022-01-24 05:05:14', '2022-01-24 05:05:14'),
(31, 'productSupplier.view', 'web', 'productSupplier', '2022-01-24 05:05:14', '2022-01-24 05:05:14'),
(32, 'productSupplier.create', 'web', 'productSupplier', '2022-01-24 05:05:14', '2022-01-24 05:05:14'),
(33, 'productSupplier.edit', 'web', 'productSupplier', '2022-01-24 05:05:14', '2022-01-24 05:05:14'),
(34, 'productSupplier.delete', 'web', 'productSupplier', '2022-01-24 05:05:14', '2022-01-24 05:05:14'),
(35, 'productUnit.view', 'web', 'productUnit', '2022-01-24 05:05:14', '2022-01-24 05:05:14'),
(36, 'productUnit.create', 'web', 'productUnit', '2022-01-24 05:05:14', '2022-01-24 05:05:14'),
(37, 'productUnit.edit', 'web', 'productUnit', '2022-01-24 05:05:14', '2022-01-24 05:05:14'),
(38, 'productUnit.delete', 'web', 'productUnit', '2022-01-24 05:05:14', '2022-01-24 05:05:14'),
(39, 'product.view', 'web', 'product', '2022-01-24 05:05:15', '2022-01-24 05:05:15'),
(40, 'product.create', 'web', 'product', '2022-01-24 05:05:15', '2022-01-24 05:05:15'),
(41, 'product.edit', 'web', 'product', '2022-01-24 05:05:15', '2022-01-24 05:05:15'),
(42, 'product.delete', 'web', 'product', '2022-01-24 05:05:15', '2022-01-24 05:05:15'),
(43, 'purchaseOrder.view', 'web', 'purchaseOrder', '2022-01-24 05:05:15', '2022-01-24 05:05:15'),
(44, 'purchaseOrder.create', 'web', 'purchaseOrder', '2022-01-24 05:05:15', '2022-01-24 05:05:15'),
(45, 'purchaseOrder.edit', 'web', 'purchaseOrder', '2022-01-24 05:05:15', '2022-01-24 05:05:15'),
(46, 'purchaseOrder.delete', 'web', 'purchaseOrder', '2022-01-24 05:05:15', '2022-01-24 05:05:15'),
(47, 'purchaseInvoiceEntry.view', 'web', 'purchaseInvoiceEntry', '2022-01-24 05:05:15', '2022-01-24 05:05:15'),
(48, 'purchaseInvoiceEntry.create', 'web', 'purchaseInvoiceEntry', '2022-01-24 05:05:15', '2022-01-24 05:05:15'),
(49, 'purchaseInvoiceEntry.edit', 'web', 'purchaseInvoiceEntry', '2022-01-24 05:05:16', '2022-01-24 05:05:16'),
(50, 'purchaseInvoiceEntry.delete', 'web', 'purchaseInvoiceEntry', '2022-01-24 05:05:16', '2022-01-24 05:05:16'),
(51, 'warehouse.view', 'web', 'warehouse', '2022-01-24 05:05:16', '2022-01-24 05:05:16'),
(52, 'requisition.menuView', 'web', 'requisition', '2022-01-24 05:05:16', '2022-01-24 05:05:16'),
(53, 'makeRequisition.view', 'web', 'makeRequisition', '2022-01-24 05:05:16', '2022-01-24 05:05:16'),
(54, 'makeRequisition.create', 'web', 'makeRequisition', '2022-01-24 05:05:16', '2022-01-24 05:05:16'),
(55, 'makeRequisition.show', 'web', 'makeRequisition', '2022-01-24 05:05:16', '2022-01-24 05:05:16'),
(56, 'makeRequisition.edit', 'web', 'makeRequisition', '2022-01-24 05:05:16', '2022-01-24 05:05:16'),
(57, 'makeRequisition.delete', 'web', 'makeRequisition', '2022-01-24 05:05:16', '2022-01-24 05:05:16'),
(58, 'makeRequisition.return', 'web', 'makeRequisition', '2022-01-24 05:05:16', '2022-01-24 05:05:16'),
(59, 'makeRequisition.damage', 'web', 'makeRequisition', '2022-01-24 05:05:17', '2022-01-24 05:05:17'),
(60, 'departmentalApproval.view', 'web', 'departmentalApproval', '2022-01-24 05:05:17', '2022-01-24 05:05:17'),
(61, 'departmentalApproval.approve', 'web', 'departmentalApproval', '2022-01-24 05:05:17', '2022-01-24 05:05:17'),
(62, 'IssueRequisition.MenuView', 'web', 'IssueRequisition', '2022-01-24 05:05:17', '2022-01-24 05:05:17'),
(63, 'createIssue.view', 'web', 'createIssue', '2022-01-24 05:05:17', '2022-01-24 05:05:17'),
(64, 'createIssue.actionIssue', 'web', 'createIssue', '2022-01-24 05:05:17', '2022-01-24 05:05:17'),
(65, 'issuedList.view', 'web', 'issuedList', '2022-01-24 05:05:17', '2022-01-24 05:05:17'),
(66, 'issuedList.show', 'web', 'issuedList', '2022-01-24 05:05:17', '2022-01-24 05:05:17'),
(67, 'issuedList.edit', 'web', 'issuedList', '2022-01-24 05:05:17', '2022-01-24 05:05:17'),
(68, 'issuedList.delete', 'web', 'issuedList', '2022-01-24 05:05:17', '2022-01-24 05:05:17'),
(69, 'returnRequisition.menuView', 'web', 'returnRequisition', '2022-01-24 05:05:17', '2022-01-24 05:05:17'),
(70, 'issuedReturn.view', 'web', 'issuedReturn', '2022-01-24 05:05:17', '2022-01-24 05:05:17'),
(71, 'issuedReturn.actionReceiveIssuedReturn', 'web', 'issuedReturn', '2022-01-24 05:05:18', '2022-01-24 05:05:18'),
(72, 'issuedReturnedReceivedList.view', 'web', 'issuedReturnedReceivedList', '2022-01-24 05:05:18', '2022-01-24 05:05:18'),
(73, 'issuedReturnedReceivedList.show', 'web', 'issuedReturnedReceivedList', '2022-01-24 05:05:18', '2022-01-24 05:05:18'),
(74, 'issuedReturnedReceivedList.edit', 'web', 'issuedReturnedReceivedList', '2022-01-24 05:05:18', '2022-01-24 05:05:18'),
(75, 'issuedReturnedReceivedList.delete', 'web', 'issuedReturnedReceivedList', '2022-01-24 05:05:18', '2022-01-24 05:05:18'),
(76, 'returnDamage.menuView', 'web', 'returnDamage', '2022-01-24 05:05:18', '2022-01-24 05:05:18'),
(77, 'receiveDamage.view', 'web', 'receiveDamage', '2022-01-24 05:05:18', '2022-01-24 05:05:18'),
(78, 'receiveDamage.actionReceiveDamage', 'web', 'receiveDamage', '2022-01-24 05:05:18', '2022-01-24 05:05:18'),
(79, 'receivedDamageList.view', 'web', 'receivedDamageList', '2022-01-24 05:05:18', '2022-01-24 05:05:18'),
(80, 'receivedDamageList.show', 'web', 'receivedDamageList', '2022-01-24 05:05:19', '2022-01-24 05:05:19'),
(81, 'receivedDamageList.edit', 'web', 'receivedDamageList', '2022-01-24 05:05:19', '2022-01-24 05:05:19'),
(82, 'receivedDamageList.delete', 'web', 'receivedDamageList', '2022-01-24 05:05:19', '2022-01-24 05:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_type_name` bigint(20) UNSIGNED NOT NULL,
  `brand_name` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `sku` decimal(15,0) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_product_type_name_foreign` (`product_type_name`),
  KEY `products_brand_name_foreign` (`brand_name`),
  KEY `products_created_by_foreign` (`created_by`),
  KEY `products_unit_id_foreign` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_type_name`, `brand_name`, `created_by`, `sku`, `name`, `unit_id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '1001', 'HP-Monitor-1200', 2, 'twt', '1', '2022-01-24 21:20:02', '2022-01-24 21:20:02'),
(2, 2, 2, 1, '1002', 'Pendrive-Transient-1200', 1, NULL, '1', '2022-01-24 21:20:16', '2022-01-27 02:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_brands`
--

DROP TABLE IF EXISTS `product_brands`;
CREATE TABLE IF NOT EXISTS `product_brands` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_type_name` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_brands_product_type_name_foreign` (`product_type_name`),
  KEY `product_brands_created_by_foreign` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_brands`
--

INSERT INTO `product_brands` (`id`, `product_type_name`, `created_by`, `brand_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Samsung', '1', '2022-01-24 21:19:29', '2022-01-24 21:19:29'),
(2, 2, 1, 'Transient', '1', '2022-01-24 21:19:34', '2022-01-26 21:41:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `product_category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_categories_created_by_foreign` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `created_by`, `product_category`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Electronic Devices', '1', NULL, NULL),
(2, 1, 'Electronic Accessories', '1', NULL, NULL),
(3, 1, 'Furniture1', '1', '2022-01-25 05:14:54', '2022-01-26 04:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

DROP TABLE IF EXISTS `product_types`;
CREATE TABLE IF NOT EXISTS `product_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_category` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `product_type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_types_product_category_foreign` (`product_category`),
  KEY `product_types_created_by_foreign` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`id`, `product_category`, `created_by`, `product_type_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Monitor', '1', '2022-01-24 21:19:16', '2022-01-24 21:19:16'),
(2, 2, 1, 'Pendrive', '1', '2022-01-24 21:19:23', '2022-01-26 04:32:18');

-- --------------------------------------------------------

--
-- Table structure for table `product_units`
--

DROP TABLE IF EXISTS `product_units`;
CREATE TABLE IF NOT EXISTS `product_units` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_units_created_by_foreign` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_units`
--

INSERT INTO `product_units` (`id`, `created_by`, `unit_name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'PC', 'PIECE', '1', NULL, NULL),
(2, 1, 'BX', 'BOX', '1', NULL, NULL),
(3, 1, 'DZ', 'Dozens', '1', NULL, NULL),
(4, 1, 'BTL', 'Bottles', '1', NULL, NULL),
(5, 1, 'FT', 'Feet', '1', NULL, NULL),
(6, 1, 'KG', 'Kilogram', '1', NULL, NULL),
(7, 1, 'GL', 'Gallon', '1', NULL, NULL),
(8, 1, 'Gm', 'Grams', '1', NULL, NULL),
(9, 1, 'In', 'Inch', '1', NULL, NULL),
(10, 1, 'Ltr', 'Liters', '1', NULL, NULL),
(11, 1, 'M', 'Meter', '1', NULL, NULL),
(12, 1, 'NOS', 'NOS', '1', NULL, NULL),
(13, 1, 'Pkt', 'Packet', '1', NULL, NULL),
(14, 1, 'RLS', 'Rolls', '1', NULL, NULL),
(15, 1, 'BG', 'Bags', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchases_child_tbl`
--

DROP TABLE IF EXISTS `purchases_child_tbl`;
CREATE TABLE IF NOT EXISTS `purchases_child_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_parent_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(5,0) NOT NULL,
  `unit_price` decimal(20,2) NOT NULL,
  `total_price` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchases_child_tbl_purchase_parent_id_foreign` (`purchase_parent_id`),
  KEY `purchases_child_tbl_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases_child_tbl`
--

INSERT INTO `purchases_child_tbl` (`id`, `purchase_parent_id`, `product_id`, `quantity`, `unit_price`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '50', '500.00', '25000.00', '2022-01-24 21:20:49', '2022-01-24 21:20:49'),
(2, 1, 1, '5', '5000.00', '25000.00', '2022-01-24 21:20:49', '2022-01-24 21:20:49'),
(3, 2, 2, '5', '500.00', '2500.00', '2022-01-24 21:22:45', '2022-01-24 21:22:45'),
(4, 2, 1, '5', '5000.00', '25000.00', '2022-01-24 21:22:45', '2022-01-24 21:22:45'),
(5, 3, 2, '50', '555.00', '27750.00', '2022-01-24 22:49:30', '2022-01-24 22:49:30'),
(6, 4, 1, '5', '5000.00', '25000.00', '2022-01-24 22:59:04', '2022-01-24 22:59:04'),
(7, 5, 1, '50', '500.00', '25000.00', '2022-01-25 21:31:39', '2022-01-25 21:31:39'),
(8, 5, 2, '50', '50.00', '2500.00', '2022-01-25 21:31:39', '2022-01-25 21:31:39'),
(9, 6, 2, '555', '50.00', '27750.00', '2022-01-25 21:32:31', '2022-01-25 21:32:31'),
(10, 6, 1, '555', '50.00', '27750.00', '2022-01-25 21:32:31', '2022-01-25 21:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `purchases_parent_tbl`
--

DROP TABLE IF EXISTS `purchases_parent_tbl`;
CREATE TABLE IF NOT EXISTS `purchases_parent_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_no` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` decimal(20,2) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `buyer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchases_parent_tbl_invoice_no_unique` (`invoice_no`),
  KEY `purchases_parent_tbl_created_by_foreign` (`created_by`),
  KEY `purchases_parent_tbl_supplier_id_foreign` (`supplier_id`),
  KEY `purchases_parent_tbl_purchase_order_no_foreign` (`purchase_order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases_parent_tbl`
--

INSERT INTO `purchases_parent_tbl` (`id`, `created_by`, `purchase_order_no`, `invoice_no`, `grand_total`, `supplier_id`, `buyer_name`, `purchase_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '25252132652', '50000.00', 1, 'test', '2022-01-12', '2022-01-24 21:20:48', '2022-01-24 21:20:48'),
(2, 1, 1, '256341789', '27500.00', 1, 'tyy', '2022-01-04', '2022-01-24 21:22:45', '2022-01-24 21:22:45'),
(3, 1, 1, '5555555', '27750.00', 1, 'test', '2022-01-05', '2022-01-24 22:49:29', '2022-01-24 22:49:29'),
(4, 1, 1, '55655255', '25000.00', 1, 'hfg', '2022-01-18', '2022-01-24 22:59:04', '2022-01-24 22:59:04'),
(5, 1, 3, '252632252', '27500.00', 1, 'Atik', '2022-01-08', '2022-01-25 21:31:39', '2022-01-25 21:31:39'),
(6, 1, 1, '52555', '55500.00', 1, 'test', '2022-01-06', '2022-01-25 21:32:31', '2022-01-25 21:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_childs`
--

DROP TABLE IF EXISTS `purchase_order_childs`;
CREATE TABLE IF NOT EXISTS `purchase_order_childs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_no` bigint(20) UNSIGNED NOT NULL,
  `order_quantity` decimal(15,0) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_childs_product_id_foreign` (`product_id`),
  KEY `purchase_order_childs_purchase_order_no_foreign` (`purchase_order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_childs`
--

INSERT INTO `purchase_order_childs` (`id`, `product_id`, `purchase_order_no`, `order_quantity`, `remark`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '5', 'hgjhj', '2022-01-25 01:22:47', '2022-01-25 01:22:47'),
(2, 2, 3, '5', 'For Lab', '2022-01-25 04:33:12', '2022-01-25 04:33:12'),
(3, 1, 3, '10', 'For Lab', '2022-01-25 04:33:12', '2022-01-25 04:33:12'),
(4, 2, 4, '50', 'test', '2022-01-25 21:30:54', '2022-01-25 21:30:54'),
(5, 1, 4, '50', 'test', '2022-01-25 21:30:54', '2022-01-25 21:30:54'),
(6, 2, 5, '50', 'test', '2022-01-27 01:59:22', '2022-01-27 01:59:22'),
(7, 1, 5, '50', 'test', '2022-01-27 01:59:22', '2022-01-27 01:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_parents`
--

DROP TABLE IF EXISTS `purchase_order_parents`;
CREATE TABLE IF NOT EXISTS `purchase_order_parents` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prepared_by` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `head_of_department` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `it_department` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordered_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_order_parents_purchase_order_no_unique` (`purchase_order_no`),
  KEY `purchase_order_parents_prepared_by_foreign` (`prepared_by`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_parents`
--

INSERT INTO `purchase_order_parents` (`id`, `prepared_by`, `purchase_order_no`, `order_by`, `department`, `head_of_department`, `it_department`, `approved_by`, `ordered_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'N/A', '1', 'IT', '1', '2', '3', '2022-01-19', NULL, NULL),
(2, 1, 'PO-2022012507224699', '1', 'IT', '1', '1', '1', '2022-01-25', '2022-01-25 01:22:46', '2022-01-25 01:22:46'),
(3, 1, 'PO-2022012510331272', '1', 'IT', '3', '2', '3', '2022-01-25', '2022-01-25 04:33:12', '2022-01-25 04:33:12'),
(4, 1, 'PO-2022012603305441', '1', 'IT', '1', '2', '3', '2022-01-26', '2022-01-25 21:30:54', '2022-01-25 21:30:54'),
(5, 1, 'PO-2022012707592251', '3', 'it', '1', '3', '3', '2022-01-27', '2022-01-27 01:59:22', '2022-01-27 01:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `requisition_childs`
--

DROP TABLE IF EXISTS `requisition_childs`;
CREATE TABLE IF NOT EXISTS `requisition_childs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `requisition_parent_id` bigint(20) UNSIGNED NOT NULL,
  `requisition_quantity` decimal(15,0) NOT NULL,
  `delivered_quantity` decimal(15,0) NOT NULL DEFAULT 0,
  `return_quantity` decimal(15,0) NOT NULL DEFAULT 0,
  `damage_quantity` decimal(15,0) NOT NULL DEFAULT 0,
  `purpose` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2','3','4','5','6','7','8') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requisition_childs_product_id_foreign` (`product_id`),
  KEY `requisition_childs_requisition_parent_id_foreign` (`requisition_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requisition_childs`
--

INSERT INTO `requisition_childs` (`id`, `product_id`, `requisition_parent_id`, `requisition_quantity`, `delivered_quantity`, `return_quantity`, `damage_quantity`, `purpose`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '5', '5', '3', '2', 'test', '6', '2022-01-25 03:19:04', '2022-01-25 05:10:44'),
(2, 2, 1, '5', '5', '2', '3', 'test', '6', '2022-01-25 03:19:04', '2022-01-25 05:10:44'),
(3, 2, 2, '5', '5', '0', '1', 'For Lab', '8', '2022-01-25 20:52:10', '2022-01-26 21:42:44'),
(4, 1, 2, '5', '5', '0', '1', 'For Lab', '8', '2022-01-25 20:52:10', '2022-01-26 21:42:44'),
(5, 1, 3, '5', '5', '2', '3', 'For Personal', '6', '2022-01-25 21:24:38', '2022-01-26 21:42:34'),
(6, 1, 4, '5', '5', '1', '1', 'fg', '8', '2022-01-26 21:41:58', '2022-01-26 21:42:49'),
(7, 1, 5, '5', '5', '1', '4', 'for personal', '8', '2022-01-27 01:55:14', '2022-01-27 01:58:13'),
(8, 2, 5, '5', '5', '1', '4', 'test', '8', '2022-01-27 01:55:14', '2022-01-27 01:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `requisition_parents`
--

DROP TABLE IF EXISTS `requisition_parents`;
CREATE TABLE IF NOT EXISTS `requisition_parents` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `requisition_by` bigint(20) UNSIGNED NOT NULL,
  `requisition_date` date NOT NULL,
  `requisition_vou_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2','3','4','5','6') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requisition_parents_requisition_by_foreign` (`requisition_by`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requisition_parents`
--

INSERT INTO `requisition_parents` (`id`, `requisition_by`, `requisition_date`, `requisition_vou_no`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-01-25', 'R-2022012509190455', '5', '2022-01-25 03:19:04', '2022-01-25 04:10:43'),
(2, 2, '2022-01-26', 'R-2022012602521094', '5', '2022-01-25 20:52:10', '2022-01-26 21:32:47'),
(3, 3, '2022-01-26', 'R-2022012603243898', '5', '2022-01-25 21:24:38', '2022-01-25 21:37:54'),
(4, 1, '2022-01-27', 'R-2022012703415764', '5', '2022-01-26 21:41:57', '2022-01-26 21:42:13'),
(5, 2, '2022-01-27', 'R-2022012707551397', '5', '2022-01-27 01:55:13', '2022-01-27 01:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `return_receive_childs`
--

DROP TABLE IF EXISTS `return_receive_childs`;
CREATE TABLE IF NOT EXISTS `return_receive_childs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `return_receive_parent_id` bigint(20) UNSIGNED NOT NULL,
  `requisition_child_id` bigint(20) UNSIGNED NOT NULL,
  `return_received_quantity` decimal(15,0) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `return_receive_childs_requisition_child_id_foreign` (`requisition_child_id`),
  KEY `return_receive_childs_return_receive_parent_id_foreign` (`return_receive_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `return_receive_childs`
--

INSERT INTO `return_receive_childs` (`id`, `return_receive_parent_id`, `requisition_child_id`, `return_received_quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1', '2022-01-25 04:11:34', '2022-01-25 04:11:34'),
(2, 1, 2, '1', '2022-01-25 04:11:34', '2022-01-25 04:11:34'),
(3, 2, 1, '2', '2022-01-25 05:10:44', '2022-01-25 05:10:44'),
(4, 2, 2, '1', '2022-01-25 05:10:44', '2022-01-25 05:10:44'),
(5, 3, 5, '1', '2022-01-25 21:38:57', '2022-01-25 21:38:57'),
(6, 4, 5, '1', '2022-01-26 21:42:34', '2022-01-26 21:42:34'),
(7, 5, 7, '1', '2022-01-27 01:57:12', '2022-01-27 01:57:12'),
(8, 5, 8, '1', '2022-01-27 01:57:13', '2022-01-27 01:57:13');

-- --------------------------------------------------------

--
-- Table structure for table `return_receive_parents`
--

DROP TABLE IF EXISTS `return_receive_parents`;
CREATE TABLE IF NOT EXISTS `return_receive_parents` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `requisition_parent_id` bigint(20) UNSIGNED NOT NULL,
  `received_by` bigint(20) UNSIGNED NOT NULL,
  `return_receive_parent_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_receive_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `return_receive_parents_return_receive_parent_id_unique` (`return_receive_parent_id`),
  KEY `return_receive_parents_received_by_foreign` (`received_by`),
  KEY `return_receive_parents_requisition_parent_id_foreign` (`requisition_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `return_receive_parents`
--

INSERT INTO `return_receive_parents` (`id`, `requisition_parent_id`, `received_by`, `return_receive_parent_id`, `return_receive_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'RR-20220125101134114', '2022-01-25', '2022-01-25 04:11:34', '2022-01-25 04:11:34'),
(2, 1, 1, 'RR-20220125111043134', '2022-01-25', '2022-01-25 05:10:43', '2022-01-25 05:10:43'),
(3, 3, 1, 'RR-20220126033857131', '2022-01-26', '2022-01-25 21:38:57', '2022-01-25 21:38:57'),
(4, 3, 1, 'RR-20220127034234182', '2022-01-27', '2022-01-26 21:42:34', '2022-01-26 21:42:34'),
(5, 5, 1, 'RR-20220127075712126', '2022-01-27', '2022-01-27 01:57:12', '2022-01-27 01:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'SuperAdmin', 'web', '2022-01-24 05:05:11', '2022-01-24 05:05:11'),
(2, 'Admin', 'web', '2022-01-25 05:22:44', '2022-01-25 05:22:44'),
(3, 'User', 'web', '2022-01-25 21:22:55', '2022-01-25 21:22:55');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(14, 2),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(23, 2),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 2),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(31, 2),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(35, 2),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(39, 2),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(43, 2),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(47, 2),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(52, 3),
(53, 1),
(53, 2),
(53, 3),
(54, 1),
(54, 2),
(54, 3),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(60, 2),
(61, 1),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(65, 1),
(65, 2),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(72, 1),
(72, 2),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(79, 1),
(79, 2),
(80, 1),
(81, 1),
(82, 1);

-- --------------------------------------------------------

--
-- Table structure for table `signitures`
--

DROP TABLE IF EXISTS `signitures`;
CREATE TABLE IF NOT EXISTS `signitures` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `signitures_created_by_foreign` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `signitures`
--

INSERT INTO `signitures` (`id`, `created_by`, `name`, `path`, `designation`, `department`, `institution`, `signature_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Atik', '', 'Assistant Teacher', 'IT', 'KYALSC', '1', '1', NULL, NULL),
(2, 1, 'Md. Teriqul Islam', '', 'Deputy of IT Manager & Head', 'IT', 'KYAMCH', '1', '1', NULL, NULL),
(3, 1, 'Dr. Rubaiyat Farzana Hussain', '', 'Member', 'N/A', 'KYAMCH', '1', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `supplier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suppliers_created_by_foreign` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `created_by`, `supplier`, `email`, `mobile`, `phone`, `address`, `website`, `contact_person`, `created_at`, `updated_at`) VALUES
(1, 1, 'Smart', 'smart@gmail.com', '0162000365', '01600362', 'test', 'https://dino.com', 'Hasan', '2022-01-24 21:19:47', '2022-01-24 21:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Milton Khan', 'srmiltonkhan@gmail.com', NULL, '$2y$10$quTv8noIpWdKGJYNYDJdrew8ZRA4joPIhcPfX7BuLN7.cX4Qpcid.', '1', NULL, '2022-01-24 05:05:19', '2022-01-24 05:05:19'),
(2, 'Admin', 'admin@gmail.com', NULL, '$2y$10$PNlKALGNzEv5yLYLGh9wfeCQ/sz18punbTkQGTMFKn73/CXSBDsEu', '1', NULL, '2022-01-25 05:22:58', '2022-01-25 05:22:58'),
(3, 'User', 'user@gmail.com', NULL, '$2y$10$4ANvZ3FRMzUFYxP29sRNr.tKdNjxBCFW4.24CbyLBPwFJ7irtqdBS', '1', NULL, '2022-01-25 21:23:18', '2022-01-25 21:23:18');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE IF NOT EXISTS `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(20,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouses_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 2, '698', '2022-01-24 21:20:49', '2022-01-27 01:57:13'),
(2, 1, '601', '2022-01-24 21:20:49', '2022-01-27 01:57:12');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `damage_receive_childs`
--
ALTER TABLE `damage_receive_childs`
  ADD CONSTRAINT `damage_receive_childs_damage_receive_parent_id_foreign` FOREIGN KEY (`damage_receive_parent_id`) REFERENCES `damage_receive_parents` (`id`),
  ADD CONSTRAINT `damage_receive_childs_requisition_child_id_foreign` FOREIGN KEY (`requisition_child_id`) REFERENCES `requisition_childs` (`id`);

--
-- Constraints for table `damage_receive_parents`
--
ALTER TABLE `damage_receive_parents`
  ADD CONSTRAINT `damage_receive_parents_received_by_foreign` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `damage_receive_parents_requisition_parent_id_foreign` FOREIGN KEY (`requisition_parent_id`) REFERENCES `requisition_parents` (`id`);

--
-- Constraints for table `issued_list_childs`
--
ALTER TABLE `issued_list_childs`
  ADD CONSTRAINT `issued_list_childs_issued_list_parents_id_foreign` FOREIGN KEY (`issued_list_parents_id`) REFERENCES `issued_list_parents` (`id`),
  ADD CONSTRAINT `issued_list_childs_requisition_child_id_foreign` FOREIGN KEY (`requisition_child_id`) REFERENCES `requisition_childs` (`id`);

--
-- Constraints for table `issued_list_parents`
--
ALTER TABLE `issued_list_parents`
  ADD CONSTRAINT `issued_list_parents_issued_by_foreign` FOREIGN KEY (`issued_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `issued_list_parents_requisition_vou_no_foreign` FOREIGN KEY (`requisition_vou_no`) REFERENCES `requisition_parents` (`id`);

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
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_name_foreign` FOREIGN KEY (`brand_name`) REFERENCES `product_brands` (`id`),
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `products_product_type_name_foreign` FOREIGN KEY (`product_type_name`) REFERENCES `product_types` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `product_units` (`id`);

--
-- Constraints for table `product_brands`
--
ALTER TABLE `product_brands`
  ADD CONSTRAINT `product_brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `product_brands_product_type_name_foreign` FOREIGN KEY (`product_type_name`) REFERENCES `product_types` (`id`);

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_types`
--
ALTER TABLE `product_types`
  ADD CONSTRAINT `product_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `product_types_product_category_foreign` FOREIGN KEY (`product_category`) REFERENCES `product_categories` (`id`);

--
-- Constraints for table `product_units`
--
ALTER TABLE `product_units`
  ADD CONSTRAINT `product_units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `purchases_child_tbl`
--
ALTER TABLE `purchases_child_tbl`
  ADD CONSTRAINT `purchases_child_tbl_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `purchases_child_tbl_purchase_parent_id_foreign` FOREIGN KEY (`purchase_parent_id`) REFERENCES `purchases_parent_tbl` (`id`);

--
-- Constraints for table `purchases_parent_tbl`
--
ALTER TABLE `purchases_parent_tbl`
  ADD CONSTRAINT `purchases_parent_tbl_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `purchases_parent_tbl_purchase_order_no_foreign` FOREIGN KEY (`purchase_order_no`) REFERENCES `purchase_order_parents` (`id`),
  ADD CONSTRAINT `purchases_parent_tbl_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `purchase_order_childs`
--
ALTER TABLE `purchase_order_childs`
  ADD CONSTRAINT `purchase_order_childs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `purchase_order_childs_purchase_order_no_foreign` FOREIGN KEY (`purchase_order_no`) REFERENCES `purchase_order_parents` (`id`);

--
-- Constraints for table `purchase_order_parents`
--
ALTER TABLE `purchase_order_parents`
  ADD CONSTRAINT `purchase_order_parents_prepared_by_foreign` FOREIGN KEY (`prepared_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `requisition_childs`
--
ALTER TABLE `requisition_childs`
  ADD CONSTRAINT `requisition_childs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `requisition_childs_requisition_parent_id_foreign` FOREIGN KEY (`requisition_parent_id`) REFERENCES `requisition_parents` (`id`);

--
-- Constraints for table `requisition_parents`
--
ALTER TABLE `requisition_parents`
  ADD CONSTRAINT `requisition_parents_requisition_by_foreign` FOREIGN KEY (`requisition_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `return_receive_childs`
--
ALTER TABLE `return_receive_childs`
  ADD CONSTRAINT `return_receive_childs_requisition_child_id_foreign` FOREIGN KEY (`requisition_child_id`) REFERENCES `requisition_childs` (`id`),
  ADD CONSTRAINT `return_receive_childs_return_receive_parent_id_foreign` FOREIGN KEY (`return_receive_parent_id`) REFERENCES `return_receive_parents` (`id`);

--
-- Constraints for table `return_receive_parents`
--
ALTER TABLE `return_receive_parents`
  ADD CONSTRAINT `return_receive_parents_received_by_foreign` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `return_receive_parents_requisition_parent_id_foreign` FOREIGN KEY (`requisition_parent_id`) REFERENCES `requisition_parents` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `signitures`
--
ALTER TABLE `signitures`
  ADD CONSTRAINT `signitures_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD CONSTRAINT `warehouses_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
