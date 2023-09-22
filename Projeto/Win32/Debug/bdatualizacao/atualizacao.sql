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

-- Copiando dados para a tabela sistema.cliente: ~50 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`CD_CLIENTE`, `NM_CLIENTE`, `NR_FONE`, `DT_CADASTRO`, `ST_ATIVO`) VALUES
	(5, 'Nahum', NULL, '2023-09-06 21:41:26', 'SIM'),
	(6, 'Clare', NULL, '2023-09-06 21:41:26', 'SIM'),
	(7, 'Maxim', NULL, '2023-09-06 21:41:26', 'SIM'),
	(8, 'Nicol', NULL, '2023-09-06 21:41:26', 'SIM'),
	(9, 'Dru', NULL, '2023-09-06 21:41:26', 'SIM'),
	(10, 'Kingsley', NULL, '2023-09-06 21:41:26', 'SIM'),
	(11, 'Kathie', NULL, '2023-09-06 21:41:26', 'SIM'),
	(12, 'Moyna', NULL, '2023-09-06 21:41:26', 'SIM'),
	(13, 'Baird', NULL, '2023-09-06 21:41:26', 'SIM'),
	(14, 'Starla', NULL, '2023-09-06 21:41:26', 'SIM'),
	(15, 'Sayres', NULL, '2023-09-06 21:41:26', 'SIM'),
	(16, 'Chiarra', NULL, '2023-09-06 21:41:26', 'SIM'),
	(17, 'Christian', NULL, '2023-09-06 21:41:26', 'SIM'),
	(18, 'Claudio', NULL, '2023-09-06 21:41:26', 'SIM'),
	(19, 'Elsy', NULL, '2023-09-06 21:41:26', 'SIM'),
	(20, 'Leora', NULL, '2023-09-06 21:41:26', 'SIM'),
	(21, 'Orsa', NULL, '2023-09-06 21:41:26', 'SIM'),
	(22, 'Lucita', NULL, '2023-09-06 21:41:26', 'SIM'),
	(23, 'June', NULL, '2023-09-06 21:41:26', 'SIM'),
	(24, 'Warner', NULL, '2023-09-06 21:41:26', 'SIM'),
	(25, 'Reyna', NULL, '2023-09-06 21:41:26', 'SIM'),
	(26, 'Deeyn', NULL, '2023-09-06 21:41:26', 'SIM'),
	(27, 'Marie-ann', NULL, '2023-09-06 21:41:26', 'SIM'),
	(28, 'Cart', NULL, '2023-09-06 21:41:26', 'SIM'),
	(29, 'Leslie', NULL, '2023-09-06 21:41:26', 'SIM'),
	(30, 'Imelda', NULL, '2023-09-06 21:41:26', 'SIM'),
	(31, 'Kiah', NULL, '2023-09-06 21:41:26', 'SIM'),
	(32, 'Peria', NULL, '2023-09-06 21:41:26', 'SIM'),
	(33, 'Lyle', NULL, '2023-09-06 21:41:26', 'SIM'),
	(34, 'Nelson', NULL, '2023-09-06 21:41:26', 'SIM'),
	(35, 'Rik', NULL, '2023-09-06 21:41:26', 'SIM'),
	(36, 'Feliks', NULL, '2023-09-06 21:41:26', 'SIM'),
	(37, 'Rafe', NULL, '2023-09-06 21:41:26', 'SIM'),
	(38, 'Susanetta', NULL, '2023-09-06 21:41:26', 'SIM'),
	(39, 'Gabrila', NULL, '2023-09-06 21:41:26', 'SIM'),
	(40, 'Rhys', NULL, '2023-09-06 21:41:26', 'SIM'),
	(41, 'Rudd', NULL, '2023-09-06 21:41:26', 'SIM'),
	(42, 'Flossie', NULL, '2023-09-06 21:41:26', 'SIM'),
	(43, 'Bernard', NULL, '2023-09-06 21:41:26', 'SIM'),
	(44, 'Phillie', NULL, '2023-09-06 21:41:26', 'SIM'),
	(45, 'Dyanne', NULL, '2023-09-06 21:41:26', 'SIM'),
	(46, 'Nathalie', NULL, '2023-09-06 21:41:26', 'SIM'),
	(47, 'Josefa', NULL, '2023-09-06 21:41:26', 'SIM'),
	(48, 'Huntington', NULL, '2023-09-06 21:41:26', 'SIM'),
	(49, 'Issie', NULL, '2023-09-06 21:41:26', 'SIM'),
	(50, 'Meredith', NULL, '2023-09-06 21:41:26', 'SIM'),
	(51, 'aaaaaaaaaaa', '(55)99927-1404', '2023-09-06 23:37:25', 'SIM'),
	(52, 'asasdasd', NULL, '2023-09-06 23:37:39', 'NÃO');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

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
  PRIMARY KEY (`CD_COMISSAOPARCELA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela sistema.comissaoparcela: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `comissaoparcela` DISABLE KEYS */;
INSERT INTO `comissaoparcela` (`CD_COMISSAOPARCELA`, `NR_PARCELA`, `PC_COMISSAO`, `VL_COMISSAO`, `CD_CRM`, `CD_FAIXACOMISSAO`, `CD_FUNCIONARIO`, `CD_CLIENTE`, `TP_PARCELA`, `DT_CADASTRO`) VALUES
	(1, 1, 0.100000, 300.000000, 8, 1, 12, 9, 'M', '2023-09-21 21:01:56'),
	(2, 2, 0.100000, 300.000000, 8, 1, 12, 9, 'M', '2023-09-21 21:01:56');
/*!40000 ALTER TABLE `comissaoparcela` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela sistema.crm: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `crm` DISABLE KEYS */;
INSERT INTO `crm` (`CD_CRM`, `CD_CLIENTE`, `CD_STATUS`, `DS_OBS`, `DT_CADASTRO`, `CD_FUNCIONARIO`, `VL_CREDITO`, `DT_ATUALIZACAO`, `CD_FAIXACOMISSAO`, `TP_PARCELA`) VALUES
	(7, 10, 1, 'teste cadastro', '2023-09-06 21:33:29', 12, 500000.000000, '2023-09-21 20:22:26', 4, 'N'),
	(8, 9, 7, 'asdasdads', '2023-09-06 21:33:29', 12, 300000.000000, '2023-09-21 21:01:57', 1, 'M');
/*!40000 ALTER TABLE `crm` ENABLE KEYS */;

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

-- Copiando dados para a tabela sistema.faixacomissao: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `faixacomissao` DISABLE KEYS */;
INSERT INTO `faixacomissao` (`CD_FAIXACOMISSAO`, `DS_FAIXACOMISSAO`, `NR_PARCELAS`, `VL_MINIMO`, `VL_MAXIMO`, `DT_CADASTRO`) VALUES
	(1, 'FAIXA 1', 2, 0.000000, 300000.000000, '2023-09-09 23:33:46'),
	(4, 'FAIXA 2', 3, 300001.000000, 800000.000000, '2023-09-10 00:04:02');
/*!40000 ALTER TABLE `faixacomissao` ENABLE KEYS */;

-- Copiando estrutura para tabela sistema.faixacomissaoparcela
CREATE TABLE IF NOT EXISTS `faixacomissaoparcela` (
  `CD_FAIXACOMISSAOPARCELA` int(11) NOT NULL AUTO_INCREMENT,
  `CD_FAIXACOMISSAO` int(11) NOT NULL,
  `NR_PARCELA` int(11) NOT NULL,
  `PC_COMISSAO` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `TP_PARCELA` char(1) NOT NULL,
  PRIMARY KEY (`CD_FAIXACOMISSAOPARCELA`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela sistema.faixacomissaoparcela: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `faixacomissaoparcela` DISABLE KEYS */;
INSERT INTO `faixacomissaoparcela` (`CD_FAIXACOMISSAOPARCELA`, `CD_FAIXACOMISSAO`, `NR_PARCELA`, `PC_COMISSAO`, `TP_PARCELA`) VALUES
	(1, 1, 1, 0.100000, 'M'),
	(2, 1, 2, 0.100000, 'M'),
	(3, 1, 1, 0.200000, 'N'),
	(4, 1, 2, 0.200000, 'N'),
	(17, 4, 1, 0.100000, 'M'),
	(18, 4, 2, 0.100000, 'M'),
	(19, 4, 3, 0.150000, 'M'),
	(20, 4, 1, 0.200000, 'N'),
	(21, 4, 2, 0.200000, 'N'),
	(22, 4, 3, 0.300000, 'N');
/*!40000 ALTER TABLE `faixacomissaoparcela` ENABLE KEYS */;

-- Copiando estrutura para tabela sistema.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `CD_FUNCIONARIO` int(11) NOT NULL AUTO_INCREMENT,
  `NM_FUNCIONARIO` varchar(50) NOT NULL,
  `DT_CADASTRO` datetime DEFAULT current_timestamp(),
  `ST_ATIVO` varchar(3) NOT NULL DEFAULT 'SIM',
  PRIMARY KEY (`CD_FUNCIONARIO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela sistema.funcionario: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`CD_FUNCIONARIO`, `NM_FUNCIONARIO`, `DT_CADASTRO`, `ST_ATIVO`) VALUES
	(7, 'Marni', '2023-09-06 21:33:29', 'SIM'),
	(8, 'Tresa', '2023-09-06 21:33:29', 'SIM'),
	(9, 'Cleopatra', '2023-09-06 21:33:29', 'SIM'),
	(12, 'Abagail', '2023-09-06 21:33:29', 'NÃO'),
	(13, 'Fannie', '2023-09-06 21:33:29', 'SIM'),
	(14, 'Kaia', '2023-09-06 21:33:29', 'SIM'),
	(15, 'Kaye', '2023-09-06 21:33:29', 'SIM'),
	(16, 'Drucie', '2023-09-06 21:33:29', 'SIM'),
	(17, 'Rozele', '2023-09-06 21:33:29', 'SIM'),
	(18, 'Sibby', '2023-09-06 21:33:29', 'SIM'),
	(19, 'Rutledge', '2023-09-06 21:33:29', 'SIM'),
	(20, 'Pete', '2023-09-06 21:33:29', 'SIM');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
