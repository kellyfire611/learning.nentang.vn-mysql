-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for netashop
CREATE DATABASE IF NOT EXISTS `netashop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `netashop`;

-- Dumping structure for table netashop.acl_permissions
CREATE TABLE IF NOT EXISTS `acl_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên Quyền',
  `display_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tên Quyền thân thiện (dễ hiểu cho người dùng)',
  `guard_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên guard bảo vệ',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu về Quyền';

-- Data exporting was unselected.

-- Dumping structure for table netashop.acl_roles
CREATE TABLE IF NOT EXISTS `acl_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên Vai trò',
  `display_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tên Vai trò thân thiện (dễ hiểu với người dùng)',
  `guard_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên guard bảo vệ',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu về Vai trò';

-- Data exporting was unselected.

-- Dumping structure for table netashop.acl_role_has_permissions
CREATE TABLE IF NOT EXISTS `acl_role_has_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '(FK) Vai trò nào?',
  `permission_id` bigint(20) unsigned NOT NULL COMMENT '(FK) Quyền nào?',
  PRIMARY KEY (`id`),
  KEY `FK_acl_role_has_permissions_acl_permissions` (`permission_id`),
  KEY `FK_acl_role_has_permissions_acl_roles` (`role_id`),
  CONSTRAINT `FK_acl_role_has_permissions_acl_permissions` FOREIGN KEY (`permission_id`) REFERENCES `acl_permissions` (`id`),
  CONSTRAINT `FK_acl_role_has_permissions_acl_roles` FOREIGN KEY (`role_id`) REFERENCES `acl_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu xác định Vai trò nào <-> Có những Quyền nào?';

-- Data exporting was unselected.

-- Dumping structure for table netashop.acl_users
CREATE TABLE IF NOT EXISTS `acl_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mật khẩu (mặc định: user@123)',
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Họ và tên lót',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Giới tính: #0: Nam; #1: Nữ',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email',
  `birthday` datetime DEFAULT NULL COMMENT 'Ngày sinh',
  `avatar` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Hình đại diện',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã CMND / CCCD',
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Chức danh',
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Phòng',
  `manager_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Người phụ trách Quản lý',
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Số điện thoại',
  `address1` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ 1',
  `address2` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ 2',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Thành phố',
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bang',
  `postal_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã bưu chính',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Quốc gia',
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Token ghi nhớ Đăng nhập',
  `active_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã kích hoạt',
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái: #0: chưa kích hoạt; #1: đã kích hoạt',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu về Người dùng trong Hệ thống';

-- Data exporting was unselected.

-- Dumping structure for table netashop.acl_user_has_permissions
CREATE TABLE IF NOT EXISTS `acl_user_has_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '(FK) Người dùng nào?',
  `permission_id` bigint(20) unsigned NOT NULL COMMENT '(FK) Quyền nào?',
  PRIMARY KEY (`id`),
  KEY `FK_acl_model_has_permissions_acl_permissions` (`permission_id`),
  KEY `FK_acl_user_has_permissions_acl_users` (`user_id`),
  CONSTRAINT `FK_acl_model_has_permissions_acl_permissions` FOREIGN KEY (`permission_id`) REFERENCES `acl_permissions` (`id`),
  CONSTRAINT `FK_acl_user_has_permissions_acl_users` FOREIGN KEY (`user_id`) REFERENCES `acl_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu xác định Người dùng nào <-> Có những Quyền nào?';

-- Data exporting was unselected.

-- Dumping structure for table netashop.acl_user_has_roles
CREATE TABLE IF NOT EXISTS `acl_user_has_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '(FK) Người dùng nào?',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '(FK) Vai trò nào?',
  PRIMARY KEY (`id`),
  KEY `FK_acl_model_has_roles_acl_roles` (`role_id`),
  KEY `FK_acl_user_has_roles_acl_users` (`user_id`),
  CONSTRAINT `FK_acl_model_has_roles_acl_roles` FOREIGN KEY (`role_id`) REFERENCES `acl_roles` (`id`),
  CONSTRAINT `FK_acl_user_has_roles_acl_users` FOREIGN KEY (`user_id`) REFERENCES `acl_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu xác định Người dùng nào <-> Có những Vai trò nào?';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_categories
CREATE TABLE IF NOT EXISTS `shop_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `category_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã chuyên mục',
  `category_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên chuyên mục',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Diễn giải',
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ảnh đại diện',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_code` (`category_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu về các Chuyên mục (dùng để phân loại/phân nhóm Sản phẩm)';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_customers
CREATE TABLE IF NOT EXISTS `shop_customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mật khẩu (mặc định: customer@123)',
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Họ và tên lót',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên',
  `gender` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Giới tính: #0: Nam; #1: Nữ',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email',
  `birthday` datetime DEFAULT NULL COMMENT 'Ngày sinh',
  `avatar` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ảnh đại diện',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã CMND / CCCD',
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Công ty',
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Số điện thoại',
  `billing_address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ Thanh toán',
  `shipping_address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ Giao hàng',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Thành phố',
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bang',
  `postal_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã bưu chính',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Quốc gia',
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Token ghi nhớ đăng nhập',
  `activate_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã kích hoạt',
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái: #0: chưa kích hoạt; #1: đã kích hoạt',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu về Khách hàng';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_customer_vouchers
CREATE TABLE IF NOT EXISTS `shop_customer_vouchers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT 'Khách hàng nào?',
  `voucher_id` bigint(20) unsigned NOT NULL COMMENT 'Voucher nào áp dụng?',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`),
  KEY `FK_shop_customer_vouchers_shop_customers` (`customer_id`),
  KEY `FK_shop_customer_vouchers_shop_vouchers` (`voucher_id`),
  CONSTRAINT `FK_shop_customer_vouchers_shop_customers` FOREIGN KEY (`customer_id`) REFERENCES `shop_customers` (`id`),
  CONSTRAINT `FK_shop_customer_vouchers_shop_vouchers` FOREIGN KEY (`voucher_id`) REFERENCES `shop_vouchers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table lưu thông tin Khách hàng nào được áp dụng Voucher nào?\r\nCó thể lập danh sách Khách hàng bằng cách:\r\n- Tạo chức năng tự động tạo Voucher cho Khách hàng thân thiết (mua nhiều hàng hóa trong năm, ...) khi đến sinh nhật của họ.\r\n- Người thân của Giám đốc ;)';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_exports
