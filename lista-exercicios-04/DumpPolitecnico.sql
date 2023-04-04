CREATE DATABASE  IF NOT EXISTS `politecnico` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `politecnico`;
-- MySQL dump 10.13  Distrib 5.6.36, for Linux (x86_64)
--
-- Host: localhost    Database: politecnico
-- ------------------------------------------------------
-- Server version	5.6.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `idAluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  PRIMARY KEY (`idAluno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aluno_grade`
--

DROP TABLE IF EXISTS `aluno_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno_grade` (
  `matricula` int(11) NOT NULL AUTO_INCREMENT,
  `idAluno` int(11) DEFAULT NULL,
  `idGrade` int(11) DEFAULT NULL,
  `integralizado` tinyint(4) NOT NULL,
  `anoEntrada` int(11) NOT NULL,
  PRIMARY KEY (`matricula`),
  KEY `idAluno` (`idAluno`),
  KEY `idGrade` (`idGrade`),
  CONSTRAINT `aluno_grade_ibfk_1` FOREIGN KEY (`idAluno`) REFERENCES `aluno` (`idAluno`),
  CONSTRAINT `aluno_grade_ibfk_2` FOREIGN KEY (`idGrade`) REFERENCES `grade` (`idGrade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `idCurso` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `tipo` varchar(25) NOT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `idDisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `ch` int(11) NOT NULL,
  PRIMARY KEY (`idDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `idGrade` int(11) NOT NULL AUTO_INCREMENT,
  `ano` int(11) NOT NULL,
  `chTotal` int(11) NOT NULL,
  `idCurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGrade`),
  KEY `fk_grade_curso` (`idCurso`),
  CONSTRAINT `fk_grade_curso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grade_disciplina`
--

DROP TABLE IF EXISTS `grade_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_disciplina` (
  `idGrade` int(11) NOT NULL DEFAULT '0',
  `idDisciplina` int(11) NOT NULL DEFAULT '0',
  `tipo` varchar(25) NOT NULL,
  PRIMARY KEY (`idGrade`,`idDisciplina`),
  KEY `idDisciplina` (`idDisciplina`),
  CONSTRAINT `grade_disciplina_ibfk_1` FOREIGN KEY (`idGrade`) REFERENCES `grade` (`idGrade`),
  CONSTRAINT `grade_disciplina_ibfk_2` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico` (
  `idHistorico` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `nota` float NOT NULL,
  `matricula` int(11) DEFAULT NULL,
  `idDisciplina` int(11) DEFAULT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`idHistorico`),
  KEY `matricula` (`matricula`),
  KEY `idDisciplina` (`idDisciplina`),
  CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `aluno_grade` (`matricula`),
  CONSTRAINT `historico_ibfk_2` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_requisito`
--

DROP TABLE IF EXISTS `pre_requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_requisito` (
  `idPre` int(11) NOT NULL AUTO_INCREMENT,
  `idDisciplinaAnt` int(11) DEFAULT NULL,
  `idDisciplinaPost` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPre`),
  KEY `fk_pre_requisito_1_idx` (`idDisciplinaAnt`),
  KEY `fk_pre_requisito_2_idx` (`idDisciplinaPost`),
  CONSTRAINT `fk_prerequisito_1` FOREIGN KEY (`idDisciplinaAnt`) REFERENCES `disciplina` (`idDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prerequisito_2` FOREIGN KEY (`idDisciplinaPost`) REFERENCES `disciplina` (`idDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-06  0:44:47
