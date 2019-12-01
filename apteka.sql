-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: apteka
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id_medicine` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id_medicine`,`id_order`),
  KEY `R_9` (`id_order`),
  CONSTRAINT `R_10` FOREIGN KEY (`id_medicine`) REFERENCES `medicine` (`id_medicine`) ON UPDATE CASCADE,
  CONSTRAINT `R_9` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,5,150),(1,3,2,60),(1,8,4,120),(1,10,15,450),(1,11,4,120),(1,13,6,180),(1,14,1,30),(1,20,6,180),(1,21,6,180),(1,23,1,30),(1,24,5,150),(2,1,3,750),(2,3,1,200),(2,7,3,450),(2,8,5,750),(2,9,1,150),(2,11,5,600),(2,13,9,1080),(2,15,3,360),(2,18,1,120),(2,19,3,360),(2,22,4,480),(3,2,5,1000),(3,3,3,600),(3,7,4,800),(3,9,5,1000),(3,10,10,2000),(3,11,30,6000),(3,14,8,1600),(3,18,9,1800),(3,20,6,1200),(3,23,4,800),(4,2,10,500),(4,3,5,250),(4,8,17,850),(4,9,1,50),(4,10,11,550),(4,12,50,3500),(4,14,8,560),(4,15,4,280),(4,18,7,490),(4,23,3,210),(5,2,2,250),(5,7,1,125),(5,10,1,125),(5,13,4,500),(5,25,4,500),(6,25,1,50),(7,24,1,45),(8,24,1,48),(9,24,8,560);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Витамины'),(2,'Антибиотики'),(3,'Успокоительное'),(4,'Противовирусные'),(5,'Обезболивающие'),(6,'Жаропонижающие'),(8,'update category');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `id_medicine` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `amount` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_producer` int(11) NOT NULL,
  `id_storage_mod` int(11) NOT NULL,
  PRIMARY KEY (`id_medicine`),
  KEY `R_11` (`id_storage_mod`),
  KEY `R_3` (`id_category`),
  KEY `R_4` (`id_producer`),
  CONSTRAINT `R_11` FOREIGN KEY (`id_storage_mod`) REFERENCES `storagemode` (`id_storage_mod`) ON UPDATE CASCADE,
  CONSTRAINT `R_3` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`) ON UPDATE CASCADE,
  CONSTRAINT `R_4` FOREIGN KEY (`id_producer`) REFERENCES `producer` (`id_producer`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Витамин С',30,15,1,4,2),(2,'Амоксициллин',120,80,2,8,1),(3,'Зетамакс',200,40,2,8,1),(4,'Парацетамол2',70,378,6,5,2),(5,'Нурофен',125,14,5,9,1),(6,'Витамин В',50,29,1,2,2),(7,'Анальгин',45,24,5,1,3),(8,'Сединал форте',48,44,4,7,2),(9,'Бофен',70,47,6,9,2),(10,'update name',25.5,100,4,3,3);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!50001 DROP VIEW IF EXISTS `medicines`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `medicines` AS SELECT 
 1 AS `id_medicine`,
 1 AS `name`,
 1 AS `price`,
 1 AS `amount`,
 1 AS `category`,
 1 AS `producer`,
 1 AS `storage_mode`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_order_status` int(11) NOT NULL,
  `id_info` int(11) NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `R_12` (`id_info`) /*!80000 INVISIBLE */,
  KEY `R_7` (`id_user`),
  KEY `R_8` (`id_order_status`),
  CONSTRAINT `R_12` FOREIGN KEY (`id_info`) REFERENCES `order_info` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `R_7` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE,
  CONSTRAINT `R_8` FOREIGN KEY (`id_order_status`) REFERENCES `orderstatus` (`id_order_status`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,2,3,1),(2,2,3,2),(3,3,4,3),(7,18,3,8),(8,19,4,9),(9,20,3,10),(10,20,4,11),(11,19,3,12),(12,19,2,13),(13,21,1,14),(14,22,4,15),(15,27,4,16),(18,18,2,19),(19,28,1,20),(20,18,1,21),(21,29,1,22),(22,29,4,23),(23,30,3,24),(24,31,2,25),(25,18,3,26);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` VALUES (1,'Василий','0554789644','2019-03-20'),(2,'Василий','0554789644','2019-03-25'),(3,'Леша','0966544487','2019-03-26'),(4,'ÐÐµÑÑ','0665489756','2019-06-08'),(5,'ÐÐ°ÑÑ','0975448783','2019-06-08'),(6,'Ð¢Ð¾Ð»Ñ','0638521673','2019-06-08'),(7,'ÐÐµÑÐ°','0635794831','2019-06-08'),(8,'ÐÐµÑÐ°','0978465797','2019-06-08'),(9,'ÐÐµÑÑ','0975846897','2019-06-10'),(10,'ÐÐ°ÑÑ','0954688812','2019-06-15'),(11,'ÐÐµÑÐ°','0984569173','2019-06-15'),(12,'Коля','0544789964','2019-06-15'),(13,'Mike','0954892478','2019-06-15'),(14,'Леха','0456547877','2019-06-17'),(15,'Коля','0123456789','2019-06-19'),(16,'Олегсей','0951879456','2019-06-19'),(17,'Олегсей','0951879456','2019-06-19'),(18,'Олегсей','0951879456','2019-06-19'),(19,'Олег','0951923456','2019-06-20'),(20,'Леша','0974563216','2019-06-20'),(21,'Олегсей','0952355376','2019-06-20'),(22,'Леша','0963265443','2019-06-20'),(23,'Петя','0963423376','2019-06-20'),(24,'TATa','0974533366','2019-06-20'),(25,'Sara','0974533223','2019-06-20'),(26,'Mike','0958754653','2019-06-20');
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordercart`
--