CREATE TABLE IF NOT EXISTS `shop_exports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `store_id` bigint(20) unsigned NOT NULL COMMENT 'Xuất từ kho hàng nào?',
  `employee_id` bigint(20) unsigned NOT NULL COMMENT 'Nhân viên nào lập phiếu xuất?',
  `export_date` datetime NOT NULL COMMENT 'Ngày Xuất kho',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_shop_exports_acl_users` (`employee_id`) USING BTREE,
  KEY `FK_shop_exports_shop_stores` (`store_id`) USING BTREE,
  CONSTRAINT `FK_shop_exports_acl_users` FOREIGN KEY (`employee_id`) REFERENCES `acl_users` (`id`),
  CONSTRAINT `FK_shop_exports_shop_stores` FOREIGN KEY (`store_id`) REFERENCES `shop_stores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Bảng chứa dữ liệu về các Phiếu Xuất';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_export_details
CREATE TABLE IF NOT EXISTS `shop_export_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `export_id` bigint(20) unsigned NOT NULL COMMENT 'Thuộc phiếu Xuất nào?',
  `product_id` bigint(20) unsigned NOT NULL COMMENT 'Sản phẩm nào xuất đi?',
  `quantity` decimal(18,4) NOT NULL DEFAULT 0.0000 COMMENT 'Số lượng xuất',
  `unit_price` decimal(19,4) NOT NULL DEFAULT 0.0000 COMMENT 'Đơn giá xuất',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_shop_export_details_shop_exports` (`export_id`) USING BTREE,
  KEY `FK_shop_export_details_shop_products` (`product_id`) USING BTREE,
  CONSTRAINT `FK_shop_export_details_shop_exports` FOREIGN KEY (`export_id`) REFERENCES `shop_exports` (`id`),
  CONSTRAINT `FK_shop_export_details_shop_products` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu về các Sản phẩm được nhập trong Phiếu Nhập';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_imports
CREATE TABLE IF NOT EXISTS `shop_imports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `store_id` bigint(20) unsigned NOT NULL COMMENT 'Thuộc kho hàng nào?',
  `employee_id` bigint(20) unsigned NOT NULL COMMENT 'Nhân viên nào lập phiếu nhập?',
  `import_date` datetime NOT NULL COMMENT 'Ngày Nhập kho',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_shop_imports_acl_users` (`employee_id`),
  KEY `FK_shop_imports_shop_stores` (`store_id`),
  CONSTRAINT `FK_shop_imports_acl_users` FOREIGN KEY (`employee_id`) REFERENCES `acl_users` (`id`),
  CONSTRAINT `FK_shop_imports_shop_stores` FOREIGN KEY (`store_id`) REFERENCES `shop_stores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Bảng chứa dữ liệu về các Phiếu Nhập';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_import_details
