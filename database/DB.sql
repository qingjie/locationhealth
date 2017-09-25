SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `emotionmap` ;
CREATE SCHEMA IF NOT EXISTS `emotionmap` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
SHOW WARNINGS;
USE `emotionmap` ;

-- -----------------------------------------------------
-- Table `emotionmap`.`day`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emotionmap`.`day` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `emotionmap`.`day` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `userId` VARCHAR(45) NULL ,
  `name` VARCHAR(45) NULL ,
  `value` VARCHAR(45) NULL ,
  `currentTime` TIMESTAMP NULL ,
  `description` VARCHAR(1000) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `emotionmap`.`emotion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emotionmap`.`emotion` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `emotionmap`.`emotion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `value` VARCHAR(45) NULL ,
  `description` VARCHAR(1000) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `emotionmap`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emotionmap`.`location` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `emotionmap`.`location` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `latitude` VARCHAR(45) NULL ,
  `longitude` VARCHAR(45) NULL ,
  `emotion_selected` VARCHAR(45) NULL ,
  `currentTime` TIMESTAMP NULL ,
  `description` VARCHAR(1000) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `emotionmap`.`month`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emotionmap`.`month` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `emotionmap`.`month` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `userId` VARCHAR(45) NULL ,
  `name` VARCHAR(45) NULL ,
  `value` VARCHAR(45) NULL ,
  `currentTime` TIMESTAMP NULL ,
  `description` VARCHAR(1000) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `emotionmap`.`week`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emotionmap`.`week` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `emotionmap`.`week` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `userId` VARCHAR(45) NULL ,
  `name` VARCHAR(45) NULL ,
  `value` VARCHAR(45) NULL ,
  `currentTime` TIMESTAMP NULL ,
  `description` VARCHAR(1000) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `emotionmap`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emotionmap`.`user` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `emotionmap`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(45) NULL ,
  `password` VARCHAR(45) NULL ,
  `gender` VARCHAR(45) NULL ,
  `age` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `currentTime` TIMESTAMP NULL ,
  `description` VARCHAR(100) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `emotionmap`.`user_has_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emotionmap`.`user_has_location` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `emotionmap`.`user_has_location` (
  `user_id` INT NOT NULL ,
  `location_id` INT NOT NULL ,
  PRIMARY KEY (`user_id`, `location_id`) ,
  CONSTRAINT `fk_user_has_location_user`
    FOREIGN KEY (`user_id` )
    REFERENCES `emotionmap`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_location_location1`
    FOREIGN KEY (`location_id` )
    REFERENCES `emotionmap`.`location` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_user_has_location_location1` ON `emotionmap`.`user_has_location` (`location_id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `fk_user_has_location_user` ON `emotionmap`.`user_has_location` (`user_id` ASC) ;

SHOW WARNINGS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
