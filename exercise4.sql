-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Docter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Docter` (
  `idDocter` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Date_of_birth` DATE NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` VARCHAR(45) NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`idDocter`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medical` (
  `idMedical` INT NOT NULL,
  `Overtime_rate` VARCHAR(45) NULL,
  `Docter_idDocter` INT NOT NULL,
  PRIMARY KEY (`idMedical`),
  INDEX `fk_Medical_Docter1_idx` (`Docter_idDocter` ASC),
  CONSTRAINT `fk_Medical_Docter1`
    FOREIGN KEY (`Docter_idDocter`)
    REFERENCES `mydb`.`Docter` (`idDocter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Specialist` (
  `idSpecialist` INT NOT NULL,
  `Field_area` VARCHAR(45) NULL,
  `Docter_idDocter` INT NOT NULL,
  PRIMARY KEY (`idSpecialist`),
  INDEX `fk_Specialist_Docter1_idx` (`Docter_idDocter` ASC),
  CONSTRAINT `fk_Specialist_Docter1`
    FOREIGN KEY (`Docter_idDocter`)
    REFERENCES `mydb`.`Docter` (`idDocter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `Pat_Name` VARCHAR(45) NULL,
  `Pat_Address` VARCHAR(45) NULL,
  `Pat_Phone_number` VARCHAR(45) NULL,
  `Pat_Date_of_birth` DATE NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Appointment` (
  `idAppointment` INT NOT NULL,
  `Date` DATE NULL,
  `Time` DATETIME NULL,
  `Docter_idDocter` INT NOT NULL,
  `Patient_idPatient` INT NOT NULL,
  PRIMARY KEY (`idAppointment`),
  INDEX `fk_Appointment_Docter_idx` (`Docter_idDocter` ASC),
  INDEX `fk_Appointment_Patient1_idx` (`Patient_idPatient` ASC),
  CONSTRAINT `fk_Appointment_Docter`
    FOREIGN KEY (`Docter_idDocter`)
    REFERENCES `mydb`.`Docter` (`idDocter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_Patient1`
    FOREIGN KEY (`Patient_idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `idPayment` INT NOT NULL,
  `Details` VARCHAR(45) NULL,
  `Method` VARCHAR(45) NULL,
  `Patient_idPatient` INT NOT NULL,
  PRIMARY KEY (`idPayment`),
  INDEX `fk_Payment_Patient1_idx` (`Patient_idPatient` ASC),
  CONSTRAINT `fk_Payment_Patient1`
    FOREIGN KEY (`Patient_idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill` (
  `idBill` INT NOT NULL,
  `Total` VARCHAR(45) NULL,
  `Docter_idDocter` INT NOT NULL,
  PRIMARY KEY (`idBill`),
  INDEX `fk_Bill_Docter1_idx` (`Docter_idDocter` ASC),
  CONSTRAINT `fk_Bill_Docter1`
    FOREIGN KEY (`Docter_idDocter`)
    REFERENCES `mydb`.`Docter` (`idDocter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment_has_Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment_has_Bill` (
  `Payment_idPayment` INT NOT NULL,
  `Bill_idBill` INT NOT NULL,
  PRIMARY KEY (`Payment_idPayment`, `Bill_idBill`),
  INDEX `fk_Payment_has_Bill_Bill1_idx` (`Bill_idBill` ASC),
  INDEX `fk_Payment_has_Bill_Payment1_idx` (`Payment_idPayment` ASC),
  CONSTRAINT `fk_Payment_has_Bill_Payment1`
    FOREIGN KEY (`Payment_idPayment`)
    REFERENCES `mydb`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_has_Bill_Bill1`
    FOREIGN KEY (`Bill_idBill`)
    REFERENCES `mydb`.`Bill` (`idBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
