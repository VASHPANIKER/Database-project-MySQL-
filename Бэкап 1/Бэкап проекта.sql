CREATE DATABASE  IF NOT EXISTS `delivery_service` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `delivery_service`;
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
-- Table structure for table `courier_info`
--

DROP TABLE IF EXISTS `courier_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_info` (
  `courier_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `delivery_type` varchar(5) NOT NULL,
  PRIMARY KEY (`courier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier_info`
--

LOCK TABLES `courier_info` WRITE;
/*!40000 ALTER TABLE `courier_info` DISABLE KEYS */;
INSERT INTO `courier_info` VALUES (1,'Лидия','Прудникова','+7 (999) 254-76-46','foot'),(2,'Никита','Лигачёв','+7 (910) 396-98-95','car'),(3,'Марьяна','Катькина','+7 (948) 547-80-79','car'),(4,'Василий','Сиянковский','+7 (943) 891-61-90','car');
/*!40000 ALTER TABLE `courier_info` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `delivery_list`
--

DROP TABLE IF EXISTS `delivery_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_list` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `courier_id` int NOT NULL,
  `date_arrived` timestamp NULL DEFAULT NULL,
  `payment_method` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `date_arrived` (`date_arrived`),
  KEY `courier_id` (`courier_id`),
  CONSTRAINT `delivery_list_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `delivery_list_ibfk_2` FOREIGN KEY (`courier_id`) REFERENCES `courier_info` (`courier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_list`
--

LOCK TABLES `delivery_list` WRITE;
/*!40000 ALTER TABLE `delivery_list` DISABLE KEYS */;
INSERT INTO `delivery_list` VALUES (1,1,3,'2022-11-12 14:59:15','Cash'),(2,2,4,'2022-11-12 15:01:05','Card'),(3,3,1,'2022-11-12 15:04:36','Cash'),(4,4,2,'2022-11-12 15:03:11','Cash'),(5,5,1,'2022-11-12 15:19:56','Cash'),(6,6,3,'2022-11-12 15:18:44','Card'),(7,7,2,'2022-11-12 15:50:11','Card'),(8,8,4,'2022-11-12 15:35:07','Card'),(9,9,4,'2022-11-12 15:58:28','Cash'),(10,10,3,'2022-11-12 15:36:51','Card'),(11,11,2,'2022-11-12 16:10:34','Cash'),(12,12,1,'2022-11-12 16:17:04','Cash'),(13,13,2,'2022-11-12 16:23:04','Cash'),(14,14,3,'2022-11-12 15:56:17','Card'),(15,15,4,'2022-11-12 16:05:29','Card');
/*!40000 ALTER TABLE `delivery_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `date_get` timestamp NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2022-11-12 09:50:39'),(2,2,'2022-11-12 09:50:39'),(3,3,'2022-11-12 09:50:39'),(4,4,'2022-11-12 09:50:39'),(5,5,'2022-11-12 09:50:39'),(6,6,'2022-11-12 09:50:39'),(7,7,'2022-11-12 09:50:39'),(8,8,'2022-11-12 09:50:39'),(9,9,'2022-11-12 09:50:39'),(10,10,'2022-11-12 09:50:39'),(11,11,'2022-11-12 09:50:39'),(12,12,'2022-11-12 09:50:39'),(13,13,'2022-11-12 09:50:39'),(14,14,'2022-11-12 09:50:39'),(15,15,'2022-11-12 09:50:39');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_products` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `orders_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,1,2),(1,4,1),(1,10,1),(2,4,1),(2,5,1),(3,3,1),(4,7,2),(5,2,1),(5,3,1),(6,8,3),(7,1,1),(7,6,4),(8,1,2),(9,2,1),(9,3,1),(10,1,2),(10,2,1),(12,5,2),(12,10,1),(13,4,2),(14,5,1),(15,7,2),(15,8,1);
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(80) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Сыр',120.6),(2,'Картофель',75.7),(3,'Рис',14.4),(4,'Молоко',14.1),(5,'Сахар',25.5),(6,'Лук',10.5),(7,'Майонез',12),(8,'Сметана',13.75),(9,'Кофе',34.1),(10,'Минеральная  вода',20);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-12 12:58:49
