-- -----------------------------------------------------
-- Schema Valhala
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Valhala` DEFAULT CHARACTER SET utf8 ;
USE `Valhala` ;

-- DROP DATABASE `Valhala`;

-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(75) NOT NULL,
  `Senha` CHAR(64) NOT NULL,
  PRIMARY KEY (`ID`));

-- -----------------------------------------------------
-- Table `Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produto` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(75) NOT NULL,
  `Preço` DECIMAL NOT NULL,
  `Descrição` TEXT NOT NULL,
  `Imagem` LONGBLOB NULL,
  PRIMARY KEY (`ID`));

-- -----------------------------------------------------
-- Table `Etapa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Etapa` (
  `ID` INT NOT NULL,
  `Imagem` LONGBLOB NOT NULL,
  `Produto` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `Produto`
    FOREIGN KEY (`Produto`)
    REFERENCES `Produto` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `Encomenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Encomenda` (
  `ID` INT NOT NULL,
  `Estado` TINYINT NOT NULL,
  `Data de Criação` DATE NOT NULL,
  `Data de Entrega` DATE NULL,
  `Cliente` INT NOT NULL,
  `Produto` INT NOT NULL,
  `Etapa` INT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `Cliente_ID`
    FOREIGN KEY (`Cliente`)
    REFERENCES `Cliente` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Produto_ID`
    FOREIGN KEY (`Produto`)
    REFERENCES `Produto` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Etapa`
    FOREIGN KEY (`Etapa`)
    REFERENCES `Etapa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fornecedor` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(75) NOT NULL,
  `Senha` CHAR(64) NOT NULL,
  PRIMARY KEY (`ID`));

-- -----------------------------------------------------
-- Table `Gestor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gestor` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(75) NOT NULL,
  `Senha` CHAR(64) NOT NULL,
  PRIMARY KEY (`ID`));

-- -----------------------------------------------------
-- Table `Funcionário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funcionário` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(75) NOT NULL,
  `Senha` CHAR(64) NOT NULL,
  PRIMARY KEY (`ID`));

-- -----------------------------------------------------
-- Table `Peça`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peça` (
  `ID` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  `Imagem` LONGBLOB NOT NULL,
  `Fornecedor` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `Fornecedor`
    FOREIGN KEY (`Fornecedor`)
    REFERENCES `Fornecedor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `Produto_Peça`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produto_Peça` (
  `Peça_ID` INT NOT NULL,
  `Produto_ID` INT NOT NULL,
  PRIMARY KEY (`Peça_ID`, `Produto_ID`),
  CONSTRAINT `fk_Peça_has_Produto_Peça1`
    FOREIGN KEY (`Peça_ID`)
    REFERENCES `Peça` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peça_has_Produto_Produto1`
    FOREIGN KEY (`Produto_ID`)
    REFERENCES `Produto` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `Funcionário_Encomenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funcionário_Encomenda` (
  `Funcionário_ID` INT NOT NULL,
  `Encomenda_ID` INT NOT NULL,
  PRIMARY KEY (`Funcionário_ID`, `Encomenda_ID`),
  CONSTRAINT `fk_Funcionário_has_Encomenda_Funcionário1`
    FOREIGN KEY (`Funcionário_ID`)
    REFERENCES `Funcionário` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionário_has_Encomenda_Encomenda1`
    FOREIGN KEY (`Encomenda_ID`)
    REFERENCES `Encomenda` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `Peça_Etapa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peça_Etapa` (
  `Peça_ID` INT NOT NULL,
  `Etapa_ID` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Peça_ID`, `Etapa_ID`),
  CONSTRAINT `fk_Peça_has_Etapa_Peça1`
    FOREIGN KEY (`Peça_ID`)
    REFERENCES `Peça` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peça_has_Etapa_Etapa1`
    FOREIGN KEY (`Etapa_ID`)
    REFERENCES `Etapa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `Peça_Funcionário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peça_Funcionário` (
  `Peça_ID` INT NOT NULL,
  `Funcionário_ID` INT NOT NULL,
  PRIMARY KEY (`Peça_ID`, `Funcionário_ID`),
  CONSTRAINT `fk_Peça_has_Funcionário_Peça1`
    FOREIGN KEY (`Peça_ID`)
    REFERENCES `Peça` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peça_has_Funcionário_Funcionário1`
    FOREIGN KEY (`Funcionário_ID`)
    REFERENCES `Funcionário` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `PedidoPeça`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PedidoPeça` (
  `ID` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  `Estado` TINYINT NOT NULL,
  `Peça` INT NOT NULL,
  `Gestor` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `Peça_ID`
    FOREIGN KEY (`Peça`)
    REFERENCES `Peça` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Gestor`
    FOREIGN KEY (`Gestor`)
    REFERENCES `Gestor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

