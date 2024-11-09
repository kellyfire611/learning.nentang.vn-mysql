-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ql_mamnon
CREATE DATABASE IF NOT EXISTS `ql_mamnon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `ql_mamnon`;

-- Dumping structure for table ql_mamnon.diemdanh
CREATE TABLE IF NOT EXISTS `diemdanh` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dd_ngay` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dd_kyhieu_id` bigint(20) unsigned NOT NULL,
  `hs_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_diemdanh_hocsinh` (`hs_id`),
  KEY `fk_diemdanh_kyhieu` (`dd_kyhieu_id`),
  CONSTRAINT `fk_diemdanh_hocsinh` FOREIGN KEY (`hs_id`) REFERENCES `hocsinh` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_diemdanh_kyhieu` FOREIGN KEY (`dd_kyhieu_id`) REFERENCES `dm_diemdanh_kyhieu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ql_mamnon.diemdanh: ~18 rows (approximately)
INSERT INTO `diemdanh` (`id`, `dd_ngay`, `dd_kyhieu_id`, `hs_id`, `created_at`, `updated_at`) VALUES
	(1, '2024-11-07 17:00:00', 1, 1, '2024-11-08 18:32:49', NULL),
	(2, '2024-11-07 17:00:00', 4, 1, '2024-11-08 18:32:49', NULL),
	(3, '2024-11-08 17:00:00', 1, 1, '2024-11-08 18:32:49', NULL),
	(4, '2024-11-08 17:00:00', 5, 1, '2024-11-08 18:32:49', NULL),
	(5, '2024-11-10 17:00:00', 2, 1, '2024-11-08 18:32:49', NULL),
	(6, '2024-11-07 17:00:00', 1, 2, '2024-11-08 18:32:49', NULL),
	(7, '2024-11-08 17:00:00', 3, 2, '2024-11-08 18:32:49', NULL),
	(8, '2024-11-10 17:00:00', 2, 2, '2024-11-08 18:32:49', NULL),
	(9, '2024-11-07 17:00:00', 1, 3, '2024-11-08 18:32:49', NULL),
	(10, '2024-11-08 17:00:00', 5, 3, '2024-11-08 18:32:49', NULL),
	(11, '2024-11-10 17:00:00', 1, 3, '2024-11-08 18:32:49', NULL),
	(12, '2024-11-10 17:00:00', 4, 3, '2024-11-08 18:32:49', NULL),
	(13, '2024-11-07 17:00:00', 1, 4, '2024-11-08 18:32:49', NULL),
	(14, '2024-11-08 17:00:00', 1, 4, '2024-11-08 18:32:49', NULL),
	(15, '2024-11-10 17:00:00', 1, 4, '2024-11-08 18:32:49', NULL),
	(16, '2024-11-07 17:00:00', 1, 5, '2024-11-08 18:32:49', NULL),
	(17, '2024-11-08 17:00:00', 1, 5, '2024-11-08 18:32:49', NULL),
	(18, '2024-11-10 17:00:00', 1, 5, '2024-11-08 18:32:49', NULL);

-- Dumping structure for table ql_mamnon.dm_chiphi
CREATE TABLE IF NOT EXISTS `dm_chiphi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cp_ma` varchar(255) NOT NULL,
  `cp_ten` varchar(500) NOT NULL,
  `cp_mota` mediumtext DEFAULT NULL,
  `cp_gia` decimal(10,0) DEFAULT NULL,
  `cp_ngay_batdau_apdung` timestamp NULL DEFAULT NULL,
  `dm_kyhieu_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cp_ma` (`cp_ma`),
  KEY `fk_chiphi_kyhieu` (`dm_kyhieu_id`),
  CONSTRAINT `fk_chiphi_kyhieu` FOREIGN KEY (`dm_kyhieu_id`) REFERENCES `dm_diemdanh_kyhieu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ql_mamnon.dm_chiphi: ~6 rows (approximately)
