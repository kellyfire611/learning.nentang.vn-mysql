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


-- Dumping database structure for nentang_learning_mysql
CREATE DATABASE IF NOT EXISTS `nentang_learning_mysql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `nentang_learning_mysql`;

-- Dumping structure for table nentang_learning_mysql.phong_ban
CREATE TABLE IF NOT EXISTS `phong_ban` (
  `pb_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pb_ma` varchar(50) DEFAULT NULL,
  `pb_ten` varchar(500) DEFAULT NULL,
  `pb_quan_ly_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pb_id`),
  UNIQUE KEY `pb_ma` (`pb_ma`),
  KEY `FK_phong_ban_phong_ban` (`pb_quan_ly_id`),
  CONSTRAINT `FK_phong_ban_phong_ban` FOREIGN KEY (`pb_quan_ly_id`) REFERENCES `phong_ban` (`pb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nentang_learning_mysql.phong_ban: ~0 rows (approximately)
/*!40000 ALTER TABLE `phong_ban` DISABLE KEYS */;
INSERT INTO `phong_ban` (`pb_id`, `pb_ma`, `pb_ten`, `pb_quan_ly_id`) VALUES
	(1, 'GD', 'Phòng Giám đốc', NULL),
	(2, 'PGD1', 'Phòng Phó Giám đốc 1', 1),
	(3, 'PGD2', 'Phòng Phó Giám đốc 2', 1),
	(4, 'PTK', 'Phòng Thiết kế', 2),
	(5, 'PTCTC', 'Phòng Tổ chức Thi công', 2),
	(6, 'KCCMTC', 'Kho Công cụ - Máy Thi Công', 2),
	(7, 'PXNT', 'Phân xưởng Nội thất', 3),
	(8, 'PKD', 'Phòng Kinh Doanh', 3),
	(9, 'PDVKH', 'Phòng Dịch vụ Khách hàng', 3),
	(10, 'TXDT', 'Tổ xây dựng Thô', 5),
	(11, 'THT', 'Tổ Hoàn thiện', 5),
	(12, 'TDN', 'Tổ Điện nước', 5),
	(13, 'GCDG', 'Gia công Đồ gỗ (Mộc)', 7),
	(14, 'GCNSK', 'Gia công Nhôm-Sắt-Kính', 7);
/*!40000 ALTER TABLE `phong_ban` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
