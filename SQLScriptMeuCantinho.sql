-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lar
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lar` ;

-- -----------------------------------------------------
-- Schema lar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lar` DEFAULT CHARACTER SET utf8 ;
USE `lar` ;

-- -----------------------------------------------------
-- Table `lar`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nomeCliente` VARCHAR(255) NULL,
  `telefoneCliente` VARCHAR(255) NULL,
  `sexoCliente` VARCHAR(255) NULL,
  `dataNascimento` DATE NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`ContratoVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`ContratoVenda` (
  `idContratoVenda` INT NOT NULL,
  `valorContratoVenda` FLOAT NULL,
  `dataContratoVenda` DATETIME NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idContratoVenda`),
  INDEX `fk_ContratoVenda_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_ContratoVenda_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `lar`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`ContratoAluguel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`ContratoAluguel` (
  `idContratoAluguel` INT NOT NULL,
  `valorContratoAluguel` FLOAT NULL,
  `dataContratoAluguel` DATETIME NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idContratoAluguel`),
  INDEX `fk_ContratoAluguel_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_ContratoAluguel_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `lar`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`Proprietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Proprietario` (
  `idProprietario` INT NOT NULL,
  `nomePropri` VARCHAR(255) NULL,
  PRIMARY KEY (`idProprietario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`Regiao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Regiao` (
  `idRegiao` INT NOT NULL,
  `estado` VARCHAR(255) NULL,
  `CEP` VARCHAR(255) NULL,
  `nomeRegiao` VARCHAR(255) NULL,
  PRIMARY KEY (`idRegiao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`ImovelAluguelTotal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`ImovelAluguelTotal` (
  `idImoveis` INT NOT NULL,
  `ContratoAluguel_idContratoAluguel` INT NOT NULL,
  `Proprietario_idProprietario` INT NOT NULL,
  `Regiao_idRegiao` INT NOT NULL,
  PRIMARY KEY (`idImoveis`, `ContratoAluguel_idContratoAluguel`, `Regiao_idRegiao`),
  INDEX `fk_ImovelAluguel_ContratoAluguel1_idx` (`ContratoAluguel_idContratoAluguel` ASC) VISIBLE,
  INDEX `fk_ImovelAluguel_Proprietario1_idx` (`Proprietario_idProprietario` ASC) VISIBLE,
  INDEX `fk_ImovelAluguel_Regiao1_idx` (`Regiao_idRegiao` ASC) VISIBLE,
  CONSTRAINT `fk_ImovelAluguel_ContratoAluguel1`
    FOREIGN KEY (`ContratoAluguel_idContratoAluguel`)
    REFERENCES `lar`.`ContratoAluguel` (`idContratoAluguel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelAluguel_Proprietario1`
    FOREIGN KEY (`Proprietario_idProprietario`)
    REFERENCES `lar`.`Proprietario` (`idProprietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelAluguel_Regiao1`
    FOREIGN KEY (`Regiao_idRegiao`)
    REFERENCES `lar`.`Regiao` (`idRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`ImovelVendaTotal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`ImovelVendaTotal` (
  `idImovelVenda` INT NOT NULL,
  `Regiao_idRegiao` INT NOT NULL,
  `ContratoVenda_idContratoVenda` INT NOT NULL,
  `Proprietario_idProprietario` INT NOT NULL,
  PRIMARY KEY (`idImovelVenda`, `Regiao_idRegiao`, `ContratoVenda_idContratoVenda`),
  INDEX `fk_ImovelVenda_Regiao1_idx` (`Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_ImovelVendaTotal_ContratoVenda1_idx` (`ContratoVenda_idContratoVenda` ASC) VISIBLE,
  INDEX `fk_ImovelVendaTotal_Proprietario1_idx` (`Proprietario_idProprietario` ASC) VISIBLE,
  CONSTRAINT `fk_ImovelVenda_Regiao1`
    FOREIGN KEY (`Regiao_idRegiao`)
    REFERENCES `lar`.`Regiao` (`idRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelVendaTotal_ContratoVenda1`
    FOREIGN KEY (`ContratoVenda_idContratoVenda`)
    REFERENCES `lar`.`ContratoVenda` (`idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelVendaTotal_Proprietario1`
    FOREIGN KEY (`Proprietario_idProprietario`)
    REFERENCES `lar`.`Proprietario` (`idProprietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`PreferenciaImovel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`PreferenciaImovel` (
  `idPreferencias` INT NOT NULL,
  `animal` VARCHAR(3) NULL,
  `trem_metro` VARCHAR(3) NULL,
  `onibus` VARCHAR(3) NULL,
  `mercado` VARCHAR(3) NULL,
  `hospital` VARCHAR(3) NULL,
  `escola` VARCHAR(3) NULL,
  `gasolina` VARCHAR(3) NULL,
  `ruaAsfaltada` VARCHAR(3) NULL,
  `piscina` VARCHAR(3) NULL,
  `jardim` VARCHAR(3) NULL,
  `quintal` VARCHAR(3) NULL,
  `redeBalanco` VARCHAR(3) NULL,
  `varanda` VARCHAR(3) NULL,
  `mobiliado` VARCHAR(3) NULL,
  `salaEstarMobiliada` VARCHAR(3) NULL,
  `salaJantarMobiliada` VARCHAR(3) NULL,
  `cozinhaMobiliada` VARCHAR(3) NULL,
  `areaServicoMobiliada` VARCHAR(3) NULL,
  `varandaMobiliada` VARCHAR(3) NULL,
  `quartoMobiliado` VARCHAR(3) NULL,
  `escritorioMobiliado` VARCHAR(3) NULL,
  PRIMARY KEY (`idPreferencias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`Caracteristica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Caracteristica` (
  `idCaracteristica` INT NOT NULL,
  `banheiro` VARCHAR(45) NULL,
  `quarto` VARCHAR(45) NULL,
  `qtdAndar` VARCHAR(45) NULL,
  `metragem` VARCHAR(255) NULL,
  `portaoEletrico` VARCHAR(3) NULL,
  `sistemaAlarme` VARCHAR(3) NULL,
  `cameraSeguranca` VARCHAR(3) NULL,
  `alarmeIncendio` VARCHAR(3) NULL,
  `encanamento` VARCHAR(45) NULL,
  `corParedeInterna` VARCHAR(45) NULL,
  `corParedeExterna` VARCHAR(45) NULL,
  `tipoLampada` VARCHAR(45) NULL,
  `fioPassagem` VARCHAR(3) NULL,
  `closetEmbutido` VARCHAR(3) NULL,
  `jardimInverno` VARCHAR(3) NULL,
  PRIMARY KEY (`idCaracteristica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`Kitnet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Kitnet` (
  `idkitnet` INT NOT NULL,
  `ImovelVendaTotal_idImovelVenda` INT NOT NULL,
  `ImovelVendaTotal_Regiao_idRegiao` INT NOT NULL,
  `ImovelVendaTotal_ContratoVenda_idContratoVenda` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idkitnet`, `ImovelVendaTotal_idImovelVenda`, `ImovelVendaTotal_Regiao_idRegiao`, `ImovelVendaTotal_ContratoVenda_idContratoVenda`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_Kitnet_ImovelVendaTotal1_idx` (`ImovelVendaTotal_idImovelVenda` ASC, `ImovelVendaTotal_Regiao_idRegiao` ASC, `ImovelVendaTotal_ContratoVenda_idContratoVenda` ASC) VISIBLE,
  INDEX `fk_Kitnet_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_Kitnet_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_Kitnet_ImovelVendaTotal1`
    FOREIGN KEY (`ImovelVendaTotal_idImovelVenda` , `ImovelVendaTotal_Regiao_idRegiao` , `ImovelVendaTotal_ContratoVenda_idContratoVenda`)
    REFERENCES `lar`.`ImovelVendaTotal` (`idImovelVenda` , `Regiao_idRegiao` , `ContratoVenda_idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kitnet_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kitnet_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`Flat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Flat` (
  `idFlat` INT NOT NULL,
  `ImovelVendaTotal_idImovelVenda` INT NOT NULL,
  `ImovelVendaTotal_Regiao_idRegiao` INT NOT NULL,
  `ImovelVendaTotal_ContratoVenda_idContratoVenda` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idFlat`, `ImovelVendaTotal_idImovelVenda`, `ImovelVendaTotal_Regiao_idRegiao`, `ImovelVendaTotal_ContratoVenda_idContratoVenda`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_Flat_ImovelVendaTotal1_idx` (`ImovelVendaTotal_idImovelVenda` ASC, `ImovelVendaTotal_Regiao_idRegiao` ASC, `ImovelVendaTotal_ContratoVenda_idContratoVenda` ASC) VISIBLE,
  INDEX `fk_Flat_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_Flat_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_Flat_ImovelVendaTotal1`
    FOREIGN KEY (`ImovelVendaTotal_idImovelVenda` , `ImovelVendaTotal_Regiao_idRegiao` , `ImovelVendaTotal_ContratoVenda_idContratoVenda`)
    REFERENCES `lar`.`ImovelVendaTotal` (`idImovelVenda` , `Regiao_idRegiao` , `ContratoVenda_idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flat_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flat_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`Casa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Casa` (
  `idCasa` INT NOT NULL,
  `ImovelVendaTotal_idImovelVenda` INT NOT NULL,
  `ImovelVendaTotal_Regiao_idRegiao` INT NOT NULL,
  `ImovelVendaTotal_ContratoVenda_idContratoVenda` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idCasa`, `ImovelVendaTotal_idImovelVenda`, `ImovelVendaTotal_Regiao_idRegiao`, `ImovelVendaTotal_ContratoVenda_idContratoVenda`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_Casa_ImovelVendaTotal1_idx` (`ImovelVendaTotal_idImovelVenda` ASC, `ImovelVendaTotal_Regiao_idRegiao` ASC, `ImovelVendaTotal_ContratoVenda_idContratoVenda` ASC) VISIBLE,
  INDEX `fk_Casa_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_Casa_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_Casa_ImovelVendaTotal1`
    FOREIGN KEY (`ImovelVendaTotal_idImovelVenda` , `ImovelVendaTotal_Regiao_idRegiao` , `ImovelVendaTotal_ContratoVenda_idContratoVenda`)
    REFERENCES `lar`.`ImovelVendaTotal` (`idImovelVenda` , `Regiao_idRegiao` , `ContratoVenda_idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Casa_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Casa_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`PreferenciaCondominio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`PreferenciaCondominio` (
  `idPreferenciaCondominio` INT NOT NULL,
  `garagem` VARCHAR(3) NULL,
  `salaoFestaInfantil` VARCHAR(3) NULL,
  `salaoFestaAdulto` VARCHAR(3) NULL,
  `churrasqueira` VARCHAR(3) NULL,
  `salaoJogos` VARCHAR(3) NULL,
  `quadraEsportiva` VARCHAR(3) NULL,
  `salaCinema` VARCHAR(3) NULL,
  `mercadoInterno` VARCHAR(3) NULL,
  `espacoGourmet` VARCHAR(3) NULL,
  `espacoPet` VARCHAR(3) NULL,
  `brinquedoteca` VARCHAR(3) NULL,
  `playground` VARCHAR(3) NULL,
  `praca` VARCHAR(3) NULL,
  `redeBalancoCON` VARCHAR(3) NULL,
  `academia` VARCHAR(3) NULL,
  `spa` VARCHAR(3) NULL,
  `sauna` VARCHAR(3) NULL,
  `espacoBeleza` VARCHAR(3) NULL,
  `portaria` VARCHAR(3) NULL,
  `vigia` VARCHAR(3) NULL,
  PRIMARY KEY (`idPreferenciaCondominio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`ApartamentoAlugel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`ApartamentoAlugel` (
  `idApartamento` INT NOT NULL,
  `ImovelAluguelTotal_idImoveis` INT NOT NULL,
  `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` INT NOT NULL,
  `ImovelAluguelTotal_Regiao_idRegiao` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `PreferenciaCondominio_idPreferenciaCondominio` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idApartamento`, `ImovelAluguelTotal_idImoveis`, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel`, `ImovelAluguelTotal_Regiao_idRegiao`, `PreferenciaImovel_idPreferencias`, `PreferenciaCondominio_idPreferenciaCondominio`, `Caracteristica_idCaracteristica`),
  INDEX `fk_ApartamentoAlugel_ImovelAluguelTotal1_idx` (`ImovelAluguelTotal_idImoveis` ASC, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` ASC, `ImovelAluguelTotal_Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_ApartamentoAlugel_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_ApartamentoAlugel_PreferenciaCondominio1_idx` (`PreferenciaCondominio_idPreferenciaCondominio` ASC) VISIBLE,
  INDEX `fk_ApartamentoAlugel_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_ApartamentoAlugel_ImovelAluguelTotal1`
    FOREIGN KEY (`ImovelAluguelTotal_idImoveis` , `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` , `ImovelAluguelTotal_Regiao_idRegiao`)
    REFERENCES `lar`.`ImovelAluguelTotal` (`idImoveis` , `ContratoAluguel_idContratoAluguel` , `Regiao_idRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ApartamentoAlugel_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ApartamentoAlugel_PreferenciaCondominio1`
    FOREIGN KEY (`PreferenciaCondominio_idPreferenciaCondominio`)
    REFERENCES `lar`.`PreferenciaCondominio` (`idPreferenciaCondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ApartamentoAlugel_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`KitnetAluguel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`KitnetAluguel` (
  `idkitnet` INT NOT NULL,
  `ImovelAluguelTotal_idImoveis` INT NOT NULL,
  `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` INT NOT NULL,
  `ImovelAluguelTotal_Regiao_idRegiao` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idkitnet`, `ImovelAluguelTotal_idImoveis`, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel`, `ImovelAluguelTotal_Regiao_idRegiao`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_KitnetAluguel_ImovelAluguelTotal1_idx` (`ImovelAluguelTotal_idImoveis` ASC, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` ASC, `ImovelAluguelTotal_Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_KitnetAluguel_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_KitnetAluguel_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_KitnetAluguel_ImovelAluguelTotal1`
    FOREIGN KEY (`ImovelAluguelTotal_idImoveis` , `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` , `ImovelAluguelTotal_Regiao_idRegiao`)
    REFERENCES `lar`.`ImovelAluguelTotal` (`idImoveis` , `ContratoAluguel_idContratoAluguel` , `Regiao_idRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_KitnetAluguel_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_KitnetAluguel_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`FlatAluguel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`FlatAluguel` (
  `idFlat` INT NOT NULL,
  `ImovelAluguelTotal_idImoveis` INT NOT NULL,
  `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` INT NOT NULL,
  `ImovelAluguelTotal_Regiao_idRegiao` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idFlat`, `ImovelAluguelTotal_idImoveis`, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel`, `ImovelAluguelTotal_Regiao_idRegiao`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_FlatAluguel_ImovelAluguelTotal1_idx` (`ImovelAluguelTotal_idImoveis` ASC, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` ASC, `ImovelAluguelTotal_Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_FlatAluguel_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_FlatAluguel_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_FlatAluguel_ImovelAluguelTotal1`
    FOREIGN KEY (`ImovelAluguelTotal_idImoveis` , `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` , `ImovelAluguelTotal_Regiao_idRegiao`)
    REFERENCES `lar`.`ImovelAluguelTotal` (`idImoveis` , `ContratoAluguel_idContratoAluguel` , `Regiao_idRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FlatAluguel_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FlatAluguel_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`CasaAluguel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`CasaAluguel` (
  `idCasa` INT NOT NULL,
  `ImovelAluguelTotal_idImoveis` INT NOT NULL,
  `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` INT NOT NULL,
  `ImovelAluguelTotal_Regiao_idRegiao` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idCasa`, `ImovelAluguelTotal_idImoveis`, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel`, `ImovelAluguelTotal_Regiao_idRegiao`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_CasaAluguel_ImovelAluguelTotal1_idx` (`ImovelAluguelTotal_idImoveis` ASC, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` ASC, `ImovelAluguelTotal_Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_CasaAluguel_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_CasaAluguel_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_CasaAluguel_ImovelAluguelTotal1`
    FOREIGN KEY (`ImovelAluguelTotal_idImoveis` , `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` , `ImovelAluguelTotal_Regiao_idRegiao`)
    REFERENCES `lar`.`ImovelAluguelTotal` (`idImoveis` , `ContratoAluguel_idContratoAluguel` , `Regiao_idRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CasaAluguel_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CasaAluguel_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`Studio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Studio` (
  `idStudio` INT NOT NULL,
  `ImovelVendaTotal_idImovelVenda` INT NOT NULL,
  `ImovelVendaTotal_Regiao_idRegiao` INT NOT NULL,
  `ImovelVendaTotal_ContratoVenda_idContratoVenda` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idStudio`, `ImovelVendaTotal_idImovelVenda`, `ImovelVendaTotal_Regiao_idRegiao`, `ImovelVendaTotal_ContratoVenda_idContratoVenda`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_Studio_ImovelVendaTotal1_idx` (`ImovelVendaTotal_idImovelVenda` ASC, `ImovelVendaTotal_Regiao_idRegiao` ASC, `ImovelVendaTotal_ContratoVenda_idContratoVenda` ASC) VISIBLE,
  INDEX `fk_Studio_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_Studio_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_Studio_ImovelVendaTotal1`
    FOREIGN KEY (`ImovelVendaTotal_idImovelVenda` , `ImovelVendaTotal_Regiao_idRegiao` , `ImovelVendaTotal_ContratoVenda_idContratoVenda`)
    REFERENCES `lar`.`ImovelVendaTotal` (`idImovelVenda` , `Regiao_idRegiao` , `ContratoVenda_idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Studio_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Studio_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`QuartoAluguel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`QuartoAluguel` (
  `idQuartoAluguel` INT NOT NULL,
  `ImovelAluguelTotal_idImoveis` INT NOT NULL,
  `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` INT NOT NULL,
  `ImovelAluguelTotal_Regiao_idRegiao` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idQuartoAluguel`, `ImovelAluguelTotal_idImoveis`, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel`, `ImovelAluguelTotal_Regiao_idRegiao`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_QuartoAluguel_ImovelAluguelTotal1_idx` (`ImovelAluguelTotal_idImoveis` ASC, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` ASC, `ImovelAluguelTotal_Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_QuartoAluguel_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_QuartoAluguel_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_QuartoAluguel_ImovelAluguelTotal1`
    FOREIGN KEY (`ImovelAluguelTotal_idImoveis` , `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` , `ImovelAluguelTotal_Regiao_idRegiao`)
    REFERENCES `lar`.`ImovelAluguelTotal` (`idImoveis` , `ContratoAluguel_idContratoAluguel` , `Regiao_idRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_QuartoAluguel_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_QuartoAluguel_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`CasaCondominio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`CasaCondominio` (
  `idCasaCondominio` INT NOT NULL,
  `ImovelVendaTotal_idImovelVenda` INT NOT NULL,
  `ImovelVendaTotal_Regiao_idRegiao` INT NOT NULL,
  `ImovelVendaTotal_ContratoVenda_idContratoVenda` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `PreferenciaCondominio_idPreferenciaCondominio` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idCasaCondominio`, `ImovelVendaTotal_idImovelVenda`, `ImovelVendaTotal_Regiao_idRegiao`, `ImovelVendaTotal_ContratoVenda_idContratoVenda`, `PreferenciaImovel_idPreferencias`, `PreferenciaCondominio_idPreferenciaCondominio`, `Caracteristica_idCaracteristica`),
  INDEX `fk_CasaCondominio_ImovelVendaTotal1_idx` (`ImovelVendaTotal_idImovelVenda` ASC, `ImovelVendaTotal_Regiao_idRegiao` ASC, `ImovelVendaTotal_ContratoVenda_idContratoVenda` ASC) VISIBLE,
  INDEX `fk_CasaCondominio_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_CasaCondominio_PreferenciaCondominio1_idx` (`PreferenciaCondominio_idPreferenciaCondominio` ASC) VISIBLE,
  INDEX `fk_CasaCondominio_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_CasaCondominio_ImovelVendaTotal1`
    FOREIGN KEY (`ImovelVendaTotal_idImovelVenda` , `ImovelVendaTotal_Regiao_idRegiao` , `ImovelVendaTotal_ContratoVenda_idContratoVenda`)
    REFERENCES `lar`.`ImovelVendaTotal` (`idImovelVenda` , `Regiao_idRegiao` , `ContratoVenda_idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CasaCondominio_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CasaCondominio_PreferenciaCondominio1`
    FOREIGN KEY (`PreferenciaCondominio_idPreferenciaCondominio`)
    REFERENCES `lar`.`PreferenciaCondominio` (`idPreferenciaCondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CasaCondominio_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`CasaCondominioAluguel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`CasaCondominioAluguel` (
  `idCasaCondominio` INT NOT NULL,
  `ImovelAluguelTotal_idImoveis` INT NOT NULL,
  `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` INT NOT NULL,
  `ImovelAluguelTotal_Regiao_idRegiao` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `PreferenciaCondominio_idPreferenciaCondominio` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idCasaCondominio`, `ImovelAluguelTotal_idImoveis`, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel`, `ImovelAluguelTotal_Regiao_idRegiao`, `PreferenciaImovel_idPreferencias`, `PreferenciaCondominio_idPreferenciaCondominio`, `Caracteristica_idCaracteristica`),
  INDEX `fk_CasaCondominioAluguel_ImovelAluguelTotal1_idx` (`ImovelAluguelTotal_idImoveis` ASC, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` ASC, `ImovelAluguelTotal_Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_CasaCondominioAluguel_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_CasaCondominioAluguel_PreferenciaCondominio1_idx` (`PreferenciaCondominio_idPreferenciaCondominio` ASC) VISIBLE,
  INDEX `fk_CasaCondominioAluguel_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_CasaCondominioAluguel_ImovelAluguelTotal1`
    FOREIGN KEY (`ImovelAluguelTotal_idImoveis` , `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` , `ImovelAluguelTotal_Regiao_idRegiao`)
    REFERENCES `lar`.`ImovelAluguelTotal` (`idImoveis` , `ContratoAluguel_idContratoAluguel` , `Regiao_idRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CasaCondominioAluguel_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CasaCondominioAluguel_PreferenciaCondominio1`
    FOREIGN KEY (`PreferenciaCondominio_idPreferenciaCondominio`)
    REFERENCES `lar`.`PreferenciaCondominio` (`idPreferenciaCondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CasaCondominioAluguel_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`CasaVila`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`CasaVila` (
  `idCasaVila` INT NOT NULL,
  `ImovelVendaTotal_idImovelVenda` INT NOT NULL,
  `ImovelVendaTotal_Regiao_idRegiao` INT NOT NULL,
  `ImovelVendaTotal_ContratoVenda_idContratoVenda` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `PreferenciaCondominio_idPreferenciaCondominio` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idCasaVila`, `ImovelVendaTotal_idImovelVenda`, `ImovelVendaTotal_Regiao_idRegiao`, `ImovelVendaTotal_ContratoVenda_idContratoVenda`, `PreferenciaImovel_idPreferencias`, `PreferenciaCondominio_idPreferenciaCondominio`, `Caracteristica_idCaracteristica`),
  INDEX `fk_CasaVila_ImovelVendaTotal1_idx` (`ImovelVendaTotal_idImovelVenda` ASC, `ImovelVendaTotal_Regiao_idRegiao` ASC, `ImovelVendaTotal_ContratoVenda_idContratoVenda` ASC) VISIBLE,
  INDEX `fk_CasaVila_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_CasaVila_PreferenciaCondominio1_idx` (`PreferenciaCondominio_idPreferenciaCondominio` ASC) VISIBLE,
  INDEX `fk_CasaVila_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_CasaVila_ImovelVendaTotal1`
    FOREIGN KEY (`ImovelVendaTotal_idImovelVenda` , `ImovelVendaTotal_Regiao_idRegiao` , `ImovelVendaTotal_ContratoVenda_idContratoVenda`)
    REFERENCES `lar`.`ImovelVendaTotal` (`idImovelVenda` , `Regiao_idRegiao` , `ContratoVenda_idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CasaVila_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CasaVila_PreferenciaCondominio1`
    FOREIGN KEY (`PreferenciaCondominio_idPreferenciaCondominio`)
    REFERENCES `lar`.`PreferenciaCondominio` (`idPreferenciaCondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CasaVila_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`Cobertura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Cobertura` (
  `idCobertura` INT NOT NULL,
  `ImovelVendaTotal_idImovelVenda` INT NOT NULL,
  `ImovelVendaTotal_Regiao_idRegiao` INT NOT NULL,
  `ImovelVendaTotal_ContratoVenda_idContratoVenda` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idCobertura`, `ImovelVendaTotal_idImovelVenda`, `ImovelVendaTotal_Regiao_idRegiao`, `ImovelVendaTotal_ContratoVenda_idContratoVenda`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_Cobertura_ImovelVendaTotal1_idx` (`ImovelVendaTotal_idImovelVenda` ASC, `ImovelVendaTotal_Regiao_idRegiao` ASC, `ImovelVendaTotal_ContratoVenda_idContratoVenda` ASC) VISIBLE,
  INDEX `fk_Cobertura_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_Cobertura_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_Cobertura_ImovelVendaTotal1`
    FOREIGN KEY (`ImovelVendaTotal_idImovelVenda` , `ImovelVendaTotal_Regiao_idRegiao` , `ImovelVendaTotal_ContratoVenda_idContratoVenda`)
    REFERENCES `lar`.`ImovelVendaTotal` (`idImovelVenda` , `Regiao_idRegiao` , `ContratoVenda_idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cobertura_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cobertura_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`CoberturaAluguel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`CoberturaAluguel` (
  `idCobertura` INT NOT NULL,
  `ImovelAluguelTotal_idImoveis` INT NOT NULL,
  `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` INT NOT NULL,
  `ImovelAluguelTotal_Regiao_idRegiao` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idCobertura`, `ImovelAluguelTotal_idImoveis`, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel`, `ImovelAluguelTotal_Regiao_idRegiao`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_CoberturaAluguel_ImovelAluguelTotal1_idx` (`ImovelAluguelTotal_idImoveis` ASC, `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` ASC, `ImovelAluguelTotal_Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_CoberturaAluguel_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_CoberturaAluguel_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_CoberturaAluguel_ImovelAluguelTotal1`
    FOREIGN KEY (`ImovelAluguelTotal_idImoveis` , `ImovelAluguelTotal_ContratoAluguel_idContratoAluguel` , `ImovelAluguelTotal_Regiao_idRegiao`)
    REFERENCES `lar`.`ImovelAluguelTotal` (`idImoveis` , `ContratoAluguel_idContratoAluguel` , `Regiao_idRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CoberturaAluguel_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CoberturaAluguel_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`Fazenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Fazenda` (
  `idFazenda` INT NOT NULL,
  `ImovelVendaTotal_idImovelVenda` INT NOT NULL,
  `ImovelVendaTotal_Regiao_idRegiao` INT NOT NULL,
  `ImovelVendaTotal_ContratoVenda_idContratoVenda` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idFazenda`, `ImovelVendaTotal_idImovelVenda`, `ImovelVendaTotal_Regiao_idRegiao`, `ImovelVendaTotal_ContratoVenda_idContratoVenda`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_Fazenda_ImovelVendaTotal1_idx` (`ImovelVendaTotal_idImovelVenda` ASC, `ImovelVendaTotal_Regiao_idRegiao` ASC, `ImovelVendaTotal_ContratoVenda_idContratoVenda` ASC) VISIBLE,
  INDEX `fk_Fazenda_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_Fazenda_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_Fazenda_ImovelVendaTotal1`
    FOREIGN KEY (`ImovelVendaTotal_idImovelVenda` , `ImovelVendaTotal_Regiao_idRegiao` , `ImovelVendaTotal_ContratoVenda_idContratoVenda`)
    REFERENCES `lar`.`ImovelVendaTotal` (`idImovelVenda` , `Regiao_idRegiao` , `ContratoVenda_idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fazenda_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fazenda_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`Terreno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Terreno` (
  `idTerreno` INT NOT NULL,
  `ImovelVendaTotal_idImovelVenda` INT NOT NULL,
  `ImovelVendaTotal_Regiao_idRegiao` INT NOT NULL,
  `ImovelVendaTotal_ContratoVenda_idContratoVenda` INT NOT NULL,
  PRIMARY KEY (`idTerreno`, `ImovelVendaTotal_idImovelVenda`, `ImovelVendaTotal_Regiao_idRegiao`, `ImovelVendaTotal_ContratoVenda_idContratoVenda`),
  INDEX `fk_Terreno_ImovelVendaTotal1_idx` (`ImovelVendaTotal_idImovelVenda` ASC, `ImovelVendaTotal_Regiao_idRegiao` ASC, `ImovelVendaTotal_ContratoVenda_idContratoVenda` ASC) VISIBLE,
  CONSTRAINT `fk_Terreno_ImovelVendaTotal1`
    FOREIGN KEY (`ImovelVendaTotal_idImovelVenda` , `ImovelVendaTotal_Regiao_idRegiao` , `ImovelVendaTotal_ContratoVenda_idContratoVenda`)
    REFERENCES `lar`.`ImovelVendaTotal` (`idImovelVenda` , `Regiao_idRegiao` , `ContratoVenda_idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`Apartamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Apartamento` (
  `idApartamento` INT NOT NULL,
  `ImovelVendaTotal_idImovelVenda` INT NOT NULL,
  `ImovelVendaTotal_Regiao_idRegiao` INT NOT NULL,
  `ImovelVendaTotal_ContratoVenda_idContratoVenda` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `PreferenciaCondominio_idPreferenciaCondominio` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idApartamento`, `ImovelVendaTotal_idImovelVenda`, `ImovelVendaTotal_Regiao_idRegiao`, `ImovelVendaTotal_ContratoVenda_idContratoVenda`, `PreferenciaImovel_idPreferencias`, `PreferenciaCondominio_idPreferenciaCondominio`, `Caracteristica_idCaracteristica`),
  INDEX `fk_Apartamento_ImovelVendaTotal1_idx` (`ImovelVendaTotal_idImovelVenda` ASC, `ImovelVendaTotal_Regiao_idRegiao` ASC, `ImovelVendaTotal_ContratoVenda_idContratoVenda` ASC) VISIBLE,
  INDEX `fk_Apartamento_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_Apartamento_PreferenciaCondominio1_idx` (`PreferenciaCondominio_idPreferenciaCondominio` ASC) VISIBLE,
  INDEX `fk_Apartamento_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_Apartamento_ImovelVendaTotal1`
    FOREIGN KEY (`ImovelVendaTotal_idImovelVenda` , `ImovelVendaTotal_Regiao_idRegiao` , `ImovelVendaTotal_ContratoVenda_idContratoVenda`)
    REFERENCES `lar`.`ImovelVendaTotal` (`idImovelVenda` , `Regiao_idRegiao` , `ContratoVenda_idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apartamento_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apartamento_PreferenciaCondominio1`
    FOREIGN KEY (`PreferenciaCondominio_idPreferenciaCondominio`)
    REFERENCES `lar`.`PreferenciaCondominio` (`idPreferenciaCondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apartamento_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
