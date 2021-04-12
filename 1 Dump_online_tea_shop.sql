-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: online_tea_shop
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tea_name` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название',
  `tea_categories_id` int unsigned NOT NULL,
  `manufacturers_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_catalog_manufacturers1_idx` (`manufacturers_id`),
  KEY `fk_catalog_tea_categories1_idx` (`tea_categories_id`),
  CONSTRAINT `fk_catalog_manufacturers1` FOREIGN KEY (`manufacturers_id`) REFERENCES `manufacturers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_catalog_tea_categories1` FOREIGN KEY (`tea_categories_id`) REFERENCES `tea_categories` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,'Шу пуэр',1,1),(2,'Шен пуэр',1,1),(3,'Цейлон крупнолистовой',2,3),(4,'Цейлон мелколистовой',2,3),(5,'Уишань Хун Ча',2,1),(6,'Чжанпин Хун Ча',2,1),(7,'Кимун',2,1),(8,'Фо Шоу',3,1),(9,'Ши Жу',3,1),(10,'Мао Се',3,1),(11,'Цзюнь Шань Инь Чжень',4,1),(12,'Кукича',5,4),(13,'Ходзича',5,4),(14,'Матча',5,4),(15,'Лун Цзин',5,1),(16,'Генмайча',6,4),(17,'Иван-чай',6,2),(18,'Травы горного Крыма ',6,2),(19,'Алтайский букет',6,2);
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_courier`
--

DROP TABLE IF EXISTS `delivery_courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_courier` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `courier_name` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_courier_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_list_delivery_` (`courier_name`),
  KEY `fk_delivery_courier_region_courier1_idx` (`region_courier_id`),
  CONSTRAINT `fk_delivery_courier_region_courier1` FOREIGN KEY (`region_courier_id`) REFERENCES `region_courier` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_courier`
--

