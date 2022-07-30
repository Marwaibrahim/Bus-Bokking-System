-- MySQL dump 10.13  Distrib 5.7.39, for Linux (x86_64)
--
-- Host: localhost    Database: booking_system
-- ------------------------------------------------------
-- Server version	5.7.39-0ubuntu0.18.04.2

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
-- Table structure for table `bus_seates`
--

DROP TABLE IF EXISTS `bus_seates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_seates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seat_number` int(11) NOT NULL,
  `booked` tinyint(1) NOT NULL DEFAULT '0',
  `bus_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bus_seates_bus_id_foreign` (`bus_id`),
  KEY `bus_seates_seat_number_bus_id_index` (`seat_number`,`bus_id`),
  CONSTRAINT `bus_seates_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_seates`
--

LOCK TABLES `bus_seates` WRITE;
/*!40000 ALTER TABLE `bus_seates` DISABLE KEYS */;
INSERT INTO `bus_seates` VALUES (1,1,1,2,NULL,NULL,NULL),(2,2,1,2,NULL,NULL,NULL),(3,3,1,2,NULL,NULL,NULL),(4,4,1,2,NULL,NULL,NULL),(5,5,1,2,NULL,NULL,NULL),(6,6,1,2,NULL,NULL,NULL),(7,7,1,2,NULL,NULL,NULL),(8,8,1,2,NULL,NULL,NULL),(9,9,1,2,NULL,NULL,NULL),(10,10,0,2,NULL,NULL,NULL),(11,11,0,2,NULL,NULL,NULL),(12,12,0,2,NULL,NULL,NULL),(13,1,1,1,NULL,NULL,NULL),(14,2,1,1,NULL,NULL,NULL),(15,3,1,1,NULL,NULL,NULL),(16,4,1,1,NULL,NULL,NULL),(17,5,1,1,NULL,NULL,NULL),(18,6,1,1,NULL,NULL,NULL),(19,7,1,1,NULL,NULL,NULL),(20,8,1,1,NULL,NULL,NULL),(21,9,1,1,NULL,NULL,NULL),(22,10,0,1,NULL,NULL,NULL),(23,11,0,1,NULL,NULL,NULL),(24,12,0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bus_seates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `car_plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buses`
--

LOCK TABLES `buses` WRITE;
/*!40000 ALTER TABLE `buses` DISABLE KEYS */;
INSERT INTO `buses` VALUES (1,'ABC 123',NULL,NULL,NULL),(2,'DEF 456',NULL,NULL,NULL);
/*!40000 ALTER TABLE `buses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Alexandria',NULL,NULL,NULL),(2,'Gizeh',NULL,NULL,NULL),(3,'Shubra El-Kheima',NULL,NULL,NULL),(4,'Port Said',NULL,NULL,NULL),(5,'Cairo',NULL,NULL,NULL),(6,'Suez',NULL,NULL,NULL),(7,'Luxor',NULL,NULL,NULL),(8,'al-Mansura',NULL,NULL,NULL),(9,'El-Mahalla El-Kubra',NULL,NULL,NULL),(10,'Tanta',NULL,NULL,NULL),(11,'Asyut',NULL,NULL,NULL),(12,'Ismailia',NULL,NULL,NULL),(13,'Fayyum',NULL,NULL,NULL),(14,'Zagazig',NULL,NULL,NULL),(15,'Aswan',NULL,NULL,NULL),(16,'Damietta',NULL,NULL,NULL),(17,'Damanhur',NULL,NULL,NULL),(18,'al-Minya',NULL,NULL,NULL),(19,'Beni Suef',NULL,NULL,NULL),(20,'Qena',NULL,NULL,NULL),(21,'Sohag',NULL,NULL,NULL),(22,'Hurghada',NULL,NULL,NULL),(23,'6th of October City',NULL,NULL,NULL),(24,'Shibin El Kom',NULL,NULL,NULL),(25,'Tanta',NULL,NULL,NULL),(26,'Banha',NULL,NULL,NULL),(27,'Tanta',NULL,NULL,NULL),(28,'Kafr el-Sheikh',NULL,NULL,NULL),(29,'Tanta',NULL,NULL,NULL),(30,'Arish',NULL,NULL,NULL),(31,'Mallawi',NULL,NULL,NULL),(32,'10th of Ramadan City',NULL,NULL,NULL),(33,'Bilbais',NULL,NULL,NULL),(34,'Marsa Matruh',NULL,NULL,NULL),(35,'Idfu',NULL,NULL,NULL),(36,'Mit Ghamr',NULL,NULL,NULL),(37,'Al-Hamidiyya',NULL,NULL,NULL),(38,'Desouk',NULL,NULL,NULL),(39,'Qalyub',NULL,NULL,NULL),(40,'Abu Kabir',NULL,NULL,NULL),(41,'Kafr el-Dawwar',NULL,NULL,NULL),(42,'Girga',NULL,NULL,NULL),(43,'Akhmim',NULL,NULL,NULL),(44,'Matareya',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (5,'2022_07_28_175839_create_subscriber_table',1),(23,'2022_07_28_211910_create_cities_table',2),(79,'2014_10_12_000000_create_users_table',3),(80,'2014_10_12_100000_create_password_resets_table',3),(81,'2019_08_19_000000_create_failed_jobs_table',3),(82,'2019_12_14_000001_create_personal_access_tokens_table',3),(83,'2022_07_28_175839_create_subscribers_table',3),(84,'2022_07_28_213248_create_cities_table',3),(85,'2022_07_29_171036_create_buses_table',3),(86,'2022_07_29_171155_create_trips_table',3),(87,'2022_07_29_172101_create_bus_seates_table',3),(88,'2022_07_29_172905_create_trip_cities_table',3),(89,'2022_07_29_173421_create_user_trips_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscribers_email_unique` (`email`),
  UNIQUE KEY `subscribers_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
INSERT INTO `subscribers` VALUES (1,NULL,'Marwa','MarwaIbrahim@m.com',NULL,'$2y$10$zUFE/oGiRnOgf5u/0BorUu/VX8LkZJtFzrFfuZAViwofmYJSAix9u',NULL,'2022-07-30 10:21:00','2022-07-30 10:21:00',NULL);
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip_cities`
--

DROP TABLE IF EXISTS `trip_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trip_cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trip_id` int(10) unsigned NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_cities_trip_id_foreign` (`trip_id`),
  KEY `trip_cities_city_id_foreign` (`city_id`),
  CONSTRAINT `trip_cities_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trip_cities_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_cities`
--

LOCK TABLES `trip_cities` WRITE;
/*!40000 ALTER TABLE `trip_cities` DISABLE KEYS */;
INSERT INTO `trip_cities` VALUES (1,1,5,1,NULL,NULL,NULL),(2,1,20,4,NULL,NULL,NULL),(3,1,26,2,NULL,NULL,NULL),(4,1,36,3,NULL,NULL,NULL),(5,2,39,3,NULL,NULL,NULL),(6,2,10,1,NULL,NULL,NULL),(7,2,26,2,NULL,NULL,NULL),(8,2,5,4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `trip_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `depature` int(10) unsigned NOT NULL,
  `destenation` int(10) unsigned NOT NULL,
  `bus_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trips_bus_id_foreign` (`bus_id`),
  KEY `trips_depature_foreign` (`depature`),
  KEY `trips_destenation_foreign` (`destenation`),
  CONSTRAINT `trips_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trips_depature_foreign` FOREIGN KEY (`depature`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trips_destenation_foreign` FOREIGN KEY (`destenation`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,'this trip from cairo to Mansoura',5,20,1,NULL,NULL,NULL),(2,'this trip from cairo to Giza',10,5,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_trips`
--

DROP TABLE IF EXISTS `user_trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_trips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trip_id` int(10) unsigned NOT NULL,
  `seat_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `depature` int(10) unsigned NOT NULL,
  `destenation` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_trips_trip_id_foreign` (`trip_id`),
  KEY `user_trips_seat_id_foreign` (`seat_id`),
  KEY `user_trips_user_id_foreign` (`user_id`),
  KEY `user_trips_depature_foreign` (`depature`),
  KEY `user_trips_destenation_foreign` (`destenation`),
  CONSTRAINT `user_trips_depature_foreign` FOREIGN KEY (`depature`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_trips_destenation_foreign` FOREIGN KEY (`destenation`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_trips_seat_id_foreign` FOREIGN KEY (`seat_id`) REFERENCES `bus_seates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_trips_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_trips_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `subscribers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_trips`
--

LOCK TABLES `user_trips` WRITE;
/*!40000 ALTER TABLE `user_trips` DISABLE KEYS */;
INSERT INTO `user_trips` VALUES (1,1,24,1,26,36),(2,1,24,1,36,20),(3,1,24,1,5,26),(4,1,24,1,5,26),(5,1,23,1,5,26),(6,1,23,1,26,20),(7,1,22,1,5,20);
/*!40000 ALTER TABLE `user_trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2022-07-30 19:49:07
