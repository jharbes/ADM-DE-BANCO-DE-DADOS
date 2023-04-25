-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: employees
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `dept_no` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `dept_name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`dept_no`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('cn','Contabilidade'),('rh','Recursos Humanos'),('ti','Tecnologia Informacao');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_emp`
--

DROP TABLE IF EXISTS `dept_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_emp` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_emp_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_emp_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_emp`
--

LOCK TABLES `dept_emp` WRITE;
/*!40000 ALTER TABLE `dept_emp` DISABLE KEYS */;
INSERT INTO `dept_emp` VALUES (1,'cn','2020-01-01','2023-04-23'),(2,'cn','2020-01-01','2023-04-23'),(3,'rh','2020-01-01','2023-04-23'),(4,'rh','2020-01-01','2023-04-23'),(5,'ti','2020-01-01','2023-04-23'),(6,'ti','2020-01-01','0000-00-00');
/*!40000 ALTER TABLE `dept_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_manager`
--

DROP TABLE IF EXISTS `dept_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_manager`
--

LOCK TABLES `dept_manager` WRITE;
/*!40000 ALTER TABLE `dept_manager` DISABLE KEYS */;
INSERT INTO `dept_manager` VALUES (7,'cn','2020-01-01','2023-04-23'),(8,'rh','2020-01-01','2023-04-23'),(9,'ti','2020-01-01','2023-04-23');
/*!40000 ALTER TABLE `dept_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_no` int NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `gender` enum('M','F') COLLATE utf8mb4_general_ci NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'1980-01-01','Matheus','Mello','M','2020-01-01'),(2,'1980-01-01','Mateus','Ramos','M','2020-01-01'),(3,'1980-01-01','Jorge','Harbes','M','2020-01-01'),(4,'1980-01-01','Pedro','Cantanhede','M','2020-01-01'),(5,'1980-01-01','Eduardo','Andrade','M','2020-01-01'),(6,'1980-01-01','Pedro','Lyrio','M','2020-01-01'),(7,'1980-01-01','Luiz','Fernando','M','2020-01-01'),(8,'1980-01-01','Joao','Tentis','M','2020-01-01'),(9,'1980-01-01','Marcelo','Santos','M','2020-01-01');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `item_1`
--

DROP TABLE IF EXISTS `item_1`;
/*!50001 DROP VIEW IF EXISTS `item_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `item_1` AS SELECT 
 1 AS `Departamento`,
 1 AS `Custo_anual_funcionarios`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `item_2`
--

