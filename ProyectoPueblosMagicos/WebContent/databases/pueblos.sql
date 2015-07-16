-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema paispueblos
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `paispueblos` ;

-- -----------------------------------------------------
-- Schema paispueblos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `paispueblos` DEFAULT CHARACTER SET latin1 ;
SHOW WARNINGS;
USE `paispueblos` ;

-- -----------------------------------------------------
-- Table `paispueblos`.`pueblosmagicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paispueblos`.`pueblosmagicos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `descripcion` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `coordenadasGPS` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `paispueblos`.`estadosalfa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paispueblos`.`estadosalfa` (
  `estadoID` INT(11) NOT NULL COMMENT '',
  `nombreEstado` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`estadoID`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `paispueblos`.`pueblos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paispueblos`.`pueblos` (
  `idpueblo` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre` VARCHAR(45) NOT NULL COMMENT '',
  `estado` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `latitud` DOUBLE NULL DEFAULT NULL COMMENT '',
  `longitud` DOUBLE NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idpueblo`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 84
DEFAULT CHARACTER SET = latin1;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
