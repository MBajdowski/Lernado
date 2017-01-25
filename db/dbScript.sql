-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema LernadoDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `LernadoDB` ;

-- -----------------------------------------------------
-- Schema LernadoDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LernadoDB` DEFAULT CHARACTER SET utf8 ;
USE `LernadoDB` ;

-- -----------------------------------------------------
-- Table `LernadoDB`.`admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`admin` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`admin` (
  `idadmin` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(100) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`idadmin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LernadoDB`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`user` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` NVARCHAR(100) NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `nick_name` VARCHAR(45) NULL,
  `interest` VARCHAR(45) NULL,
  `description` LONGTEXT NULL,
  `phone_number` INT NULL,
  `photo_binary` LONGBLOB NULL,
  `admin_id` INT NOT NULL,
  PRIMARY KEY (`iduser`),
  INDEX `fk_user_admin1_idx` (`admin_id` ASC),
  CONSTRAINT `fk_user_admin1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `LernadoDB`.`admin` (`idadmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LernadoDB`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`course` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`course` (
  `idcourse` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `duration` VARCHAR(45) NULL,
  `syllabus` LONGTEXT NULL,
  `price` FLOAT NULL,
  `description` LONGTEXT NULL,
  `category` VARCHAR(45) NULL,
  `level` VARCHAR(45) NULL,
  `validated` TINYINT(1) NULL,
  `highlighted` TINYINT(1) NULL,
  `photo_binary` LONGBLOB NULL,
  `is_private` TINYINT(1) NULL,
  `creator_id` INT NOT NULL,
  `admin_id` INT NOT NULL,
  PRIMARY KEY (`idcourse`),
  INDEX `fk_course_user1_idx` (`creator_id` ASC),
  INDEX `fk_course_admin1_idx` (`admin_id` ASC),
  CONSTRAINT `fk_course_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `LernadoDB`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_admin1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `LernadoDB`.`admin` (`idadmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LernadoDB`.`lesson`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`lesson` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`lesson` (
  `idlesson` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `number` INT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`idlesson`),
  INDEX `fk_lesson_course1_idx` (`course_id` ASC),
  CONSTRAINT `fk_lesson_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `LernadoDB`.`course` (`idcourse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LernadoDB`.`material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`material` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`material` (
  `idmaterial` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NULL,
  `description` LONGTEXT NULL,
  `path` MEDIUMTEXT NULL,
  `creator_id` INT NOT NULL,
  PRIMARY KEY (`idmaterial`),
  INDEX `fk_material_user1_idx` (`creator_id` ASC),
  CONSTRAINT `fk_material_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `LernadoDB`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LernadoDB`.`room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`room` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`room` (
  `idroom` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` LONGTEXT NULL,
  `is_private` TINYINT(1) NULL,
  `photo_binary` LONGBLOB NULL,
  `admin_id` INT NOT NULL,
  PRIMARY KEY (`idroom`),
  INDEX `fk_room_admin1_idx` (`admin_id` ASC),
  CONSTRAINT `fk_room_admin1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `LernadoDB`.`admin` (`idadmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LernadoDB`.`user_has_room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`user_has_room` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`user_has_room` (
  `user_iduser` INT NOT NULL,
  `room_idroom` INT NOT NULL,
  PRIMARY KEY (`user_iduser`, `room_idroom`),
  INDEX `fk_user_has_group_group1_idx` (`room_idroom` ASC),
  INDEX `fk_user_has_group_user_idx` (`user_iduser` ASC),
  CONSTRAINT `fk_user_has_group_user`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `LernadoDB`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_group_group1`
    FOREIGN KEY (`room_idroom`)
    REFERENCES `LernadoDB`.`room` (`idroom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LernadoDB`.`user_attends_course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`user_attends_course` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`user_attends_course` (
  `user_iduser` INT NOT NULL,
  `course_idcourse` INT NOT NULL,
  PRIMARY KEY (`user_iduser`, `course_idcourse`),
  INDEX `fk_user_has_course_course1_idx` (`course_idcourse` ASC),
  INDEX `fk_user_has_course_user1_idx` (`user_iduser` ASC),
  CONSTRAINT `fk_user_has_course_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `LernadoDB`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_course_course1`
    FOREIGN KEY (`course_idcourse`)
    REFERENCES `LernadoDB`.`course` (`idcourse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LernadoDB`.`user_wishlist_course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`user_wishlist_course` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`user_wishlist_course` (
  `user_iduser` INT NOT NULL,
  `course_idcourse` INT NOT NULL,
  PRIMARY KEY (`user_iduser`, `course_idcourse`),
  INDEX `fk_user_has_course1_course1_idx` (`course_idcourse` ASC),
  INDEX `fk_user_has_course1_user1_idx` (`user_iduser` ASC),
  CONSTRAINT `fk_user_has_course1_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `LernadoDB`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_course1_course1`
    FOREIGN KEY (`course_idcourse`)
    REFERENCES `LernadoDB`.`course` (`idcourse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LernadoDB`.`lesson_has_material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`lesson_has_material` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`lesson_has_material` (
  `lesson_idlesson` INT NOT NULL,
  `material_idmaterial` INT NOT NULL,
  PRIMARY KEY (`lesson_idlesson`, `material_idmaterial`),
  INDEX `fk_lesson_has_material_material1_idx` (`material_idmaterial` ASC),
  INDEX `fk_lesson_has_material_lesson1_idx` (`lesson_idlesson` ASC),
  CONSTRAINT `fk_lesson_has_material_lesson1`
    FOREIGN KEY (`lesson_idlesson`)
    REFERENCES `LernadoDB`.`lesson` (`idlesson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lesson_has_material_material1`
    FOREIGN KEY (`material_idmaterial`)
    REFERENCES `LernadoDB`.`material` (`idmaterial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LernadoDB`.`room_has_material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`room_has_material` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`room_has_material` (
  `room_idroom` INT NOT NULL,
  `material_idmaterial` INT NOT NULL,
  PRIMARY KEY (`room_idroom`, `material_idmaterial`),
  INDEX `fk_room_has_material_material1_idx` (`material_idmaterial` ASC),
  INDEX `fk_room_has_material_room1_idx` (`room_idroom` ASC),
  CONSTRAINT `fk_room_has_material_room1`
    FOREIGN KEY (`room_idroom`)
    REFERENCES `LernadoDB`.`room` (`idroom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_room_has_material_material1`
    FOREIGN KEY (`material_idmaterial`)
    REFERENCES `LernadoDB`.`material` (`idmaterial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

