-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lar
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lar` ;

-- -----------------------------------------------------
-- Schema lar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lar` DEFAULT CHARACTER SET utf8mb4 ;
USE `lar` ;

-- -----------------------------------------------------
-- Table `lar`.`caracteristica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`caracteristica` (
  `idCaracteristica` INT NOT NULL AUTO_INCREMENT,
  `banheiro` VARCHAR(45) NULL DEFAULT NULL,
  `quarto` VARCHAR(45) NULL DEFAULT NULL,
  `qtdAndar` VARCHAR(45) NULL DEFAULT NULL,
  `metragem` VARCHAR(255) NULL DEFAULT NULL,
  `portaoEletrico` VARCHAR(3) NULL DEFAULT NULL,
  `sistemaAlarme` VARCHAR(3) NULL DEFAULT NULL,
  `cameraSeguranca` VARCHAR(3) NULL DEFAULT NULL,
  `alarmeIncendio` VARCHAR(3) NULL DEFAULT NULL,
  `encanamento` VARCHAR(45) NULL DEFAULT NULL,
  `corParedeInterna` VARCHAR(45) NULL DEFAULT NULL,
  `corParedeExterna` VARCHAR(45) NULL DEFAULT NULL,
  `tipoLampada` VARCHAR(45) NULL DEFAULT NULL,
  `fioPassagem` VARCHAR(3) NULL DEFAULT NULL,
  `closetEmbutido` VARCHAR(3) NULL DEFAULT NULL,
  `jardimInverno` VARCHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`idCaracteristica`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `lar`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(255) NULL DEFAULT NULL,
  `telefoneCliente` VARCHAR(255) NULL DEFAULT NULL,
  `sexoCliente` VARCHAR(255) NULL DEFAULT NULL,
  `dataNascimento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `lar`.`contratoaluguel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`contratoaluguel` (
  `idContratoAluguel` INT NOT NULL AUTO_INCREMENT,
  `valorContratoAluguel` FLOAT NULL DEFAULT NULL,
  `dataContratoAluguel` DATETIME NULL DEFAULT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idContratoAluguel`),
  INDEX `fk_ContratoAluguel_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_ContratoAluguel_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `lar`.`cliente` (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `lar`.`contratovenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`contratovenda` (
  `idContratoVenda` INT NOT NULL AUTO_INCREMENT,
  `valorContratoVenda` FLOAT NULL DEFAULT NULL,
  `dataContratoVenda` DATETIME NULL DEFAULT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idContratoVenda`),
  INDEX `fk_ContratoVenda_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_ContratoVenda_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `lar`.`cliente` (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `lar`.`preferenciacondominio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`preferenciacondominio` (
  `idPreferenciaCondominio` INT NOT NULL AUTO_INCREMENT,
  `garagem` VARCHAR(3) NULL DEFAULT NULL,
  `salaoFestaInfantil` VARCHAR(3) NULL DEFAULT NULL,
  `salaoFestaAdulto` VARCHAR(3) NULL DEFAULT NULL,
  `churrasqueira` VARCHAR(3) NULL DEFAULT NULL,
  `salaoJogos` VARCHAR(3) NULL DEFAULT NULL,
  `quadraEsportiva` VARCHAR(3) NULL DEFAULT NULL,
  `salaCinema` VARCHAR(3) NULL DEFAULT NULL,
  `mercadoInterno` VARCHAR(3) NULL DEFAULT NULL,
  `espacoGourmet` VARCHAR(3) NULL DEFAULT NULL,
  `espacoPet` VARCHAR(3) NULL DEFAULT NULL,
  `brinquedoteca` VARCHAR(3) NULL DEFAULT NULL,
  `playground` VARCHAR(3) NULL DEFAULT NULL,
  `praca` VARCHAR(3) NULL DEFAULT NULL,
  `redeBalancoCON` VARCHAR(3) NULL DEFAULT NULL,
  `academia` VARCHAR(3) NULL DEFAULT NULL,
  `spa` VARCHAR(3) NULL DEFAULT NULL,
  `sauna` VARCHAR(3) NULL DEFAULT NULL,
  `espacoBeleza` VARCHAR(3) NULL DEFAULT NULL,
  `portaria` VARCHAR(3) NULL DEFAULT NULL,
  `vigia` VARCHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`idPreferenciaCondominio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `lar`.`proprietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`proprietario` (
  `idProprietario` INT NOT NULL AUTO_INCREMENT,
  `nomeProp` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idProprietario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `lar`.`regiao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`regiao` (
  `idRegiao` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(255) NULL DEFAULT NULL,
  `CEP` VARCHAR(255) NULL DEFAULT NULL,
  `nomeRegiao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idRegiao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `lar`.`preferenciaimovel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`preferenciaimovel` (
  `idPreferenciaImovel` INT NOT NULL AUTO_INCREMENT,
  `animal` VARCHAR(3) NULL DEFAULT NULL,
  `trem_metro` VARCHAR(3) NULL DEFAULT NULL,
  `onibus` VARCHAR(3) NULL DEFAULT NULL,
  `mercado` VARCHAR(3) NULL DEFAULT NULL,
  `hospital` VARCHAR(3) NULL DEFAULT NULL,
  `escola` VARCHAR(3) NULL DEFAULT NULL,
  `gasolina` VARCHAR(3) NULL DEFAULT NULL,
  `ruaAsfaltada` VARCHAR(3) NULL DEFAULT NULL,
  `piscina` VARCHAR(3) NULL DEFAULT NULL,
  `jardim` VARCHAR(3) NULL DEFAULT NULL,
  `quintal` VARCHAR(3) NULL DEFAULT NULL,
  `redeBalanco` VARCHAR(3) NULL DEFAULT NULL,
  `varanda` VARCHAR(3) NULL DEFAULT NULL,
  `mobiliado` VARCHAR(3) NULL DEFAULT NULL,
  `salaEstarMobiliada` VARCHAR(3) NULL DEFAULT NULL,
  `salaJantarMobiliada` VARCHAR(3) NULL DEFAULT NULL,
  `cozinhaMobiliada` VARCHAR(3) NULL DEFAULT NULL,
  `areaServicoMobiliada` VARCHAR(3) NULL DEFAULT NULL,
  `varandaMobiliada` VARCHAR(3) NULL DEFAULT NULL,
  `quartoMobiliado` VARCHAR(3) NULL DEFAULT NULL,
  `escritorioMobiliado` VARCHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`idPreferenciaImovel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `lar`.`imovelaluguel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`imovelaluguel` (
  `idImoveis` INT NOT NULL AUTO_INCREMENT,
  `tipoImovelAluguel` VARCHAR(255) NULL DEFAULT NULL,
  `precoImovelAluguel` FLOAT NULL DEFAULT NULL,
  `Regiao_idRegiao` INT NOT NULL,
  `Proprietario_idProprietario` INT NOT NULL,
  `PreferenciaCondominio_idPreferenciaCondominio` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  `preferenciaimovel_idPreferenciaImovel` INT NOT NULL,
  `contratoaluguel_idContratoAluguel` INT NULL,
  PRIMARY KEY (`idImoveis`, `Regiao_idRegiao`, `PreferenciaCondominio_idPreferenciaCondominio`, `Caracteristica_idCaracteristica`, `preferenciaimovel_idPreferenciaImovel`),
  INDEX `fk_ImovelAluguel_Regiao1_idx` (`Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_ImovelAluguel_Proprietario1_idx` (`Proprietario_idProprietario` ASC) VISIBLE,
  INDEX `fk_ImovelAluguel_PreferenciaCondominio1_idx` (`PreferenciaCondominio_idPreferenciaCondominio` ASC) VISIBLE,
  INDEX `fk_ImovelAluguel_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  INDEX `fk_imovelaluguel_preferenciaimovel1_idx` (`preferenciaimovel_idPreferenciaImovel` ASC) VISIBLE,
  INDEX `fk_imovelaluguel_contratoaluguel1_idx` (`contratoaluguel_idContratoAluguel` ASC) VISIBLE,
  CONSTRAINT `fk_ImovelAluguel_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`caracteristica` (`idCaracteristica`),
  CONSTRAINT `fk_ImovelAluguel_PreferenciaCondominio1`
    FOREIGN KEY (`PreferenciaCondominio_idPreferenciaCondominio`)
    REFERENCES `lar`.`preferenciacondominio` (`idPreferenciaCondominio`),
  CONSTRAINT `fk_ImovelAluguel_Proprietario1`
    FOREIGN KEY (`Proprietario_idProprietario`)
    REFERENCES `lar`.`proprietario` (`idProprietario`),
  CONSTRAINT `fk_ImovelAluguel_Regiao1`
    FOREIGN KEY (`Regiao_idRegiao`)
    REFERENCES `lar`.`regiao` (`idRegiao`),
  CONSTRAINT `fk_imovelaluguel_preferenciaimovel1`
    FOREIGN KEY (`preferenciaimovel_idPreferenciaImovel`)
    REFERENCES `lar`.`preferenciaimovel` (`idPreferenciaImovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_imovelaluguel_contratoaluguel1`
    FOREIGN KEY (`contratoaluguel_idContratoAluguel`)
    REFERENCES `lar`.`contratoaluguel` (`idContratoAluguel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `lar`.`imovelvenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`imovelvenda` (
  `idImovelVenda` INT NOT NULL AUTO_INCREMENT,
  `tipoImovelVenda` VARCHAR(255) NULL DEFAULT NULL,
  `precoImovelVenda` FLOAT NULL DEFAULT NULL,
  `Regiao_idRegiao` INT NOT NULL,
  `Proprietario_idProprietario` INT NOT NULL,
  `PreferenciaCondominio_idPreferenciaCondominio` INT NOT NULL,
  `Caracteristica_idCaracteristica` INT NOT NULL,
  `preferenciaimovel_idPreferenciaImovel` INT NOT NULL,
  `contratovenda_idContratoVenda` INT NULL,
  PRIMARY KEY (`idImovelVenda`, `Regiao_idRegiao`, `PreferenciaCondominio_idPreferenciaCondominio`, `Caracteristica_idCaracteristica`, `preferenciaimovel_idPreferenciaImovel`),
  INDEX `fk_ImovelVenda_Regiao1_idx` (`Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_ImovelVenda_Proprietario1_idx` (`Proprietario_idProprietario` ASC) VISIBLE,
  INDEX `fk_ImovelVenda_PreferenciaCondominio1_idx` (`PreferenciaCondominio_idPreferenciaCondominio` ASC) VISIBLE,
  INDEX `fk_ImovelVenda_Caracteristica1_idx` (`Caracteristica_idCaracteristica` ASC) VISIBLE,
  INDEX `fk_imovelvenda_preferenciaimovel1_idx` (`preferenciaimovel_idPreferenciaImovel` ASC) VISIBLE,
  INDEX `fk_imovelvenda_contratovenda1_idx` (`contratovenda_idContratoVenda` ASC) VISIBLE,
  CONSTRAINT `fk_ImovelVenda_Caracteristica1`
    FOREIGN KEY (`Caracteristica_idCaracteristica`)
    REFERENCES `lar`.`caracteristica` (`idCaracteristica`),
  CONSTRAINT `fk_ImovelVenda_PreferenciaCondominio1`
    FOREIGN KEY (`PreferenciaCondominio_idPreferenciaCondominio`)
    REFERENCES `lar`.`preferenciacondominio` (`idPreferenciaCondominio`),
  CONSTRAINT `fk_ImovelVenda_Proprietario1`
    FOREIGN KEY (`Proprietario_idProprietario`)
    REFERENCES `lar`.`proprietario` (`idProprietario`),
  CONSTRAINT `fk_ImovelVenda_Regiao1`
    FOREIGN KEY (`Regiao_idRegiao`)
    REFERENCES `lar`.`regiao` (`idRegiao`),
  CONSTRAINT `fk_imovelvenda_preferenciaimovel1`
    FOREIGN KEY (`preferenciaimovel_idPreferenciaImovel`)
    REFERENCES `lar`.`preferenciaimovel` (`idPreferenciaImovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_imovelvenda_contratovenda1`
    FOREIGN KEY (`contratovenda_idContratoVenda`)
    REFERENCES `lar`.`contratovenda` (`idContratoVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `lar`.`quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lar`.`quarto` (
  `idQuarto` INT NOT NULL AUTO_INCREMENT,
  `avaliacao` VARCHAR(255) NULL DEFAULT NULL,
  `preco` FLOAT NULL DEFAULT NULL,
  `Proprietario_idProprietario` INT NOT NULL,
  `Regiao_idRegiao` INT NOT NULL,
  `contratoaluguel_idContratoAluguel` INT NULL,
  PRIMARY KEY (`idQuarto`, `Regiao_idRegiao`),
  INDEX `fk_Quarto_Proprietario1_idx` (`Proprietario_idProprietario` ASC) VISIBLE,
  INDEX `fk_Quarto_Regiao1_idx` (`Regiao_idRegiao` ASC) VISIBLE,
  INDEX `fk_quarto_contratoaluguel1_idx` (`contratoaluguel_idContratoAluguel` ASC) VISIBLE,
  CONSTRAINT `fk_Quarto_Proprietario1`
    FOREIGN KEY (`Proprietario_idProprietario`)
    REFERENCES `lar`.`proprietario` (`idProprietario`),
  CONSTRAINT `fk_Quarto_Regiao1`
    FOREIGN KEY (`Regiao_idRegiao`)
    REFERENCES `lar`.`regiao` (`idRegiao`),
  CONSTRAINT `fk_quarto_contratoaluguel1`
    FOREIGN KEY (`contratoaluguel_idContratoAluguel`)
    REFERENCES `lar`.`contratoaluguel` (`idContratoAluguel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
