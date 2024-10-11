-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 30-Set-2024 às 09:48
-- Versão do servidor: 8.0.21
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `controle_estagios`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alocacoes`
--

DROP TABLE IF EXISTS `alocacoes`;
CREATE TABLE IF NOT EXISTS `alocacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aluno_id` int NOT NULL,
  `local_estagio_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno_id` (`aluno_id`),
  KEY `local_estagio_id` (`local_estagio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `alocacoes`
--

INSERT INTO `alocacoes` (`id`, `aluno_id`, `local_estagio_id`) VALUES
(1, 4, 1),
(2, 1, 1),
(3, 1, 2),
(4, 1, 2),
(5, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

DROP TABLE IF EXISTS `alunos`;
CREATE TABLE IF NOT EXISTS `alunos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `disponibilidade_horario` enum('Manhã','Tarde','Noite','Manhã e Tarde','Manhã e Noite','Tarde e Noite') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fase_estagio` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `disponibilidade_horario`, `fase_estagio`) VALUES
(1, 'MARIA', 'Manhã', '1ª Fase'),
(2, 'asasdasd', 'Manhã', '1'),
(3, 'AasAS', 'Tarde', '4'),
(4, 'keila', 'Tarde', '1'),
(5, 'quinta cedo 1', '', '1'),
(6, 'q2', 'Tarde e Noite', '3'),
(7, 'q3', 'Noite', '4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fases`
--

DROP TABLE IF EXISTS `fases`;
CREATE TABLE IF NOT EXISTS `fases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `fases`
--

INSERT INTO `fases` (`id`, `nome`) VALUES
(1, 'UC4'),
(2, 'UC7'),
(3, 'UC10'),
(4, 'UC17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `locais_estagio`
--

DROP TABLE IF EXISTS `locais_estagio`;
CREATE TABLE IF NOT EXISTS `locais_estagio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `local` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `limite_vagas` int NOT NULL,
  `horario_disponivel` enum('Manhã','Tarde','Noite','Manhã e Tarde','Manhã e Noite','Tarde e Noite') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `professor_id` int NOT NULL,
  `especialidade` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fase_estagio` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `professor_id` (`professor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `locais_estagio`
--

INSERT INTO `locais_estagio` (`id`, `local`, `departamento`, `limite_vagas`, `horario_disponivel`, `professor_id`, `especialidade`, `fase_estagio`) VALUES
(1, 'ceam - ps', '', 9, 'Tarde', 1, 'abc', '2ª Fase'),
(2, '1', 'CENTRO CIRURGICO', 4, '', 1, 'EMERGENCIA', ''),
(3, '4', 'PS', 33, 'Manhã e Noite', 2, 'EMERGENCIA', ''),
(4, '4', 'PS', 13, 'Tarde e Noite', 2, 'EMERGENCIA', 'UC17'),
(5, '1', 'qqq', 3, 'Tarde e Noite', 2, 'qw', 'UC4'),
(6, 'CEAM', 'qw', 2, 'Tarde', 1, 'qwe', 'UC4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `local`
--

DROP TABLE IF EXISTS `local`;
CREATE TABLE IF NOT EXISTS `local` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `observacao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `local`
--

INSERT INTO `local` (`id`, `nome`, `observacao`) VALUES
(1, 'HOSPITAL ESCOLA', 'TESTE 123'),
(2, 'SAUDE CEAM', '  123456 890'),
(3, 'MAHLE', 'UC3, REQUISITOS'),
(4, 'CEAM', 'OLA MUNDO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professores`
--

DROP TABLE IF EXISTS `professores`;
CREATE TABLE IF NOT EXISTS `professores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `disponibilidade_horario` enum('Manhã','Tarde','Noite','Manhã e Tarde','Manhã e Noite','Tarde e Noite') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `professores`
--

INSERT INTO `professores` (`id`, `nome`, `disponibilidade_horario`, `especialidade`) VALUES
(1, 'io[gooooooo', 'Manhã e Tarde', 'eeeeee'),
(2, 'p1', 'Tarde e Noite', 'abc');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alocacoes`
--
ALTER TABLE `alocacoes`
  ADD CONSTRAINT `alocacoes_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  ADD CONSTRAINT `alocacoes_ibfk_2` FOREIGN KEY (`local_estagio_id`) REFERENCES `locais_estagio` (`id`);

--
-- Limitadores para a tabela `locais_estagio`
--
ALTER TABLE `locais_estagio`
  ADD CONSTRAINT `locais_estagio_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
