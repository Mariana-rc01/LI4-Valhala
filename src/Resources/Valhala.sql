-- -----------------------------------------------------
-- Schema Valhala
-- -----------------------------------------------------
USE master;
GO
CREATE DATABASE [Valhala];
GO

USE [Valhala];

-- -----------------------------------------------------
-- Table Cliente
-- -----------------------------------------------------
CREATE TABLE [Cliente] (
    [ID] INT NOT NULL PRIMARY KEY,
    [Nome] NVARCHAR(75) NOT NULL,
    [Senha] CHAR(64) NOT NULL
);
GO

-- -----------------------------------------------------
-- Table Produto
-- -----------------------------------------------------
CREATE TABLE [Produto] (
    [ID] INT NOT NULL PRIMARY KEY,
    [Nome] NVARCHAR(75) NOT NULL,
    [Preço] DECIMAL(18, 2) NOT NULL,
    [Descrição] NVARCHAR(MAX) NOT NULL,
    [Imagem] VARCHAR(200) NULL,
    [Desenho] VARCHAR(200) NULL
);
GO

-- -----------------------------------------------------
-- Table Etapa
-- -----------------------------------------------------
CREATE TABLE [Etapa] (
    [ID] INT NOT NULL PRIMARY KEY,
    [Imagem] VARCHAR(200) NULL,
    [Produto] INT NOT NULL,
    FOREIGN KEY ([Produto]) REFERENCES [Produto]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table Encomenda
-- -----------------------------------------------------
CREATE TABLE [Encomenda] (
    [ID] INT NOT NULL PRIMARY KEY,
    [Estado] TINYINT NOT NULL,
    [Data de Criação] DATE NOT NULL,
    [Data de Entrega] DATE NULL,
    [Cliente] INT NOT NULL,
    [Produto] INT NOT NULL,
    [Etapa] INT NULL,
    FOREIGN KEY ([Cliente]) REFERENCES [Cliente]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([Produto]) REFERENCES [Produto]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([Etapa]) REFERENCES [Etapa]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table Fornecedor
-- -----------------------------------------------------
CREATE TABLE [Fornecedor] (
    [ID] INT NOT NULL PRIMARY KEY,
    [Nome] NVARCHAR(75) NOT NULL,
    [Senha] CHAR(64) NOT NULL
);
GO

-- -----------------------------------------------------
-- Table Gestor
-- -----------------------------------------------------
CREATE TABLE [Gestor] (
    [ID] INT NOT NULL PRIMARY KEY,
    [Nome] NVARCHAR(75) NOT NULL,
    [Senha] CHAR(64) NOT NULL
);
GO

-- -----------------------------------------------------
-- Table Funcionário
-- -----------------------------------------------------
CREATE TABLE [Funcionário] (
    [ID] INT NOT NULL PRIMARY KEY,
    [Nome] NVARCHAR(75) NOT NULL,
    [Senha] CHAR(64) NOT NULL
);
GO

-- -----------------------------------------------------
-- Table Peça
-- -----------------------------------------------------
CREATE TABLE [Peça] (
    [ID] INT NOT NULL PRIMARY KEY,
    [Quantidade] INT NOT NULL,
    [Imagem] VARCHAR(200) NULL,
    [Fornecedor] INT NULL,
    FOREIGN KEY ([Fornecedor]) REFERENCES [Fornecedor]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table ProdutoPeça
-- -----------------------------------------------------
CREATE TABLE [ProdutoPeça] (
    [Peca_ID] INT NOT NULL,
    [Produto_ID] INT NOT NULL,
    PRIMARY KEY ([Peca_ID], [Produto_ID]),
    FOREIGN KEY ([Peca_ID]) REFERENCES [Peça]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([Produto_ID]) REFERENCES [Produto]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table FuncionárioEncomenda
-- -----------------------------------------------------
CREATE TABLE [FuncionárioEncomenda] (
    [Funcionario_ID] INT NOT NULL,
    [Encomenda_ID] INT NOT NULL,
    PRIMARY KEY ([Funcionario_ID], [Encomenda_ID]),
    FOREIGN KEY ([Funcionario_ID]) REFERENCES [Funcionário]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([Encomenda_ID]) REFERENCES [Encomenda]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table PeçaEtapa
-- -----------------------------------------------------
CREATE TABLE [PeçaEtapa] (
    [Peca_ID] INT NOT NULL,
    [Etapa_ID] INT NOT NULL,
    [Quantidade] INT NOT NULL,
    PRIMARY KEY ([Peca_ID], [Etapa_ID]),
    FOREIGN KEY ([Peca_ID]) REFERENCES [Peça]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([Etapa_ID]) REFERENCES [Etapa]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table PeçaFuncionário
-- -----------------------------------------------------
CREATE TABLE [PeçaFuncionário] (
    [Peca_ID] INT NOT NULL,
    [Funcionario_ID] INT NOT NULL,
    PRIMARY KEY ([Peca_ID], [Funcionario_ID]),
    FOREIGN KEY ([Peca_ID]) REFERENCES [Peça]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([Funcionario_ID]) REFERENCES [Funcionário]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

-- -----------------------------------------------------
-- Table PedidoPeça
-- -----------------------------------------------------
CREATE TABLE [PedidoPeça] (
    [ID] INT NOT NULL PRIMARY KEY,
    [Quantidade] INT NOT NULL,
    [Estado] TINYINT NOT NULL,
    [Peça] INT NOT NULL,
    [Gestor] INT NOT NULL,
    FOREIGN KEY ([Peça]) REFERENCES [Peça]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([Gestor]) REFERENCES [Gestor]([ID])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO
