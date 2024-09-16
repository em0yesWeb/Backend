-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: beacon_tracker
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `beacon_scanners`
--

DROP TABLE IF EXISTS `beacon_scanners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beacon_scanners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mac_address` varchar(255) NOT NULL,
  `device_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac_address` (`mac_address`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beacon_scanners`
--

LOCK TABLES `beacon_scanners` WRITE;
/*!40000 ALTER TABLE `beacon_scanners` DISABLE KEYS */;
INSERT INTO `beacon_scanners` VALUES (1,'eac2e46a9ea2bdd2','S23'),(2,'7d785333a66f0d48','S21');
/*!40000 ALTER TABLE `beacon_scanners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_rssi_measurements`
--

DROP TABLE IF EXISTS `current_rssi_measurements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `current_rssi_measurements` (
  `scanner_id` int NOT NULL,
  `fixed_beacon_id` int NOT NULL,
  `rssi` int NOT NULL,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_measurement` (`scanner_id`,`fixed_beacon_id`),
  KEY `fixed_beacon_id` (`fixed_beacon_id`),
  CONSTRAINT `current_rssi_measurements_ibfk_1` FOREIGN KEY (`scanner_id`) REFERENCES `beacon_scanners` (`id`),
  CONSTRAINT `current_rssi_measurements_ibfk_2` FOREIGN KEY (`fixed_beacon_id`) REFERENCES `fixed_beacons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_rssi_measurements`
--

LOCK TABLES `current_rssi_measurements` WRITE;
/*!40000 ALTER TABLE `current_rssi_measurements` DISABLE KEYS */;
INSERT INTO `current_rssi_measurements` VALUES (2,7,-82,'2024-09-02 07:19:58'),(2,8,-72,'2024-09-02 07:19:47'),(2,9,-89,'2024-09-02 07:20:16');
/*!40000 ALTER TABLE `current_rssi_measurements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimated_locations`
--

DROP TABLE IF EXISTS `estimated_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estimated_locations` (
  `scanner_id` int NOT NULL,
  `floor` int NOT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `scanner_id` (`scanner_id`),
  CONSTRAINT `estimated_locations_ibfk_1` FOREIGN KEY (`scanner_id`) REFERENCES `beacon_scanners` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimated_locations`
--

LOCK TABLES `estimated_locations` WRITE;
/*!40000 ALTER TABLE `estimated_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `estimated_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_beacons`
--

DROP TABLE IF EXISTS `fixed_beacons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixed_beacons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mac_address` varchar(255) NOT NULL,
  `device_name` varchar(255) NOT NULL,
  `floor` int NOT NULL,
  `zone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac_address` (`mac_address`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_beacons`
--

LOCK TABLES `fixed_beacons` WRITE;
/*!40000 ALTER TABLE `fixed_beacons` DISABLE KEYS */;
INSERT INTO `fixed_beacons` VALUES (1,'60:98:66:33:42:D4','Beacon 1',3,'A_1'),(2,'60:98:66:32:8E:28','Beacon 2',3,'A_2'),(3,'60:98:66:32:BC:AC','Beacon 3',3,'A_3'),(4,'60:98:66:30:A9:6E','Beacon 4',3,'C_1'),(5,'60:98:66:32:CA:74','Beacon 5',3,'C_2'),(6,'60:98:66:2F:CF:9F','Beacon 6',3,'C_3'),(7,'60:98:66:32:B8:EF','Beacon 7',3,'E_3'),(8,'60:98:66:32:CA:59','Beacon 8',3,'E_2'),(9,'60:98:66:33:35:4C','Beacon 9',3,'E_1'),(10,'60:98:66:32:AF:B6','Beacon 10',3,'E_S_U'),(11,'60:98:66:33:0E:8C','Beacon 11',3,'E_S_D'),(12,'60:98:66:32:C8:E9','Beacon 12',3,'D_S'),(13,'60:98:66:32:9F:67','Beacon 13',3,'B_S'),(14,'60:98:66:33:24:44','Beacon 14',3,'A_S'),(15,'60:98:66:32:BB:CB','Beacon 15',3,'D_1'),(16,'60:98:66:32:AA:F8','Beacon 16',3,'D_2'),(17,'A0:6C:65:99:DB:7C','Beacon 17',3,'B_1'),(18,'60:98:66:32:98:58','Beacon 18',3,'B_2');
/*!40000 ALTER TABLE `fixed_beacons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rssi_measurements_YYYY_MM`
--

DROP TABLE IF EXISTS `rssi_measurements_YYYY_MM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rssi_measurements_YYYY_MM` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scanner_id` int NOT NULL,
  `fixed_beacon_id` int NOT NULL,
  `rssi` int NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `scanner_id` (`scanner_id`),
  KEY `fixed_beacon_id` (`fixed_beacon_id`),
  CONSTRAINT `rssi_measurements_YYYY_MM_ibfk_1` FOREIGN KEY (`scanner_id`) REFERENCES `beacon_scanners` (`id`),
  CONSTRAINT `rssi_measurements_YYYY_MM_ibfk_2` FOREIGN KEY (`fixed_beacon_id`) REFERENCES `fixed_beacons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rssi_measurements_YYYY_MM`
--

LOCK TABLES `rssi_measurements_YYYY_MM` WRITE;
/*!40000 ALTER TABLE `rssi_measurements_YYYY_MM` DISABLE KEYS */;
/*!40000 ALTER TABLE `rssi_measurements_YYYY_MM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2024-09-05  0:03:18
