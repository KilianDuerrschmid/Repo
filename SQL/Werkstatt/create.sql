DROP DATABASE IF EXISTS werkstatt;
CREATE DATABASE IF NOT EXISTS `werkstatt`;
USE `werkstatt` ;

-- -----------------------------------------------------
-- Table `kunde`
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
-- Table `lieferant`
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
-- Table `ersatzteil_leistung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ersatzteil_leistung` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `preis` DOUBLE NOT NULL,
  `bezeichnung` VARCHAR(45) NOT NULL,
  `lieferantId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ersatzteile_lieferant_idx` (`lieferantId` ASC),
  CONSTRAINT `fk_ersatzteile_lieferant`
    FOREIGN KEY (`lieferantId`)
    REFERENCES `lieferant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fahrzeug`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fahrzeug` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fin` VARCHAR(17) NOT NULL,
  `kennzeichen` VARCHAR(45) NOT NULL,
  `marke` VARCHAR(45) NOT NULL,
  `modell` VARCHAR(45) NOT NULL,
  `typ` VARCHAR(45) NOT NULL,
  `baujahr` DATE NOT NULL,
  `erstzulassung` DATE NOT NULL,
  `kundeId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_fahrzeug_kunde1_idx` (`kundeId` ASC),
  CONSTRAINT `fk_fahrzeug_kunde1`
    FOREIGN KEY (`kundeId`)
    REFERENCES `kunde` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `steuersatz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `steuersatz` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `steuersatz` DOUBLE NOT NULL,
  `bezeichnung` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bezeichnung` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rechnung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rechnung` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rechnungsnummer` VARCHAR(100) NOT NULL,
  `rechnungsdatum` DATE NOT NULL,
  `kilometerstand` DOUBLE NOT NULL,
  `fahrzeugId` INT NOT NULL,
  `statusId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rechnung_fahrzeug1_idx` (`fahrzeugId` ASC),
  INDEX `fk_rechnung_status1_idx` (`statusId` ASC),
  CONSTRAINT `fk_rechnung_fahrzeug1`
    FOREIGN KEY (`fahrzeugId`)
    REFERENCES `fahrzeug` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rechnung_status1`
    FOREIGN KEY (`statusId`)
    REFERENCES `status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rechnungsPositionen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rechnungsPositionen` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `menge` DOUBLE NOT NULL,
  `ersatzteil_leistungId` INT NOT NULL,
  `rechnungId` INT NOT NULL,
  `steuersatzId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rechnungsPositionen_ersatzteile1_idx` (`ersatzteil_leistungId` ASC),
  INDEX `fk_rechnungsPositionen_rechnung1_idx` (`rechnungId` ASC),
  INDEX `fk_rechnungsPositionen_steuersatz1_idx` (`steuersatzId` ASC),
  CONSTRAINT `fk_rechnungsPositionen_ersatzteile1`
    FOREIGN KEY (`ersatzteil_leistungId`)
    REFERENCES `ersatzteil_leistung` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rechnungsPositionen_rechnung1`
    FOREIGN KEY (`rechnungId`)
    REFERENCES `rechnung` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rechnungsPositionen_steuersatz1`
    FOREIGN KEY (`steuersatzId`)
    REFERENCES `steuersatz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;