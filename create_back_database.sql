-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cliente
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cliente
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cliente` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema movimentacao
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema movimentacao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movimentacao` ;
-- -----------------------------------------------------
-- Schema saldo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema saldo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `saldo` ;
-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` ;
-- -----------------------------------------------------
-- Schema posicao
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema posicao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `posicao` ;
-- -----------------------------------------------------
-- Schema bots
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bots
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bots` ;
-- -----------------------------------------------------
-- Schema elemento_financeiro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema elemento_financeiro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `elemento_financeiro` ;
-- -----------------------------------------------------
-- Schema operacoes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema operacoes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `operacoes` ;
-- -----------------------------------------------------
-- Schema pais
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pais
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pais` ;
-- -----------------------------------------------------
-- Schema renda_fixa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema renda_fixa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `renda_fixa` ;
-- -----------------------------------------------------
-- Schema renda_variavel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema renda_variavel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `renda_variavel` ;
USE `cliente` ;

-- -----------------------------------------------------
-- Table `cliente`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cliente`.`endereco` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `logradouro` VARCHAR(120) NOT NULL,
  `numero` INT NOT NULL,
  `cep` VARCHAR(20) NOT NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_endereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cliente`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cliente`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `endereco_id_endereco` INT NOT NULL,
  `tipo_cliente` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_Cliente_Endereço1_idx` (`endereco_id_endereco` ASC),
  CONSTRAINT `fk_Cliente_Endereço1`
    FOREIGN KEY (`endereco_id_endereco`)
    REFERENCES `cliente`.`endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cliente`.`pessoa_juridica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cliente`.`pessoa_juridica` (
  `id_pessoa_juridica` INT NOT NULL AUTO_INCREMENT,
  `cliente_id_cliente` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `razao_social` VARCHAR(200) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pessoa_juridica`),
  INDEX `fk_PessoaJuridica_Cliente1_idx` (`cliente_id_cliente` ASC),
  CONSTRAINT `fk_PessoaJuridica_Cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `cliente`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pais`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pais`.`pais` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `nome_pais` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pais`.`nacionalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pais`.`nacionalidade` (
  `id_nacionalidade` INT NOT NULL AUTO_INCREMENT,
  `pais_id_pais` INT NOT NULL,
  `nome_nacionalidade` VARCHAR(70) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_nacionalidade`),
  INDEX `fk_nacionalidade_pais_idx` (`pais_id_pais` ASC),
  CONSTRAINT `fk_nacionalidade_pais`
    FOREIGN KEY (`pais_id_pais`)
    REFERENCES `pais`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cliente`.`status_civil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cliente`.`status_civil` (
  `id_status_civil` INT NOT NULL AUTO_INCREMENT,
  `nome_status_civil` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_status_civil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cliente`.`pessoa_fisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cliente`.`pessoa_fisica` (
  `id_pessoa_fisica` INT NOT NULL AUTO_INCREMENT,
  `nacionalidade_id_nacionalidade` INT NOT NULL,
  `cliente_id_cliente` INT NOT NULL,
  `status_civil_id_status_civil` INT NOT NULL,
  `rg` VARCHAR(9) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(70) NOT NULL,
  `sobrenome` VARCHAR(70) NOT NULL,
  `nome_mae` VARCHAR(100) NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `nome_pai` VARCHAR(100) NULL,
  `data_nascimento` DATE NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pessoa_fisica`),
  INDEX `fk_PessoaFisica_Nacionalidade1_idx` (`nacionalidade_id_nacionalidade` ASC),
  INDEX `fk_pessoa_fisica_cliente1_idx` (`cliente_id_cliente` ASC),
  INDEX `fk_pessoa_fisica_status_civil1_idx` (`status_civil_id_status_civil` ASC),
  CONSTRAINT `fk_PessoaFisica_Nacionalidade1`
    FOREIGN KEY (`nacionalidade_id_nacionalidade`)
    REFERENCES `pais`.`nacionalidade` (`id_nacionalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_fisica_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `cliente`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_fisica_status_civil1`
    FOREIGN KEY (`status_civil_id_status_civil`)
    REFERENCES `cliente`.`status_civil` (`id_status_civil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elemento_financeiro`.`sistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elemento_financeiro`.`sistema` (
  `id_sistema` INT NOT NULL AUTO_INCREMENT,
  `nome_sistema` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sistema`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cliente`.`cliente_sistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cliente`.`cliente_sistema` (
  `id_cliente_sistema` INT NOT NULL AUTO_INCREMENT,
  `cliente_id_cliente` INT NOT NULL,
  `sistema_id_sistema` INT NOT NULL,
  `codigo_cliente_no_sistema` VARCHAR(70) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente_sistema`),
  INDEX `fk_cliente_sistema_cliente1_idx` (`cliente_id_cliente` ASC),
  INDEX `fk_cliente_sistema_sistema1_idx` (`sistema_id_sistema` ASC),
  CONSTRAINT `fk_cliente_sistema_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `cliente`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_sistema_sistema1`
    FOREIGN KEY (`sistema_id_sistema`)
    REFERENCES `elemento_financeiro`.`sistema` (`id_sistema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `movimentacao` ;

-- -----------------------------------------------------
-- Table `portfolio`.`banco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`banco` (
  `id_banco` INT NOT NULL AUTO_INCREMENT,
  `nome_banco` VARCHAR(45) NOT NULL,
  `numero_banco` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_banco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elemento_financeiro`.`moeda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elemento_financeiro`.`moeda` (
  `id_moeda` INT NOT NULL AUTO_INCREMENT,
  `pais_id_pais` INT NOT NULL,
  `nome_moeda` VARCHAR(45) NOT NULL,
  `data_atuliazacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_moeda`),
  INDEX `fk_Moeda_Pais1_idx` (`pais_id_pais` ASC),
  CONSTRAINT `fk_Moeda_Pais1`
    FOREIGN KEY (`pais_id_pais`)
    REFERENCES `pais`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`perfil_risco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`perfil_risco` (
  `id_perfil_risco` INT NOT NULL AUTO_INCREMENT,
  `perfil_risco` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perfil_risco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`id_tipo_portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`id_tipo_portfolio` (
  `id_tipo_portfolio` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_portfolio` VARCHAR(90) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_portfolio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`sub_tipo_portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`sub_tipo_portfolio` (
  `id_sub_tipo_portfolio` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_portfolio_id_tipo_portfolio` INT NOT NULL,
  `nome_sub_tipo_portfolio` VARCHAR(90) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sub_tipo_portfolio`),
  INDEX `fk_sub_tipo_portfolio_id_tipo_portfolio1_idx` (`id_tipo_portfolio_id_tipo_portfolio` ASC),
  CONSTRAINT `fk_sub_tipo_portfolio_id_tipo_portfolio1`
    FOREIGN KEY (`id_tipo_portfolio_id_tipo_portfolio`)
    REFERENCES `portfolio`.`id_tipo_portfolio` (`id_tipo_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elemento_financeiro`.`indice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elemento_financeiro`.`indice` (
  `id_indice` INT NOT NULL AUTO_INCREMENT,
  `nome_indice` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_indice`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elemento_financeiro`.`tipo_elemento_financeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elemento_financeiro`.`tipo_elemento_financeiro` (
  `id_tipo_elemento_financeiro` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_elemento_financeiro` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_elemento_financeiro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elemento_financeiro`.`sub_tipo_elemento_financeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elemento_financeiro`.`sub_tipo_elemento_financeiro` (
  `id_sub_tipo_ativo` INT NOT NULL AUTO_INCREMENT,
  `tipo_ativo_id_tipo_ativo` INT NOT NULL,
  `id_tipo_ativo` INT NOT NULL,
  `nome_subtipo_ativo` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sub_tipo_ativo`),
  INDEX `fk_sub_tipo_ativo_tipo_ativo1_idx` (`tipo_ativo_id_tipo_ativo` ASC),
  CONSTRAINT `fk_sub_tipo_ativo_tipo_ativo1`
    FOREIGN KEY (`tipo_ativo_id_tipo_ativo`)
    REFERENCES `elemento_financeiro`.`tipo_elemento_financeiro` (`id_tipo_elemento_financeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elemento_financeiro`.`elemento_financeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elemento_financeiro`.`elemento_financeiro` (
  `id_elemento_financeiro` INT NOT NULL AUTO_INCREMENT,
  `sub_tipo_elemento_financeiro_id_sub_tipo_ativo` INT NOT NULL,
  `pais_id_pais` INT NOT NULL,
  `moeda_id_moeda` INT NOT NULL,
  `nome_elemento_financeiro` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(11) NULL,
  `isin` VARCHAR(45) NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_elemento_financeiro`),
  INDEX `fk_Ativo_Moeda1_idx` (`moeda_id_moeda` ASC),
  INDEX `fk_ativo_pais1_idx` (`pais_id_pais` ASC),
  INDEX `fk_elemento_financeiro_sub_tipo_elemento_financeiro1_idx` (`sub_tipo_elemento_financeiro_id_sub_tipo_ativo` ASC),
  CONSTRAINT `fk_Ativo_Moeda1`
    FOREIGN KEY (`moeda_id_moeda`)
    REFERENCES `elemento_financeiro`.`moeda` (`id_moeda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ativo_pais1`
    FOREIGN KEY (`pais_id_pais`)
    REFERENCES `pais`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_elemento_financeiro_sub_tipo_elemento_financeiro1`
    FOREIGN KEY (`sub_tipo_elemento_financeiro_id_sub_tipo_ativo`)
    REFERENCES `elemento_financeiro`.`sub_tipo_elemento_financeiro` (`id_sub_tipo_ativo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elemento_financeiro`.`benchmark`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elemento_financeiro`.`benchmark` (
  `id_benchmark` INT NOT NULL AUTO_INCREMENT,
  `nome_benchmark` VARCHAR(45) NOT NULL,
  `elemento_financeiro_id_elemento_financeiro` INT NULL,
  `indice_id_indice` INT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_benchmark`),
  INDEX `fk_benchmark_indice1_idx` (`indice_id_indice` ASC),
  INDEX `fk_benchmark_elemento_financeiro1_idx` (`elemento_financeiro_id_elemento_financeiro` ASC),
  CONSTRAINT `fk_benchmark_indice1`
    FOREIGN KEY (`indice_id_indice`)
    REFERENCES `elemento_financeiro`.`indice` (`id_indice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_benchmark_elemento_financeiro1`
    FOREIGN KEY (`elemento_financeiro_id_elemento_financeiro`)
    REFERENCES `elemento_financeiro`.`elemento_financeiro` (`id_elemento_financeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`tipo_interno_portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`tipo_interno_portfolio` (
  `id_tipo_interno_portfolio` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_interno_portfolio` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_interno_portfolio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`portfolio` (
  `id_portfolio` INT NOT NULL AUTO_INCREMENT,
  `perfil_risco_id_perfil_risco` INT NOT NULL,
  `cliente_id_cliente` INT NOT NULL,
  `sub_tipo_portfolio_id_sub_tipo_portfolio` INT NOT NULL,
  `benchmark_id_benchmark` INT NOT NULL,
  `moeda_id_moeda` INT NOT NULL,
  `tipo_interno_portfolio_id_tipo_interno_portfolio` INT NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_portfolio`),
  INDEX `fk_Portfolio_PerfilRisco_idx` (`perfil_risco_id_perfil_risco` ASC),
  INDEX `fk_Portfolio_Cliente1_idx` (`cliente_id_cliente` ASC),
  INDEX `fk_Portfolio_SubTipoPortfolio1_idx` (`sub_tipo_portfolio_id_sub_tipo_portfolio` ASC),
  INDEX `fk_portfolio_benchmark1_idx` (`benchmark_id_benchmark` ASC),
  INDEX `fk_portfolio_moeda1_idx` (`moeda_id_moeda` ASC),
  INDEX `fk_portfolio_tipo_interno_portfolio1_idx` (`tipo_interno_portfolio_id_tipo_interno_portfolio` ASC),
  CONSTRAINT `fk_Portfolio_PerfilRisco`
    FOREIGN KEY (`perfil_risco_id_perfil_risco`)
    REFERENCES `portfolio`.`perfil_risco` (`id_perfil_risco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Portfolio_Cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `cliente`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Portfolio_SubTipoPortfolio1`
    FOREIGN KEY (`sub_tipo_portfolio_id_sub_tipo_portfolio`)
    REFERENCES `portfolio`.`sub_tipo_portfolio` (`id_sub_tipo_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_portfolio_benchmark1`
    FOREIGN KEY (`benchmark_id_benchmark`)
    REFERENCES `elemento_financeiro`.`benchmark` (`id_benchmark`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_portfolio_moeda1`
    FOREIGN KEY (`moeda_id_moeda`)
    REFERENCES `elemento_financeiro`.`moeda` (`id_moeda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_portfolio_tipo_interno_portfolio1`
    FOREIGN KEY (`tipo_interno_portfolio_id_tipo_interno_portfolio`)
    REFERENCES `portfolio`.`tipo_interno_portfolio` (`id_tipo_interno_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`conta_portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`conta_portfolio` (
  `id_conta_portfolio` INT NOT NULL AUTO_INCREMENT,
  `banco_id_banco` INT NOT NULL,
  `moeda_id_moeda` INT NOT NULL,
  `pais_id_pais` INT NOT NULL,
  `portfolio_id_portfolio` INT NOT NULL,
  `agencia` VARCHAR(45) NOT NULL,
  `conta` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_conta_portfolio`),
  INDEX `fk_conta_portfolio_banco1_idx` (`banco_id_banco` ASC),
  INDEX `fk_conta_portfolio_moeda1_idx` (`moeda_id_moeda` ASC),
  INDEX `fk_conta_portfolio_pais1_idx` (`pais_id_pais` ASC),
  INDEX `fk_conta_portfolio_portfolio1_idx` (`portfolio_id_portfolio` ASC),
  CONSTRAINT `fk_conta_portfolio_banco1`
    FOREIGN KEY (`banco_id_banco`)
    REFERENCES `portfolio`.`banco` (`id_banco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_portfolio_moeda1`
    FOREIGN KEY (`moeda_id_moeda`)
    REFERENCES `elemento_financeiro`.`moeda` (`id_moeda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_portfolio_pais1`
    FOREIGN KEY (`pais_id_pais`)
    REFERENCES `pais`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_portfolio_portfolio1`
    FOREIGN KEY (`portfolio_id_portfolio`)
    REFERENCES `portfolio`.`portfolio` (`id_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movimentacao`.`tipo_movimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacao`.`tipo_movimentacao` (
  `id_tipo_movimentacao` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_movimentacao` VARCHAR(80) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_movimentacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movimentacao`.`subtipo_movimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacao`.`subtipo_movimentacao` (
  `id_subtipo_movimentacao` INT NOT NULL AUTO_INCREMENT,
  `tipo_movimentacao_id_tipo_movimentacao` INT NOT NULL,
  `impacto_subtipo_movimentacao_na_cota` INT NOT NULL,
  `nome_subtipo_atualizacao` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_subtipo_movimentacao`),
  INDEX `fk_subtipo_movimentacao_tipo_movimentacao1_idx` (`tipo_movimentacao_id_tipo_movimentacao` ASC),
  CONSTRAINT `fk_subtipo_movimentacao_tipo_movimentacao1`
    FOREIGN KEY (`tipo_movimentacao_id_tipo_movimentacao`)
    REFERENCES `movimentacao`.`tipo_movimentacao` (`id_tipo_movimentacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movimentacao`.`nome_movimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacao`.`nome_movimentacao` (
  `id_nome_movimentacao` INT NOT NULL AUTO_INCREMENT,
  `nome_movimentacao` VARCHAR(80) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_nome_movimentacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movimentacao`.`movimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacao`.`movimentacao` (
  `id_movimentacao` INT NOT NULL AUTO_INCREMENT,
  `conta_portfolio_id_conta_portfolio` INT NOT NULL,
  `subtipo_movimentacao_id_subtipo_movimentacao` INT NOT NULL,
  `nome_movimentacao_id_nome_movimentacao` INT NOT NULL,
  `data_movimentacao` DATETIME NOT NULL,
  `valor_movimentacao` FLOAT NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_movimentacao`),
  INDEX `fk_movimentacao_conta_portfolio1_idx` (`conta_portfolio_id_conta_portfolio` ASC),
  INDEX `fk_movimentacao_subtipo_movimentacao1_idx` (`subtipo_movimentacao_id_subtipo_movimentacao` ASC),
  INDEX `fk_movimentacao_nome_movimentacao1_idx` (`nome_movimentacao_id_nome_movimentacao` ASC),
  CONSTRAINT `fk_movimentacao_conta_portfolio1`
    FOREIGN KEY (`conta_portfolio_id_conta_portfolio`)
    REFERENCES `portfolio`.`conta_portfolio` (`id_conta_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimentacao_subtipo_movimentacao1`
    FOREIGN KEY (`subtipo_movimentacao_id_subtipo_movimentacao`)
    REFERENCES `movimentacao`.`subtipo_movimentacao` (`id_subtipo_movimentacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimentacao_nome_movimentacao1`
    FOREIGN KEY (`nome_movimentacao_id_nome_movimentacao`)
    REFERENCES `movimentacao`.`nome_movimentacao` (`id_nome_movimentacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movimentacao`.`alias_nome_movimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacao`.`alias_nome_movimentacao` (
  `id_alias_nome_movimentacao` INT NOT NULL AUTO_INCREMENT,
  `nome_movimentacao_id_nome_movimentacao` INT NOT NULL,
  `nome_movimentacao_banco` VARCHAR(80) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_alias_nome_movimentacao`),
  INDEX `fk_alias_nome_movimentacao_nome_movimentacao1_idx` (`nome_movimentacao_id_nome_movimentacao` ASC),
  CONSTRAINT `fk_alias_nome_movimentacao_nome_movimentacao1`
    FOREIGN KEY (`nome_movimentacao_id_nome_movimentacao`)
    REFERENCES `movimentacao`.`nome_movimentacao` (`id_nome_movimentacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movimentacao`.`alias_nome_tipo_movimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacao`.`alias_nome_tipo_movimentacao` (
  `id_alias_nome_tipo_movimentacao` INT NOT NULL AUTO_INCREMENT,
  `data_movimentacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `alias_nome_tipo_movimentacao` VARCHAR(45) NOT NULL,
  `alias_nome_tipo_movimentacaocol1` VARCHAR(45) NULL,
  PRIMARY KEY (`id_alias_nome_tipo_movimentacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movimentacao`.`alias_tipo_movimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacao`.`alias_tipo_movimentacao` (
  `id_alias_tipo_movimentacao` INT NOT NULL AUTO_INCREMENT,
  `tipo_movimentacao_id_tipo_movimentacao` INT NOT NULL,
  `nome_alias_tipo_movimentacao` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_alias_tipo_movimentacao`),
  INDEX `fk_alias_tipo_movimentacao_tipo_movimentacao1_idx` (`tipo_movimentacao_id_tipo_movimentacao` ASC),
  CONSTRAINT `fk_alias_tipo_movimentacao_tipo_movimentacao1`
    FOREIGN KEY (`tipo_movimentacao_id_tipo_movimentacao`)
    REFERENCES `movimentacao`.`tipo_movimentacao` (`id_tipo_movimentacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movimentacao`.`alias_subtipo_movimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacao`.`alias_subtipo_movimentacao` (
  `id_alias_subtipo_movimentacao` INT NOT NULL AUTO_INCREMENT,
  `subtipo_movimentacao_id_subtipo_movimentacao` INT NOT NULL,
  `nome_alias_subtipo_movimentacao` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_alias_subtipo_movimentacao`),
  INDEX `fk_alias_subtipo_movimentacao_subtipo_movimentacao1_idx` (`subtipo_movimentacao_id_subtipo_movimentacao` ASC),
  CONSTRAINT `fk_alias_subtipo_movimentacao_subtipo_movimentacao1`
    FOREIGN KEY (`subtipo_movimentacao_id_subtipo_movimentacao`)
    REFERENCES `movimentacao`.`subtipo_movimentacao` (`id_subtipo_movimentacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `saldo` ;

-- -----------------------------------------------------
-- Table `saldo`.`saldo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saldo`.`saldo` (
  `id_saldo` INT NOT NULL,
  `conta_portfolio_id_conta_portfolio` INT NOT NULL,
  `data_saldo` DATE NOT NULL,
  `valor` FLOAT NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_saldo`),
  INDEX `fk_saldo_conta_portfolio_idx` (`conta_portfolio_id_conta_portfolio` ASC),
  CONSTRAINT `fk_saldo_conta_portfolio`
    FOREIGN KEY (`conta_portfolio_id_conta_portfolio`)
    REFERENCES `portfolio`.`conta_portfolio` (`id_conta_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `portfolio` ;

-- -----------------------------------------------------
-- Table `portfolio`.`pl_posicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`pl_posicao` (
  `id_pl_posicao` INT NOT NULL,
  `portfolio_id_portfolio` INT NOT NULL,
  `valor_pl` FLOAT NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pl_posicao`),
  INDEX `fk_pl_posicao_portfolio1_idx` (`portfolio_id_portfolio` ASC),
  CONSTRAINT `fk_pl_posicao_portfolio1`
    FOREIGN KEY (`portfolio_id_portfolio`)
    REFERENCES `portfolio`.`portfolio` (`id_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`portfolio_sistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`portfolio_sistema` (
  `id_portfolio_sistema` INT NOT NULL AUTO_INCREMENT,
  `sistema_id_sistema` INT NOT NULL,
  `portfolio_id_portfolio` INT NOT NULL,
  `codigo_portfolio_no_sistema` VARCHAR(45) NOT NULL,
  `data_atualizacao` VARCHAR(45) NOT NULL DEFAULT 'CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
  PRIMARY KEY (`id_portfolio_sistema`),
  INDEX `fk_portfolio_sistema_sistema1_idx` (`sistema_id_sistema` ASC),
  INDEX `fk_portfolio_sistema_portfolio1_idx` (`portfolio_id_portfolio` ASC),
  CONSTRAINT `fk_portfolio_sistema_sistema1`
    FOREIGN KEY (`sistema_id_sistema`)
    REFERENCES `elemento_financeiro`.`sistema` (`id_sistema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_portfolio_sistema_portfolio1`
    FOREIGN KEY (`portfolio_id_portfolio`)
    REFERENCES `portfolio`.`portfolio` (`id_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `posicao` ;

-- -----------------------------------------------------
-- Table `posicao`.`tipo_posicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `posicao`.`tipo_posicao` (
  `id_tipo_posicao` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_posicao` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_posicao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `posicao`.`posicao_consolidada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `posicao`.`posicao_consolidada` (
  `id_posicao_consolidada` INT NOT NULL AUTO_INCREMENT,
  `portfolio_id_portfolio` INT NOT NULL,
  `elemento_financeiro_id_elemento_financeiro` INT NOT NULL,
  `data_posicao` DATETIME NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `posicao_consolidadacol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_posicao_consolidada`),
  INDEX `fk_posicao_consolidada_portfolio1_idx` (`portfolio_id_portfolio` ASC),
  INDEX `fk_posicao_consolidada_elemento_financeiro1_idx` (`elemento_financeiro_id_elemento_financeiro` ASC),
  CONSTRAINT `fk_posicao_consolidada_portfolio1`
    FOREIGN KEY (`portfolio_id_portfolio`)
    REFERENCES `portfolio`.`portfolio` (`id_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicao_consolidada_elemento_financeiro1`
    FOREIGN KEY (`elemento_financeiro_id_elemento_financeiro`)
    REFERENCES `elemento_financeiro`.`elemento_financeiro` (`id_elemento_financeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `posicao`.`subtipo_posicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `posicao`.`subtipo_posicao` (
  `id_subtipo_posicao` INT NOT NULL AUTO_INCREMENT,
  `posicao_consolidada_id_posicao_consolidada` INT NOT NULL,
  `tipo_posicao_id_tipo_posicao` INT NOT NULL,
  `nome_subtipo_posicao` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_subtipo_posicao`),
  INDEX `fk_subtipo_posicao_tipo_posicao1_idx` (`tipo_posicao_id_tipo_posicao` ASC),
  INDEX `fk_subtipo_posicao_posicao_consolidada1_idx` (`posicao_consolidada_id_posicao_consolidada` ASC),
  CONSTRAINT `fk_subtipo_posicao_tipo_posicao1`
    FOREIGN KEY (`tipo_posicao_id_tipo_posicao`)
    REFERENCES `posicao`.`tipo_posicao` (`id_tipo_posicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subtipo_posicao_posicao_consolidada1`
    FOREIGN KEY (`posicao_consolidada_id_posicao_consolidada`)
    REFERENCES `posicao`.`posicao_consolidada` (`id_posicao_consolidada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `posicao`.`posicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `posicao`.`posicao` (
  `id_posicao` INT NOT NULL AUTO_INCREMENT,
  `portfolio_id_portfolio` INT NOT NULL,
  `subtipo_posicao_id_subtipo_posicao` INT NOT NULL,
  `conta_portfolio_id_conta_portfolio` INT NOT NULL,
  `elemento_financeiro_id_elemento_financeiro` INT NOT NULL,
  `data_posicao` DATETIME NOT NULL,
  `preco_unitario` FLOAT NOT NULL,
  `quantidade` FLOAT NOT NULL,
  `valor_total` FLOAT NOT NULL,
  `porcentagem_do_pl` FLOAT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_posicao`),
  INDEX `fk_posicao_portfolio1_idx` (`portfolio_id_portfolio` ASC),
  INDEX `fk_posicao_subtipo_posicao1_idx` (`subtipo_posicao_id_subtipo_posicao` ASC),
  INDEX `fk_posicao_conta_portfolio1_idx` (`conta_portfolio_id_conta_portfolio` ASC),
  INDEX `fk_posicao_elemento_financeiro1_idx` (`elemento_financeiro_id_elemento_financeiro` ASC),
  CONSTRAINT `fk_posicao_portfolio1`
    FOREIGN KEY (`portfolio_id_portfolio`)
    REFERENCES `portfolio`.`portfolio` (`id_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicao_subtipo_posicao1`
    FOREIGN KEY (`subtipo_posicao_id_subtipo_posicao`)
    REFERENCES `posicao`.`subtipo_posicao` (`id_subtipo_posicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicao_conta_portfolio1`
    FOREIGN KEY (`conta_portfolio_id_conta_portfolio`)
    REFERENCES `portfolio`.`conta_portfolio` (`id_conta_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicao_elemento_financeiro1`
    FOREIGN KEY (`elemento_financeiro_id_elemento_financeiro`)
    REFERENCES `elemento_financeiro`.`elemento_financeiro` (`id_elemento_financeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `bots` ;

-- -----------------------------------------------------
-- Table `bots`.`bot_frequencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bots`.`bot_frequencia` (
  `id_bot_frequencia` INT NOT NULL AUTO_INCREMENT,
  `minuto` VARCHAR(2) NOT NULL,
  `hora` VARCHAR(2) NOT NULL,
  `dia_do_mes` VARCHAR(3) NOT NULL,
  `mes` VARCHAR(3) NOT NULL,
  `dia_da_semana` VARCHAR(3) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_bot_frequencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bots`.`bot_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bots`.`bot_type` (
  `id_bot_type` INT NOT NULL AUTO_INCREMENT,
  `bot_type_name` VARCHAR(60) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_bot_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bots`.`grupo_senha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bots`.`grupo_senha` (
  `id_grupo_senha` INT NOT NULL AUTO_INCREMENT,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Credencial_idCredencial` INT NOT NULL,
  PRIMARY KEY (`id_grupo_senha`),
  INDEX `fk_GrupoSenha_Credencial1_idx` (`Credencial_idCredencial` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bots`.`script`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bots`.`script` (
  `id_script` INT NOT NULL AUTO_INCREMENT,
  `script` MEDIUMBLOB NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_script`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bots`.`bot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bots`.`bot` (
  `id_bot` INT NOT NULL AUTO_INCREMENT,
  `Id_unzip_pass` INT NOT NULL,
  `filepath_to_run` VARCHAR(300) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bot_frequencia_id_bot_frequencia` INT NOT NULL,
  `bot_type_id_bot_type` INT NOT NULL,
  `grupo_senha_id_grupo_senha` INT NULL,
  `script_id_script` INT NOT NULL,
  PRIMARY KEY (`id_bot`),
  INDEX `fk_Bot_BotFrequencia_idx` (`bot_frequencia_id_bot_frequencia` ASC),
  INDEX `fk_Bot_BotType1_idx` (`bot_type_id_bot_type` ASC),
  INDEX `fk_Bot_GrupoSenha1_idx` (`grupo_senha_id_grupo_senha` ASC),
  INDEX `fk_Bot_Script1_idx` (`script_id_script` ASC),
  CONSTRAINT `fk_Bot_BotFrequencia`
    FOREIGN KEY (`bot_frequencia_id_bot_frequencia`)
    REFERENCES `bots`.`bot_frequencia` (`id_bot_frequencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bot_BotType1`
    FOREIGN KEY (`bot_type_id_bot_type`)
    REFERENCES `bots`.`bot_type` (`id_bot_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bot_GrupoSenha1`
    FOREIGN KEY (`grupo_senha_id_grupo_senha`)
    REFERENCES `bots`.`grupo_senha` (`id_grupo_senha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bot_Script1`
    FOREIGN KEY (`script_id_script`)
    REFERENCES `bots`.`script` (`id_script`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bots`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bots`.`login` (
  `id_login_banco` INT NOT NULL AUTO_INCREMENT,
  `id_conta_portfolio` INT NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_login_banco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bots`.`credencial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bots`.`credencial` (
  `idCredencial` INT NOT NULL AUTO_INCREMENT,
  `nomeCredencialcol` VARCHAR(45) NULL,
  PRIMARY KEY (`idCredencial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bots`.`alias_nome_pesssoa_fisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bots`.`alias_nome_pesssoa_fisica` (
  `id_alias_nome_pesssoa_fisica` INT NOT NULL AUTO_INCREMENT,
  `pessoa_fisica_id_pessoa_fisica` INT NOT NULL,
  `nome_alias_nome_pesssoa_fisica` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_alias_nome_pesssoa_fisica`),
  INDEX `fk_alias_nome_pesssoa_fisica_pessoa_fisica1_idx` (`pessoa_fisica_id_pessoa_fisica` ASC),
  CONSTRAINT `fk_alias_nome_pesssoa_fisica_pessoa_fisica1`
    FOREIGN KEY (`pessoa_fisica_id_pessoa_fisica`)
    REFERENCES `cliente`.`pessoa_fisica` (`id_pessoa_fisica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bots`.`alias_nome_pessoa_juridica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bots`.`alias_nome_pessoa_juridica` (
  `id_alias_nome_pessoa_juridica` INT NOT NULL AUTO_INCREMENT,
  `pessoa_juridica_id_pessoa_juridica` INT NOT NULL,
  `nome_alias_nome_pessoa_juridica` VARCHAR(45) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_alias_nome_pessoa_juridica`),
  INDEX `fk_alias_nome_pessoa_juridica_pessoa_juridica1_idx` (`pessoa_juridica_id_pessoa_juridica` ASC),
  CONSTRAINT `fk_alias_nome_pessoa_juridica_pessoa_juridica1`
    FOREIGN KEY (`pessoa_juridica_id_pessoa_juridica`)
    REFERENCES `cliente`.`pessoa_juridica` (`id_pessoa_juridica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `elemento_financeiro` ;

-- -----------------------------------------------------
-- Table `elemento_financeiro`.`alias_nome_elemento_financeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elemento_financeiro`.`alias_nome_elemento_financeiro` (
  `id_alias_nome_elemento_financeiro` INT NOT NULL AUTO_INCREMENT,
  `elemento_financeiro_id_elemento_financeiro` INT NOT NULL,
  `alias_elemento_financeiro_sistema` VARCHAR(60) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_alias_nome_elemento_financeiro`),
  INDEX `fk_alias_nome_elemento_financeiro_elemento_financeiro1_idx` (`elemento_financeiro_id_elemento_financeiro` ASC),
  CONSTRAINT `fk_alias_nome_elemento_financeiro_elemento_financeiro1`
    FOREIGN KEY (`elemento_financeiro_id_elemento_financeiro`)
    REFERENCES `elemento_financeiro`.`elemento_financeiro` (`id_elemento_financeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elemento_financeiro`.`alias_tipo_elemento_financeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elemento_financeiro`.`alias_tipo_elemento_financeiro` (
  `id_alias_tipo_elemento_financeiro` INT NOT NULL AUTO_INCREMENT,
  `tipo_ativo_id_tipo_ativo` INT NOT NULL,
  `id_sistema` INT NOT NULL,
  `alias_tipo_ativo_sistema` VARCHAR(60) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_alias_tipo_elemento_financeiro`),
  INDEX `fk_alias_tipo_ativo_tipo_ativo1_idx` (`tipo_ativo_id_tipo_ativo` ASC),
  CONSTRAINT `fk_alias_tipo_ativo_tipo_ativo1`
    FOREIGN KEY (`tipo_ativo_id_tipo_ativo`)
    REFERENCES `elemento_financeiro`.`tipo_elemento_financeiro` (`id_tipo_elemento_financeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elemento_financeiro`.`alias_sub_tipo_elemento_financeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elemento_financeiro`.`alias_sub_tipo_elemento_financeiro` (
  `id_alias_sub_tipo_elemento_financeiro` INT NOT NULL AUTO_INCREMENT,
  `sub_tipo_ativo_id_sub_tipo_ativo` INT NOT NULL,
  `alias_sub_elemento_financeiro_sistema` VARCHAR(60) NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_alias_sub_tipo_elemento_financeiro`),
  INDEX `fk_alias_sub_tipo_ativo_sub_tipo_ativo1_idx` (`sub_tipo_ativo_id_sub_tipo_ativo` ASC),
  CONSTRAINT `fk_alias_sub_tipo_ativo_sub_tipo_ativo1`
    FOREIGN KEY (`sub_tipo_ativo_id_sub_tipo_ativo`)
    REFERENCES `elemento_financeiro`.`sub_tipo_elemento_financeiro` (`id_sub_tipo_ativo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `operacoes` ;

-- -----------------------------------------------------
-- Table `operacoes`.`tipo_operacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `operacoes`.`tipo_operacao` (
  `id_tipo_operacao` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_operacao` VARCHAR(45) NOT NULL,
  `impacta_cota` TINYINT NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_operacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operacoes`.`operacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `operacoes`.`operacao` (
  `id_operacao` INT NOT NULL AUTO_INCREMENT,
  `portfolio_id_portfolio` INT NOT NULL,
  `conta_portfolio_id_conta_portfolio` INT NOT NULL,
  `tipo_operacao_id_tipo_operacao` INT NOT NULL,
  `elemento_financeiro_id_elemento_financeiro` INT NOT NULL,
  `quantidade` FLOAT NOT NULL,
  `preco_unitario` FLOAT NOT NULL,
  `valor_corretagem` FLOAT NOT NULL,
  `valor_iof` FLOAT NOT NULL,
  `valor_ir` FLOAT NOT NULL,
  `valor_total` FLOAT NOT NULL,
  `taxa_operacao` FLOAT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_operacao`),
  INDEX `fk_operacao_portfolio1_idx` (`portfolio_id_portfolio` ASC),
  INDEX `fk_operacao_conta_portfolio1_idx` (`conta_portfolio_id_conta_portfolio` ASC),
  INDEX `fk_operacao_tipo_operacao1_idx` (`tipo_operacao_id_tipo_operacao` ASC),
  INDEX `fk_operacao_elemento_financeiro1_idx` (`elemento_financeiro_id_elemento_financeiro` ASC),
  CONSTRAINT `fk_operacao_portfolio1`
    FOREIGN KEY (`portfolio_id_portfolio`)
    REFERENCES `portfolio`.`portfolio` (`id_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operacao_conta_portfolio1`
    FOREIGN KEY (`conta_portfolio_id_conta_portfolio`)
    REFERENCES `portfolio`.`conta_portfolio` (`id_conta_portfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operacao_tipo_operacao1`
    FOREIGN KEY (`tipo_operacao_id_tipo_operacao`)
    REFERENCES `operacoes`.`tipo_operacao` (`id_tipo_operacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operacao_elemento_financeiro1`
    FOREIGN KEY (`elemento_financeiro_id_elemento_financeiro`)
    REFERENCES `elemento_financeiro`.`elemento_financeiro` (`id_elemento_financeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `pais` ;
USE `renda_fixa` ;

-- -----------------------------------------------------
-- Table `renda_fixa`.`renda_fixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `renda_fixa`.`renda_fixa` (
  `id_renda_fixa` INT NOT NULL,
  `elemento_financeiro_id_elemento_financeiro` INT NOT NULL,
  `data_emissao` DATETIME NOT NULL,
  `data_vencimento` DATETIME NOT NULL,
  `taxa` FLOAT NOT NULL,
  `indice_id_indice` INT NOT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_renda_fixa`),
  INDEX `fk_renda_fixa_indice_idx` (`indice_id_indice` ASC),
  INDEX `fk_renda_fixa_elemento_financeiro1_idx` (`elemento_financeiro_id_elemento_financeiro` ASC),
  CONSTRAINT `fk_renda_fixa_indice`
    FOREIGN KEY (`indice_id_indice`)
    REFERENCES `elemento_financeiro`.`indice` (`id_indice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_renda_fixa_elemento_financeiro1`
    FOREIGN KEY (`elemento_financeiro_id_elemento_financeiro`)
    REFERENCES `elemento_financeiro`.`elemento_financeiro` (`id_elemento_financeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `renda_variavel` ;

-- -----------------------------------------------------
-- Table `renda_variavel`.`renda_variavel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `renda_variavel`.`renda_variavel` (
  `id_renda_variavel` INT NOT NULL AUTO_INCREMENT,
  `elemento_financeiro_id_elemento_financeiro` INT NOT NULL,
  `data_vencimento` DATETIME NOT NULL,
  `renda_variavel_id_renda_variavel` INT NULL,
  `strike_price` FLOAT NULL,
  `data_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_renda_variavel`),
  INDEX `fk_renda_variavel_elemento_financeiro_idx` (`elemento_financeiro_id_elemento_financeiro` ASC),
  INDEX `fk_renda_variavel_renda_variavel1_idx` (`renda_variavel_id_renda_variavel` ASC),
  CONSTRAINT `fk_renda_variavel_elemento_financeiro`
    FOREIGN KEY (`elemento_financeiro_id_elemento_financeiro`)
    REFERENCES `elemento_financeiro`.`elemento_financeiro` (`id_elemento_financeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_renda_variavel_renda_variavel1`
    FOREIGN KEY (`renda_variavel_id_renda_variavel`)
    REFERENCES `renda_variavel`.`renda_variavel` (`id_renda_variavel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
