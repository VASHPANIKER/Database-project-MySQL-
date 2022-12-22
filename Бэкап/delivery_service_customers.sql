-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: delivery_service
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `district` varchar(15) NOT NULL,
  `street` varchar(25) NOT NULL,
  `house` int NOT NULL,
  `apartment` int NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Юлия','Дмитриева','32(58)54222','South','пр. Домодедовская',1,10),(2,'Тимур','Богданов','8(7036)83283','West','ул. Сталина',2,35),(3,'Давид','Никитин','7(544)76135','East','шоссе Бухарестская',77,14),(4,'Дарья','Васильева','8(30)49019','South','наб. Ломоносова',24,89),(5,'Леонид','Смирнов','71(141)68923','South','проезд Ладыгина',11,85),(6,'Лейла','Гусева','20(44)53683','West','пр. Косиора',123,52),(7,'Владимир','Черных','339(232)74899','West','спуск Ленина',76,44),(8,'Маргарита','Бабушкина','88(1292)46899','East','пер. Чехова',21,91),(9,'Камилла','Сидорова','83(17)59683','North','пер. Гагарина',23,67),(10,'Маргарита','Зайцева','22(17)95215','South','шоссе Чехова',62,44),(11,'Анастасия','Щербакова','280(721)56237','South','бульвар Домодедовская',15,56),(12,'Юлия','Соколова','8(604)09778','South','наб. Косиора',5,13),(13,'София','Петрова','8(813)93576','North','наб. Ленина',18,88),(14,'София','Михайлова','923(51)37841','North','въезд Космонавтов',17,7),(15,'Богдан','Зуев','4(81)80571','South','шоссе Будапештсткая',18,9);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-12 12:54:14
