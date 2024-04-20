-- MariaDB dump 10.19-11.3.2-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: perasper
-- ------------------------------------------------------
-- Server version	8.0.2-dmr

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES
('DoctrineMigrations\\Version20240420114622','2024-04-20 11:46:29',720),
('DoctrineMigrations\\Version20240420114830','2024-04-20 11:48:34',98),
('DoctrineMigrations\\Version20240420115117','2024-04-20 11:51:24',47),
('DoctrineMigrations\\Version20240420115343','2024-04-20 11:53:56',47);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `html` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3BAE0AA761220EA6` (`creator_id`),
  KEY `IDX_3BAE0AA7401B253C` (`event_type_id`),
  CONSTRAINT `FK_3BAE0AA7401B253C` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`),
  CONSTRAINT `FK_3BAE0AA761220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_type`
--

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_user`
--

DROP TABLE IF EXISTS `event_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_user` (
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`user_id`),
  KEY `IDX_92589AE271F7E88B` (`event_id`),
  KEY `IDX_92589AE2A76ED395` (`user_id`),
  CONSTRAINT `FK_92589AE271F7E88B` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_92589AE2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_user`
--

LOCK TABLES `event_user` WRITE;
/*!40000 ALTER TABLE `event_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `university_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_17966043309D1878` (`university_id`),
  CONSTRAINT `FK_17966043309D1878` FOREIGN KEY (`university_id`) REFERENCES `university` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES
(1,1,'Архитектурно-строительный факультет'),
(2,1,'Аэрокосмический институт'),
(3,5,'Институт математики и информационных технологий'),
(4,1,'Институт менеджмента, экономики и предпринимательства'),
(5,2,'Институт наук о Земле'),
(6,2,'Химико-биологический факультет'),
(7,1,'Юридический факультет'),
(8,3,'Физический факультет'),
(9,2,'Факультет прикладной биотехнологии и инженерии'),
(10,1,'Транспортный факультет');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kafedra`
--

DROP TABLE IF EXISTS `kafedra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kafedra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A59DB704680CAB68` (`faculty_id`),
  CONSTRAINT `FK_A59DB704680CAB68` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kafedra`
--

LOCK TABLES `kafedra` WRITE;
/*!40000 ALTER TABLE `kafedra` DISABLE KEYS */;
INSERT INTO `kafedra` VALUES
(1,1,'Кафедра архитектуры'),
(2,2,'Кафедра летательных аппаратов'),
(3,3,'Кафедра математики и цифровых технологий'),
(4,7,'Кафедра банковского дела и страхования'),
(5,5,'Кафедра геологии, геодезии и кадастра'),
(6,6,'Кафедра биохимии и микробиологии'),
(7,7,'Кафедра уголовного права'),
(8,6,'Кафедра медико-биологической техники'),
(9,6,'Кафедра пищевой биотехнологии'),
(10,10,'Кафедра технической эксплуатации и ремонта автомобилей');
/*!40000 ALTER TABLE `kafedra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publish_type`
--

DROP TABLE IF EXISTS `publish_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publish_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publish_type`
--

LOCK TABLES `publish_type` WRITE;
/*!40000 ALTER TABLE `publish_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `publish_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_publish`
--

DROP TABLE IF EXISTS `student_publish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_publish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `html` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_55A279B9CB944F1A` (`student_id`),
  KEY `IDX_55A279B9C54C8C93` (`type_id`),
  CONSTRAINT `FK_55A279B9C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `publish_type` (`id`),
  CONSTRAINT `FK_55A279B9CB944F1A` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_publish`
--

LOCK TABLES `student_publish` WRITE;
/*!40000 ALTER TABLE `student_publish` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_publish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teach_group`
--

DROP TABLE IF EXISTS `teach_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teach_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kafedra_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E9AD666E4472BACF` (`kafedra_id`),
  CONSTRAINT `FK_E9AD666E4472BACF` FOREIGN KEY (`kafedra_id`) REFERENCES `kafedra` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teach_group`
--

LOCK TABLES `teach_group` WRITE;
/*!40000 ALTER TABLE `teach_group` DISABLE KEYS */;
INSERT INTO `teach_group` VALUES
(1,1,'22ИСП-2'),
(2,2,'23ИО-2'),
(3,3,'23ИО-1'),
(4,4,'20ЗП-1'),
(5,5,'22ИИ-1'),
(6,6,'22ОЕ-1'),
(7,7,'22МП-2'),
(8,8,'22КП-1'),
(9,9,'22ИСП-2'),
(10,10,'22ТОРТ-1'),
(11,1,'21ИСП-2'),
(12,2,'22ИО-2'),
(13,3,'22ИО-1'),
(14,4,'21ЗП-1'),
(15,5,'21ИИ-1'),
(16,6,'21ОЕ-1'),
(17,7,'21МП-2'),
(18,8,'21КП-1'),
(19,9,'21ИСП-2'),
(20,10,'21ТОРТ-1');
/*!40000 ALTER TABLE `teach_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `university` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES
(1,'Оренбургский государственный университет','пр-кт Победы 13','Оренбург'),
(2,'Оренбургский государственный аграрный университет','ул. Челюскинцев 18','Оренбург'),
(3,'Оренбургский государственный педагогический университет','ул. Советская 19','Оренбург'),
(4,'Оренбургский государственный медицинский университет','ул. Советская 6','Оренбург'),
(5,'Оренбургский филиал Российского экономического университета имени Г.В. Плеханова','ул. Пушкинская 53','Оренбург');
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teach_group_id` int(11) DEFAULT NULL,
  `is_verify` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`),
  KEY `IDX_8D93D649BFC83087` (`teach_group_id`),
  CONSTRAINT `FK_8D93D649BFC83087` FOREIGN KEY (`teach_group_id`) REFERENCES `teach_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_student_publish`
--

DROP TABLE IF EXISTS `user_student_publish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_student_publish` (
  `user_id` int(11) NOT NULL,
  `student_publish_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`student_publish_id`),
  KEY `IDX_477E1536A76ED395` (`user_id`),
  KEY `IDX_477E15366AEB0081` (`student_publish_id`),
  CONSTRAINT `FK_477E15366AEB0081` FOREIGN KEY (`student_publish_id`) REFERENCES `student_publish` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_477E1536A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_student_publish`
--

LOCK TABLES `user_student_publish` WRITE;
/*!40000 ALTER TABLE `user_student_publish` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_student_publish` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-20 17:40:04
