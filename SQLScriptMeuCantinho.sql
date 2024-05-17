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
-- Table `lar`.`Proprietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Proprietario` (
  `idProprietario` INT NOT NULL,
  `nomePropri` VARCHAR(255) NULL,
  PRIMARY KEY (`idProprietario`))
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
-- Table `lar`.`ImovelAluguel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`ImovelAluguel` (
  `idImoveis` INT NOT NULL,
  `tipoImovelAluguel` VARCHAR(255) NULL,
  `precoImovelAluguel` FLOAT NULL,
  `ContratoAluguel_idContratoAluguel` INT NOT NULL,
  `Regiao_idRegiao` INT NOT NULL,
  `Proprietario_idProprietario` INT NOT NULL,
  `PreferenciaCondominio_idPreferenciaCondominio` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idImoveis`, `ContratoAluguel_idContratoAluguel`, `Regiao_idRegiao`, `PreferenciaCondominio_idPreferenciaCondominio`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_ImovelAluguel_ContratoAluguel1_idx` (`ContratoAluguel_idContratoAluguel` ASC) VISIBLE,
  INDEX `fk_ImovelAluguel_Regiao1_idx` (`Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_ImovelAluguel_Proprietario1_idx` (`Proprietario_idProprietario` ASC) VISIBLE,
  INDEX `fk_ImovelAluguel_PreferenciaCondominio1_idx` (`PreferenciaCondominio_idPreferenciaCondominio` ASC) VISIBLE,
  INDEX `fk_ImovelAluguel_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_ImovelAluguel_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_ImovelAluguel_ContratoAluguel1`
    FOREIGN KEY (`ContratoAluguel_idContratoAluguel`)
    REFERENCES `lar`.`ContratoAluguel` (`idContratoAluguel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelAluguel_Regiao1`
    FOREIGN KEY (`Regiao_idRegiao`)
    REFERENCES `lar`.`Regiao` (`idRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelAluguel_Proprietario1`
    FOREIGN KEY (`Proprietario_idProprietario`)
    REFERENCES `lar`.`Proprietario` (`idProprietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelAluguel_PreferenciaCondominio1`
    FOREIGN KEY (`PreferenciaCondominio_idPreferenciaCondominio`)
    REFERENCES `lar`.`PreferenciaCondominio` (`idPreferenciaCondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelAluguel_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelAluguel_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`ImovelVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`ImovelVenda` (
  `idImovelVenda` INT NOT NULL,
  `tipoImovelVenda` VARCHAR(255) NULL,
  `precoImovelVenda` FLOAT NULL,
  `ContratoVenda_idContratoVenda` INT NOT NULL,
  `Regiao_idRegiao` INT NOT NULL,
  `Proprietario_idProprietario` INT NOT NULL,
  `PreferenciaCondominio_idPreferenciaCondominio` INT NOT NULL,
  `PreferenciaImovel_idPreferencias` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  PRIMARY KEY (`idImovelVenda`, `ContratoVenda_idContratoVenda`, `Regiao_idRegiao`, `PreferenciaCondominio_idPreferenciaCondominio`, `PreferenciaImovel_idPreferencias`, `Caracteristica_idCaracteristica`),
  INDEX `fk_ImovelVenda_ContratoVenda1_idx` (`ContratoVenda_idContratoVenda` ASC) VISIBLE,
  INDEX `fk_ImovelVenda_Regiao1_idx` (`Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_ImovelVenda_Proprietario1_idx` (`Proprietario_idProprietario` ASC) VISIBLE,
  INDEX `fk_ImovelVenda_PreferenciaCondominio1_idx` (`PreferenciaCondominio_idPreferenciaCondominio` ASC) VISIBLE,
  INDEX `fk_ImovelVenda_PreferenciaImovel1_idx` (`PreferenciaImovel_idPreferencias` ASC) VISIBLE,
  INDEX `fk_ImovelVenda_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  CONSTRAINT `fk_ImovelVenda_ContratoVenda1`
    FOREIGN KEY (`ContratoVenda_idContratoVenda`)
    REFERENCES `lar`.`ContratoVenda` (`idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelVenda_Regiao1`
    FOREIGN KEY (`Regiao_idRegiao`)
    REFERENCES `lar`.`Regiao` (`idRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelVenda_Proprietario1`
    FOREIGN KEY (`Proprietario_idProprietario`)
    REFERENCES `lar`.`Proprietario` (`idProprietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelVenda_PreferenciaCondominio1`
    FOREIGN KEY (`PreferenciaCondominio_idPreferenciaCondominio`)
    REFERENCES `lar`.`PreferenciaCondominio` (`idPreferenciaCondominio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelVenda_PreferenciaImovel1`
    FOREIGN KEY (`PreferenciaImovel_idPreferencias`)
    REFERENCES `lar`.`PreferenciaImovel` (`idPreferencias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ImovelVenda_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`Caracteristica` (`idCaracteristica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lar`.`Quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`Quarto` (
  `idQuarto` INT NOT NULL,
  `avaliacao` VARCHAR(255) NULL,
  `preco` FLOAT NULL,
  `Proprietario_idProprietario` INT NOT NULL,
  `Regiao_idRegiao` INT NOT NULL,
  `ContratoAluguel_idContratoAluguel` INT NOT NULL,
  PRIMARY KEY (`idQuarto`, `Regiao_idRegiao`, `ContratoAluguel_idContratoAluguel`),
  INDEX `fk_Quarto_Proprietario1_idx` (`Proprietario_idProprietario` ASC) VISIBLE,
  INDEX `fk_Quarto_Regiao1_idx` (`Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_Quarto_ContratoAluguel1_idx` (`ContratoAluguel_idContratoAluguel` ASC) VISIBLE,
  CONSTRAINT `fk_Quarto_Proprietario1`
    FOREIGN KEY (`Proprietario_idProprietario`)
    REFERENCES `lar`.`Proprietario` (`idProprietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quarto_Regiao1`
    FOREIGN KEY (`Regiao_idRegiao`)
    REFERENCES `lar`.`Regiao` (`idRegiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quarto_ContratoAluguel1`
    FOREIGN KEY (`ContratoAluguel_idContratoAluguel`)
    REFERENCES `lar`.`ContratoAluguel` (`idContratoAluguel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
