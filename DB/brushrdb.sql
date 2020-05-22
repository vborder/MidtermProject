-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema brushrdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `brushrdb` ;

-- -----------------------------------------------------
-- Schema brushrdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `brushrdb` DEFAULT CHARACTER SET utf8 ;
USE `brushrdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(100) NULL,
  `password` VARCHAR(200) NULL,
  `enabled` TINYINT(1) NULL DEFAULT '1',
  `role` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beer_recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beer_recipe` ;

CREATE TABLE IF NOT EXISTS `beer_recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `beer_name` VARCHAR(200) NULL,
  `beer_type` VARCHAR(200) NULL,
  `yeast` VARCHAR(100) NULL,
  `description` TEXT(5000) NULL,
  `enabled` TINYINT(1) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `img_url` TEXT(1000) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_beer_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_beer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  `enabled` TINYINT(1) NULL,
  `beer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_beer_idx` (`beer_id` ASC),
  CONSTRAINT `fk_comment_beer`
    FOREIGN KEY (`beer_id`)
    REFERENCES `beer_recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hops`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hops` ;

CREATE TABLE IF NOT EXISTS `hops` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hops_name` VARCHAR(500) NULL,
  `hops_amount` VARCHAR(500) NULL,
  `enabled` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grain`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grain` ;

CREATE TABLE IF NOT EXISTS `grain` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `grain_name` VARCHAR(500) NULL,
  `grain_amount` VARCHAR(500) NULL,
  `enabled` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hops_has_beer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hops_has_beer` ;

CREATE TABLE IF NOT EXISTS `hops_has_beer` (
  `hops_id` INT NOT NULL,
  `beer_id` INT NOT NULL,
  PRIMARY KEY (`hops_id`, `beer_id`),
  INDEX `fk_hops_has_beer_beer1_idx` (`beer_id` ASC),
  INDEX `fk_hops_has_beer_hops1_idx` (`hops_id` ASC),
  CONSTRAINT `fk_hops_has_beer_hops1`
    FOREIGN KEY (`hops_id`)
    REFERENCES `hops` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hops_has_beer_beer1`
    FOREIGN KEY (`beer_id`)
    REFERENCES `beer_recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grain_has_beer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grain_has_beer` ;

CREATE TABLE IF NOT EXISTS `grain_has_beer` (
  `grain_id` INT NOT NULL,
  `beer_id` INT NOT NULL,
  PRIMARY KEY (`grain_id`, `beer_id`),
  INDEX `fk_grain_has_beer_beer1_idx` (`beer_id` ASC),
  INDEX `fk_grain_has_beer_grain1_idx` (`grain_id` ASC),
  CONSTRAINT `fk_grain_has_beer_grain1`
    FOREIGN KEY (`grain_id`)
    REFERENCES `grain` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grain_has_beer_beer1`
    FOREIGN KEY (`beer_id`)
    REFERENCES `beer_recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_comment` ;

CREATE TABLE IF NOT EXISTS `user_has_comment` (
  `user_id` INT NOT NULL,
  `comment_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `comment_id`),
  INDEX `fk_user_has_comment_comment1_idx` (`comment_id` ASC),
  INDEX `fk_user_has_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_comment_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS brushr@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'brushr'@'localhost' IDENTIFIED BY 'brushr';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'brushr'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
