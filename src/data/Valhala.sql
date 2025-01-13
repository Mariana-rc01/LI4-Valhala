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
-- Table `Peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peca` (
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
  `Peca_ID` INT NOT NULL,
  `Produto_ID` INT NOT NULL,
  PRIMARY KEY (`Peca_ID`, `Produto_ID`),
  CONSTRAINT `fk_Peca_has_Produto_Peca1`
    FOREIGN KEY (`Peca_ID`)
    REFERENCES `Peca` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peca_has_Produto_Produto1`
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
-- Table `Peca_Etapa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peca_Etapa` (
  `Peca_ID` INT NOT NULL,
  `Etapa_ID` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Peca_ID`, `Etapa_ID`),
  CONSTRAINT `fk_Peca_has_Etapa_Peca1`
    FOREIGN KEY (`Peca_ID`)
    REFERENCES `Peca` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peca_has_Etapa_Etapa1`
    FOREIGN KEY (`Etapa_ID`)
    REFERENCES `Etapa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `Peca_Funcionário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peca_Funcionário` (
  `Peca_ID` INT NOT NULL,
  `Funcionário_ID` INT NOT NULL,
  PRIMARY KEY (`Peca_ID`, `Funcionário_ID`),
  CONSTRAINT `fk_Peca_has_Funcionário_Peca1`
    FOREIGN KEY (`Peca_ID`)
    REFERENCES `Peca` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peca_has_Funcionário_Funcionário1`
    FOREIGN KEY (`Funcionário_ID`)
    REFERENCES `Funcionário` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `PedidoPeca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PedidoPeca` (
  `ID` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  `Estado` TINYINT NOT NULL,
  `Peca` INT NOT NULL,
  `Gestor` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `Peca_ID`
    FOREIGN KEY (`Peca`)
    REFERENCES `Peca` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Gestor`
    FOREIGN KEY (`Gestor`)
    REFERENCES `Gestor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