LOCK TABLES `delivery_courier` WRITE;
/*!40000 ALTER TABLE `delivery_courier` DISABLE KEYS */;
INSERT INTO `delivery_courier` VALUES (1,'Василий Иванов',1),(2,'Василий Иванов',2),(3,'Василий Иванов',3),(4,'Николай Стульев',4),(5,'Николай Стульев',5),(6,'Николай Стульев',6),(7,'Терентий Звонов',7),(8,'Терентий Звонов',8),(9,'Терентий Звонов',9),(10,'Геннадий Борисов',10),(11,'Геннадий Борисов',11),(12,'Геннадий Борисов',12);
/*!40000 ALTER TABLE `delivery_courier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_payment_method`
--

DROP TABLE IF EXISTS `delivery_payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_payment_method` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `delivery_method` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_delivery_payment_method_payment1_idx` (`payment_id`),
  CONSTRAINT `fk_delivery_payment_method_payment1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_payment_method`
--

LOCK TABLES `delivery_payment_method` WRITE;
/*!40000 ALTER TABLE `delivery_payment_method` DISABLE KEYS */;
INSERT INTO `delivery_payment_method` VALUES (1,'Курьер',1),(2,'Курьер',2),(3,'Курьер',3),(5,'Пункт выдачи',1),(6,'Пункт выдачи',2),(7,'Пункт выдачи',3),(8,'Постамат',1);
/*!40000 ALTER TABLE `delivery_payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_pick-up_point`
--

DROP TABLE IF EXISTS `delivery_pick-up_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_pick-up_point` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pick-up_point_name` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_pick-up_point_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_list_delivery_pick-up_point1` (`pick-up_point_name`),
  KEY `fk_delivery_pick-up_point_region_pick-up_point2_idx` (`region_pick-up_point_id`),
  CONSTRAINT `fk_delivery_pick-up_point_region_pick-up_point2` FOREIGN KEY (`region_pick-up_point_id`) REFERENCES `region_pick-up_point` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_pick-up_point`
--

LOCK TABLES `delivery_pick-up_point` WRITE;
/*!40000 ALTER TABLE `delivery_pick-up_point` DISABLE KEYS */;
INSERT INTO `delivery_pick-up_point` VALUES (1,'Экспресс','Ул. Пятницкая, 12с4',1),(2,'Бегунок','Ул. Флотская, 74',2),(3,'Кролик','Ул. Мусоргского, 5к3',3),(4,'Стрелка','Ул. Первомайская, 32/23',4),(5,'Сервис','Ул. Подольских Курсантов, 22Бс5',5),(6,'Кролик','Очаковское шоссе, 17к2',6),(7,'Бегунок','Зеленоград, К920',7),(8,'Стрелка','Троицк, мкр-н В, 23А',8),(9,'Экспресс','Коммунарка, 22',9);
/*!40000 ALTER TABLE `delivery_pick-up_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_postamat`
--

DROP TABLE IF EXISTS `delivery_postamat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_postamat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `postamat_name` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_postamate_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_list_delivery_postamat1` (`postamat_name`),
  KEY `fk_delivery_postamat_region_postamate1_idx` (`region_postamate_id`),
  CONSTRAINT `fk_delivery_postamat_region_postamate1` FOREIGN KEY (`region_postamate_id`) REFERENCES `region_postamate` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_postamat`
--

LOCK TABLES `delivery_postamat` WRITE;
/*!40000 ALTER TABLE `delivery_postamat` DISABLE KEYS */;
INSERT INTO `delivery_postamat` VALUES (1,'Point','Ул. Кузнецкий Мост, 19с2',1),(2,'Point','ул. Нарвская, 2с3',2),(3,'Point','Ул. Фортунатовская, 17',3),(4,'Point','Варшавское шоссе, 132с7',4),(5,'Посылочка','Ленинский пр-т, 130к1',5),(6,'Посылочка','Зеленоград, Георгиевский пр-т, 1934',6),(7,'Посылочка','Троицк, ул. Спортивная, 9',7),(8,'Посылочка','Марьино, ул. Берёзовая, 4',8);
/*!40000 ALTER TABLE `delivery_postamat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `full_product_description`
--

DROP TABLE IF EXISTS `full_product_description`;
/*!50001 DROP VIEW IF EXISTS `full_product_description`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `full_product_description` AS SELECT 
 1 AS `tea_name`,
 1 AS `country`,
 1 AS `category`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Страна',
  PRIMARY KEY (`id`),
  KEY `fk_catalog_manufacturers` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Китай'),(2,'Россия'),(3,'Шри-Ланка'),(4,'Япония');
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_customer`
--

DROP TABLE IF EXISTS `new_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_customer` (
  `id` int NOT NULL,
  `name` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint NOT NULL,
  `created_at` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NOW()',
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_customer`
--

LOCK TABLES `new_customer` WRITE;
/*!40000 ALTER TABLE `new_customer` DISABLE KEYS */;
INSERT INTO `new_customer` VALUES (31,'Кристина Сидорова','ж','qqq@mail.ru',79035675583,'2021-04-06 18:28:27'),(31,'Мария Дёмина','ж','sdhvfu@mail.ru',79037772233,'2021-04-06 18:21:44'),(32,'Елена Димина','ж','sgsdfb@mail.ru',79045555577,'2021-04-06 18:24:01');
/*!40000 ALTER TABLE `new_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_catalog` int unsigned NOT NULL,
  `delivery_address` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_region` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customers_id` int unsigned DEFAULT NULL,
  `payment_id` int unsigned DEFAULT NULL,
  `delivery_courier_id` int unsigned DEFAULT NULL,
  `delivery_pick-up_point_id` int unsigned DEFAULT NULL,
  `delivery_postamat_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_list_registered_customers1_idx` (`customers_id`),
  KEY `fk_order_list_catalog1_idx` (`id_catalog`),
  KEY `fk_order_list_delivery_payment_method1_idx` (`payment_id`),
  KEY `fk_order_list_delivery_courier1_idx` (`delivery_courier_id`),
  KEY `fk_order_list_delivery_pick-up_point1_idx` (`delivery_pick-up_point_id`),
  KEY `fk_order_list_delivery_postamat1_idx` (`delivery_postamat_id`),
  CONSTRAINT `fk_order_list_catalog1` FOREIGN KEY (`id_catalog`) REFERENCES `catalog` (`id`),
  CONSTRAINT `fk_order_list_delivery_courier1` FOREIGN KEY (`delivery_courier_id`) REFERENCES `delivery_courier` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_order_list_delivery_payment_method1` FOREIGN KEY (`payment_id`) REFERENCES `delivery_payment_method` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_order_list_delivery_pick-up_point1` FOREIGN KEY (`delivery_pick-up_point_id`) REFERENCES `delivery_pick-up_point` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_order_list_delivery_postamat1` FOREIGN KEY (`delivery_postamat_id`) REFERENCES `delivery_postamat` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_order_list_registered_customers1` FOREIGN KEY (`customers_id`) REFERENCES `registered_customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` VALUES (1,'2021-04-01 18:23:22','На стадии формирования',12,'Ул. Пятницкая, 12с4','Москва, ЦАО',1,1,NULL,1,NULL),(2,'2121-03-13 15:25:11','Передан в доставку',14,'Ул. Нарвская, 2с3','Москва, САО',4,1,NULL,NULL,2),(3,'2021-04-01 09:04:23','На стадии формирования',1,'Ул. Флотская, 74','Москва, САО',13,1,NULL,2,NULL),(4,'2020-12-30 09:26:11','Завершен',6,'Ленинский пр-т, 130к1','Москва, ЗАО',6,1,NULL,NULL,5),(5,'2021-04-01 16:23:14','Передан в доставку',2,'Ул. Мусоргского, 11Б','Москва, СВАО',8,2,3,NULL,NULL),(6,'2021-04-01 23:33:21','На стадии формирования',17,'Ул. Пятницкая, 12с4','Москва, ЦАО',1,1,NULL,1,NULL),(7,'2021-04-01 23:44:12','Передан в доставку',17,'Ул. Каховка, 14к2','Москва, ЮЗАО',22,2,7,NULL,NULL),(8,'2021-04-01 16:29:00','Передан в доставку',14,'Ленинский пр-т, 130к1','Москва, ЗАО',27,1,NULL,NULL,5),(9,'2021-01-02 15:38:41','Завершен',1,'Варшавское шоссе, 132с7','Москва, ЮАО',8,1,NULL,NULL,4),(10,'2021-04-01 17:32:46','На стадии формирования',13,'Ул. Первомайская, 32/23','Москва, ВАО',12,2,NULL,4,NULL),(11,'2021-04-01 12:32:54','Передан в доставку',2,'Ул. Ращупкина, 7','Москва, СЗАО',2,3,9,NULL,NULL),(12,'2021-04-01 13:32:26','Передан в доставку',19,'Ул. Фортунатовская, 17','Москва, ВАО',5,1,NULL,NULL,3),(13,'2021-04-01 04:32:54','На стадии формирования',11,'Варшавское шоссе, 132с7','Москва, ЮАО',7,1,NULL,NULL,4),(14,'2020-12-10 23:34:21','Завершен',3,'Ул. Фортунатовская, 17','Москва, ВАО',5,1,NULL,NULL,3),(15,'2021-04-01 15:24:22','Передан в доставку',1,'Ул. Шкулёва, 17','Москва, ЮВАО',9,3,5,NULL,NULL),(16,'2021-04-01 21:23:09','Передан в доставку',5,'Марьино, ул. Берёзовая, 4','Москва, Новомосковский',18,1,NULL,NULL,8),(17,'2021-04-01 14:35:21','На стадии формирования',14,'Ул. Флотская, 74','Москва, САО',26,3,NULL,2,NULL),(18,'2021-04-01 13:54:10','Передан в доставку',7,'Очаковское шоссе, 17к2','Москва, ЗАО',30,3,NULL,6,NULL),(19,'2020-12-01 15:31:56','Завершен',1,'Ул. Пятницкая, 12с4','Москва, ЦАО',1,1,NULL,1,NULL),(20,'2021-04-01 14:27:46','Передан в доставку',10,'Ул. Флотская, 74','Москва, САО',17,3,NULL,2,NULL),(21,'2021-04-01 13:24:22','На стадии формирования',3,'Марьино, ул. Берёзовая, 4','Москва, Новомосковский',18,1,NULL,NULL,8),(22,'2020-12-20 11:59:12','Завершен',17,'Ул. Пятницкая, 12с4','Москва, ЦАО',10,1,NULL,1,NULL),(23,'2021-04-01 12:15:21','Передан в доставку',14,'Ул. Подольских Курсантов, 22Бс5','Москва, ЮАО',14,3,NULL,5,NULL),(24,'2020-12-15 12:04:38','Завершен',18,'Ул. Флотская, 74','Москва, САО',17,3,NULL,2,NULL),(25,'2021-04-01 23:40:04','На стадии формирования',9,'Ул. Подольских Курсантов, 22Бс5','Москва, ЮАО',14,3,NULL,5,NULL),(26,'2021-04-01 12:26:55','Передан в доставку',15,'Ул. Фортунатовская, 17','Москва, ВАО',5,1,NULL,NULL,3),(27,'2021-04-01 14:38:32','Передан в доставку',11,'Очаковское шоссе, 17к2','Москва, ЗАО',29,3,NULL,6,NULL),(28,'2020-12-16 12:23:10','Завершен',8,'Ул. Пятницкая, 12с4','Москва, ЦАО',1,1,NULL,1,NULL),(29,'2021-04-01 20:33:29','Передан в доставку',4,'Ул. Первомайская, 32/23','Москва, ВАО',26,3,NULL,4,NULL),(30,'2021-04-01 21:34:14','На стадии формирования',16,'Очаковское шоссе, 17к2','Москва, ЗАО',28,3,NULL,6,NULL);
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_of_shop` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Магазины-партнеры, которые можно рекомендовать покупателям по связке partners\n.partner_region - order_list.delivery_region\n',
  `address` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner_region` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_group_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_list_partners1` (`partner_region`),
  KEY `fk_partners_social_group1_idx` (`social_group_id`),
  CONSTRAINT `fk_partners_social_group1` FOREIGN KEY (`social_group_id`) REFERENCES `social_group` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
INSERT INTO `partners` VALUES (1,'Чаепитие','Крестовоздвиженский переулок, 2с1','Москва, ЦАО',2),(2,'Чай, кофе, сладости','Ленинградский проспект, 60А','Москва, САО',3),(3,'Чаепитие','1-я Владимирская улица, 15к2','Москва, ВАО',2),(4,'Чай, кофе, сладости','Азовская улица, 4','Москва, ЮАО',3),(5,'Лучший чай (ТРЦ Европейский)','Площадь Киевского Вокзала, 2','Москва, ЗАО',1);
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `means_of_payment` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_delivery_payment_method_payment1` (`payment_method`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Предоплата','Google Pay/Apple Pay'),(2,'Наличными при получении','Рубли'),(3,'Картой при получении','Visa/Mastercard');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_courier`
--

DROP TABLE IF EXISTS `region_courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region_courier` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `region_name_courier` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_courier`
--

LOCK TABLES `region_courier` WRITE;
/*!40000 ALTER TABLE `region_courier` DISABLE KEYS */;
INSERT INTO `region_courier` VALUES (1,'Москва, ЦАО'),(2,'Москва, САО'),(3,'Москва, СВАО'),(4,'Москва, ВАО'),(5,'Москва, ЮВАО'),(6,'Москва, ЮАО'),(7,'Москва, ЮЗАО'),(8,'Москва, ЗАО'),(9,'Москва, СЗАО'),(10,'Москва, Зеленоградский'),(11,'Москва, Троицкий'),(12,'Москва, Новомосковский');
/*!40000 ALTER TABLE `region_courier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_pick-up_point`
--

DROP TABLE IF EXISTS `region_pick-up_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region_pick-up_point` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_pick-up_point` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_name_pick-up_point` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_pick-up_point`
--

LOCK TABLES `region_pick-up_point` WRITE;
/*!40000 ALTER TABLE `region_pick-up_point` DISABLE KEYS */;
INSERT INTO `region_pick-up_point` VALUES (1,'Ул. Пятницкая, 12с4','Москва, ЦАО'),(2,'Ул. Флотская, 74','Москва, САО'),(3,'Ул. Мусоргского, 5к3','Москва, СВАО'),(4,'Ул. Первомайская, 32/23','Москва, ВАО'),(5,'Ул. Подольских Курсантов, 22Бс5','Москва, ЮАО'),(6,'Очаковское шоссе, 17к2','Москва, ЗАО'),(7,'Зеленоград, К920','\"Москва, Зеленоградский\n\"'),(8,'Троицк, мкр-н В, 23А','Москва, Троицкий'),(9,'Коммунарка, 22','\"Москва, \nНовомосковский\"');
/*!40000 ALTER TABLE `region_pick-up_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_postamate`
--

DROP TABLE IF EXISTS `region_postamate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region_postamate` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_postamate` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_name_postamate` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_postamate`
--

LOCK TABLES `region_postamate` WRITE;
/*!40000 ALTER TABLE `region_postamate` DISABLE KEYS */;
INSERT INTO `region_postamate` VALUES (1,'Ул. Кузнецкий Мост, 19с2','Москва, ЦАО'),(2,'ул. Нарвская, 2с3','Москва, САО'),(3,'Ул. Фортунатовская, 17','Москва, ВАО'),(4,'Варшавское шоссе, 132с7','Москва, ЮАО'),(5,'Ленинский пр-т, 130к1','Москва, ЗАО'),(6,'Зеленоград, Георгиевский пр-т, 1934','Москва, Зеленоградский'),(7,'Троицк, ул. Спортивная, 9','Москва, Троицкий'),(8,'Марьино, ул. Берёзовая, 4','Москва, Новомосковский');
/*!40000 ALTER TABLE `region_postamate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registered_customers`
--

DROP TABLE IF EXISTS `registered_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registered_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint NOT NULL,
  `password_hash` char(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `social_group_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `fk_registered_customers_social_group1_idx` (`social_group_id`),
  CONSTRAINT `fk_registered_customers_social_group1` FOREIGN KEY (`social_group_id`) REFERENCES `social_group` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registered_customers`
--

LOCK TABLES `registered_customers` WRITE;
/*!40000 ALTER TABLE `registered_customers` DISABLE KEYS */;
INSERT INTO `registered_customers` VALUES (1,'Екатерина','Филатова','ж','1990-03-21','ase@mail.ru',79035512355,'6d48fc94aa8143b3bc62239c2fa8c50f302c6ee8','2007-12-11 01:12:00','2021-04-05 21:21:00',NULL,1),(2,'Олег','Потехин','м','1978-04-30','fgd@mail.ru',79035555556,'df17529aa7ddacaade8c47394c56fd437fbfeb9e','2008-12-20 07:01:09','2021-04-05 21:21:00',NULL,3),(3,'Павел','Сизов','м','1986-12-23','123@mail.ru',79031346557,'9df72e2f816aeccd925b0712022a8665937a79da','2010-11-23 13:04:24','2021-04-05 21:21:00',NULL,2),(4,'Ксения','Круглова','ж','1988-09-11','erkl@mail.ru',79033685558,'c35e7a95777ec80ce7a1852b6a7a4a092c3221b8','2020-08-25 18:33:21','2021-04-05 21:21:00',NULL,1),(5,'Виктор','Квадратов','м','2000-04-30','hhkmlk@mail.ru',79033764559,'94aeb50aaa122b2e4ec476b2bde7eb6f76d8bbd9','2021-02-01 12:22:56','2021-04-05 21:21:00',NULL,1),(6,'Мирослава','Дмитриева','ж','1993-10-26','tgfghjm@mail.ru',79031555560,'401796a96500a4f026491ed9109e36a0601e1edf','2011-03-18 23:45:44','2021-04-05 21:21:00',NULL,1),(7,'Евгений','Степанов','м','1983-08-27','444@mail.ru',79035445561,'7d79706867319ec398dd22c65aba741ec738deb3','2019-02-15 15:37:58','2021-04-05 21:21:00',NULL,3),(8,'Станислав','Трубов','м','1955-02-28','i8t@mail.ru',79031235562,'b172a0237c1addb86b896cbc2d1fe9911352dce3','2009-04-12 12:03:45','2021-04-05 22:09:06',NULL,NULL),(9,'Галина','Иванова','ж','1985-05-25','h5r@mail.ru',79038765563,'bd2fca9cd731bc071140e7070ebab540a673ff14','2008-03-22 12:10:11','2021-04-05 21:21:00',NULL,1),(10,'Мила','Дронова','ж','1977-02-01','jhlk@mail.ru',79031235564,'c78bbf484c9be5b2d407a7e347547fec030482c5','2015-09-10 16:13:26','2021-04-05 21:21:00',NULL,2),(11,'Анатолий','Гвоздев','м','1984-12-26','j65r@mail.ru',79035550565,'c1e03e421974f851d4ee2e1156e0edf372901b1d','2015-04-21 15:39:02','2021-04-05 21:21:00',NULL,3),(12,'Елизавета','Снегина','ж','2001-09-09','nhgyjn@mail.ru',79035000066,'6150b076e96865d70407dfd710b8a0c394a1cc46','2018-03-20 23:27:45','2021-04-05 21:21:00',NULL,1),(13,'Елена','Разина','м','1995-12-05','nh@mail.ru',79031111567,'4d62808986f3981e75c3135cba3c48417fa8f157','2020-06-14 23:36:47','2021-04-05 21:21:00',NULL,2),(14,'Владимир','Палов','м','1950-07-04','rjjl@mail.ru',79032222568,'5cf873e21618c75b0ff75b4093212b02379f3770','2020-05-25 21:15:43','2021-04-05 21:21:00',NULL,3),(15,'Евгения','Трунина','ж','1968-06-17','iu@mail.ru',79033678569,'ba4bc1601ef27ad0a2009a7816fa60f3877f4a62','2020-12-23 15:37:57','2021-04-05 21:21:00',NULL,2),(16,'Филипп','Лучезаров','м','1971-11-19','sjdnk@mail.ru',79035540570,'ee83acc1da89de46a9c39f585f112064794deea8','2020-08-16 22:00:15','2021-04-05 21:21:00',NULL,3),(17,'Алексей','Вольнов','м','1991-01-23','h34@mail.ru',79030945571,'5738893ccc21d8a2254b1cb04e42f9666ba0d85f','2020-09-28 22:18:07','2021-04-05 21:21:00',NULL,1),(18,'Татьяна','Зорина','ж','2002-11-10','nkj@mail.ru',79035668572,'d65d1156d5bf3826d2ac889941a228bf1ba2d92d','2020-09-13 16:16:08','2021-04-05 21:21:00',NULL,1),(19,'Наталья','Алексеева','ж','1940-09-30','4kr@mail.ru',79035995573,'285996e0b424010d5b2591184d156d87fa6064e8','2019-10-26 21:00:38','2021-04-05 22:09:06',NULL,NULL),(20,'Артём','Великов','м','1980-12-23','jsio@mail.ru',79035555574,'42a53d549f8bea606c9f47ac5ad81b35ef7bb12e','2019-01-28 15:26:25','2021-04-05 21:21:00',NULL,3),(21,'Маргарита','Пирогова','м','1997-03-28','83j@mail.ru',79039645575,'efd678a21b1df0c5b84cd35e435a71220da481fc','2021-03-03 23:25:37','2021-04-05 21:21:00',NULL,1),(22,'Виолета','Зимова','ж','1989-05-13','yehw@mail.ru',79035777776,'bd46be9d793b05df8ae959324bc65cde630f98f4','2021-02-06 21:03:25','2021-04-05 21:21:00',NULL,2),(23,'Дмитрий','Печкин','м','1998-10-24','3jd@mail.ru',79035555577,'9b21c94d3c5ba574358bd2cfc0b8a69cebb77165','2021-01-18 22:03:15','2021-04-05 21:21:00',NULL,1),(24,'Павел','Хазанов','м','2000-05-03','74ue@mail.ru',79039995578,'70c3d2e9b0b8f87c9235e287ad79df21b5204a7e','2020-12-24 21:02:36','2021-04-05 21:21:00',NULL,1),(25,'Раиса','Милова','ж','1984-03-15','wey@mail.ru',79034333579,'fcb42a198a449519ebdd0b306ec1fa2b1cbd7ffb','2017-03-27 17:34:02','2021-04-05 21:21:00',NULL,3),(26,'Эдуард','Ларионов','м','1990-10-12','w83e@mail.ru',79038734580,'8644a7015ae6b2195ad1eb85ed0e1e71e6e48d59','2020-09-29 20:01:03','2021-04-05 21:21:00',NULL,1),(27,'Лилия','Журова','ж','1999-08-26','7wy@mail.ru',79038495581,'f241aea5e4f21c523aa33f631a33b1c1e32bcfc0','2021-01-17 02:04:26','2021-04-05 21:21:00',NULL,3),(28,'Лариса','Кротова','ж','2001-09-20','asd@mail.ru',79035555582,'587dfe3b4b7a5de1549de51a2b239e1008015209','2020-11-26 21:26:02','2021-04-05 21:21:00',NULL,1),(29,'Юрий','Петров','м','2000-04-13','4gd@mail.ru',79035885583,'372056219b01cf6a675e483705109636f4b6998b','2013-08-20 15:40:39','2021-04-05 21:21:00',NULL,2),(30,'Кристина','Сидорова','ж','2000-05-13','779@mail.ru',79035675584,'5d5439cdef16080f4d06078af0ae693f060f6311','2020-03-16 18:06:31','2021-04-05 21:21:00',NULL,1);
/*!40000 ALTER TABLE `registered_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_group`
--

DROP TABLE IF EXISTS `social_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_group` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_network` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_partners_social_group` (`group_name`) /*!80000 INVISIBLE */
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_group`
--

LOCK TABLES `social_group` WRITE;
/*!40000 ALTER TABLE `social_group` DISABLE KEYS */;
INSERT INTO `social_group` VALUES (1,'My_tea','Instagram'),(2,'Чаёк','VK'),(3,'Tea_is_great','Facebook');
/*!40000 ALTER TABLE `social_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tea_categories`
--

DROP TABLE IF EXISTS `tea_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tea_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Категория',
  `description` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Описание',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_UNIQUE` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tea_categories`
