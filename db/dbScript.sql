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
-- Table `LernadoDB`.`offer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`offer` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`offer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `text` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LernadoDB`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`user` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`user` (
  `iduser` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LernadoDB`.`offer_has_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LernadoDB`.`offer_has_user` ;

CREATE TABLE IF NOT EXISTS `LernadoDB`.`offer_has_user` (
  `offer_id` INT NOT NULL,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`offer_id`, `user_iduser`),
  INDEX `fk_offer_has_user_user1_idx` (`user_iduser` ASC),
  INDEX `fk_offer_has_user_offer_idx` (`offer_id` ASC),
  CONSTRAINT `fk_offer_has_user_offer`
    FOREIGN KEY (`offer_id`)
    REFERENCES `LernadoDB`.`offer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_has_user_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `LernadoDB`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
