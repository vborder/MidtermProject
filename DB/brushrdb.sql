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
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT(1) NULL DEFAULT '1',
  `role` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `login_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_name_UNIQUE` (`login_name` ASC))
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
  `description` TEXT NULL,
  `enabled` TINYINT NULL,
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
  `user_id` INT NOT NULL,
  `content` TEXT NULL,
  `rating` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_beer_idx` (`beer_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_beer`
    FOREIGN KEY (`beer_id`)
    REFERENCES `beer_recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hops`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hops` ;

CREATE TABLE IF NOT EXISTS `hops` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(500) NULL,
  `enabled` TINYINT(1) NULL,
  `description` TEXT NULL,
  `img_url` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grain`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grain` ;

CREATE TABLE IF NOT EXISTS `grain` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(500) NULL,
  `enabled` TINYINT(1) NULL,
  `description` TEXT NULL,
  `img_url` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_hops`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_hops` ;

CREATE TABLE IF NOT EXISTS `recipe_hops` (
  `hops_id` INT NOT NULL,
  `beer_id` INT NOT NULL,
  `hops_amount` VARCHAR(500) NULL,
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
-- Table `recipe_grain`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_grain` ;

CREATE TABLE IF NOT EXISTS `recipe_grain` (
  `grain_id` INT NOT NULL,
  `beer_id` INT NOT NULL,
  `grain_amount` VARCHAR(500) NULL,
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
-- Table `favorites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorites` ;

CREATE TABLE IF NOT EXISTS `favorites` (
  `beer_recipe_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`beer_recipe_id`, `user_id`),
  INDEX `fk_beer_recipe_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_beer_recipe_has_user_beer_recipe1_idx` (`beer_recipe_id` ASC),
  CONSTRAINT `fk_beer_recipe_has_user_beer_recipe1`
    FOREIGN KEY (`beer_recipe_id`)
    REFERENCES `beer_recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_beer_recipe_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
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

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `password`, `enabled`, `role`, `created_at`, `updated_at`, `login_name`) VALUES (1, 'userguy', 'userlast', 'password', 1, 'user', NULL, NULL, 'user');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer_recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (1, 'good beer', 'IPA', 'yeasty yeast', 'very yeasty', 1, NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `comment` (`id`, `updated_at`, `created_at`, `enabled`, `beer_id`, `user_id`, `content`, `rating`) VALUES (1, NULL, NULL, 1, 1, 1, 'fake content', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hops`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `hops` (`id`, `name`, `enabled`, `description`, `img_url`) VALUES (1, 'hops hops', 1, 'very hoppy', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `grain`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `grain` (`id`, `name`, `enabled`, `description`, `img_url`) VALUES (1, 'grainy grain', 1, 'very grainy', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_hops`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `recipe_hops` (`hops_id`, `beer_id`, `hops_amount`) VALUES (1, 1, 'alot');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_grain`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `recipe_grain` (`grain_id`, `beer_id`, `grain_amount`) VALUES (1, 1, 'alot');

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorites`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `favorites` (`beer_recipe_id`, `user_id`) VALUES (1, 1);

COMMIT;