DROP TABLE IF EXISTS `ordercart`;
/*!50001 DROP VIEW IF EXISTS `ordercart`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordercart` AS SELECT 
 1 AS `id_medicine`,
 1 AS `name`,
 1 AS `category`,
 1 AS `producer`,
 1 AS `storage_mode`,
 1 AS `id_order`,
 1 AS `price`,
 1 AS `amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!50001 DROP VIEW IF EXISTS `orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orders` AS SELECT 
 1 AS `id_order`,
 1 AS `login`,
 1 AS `order_status`,
 1 AS `name`,
 1 AS `phone`,
 1 AS `date`,
 1 AS `id_user`,
 1 AS `id_order_status`,
 1 AS `id_info`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `id_order_status` int(11) NOT NULL AUTO_INCREMENT,
  `order_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_order_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,'new'),(2,'in processing'),(3,'done'),(4,'reject');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `id_producer` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_producer`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (1,'Novartis'),(2,'Nycomed'),(3,'Roche Holding'),(4,'TEVA'),(5,'Дарница'),(6,'Фармак'),(7,'Галичфарм'),(8,'Altana'),(9,'Bayer'),(10,'Valeant Pharmaceuticals International'),(11,'update producer');
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storagemode`
--

DROP TABLE IF EXISTS `storagemode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storagemode` (
  `id_storage_mod` int(11) NOT NULL AUTO_INCREMENT,
  `storage_mode` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_storage_mod`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storagemode`
--

LOCK TABLES `storagemode` WRITE;
/*!40000 ALTER TABLE `storagemode` DISABLE KEYS */;
INSERT INTO `storagemode` VALUES (1,'Холодное место'),(2,'прохладное место'),(3,'Хранение в морозильной камере'),(4,'Хранение в условиях глубокого замораживания'),(5,'update storage_mod');
/*!40000 ALTER TABLE `storagemode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_user_status` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `R_6` (`id_user_status`),
  CONSTRAINT `R_6` FOREIGN KEY (`id_user_status`) REFERENCES `userstatus` (`id_user_status`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin',1),(2,'client','root',2),(3,'customer','qwerty',2),(8,'goodBoy','hava112',2),(14,'mrdog','qwerty',2),(18,'mrcat','catawesome',2),(19,'doggo','goodboy',2),(20,'dude','qwerty',2),(21,'cooldude','qwerty111',2),(22,'dell','dell1234',2),(27,'pepe','sad',2),(28,'windows7','parol',2),(29,'newuser','user123',2),(30,'root','pass',2),(31,'human','12345',2),(32,'updateLogin','passs',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userstatus`
--

DROP TABLE IF EXISTS `userstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userstatus` (
  `id_user_status` int(11) NOT NULL AUTO_INCREMENT,
  `user_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_user_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userstatus`
--

LOCK TABLES `userstatus` WRITE;
/*!40000 ALTER TABLE `userstatus` DISABLE KEYS */;
INSERT INTO `userstatus` VALUES (1,'admin'),(2,'client');
/*!40000 ALTER TABLE `userstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'apteka'
--

--
-- Dumping routines for database 'apteka'
--
/*!50003 DROP FUNCTION IF EXISTS `minus` */;
ALTER DATABASE `apteka` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `minus`(id integer, a integer) RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE amnt INTEGER;
SELECT `apteka`.`medicine`.`amount` INTO amnt from apteka.medicine where (`id_medicine` = id);
RETURN amnt - a;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `apteka` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;