CREATE TABLE IF NOT EXISTS `shop_import_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `import_id` bigint(20) unsigned NOT NULL COMMENT 'Thuộc phiếu Nhập nào?',
  `product_id` bigint(20) unsigned NOT NULL COMMENT 'Sản phẩm nào nhập vào?',
  `quantity` decimal(18,4) NOT NULL DEFAULT 0.0000 COMMENT 'Số lượng nhập',
  `unit_price` decimal(19,4) NOT NULL DEFAULT 0.0000 COMMENT 'Đơn giá nhập',
  PRIMARY KEY (`id`),
  KEY `FK_shop_import_details_shop_imports` (`import_id`),
  KEY `FK_shop_import_details_shop_products` (`product_id`),
  CONSTRAINT `FK_shop_import_details_shop_imports` FOREIGN KEY (`import_id`) REFERENCES `shop_imports` (`id`),
  CONSTRAINT `FK_shop_import_details_shop_products` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu về các Sản phẩm được nhập trong Phiếu Nhập';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_orders
CREATE TABLE IF NOT EXISTS `shop_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `employee_id` bigint(20) unsigned NOT NULL COMMENT 'Thuộc nhân viên nào xử lý?',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT 'Thuộc khách hàng nào?',
  `order_date` datetime NOT NULL COMMENT 'Ngày tạo Đơn hàng',
  `shipped_date` datetime DEFAULT NULL COMMENT 'Ngày giao hàng',
  `ship_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Họ tên Người giao hàng',
  `ship_address1` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Giao hàng đến Địa chỉ 1',
  `ship_address2` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Giao hàng đến Địa chỉ 2',
  `ship_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Giao hàng đến Thành phố',
  `ship_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Giao hàng đến Bang',
  `ship_postal_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Giao hàng đến Mã bưu chính',
  `ship_country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Giao hàng đến Quốc gia',
  `shipping_fee` decimal(19,4) NOT NULL DEFAULT 0.0000 COMMENT 'Phí giao hàng',
  `payment_type_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT 'Phương thức Thanh toán nào?',
  `paid_date` datetime DEFAULT NULL COMMENT 'Ngày thanh toán',
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Trạng thái: #New: mới tạo Đơn hàng -> #On Hold: đang xử lý -> #Shipped: đã giao hàng -> #Complete: đã hoàn tất đơn hàng (khách đã thanh toán và nhận hàng xong)',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`),
  KEY `FK_orders_employees` (`employee_id`),
  KEY `FK_orders_customers` (`customer_id`),
  KEY `FK_shop_orders_shop_payment_types` (`payment_type_id`),
  CONSTRAINT `FK_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `shop_customers` (`id`),
  CONSTRAINT `FK_orders_employees` FOREIGN KEY (`employee_id`) REFERENCES `acl_users` (`id`),
  CONSTRAINT `FK_shop_orders_shop_payment_types` FOREIGN KEY (`payment_type_id`) REFERENCES `shop_payment_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu về các Đơn hàng';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_order_details
CREATE TABLE IF NOT EXISTS `shop_order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `order_id` bigint(20) unsigned NOT NULL COMMENT 'Thuộc đơn hàng nào?',
  `product_id` bigint(20) unsigned NOT NULL COMMENT 'Sản phẩm nào?',
  `quantity` decimal(18,4) NOT NULL DEFAULT 0.0000 COMMENT 'Số lượng sản phẩm trong đơn hàng',
  `unit_price` decimal(19,4) NOT NULL DEFAULT 0.0000 COMMENT 'Giá bán của Sản phẩm trong Đơn hàng',
  `discount_percentage` float NOT NULL DEFAULT 0 COMMENT 'Giảm giá theo % từng Sản phẩm trong Đơn hàng',
  `discount_amout` double NOT NULL DEFAULT 0 COMMENT 'Giảm giá theo Số tiền cụ thể cho từng Sản phẩm trong Đơn hàng',
  `order_detail_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Trạng thái của từng Sản phẩm trong Đơn hàng',
  `date_allocated` datetime DEFAULT NULL COMMENT 'Ngày Sản phẩm này đã chuyển đến tay Khách hàng',
  PRIMARY KEY (`id`),
  KEY `FK_shop_order_details_shop_orders` (`order_id`),
  KEY `FK_shop_order_details_shop_products` (`product_id`),
  CONSTRAINT `FK_shop_order_details_shop_orders` FOREIGN KEY (`order_id`) REFERENCES `shop_orders` (`id`),
  CONSTRAINT `FK_shop_order_details_shop_products` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=701 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu về các Sản phẩm đã mua trong Đơn hàng';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_payment_types