--

LOCK TABLES `tea_categories` WRITE;
/*!40000 ALTER TABLE `tea_categories` DISABLE KEYS */;
INSERT INTO `tea_categories` VALUES (1,'Пуэр','Постферментированный чай. Древесно-земляной аромат, терпкий насыщенный вкус.'),(2,'Красный','Полностьюферментированный чай. Насыщенный бархатный вкус.'),(3,'Улун','Полуферментированный чай. Своим букетом улун напоминает зеленые чай, а насыщенностью вкуса – красный.'),(4,'Желтый','Слабоферментированный чай. Производится с обязательной процедурой томления, которая и обеспечивает ему неповторимый вкус.'),(5,'Зеленый','Чай, подвергнутый минимальной ферментации, благодаря чему в нем остается большинство полезных веществ. Обладает приятным и изысканным вкусом.'),(6,'Травяной','Чай, собранный из различных трав, цветов, специй, корней, других природных элементов. Хорошо помогает для поддержания иммунитета и природной энергии.');
/*!40000 ALTER TABLE `tea_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'online_tea_shop'
--

--
-- Final view structure for view `full_product_description`
--

/*!50001 DROP VIEW IF EXISTS `full_product_description`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `full_product_description` AS select `c`.`tea_name` AS `tea_name`,`m`.`country` AS `country`,`t`.`category` AS `category`,`t`.`description` AS `description` from ((`catalog` `c` left join `manufacturers` `m` on((`m`.`id` = `c`.`manufacturers_id`))) left join `tea_categories` `t` on((`t`.`id` = `c`.`tea_categories_id`))) */;
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

-- Dump completed on 2021-04-07 13:30:22