INSERT INTO `dm_chiphi` (`id`, `cp_ma`, `cp_ten`, `cp_mota`, `cp_gia`, `cp_ngay_batdau_apdung`, `dm_kyhieu_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'CP001', 'Học phí hàng tháng', NULL, 3280000, '2024-10-31 17:00:00', NULL, '2024-11-08 18:23:33', NULL, NULL),
	(2, 'CP002', 'Tiền ăn hàng tháng', NULL, 830000, '2024-10-31 17:00:00', NULL, '2024-11-08 18:26:21', NULL, NULL),
	(3, 'CP003', 'Phụ thu sau 17h ngày thường (T2-T6)', NULL, 15000, '2024-10-31 17:00:00', 4, '2024-11-08 18:26:21', NULL, NULL),
	(4, 'CP004', 'Phụ thu ở lại chiều T7', NULL, 60000, '2024-10-31 17:00:00', 5, '2024-11-08 18:26:21', NULL, NULL),
	(5, 'CP005', 'Giảm trừ nghỉ học ngày thường (T2-T6)', NULL, -33000, '2024-10-31 17:00:00', 2, '2024-11-08 18:26:21', NULL, NULL),
	(6, 'CP006', 'Giảm trừ nghỉ học ngày T7', NULL, -25000, '2024-10-31 17:00:00', 3, '2024-11-08 18:26:21', NULL, NULL);

-- Dumping structure for table ql_mamnon.dm_diemdanh_kyhieu
CREATE TABLE IF NOT EXISTS `dm_diemdanh_kyhieu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dd_kyhieu_ma` varchar(255) NOT NULL,
  `dd_kyhieu_ten` varchar(500) NOT NULL,
  `dd_kyhieu_diengiai` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dd_kyhieu_ma` (`dd_kyhieu_ma`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ql_mamnon.dm_diemdanh_kyhieu: ~5 rows (approximately)
INSERT INTO `dm_diemdanh_kyhieu` (`id`, `dd_kyhieu_ma`, `dd_kyhieu_ten`, `dd_kyhieu_diengiai`, `created_at`, `updated_at`) VALUES
	(1, '+', 'Đi học', NULL, '2024-11-08 18:22:43', NULL),
	(2, '-NT', 'Nghỉ ngày thường (T2-T6)', NULL, '2024-11-08 18:22:43', NULL),
	(3, '-NCT', 'Nghỉ ngày cuối tuần (T7)', NULL, '2024-11-08 18:22:43', NULL),
	(4, '#17h', 'Ở lại sau 17h (T2-T6)', NULL, '2024-11-08 18:22:43', NULL),
	(5, '#CT7', 'Ở lại chiều T7', NULL, '2024-11-08 18:22:43', NULL);

-- Dumping structure for table ql_mamnon.giaovien
CREATE TABLE IF NOT EXISTS `giaovien` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gv_ma` varchar(255) NOT NULL,
  `gv_ten` varchar(500) NOT NULL,
  `gv_diengiai` mediumtext DEFAULT 'CURRENT_TIMESTAMP',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gv_ma` (`gv_ma`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ql_mamnon.giaovien: ~2 rows (approximately)
INSERT INTO `giaovien` (`id`, `gv_ma`, `gv_ten`, `gv_diengiai`, `created_at`, `updated_at`) VALUES
	(1, 'GV001', 'Dương Nguyễn Phú Cường', 'Giáo viên dạy các môn năng khiếu', '2024-11-08 18:08:46', NULL),
	(2, 'GV002', 'Trương Thị Lam', 'Giáo viên dạy thanh nhạc, trông trẻ', '2024-11-08 18:08:46', NULL);

-- Dumping structure for table ql_mamnon.hoadon
CREATE TABLE IF NOT EXISTS `hoadon` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hd_maso` varchar(255) NOT NULL,
  `hd_ngaytao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hd_diengiai` mediumtext DEFAULT NULL,
  `hd_trangthai` varchar(45) DEFAULT NULL,
  `hs_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hd_maso` (`hd_maso`),
  KEY `fk_hoadon_hocsinh` (`hs_id`),
  CONSTRAINT `fk_hoadon_hocsinh` FOREIGN KEY (`hs_id`) REFERENCES `hocsinh` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ql_mamnon.hoadon: ~5 rows (approximately)
INSERT INTO `hoadon` (`id`, `hd_maso`, `hd_ngaytao`, `hd_diengiai`, `hd_trangthai`, `hs_id`, `created_at`, `updated_at`) VALUES
	(1, 'HD001', '2024-11-11 17:00:00', NULL, 'new', 1, '2024-11-08 18:40:06', NULL),
	(2, 'HD002', '2024-11-11 17:00:00', NULL, 'new', 2, '2024-11-08 18:40:06', NULL),
	(3, 'HD003', '2024-11-11 17:00:00', NULL, 'new', 3, '2024-11-08 18:40:06', NULL),
	(4, 'HD004', '2024-11-11 17:00:00', NULL, 'new', 4, '2024-11-08 18:40:06', NULL),
	(5, 'HD005', '2024-11-11 17:00:00', NULL, 'new', 5, '2024-11-08 18:40:06', NULL);

-- Dumping structure for table ql_mamnon.hoadon_chitiet
CREATE TABLE IF NOT EXISTS `hoadon_chitiet` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hd_id` bigint(20) unsigned NOT NULL,
  `dm_cp_id` bigint(20) unsigned NOT NULL,
  `hdct_soluong` decimal(10,0) DEFAULT NULL,
  `hdct_gia` decimal(10,0) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chitiet_hoadon` (`hd_id`),
  KEY `fk_chitiet_chiphi` (`dm_cp_id`),
  CONSTRAINT `fk_chitiet_chiphi` FOREIGN KEY (`dm_cp_id`) REFERENCES `dm_chiphi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_chitiet_hoadon` FOREIGN KEY (`hd_id`) REFERENCES `hoadon` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ql_mamnon.hoadon_chitiet: ~17 rows (approximately)
INSERT INTO `hoadon_chitiet` (`id`, `hd_id`, `dm_cp_id`, `hdct_soluong`, `hdct_gia`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 3280000, '2024-11-08 18:46:15', NULL),
	(2, 1, 2, 1, 830000, '2024-11-08 18:46:15', NULL),
	(3, 1, 3, 1, 15000, '2024-11-08 18:46:15', NULL),
	(4, 1, 4, 1, 60000, '2024-11-08 18:46:15', NULL),
	(5, 1, 5, 1, -33000, '2024-11-08 18:46:15', NULL),
	(6, 2, 1, 1, 3280000, '2024-11-08 18:46:15', NULL),
	(7, 2, 2, 1, 830000, '2024-11-08 18:46:15', NULL),
	(8, 2, 6, 1, -25000, '2024-11-08 18:46:15', NULL),
	(9, 2, 5, 1, -33000, '2024-11-08 18:46:15', NULL),
	(10, 3, 1, 1, 3280000, '2024-11-08 18:46:15', NULL),
	(11, 3, 2, 1, 830000, '2024-11-08 18:46:15', NULL),
	(12, 3, 4, 1, 60000, '2024-11-08 18:46:15', NULL),
	(13, 3, 3, 1, 15000, '2024-11-08 18:46:15', NULL),
	(14, 4, 1, 1, 3280000, '2024-11-08 18:46:15', NULL),
	(15, 4, 2, 1, 830000, '2024-11-08 18:46:15', NULL),
	(16, 5, 1, 1, 3280000, '2024-11-08 18:46:15', NULL),
	(17, 5, 2, 1, 830000, '2024-11-08 18:46:15', NULL);

-- Dumping structure for table ql_mamnon.hocsinh
CREATE TABLE IF NOT EXISTS `hocsinh` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hs_ma` varchar(255) NOT NULL,
  `hs_hoten` varchar(500) NOT NULL,
  `hs_diengiai` mediumtext DEFAULT NULL,
  `ph_cha_id` bigint(20) unsigned DEFAULT NULL,
  `ph_me_id` bigint(20) unsigned DEFAULT NULL,
  `lop_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hs_ma` (`hs_ma`),
  KEY `fk_ph_cha` (`ph_cha_id`),
  KEY `fk_ph_me` (`ph_me_id`),
  KEY `fk_hocsinh_lop` (`lop_id`),
  CONSTRAINT `fk_hocsinh_lop` FOREIGN KEY (`lop_id`) REFERENCES `lop` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ph_cha` FOREIGN KEY (`ph_cha_id`) REFERENCES `phuhuynh` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ph_me` FOREIGN KEY (`ph_me_id`) REFERENCES `phuhuynh` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ql_mamnon.hocsinh: ~5 rows (approximately)
INSERT INTO `hocsinh` (`id`, `hs_ma`, `hs_hoten`, `hs_diengiai`, `ph_cha_id`, `ph_me_id`, `lop_id`, `created_at`, `updated_at`) VALUES
	(1, 'HS001', 'Nguyễn Duy Nhất', NULL, 1, 4, 1, '2024-11-08 18:19:09', NULL),
	(2, 'HS002', 'Vũ Minh Khôi', NULL, 2, 5, 1, '2024-11-08 18:19:09', NULL),
	(3, 'HS003', 'Trịnh Hải Đăng', NULL, 3, 6, 4, '2024-11-08 18:19:09', NULL),
	(4, 'HS004', 'Phạm Quỳnh Chi', NULL, 7, 8, 7, '2024-11-08 18:19:09', NULL),
	(5, 'HS005', 'Trần Minh Quang', NULL, 9, 10, 10, '2024-11-08 18:19:09', NULL);

-- Dumping structure for table ql_mamnon.lop
CREATE TABLE IF NOT EXISTS `lop` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lop_ma` varchar(255) NOT NULL,
  `lop_ten` varchar(500) NOT NULL,
  `lop_diengiai` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lop_ma` (`lop_ma`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ql_mamnon.lop: ~10 rows (approximately)
INSERT INTO `lop` (`id`, `lop_ma`, `lop_ten`, `lop_diengiai`, `created_at`, `updated_at`) VALUES
	(1, 'MAM1', 'Lớp mầm 1', NULL, '2024-11-08 18:01:33', NULL),
	(2, 'MAM2', 'Lớp mầm 2', NULL, '2024-11-08 18:02:42', NULL),
	(3, 'MAM3', 'Lớp mầm 3', NULL, '2024-11-08 18:02:54', NULL),
	(4, 'CHOI1', 'Lớp chồi 1', NULL, '2024-11-08 18:03:11', NULL),
	(5, 'CHOI2', 'Lớp chồi 2', NULL, '2024-11-08 18:03:19', NULL),
	(6, 'CHOI3', 'Lớp chồi 3', NULL, '2024-11-08 18:03:26', NULL),
	(7, 'LA1', 'Lớp lá 1', NULL, '2024-11-08 18:03:37', NULL),
	(8, 'LA2', 'Lớp lá 2', NULL, '2024-11-08 18:03:45', NULL),
	(9, 'LA3', 'Lớp lá 3', NULL, '2024-11-08 18:03:54', NULL),
	(10, 'LA4', 'Lớp lá 4', NULL, '2024-11-08 18:04:02', NULL);

-- Dumping structure for table ql_mamnon.phancong_giangday
CREATE TABLE IF NOT EXISTS `phancong_giangday` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gv_id` bigint(20) unsigned NOT NULL,
  `lop_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_phancong_gv` (`gv_id`),
  KEY `fk_phancong_lop` (`lop_id`),
  CONSTRAINT `fk_phancong_gv` FOREIGN KEY (`gv_id`) REFERENCES `giaovien` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_phancong_lop` FOREIGN KEY (`lop_id`) REFERENCES `lop` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ql_mamnon.phancong_giangday: ~10 rows (approximately)
INSERT INTO `phancong_giangday` (`id`, `gv_id`, `lop_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 4),
	(4, 1, 7),
	(5, 1, 8),
	(6, 2, 3),
	(7, 2, 5),
	(8, 2, 6),
	(9, 2, 9),
	(10, 2, 10);

-- Dumping structure for table ql_mamnon.phuhuynh
CREATE TABLE IF NOT EXISTS `phuhuynh` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ph_ma` varchar(255) NOT NULL,
  `ph_ten` varchar(500) NOT NULL,
  `ph_diengiai` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ph_ma` (`ph_ma`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ql_mamnon.phuhuynh: ~10 rows (approximately)
INSERT INTO `phuhuynh` (`id`, `ph_ma`, `ph_ten`, `ph_diengiai`, `created_at`, `updated_at`) VALUES
	(1, 'PH001', 'Nguyễn Hữu Chỉnh', NULL, '2024-11-08 18:15:54', NULL),
	(2, 'PH002', 'Đỗ Mạnh Toàn', NULL, '2024-11-08 18:15:54', NULL),
	(3, 'PH003', 'Trịnh Văn Toản', NULL, '2024-11-08 18:15:54', NULL),
	(4, 'PH004', 'Tạ Thị Hà', NULL, '2024-11-08 18:15:54', NULL),
	(5, 'PH005', 'Phạm Thị Thanh Nhàn', NULL, '2024-11-08 18:15:54', NULL),
	(6, 'PH006', 'Đinh Thị Tình', NULL, '2024-11-08 18:15:54', NULL),
	(7, 'PH007', 'Nguyễn Đức Thịnh', NULL, '2024-11-08 18:15:54', NULL),
	(8, 'PH008', 'Đỗ Thị Huyền', NULL, '2024-11-08 18:15:54', NULL),
	(9, 'PH009', 'Đỗ Thành Chung', NULL, '2024-11-08 18:15:54', NULL),
	(10, 'PH010', 'Nguyễn Thị Thu Duyên', NULL, '2024-11-08 18:15:54', NULL);

-- Dumping structure for procedure ql_mamnon.sp_diemdanh
DELIMITER //
CREATE PROCEDURE `sp_diemdanh`()
BEGIN
	SELECT hs.id, hs.hs_hoten
		, dd.dd_ngay
		, ddkh.dd_kyhieu_ma, ddkh.dd_kyhieu_ten
		, cp.cp_ma, cp.cp_ten, cp.cp_gia
	FROM diemdanh dd
	JOIN dm_diemdanh_kyhieu ddkh ON dd.dd_kyhieu_id = ddkh.id
	JOIN hocsinh hs ON dd.hs_id = hs.id
	LEFT JOIN dm_chiphi cp ON cp.dm_kyhieu_id = ddkh.id
	ORDER BY hs.id, dd.dd_ngay;
END//
DELIMITER ;

-- Dumping structure for procedure ql_mamnon.sp_tinh_hocphi
DELIMITER //
CREATE PROCEDURE `sp_tinh_hocphi`()
BEGIN
	SELECT hs.hs_ma, hs.hs_hoten
		, SUM(hdct.hdct_soluong * hdct.hdct_gia) AS hocphi
	FROM hoadon_chitiet hdct
	JOIN hoadon hd ON hdct.hd_id = hd.id
	JOIN hocsinh hs ON hd.hs_id = hs.id
	JOIN dm_chiphi cp ON hdct.dm_cp_id = cp.id
	GROUP BY hs.hs_ma, hs.hs_hoten;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