--
-- Final view structure for view `medicines`
--

/*!50001 DROP VIEW IF EXISTS `medicines`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `medicines` AS select `medicine`.`id_medicine` AS `id_medicine`,`medicine`.`Name` AS `name`,`medicine`.`price` AS `price`,`medicine`.`amount` AS `amount`,`category`.`Name` AS `category`,`producer`.`Name` AS `producer`,`storagemode`.`storage_mode` AS `storage_mode` from (((`medicine` join `category`) join `producer`) join `storagemode`) where ((`medicine`.`id_category` = `category`.`id_category`) and (`medicine`.`id_producer` = `producer`.`id_producer`) and (`medicine`.`id_storage_mod` = `storagemode`.`id_storage_mod`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordercart`
--

/*!50001 DROP VIEW IF EXISTS `ordercart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordercart` AS select `medicine`.`id_medicine` AS `id_medicine`,`medicine`.`Name` AS `name`,`category`.`Name` AS `category`,`producer`.`Name` AS `producer`,`storagemode`.`storage_mode` AS `storage_mode`,`cart`.`id_order` AS `id_order`,`cart`.`price` AS `price`,`cart`.`amount` AS `amount` from ((((`medicine` join `category`) join `producer`) join `storagemode`) join `cart`) where ((`medicine`.`id_category` = `category`.`id_category`) and (`medicine`.`id_producer` = `producer`.`id_producer`) and (`medicine`.`id_storage_mod` = `storagemode`.`id_storage_mod`) and (`medicine`.`id_medicine` = `cart`.`id_medicine`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders`
--

/*!50001 DROP VIEW IF EXISTS `orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders` AS select `order`.`id_order` AS `id_order`,`user`.`login` AS `login`,`orderstatus`.`order_status` AS `order_status`,`order_info`.`name` AS `name`,`order_info`.`phone` AS `phone`,`order_info`.`date` AS `date`,`order`.`id_user` AS `id_user`,`order`.`id_order_status` AS `id_order_status`,`order`.`id_info` AS `id_info` from (((`order` join `orderstatus`) join `order_info`) join `user`) where ((`order`.`id_order_status` = `orderstatus`.`id_order_status`) and (`order`.`id_info` = `order_info`.`id`) and (`order`.`id_user` = `user`.`id_user`)) */;
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

-- Dump completed on 2019-12-02  1:19:05
