-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: resturaunt
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bill_date` datetime(6) NOT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `total_amount` double NOT NULL,
  `order_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK575bqi2iwedxvaiwo0mbg60cp` (`order_id`),
  KEY `FKk8vs7ac9xknv5xp18pdiehpp1` (`user_id`),
  KEY `FKq0n4pj8my3wrumxgw1c91i65v` (`admin_id`),
  CONSTRAINT `FKecri4b3uflcfgk69y3wvnyq8s` FOREIGN KEY (`order_id`) REFERENCES `order_food` (`id`),
  CONSTRAINT `FKk8vs7ac9xknv5xp18pdiehpp1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKq0n4pj8my3wrumxgw1c91i65v` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,'2024-11-21 02:50:48.116763',NULL,'UNPAID',1720,9,1,1),(2,'2024-11-21 02:52:29.355151',NULL,'PAID',1700,11,2,1),(3,'2024-11-21 03:15:44.941663',NULL,'PAID',3880,15,2,1),(4,'2024-11-21 03:30:53.947907',NULL,'PAID',970,16,2,1),(5,'2024-11-21 04:03:16.815780',NULL,'PAID',2250,17,2,1),(6,'2024-11-21 04:41:06.133587',NULL,'PAID',690,12,2,1),(7,'2024-11-21 04:41:08.677653',NULL,'GIVEN',2300,13,2,1),(8,'2024-11-21 04:41:10.317776',NULL,'GIVEN',760,14,2,1);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKrfbvkrffamfql7cjmen8v976v` (`email`),
  UNIQUE KEY `UKm3iom37efaxd5eucmxjqqcbe9` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `available` bit(1) NOT NULL,
  `category` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKlmnpdno9yst912bustvp4vuyr` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (3,_binary '','Main Course','b6cc361b-2267-4e3d-bcba-49097b1d0b6e_BeefBiryani.jpg','Beef Biryani',380),(4,_binary '','Dessert','5cebd5fd-afa3-4e62-a80b-76111482521a_Cakes.jpg','Cakes',80),(5,_binary '','Fast Food','5fc23957-5132-48a1-a204-9a81e6e63b9d_CheeseBurger.jpg','Cheese Burger',180),(6,_binary '','Main Course','04627c60-445f-420c-87fa-4e1b7a2ea263_ChickenBiryani.jpg','Chicken Biryani',320),(7,_binary '','Fast Food','8299927a-6008-4e6e-9bc5-8c58e982edad_ChickenBurger.jpg','Chicken Burger',150),(8,_binary '','Fast Food','442c3af2-a09d-4c69-b865-6887d0275e22_ChickenSandwiches.jpg','Chicken Sandwiches',120),(9,_binary '','Fast Food','7715911c-ab3c-45b6-84f6-2b43d3969791_ClubSandwich.jpg','Club Sandwich',130),(10,_binary '','Drinks','6f22a77e-cd15-442a-a3a2-925bf83024ae_coffee.jpg','Coffee',60),(11,_binary '','Dessert','af716a05-60dc-4d2e-8a06-f5bf904f9cc4_IceCream.jpg','Ice Cream',150),(12,_binary '','Drinks','a40d9e16-bd14-4b78-b5f6-d45c660dbc10_Juices.jpg','Juices',80),(13,_binary '','Main Course','54f6c2a8-461b-47e4-9963-08d80bd50ec3_KacchiBiryani.jpg','Kacchi Biryani',350),(14,_binary '','Drinks','13a59b30-07f6-4ad6-a2d3-08ade7cdbe95_Milkshakes.jpg','Milkshakes',120),(15,_binary '','Main Course','1f484713-4d97-46ac-95aa-e164d47bb20d_muttonBiryani.jpg','Mutton Biryani',380),(16,_binary '','Fast Food','3a5ff64e-61d0-4bff-8bea-af2c44e57b95_pasta.jpg','Pasta',130),(18,_binary '','Fast Food','d231ff07-bdae-4291-92b5-b6e065aa2cae_Pastries.jpg','Pastrie',100);
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_food`
--