CREATE TABLE IF NOT EXISTS `shop_payment_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã hình thức thanh toán',
  `payment_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên hình thức thanh toán',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Diễn giải',
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ảnh đại diện',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_code` (`payment_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='Bảng chứa dữ liệu về các Phương thức Thanh toán';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_posts
CREATE TABLE IF NOT EXISTS `shop_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `post_slug` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Đường dẫn của bài viết',
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Tiêu đề bài viết',
  `post_content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nội dung bài viết',
  `post_excerpt` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Diễn giải về Cấu hình',
  `post_type` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post' COMMENT 'Loại bài viết: #1: bài viết, #2: trang cố định',
  `post_status` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft' COMMENT 'Trạng thái bài viết: #draft: viết nháp; #publish: đăng lên trang web; ...',
  `post_image` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ảnh đại diện bài viết',
  `user_id` bigint(20) unsigned NOT NULL COMMENT 'Tác giả bài viết',
  `post_category_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Thuộc chuyên mục nào?',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_shop_posts_acl_users` (`user_id`),
  KEY `FK_shop_posts_shop_post_categories` (`post_category_id`),
  CONSTRAINT `FK_shop_posts_acl_users` FOREIGN KEY (`user_id`) REFERENCES `acl_users` (`id`),
  CONSTRAINT `FK_shop_posts_shop_post_categories` FOREIGN KEY (`post_category_id`) REFERENCES `shop_post_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Bảng chứa dữ liệu về các Bài viết PR trên trang web';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_post_categories
CREATE TABLE IF NOT EXISTS `shop_post_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `post_category_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã chuyên mục',
  `post_category_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên chuyên mục',
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Diễn giải',
  `image` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ảnh đại diện',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `category_code` (`post_category_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Bảng chứa dữ liệu về các Chuyên mục (dùng để phân loại/phân nhóm các Bài viết/Trang)';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_products
CREATE TABLE IF NOT EXISTS `shop_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `product_code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã sản phẩm',
  `product_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên sản phẩm',
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ảnh đại diện',
  `short_description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mô tả ngắn',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mô tả',
  `standard_cost` decimal(19,4) NOT NULL DEFAULT 0.0000 COMMENT 'Giá nhập',
  `list_price` decimal(19,4) NOT NULL DEFAULT 0.0000 COMMENT 'Giá niêm yết (giá bán)',
  `quantity_per_unit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Số lượng hiện có của mỗi Sản phẩm (số lượng thực có trong kho)',
  `discontinued` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Xác định Sản phẩm này là Ngưng bán?',
  `is_featured` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Có phải là Sản phẩm nổi bật không?',
  `is_new` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Có phải là Sản phẩm mới nhập về không?',
  `category_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Thuộc chuyên mục nào?',
  `supplier_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Thuộc nhà cung cấp nào?',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`),
  KEY `FK_products_categories` (`category_id`),
  KEY `FK_products_suppliers` (`supplier_id`),
  CONSTRAINT `FK_products_categories` FOREIGN KEY (`category_id`) REFERENCES `shop_categories` (`id`),
  CONSTRAINT `FK_products_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `shop_suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu về các Sản phẩm';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_product_discounts