DROP TABLE IF EXISTS `item_2`;
/*!50001 DROP VIEW IF EXISTS `item_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `item_2` AS SELECT 
 1 AS `Nome`,
 1 AS `Custo_anual`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `item_3`
--

DROP TABLE IF EXISTS `item_3`;
/*!50001 DROP VIEW IF EXISTS `item_3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `item_3` AS SELECT 
 1 AS `Departamento`,
 1 AS `Custo_total_anual`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `item_4`
--

DROP TABLE IF EXISTS `item_4`;
/*!50001 DROP VIEW IF EXISTS `item_4`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `item_4` AS SELECT 
 1 AS `Nome`,
 1 AS `Departamento`,
 1 AS `Custo_anual`,
 1 AS `Custo_anual_total_departamento`,
 1 AS `Percentual`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `item_5`
--

DROP TABLE IF EXISTS `item_5`;
/*!50001 DROP VIEW IF EXISTS `item_5`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `item_5` AS SELECT 
 1 AS `Nome`,
 1 AS `Departamento`,
 1 AS `Custo_anual`,
 1 AS `Custo_total_departamento`,
 1 AS `Percentual`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `item_6`
--

DROP TABLE IF EXISTS `item_6`;
/*!50001 DROP VIEW IF EXISTS `item_6`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `item_6` AS SELECT 
 1 AS `Nome`,
 1 AS `Departamento`,
 1 AS `Custo_anual`,
 1 AS `Custo_total_departamento`,
 1 AS `Percentual`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salaries` (
  `emp_no` int NOT NULL,
  `salary` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`from_date`),
  CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaries`
--

LOCK TABLES `salaries` WRITE;
/*!40000 ALTER TABLE `salaries` DISABLE KEYS */;
INSERT INTO `salaries` VALUES (1,2000,'2020-01-01','2023-04-23'),(2,2000,'2020-01-01','2023-04-23'),(3,2000,'2020-01-01','2023-04-23'),(4,2000,'2020-01-01','2023-04-23'),(5,2000,'2020-01-01','2023-04-23'),(6,2000,'2020-01-01','2023-04-23'),(7,5000,'2020-01-01','2023-04-23'),(8,5000,'2020-01-01','2023-04-23'),(9,5000,'2020-01-01','2021-01-01'),(9,18000,'2021-01-02','2023-04-23');
/*!40000 ALTER TABLE `salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titles` (
  `emp_no` int NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_no`,`title`,`from_date`),
  CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'employees'
--
/*!50003 DROP PROCEDURE IF EXISTS `exercicio_3_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `exercicio_3_procedure`(IN cod_departamento varchar(2))
BEGIN
set @departamento = null;
select dept_name into @departamento from departments where dept_no = cod_departamento;
select 
	Departamento,
    (select count(*) from item_4 where departamento = @departamento) as Total_pessoas,
    Custo_anual_total_departamento,
    format(custo_anual, 2, 'de_DE') as Custo_funcionario_mais_caro,
    Nome
from item_4 where departamento = @departamento order by custo_anual desc limit 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `item_1`
--

/*!50001 DROP VIEW IF EXISTS `item_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `item_1` AS select `d`.`dept_name` AS `Departamento`,concat('€$ ',convert(format(sum((`s`.`salary` * 12)),2,'de_DE') using utf8mb4)) AS `Custo_anual_funcionarios` from (((`employees` `e` join `dept_emp` `de` on((`e`.`emp_no` = `de`.`emp_no`))) join `departments` `d` on((`de`.`dept_no` = `d`.`dept_no`))) join `salaries` `s` on((`s`.`emp_no` = `e`.`emp_no`))) group by `Departamento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `item_2`
--

/*!50001 DROP VIEW IF EXISTS `item_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `item_2` AS select concat(`e`.`first_name`,' ',`e`.`last_name`) AS `Nome`,format((max(`s`.`salary`) * 12),2,'de_DE') AS `Custo_anual` from (`employees` `e` join `salaries` `s` on((`e`.`emp_no` = `s`.`emp_no`))) group by `Nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `item_3`
--

/*!50001 DROP VIEW IF EXISTS `item_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `item_3` AS select `dados`.`Departamento` AS `Departamento`,format(sum((`dados`.`salary` * 12)),2,'de_DE') AS `Custo_total_anual` from (select distinct concat(`e`.`first_name`,' ',`e`.`last_name`) AS `Nome`,`d`.`dept_name` AS `Departamento`,max(`s`.`salary`) AS `salary` from ((((`departments` `d` join `dept_emp` `de` on((`d`.`dept_no` = `de`.`dept_no`))) join `dept_manager` `dm` on((`d`.`dept_no` = `dm`.`dept_no`))) join `employees` `e` on(((`e`.`emp_no` = `dm`.`emp_no`) or (`e`.`emp_no` = `de`.`emp_no`)))) join `salaries` `s` on((`e`.`emp_no` = `s`.`emp_no`))) group by `e`.`emp_no`) `dados` group by `dados`.`Departamento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `item_4`
--

/*!50001 DROP VIEW IF EXISTS `item_4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `item_4` AS select distinct concat(`e`.`first_name`,' ',`e`.`last_name`) AS `Nome`,`d`.`dept_name` AS `Departamento`,(max(`s`.`salary`) * 12) AS `Custo_anual`,(select `item_3`.`Custo_total_anual` from `item_3` where (`item_3`.`Departamento` = `d`.`dept_name`)) AS `Custo_anual_total_departamento`,format((((max(`s`.`salary`) * 12) / (select `item_3`.`Custo_total_anual` from `item_3` where (`item_3`.`Departamento` = `d`.`dept_name`))) * 100),'%') AS `Percentual` from ((((`departments` `d` join `dept_emp` `de` on((`d`.`dept_no` = `de`.`dept_no`))) join `dept_manager` `dm` on((`d`.`dept_no` = `dm`.`dept_no`))) join `employees` `e` on(((`e`.`emp_no` = `dm`.`emp_no`) or (`e`.`emp_no` = `de`.`emp_no`)))) join `salaries` `s` on((`e`.`emp_no` = `s`.`emp_no`))) group by `e`.`emp_no` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `item_5`
--

/*!50001 DROP VIEW IF EXISTS `item_5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `item_5` AS select distinct concat(`e`.`first_name`,' ',`e`.`last_name`) AS `Nome`,`d`.`dept_name` AS `Departamento`,(max(`s`.`salary`) * 12) AS `Custo_anual`,(select `item_3`.`Custo_total_anual` from `item_3` where (`item_3`.`Departamento` = `d`.`dept_name`)) AS `Custo_total_departamento`,format((((max(`s`.`salary`) * 12) / (select `item_3`.`Custo_total_anual` from `item_3` where (`item_3`.`Departamento` = `d`.`dept_name`))) * 100),'%') AS `Percentual` from ((((`departments` `d` join `dept_emp` `de` on((`d`.`dept_no` = `de`.`dept_no`))) join `dept_manager` `dm` on((`d`.`dept_no` = `dm`.`dept_no`))) join `employees` `e` on(((`e`.`emp_no` = `dm`.`emp_no`) or (`e`.`emp_no` = `de`.`emp_no`)))) join `salaries` `s` on((`e`.`emp_no` = `s`.`emp_no`))) group by `e`.`emp_no` having (`Percentual` <= 10) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `item_6`
--

/*!50001 DROP VIEW IF EXISTS `item_6`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `item_6` AS select distinct concat(`e`.`first_name`,' ',`e`.`last_name`) AS `Nome`,`d`.`dept_name` AS `Departamento`,(max(`s`.`salary`) * 12) AS `Custo_anual`,(select `item_3`.`Custo_total_anual` from `item_3` where (`item_3`.`Departamento` = `d`.`dept_name`)) AS `Custo_total_departamento`,format((((max(`s`.`salary`) * 12) / (select `item_3`.`Custo_total_anual` from `item_3` where (`item_3`.`Departamento` = `d`.`dept_name`))) * 100),'%') AS `Percentual` from ((((`departments` `d` join `dept_emp` `de` on((`d`.`dept_no` = `de`.`dept_no`))) join `dept_manager` `dm` on((`d`.`dept_no` = `dm`.`dept_no`))) join `employees` `e` on(((`e`.`emp_no` = `dm`.`emp_no`) or (`e`.`emp_no` = `de`.`emp_no`)))) join `salaries` `s` on((`e`.`emp_no` = `s`.`emp_no`))) group by `e`.`emp_no` having (`Percentual` >= 10) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24 23:30:28
