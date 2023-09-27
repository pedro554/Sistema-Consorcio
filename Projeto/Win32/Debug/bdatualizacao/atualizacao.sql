-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.6.4-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para sistema
CREATE DATABASE IF NOT EXISTS `sistema` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `sistema`;

-- Copiando estrutura para tabela sistema.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `CD_CLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NM_CLIENTE` varchar(50) NOT NULL,
  `NR_FONE` varchar(14) DEFAULT NULL,
  `DT_CADASTRO` datetime DEFAULT current_timestamp(),
  `ST_ATIVO` varchar(3) DEFAULT 'SIM',
  PRIMARY KEY (`CD_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sistema.comissaoparcela
CREATE TABLE IF NOT EXISTS `comissaoparcela` (
  `CD_COMISSAOPARCELA` int(11) NOT NULL AUTO_INCREMENT,
  `NR_PARCELA` int(11) NOT NULL,
  `PC_COMISSAO` decimal(20,6) NOT NULL,
  `VL_COMISSAO` decimal(20,6) NOT NULL,
  `CD_CRM` int(11) NOT NULL,
  `CD_FAIXACOMISSAO` int(11) NOT NULL,
  `CD_FUNCIONARIO` int(11) NOT NULL,
  `CD_CLIENTE` int(11) NOT NULL,
  `TP_PARCELA` varchar(1) NOT NULL,
  `DT_CADASTRO` datetime NOT NULL DEFAULT current_timestamp(),
  `NR_MESPAGAMENTO` int(11) NOT NULL,
  `NR_ANOPAGAMENTO` int(11) NOT NULL,
  `DT_PAGAMENTO` int(11) NOT NULL,
  PRIMARY KEY (`CD_COMISSAOPARCELA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sistema.crm
CREATE TABLE IF NOT EXISTS `crm` (
  `CD_CRM` int(11) NOT NULL AUTO_INCREMENT,
  `CD_CLIENTE` int(11) NOT NULL,
  `CD_STATUS` int(11) NOT NULL DEFAULT 0,
  `DS_OBS` varchar(500) DEFAULT '',
  `DT_CADASTRO` datetime NOT NULL DEFAULT current_timestamp(),
  `CD_FUNCIONARIO` int(11) NOT NULL,
  `VL_CREDITO` decimal(20,6) NOT NULL,
  `DT_ATUALIZACAO` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CD_FAIXACOMISSAO` int(11) NOT NULL,
  `TP_PARCELA` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`CD_CRM`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sistema.faixacomissao
CREATE TABLE IF NOT EXISTS `faixacomissao` (
  `CD_FAIXACOMISSAO` int(11) NOT NULL AUTO_INCREMENT,
  `DS_FAIXACOMISSAO` varchar(50) NOT NULL,
  `NR_PARCELAS` int(11) NOT NULL DEFAULT 0,
  `VL_MINIMO` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `VL_MAXIMO` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `DT_CADASTRO` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CD_FAIXACOMISSAO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sistema.faixacomissaoparcela
CREATE TABLE IF NOT EXISTS `faixacomissaoparcela` (
  `CD_FAIXACOMISSAOPARCELA` int(11) NOT NULL AUTO_INCREMENT,
  `CD_FAIXACOMISSAO` int(11) NOT NULL,
  `NR_PARCELA` int(11) NOT NULL,
  `PC_COMISSAO` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `TP_PARCELA` char(1) NOT NULL,
  PRIMARY KEY (`CD_FAIXACOMISSAOPARCELA`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela sistema.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `CD_FUNCIONARIO` int(11) NOT NULL AUTO_INCREMENT,
  `NM_FUNCIONARIO` varchar(50) NOT NULL,
  `DT_CADASTRO` datetime DEFAULT current_timestamp(),
  `ST_ATIVO` varchar(3) NOT NULL DEFAULT 'SIM',
  PRIMARY KEY (`CD_FUNCIONARIO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para trigger sistema.cliente_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `cliente_before_delete` BEFORE DELETE ON `cliente` FOR EACH ROW BEGIN
	DECLARE row_count INT;
	SELECT COUNT(*) INTO row_count
	FROM crm
	WHERE crm.CD_CLIENTE = OLD.CD_CLIENTE;
	IF row_count > 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Não é possível excluir este registro, pois já possui movimento!';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger sistema.faixacomissao_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `faixacomissao_before_delete` BEFORE DELETE ON `faixacomissao` FOR EACH ROW BEGIN
	DECLARE row_count INT;
	SELECT COUNT(*) INTO row_count
	FROM crm
	WHERE crm.CD_FAIXACOMISSAO = OLD.CD_FAIXACOMISSAO;
	IF row_count > 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Não é possível excluir este registro, pois já possui movimento!';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger sistema.funcionario_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `funcionario_before_delete` BEFORE DELETE ON `funcionario` FOR EACH ROW BEGIN
	DECLARE row_count INT;
	SELECT COUNT(*) INTO row_count
	FROM crm
	WHERE crm.CD_FUNCIONARIO = OLD.CD_FUNCIONARIO;
	IF row_count > 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Não é possível excluir este registro, pois já possui movimento!';
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