CREATE TABLE IF NOT EXISTS `shop_product_discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `product_id` bigint(20) unsigned NOT NULL COMMENT 'Thuộc sản phẩm nào?',
  `discount_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên Sự kiện Giảm giá',
  `discount_amount` double NOT NULL DEFAULT 0 COMMENT '% giảm giá hoặc số tiền giảm giá cụ thể',
  `is_fixed` bit(1) NOT NULL DEFAULT b'0' COMMENT '#True(1): giảm giá theo số tiền cụ thể; #False(0) giảm giá theo %',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Ngày bắt đầu Giảm giá',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Ngày kết thúc Giảm giá',
  PRIMARY KEY (`id`),
  KEY `FK_product_images_products` (`product_id`),
  CONSTRAINT `shop_product_discounts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Table chứa thông tin các sản phẩm đang được khuyến mãi trong khoảng thời gian (từ ngày - đến ngày hết hạn).\r\nThường dùng cho các chức năng:\r\n- Hiển thị danh sách Sản phẩm với Giá tiền cũ và Giá tiền mới.\r\n- Hiển thị danh sách Sản phẩm với % được giảm giá...';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_product_images
CREATE TABLE IF NOT EXISTS `shop_product_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `product_id` bigint(20) unsigned NOT NULL COMMENT 'Thuộc sản phẩm nào?',
  `image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ảnh sản phẩm',
  PRIMARY KEY (`id`),
  KEY `FK_product_images_products` (`product_id`),
  CONSTRAINT `FK_product_images_products` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu về các Hình ảnh liên quan của Sản phẩm (1 Sản phẩm nên chụp nhiều góc cạnh để Khách hàng có cái nhìn khách quan)';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_product_reviews
CREATE TABLE IF NOT EXISTS `shop_product_reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `product_id` bigint(20) unsigned NOT NULL COMMENT 'Sản phẩm nào được Đánh giá?',
  `customer_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT 'Khách hàng nào đánh giá?',
  `rating` float NOT NULL COMMENT 'Số điểm đánh giá: từ 0 -> 5 sao',
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nội dung Đánh giá',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`),
  KEY `FK_product_reviews_products` (`product_id`),
  KEY `FK_shop_product_reviews_shop_customers` (`customer_id`),
  CONSTRAINT `FK_product_reviews_products` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`),
  CONSTRAINT `FK_shop_product_reviews_shop_customers` FOREIGN KEY (`customer_id`) REFERENCES `shop_customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu các Đánh giá về Sản phẩm';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_product_vouchers
CREATE TABLE IF NOT EXISTS `shop_product_vouchers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `product_id` bigint(20) unsigned NOT NULL COMMENT 'Sản phẩm nào?',
  `voucher_id` bigint(20) unsigned NOT NULL COMMENT 'Voucher nào áp dụng?',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`),
  KEY `FK_shop_product_vouchers_shop_products` (`product_id`),
  KEY `FK_shop_product_vouchers_shop_vouchers` (`voucher_id`),
  CONSTRAINT `FK_shop_product_vouchers_shop_products` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`),
  CONSTRAINT `FK_shop_product_vouchers_shop_vouchers` FOREIGN KEY (`voucher_id`) REFERENCES `shop_vouchers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Table lưu thông tin Sản phẩm nào được áp dụng Voucher nào?';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_settings
CREATE TABLE IF NOT EXISTS `shop_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `group` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Phân nhóm Cấu hình',
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã Cấu hình',
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Giá trị Cấu hình',
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Diễn giải về Cấu hình',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng chứa dữ liệu về các Cấu hình sử dụng trong Hệ thống';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_stores
CREATE TABLE IF NOT EXISTS `shop_stores` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `store_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã kho',
  `store_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên kho',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Diễn giải',
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ảnh đại diện',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `category_code` (`store_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='Bảng chứa dữ liệu về Kho hàng';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_suppliers
CREATE TABLE IF NOT EXISTS `shop_suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `supplier_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã nhà cung cấp',
  `supplier_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên nhà cung cấp',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Diễn giải',
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ảnh đại diện',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_code` (`supplier_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='Bảng chứa dữ liệu về các Nhà cung cấp';

-- Data exporting was unselected.

-- Dumping structure for table netashop.shop_vouchers
CREATE TABLE IF NOT EXISTS `shop_vouchers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  `voucher_code` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã voucher',
  `voucher_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên voucher',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mô tả voucher',
  `uses` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Số lượng voucher đã sử dụng',
  `max_uses` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Số lượng tối đa voucher có thể sử dụng. Nếu =0 là không xác định',
  `max_uses_user` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Người dùng có thể sử dụng voucher này bao nhiêu lần? Nếu =0 là không xác định',
  `type` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT 'Loại voucher: #1: voucher, #2: coupon',
  `discount_amount` double unsigned NOT NULL DEFAULT 0 COMMENT '% giảm giá hoặc số tiền giảm giá cụ thể',
  `is_fixed` bit(1) NOT NULL DEFAULT b'1' COMMENT '#True(1): giảm giá theo số tiền cụ thể; #False(0): giảm giá theo %',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Ngày bắt đầu voucher',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Ngày kết thúc voucher',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo mới',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày xóa',
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucher_code` (`voucher_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Table lưu thông tin Danh sách các phiếu Khuyến mãi, Giảm giá. Thông thường:\r\n1. Voucher (phiếu khuyến mãi): giảm theo số tiền cụ thể\r\n2. Coupon (phiếu giảm giá %): thường giảm theo % giá trị đơn hàng\r\n';

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
