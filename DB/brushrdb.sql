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
  `user_email` VARCHAR(100) NULL,
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
  `yeast` VARCHAR(1000) NULL,
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
  `id` INT NOT NULL AUTO_INCREMENT,
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
INSERT INTO `user` (`id`, `first_name`, `last_name`, `password`, `enabled`, `role`, `created_at`, `updated_at`, `login_name`, `user_email`) VALUES (1, 'userguy', 'userlast', 'password', 1, 'user', NULL, NULL, 'user', 'user@useremail.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `password`, `enabled`, `role`, `created_at`, `updated_at`, `login_name`, `user_email`) VALUES (2, 'Hiro', 'Protagonist', 'abc123', 1, 'admin', NULL, NULL, 'HiroP', 'HiroP@wetnet.net');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `password`, `enabled`, `role`, `created_at`, `updated_at`, `login_name`, `user_email`) VALUES (3, 'Jack', 'Shaftoe', 'dogrunslow123', 1, 'user', NULL, NULL, 'OneEyeJack', 'gungho@enigma.net');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `password`, `enabled`, `role`, `created_at`, `updated_at`, `login_name`, `user_email`) VALUES (4, 'Steive ', 'Nicks', 'BellaDonna1', 1, 'user', NULL, NULL, 'Rumours', 'SNicks@yahoo.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `password`, `enabled`, `role`, `created_at`, `updated_at`, `login_name`, `user_email`) VALUES (5, 'Natasha', 'Dobadthings', 'struMPetxoxo', 1, 'user', NULL, NULL, 'NattyDBT', 'LilHornGirl@msn.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `password`, `enabled`, `role`, `created_at`, `updated_at`, `login_name`, `user_email`) VALUES (6, 'Franken', 'Furter', 'MonsterMash666', 1, 'user', NULL, NULL, 'BOLT', 'mashMASH@gmail.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer_recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (1, 'good beer', 'IPA', 'yeasty yeast', 'very yeasty', 1, NULL, NULL, NULL, 1);
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (2, 'Golden Goblet', 'Gruit Ale', 'Strong Ale yeast', 'For 6.5 US gallons (24.61 liters)\nFERMENTABLES\n16.0 lb (7.26 kg) Pilsner two-row malt\n8.0 oz (227 g) Belgian Caramel Pils malt\n1.0 g sweet gale (in mash, 90 min)\n1.0 oz (28 g) marsh rosemary (in mash, 90 min)\n1.0 oz (28 g) yarrow (in mash, 90 min)\n1.0 g sweet gale (60 min)\n1.0 oz (28 g) marsh rosemary (60 min)\n1.0 oz (28 g) yarrow (60 min)\nOther Ingredients\nWhirlFloc (20 min)\n3.5 tsp SuperFood yeast nutrient (20 min)\n0.5 coriander seed (15 min)\n1.0 tsp lemon peel (15 min)\n14 g sweet orange peel (15 min)\n14 g sweet orange peel (10 min)\n1.0 lb turbinado sugar\nReverse osmosis water\nWyeast Labs No. 1338 Belgian Strong Ale yeast (2L starter)\nSPECIFICATIONS\nOriginal Gravity: 1.074\nFinal Gravity: 1.010\nABV: 8.37\nSRM: 5.7\nEfficiency: 75%\nDIRECTIONS\nMash grains for 90 minutes at 148° F (64° C). Remember that half the herbs go into the mash, and half are added during the boil. Mash out at 168° F (76° C) for 10 minutes.\n\nExtract Version\nSubstitute 12 lb (5.4 kg) liquid Pilsner malt extract for the Pilsner malt. Steep the CaraPils malt in 158° F (70° C) water for 30 minutes, remove and strain, add the malt extract, bring to a boil, stirring, and continue with the recipe as indicated. Steep half the herbs in a mesh bag along with the CaraPils and put the other half in the boil, as the recipe states. ', 1, NULL, NULL, 'resources/media/GoldenGobletGruitAle.jpg', 2);
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (3, 'The Tropical Session', 'White IPA', 'White Labs WLP090 San Diego ale yeast', 'The Tropical Session White IPA | India Pale Ale\nINGREDIENTS\nFor 5.5 U.S. gallons (20.8 L)\n5.5 lb (2.27 kg) domestic pale malt\n4.0 lb (1.81 kg) white wheat malt\n1.0 oz (28 g) Warrior hops, 16% a.a. (60 min)\n0.5 oz (14 g) Amarillo hops, 8.5% a.a. (knockout/whirlpool)\n0.5 oz (14 g) Citra hops, 11% a.a. (knockout/whirlpool)\n0.5 oz (14 g) Galaxy hops, 11% a.a. (knockout/whirlpool)\nWhite Labs WLP090 San Diego ale yeast\nSPECIFICATIONS\nOriginal Gravity: 1.046\nABV: 4.5%\nIBU: 55\nSRM: 5.3\nBoil Time: 90 minutes\nEfficiency: 75%\nDIRECTIONS\nMash at 154° F (68° C) for 60 minutes.\n\nExtract Version\nSubstitute 4.2 lb (1.9 kg) pale malt extract syrup for the pale malt and 3 lb (1.36 kg) wheat malt extract syrup for the wheat malt.', 1, NULL, NULL, 'resources/media/TheTropicalSessionWhiteIPA.jpg', 3);
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (4, 'Dubious Dubbel', 'Belgian Dubbel', 'White Labs WLP500 or Wyeast 1214 Trappist Ale Yeast', 'Dubious Dubbel | Belgian Dubbel\nINGREDIENTS\nFor 5 U.S. gallons (19 liters)\nMALTS\n6.0 lb (2.7 kg) Northern Brewer Pilsen LME (liquid malt extract)\n1.5 lb (0.7 kg) Northern Brewer Munich LME\n12.0 oz (340 g) D2 Dark Candi Syrup\n12.0 oz (340 g) CaraMunich® malt\n12.0 oz (340 g) Aromatic malt\n6.0 oz (170 g) Special B malt\nHOPS\n0.75 oz (21 g) Styrian Goldings, 4.6% a.a. (60 min)\n1.0 oz (28 g) Saaz, 4% a.a. (15 min)\nOTHER FERMENTABLES\nWhite Labs WLP500 or Wyeast 1214 Trappist Ale Yeast (2 L starter)\nSPECIFICATIONS\nOriginal Gravity: 1.069\nFinal Gravity: 1.016\nABV: 6.9%\nIBU: 13\nSRM: 18\nDIRECTIONS\nSteep grains in 3.5 gallons of water at 155° F (68° C) for 30 minutes. Add extracts and candi syrup. Boil for 60 minutes. Chill, rack the wort into 2 gallons of chilled water in the carboy, and ferment to completion at 68-70° F (20-21° C). Keg at 2.5 volumes of CO2 or bottle carbonate with 4.4 oz (125 g) corn sugar.', 1, NULL, NULL, 'resources/media/DubiousDubbel.jpg', 2);
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (5, 'Let It Go Helles', 'Munich Helles', 'White Labs WLP1983 Charlie\'s Fist Bump yeast (fka WLP862 Cry Havoc) or German- or Bavarian-type lager yeast', 'Let It Go Helles | Munich Helles\nINGREDIENTS\nFor 5.5 U.S. gallons (21 L)\nMALTS\n6.5 lb. (3 kg) Bohemian floor-malted Pilsner malt\n12 oz. (340 g) Belgian aromatic malt\n12 oz. (340 g) Gambrinus honey malt\n4 oz. (113 g) German Sauermalz (acidulated malt)\nHOPS\n0.5 oz. (14 g) Mt. Hood hops, 5% a.a. (60 min)\n1 oz. (28 g) German Hallertauer Mittelfrüh hops, 2.5% a.a. (60 min)\n1 oz. (28 g) German Hallertauer Mittelfrüh hops (1 min)\n0.5 oz. (14 g) Santiam hop pellets (dry hop)\nMISC.\n0.25 tsp. (1 g) powdered Irish moss (10 min)\n0.75 cup (175 mL) corn sugar (priming bottles) or 0.33 cup (80 mL) corn sugar for kegging\nYEAST\nWhite Labs WLP1983 Charlie\'s Fist Bump yeast (fka WLP862 Cry Havoc) or German- or Bavarian-type lager yeast\nSPECIFICATIONS\nOriginal Gravity: 1.040 (10 B)\nFinal Gravity: 1.011 (2.75 B)\nABV: 4.1%\nIBU: about 21\nSRM: 6\nEfficiency: 80%\nDIRECTIONS\nNote: this recipe is intended to create a 5.5 gallons (21 L) of wort, yielding 5 gallons (19 L) of beer.\n\nA step infusion mash is employed to mash the grains. Add 8.5 quarts (8.1 L) of 140°F (60°C) water to the crushed grain, stir, stabilize, and hold the temperature at 132°F (56°C) for 30 minutes. Add 4 quarts (3.8 L) of boiling water and add heat to bring temperature up to 155°F (68°C). Hold for about 30 minutes. Raise temperature to 167°F (75°C), lauter, and sparge with 3.5 gallons (13.25 L) of 170°F (77°C) water. Collect about 5.5 gallons (21 L) of runoff. Add 60-minute hops and bring to a full and vigorous boil.\n\nThe total boil time will be 60 minutes. When 10 minutes remain, add the Irish moss. When 1 minute remains, add the 1-minute hops. After a total wort boil of 60 minutes, turn off the heat and place the pot (with cover on) in a running cold-water bath for 30 minutes. Continue to chill in the immersion or use other methods to chill your wort. Strain and sparge the wort into a sanitized fermenter. Bring the total volume to 5.5 gallons (21 L) with additional cold water if necessary. Aerate the wort very well.\n\nPitch the yeast when temperature of wort is about 70°F (21°C). Once visible signs of fermentation are evident, ferment at temperatures of about 55°F (12.5°C) for about one week or until fermentation shows signs of calm or stopping. Rack from primary to a secondary and add the hop pellets for dry hopping. If you have the capability, lager the beer at temperatures between 35 and 45°F (1.5 to 7°C) for 3 to 5 weeks. Prime with sugar and bottle or keg when complete.', 1, NULL, NULL, 'resources/media/LetItGoHelles.jpg', 4);
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (6, 'Espresso Stout', 'American Stout', 'Wyeast 1084 Irish Ale or White Labs WLP004 Irish Ale Yeast', 'Espresso Stout | American Stout\nINGREDIENTS\nFor 5 US gallons (18.9 L)\nMALTS\n8 lb. (3.62 kg) pale ale malt\n1.lb. (454 g) crystal 80°L\n8 oz. (227 g) chocolate malt\n4 oz. (113 g) roasted barley\n4 oz. (113 g) black patent malt\nHOPS\n1.25 oz. (35 g) Northern Brewer pellets, 6.9% a.a. (60 min)\n0.25 oz. (7 g) Northern Brewer pellets, 6.9% a.a. (5 min)\nADDITIONALS\n16 shots espresso (end of boil)\nWyeast 1084 Irish Ale or White Labs WLP004 Irish Ale Yeast\nSPECIFICATIONS\nOriginal Gravity: 1.051\nIBU: 38\nEfficiency: 70%\nDIRECTIONS\nMash at 152°F (67°C) for 45 minutes. Boil for 60 minutes. Ferment at 68°F (20°C).\n\nExtract Version\nSubstitute 5.6 lb. (2.55 kg) pale liquid malt extract or 4.5 lb. (2 kg) pale dry malt extract for the pale malt. Steep crystal and dark malts in 155°F (68°C) water for 30 minutes, sparge, add malt extract, bring to a boil, and follow recipe as above.', 1, NULL, NULL, 'resources/media/EspressoStout.jpg', 1);
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (7, 'Newtonian ESB', 'Extra Special/Strong Bitter', 'London ESB ale yeast (Wyeast Labs 1968) 1 L starter', '\nNewtonian ESB | Extra Special/Strong Bitter\nINGREDIENTS\nFor 5.5 US gal (20.8 L)\nMALTS\n9 lb. (4.08 kg) Maris Otter pale malt (3 SRM) 81.1%\n1 lb. (454 g) caramel/crystal malt (77 SRM) 9%\n1 lb. (454 g) Weyermann® Cara-Red malt (20 SRM) 9%\n1.5 oz. (42 g) black patent malt (500 SRM) 0.8%\nHOPS\n0.5 oz. (14 g) Zythos, 14% a.a., boil 60 min, 21 IBUs\n1 oz. (28 g) East Kent Goldings, 5% a.a., boil 20 min, 9.1 IBUs\n1 oz. (28 g) East Kent Goldings, 5% a.a., boil 5 min, 3 IBUs\n1 oz. (28 g) East Kent Goldings, 5% a.a., steep/whirlpool, 5 min, 1.5 IBUs\nYEAST\nLondon ESB ale yeast (Wyeast Labs 1968) 1 L starter\nSPECIFICATIONS\nOriginal Gravity: 1.058\nFinal Gravity: 1.014\nABV: 5.7%\nIBU: 35\nSRM: 13\nBoil Time: 90 minutes\nDIRECTIONS\nMash: single infusion, light body, no mash out\nWater: North Denver tap water\nEfficiency: 77%\nMash pH: 5.2\nStep 1: 154°F (68°C), 75 min\nSparge: Fly sparge with 7.24 gal water at 168° F (76° C)\nFerment at 68°F (20°C) for 4–7 days. Diacetyl rest at 70°F (21°C) for 2 days. Condition at 35°F (2°C) for 14 days.\n\nPartial Extract Version\nSubstitute 7 lb., 6 oz. (3.35 kg) Maris Otter malt extract syrup for the pale malt. Steep crystal, black, and cara malts in 158°F (70°C) water for 30 minutes. Drain, rinse grains, and dissolve extract completely. ', 1, NULL, NULL, 'resources/media/NewtonianESB.jpg', 4);
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (8, 'Dunkelweizendoppelbock', 'Doppelbock', 'Fermentis WB-06 or Fermentis Safbrew Abbaye', 'Dunkelweizendoppelbock | Doppelbock\nINGREDIENTS\nFor 5 US gallons (19 L)\nMALTS\n9.28 lb. (4.21 kg) Weyermann® Barke® Pilsner Malt (46.5%)\n5.39 lb. (2.44 kg) Weyermann® Pale Wheat Malt (27%)\n3.0 lb. (1.36 kg) Weyermann® Dark Wheat Malt (15%)\n1.5 lb. (680 g) Weyermann® Carawheat® Malt (7.5%)\n0.6 lb. (272 g) Weyermann® Acidulated Malt (3%)\n0.2 lb. (90 g) Weyermann® Roasted Chocolate Wheat Malt (1%)\n1.6 lb. (723 g) rice hulls\nHOPS\n0.5 oz. (14 g) Herkules, 14.5% a.a., 60 min\n0.3 oz. (7 g) Saphir, 3.25% a.a., 10 min\n0.8 oz. (21 g) Saphir, 3.25% a.a., 5 min\nYEAST\nFermentis WB-06 or Fermentis Safbrew Abbaye\nSPECIFICATIONS\nOriginal Gravity: 1.101\nFinal Gravity: 1.018-1.020\nABV: 10.1 to 10.3%\nIBU: 35\nSRM: approx. 20\nDIRECTIONS\nDough in at approximately 113°F (45°C) for a 30-minute hydration and beta-glucanase rest. To mitigate subsequent lautering problems, it is also advisable to add about 10% of the dry malt weight in rice hulls at dough-in.\n\nAfter the cytolytic rest, infuse the mash with hot brewing liquor to raise the temperature to 122°F (50°C) for a proteolytic rest of 30 minutes at the peak-performance temperature of protease.\n\nNext, raise the mash to 149°F (65°C), the peak-performance temperature of beta amylase. This ensures the production of plenty of fermentables, and thus of alcohol. Allow 30 minutes for this diastatic rest.\n\nRepeat the temperature rise a final time to reach the alpha amylase peak temperature of 162°F (72°C). Rest the mash again, this time for 15 minutes, to convert the remaining starches into unfermentable dextrins for extra body in the finished beer.\n\nThe large grain bill, in conjunction with the many hot-water infusions, is also likely to fill the mash tun to the limit of its capacity.\n\nRecirculate the wort thoroughly for perhaps 30 minutes. Then sparge and lauter simultaneously. Use the hot sparge liquor to raise the grain bed temperature to the mash-out temperature of 170°F (77°C). The run-off is likely to be slow! Stop sparging as soon as the kettle gravity is about 1.086 (20.8°P), assuming a 10% evaporation rate during a 90-minute kettle boil.\n\nIn some mash tun configurations, because of aspect ratios and false-bottom designs, a kettle gravity of 1.086 may not be possible to achieve. In this case, simply sparge until the kettle is full. Then extend the boil until the net kettle gravity of 24°P is reached through evaporation. When weighing out the hop additions, adjust quantities to the projected actual net kettle volume.\n\nBoil for at least 90 minutes (or longer if the original gravity at the start of the boil is an issue). Add bittering hops 60 minutes before the anticipated shutdown time. Add flavor hops with 10 minutes of boil time remaining. Add aroma hops 5 minutes before shutdown. Whirlpool and chill.\n\nPitch about twice as much yeast as you normally would for a “regular” brew and aerate well. In our experimental batch, we used 1.5 oz./5 gal. (44 g/19 L) of dried yeast. Primary ferment the brew at the middle of the preferred temperature range of the selected yeast for a total of 3 weeks.\n\nAt the end of primary fermentation, rack the brew into a clean tank for 7–8 days of secondary fermentation. Prime and bottle the brew. Alternatively, rack the brew into a keg and let it mature for 2 weeks under pressure. Finally, adjust carbonation in the keg to 3.3 to 4.5 volumes (6.6 to 9 g/L) of CO2 before dispensing it unfiltered from the keg.', 1, NULL, NULL, 'resources/media/Dunkelweizendoppelbock.jpg', 3);
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (9, 'Ginger Dinger', 'Dark Lager', 'German- or Bavarian-type lager yeast (ex. White Labs WLP1983 Charlie\'s Fist Bump, formerly WLP862 Cry Havoc Lager Yeast)', 'Ginger Dinger 2017 Dark Lager | Dark Lager\nINGREDIENTS\nFor 5 US gallons\nMALTS\n5.75 lb. (2.6 kg) light malt extract syrup OR 4.75 lb. (2.2 kg) light dry malt extract\n1 lb. (454 g) crystal malt (10° L)\n6 oz. (168 g) chocolate malt\n6 oz. (168 g) Belgian Special B malt\nHOPS\n2 oz. (56 g) German Hallertauer hops, 4% a.a. @ 60 min\n1 oz. (28 g) Mt. Hood or Santiam hops @ 1 min\nYEAST\nGerman- or Bavarian-type lager yeast (ex. White Labs WLP1983 Charlie\'s Fist Bump, formerly WLP862 Cry Havoc Lager Yeast)\nADDITIONAL ITEMS\n8 oz. (225 g) freshly grated ginger @ 10 min\n0.25 oz. (7 g) freshly crushed coriander seed @ 10 min\n1/4 tsp (1 g) powdered Irish moss @ 10 min\n3/4 cup (175 mL) corn sugar for priming bottles or 1/3 cup (80 mL) corn sugar for kegging\nSPECIFICATIONS\nOriginal Gravity: 1.050\nFinal Gravity: 1.015\nABV: 4.8%\nIBU: 31\nSRM: 24\nDIRECTIONS\nPlace crushed grains in 2 gallons (7.6 L) of 155°F (68°C) water and steep for 30 minutes. Then strain out, rinse with 3 quarts (3 L) hot water, and discard the crushed grains, reserving the approximately 2.5 gallons (9.5 L) of liquid to which you will now add malt extract and 60 minute hops. Bring to a boil.\n\nThe total boil time will be 60 minutes. When 10 minutes remain, add the Irish moss, grated ginger, and crushed coriander seeds. When 1 minute remains, add the 1-minute hops. After a total wort boil of 60 minutes, turn off the heat and then immerse the covered pot of wort in a cold water bath and let sit for 15–30 minutes or the time it takes to have a couple of homebrews.\n\nStrain out and sparge hops, and direct the hot wort into a sanitized fermenter to which 2.5 gallons (9.5 L) of cold water has been added. If necessary, add additional cold water to achieve a 5.5 gallon (21 L) batch size. Aerate the wort very well.\n\nPitch the yeast when temperature of wort is about 70°F (21°C). Once visible signs of fermentation are evident, ferment at temperatures of about 55°F (12.5°C) for about one week or until fermentation shows signs of calm and stopping. Rack from primary to a secondary. If you have the capability, “lager” the beer at temperatures between 35 and 45°F (1.5–7°C) for 3 to 6 weeks.\n\nPrime with sugar and bottle or keg when complete.', 1, NULL, NULL, 'resources/media/Ginger-Dinger.jpg', 2);
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (10, 'Pig and Apples Cider ', 'Cider', 'none', 'Pig and Apples Cider |INGREDIENTS\nFor 3 US gallons\n3 gal. (11.4 L) fresh, sweet apple juice (low acid, low tannin)\n1.5 tsp. (7–8 mL) yeast nutrient\n1 packet American ale yeast\n3 strips bacon, cooked on a rack in a 325°F (165°C) oven for 40 minutes\n4 oz. bourbon\nSPECIFICATIONS\nOriginal Gravity: 1.049 (varies by juice content)\nFinal Gravity: 1.000\nABV: est. 6.5%\nDIRECTIONS\nClean your fermenting vessel with a non-soap detergent. Rinse well—any trace residue will end up in your cider!—and air dry. Sanitize your fermentation vessel and 2 foil sheets per sanitizer directions.\n\nBoil 1 pint (473 mL) water and let cool to 105°F (41°C). Mix in a pinch of yeast nutrient and sprinkle the yeast over the water. Cover with sanitized aluminum foil and let sit for 15 minutes.\n\nWarm the apple juice to 60°F (16°C). Add the juice to the fermenter, and mix in the foamy yeast. Cover with more sanitized foil and place somewhere dark and cool, preferably around 60°F (16°C). After 2–4 weeks, the yeast should be done fermenting and will have dropped clear with all the yeast and protein settling at the bottom of the fermenter. Check fermentation periodically. About 5 days before fermentation is finished, create the bacon-bourbon mixture.\n\nCrumble the bacon, mix with the bourbon in a sealed glass jar, and store for 4 days in the fridge. On the 4th day, remove the bacon and place the bourbon in the freezer. The next day, the bacon fat should have solidified at the top. Scoop away the fat and keep the bourbon.\n\nAfter fermentation ceases, rack to a secondary container and add the bourbon. Sanitize bottles, caps, and transfer tubing. Package still (without carbonation) to let bacon flavor rise naturally.\n\nTo bottle, siphon the cider from the fermenter, being careful to avoid the muck at the bottom, and into each of your plastic bottles. Fill completely. Stop the flow of cider by pinching the tube before moving the hose to the next bottle. Screw on the caps and chill the cider in your fridge and drink when cool. Serve at around 50°F (10°C).', 1, NULL, NULL, 'resources/media/PigsandAppleCider.jpg', 1);
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (11, 'Mild Ale #3', 'Ale', 'White Labs WLP002 or WLP023', 'Mild Ale #3 | Mild\nINGREDIENTS\nFor 6 US gallons (22.7 liters)\nMALTS\n6.75 lb (3.06 kg) Maris Otter pale malt\n9.0 oz (255 g) 60° L British crystal malt\n9.0 oz (255 g) 120° L British crystal malt\n4.0 oz (113 g) British chocolate malt\n1.25 oz (35 g) debittered black malt\nHOPS\n1.0 oz (28 g) UK Fuggle hops, 4.5% a.a. (60 min)\nYEAST\nWhite Labs WLP002 or WLP023\nSPECIFICATIONS\nOriginal Gravity: 1.035\nABV: 3.3%\nIBU: 16\nSRM: 17\nDIRECTIONS\nMash the grains at 152° F (67° C) for 60 minutes. You make have to adjust the pH depending on your water to compensate for the high percentage of crystal and roasted malts. Collect enough sparge volume to allow for a 60- minute boil, adding the hops at the start. Ferment at 62° F (17° C) for about two weeks, or until fermentation is complete. [Ed. note: Warm up slightly if fermentation is sluggish or delayed.] Package to obtain about 2.5 volumes of CO2.\n\nExtract Version\nSubstitute 4.7 lb (2.1 kg) liquid Maris Otter extract for the Maris Otter malt. Steep remaining grains per the recipe, add the extract, bring to a boil, and follow the recipe as indicated.', 1, NULL, NULL, 'resources/media/MildAle.jpg', 3);
INSERT INTO `beer_recipe` (`id`, `beer_name`, `beer_type`, `yeast`, `description`, `enabled`, `created_at`, `updated_at`, `img_url`, `user_id`) VALUES (12, 'Quarantine American IPA', 'IPA', 'Lallemand BRY-97 yeast', 'Quarantine American IPA | American Pale Ale\nINGREDIENTS\nFor 5 gallons (18.9 L)\nMALTS\n10 lb. (4.5 kg) base malt (around 1.5-2.5°L)\n1 lb. (454 g) Munich malt (around 10°L)\n8 oz. (227 g) crystal malt (40°L)\nHOPS\n1 oz. (28 g) Columbus hops @ 60 min\n1 oz. (28 g) Centennial hops @ 20 min\n1 oz. (28 g) Centennial hops @ 10 min\n1 oz. (28 g) Cascade hops @ 10 min\n1 oz. (28 g) Cascade hops @ 0 min\n2 oz. (56 g) Centennial hops @ dry hop, 5 days\n1 oz. (28 g) Columbus hops @ dry hop, 5 days\nYEAST\nLallemand BRY-97 yeast\nRecipe specifications will vary depending on the ingredients used.\nSPECIFICATIONS\nOriginal Gravity: 1.060\nFinal Gravity: 1.015\nABV: 5.9%\nIBU: 80\nSRM: 6-7\nBoil Time: 60 minutes\nEfficiency: 72%\nDIRECTIONS\nSingle-infusion mash around 153°F (67°C). Conduct a 60-minute boil, following the hop addition schedule as noted in the ingredients.\n\nPartial Mash Option\nSubstitute 6.6 lb. (3 kg) of liquid malt extract (Golden or Pilsner) in place of the base malt. Steep the Munich and crystal 40°L malt for 15 minutes at 160°F (71°C)\n\n ', 1, NULL, NULL, 'resources/media/American-IPA-recipe.png', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `comment` (`id`, `updated_at`, `created_at`, `enabled`, `beer_id`, `user_id`, `content`, `rating`) VALUES (1, NULL, NULL, 1, 2, 1, 'Admitttedly, this recipe sounds fantastic, but wouldn\'t it have made more sense to go with something that had more easily obtainable ingredients to make life easier on everybody and to better support local shops during these difficult times?', 3);
INSERT INTO `comment` (`id`, `updated_at`, `created_at`, `enabled`, `beer_id`, `user_id`, `content`, `rating`) VALUES (2, NULL, NULL, 1, 4, 2, 'Guys- Although late in the game, the original Lallemand yeast is available at www.humle.se Although shipped from Sweden, my order arrived in Arkansas in two days. No shit. $20 for four packs of yeast and $20 for shipping. All the hops can be ordered from www.yakimavalleyhops.com Just ordered today, but expect them by Friday. The yeast is pricey due to shipping from Sweden. The hops were about $15 with a couple ounces each. The grains are standard.', 4);
INSERT INTO `comment` (`id`, `updated_at`, `created_at`, `enabled`, `beer_id`, `user_id`, `content`, `rating`) VALUES (3, NULL, NULL, 1, 1, 3, 'When you see a pit viper, it means that a Pilsner near the polar bear beer takes a coffee break. Indeed, some stupid bottle of beer finds lice on a childlike corona light. When the power drill drink wakes up, the porter self-flagellates. The soggy Yuengling borrows money from a Red Stripe from a bud light, and a self-loathing bill tries to seduce a Luna Sea ESB about a blood clot. Indeed, a Pilsner slyly conquers the Keystone inside a bud light.', 5);
INSERT INTO `comment` (`id`, `updated_at`, `created_at`, `enabled`, `beer_id`, `user_id`, `content`, `rating`) VALUES (4, NULL, NULL, 1, 3, 4, 'A Lone Star near a Yuengling\nWhen some spudgun meditates, the barely twisted Luna Sea ESB leaves. A barely dirt-encrusted Left Hand Milk Stout throws the barely financial Ellis Island IPA at a Kashmir IPA. The Dos Equis of the mating ritual dumbly plays pinochle with the tornado brew, because a chain saw trades baseball cards with the Citra Ninja. When you see a Harpoon, it means that a broken bottle beams with joy.\nA tanked Ipswich Ale', 1);
INSERT INTO `comment` (`id`, `updated_at`, `created_at`, `enabled`, `beer_id`, `user_id`, `content`, `rating`) VALUES (5, NULL, NULL, 1, 1, 2, 'A tanked Ipswich Ale\nA Guiness toward a Heineken operates a small bar with some vaporized PBR. A sake bomb over a burglar ale ruminates, but another Sam Adams has a change of heart about an air hocky table about the rattlesnake. The self-loathing Dos Equis gives a stink finger to a Hoptoberfest. Now and then, a temporal miller recognizes an obsequious Sam Adams. Sometimes the air hocky table ruminates, but a Keystone light always ridiculously figures out a burglar ale!', 1);
INSERT INTO `comment` (`id`, `updated_at`, `created_at`, `enabled`, `beer_id`, `user_id`, `content`, `rating`) VALUES (6, NULL, NULL, 1, 3, 3, 'A hardly incinerated King Henry\nThe Hommel Bier for a freight train hides, and an often surly Dixie Beer beams with joy; however, a college-educated Hops Alligator Ale thoroughly ignores a Fosters. Furthermore, a bill inside a Budweiser Select goes to sleep, and a tornado brew teaches another Guiness defined by the Jamaica Red Ale. Indeed, a mating ritual barely knows a financial bud light. When a razor blade beer reads a magazine, a Heineken flies into a rage. A miller defined by a satellite brewery brainwashes an Imperial Stout of a wanker.', 3);
INSERT INTO `comment` (`id`, `updated_at`, `created_at`, `enabled`, `beer_id`, `user_id`, `content`, `rating`) VALUES (7, NULL, NULL, 1, 4, 1, 'Some bar stool laughs out loud, but the loose pool table negotiates a prenuptial agreement with the Rolling Rock beyond a blood clot. A Hazed and Infused inside another customer prays, or a hairy scooby snack caricatures some burglar ale. When you see a Keystone light over a Hoptoberfest, it means that some Pilsner living with a Hazed and Infused takes a coffee break. Another overpriced spudgun earns enough for a beer, and a twisted Budweiser ceases to exist; however, some Corona Extra ignores the IPA.', 4);
INSERT INTO `comment` (`id`, `updated_at`, `created_at`, `enabled`, `beer_id`, `user_id`, `content`, `rating`) VALUES (8, NULL, NULL, 1, 2, 4, 'The Strohs about a miller\nThe King Henry about a booze, a Home brew, and another wastedly dry change are what made America great! When you see the overwhelmingly funny bud light, it means that a Long Trail Ale over a Pilsner flies into a rage. A grizzly beer barely derives perverse satisfaction from the sudsy bar stool, but an Imperial Stout of a Sam Adams steals women from the Strohs. Indeed, an Ipswich Ale about a lover gives the last beer to the rattlesnake. The bud dry for the blood clot earns enough for a beer, but a Christmas Ale of an Ipswich Ale recognizes the miller inside a change.', 2);
INSERT INTO `comment` (`id`, `updated_at`, `created_at`, `enabled`, `beer_id`, `user_id`, `content`, `rating`) VALUES (9, NULL, NULL, 1, 2, 1, 'The radioactive Avery IPA\nAny Pilsner can learn a hard lesson from an unwisely slow Sierra Nevada, but it takes a real colt 45 to hardly caricature an Octoberfest. Furthermore, a whacked Red Stripe wakes up, and a Left Hand Milk Stout intoxicatedly negotiates a prenuptial agreement with the IPA behind a wanker. When a lazily dreamlike black velvet is pathetic, the stein is a big fan of a Full Sail IPA. When you see an ESB near a black velvet, it means that a highly paid Busch trembles. For example, the tattered line dancer indicates that a St. Pauli Girl toward the bull ice bestows great honor upon a Kashmir IPA.', 5);
INSERT INTO `comment` (`id`, `updated_at`, `created_at`, `enabled`, `beer_id`, `user_id`, `content`, `rating`) VALUES (10, NULL, NULL, 1, 3, 3, 'The ice house\nIf the soggy Busch almost borrows money from a Mango Beer, then the muddy ice house starts reminiscing about a lost buzz. Now and then, a mean-spirited Yuengling laughs and drinks all night with the scooby snack. Some spudgun behind a Hefeweizen sweeps the floor, because a rattlesnake plans an escape from the secretly smelly bar tab the Amarillo Pale Ale over a miller. Most people believe that a Hommel Bier related to the Dixie Beer makes love to a Sierra Nevada Pale Ale toward a milwakees best, but they need to remember how seldom the Mango Beer wakes up. The gentle pin ball machine gives a stink finger to the salty Left Hand Milk Stout.', 2);
INSERT INTO `comment` (`id`, `updated_at`, `created_at`, `enabled`, `beer_id`, `user_id`, `content`, `rating`) VALUES (11, NULL, NULL, 1, 4, 2, 'Now and then, the dumbly gentle steam engine caricatures the infected bottle. The customer from a Brewers Reserve gives lectures on morality to a drunk Hommel Bier. When a satellite brewery is self-loathing, a fat Hommel Bier can be kind to a Red Stripe. When the spudgun wakes up, a crispy Kashmir IPA wakes up.', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hops`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `hops` (`id`, `name`, `enabled`, `description`, `img_url`) VALUES (1, 'hops hops', 1, 'very hoppy', NULL);
INSERT INTO `hops` (`id`, `name`, `enabled`, `description`, `img_url`) VALUES (2, 'Admiral Hops', 1, 'This bitter British hop was bred from the combination of Northdown and Challenger hops, and commercially released in 1998. With an intense flavor and citrusy, orange nose, Admiral hops provide the perfect bittering agent in all types of India Pale Ales, Pale Ales, and Bitters. A high alpha acid composition of about 13% to 16.2% makes this easily harvested hop useful and readily available. Admiral hops compliment Target hops and are sometimes used in their place for a slightly less intense bitterness. The low oil composition of myrcene and caryophyllene lend a touch of woody, herbal character to this hop, making a bold combination with the apparent citrus scent. Test the taste of this high-yielding hop yourself in commercial brews like Stone Imperial IPA and Three Floyds Blackheart English IPA.', 'https://www.craftbeer.com/editors-picks/emerging-hop-varieties-public-designer-local');
INSERT INTO `hops` (`id`, `name`, `enabled`, `description`, `img_url`) VALUES (3, 'Bitter Gold Hops', 1, 'This incredibly acidic varietal comes from the American lineage of hops like Brewer’s Gold, Comet, and Fuggle. With no notable aromatic qualities and a high alpha acid range of 16% to 19%, Bitter Gold is utilized only for bittering. Add it to any brew from your favorite IPA to English Ales and of course English Bitter. While Galena or Nugget hops can be substituted for Bitter Gold, they do not yield the same intensely bittering quality ounce per ounce. ', 'https://www.wfmj.com/story/40926533/poland-man-creates-new-varieties-of-hops');
INSERT INTO `hops` (`id`, `name`, `enabled`, `description`, `img_url`) VALUES (4, 'Orbit Hops', 1, 'Coming out of New Zealand’s Hops With A Difference breeding program, Orbit hops are carefully selected for a unique aroma. With an alpha acid range between 4% and 6%, Orbit is sometimes used for bittering in Blondes or Hefeweizens. Expect a uniquely regional New Zealand aroma of herbs, grass, and floral that creates a signature flavor perfect for seasonal brews, as well. These hops can be difficult to find, and substitutions are just as difficult to come by, due to the nature in which Orbit is grown. In a pinch try another regional varietal like Pacifica.', 'https://www.taptrail.com/new-hop-varieties-offer-new-flavors/');
INSERT INTO `hops` (`id`, `name`, `enabled`, `description`, `img_url`) VALUES (5, 'Premiant Hops', 1, 'Like most hops of Czech origin, Premiant comes from a lineage of popular Saaz hops and was first released in 1996. Utilized as a dual purpose hop, Premiant offers a pleasant, mild aroma of earthy floral and slight citrus notes to your brew of choice. It also contains an alpha acid range between about 7% and 10%, with a well rounded bitterness that is clean and not harsh. Try it in your next IPA, APA, or Belgian Ale recipe for a little kick. While most brewers have agreed there is no great substitute for Premiant, you could always fall back on parent Saaz hops if needed. \n\n', 'http://www.segalranch.com/varieties');

COMMIT;


-- -----------------------------------------------------
-- Data for table `grain`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `grain` (`id`, `name`, `enabled`, `description`, `img_url`) VALUES (1, 'grainy grain', 1, 'very grainy', 'https://en.wikipedia.org/wiki/Malt#/media/File:Gr%C3%BCnmalz.jpg');
INSERT INTO `grain` (`id`, `name`, `enabled`, `description`, `img_url`) VALUES (2, 'malt', 1, 'Malt is grain that has been converted into sugar. That sugar is consumed by yeast to create alcohol; a process called fermentation. Grain becomes malt, which becomes beer. ', 'https://en.wikipedia.org/wiki/Malt');
INSERT INTO `grain` (`id`, `name`, `enabled`, `description`, `img_url`) VALUES (3, 'barley', 1, 'Barley (Hordeum vulgare), a member of the grass family, is a major cereal grain grown in temperate climates globally. It was one of the first cultivated grains, particularly in Eurasia as early as 10,000 years ago.[3] Barley has been used as animal fodder, as a source of fermentable material for beer and certain distilled beverages, and as a component of various health foods. It is used in soups and stews, and in barley bread of various cultures. Barley grains are commonly made into malt in a traditional and ancient method of preparation.', 'https://en.wikipedia.org/wiki/Barley');
INSERT INTO `grain` (`id`, `name`, `enabled`, `description`, `img_url`) VALUES (4, 'base malts', 1, 'These compose the bulk of the grain bill. Typically lighter-colored, these workhorse malts provide the majority of the proteins, fermentable sugars, and minerals required to create beer.', 'https://byo.com/article/understanding-base-malt/');
INSERT INTO `grain` (`id`, `name`, `enabled`, `description`, `img_url`) VALUES (5, 'Crystal Malts', 1, 'Crystal malts are steep-able and generally used to add sweetness and color to both extract and all-grain brews. They\'re usually named based on color. As a general rule, the lighter-colored crystal malts are more \"sweet,\" while darker crystal malts add roastiness or nuttiness in addition to sweetness.', 'https://www.northernbrewer.com/products/simpsons-medium-crystal-malt');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_hops`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `recipe_hops` (`hops_id`, `beer_id`, `hops_amount`) VALUES (1, 1, 'alot');
INSERT INTO `recipe_hops` (`hops_id`, `beer_id`, `hops_amount`) VALUES (2, 2, '2 ');
INSERT INTO `recipe_hops` (`hops_id`, `beer_id`, `hops_amount`) VALUES (3, 3, '3');
INSERT INTO `recipe_hops` (`hops_id`, `beer_id`, `hops_amount`) VALUES (4, 4, '4');
INSERT INTO `recipe_hops` (`hops_id`, `beer_id`, `hops_amount`) VALUES (5, 5, '5');
INSERT INTO `recipe_hops` (`hops_id`, `beer_id`, `hops_amount`) VALUES (1, 6, '6');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_grain`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `recipe_grain` (`grain_id`, `beer_id`, `grain_amount`) VALUES (1, 1, '1');
INSERT INTO `recipe_grain` (`grain_id`, `beer_id`, `grain_amount`) VALUES (2, 2, '2');
INSERT INTO `recipe_grain` (`grain_id`, `beer_id`, `grain_amount`) VALUES (3, 3, '3');
INSERT INTO `recipe_grain` (`grain_id`, `beer_id`, `grain_amount`) VALUES (4, 5, '6');

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorites`
-- -----------------------------------------------------
START TRANSACTION;
USE `brushrdb`;
INSERT INTO `favorites` (`beer_recipe_id`, `user_id`) VALUES (1, 1);

COMMIT;

