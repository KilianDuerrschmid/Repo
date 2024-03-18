CREATE DATABASE IF NOT EXISTS `werkstatt`;
USE `werkstatt` ;

-- -----------------------------------------------------
-- Table `werkstatt`.`kunde`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kunde` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `anrede` VARCHAR(45) NOT NULL,
  `titel` VARCHAR(45) NOT NULL,
  `vorname` VARCHAR(45) NOT NULL,
  `nachname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `tel` VARCHAR(45) NOT NULL,
  `geschlecht` CHAR(1) NOT NULL,
  `strasse` VARCHAR(45) NOT NULL,
  `plz` INT NOT NULL,
  `ort` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `werkstatt`.`lieferant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lieferant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firmenname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `tel` VARCHAR(45) NOT NULL,
  `strasse` VARCHAR(45) NOT NULL,
  `plz` INT NOT NULL,
  `ort` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `werkstatt`.`ersatzteile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ersatzteile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `einkaufspreis` DOUBLE NOT NULL,
  `verkaufspreis` DOUBLE NOT NULL,
  `ersatzteilnummer` VARCHAR(50) NOT NULL,
  `bezeichnung` VARCHAR(45) NOT NULL,
  `lieferantId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ersatzteile_lieferant_idx` (`lieferantId` ASC),
  CONSTRAINT `fk_ersatzteile_lieferant`
    FOREIGN KEY (`lieferantId`)
    REFERENCES `werkstatt`.`lieferant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `werkstatt`.`fahrzeug`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fahrzeug` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fin` VARCHAR(17) NOT NULL,
  `marke` VARCHAR(45) NOT NULL,
  `modell` VARCHAR(45) NOT NULL,
  `typ` VARCHAR(45) NOT NULL,
  `baujahr` DATE NOT NULL,
  `kilometerstand` DOUBLE NOT NULL,
  `erstzulassung` DATE NOT NULL,
  `kundeId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_fahrzeug_kunde1_idx` (`kundeId` ASC),
  CONSTRAINT `fk_fahrzeug_kunde1`
    FOREIGN KEY (`kundeId`)
    REFERENCES `werkstatt`.`kunde` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `werkstatt`.`steuersatz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `steuersatz` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `steuersatz` DOUBLE NOT NULL,
  `bezeichnung` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `werkstatt`.`rechnung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rechnung` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rechnungsnummer` VARCHAR(100) NOT NULL,
  `rechnungsdatum` DATE NOT NULL,
  `fahrzeugId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rechnung_fahrzeug1_idx` (`fahrzeugId` ASC),
  CONSTRAINT `fk_rechnung_fahrzeug1`
    FOREIGN KEY (`fahrzeugId`)
    REFERENCES `werkstatt`.`fahrzeug` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `werkstatt`.`rechnungsPositionen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rechnungsPositionen` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ersatzteilMenge` DOUBLE NOT NULL,
  `ersatzteileId` INT NOT NULL,
  `rechnungId` INT NOT NULL,
  `steuersatzId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rechnungsPositionen_ersatzteile1_idx` (`ersatzteileId` ASC) ,
  INDEX `fk_rechnungsPositionen_rechnung1_idx` (`rechnungId` ASC) ,
  INDEX `fk_rechnungsPositionen_steuersatz1_idx` (`steuersatzId` ASC) ,
  CONSTRAINT `fk_rechnungsPositionen_ersatzteile1`
    FOREIGN KEY (`ersatzteileId`)
    REFERENCES `werkstatt`.`ersatzteile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rechnungsPositionen_rechnung1`
    FOREIGN KEY (`rechnungId`)
    REFERENCES `werkstatt`.`rechnung` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rechnungsPositionen_steuersatz1`
    FOREIGN KEY (`steuersatzId`)
    REFERENCES `werkstatt`.`steuersatz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `werkstatt`.`leistung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `leistung` (
  `id` INT NOT NULL,
  `beschreibung` VARCHAR(45) NULL,
  `stundensatz` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `werkstatt`.`leistungPosition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `leistungPosition` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `arbeitszeit` DOUBLE NULL,
  `leistung_id` INT NOT NULL,
  `rechnung_id` INT NOT NULL,
  `steuersatzId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_leistungPosition_leistung1_idx` (`leistung_id` ASC) ,
  INDEX `fk_leistungPosition_rechnung1_idx` (`rechnung_id` ASC) ,
  INDEX `fk_leistungPosition_steuersatz1_idx` (`steuersatzId` ASC) ,
  CONSTRAINT `fk_leistungPosition_leistung1`
    FOREIGN KEY (`leistung_id`)
    REFERENCES `werkstatt`.`leistung` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_leistungPosition_rechnung1`
    FOREIGN KEY (`rechnung_id`)
    REFERENCES `werkstatt`.`rechnung` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_leistungPosition_steuersatz1`
    FOREIGN KEY (`steuersatzId`)
    REFERENCES `werkstatt`.`steuersatz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