DROP TABLE IF EXISTS `order_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_food` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notes` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `total_price` double NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `staff_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeen81vsxk3nq6tvmhetwh6kx6` (`admin_id`),
  KEY `FKep1m0f5fvajjewx3n2jnddxnj` (`staff_id`),
  KEY `FK23nh1g8lnaphjg1f0vx5oho4c` (`user_id`),
  CONSTRAINT `FK23nh1g8lnaphjg1f0vx5oho4c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKeen81vsxk3nq6tvmhetwh6kx6` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKep1m0f5fvajjewx3n2jnddxnj` FOREIGN KEY (`staff_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_food`
--

LOCK TABLES `order_food` WRITE;
/*!40000 ALTER TABLE `order_food` DISABLE KEYS */;
INSERT INTO `order_food` VALUES (9,NULL,'APPROVED',1720,1,4,1),(10,NULL,'APPROVED',550,1,4,1),(11,NULL,'APPROVED',1700,1,5,2),(12,NULL,'APPROVED',690,1,5,2),(13,NULL,'APPROVED',2300,1,5,2),(14,NULL,'APPROVED',760,1,5,2),(15,NULL,'APPROVED',3880,1,4,2),(16,NULL,'APPROVED',970,1,5,2),(17,NULL,'APPROVED',2250,1,4,2),(18,NULL,'APPROVED',2100,1,4,2),(19,NULL,'APPROVED',810,1,5,2),(20,NULL,'APPROVED',810,1,4,2),(21,NULL,'PENDING',3860,NULL,NULL,2),(22,NULL,'PENDING',1080,NULL,NULL,2);
/*!40000 ALTER TABLE `order_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_food_order_items`
--

DROP TABLE IF EXISTS `order_food_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_food_order_items` (
  `order_id` bigint NOT NULL,
  `order_items_id` bigint NOT NULL,
  UNIQUE KEY `UK9byvmqp9amqvtshx7pmskcjb5` (`order_items_id`),
  KEY `FKf4k11fup9y6hk3oo7b4hybxo8` (`order_id`),
  CONSTRAINT `FK12guybpfiitc08shx2cg3b9e7` FOREIGN KEY (`order_items_id`) REFERENCES `order_items` (`id`),
  CONSTRAINT `FKf4k11fup9y6hk3oo7b4hybxo8` FOREIGN KEY (`order_id`) REFERENCES `order_food` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_food_order_items`
--

LOCK TABLES `order_food_order_items` WRITE;
/*!40000 ALTER TABLE `order_food_order_items` DISABLE KEYS */;
INSERT INTO `order_food_order_items` VALUES (9,14),(9,15),(9,16),(10,17),(10,18),(10,19),(10,20),(11,21),(11,22),(11,23),(12,24),(12,25),(13,26),(13,27),(14,28),(14,29),(15,30),(15,31),(15,32),(15,33),(16,34),(16,35),(16,36),(16,37),(16,38),(17,39),(17,40),(17,41),(17,42),(18,43),(18,44),(18,45),(19,46),(19,47),(19,48),(20,49),(20,50),(20,51),(21,52),(21,53),(21,54),(21,55),(21,56),(21,57),(22,58),(22,59),(22,60),(22,61);
/*!40000 ALTER TABLE `order_food_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1huo7mby94sw84wam6xbfaex2` (`food_id`),
  CONSTRAINT `FK1huo7mby94sw84wam6xbfaex2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (14,2,3),(15,4,4),(16,2,6),(17,1,9),(18,1,7),(19,1,11),(20,1,14),(21,2,15),(22,2,13),(23,2,14),(24,3,7),(25,3,12),(26,5,3),(27,5,12),(28,4,10),(29,4,9),(30,4,3),(31,4,6),(32,4,7),(33,4,14),(34,2,5),(35,1,6),(36,1,10),(37,1,12),(38,1,11),(39,5,4),(40,5,14),(41,5,11),(42,5,18),(43,4,4),(44,3,3),(45,2,6),(46,3,9),(47,3,10),(48,3,12),(49,3,9),(50,3,10),(51,3,12),(52,4,3),(53,3,5),(54,3,6),(55,3,7),(56,2,8),(57,1,11),(58,3,4),(59,3,7),(60,3,12),(61,1,11);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_approvals`
--

DROP TABLE IF EXISTS `table_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_approvals` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `approval_date` datetime(6) DEFAULT NULL,
  `approval_status` varchar(255) NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `booking_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK44wjr04mnbl1ju7swctq4q9js` (`booking_id`),
  KEY `FKgcv9v3ocqn8wn9huc937lip2f` (`admin_id`),
  CONSTRAINT `FK6ffbgi3b0obmjb79v5097rto9` FOREIGN KEY (`booking_id`) REFERENCES `table_booking` (`id`),
  CONSTRAINT `FKgcv9v3ocqn8wn9huc937lip2f` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_approvals`
--

LOCK TABLES `table_approvals` WRITE;
/*!40000 ALTER TABLE `table_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_booking`
--

DROP TABLE IF EXISTS `table_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `table_id` bigint DEFAULT NULL,
  `approval_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo9uc0mpsqm6gtxd9cnoivsl1y` (`admin_id`),
  KEY `FKp3bt5847bfqjdps6f6ne91era` (`customer_id`),
  KEY `FK7x0fmqm2hpa8ml01t8fraiwjp` (`table_id`),
  CONSTRAINT `FK7x0fmqm2hpa8ml01t8fraiwjp` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`),
  CONSTRAINT `FKo9uc0mpsqm6gtxd9cnoivsl1y` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKp3bt5847bfqjdps6f6ne91era` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_booking`
--

LOCK TABLES `table_booking` WRITE;
/*!40000 ALTER TABLE `table_booking` DISABLE KEYS */;
INSERT INTO `table_booking` VALUES (20,'2024-09-29 17:49:11.544233','APPROVED',1,2,2,'2024-09-29 17:54:42.798506'),(21,'2024-09-29 17:55:26.114192','REJECTED',1,2,4,NULL),(22,'2024-09-29 17:55:26.789689','REJECTED',1,2,7,NULL),(23,'2024-09-29 17:56:24.869171','APPROVED',1,2,7,'2024-09-29 17:56:29.041042'),(24,'2024-09-29 17:59:01.441206','PENDING',NULL,2,3,NULL),(25,'2024-09-30 17:40:29.893840','PENDING',NULL,2,5,NULL);
/*!40000 ALTER TABLE `table_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `capacity` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `table_number` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKfjmmqyocmsfsje61iybqifd96` (`table_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,2,'AVAILABLE','T1'),(2,4,'BOOKED','T2'),(3,6,'AVAILABLE','T3'),(4,4,'AVAILABLE','T4'),(5,6,'AVAILABLE','T5'),(6,4,'AVAILABLE','T6'),(7,2,'BOOKED','T7'),(10,2,'AVAILABLE','T10');
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_logged_out` bit(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj8rfw4x0wjjyibfqq566j4qng` (`user_id`),
  CONSTRAINT `FKj8rfw4x0wjjyibfqq566j4qng` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY2ODQ0NzEsImV4cCI6MTcyNjc3MDg3MX0.5Bfdr8KwNmPRjp8QYmB5FWj13KRQy9RQ-5OOlileg9PHovcRQqZ864Ali9NZf7BH',1),(2,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY2ODQ1MDMsImV4cCI6MTcyNjc3MDkwM30.RXl_wGgKSHlU6_6BLBbqsH-m_IBSHW9SOuYTJz3zgw949H0cRbTRhZBeufwpukQ_',2),(3,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY2ODYyMDUsImV4cCI6MTcyNjc3MjYwNX0.Ea7usqCSE9sMPWpbrjpDFwuxRhBvuglpHlCztX7-1Q7Qu4w1W4NDJtpae7dHfgA4',2),(4,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY4NzE1NzgsImV4cCI6MTcyNjk1Nzk3OH0.4D7VOtAhVzolz3_cJthUk9JwAn1QI8kVOOR2cUIH8cLhg6k9DfyqP7Yx3Dgld7l4',2),(5,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY4NzE2MTksImV4cCI6MTcyNjk1ODAxOX0.tYBaUS9Xdl8iiCA84xmqLbnQRsfBVnNuOSOyMO7WEBqu8inE2xqmuXqPMmHrbPPB',1),(6,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MTgwNDgsImV4cCI6MTcyNzYwNDQ0OH0.BD9yPu-RGc1tCr9OKbYckGxd55Wku0fFpxNlmzoNtqU4xvXUEe9_MjgY_RMeBu5M',1),(7,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MTk3NTQsImV4cCI6MTcyNzYwNjE1NH0.yaQN61AwT_dz1KxwcV61lrc5SmrjavKREMIH7XTbKgOwkTDsjPT_OEWYJs-cDhom',1),(8,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MjAwMDIsImV4cCI6MTcyNzYwNjQwMn0.qwFuvxPio7s9CU1A1SK81ugj5WCNrVEiq_vemXTKH1zyi0qkzCU6-2N-51x25AyD',1),(9,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MjM1MzYsImV4cCI6MTcyNzYwOTkzNn0.fIWeOlZ85AEXM4FESz2fPBQI4K9PEIE_gysnixLnROpeYQQzTRCUoq5nzeGmF6B-',1),(10,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVscmF6dWlkYjU5QGdtYWlsLmNvbSIsImlhdCI6MTcyNzUyNDM5NSwiZXhwIjoxNzI3NjEwNzk1fQ.y9GBSvUMgF_ixq6iNISbFEWQhVVfc39V3mQJl8SPS9qGdjOVD9hy1XzsXj_f7IjV',3),(11,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXlhbXVsaXNsYW1AZ21haWwuY29tIiwiaWF0IjoxNzI3NTI0NzI5LCJleHAiOjE3Mjc2MTExMjl9.EgpndpSBdwmy9-VwL5mwCK-GiMTnUAJ7Aq3--lvnMBXI26V_R5pkd1aF2V0vpuza',4),(12,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXlhbXVsaXNsYW1AZ21haWwuY29tIiwiaWF0IjoxNzI3NTI1MzYwLCJleHAiOjE3Mjc2MTE3NjB9.yoKxqbimiIQv9xzKJb-qGBHMiY1FMPm0m057S2EUI7yXoOQ1G2Ns89iaFGXDgLE1',4),(13,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MjY0MTEsImV4cCI6MTcyNzYxMjgxMX0.wCi7Ef66OSRTBaNHFuj_nyUTy5iZi-5XzanHizTMTDWS8o0CfBL2ht_ZsJlslaI-',2),(14,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MDQ1MTcsImV4cCI6MTcyNzY5MDkxN30.OjBRYmSqFfRtFWNW9msxrfy3I7M_PihP63-96wRPRonO6ZFngW8Z0sR9CVlkkira',2),(15,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MDQ1ODYsImV4cCI6MTcyNzY5MDk4Nn0.FDdK51uqnfIQk3XL0iSaqQWSqno6tzcYnxCu_oB3oYZjDJWRV3mb9cd2_YpqEice',2),(16,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MDUzNjEsImV4cCI6MTcyNzY5MTc2MX0.XCSNhB6_gMPhVaif3Bh3H_ebdUJcMHFzQhdWDNRG3JBk-LMV_GP4TJZrL7ITGZQ1',1),(17,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MDY1MDMsImV4cCI6MTcyNzY5MjkwM30.i7vudCT-CrxcZyGYqJrDtfzWd9QhZZ8UFdZIM_zxkZqfiY7GdopBlhaSA7OHlshA',1),(18,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MTA0MTgsImV4cCI6MTcyNzY5NjgxOH0.1t2KKurFj4T3wClhhKFBmIvxKTu0tqgtpK3Aeq6Z0Cwk5x8XqLPb2xXTvo38-DnF',2),(19,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MTA2MTUsImV4cCI6MTcyNzY5NzAxNX0.u5CNPQoEg-vi-tAJss39WrTksIy_i53l77qLUF-fdXBPjmLnuWtvgrpG-8wtsHx2',1),(20,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MTA5MTAsImV4cCI6MTcyNzY5NzMxMH0.yCNsLr-lYxwVJYP3WnQ-QCTvY2jtYa2FLCbemJwM1sXa59_LlyTkWd0Tx9QlelBx',2),(21,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MTQ1NjMsImV4cCI6MTcyNzcwMDk2M30.3VqCAra8x5DlYZ2U4fW14COP6hQzz6xxVJJ8xwSyGAsXA0xTKKCmARItt1pJ5AWO',1),(22,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODQ3NTYsImV4cCI6MTcyNzc3MTE1Nn0.p7gHWjwXJJfKTWbQFOeXSRNw3yAhnRypE9DnA4S5_PBezDTOC8LsR28zywyL4rN5',2),(23,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODUwMDEsImV4cCI6MTcyNzc3MTQwMX0.PfBKcDqC328QyIl-mL8mKytvb7GTGZvLSc8BdYq7M1eEWy1DL0vkF-8tGpfA38lX',1),(24,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODYxNDcsImV4cCI6MTcyNzc3MjU0N30.XvmOG-schwHDBLjfDl5XFQGgQs5YSI-oFw1l4GCBG_hQEhszj3ys07xaYwn2zG6e',2),(25,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODkxMjQsImV4cCI6MTcyNzc3NTUyNH0._iTNE61rC_dt76tiTK4fpSrj3kluqxTBuFC5MqXeb5FIhxb3qpiN5NRcXRUWJX2D',2),(26,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODk3NjAsImV4cCI6MTcyNzc3NjE2MH0.VEotBJorPziDbpZKx6G8Q2JxpNVwz8Up_6da96tDj6mNkGuzFJqmb6MNyAMuX0-D',2),(27,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTE1ODEsImV4cCI6MTcyNzc3Nzk4MX0.YJtwdB4pGdjl4T2huoI8XZyg6yk4L585HunlCRAibeq7w1rNbMqv7liekrGS_auj',2),(28,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTM5ODcsImV4cCI6MTcyNzc4MDM4N30.YwGBTpxfN8fxbSaLdGiTem-xXX_DLT4PQDbIacupnWTMA6dT9XX67VNgvRORnb3U',2),(29,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTUyNjAsImV4cCI6MTcyNzc4MTY2MH0.OzbSpmEOMmT6dEVGz9q7LEVZp_4ohWa7j9XGtNn0yM7WKuhVR7QDOrToQKcby1Vn',2),(30,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTcwNzMsImV4cCI6MTcyNzc4MzQ3M30.aUcuCxzvxHBf8SS1ySScY-o6up2clBBfX5GH3PTk1nr3K6FMSMoYyUu9O8SzEe4X',1),(31,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTc4MzMsImV4cCI6MTcyNzc4NDIzM30.xv65K9x8YJ0rEaU9xEiNb_eHkczmrLlXLQrb8x-As6RqYMgvz8FDWN9xxrcddX6B',1),(32,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTk1MTcsImV4cCI6MTcyNzc4NTkxN30.6Pqq2Kt4YYNsnkz0juDPtJ8A9W7ksHLCs2Jfoyd-UzRtqTvWvASJNDbdWL8eTvoE',2),(33,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTk1NTAsImV4cCI6MTcyNzc4NTk1MH0.I_Sv4x0wgW6wxCusuMUVr00VSB1JJK5J6FYLfa4P9W1IGDlPu4NJU1wcvpDpyd4A',1),(34,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTk3NjgsImV4cCI6MTcyNzc4NjE2OH0.hcvDV6KFhwB8OOISmS075W9QZOO_R9XNIXNnWBCYp5YkGPMTCQnWfHspEfk798Zf',2),(35,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTk4MDksImV4cCI6MTcyNzc4NjIwOX0.MIbxtmRbBcc1FOQz-fkPp5o6ACiKCX_d2pnhLIJ4PKJZChKSk3JWg1SROvidjv20',1),(36,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3MDAxNDUsImV4cCI6MTcyNzc4NjU0NX0.KtT2I332xRMEcsp8j2kLX1GbxXy1aNB6FK1CBp5up-AJs_qamQ9Az8sMZVkrE3tg',2),(37,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3MDAxODQsImV4cCI6MTcyNzc4NjU4NH0.a5lle1A-y02P8Tnmy9A7xMe8G5Jdkd8NSvk73DppAggANP4HT882mb4hxt9_2Ema',2),(38,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3MDAyNjksImV4cCI6MTcyNzc4NjY2OX0.ZonkjEzNCGSk_uKOPwghy1hIpBQWR5uHf6e7YkWg-wksDlFlklIhQTNtRn8D5e8J',2),(39,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3NTg1MTcsImV4cCI6MTcyNzg0NDkxN30.256NAQZUQJmUIPS5OCFx-_u14t0YiKStrRU80Ul_xF5csB2XgD3dzFvyWzDPkQ9e',2),(40,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3NTkwMDEsImV4cCI6MTcyNzg0NTQwMX0.vbYwWln8mMpf4DplbwPqi43eumTmzp8-SnZ3_YT3T5QbxGXlq7YSLty9wUPtQktZ',2),(41,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWhtYW4uZi5zYWRpcXVyQGdtYWlsLmNvbSIsImlhdCI6MTcyNzc2MDA2OSwiZXhwIjoxNzI3ODQ2NDY5fQ.70BRsOrcRH9ouKQ-UfIPojBg6sS6GrIzu3-N4do8w2i01FipVuiKNXGvT5ZhKEwQ',5),(42,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3NjA0NDIsImV4cCI6MTcyNzg0Njg0Mn0.I1Y08aqOlbQ4Hgysv4LHqI52h8sst2V8Gcrf7_UA5R_QAgsP7PDE2rk04aN6ixik',2),(43,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3NjEwNDksImV4cCI6MTcyNzg0NzQ0OX0.3iBY6UamhYeq1JZH9LLLbcg5Aqt804fnckpni-Np3_Rd70go-0-9y1w_k6I-PIH2',2),(44,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc4MTUzNjIsImV4cCI6MTcyNzkwMTc2Mn0.HtbWHZkfD7puZ2D3VhYo__p8b7xnx73LtvSuZ8EFmxrNTZKOF11gTFhQxUiiziom',1),(45,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc4NDU4MzUsImV4cCI6MTcyNzkzMjIzNX0.awvsab1dfT7WOaZRVJDTCKdtYBLvrOjq_TCvJYY0l2a2LXGqkpdsWhQr862Aq545',2),(46,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc5ODE4MjUsImV4cCI6MTcyODA2ODIyNX0.6pe2xgTJspTRG2xrQzAZipjkBS9lsgB-55W3bmpcqQKeR-Z3LUzaWhOo3104TClm',2),(47,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc5ODU5NTEsImV4cCI6MTcyODA3MjM1MX0.ezF1cdraUGt4pHKy7sK_INlCYKXJzspEQtyLFMC0H36yM_CjwuCzaUETYbYWJBCH',2),(48,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhYWFhYWFAZ21haWwuY29tIiwiaWF0IjoxNzMwMDMxOTIxLCJleHAiOjE3MzAxMTgzMjF9.9QdPltTwRyTUN5VqWYhZMwqllldjJRBj7i3ONbWnAuA5C9vtK0hkpJm1QSjqXgAo',6),(49,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJmZGZkc2ZkZkBmYmZndi50Z2hmdGciLCJpYXQiOjE3MzAwMzI2NjEsImV4cCI6MTczMDExOTA2MX0.29FFBHVCo6JmXeut6wDkxsRM3YPFjwl1zZzDDyJn1CSMUK_YuA1wbAHYVatzSe5S',7),(50,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuZXlhbXVsQGdtYWlsLmNvbSIsInJvbGUiOiJVU0VSIiwiaWF0IjoxNzMwODAzNTA5LCJleHAiOjE3MzA4ODk5MDl9.aLCdsm68nf86vBVo2NH2-VtxJfmorJ_ujmmchnHJLoOKAGS2ErmaAjkqrJyEm70o',8),(51,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDk0NjQsImV4cCI6MTczMDg5NTg2NH0.vNNQ7oONE-5Ne_5UM4_V7JdOE_Hote_4e5pVGYj3BW6sUxj_wTmAjJa9b2Y_JRsW',1),(52,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhYWFhYUBhYWFhLmFhYSIsInJvbGUiOiJVU0VSIiwiaWF0IjoxNzMwODA5NTM0LCJleHAiOjE3MzA4OTU5MzR9.yZGi2cYzXMY58K99E9jjqpuA_TLJK57GzSZVCG6XDN0boPVenmySFbtwSHDQWVMo',9),(53,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5MDE3NiwiZXhwIjoxNzMwOTc2NTc2fQ.jW0DCyI_pka-Im4_v4XpnCqJ7zEGt8JW0i7en_Txx6iEFrJL9UpS7YUdWfuZ5p4-',2),(54,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4OTM1MTcsImV4cCI6MTczMDk3OTkxN30.yPb-0vm7udj7N6PGcE5oAOuzSvlVybdEvbF5CxD70LKlG_P78Ut9g_WqHPGhSavv',1),(55,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5MzYxMCwiZXhwIjoxNzMwOTgwMDEwfQ.nP_NBC9WcEw3V6QoKUrTXmnUTc4RaP3sQHiyY3t012JhfuyXMxCDnPg7YLjW6fY6',2),(56,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NDI3MiwiZXhwIjoxNzMwOTgwNjcyfQ.I9pDJ5m6cWoUftSZNDCFH48DsUyUrbUWLAuRVn13JW_uob4YEBZ2yP-BfZ1e3XOt',2),(57,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NDQxNSwiZXhwIjoxNzMwOTgwODE1fQ.-68JztCEXhfEQXeG-HglVFLldsXl4zMSP9di5S494ln1Bl0nzT0ff_s2_tYbPKQg',2),(58,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NDg5NiwiZXhwIjoxNzMwOTgxMjk2fQ.zD3V9uSy0J4BQ5hyjI0Oie5K1LzyKic9ncsKS512Oeb2TQoxGgBzGXvBCeRGG0Ym',2),(59,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NTE1MywiZXhwIjoxNzMwOTgxNTUzfQ.uA6ca_XlHZdJqZsyHcxn_DYgI7YfDvHnLMVRreAfV7A03ZkUuKfu4AcSIQQo5i-E',2),(60,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NTE2OSwiZXhwIjoxNzMwOTgxNTY5fQ.hmJysRlmy6QCww89s-EBzTheEDTuAaP5nOhTT7x9mQtiBqhbJ3lhV3t1bojAq4Qg',2),(61,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NjMwNCwiZXhwIjoxNzMwOTgyNzA0fQ.1fj6gaKiUFqfjiEv_-pBaG8vxE797IOcXHV3eSJNmz_iNtcnyESsZGcPXsbdJd-W',2),(62,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3Mjg5NywiZXhwIjoxNzMxMDU5Mjk3fQ.dSgKM-joM3axaPKDiKZtL1QzoVCx1XVi-Q0ZVE9t8qY2zrafsE0ppGP01ik7dM6V',2),(63,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3OTI1OCwiZXhwIjoxNzMxMDY1NjU4fQ.q90JfPbGg5tNaaaskELO3IVJqdtdl-1NCkaVMH_KRtatTAb8fnZfzU2_d4y7-UD1',2),(64,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3OTU1MCwiZXhwIjoxNzMxMDY1OTUwfQ.bl5Ht_vg06M8jLvF_jBDq67lPJ5XWoKuhaxKhlZtdwn8rlLSvX9aZE6UjDGnolIT',2),(65,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3OTcxNywiZXhwIjoxNzMxMDY2MTE3fQ.gD9O1NjPdluWRqP4MsiVhkwLBiFH3GeD1a01YOIOtGpNzJh3XUnO-iSsXc3ctKpK',2),(66,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3OTk0MCwiZXhwIjoxNzMxMDY2MzQwfQ.EVb_cxeEgFLy9VC9NNRK18fmVhrk8OrQ-KJj9oFtPhFnex-j6sG59-xsqW128NAn',2),(67,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MDA5OCwiZXhwIjoxNzMxMDY2NDk4fQ.5SC7fgK_O-Z452Qja2tbKjam3865hB5UMCBUCKPkoE7BLIKRQovEJAHUK5tywkbA',2),(68,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MDMxMSwiZXhwIjoxNzMxMDY2NzExfQ.rEgo6QQhe0_SajH2wQQkWu_YvI8KXVRtrG5jAaX05t0tgkRbokTK1aat5tA6QdD_',2),(69,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MDU2OCwiZXhwIjoxNzMxMDY2OTY4fQ.6kKaztYXoBIOdGYBD2aK_KqMX3QIaV7r8K6v-YmVIuRmWSvPA3ue4IZCbmcEX6fa',2),(70,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MDczOCwiZXhwIjoxNzMxMDY3MTM4fQ.BJRj9MPkZPIcV7818uJytspnBFgkVABENXJ0G2-ilHK0wVMZv5y0I7gNU46znhOl',2),(71,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MDk2MywiZXhwIjoxNzMxMDY3MzYzfQ.JQ-y2e-sKSStBlE0g-bud7FviC6Xu5sTnLGDim7nz3C6gMZQKONZRvHCTnwmwSs1',2),(72,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MTE0OCwiZXhwIjoxNzMxMDY3NTQ4fQ.Y0Gl_qrjNhJwTgq7cQP92GXuGTkLgmCdaXyKnY_Nmev2GKkvSbQn9u4qSkwAbrCb',2),(73,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MTIzMSwiZXhwIjoxNzMxMDY3NjMxfQ.leuronnS7cfA_6JTNkOPyRG97ofFITXJV1vvczMian87WXXK921SxnoEIPMg5K2H',2),(74,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzExNTA2NzksImV4cCI6MTczMTIzNzA3OX0.2DzArQ_TFBTULmQz_SQbhCUSowa50Sbp7nofgrR-R9ic19gSGdNNm4hyRt2wVEb_',1),(75,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE1MDcyNiwiZXhwIjoxNzMxMjM3MTI2fQ.M5vLdwTT2dPdlxCTdaiom3YEuVK-_GP_geOI-Hy_eic51mq58tNPLSZpz3wwNrKM',2),(76,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzExNTE2NTksImV4cCI6MTczMTIzODA1OX0.FDeONW18Qe2SqnnaSOmzaeRmtOgQedzj3NRGiyYF9qUl6GnMts5q_n4PKqj1POsW',1),(77,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzExNTE3NjksImV4cCI6MTczMTIzODE2OX0.dr8l4Rp1NvjPAzQxqJjfWhb-DclY1WxCjoq5Ezk9QWotF3FoK_MB609xgYVzMNKr',1),(78,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzExNTIxNDAsImV4cCI6MTczMTIzODU0MH0.V-_Rx0S68ay3BHu7HdS3Ckl4btZkeySXJcsElAnC4_AqmiN1qP20G72v8zaWkZbo',1),(79,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDI4ODgsImV4cCI6MTczMTQ4OTI4OH0.NvaYdMwhHQ96Hs-2FmJykgzQ1puBaXymtMnoGK-tYoiNyF6wru06lMvd8mJdi_GT',1),(80,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwMzAwNywiZXhwIjoxNzMxNDg5NDA3fQ.5d_oLDumrw41aUw0zd7A5vTQPAeh1hIpOhi7JSNd3wmxmWDgVcyhUtO8ArMhWUR7',2),(81,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDMxMTIsImV4cCI6MTczMTQ4OTUxMn0.LpnuOWSd7LEJQfe_pDdumRKzomgzRtfwjuSmYCknrQo5Rc0en4z81ld6uVhDJqFH',1),(82,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDM0MjksImV4cCI6MTczMTQ4OTgyOX0.Hz0L1eNgf0ooeEpa0SwWZnDjv7b_KsUQnMA4_5QbjjRYnfbJb2NVH71oulB4yRAO',1),(83,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDU0OTEsImV4cCI6MTczMTQ5MTg5MX0.f5q4QvV1BpHjVPixNxyseJXZiE9NtS4RmpJwEVeegOYwVmzuyJI29UTjp4O7B-ay',1),(84,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNTc4MCwiZXhwIjoxNzMxNDkyMTgwfQ.IzX_5dkygZ0SXy1vxolPZ42GExMhNOsheab29sgBhYMl1GdMhgeYV9bk0Kf7Cgnf',2),(85,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDYwMTMsImV4cCI6MTczMTQ5MjQxM30.DmWzyNzivVFEG13AFgB_fY-wnE2QmZvTsktKdXCIugDQFbqXY1o8oW-VpWMqUJy1',1),(86,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDYwNDQsImV4cCI6MTczMTQ5MjQ0NH0.cV-KJq5tLBpsNUvv41keQHi6JMFeqkJJQFnkSSltCNJWjUnmSwrQbTMhrSmrekfL',1),(87,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDYxNTQsImV4cCI6MTczMTQ5MjU1NH0.WkBH4drTtkxCiQ4xBSIIDlbfuOUouyd5Pya4uIS1yuQ052RJhT2p8kPBDrdF_Asy',1),(88,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDYyNTIsImV4cCI6MTczMTQ5MjY1Mn0.HCWomrn5SCNNOW2sadHHmp2qHM90XF1UN6HTyGtXVtIEyj2mV9zv5zXMSpNk5e9X',1),(89,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDYzOTEsImV4cCI6MTczMTQ5Mjc5MX0.zlMw6_QRUDwkndOnYWjbZaSg_-1dK3kM1qA3njLJNrBSOLDxQGaK4XGYJr2BsbFU',1),(90,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNjQ1NiwiZXhwIjoxNzMxNDkyODU2fQ.jxn-U7ZcEBUZ1_-J9V7zK0J35xaM2BRSznjurbYj-JHCJNY-2FWNwOPBTdg71iFf',2),(91,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDY2MDcsImV4cCI6MTczMTQ5MzAwN30.g9KF5yNH0QnofUX-epRgZo_gQcQj7uqqE4Jz9Y5NnlfVsuAdF0di7RGxW7jtt13t',1),(92,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDY2NDgsImV4cCI6MTczMTQ5MzA0OH0.nlpgiw2g6QoznpwJVFDECERUu-9UOMsK41PWdB20Tmx0TF7mFP8cpBOc3u1pFbei',1),(93,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDY3MzUsImV4cCI6MTczMTQ5MzEzNX0.r_odcZiVk2TkkfdhQTPT59Dx_T7JMlOFYlgH_5vg-zQFvJfaZughV3WGNJ-uOEs0',1),(94,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDcxOTgsImV4cCI6MTczMTQ5MzU5OH0.Cy9eq6EhAJ9RTDPpWgjyMQ8B1k6cVeEcjYRWz6w5VTLbu2Iq-nmmP_1ARX92bIeD',1),(95,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDc2NTcsImV4cCI6MTczMTQ5NDA1N30.57pwg_zXypw2Kc9cdkXbviG7BY-GHN0tcq4eZ2naNpv-VFuMuBS8PgpHRnvhjdEG',1),(96,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNzk3NiwiZXhwIjoxNzMxNDk0Mzc2fQ.rWeu9ggovSmv74UUmkNqeZ4FtH9OdZajpvJlq51eKOzT1Veb1iSBxivwPJ04uuPs',2),(97,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDkxODgsImV4cCI6MTczMTQ5NTU4OH0.Fp5WAsjDNrVLN-gyvWAVS8r6rJdxNu0UO822IxE4CMFscc1CpuHBemmiexHrMFQG',1),(98,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDkyMzEsImV4cCI6MTczMTQ5NTYzMX0.Az2rem6xuN5-0TOIcl7CHbowZPyaD1CBVuDr7-oOzPOmlEECTrUdEQ-nJSkgLvlI',1),(99,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwOTQxMiwiZXhwIjoxNzMxNDk1ODEyfQ.34puGzKc9iubHc-Fa95fQ_PWLSZ6PuOCV0ZMsYH39UiScXXHjiI2NHH9voXHMnC-',2),(100,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDk0NjAsImV4cCI6MTczMTQ5NTg2MH0.pw95h8wtIukYYMw8HYijDlNluZgyqqnlCEiXI1-G66hNnSKYJT0wSp73OkTEBcfv',1),(101,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDk3NDEsImV4cCI6MTczMTQ5NjE0MX0.OUgfI3h1yFDdQydO0Ne5saL0zcPt7hT-ZMkpTTr2m5VL3l69WWumWH8drU0JeCXW',1),(102,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDk5MzUsImV4cCI6MTczMTQ5NjMzNX0.VdoUgQqVGXLk2cctMDcny8NpfVCA_ktJj7IMltWu029i0jS9sZmPsDMkAIB6AaD5',1),(103,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MTM1MDAsImV4cCI6MTczMTQ5OTkwMH0.5dmHedRqBdMSBC9sR1C58KrGAFwRypjLr4XF9MTF67CrwhnnKjKnfXmB6vbpjqlC',1),(104,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MTM2OTksImV4cCI6MTczMTUwMDA5OX0.3Hj8Bobio0lkjgDcRvhl3oszFaqPKWZS6LzYFSpWtGqEULkFoV9erM6OVMdjUmKh',1),(105,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxNDA3NSwiZXhwIjoxNzMxNTAwNDc1fQ.d3qcJlWyjm7ZHN0gIEjaDxP89uepn1zFD2fNYnyjjIz1wUiC3OLJbI3AaRO67h9F',2),(106,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MTQxODYsImV4cCI6MTczMTUwMDU4Nn0.xNNAngevAM3Pwo03b_8DI1J8mTgXFdgWg-2gCE_cprKfEIuDY61qjlQGbMBSbkwI',1),(107,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MTQyMTQsImV4cCI6MTczMTUwMDYxNH0.AIPKi8nFhPq5UwakRPtqXJNK3VilIYJaj31LnJx5h7VQRJ5YJrPOvw0gPV4Uk_T0',1),(108,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0ODkzOTMsImV4cCI6MTczMTU3NTc5M30.YwSwHFTn7XEdrA1EOT9tsmzyKCjxPL1Lx1aIFW1CjQv8iGQPq1M1PfIzI8tXN9Ng',1),(109,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQ5MDcxOSwiZXhwIjoxNzMxNTc3MTE5fQ.CfslHVnp_AfvJwqAc6Xz9vsLkYYQ4kUllsl83JDTw9KzVCYw4QQKYF6qrKLrj0fk',2),(110,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0OTExMTYsImV4cCI6MTczMTU3NzUxNn0.I-SjjlpNOwvvOONbrfrrS51uxTY4NNFfCPIXfMn4MF_PHDQC2GSrU--OcbL75E_2',1),(111,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0OTExMzMsImV4cCI6MTczMTU3NzUzM30.-ehhIA4McfdFUQm2i2A1-9a3KthUjK-S_y55Eu1ruKs9BA2rEOhlDoxTHWGoLd2H',1),(112,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0OTExNDksImV4cCI6MTczMTU3NzU0OX0.1-QZmDARJHGq-nNmH3WYzTpzTI1vNORQwBKXSdGKALTQARJNzMGVrJP8fuxdDVpz',1),(113,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0OTE4NDIsImV4cCI6MTczMTU3ODI0Mn0.EHJLV6OCm3FayZZlSykvFtMWVSDpn2DZCk_jGPR-rLAeZ0x3-dfTUsU5WE51AiPG',1),(114,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0OTIyMjIsImV4cCI6MTczMTU3ODYyMn0.20bkwV8uq3RCORWc7E6rhEGi_ICxAT0IDY8srikkF4x1UdPpZ185kxRKCUf3Pf7p',1),(115,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQ5MzE2NSwiZXhwIjoxNzMxNTc5NTY1fQ.Dm6d36tph4FB7lfEJI7owhmSCagFJoXaLFfQibA_lhOsxPNUZbD5EHOOi8UtWmGw',2),(116,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0OTUwNDUsImV4cCI6MTczMTU4MTQ0NX0.JkwEL8T33SOZ8_bh2fpyxvN_UrOy3dvmv6fajpbu0oIeAWG3JP_nlCwfAsIjjjNZ',1),(117,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQ5NTEzMiwiZXhwIjoxNzMxNTgxNTMyfQ.iEKPDG4-RX0OSS8UbhJ7NceJ06FfLeTK0fxYF3ShuasVzyud2UuUq4fgXtEBHocp',2),(118,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQ5ODgzMiwiZXhwIjoxNzMxNTg1MjMyfQ.qGKo1xl03NAn0Jp6yIy81xz2x_xjzBy4opiV0HDoHEyTOmktyLFiRABiWLMUYoeX',2),(119,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQ5OTUyMSwiZXhwIjoxNzMxNTg1OTIxfQ.6KRtp97JLbHW1fcsVsvEQvBqkZKp8ZsGtb6pbllcv6iufauemfVFfHagfqQ1IBT5',2),(120,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQ5OTg2NiwiZXhwIjoxNzMxNTg2MjY2fQ.5_5fZB_e88S5NMZ5Mg9rsCwJ_T93SkRVS2lXeVVnMu2yUhu4v-nuoT9s-exEKo1x',2),(121,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE1MDAxMDEsImV4cCI6MTczMTU4NjUwMX0.Zp2ajTyBjYNKMh-h64GXbT-MR33_bJznCtcPqQkP9UjmH_Q_cnSR0yAzjFPZxdSq',1),(122,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTUwMTA2OSwiZXhwIjoxNzMxNTg3NDY5fQ.iV6goE4yW4Huv7VXZ8QXx4b4YmXt-FvJLNwgRDkoXFBBwloXmSkfWTT4O8gmaYPC',2),(123,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE4MzY0NjIsImV4cCI6MTczMTkyMjg2Mn0.Yi4tQsxhoQavyv5PSB8tCs6z94pg4s47UBoIoKjvgAAHz0Kq_vwH_rGnByZpOsPJ',1),(124,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTgzNzM2NCwiZXhwIjoxNzMxOTIzNzY0fQ.Plue0NgwSeVI_5JFFBID0lmq0CPLeaIsyHElXDuRkcN82NyTj5dpM2EOqTk3zH57',2),(125,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE4Mzc0MzIsImV4cCI6MTczMTkyMzgzMn0.LKCUasH40XnuDhP3oCCfdxs6rmbgb2UciB4P_b9X0H-AWj2xLg60MWHTxqC6Wx83',1),(126,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTg0Mzg2MCwiZXhwIjoxNzMxOTMwMjYwfQ.tXu4FLfN4OPqnzK1wgJ8qp0XQpXOEF-ghLBy1IAQYwIOvTJOMe39jI613ZvnSBOY',2),(127,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVscmF6dWlkYjU5QGdtYWlsLmNvbSIsInJvbGUiOiJVU0VSIiwiaWF0IjoxNzMxODQ1NDkxLCJleHAiOjE3MzE5MzE4OTF9.FOoj0hvKVADHEkqAt0QYukXIpgys2dyonKpYf4ermCU9Pry2B9MP64SbM9b4UsaJ',3),(128,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTg0NTUxMSwiZXhwIjoxNzMxOTMxOTExfQ.oNS6fYXeyaQKV1Mr6ctarkzPce1bnPotoWmX0XILCSCo-3Z6qeoCe9ly_HZK_Ztt',2),(129,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE4NDU1MjQsImV4cCI6MTczMTkzMTkyNH0.OJlXx_0CvCTYgxcRxeUQihwTz_gX6vwI5KG7JIri6YxrUVQEUt86yVQ4KS3QstkS',1),(130,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTg0ODE3NCwiZXhwIjoxNzMxOTM0NTc0fQ.xHEZWhSb65ICh-aCKURkvD4lvnmoRJBPvA4rEunmFCIzvmf5ljV4Ss3bk8k430HP',2),(131,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTg2OTIwNywiZXhwIjoxNzMxOTU1NjA3fQ.q2GJocwgbSpDvkqiH2RwJ7xTvYOmuNoqXCOj8Tu5TSyMhd3DKj6cjt68lUo9JJKD',2),(132,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE4NjkzNDcsImV4cCI6MTczMTk1NTc0N30.afherGaWwg1viABBWOtEICotgZqpe0hfFCPeLt-hfT_44Ubwwbn5fV2gegc-4REO',1),(133,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE5MDc2NzUsImV4cCI6MTczMTk5NDA3NX0.C4B27rGD3pFJBS8wTJqAwqle3Yayw6I95lbEAZSMftNNqekjpiWpxGZxO_GZSzC7',1),(134,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTkwOTEwMCwiZXhwIjoxNzMxOTk1NTAwfQ.7fG8Qy_MO-orz10gE6iLq6Eg1Z5ZZvKCt6UBrLMhzbaHAqN0NDnOeKMZ5Ch8Yp7S',2),(135,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTkxNTAxNCwiZXhwIjoxNzMyMDAxNDE0fQ.QZGGpgHIqRsPXhYdkA78KQnl1nRDortHRCCyiczFW3ZyxCf9tPmMkpv9N4pfqqwT',2),(136,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhcmlmaXNodGlxQGdtYWlsLmNvbSIsInJvbGUiOiJVU0VSIiwiaWF0IjoxNzMxOTE1NTMyLCJleHAiOjE3MzIwMDE5MzJ9.dlXsyFONV7Rwu1JXlWANi53WxDeqghAQ6oZEQnoEiYpKmJzdDQWJl2wwQexTolLX',10),(137,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE5MTU4OTYsImV4cCI6MTczMjAwMjI5Nn0.DUW_xGqrfUkV7UYE59DCm92d0IMXaN7WWy6CtwCSAS6V1bElLwVPSB1FnC9qF1Vt',1),(138,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxMjY4NzksImV4cCI6MTczMjIxMzI3OX0.ngFoquTM7B8ObDOl9YCC5IAiW6Y9O3Ey74T2q-VKHW_AhPTtVijhlt_-nLbIurlx',1),(139,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxMjcyMDAsImV4cCI6MTczMjIxMzYwMH0.j43hTtEpmUPSr1HSI_5gD7jgon8EM1vL2cmcEtGajDY6n3cJ_jlCS-SdjrgwK7qE',1),(140,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjEzNDY0MiwiZXhwIjoxNzMyMjIxMDQyfQ.2Ca-dYRQG-LCsLjytABNQ9FkuMPKQK_QLaecc-d7rXU9UR7ghuQI9sxpxADjKofD',2),(141,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxMzQ2NTgsImV4cCI6MTczMjIyMTA1OH0.cbLFFohbrZ3gmPbjlTq_bcXmz5BZ_5N7BIX3q3io-9310qf9CjaML1raZwUVHAzn',1),(142,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjEzNTkyMiwiZXhwIjoxNzMyMjIyMzIyfQ.qfVF_rLN5Y9VMO2Q0oKr6j0ZomLeXQd8CfsNvG9QisGml9a-UOBg6R7OkKoUelJ3',2),(143,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxMzU5NDAsImV4cCI6MTczMjIyMjM0MH0.aDn2UuyF-Jznmzc7s4iuWlh4b9wiizovQs-GZ34bB72ZXVgvuFH3MGaZ-F8YWAkX',1),(144,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjEzNTk2OCwiZXhwIjoxNzMyMjIyMzY4fQ.9EN0_WQu-u2sGDFFR5zYAIHWNF4roZoEc7E2ngTi705TL6_2a9PgxnV6FYbu5gt6',2),(145,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxMzYzMTUsImV4cCI6MTczMjIyMjcxNX0.0bVR5sIZFypJdzVBg0pO5RB7r19cedvORzcVhS4frHCXLB8wsMYNnn4y8G5sjoMX',1),(146,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjEzNjM4OCwiZXhwIjoxNzMyMjIyNzg4fQ.dWPlRwB1-34mgYFOzCTrFZLlKXdEQ_iZNtWVnSRoFr40TlqT24LR-BybwMq2bwx1',2),(147,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxMzY0MzQsImV4cCI6MTczMjIyMjgzNH0.oJChUo-Eou1DvqUDmYpO5EixK3luQPTxGMCftd8IuXY-vK99UHFRwToskj5LSRj5',1),(148,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjEzNzEyNiwiZXhwIjoxNzMyMjIzNTI2fQ.2nfcMW4rGWtgLRMCnnj0gI2mD58MMjb06Ekfs1EitYN8-p4zZwb9mS_Owu5zKLCy',2),(149,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxMzcyMzAsImV4cCI6MTczMjIyMzYzMH0.f7u073nIfK_zf6faWVFwgrXts6Eof-hHZ5Cg1rAMIAeFbC8-nEVI9PH0yrAWNkEO',1),(150,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjEzNzQyMSwiZXhwIjoxNzMyMjIzODIxfQ.QVyD8CWNRi-AaQ0IUZwxxfiq99q-E5acJ9o8yrHfpVN-gITwj2q39DxjOebwDiYA',2),(151,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxMzc0NzcsImV4cCI6MTczMjIyMzg3N30.s9cnS2GsRvqbu9OCuo76-Qhs2DRUsGx3BmHVTrxqZsnLVLmoPjfYVWFPVqCuNTwy',1),(152,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjEzNzUyMSwiZXhwIjoxNzMyMjIzOTIxfQ.v3txTLlvMRPKgTyE8iMbeq_-liFjHHGyGNmSv_T2sRxBdd7UF4Fc-csG6pJBEU9d',2),(153,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxMzc4MjMsImV4cCI6MTczMjIyNDIyM30.BERO5Dm2TxGEal2q9MfpBJE0Vem7qd8p3kB8BwpeSuSjQ5ZGE9HRjMNbGAYLAXgr',1),(154,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjEzODI2OSwiZXhwIjoxNzMyMjI0NjY5fQ.pbgNHDp_oIb6SLXt982Y0aK--9pAGif-e13papaJgXL3lhXGiZcMUsPwweJstTMT',2),(155,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxMzgzOTcsImV4cCI6MTczMjIyNDc5N30.Mfk-84uycbx3n78RvscnBMBGaOeAF6esTz2gJKzWP4ksPskKWbPRJBsGwKirtOtM',1),(156,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjEzODQ2OCwiZXhwIjoxNzMyMjI0ODY4fQ.rGN4-5YvguRByxPVl6CqG3Nmx4wXxrbWh572am4-kpcTJ5nnHaCC1qiFqVqWbtLo',2),(157,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxMzk1ODYsImV4cCI6MTczMjIyNTk4Nn0.9a5XBy-AWwWSwW8BQDsmI7MPu8im45cKlRQc7hn8_Ogzwu4QtRN6lGYKYzcpBwoL',1),(158,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjE0MDIwOCwiZXhwIjoxNzMyMjI2NjA4fQ.HtcMIirF_Z1ZWM_oq-CViesNtNZnvjpQTrp-GpBZrHmkmwGbVJ8N8AxAk6yIju5H',2),(159,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxNDAyMjYsImV4cCI6MTczMjIyNjYyNn0.BEeDoRh2scC6Q4KoWdrdbr7C4EFKiH1VpXsRNu0obDbeV1R1F8Z3B5UltaIQilj9',1),(160,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjE0MTc5NSwiZXhwIjoxNzMyMjI4MTk1fQ.WfnKUPTq76unTz7tcJffoYkW2R0ybIx1acZvzGvRMdqkB-FYTvoiOH59yocYD8eU',2),(161,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjE0MjM2MSwiZXhwIjoxNzMyMjI4NzYxfQ.aRZIkC4_KEIUvMFN3Y6Jx3fF3gp8v87WwGDrNUlD6G0L6SoWCc45XWHL-OUxIeFv',2),(162,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxNDI0MjQsImV4cCI6MTczMjIyODgyNH0.OsKZ5LQM3CIrBhMiDdpNbBVCycaZCFGBeK4saBFIHG7rQsZ2UWoLf49AjTzfga_Q',1),(163,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjE0MjQ4MiwiZXhwIjoxNzMyMjI4ODgyfQ.7D94qeDDhjDM-61e6nIDmQ3yIc-0IvCrQuIyREQyvAaw-XfQVUgm2x9V_6ckDXZy',2),(164,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxNDI1MDQsImV4cCI6MTczMjIyODkwNH0.P9pVBTVolFSpDwhuYyC5P-uouDTIubwrYZtCf-pF3dZRkWj3xncxuZkuO9LKuXnE',1),(165,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxNjQ4MDIsImV4cCI6MTczMjI1MTIwMn0.U2TOsK8mqTx7MIuT0OpJ4peuR4jV_WdlCw-QKcG-ioghdtvynoN5odiaFiCuechz',1),(166,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMjE2NTI1MCwiZXhwIjoxNzMyMjUxNjUwfQ.R_yI0Zy8hSYNR_bVuC-Tq141JPLitT3UMZSYL-XYYbf3cJroVcQJlP69qWfUGQwQ',2);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `role` enum('ADMIN','USER','WAITER') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKr53o2ojjw4fikudfnsuuga336` (`password`),
  UNIQUE KEY `UKdu5v5sr43g5bfnji4vb8hg5s3` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,_binary '','Kathalbagan, Dhaka','shahriyarnirjash1996@gmail.com',NULL,'Shahriyar Nirjash','$2a$10$saYs4xMJKY.mhQoTxib1wOLV/aZ7RAuSDnYB/la6xmHW2OAxwHgvq','01784054171','ADMIN'),(2,_binary '','Kathalbagan, Dhaka','nasif.s.nirjash96@gmail.com',NULL,'Nasif Shahriar','$2a$10$D1BQAWN82ZFjOSewr1.8xONpUGTBc51KPHJiIUUyholiH5bwBARpO','01303547093','USER'),(3,_binary '','Agargaon','rafiqulrazuidb59@gmail.com','','Rafiqul ISlam','$2a$10$JeT2v27JX3PXmNe2JEk6bOzgfq/pGa/l0N9J6SjVS9kgP9ZszY47C','01775805206','USER'),(4,_binary '','Agargaon','nayamulislam@gmail.com','','nayamul Islam','$2a$10$cRW72WYe2QdjWO544Yh8AucEmjXnd6Edow.kZdbv4cRj4G2cpQR/2','01303547095','WAITER'),(5,_binary '\0','Mohammadpur','rahman.f.sadiqur@gmail.com','','Sadiqur Rahman','$2a$10$VlAqa47ZY8rHMV.t4B63c.s.Cugt7vd2PXP0DreHu9r.Yu1rNAIP6','01710938092','WAITER'),(6,_binary '\0','Kathalbagan, Dhaka','aaaaaa@gmail.com',NULL,'aaaaaaaa','$2a$10$5/lQqEqUApPTZarh923R3uEihdVjuzHm1Zsle2L/AdObZQuzTrwfC','01784054571','USER'),(7,_binary '\0','fdefdf','fdfdsfdf@fbfgv.tghftg',NULL,'fsfsdfdf','$2a$10$jeRFRt1JujLbiQfEmVtOC.6lFDwFYQTDi.2DJoJAoI4kfVI7Rx12W','63536786378','USER'),(8,_binary '\0','asdfghjkl','neyamul@gmail.com',NULL,'Mr. Neyamul Islam','$2a$10$1nCM0ntWFDcUiHL/AGI6tu8fcF9oFGgAsM4txUO5fMf2P/vAceMMG','96325874125','USER'),(9,_binary '\0','grgtert','aaaaa@aaaa.aaa',NULL,'aaaaaaaa','$2a$10$VOohZi6IZEZK65yDQR1yauKNk79pDUY7cR5t.pWAfUhLC80LtKP/S','159623487895','USER'),(10,_binary '\0','Uttara','arifishtiq@gmail.com','','Arif Ishtiaq','$2a$10$YHrBYb2obx3Vt09x7HoL0.VV6mW6R7Wrho3dZOhFK4MieEt7PAUa2','01740087827','USER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-21 11:12:14
