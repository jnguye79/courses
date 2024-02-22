-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema group6-games
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema group6-games
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `group6-games` DEFAULT CHARACTER SET utf8 ;
USE `group6-games` ;

-- -----------------------------------------------------
-- Table `group6-games`.`developers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group6-games`.`developers` (
  `developer_id` INT NOT NULL,
  `developer_name` VARCHAR(45) NULL,
  PRIMARY KEY (`developer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group6-games`.`publishers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group6-games`.`publishers` (
  `publisher_id` INT NOT NULL,
  `publisher_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`publisher_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group6-games`.`consoles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group6-games`.`consoles` (
  `console_id` INT NOT NULL,
  `console_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`console_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group6-games`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group6-games`.`games` (
  `game_id` INT NOT NULL AUTO_INCREMENT,
  `game_title` VARCHAR(45) NOT NULL,
  `developer_id` INT NOT NULL,
  `publisher_id` INT NOT NULL,
  `console_id` INT NOT NULL,
  `release_date` DATETIME NULL,
  PRIMARY KEY (`game_id`, `developer_id`, `publisher_id`, `console_id`),
  INDEX `fk_games_developers1_idx` (`developer_id` ASC) VISIBLE,
  INDEX `fk_games_publishers1_idx` (`publisher_id` ASC) VISIBLE,
  INDEX `fk_games_consoles1_idx` (`console_id` ASC) VISIBLE,
  CONSTRAINT `fk_games_developers1`
    FOREIGN KEY (`developer_id`)
    REFERENCES `group6-games`.`developers` (`developer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_publishers1`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `group6-games`.`publishers` (`publisher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_consoles`
    FOREIGN KEY (`console_id`)
    REFERENCES `group6-games`.`consoles` (`console_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group6-games`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group6-games`.`genres` (
  `genre_id` INT NOT NULL,
  `genre_name` VARCHAR(45) NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group6-games`.`regions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group6-games`.`regions` (
  `region_id` INT NOT NULL,
  `region` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`region_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group6-games`.`genres_has_games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group6-games`.`genres_has_games` (
  `genre_id` INT NOT NULL,
  `game_id` INT NOT NULL,
  `console_id` INT NOT NULL,
  `developer_id` INT NOT NULL,
  `publisher_id` INT NOT NULL,
  PRIMARY KEY (`genre_id`, `game_id`, `console_id`, `developer_id`, `publisher_id`),
  INDEX `fk_genres_has_games_games1_idx` (`game_id` ASC, `console_id` ASC, `developer_id` ASC, `publisher_id` ASC) VISIBLE,
  INDEX `fk_genres_has_games_genres1_idx` (`genre_id` ASC) VISIBLE,
  CONSTRAINT `fk_genres_has_games_genres1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `group6-games`.`genres` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genres_has_games_games1`
    FOREIGN KEY (`game_id` , `developer_id` , `publisher_id`)
    REFERENCES `group6-games`.`games` (`game_id` , `developer_id` , `publisher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group6-games`.`regions_has_games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group6-games`.`regions_has_games` (
  `region_id` INT NOT NULL,
  `game_id` INT NOT NULL,
  `developer_id` INT NOT NULL,
  `publisher_id` INT NOT NULL,
  `console_id` INT NOT NULL,
  `sales` FLOAT NULL,
  PRIMARY KEY (`region_id`, `game_id`, `developer_id`, `publisher_id`, `console_id`),
  INDEX `fk_regions_has_games_games1_idx` (`game_id` ASC, `developer_id` ASC, `publisher_id` ASC, `console_id` ASC) VISIBLE,
  INDEX `fk_regions_has_games_regions1_idx` (`region_id` ASC) VISIBLE,
  CONSTRAINT `fk_regions_has_games_regions1`
    FOREIGN KEY (`region_id`)
    REFERENCES `group6-games`.`regions` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_regions_has_games_games1`
    FOREIGN KEY (`game_id` , `developer_id` , `publisher_id` , `console_id`)
    REFERENCES `group6-games`.`games` (`game_id` , `developer_id` , `publisher_id` , `console_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
