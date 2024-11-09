-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ql_mamnon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ql_mamnon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ql_mamnon` DEFAULT CHARACTER SET utf8mb4 ;
USE `ql_mamnon` ;

-- -----------------------------------------------------
-- Table `ql_mamnon`.`phuhuynh`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ql_mamnon`.`phuhuynh` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ph_ma` VARCHAR(255) UNIQUE NOT NULL,
  `ph_ten` VARCHAR(500) NOT NULL,
  `ph_diengiai` MEDIUMTEXT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ql_mamnon`.`lop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ql_mamnon`.`lop` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lop_ma` VARCHAR(255) UNIQUE NOT NULL,
  `lop_ten` VARCHAR(500) NOT NULL,
  `lop_diengiai` MEDIUMTEXT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ql_mamnon`.`hocsinh`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ql_mamnon`.`hocsinh` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hs_ma` VARCHAR(255) UNIQUE NOT NULL,
  `hs_hoten` VARCHAR(500) NOT NULL,
  `hs_diengiai` MEDIUMTEXT NULL,
  `ph_cha_id` BIGINT UNSIGNED NULL,
  `ph_me_id` BIGINT UNSIGNED NULL,
  `lop_id` BIGINT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_ph_cha`
    FOREIGN KEY (`ph_cha_id`)
    REFERENCES `ql_mamnon`.`phuhuynh` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ph_me`
    FOREIGN KEY (`ph_me_id`)
    REFERENCES `ql_mamnon`.`phuhuynh` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hocsinh_lop`
    FOREIGN KEY (`lop_id`)
    REFERENCES `ql_mamnon`.`lop` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ql_mamnon`.`giaovien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ql_mamnon`.`giaovien` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `gv_ma` VARCHAR(255) UNIQUE NOT NULL,
  `gv_ten` VARCHAR(500) NOT NULL,
  `gv_diengiai` MEDIUMTEXT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ql_mamnon`.`phancong_giangday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ql_mamnon`.`phancong_giangday` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `gv_id` BIGINT UNSIGNED NOT NULL,
  `lop_id` BIGINT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_phancong_gv`
    FOREIGN KEY (`gv_id`)
    REFERENCES `ql_mamnon`.`giaovien` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_phancong_lop`
    FOREIGN KEY (`lop_id`)
    REFERENCES `ql_mamnon`.`lop` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ql_mamnon`.`dm_diemdanh_kyhieu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ql_mamnon`.`dm_diemdanh_kyhieu` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dd_kyhieu_ma` VARCHAR(255) UNIQUE NOT NULL,
  `dd_kyhieu_ten` VARCHAR(500) NOT NULL,
  `dd_kyhieu_diengiai` MEDIUMTEXT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ql_mamnon`.`diemdanh`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ql_mamnon`.`diemdanh` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dd_ngay` TIMESTAMP NOT NULL,
  `dd_kyhieu_id` BIGINT UNSIGNED NOT NULL,
  `hs_id` BIGINT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_diemdanh_hocsinh`
    FOREIGN KEY (`hs_id`)
    REFERENCES `ql_mamnon`.`hocsinh` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diemdanh_kyhieu`
    FOREIGN KEY (`dd_kyhieu_id`)
    REFERENCES `ql_mamnon`.`dm_diemdanh_kyhieu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ql_mamnon`.`dm_chiphi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ql_mamnon`.`dm_chiphi` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cp_ma` VARCHAR(255) UNIQUE NOT NULL,
  `cp_ten` VARCHAR(500) NOT NULL,
  `cp_mota` MEDIUMTEXT NULL,
  `cp_gia` DECIMAL NULL,
  `cp_ngay_batdau_apdung` TIMESTAMP NULL,
  `dm_kyhieu_id` BIGINT UNSIGNED NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_chiphi_kyhieu`
    FOREIGN KEY (`dm_kyhieu_id`)
    REFERENCES `ql_mamnon`.`dm_diemdanh_kyhieu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ql_mamnon`.`hoadon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ql_mamnon`.`hoadon` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hd_maso` VARCHAR(255) UNIQUE NOT NULL,
  `hd_ngaytao` TIMESTAMP NOT NULL,
  `hd_diengiai` MEDIUMTEXT NULL,
  `hd_trangthai` VARCHAR(45) NULL,
  `hs_id` BIGINT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_hoadon_hocsinh`
    FOREIGN KEY (`hs_id`)
    REFERENCES `ql_mamnon`.`hocsinh` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ql_mamnon`.`hoadon_chitiet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ql_mamnon`.`hoadon_chitiet` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hd_id` BIGINT UNSIGNED NOT NULL,
  `dm_cp_id` BIGINT UNSIGNED NOT NULL,
  `hdct_soluong` DECIMAL NULL,
  `hdct_gia` DECIMAL NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_chitiet_hoadon`
    FOREIGN KEY (`hd_id`)
    REFERENCES `ql_mamnon`.`hoadon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chitiet_chiphi`
    FOREIGN KEY (`dm_cp_id`)
    REFERENCES `ql_mamnon`.`dm_chiphi` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
