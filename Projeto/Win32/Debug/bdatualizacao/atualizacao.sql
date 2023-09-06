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

-- Copiando estrutura para tabela sistema.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `CD_FUNCIONARIO` int(11) NOT NULL AUTO_INCREMENT,
  `NM_FUNCIONARIO` varchar(50) NOT NULL,
  PRIMARY KEY (`CD_FUNCIONARIO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela sistema.funcionario: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT IGNORE INTO `funcionario` (`CD_FUNCIONARIO`, `NM_FUNCIONARIO`) VALUES
	(1, 'akira'),
	(5, 'Starla'),
	(6, 'Kurt'),
	(7, 'Marni'),
	(8, 'Tresa'),
	(9, 'Cleopatra'),
	(12, 'Abagail'),
	(13, 'Fannie'),
	(14, 'Kaia'),
	(15, 'Kaye'),
	(16, 'Drucie'),
	(17, 'Rozele'),
	(18, 'Sibby'),
	(19, 'Rutledge'),
	(20, 'Pete');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
