-- MySQL Script generated by MySQL Workbench
-- sex 30 out 2020 00:50:12 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`type_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type_user` (
  `id_type_user` INT NOT NULL AUTO_INCREMENT,
  `type_user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_type_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `type_user_id_type_user` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `login` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_user`),
  INDEX `fk_user_type_user_idx` (`type_user_id_type_user` ASC) VISIBLE,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  CONSTRAINT `fk_user_type_user`
    FOREIGN KEY (`type_user_id_type_user`)
    REFERENCES `mydb`.`type_user` (`id_type_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `id_clients` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_clients`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`exercises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`exercises` (
  `id_exercises` INT NOT NULL AUTO_INCREMENT,
  `exercise_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_exercises`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`exercise_series_quantity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`exercise_series_quantity` (
  `id_exercises_series_quantity` INT NOT NULL AUTO_INCREMENT,
  `exercise_series_quantity` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_exercises_series_quantity`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`exercises_quantity_number`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`exercises_quantity_number` (
  `id_exercises_quantity_number` INT NOT NULL AUTO_INCREMENT,
  `exercises_quantity_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_exercises_quantity_number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`clients_has_exercises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients_has_exercises` (
  `clients_id_clients` INT NOT NULL,
  `exercises_id_exercises` INT NOT NULL,
  `quantity_exercise_id_quantity_exercise` INT NOT NULL,
  `exercises_quantity_number_id_exercises_quantity_number` INT NOT NULL,
  PRIMARY KEY (`clients_id_clients`, `exercises_id_exercises`),
  INDEX `fk_clients_has_exercises_exercises1_idx` (`exercises_id_exercises` ASC) VISIBLE,
  INDEX `fk_clients_has_exercises_clients1_idx` (`clients_id_clients` ASC) VISIBLE,
  INDEX `fk_clients_has_exercises_quantity_exercise1_idx` (`quantity_exercise_id_quantity_exercise` ASC) VISIBLE,
  INDEX `fk_clients_has_exercises_exercises_quantity_number1_idx` (`exercises_quantity_number_id_exercises_quantity_number` ASC) VISIBLE,
  CONSTRAINT `fk_clients_has_exercises_clients1`
    FOREIGN KEY (`clients_id_clients`)
    REFERENCES `mydb`.`clients` (`id_clients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clients_has_exercises_exercises1`
    FOREIGN KEY (`exercises_id_exercises`)
    REFERENCES `mydb`.`exercises` (`id_exercises`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clients_has_exercises_quantity_exercise1`
    FOREIGN KEY (`quantity_exercise_id_quantity_exercise`)
    REFERENCES `mydb`.`exercise_series_quantity` (`id_exercises_series_quantity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clients_has_exercises_exercises_quantity_number1`
    FOREIGN KEY (`exercises_quantity_number_id_exercises_quantity_number`)
    REFERENCES `mydb`.`exercises_quantity_number` (`id_exercises_quantity_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`days_of_week`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`days_of_week` (
  `id_days_of_week` INT NOT NULL AUTO_INCREMENT,
  `day_of_week` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_days_of_week`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`hour_of_exercise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`hour_of_exercise` (
  `id_hour_of_exercise` INT NOT NULL AUTO_INCREMENT,
  `hour_of_exercise` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_hour_of_exercise`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`days_of_week_has_clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`days_of_week_has_clients` (
  `days_of_week_id_days_of_week` INT NOT NULL,
  `clients_id_clients` INT NOT NULL,
  `hour_of_exercise_id_hour_of_exercise` INT NOT NULL,
  PRIMARY KEY (`days_of_week_id_days_of_week`, `clients_id_clients`),
  INDEX `fk_days_of_week_has_clients_clients1_idx` (`clients_id_clients` ASC) VISIBLE,
  INDEX `fk_days_of_week_has_clients_days_of_week1_idx` (`days_of_week_id_days_of_week` ASC) VISIBLE,
  INDEX `fk_days_of_week_has_clients_hour_of_exercise1_idx` (`hour_of_exercise_id_hour_of_exercise` ASC) VISIBLE,
  CONSTRAINT `fk_days_of_week_has_clients_days_of_week1`
    FOREIGN KEY (`days_of_week_id_days_of_week`)
    REFERENCES `mydb`.`days_of_week` (`id_days_of_week`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_days_of_week_has_clients_clients1`
    FOREIGN KEY (`clients_id_clients`)
    REFERENCES `mydb`.`clients` (`id_clients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_days_of_week_has_clients_hour_of_exercise1`
    FOREIGN KEY (`hour_of_exercise_id_hour_of_exercise`)
    REFERENCES `mydb`.`hour_of_exercise` (`id_hour_of_exercise`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`token_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`token_user` (
  `id_token_user` INT NOT NULL AUTO_INCREMENT,
  `user_id_user` INT NOT NULL,
  `token_user` VARCHAR(1000) NOT NULL,
  `expired_at` DATETIME NOT NULL,
  PRIMARY KEY (`id_token_user`),
  INDEX `fk_token_user_user1_idx` (`user_id_user` ASC) VISIBLE,
  UNIQUE INDEX `token_user_UNIQUE` (`token_user` ASC) VISIBLE,
  CONSTRAINT `fk_token_user_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `mydb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`refresh_token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`refresh_token` (
  `id_refresh_token` INT NOT NULL AUTO_INCREMENT,
  `token_user_id_token_user` INT NOT NULL,
  `refresh_token` VARCHAR(1000) NOT NULL,
  `expired_at` DATETIME NOT NULL,
  PRIMARY KEY (`id_refresh_token`),
  INDEX `fk_refresh_token_token_user1_idx` (`token_user_id_token_user` ASC) VISIBLE,
  UNIQUE INDEX `refresh_token_UNIQUE` (`refresh_token` ASC) VISIBLE,
  CONSTRAINT `fk_refresh_token_token_user1`
    FOREIGN KEY (`token_user_id_token_user`)
    REFERENCES `mydb`.`token_user` (`id_token_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`verify_code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`verify_code` (
  `id_verify_code` INT NOT NULL AUTO_INCREMENT,
  `user_id_user` INT NOT NULL,
  `verify_code` VARCHAR(45) NOT NULL,
  `expired_at` DATETIME NOT NULL,
  PRIMARY KEY (`id_verify_code`),
  INDEX `fk_verify_code_user1_idx` (`user_id_user` ASC) VISIBLE,
  UNIQUE INDEX `verify_code_UNIQUE` (`verify_code` ASC) VISIBLE,
  CONSTRAINT `fk_verify_code_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `mydb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
