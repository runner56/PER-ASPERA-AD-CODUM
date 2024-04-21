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
('DoctrineMigrations\\Version20240420115343','2024-04-20 11:53:56',47),
('DoctrineMigrations\\Version20240420133248','2024-04-20 13:32:55',46),
('DoctrineMigrations\\Version20240420133323','2024-04-20 13:33:26',47),
('DoctrineMigrations\\Version20240420133625','2024-04-20 13:36:30',47),
('DoctrineMigrations\\Version20240420141705','2024-04-20 14:17:12',77),
('DoctrineMigrations\\Version20240420173022','2024-04-20 17:30:57',112),
('DoctrineMigrations\\Version20240420173045','2024-04-20 17:31:48',77),
('DoctrineMigrations\\Version20240420173107','2024-04-20 17:31:48',4),
('DoctrineMigrations\\Version20240420201202','2024-04-20 20:12:08',87),
('DoctrineMigrations\\Version20240421054552','2024-04-21 05:45:59',245),
('DoctrineMigrations\\Version20240421071918','2024-04-21 07:19:27',15);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
(10,1,'Транспортный факультет'),
(11,1,'teee');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
(10,10,'Кафедра технической эксплуатации и ремонта автомобилей'),
(11,1,'ttttt'),
(12,11,'qqqqq');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publish_type`
--

LOCK TABLES `publish_type` WRITE;
/*!40000 ALTER TABLE `publish_type` DISABLE KEYS */;
INSERT INTO `publish_type` VALUES
(1,'Наука'),
(2,'Исскуство'),
(3,'Технологии'),
(4,'Путешествия'),
(5,'Фотографии');
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_55A279B9CB944F1A` (`student_id`),
  KEY `IDX_55A279B9C54C8C93` (`type_id`),
  CONSTRAINT `FK_55A279B9C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `publish_type` (`id`),
  CONSTRAINT `FK_55A279B9CB944F1A` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_publish`
--

LOCK TABLES `student_publish` WRITE;
/*!40000 ALTER TABLE `student_publish` DISABLE KEYS */;
INSERT INTO `student_publish` VALUES
(1,2,1,'<p style=\"text-align: center;\">statia</p>',''),
(2,2,1,'<p style=\"text-align: center;\">asdwaeqwewqeqwe</p>','statiaaaa');
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
  `stream_year` int(11) NOT NULL DEFAULT '2022',
  PRIMARY KEY (`id`),
  KEY `IDX_E9AD666E4472BACF` (`kafedra_id`),
  CONSTRAINT `FK_E9AD666E4472BACF` FOREIGN KEY (`kafedra_id`) REFERENCES `kafedra` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teach_group`
--

LOCK TABLES `teach_group` WRITE;
/*!40000 ALTER TABLE `teach_group` DISABLE KEYS */;
INSERT INTO `teach_group` VALUES
(1,1,'22ИСП-2',2022),
(2,2,'23ИО-2',2022),
(3,3,'23ИО-1',2022),
(4,4,'20ЗП-1',2022),
(5,5,'22ИИ-1',2022),
(6,6,'22ОЕ-1',2022),
(7,7,'22МП-2',2022),
(8,8,'22КП-1',2022),
(9,9,'22ИСП-2',2022),
(10,10,'22ТОРТ-1',2022),
(11,1,'21ИСП-2',2022),
(12,2,'22ИО-2',2022),
(13,3,'22ИО-1',2022),
(14,4,'21ЗП-1',2022),
(15,5,'21ИИ-1',2022),
(16,6,'21ОЕ-1',2022),
(17,7,'21МП-2',2022),
(18,8,'21КП-1',2022),
(19,9,'21ИСП-2',2022),
(20,10,'21ТОРТ-1',2022),
(21,1,'ttt',2024),
(22,1,'ttt',2024),
(23,1,'tqqq',2024),
(24,12,'wwwww',2024);
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
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teach_group_id` int(11) DEFAULT NULL,
  `is_verify` tinyint(1) NOT NULL DEFAULT '1',
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `star` int(11) NOT NULL DEFAULT '0',
  `university_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`),
  KEY `IDX_8D93D649BFC83087` (`teach_group_id`),
  KEY `IDX_8D93D649309D1878` (`university_id`),
  CONSTRAINT `FK_8D93D649309D1878` FOREIGN KEY (`university_id`) REFERENCES `university` (`id`),
  CONSTRAINT `FK_8D93D649BFC83087` FOREIGN KEY (`teach_group_id`) REFERENCES `teach_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1829 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'r1scqd@gmail.com','[\"ROLE_STUDENT\"]','$2y$13$4p7G6AnN0z0TjEXLEmh2hel1bjqEZznw57LL9Fxedy2LCU/VrAfQO',NULL,NULL,0,'test','test','r1scqd@gmail.com',0,NULL),
(2,'r2scqd@gmail.com','[\"ROLE_STUDENT\"]','$2y$13$4nhtiHjBfHxHKVDpT8G.oeL780Nu0hhY3koeez5PtTVlrexdCTp/.','2024-03-22-13-15-52-66240566277c6.jpg',15,1,'test','test','r2scqd@gmail.com',10,NULL),
(3,'rescqd','[\"ROLE_ADMIN\"]','$2y$13$DiqTMFSOUGAGTn1u/pfpcen//qT0UHSd7GfCW38bVQVnLmR92QmmS',NULL,NULL,1,'Боченин','Никита','rescqd@gmail.com',0,NULL),
(4,'prohor30','[\"ROLE_STUDENT\"]','$2y$13$Ub8k1PvdsBfO0T6coczHbubGpEBpSv41ERJUDi05IKMCuEf/4TLja','student14.jpg',20,1,'Смольянинов','Прохор Порфирьевич','prohor30@gmail.com',0,NULL),
(964,'aleksey8309','[\"ROLE_STUDENT\"]','$2y$13$GTifMPPrHYzRKAH4/n5Wn.ftP7xAH8XU3ZOcsRHzZY7ZTI2hzibRe','student11.jpg',19,1,'Филипов','Алексей Валентинович','aleksey8309@mail.ru',0,NULL),
(965,'arseniy77','[\"ROLE_STUDENT\"]','$2y$13$lDWOKINYfzKOjp2snTfuyuwjNTH.CeV3PG2HARAfr94XQuL4YdI1e','student10.jpg',13,1,'Гайденко','Арсений Максимович','arseniy77@yandex.ru',9,NULL),
(966,'petr1994','[\"ROLE_STUDENT\"]','$2y$13$VrSl6RdPs6aiz2BvICyv8ubXM661z.5oW8BcnMaKPdsDT6MUN2cqS','student18.jpg',15,1,'Занин','Петр Германович','petr1994@rambler.ru',0,NULL),
(967,'makar7470','[\"ROLE_STUDENT\"]','$2y$13$4A2kaAjhlctqXOBMMYwmQuLE4bLo/GfBvJIWYPsdwW75uJQ5ZM8l.','student15.jpg',10,1,'Шитов','Макар Аркадьевич','makar7470@hotmail.com',0,NULL),
(968,'aleksandra82','[\"ROLE_STUDENT\"]','$2y$13$mELaG8sr.VsIldotOeR0OOdbHdI2H6AzMJJLZXTamtpP8ix8ao3ai','student13.jpg',11,1,'Мирова','Александра Игнатевна','aleksandra82@yandex.ru',11,NULL),
(969,'nikita12071992','[\"ROLE_STUDENT\"]','$2y$13$XzxkYsAfEDQiw5JHJ8zwV.VPl8m7IPLfrtlUimDPq4LYAPq2/Lg/.','student5.jpg',14,1,'Кулаков','Никита Макарович','nikita12071992@gmail.com',0,NULL),
(970,'valentin1988','[\"ROLE_STUDENT\"]','$2y$13$fiw2k4TGnmsmw35/CWSxdeS6iboIQ.YMqNUlI4BTslDmIo4kAT5pq','student3.jpg',5,1,'Якубович','Валентин Семенович','valentin1988@mail.ru',0,NULL),
(971,'elena16031982','[\"ROLE_STUDENT\"]','$2y$13$k.Zc5RmbhafSQkKehQmYbODscXbqz/YDOLhW0yviiYK8q4zKfHahO','student7.jpg',18,1,'Габулова','Елена Венедиктовна','elena16031982@yandex.ru',0,NULL),
(972,'veniamin1967','[\"ROLE_STUDENT\"]','$2y$13$EK6B.2OjtyK5O3wFdHUKou1d/DLngENtTDC5cpe1TYDQnC1DdlEzG','student2.jpg',17,1,'Кушкин','Вениамин Захарович','veniamin1967@hotmail.com',15,NULL),
(973,'arina7526','[\"ROLE_STUDENT\"]','$2y$13$O75jnYHPvkeso8leFV6.0OeJdV3jEXQHwptcEdpEwgdoGPmw1GnEe','student20.jpg',12,1,'Бесчастныха','Арина Вячеславовна','arina7526@hotmail.com',0,NULL),
(974,'marianna1986','[\"ROLE_STUDENT\"]','$2y$13$OPsm5lc/d.wTF0WrocUlQuzpUOMG9o/5BEPQMGg2LPMiqRK/X9GpS','student1.jpg',3,1,'Пастух','Марианна Денисовна','marianna1986@gmail.com',0,NULL),
(975,'evgeniya2266','[\"ROLE_STUDENT\"]','$2y$13$tlOpcqZyPejhgxshoilSrOGDD.5a.unf.bFUBHUebP60kTxSgBiRm','student15.jpg',10,1,'Кондратенко','Евгения Павловна','evgeniya2266@outlook.com',5,NULL),
(976,'ignat1964','[\"ROLE_STUDENT\"]','$2y$13$w54G6oQIXnt/hajtFF7K7e0gs3t03rwHS/5DyI.9ZNkKxa4rHB6G2','student1.jpg',10,1,'Дубов','Игнат Васильевич','ignat1964@hotmail.com',0,NULL),
(977,'maksim.tkachev','[\"ROLE_STUDENT\"]','$2y$13$6ZrUEYHojMrYb5mRr72mS.Yfl9S6a60GrtaisIRsO428Oo/Hwvcri','student11.jpg',14,1,'Ткачёв','Максим Антонович','maksim.tkachev@mail.ru',0,NULL),
(978,'evgeniy21','[\"ROLE_STUDENT\"]','$2y$13$NeF3VbyjeU5N4.PIGbj9cOyzL2p/f1HY8pkVKKcgv.g1QeyyT8r7u','student9.jpg',12,1,'Язвецов','Евгений Артемович','evgeniy21@yandex.ru',0,NULL),
(979,'timofey72','[\"ROLE_STUDENT\"]','$2y$13$Q4xd2ZI39TgXyBNWI1e6Ie21wkb8uOgJpUmbCqcGX6LkEhNGwhKG.','student9.jpg',17,1,'Шеин','Тимофей Федорович','timofey72@mail.ru',0,NULL),
(980,'pavel1962','[\"ROLE_STUDENT\"]','$2y$13$esFFMBjnrGjQ6CqaJ/3vaupaRrB1bRQW9TmRgBGBpvod9vcrKZ9dy','student15.jpg',19,1,'Бобриков','Павел Леонтьевич','pavel1962@yandex.ru',0,NULL),
(981,'lyubov1964','[\"ROLE_STUDENT\"]','$2y$13$lH31Vb.9MZ2W2eQVf6Jp5OiL.f4UEFjsXsKtyuWRcL947rRBkB./i','student7.jpg',2,1,'Кувшинова','Любовь Федоровна','lyubov1964@hotmail.com',6,NULL),
(982,'svetlana20121988','[\"ROLE_STUDENT\"]','$2y$13$AuIo/xTF8p/rZIUpBILXIumnd/fP6Pky2fQJqcIOrLaMBfMEKrhem','student12.jpg',15,1,'Пономарёва','Светлана Венедиктовна','svetlana20121988@ya.ru',0,NULL),
(983,'ilya80','[\"ROLE_STUDENT\"]','$2y$13$qEEbwa5bVCe3bNzm1hXi4uDsWzHyd7KityxciqMfFkCFQsOJp8eHm','student18.jpg',8,1,'Набойщиков','Илья Маркович','ilya80@outlook.com',0,NULL),
(984,'valentin1984','[\"ROLE_STUDENT\"]','$2y$13$Wctqm0VltfSO1yuNOxjxze5xrwmEzLq7m227UQGM/0e76C9PNDR.C','student19.jpg',8,1,'Полищук','Валентин Маркович','valentin1984@yandex.ru',0,NULL),
(985,'marianna96','[\"ROLE_STUDENT\"]','$2y$13$LjxGNqZij8acNFaDrt7KxOEmnihsfPBMGDsA2z7yDRlxlI/zm0TRy','student2.jpg',16,1,'Скотарева','Марианна Трофимовна','marianna96@hotmail.com',5,NULL),
(986,'aleksandra29','[\"ROLE_STUDENT\"]','$2y$13$Z0h95GLEXw781L3uqzHCk.5R1J6IMWOC0LHJxRS8XzpbjBBCV9cqe','student13.jpg',5,1,'Кружкова','Александра Максимовна','aleksandra29@hotmail.com',0,NULL),
(987,'lyubov1973','[\"ROLE_STUDENT\"]','$2y$13$vXOgqZWh8dRaLI/d6HNlMeQUwuBS3N7K1hyfga4s.QR1VhDtWybG.','student4.jpg',17,1,'Яновицкая','Любовь Антоновна','lyubov1973@rambler.ru',0,NULL),
(988,'evgeniy.tolokonskiy','[\"ROLE_STUDENT\"]','$2y$13$f71Aalsl2Tuc2lP..rECGupOtj/6SHnD4d5M0FJH.WVSd0Ra3AOuy','student19.jpg',6,1,'Толоконский','Евгений Тимофеевич','evgeniy.tolokonskiy@yandex.ru',0,NULL),
(989,'valeriy1989','[\"ROLE_STUDENT\"]','$2y$13$AosNZhV/7BJQLJfssXY03u.dEPUBJUMdLRm29bYm3KVcdwQvkDr.q','student11.jpg',16,1,'Малинов','Валерий Яковлевич','valeriy1989@yandex.ru',0,NULL),
(990,'roman5246','[\"ROLE_STUDENT\"]','$2y$13$SLrR7/c1.Fg6myrd0Y.I5eGsDq89Oxls.KopcmQcopb6Z54IPqzR.','student8.jpg',12,1,'Корзоватых','Роман Тимофеевич','roman5246@rambler.ru',0,NULL),
(991,'vera1981','[\"ROLE_STUDENT\"]','$2y$13$0VQRpSX8zWLez4D6kbyM.OwTNcMnV6Ag6yvTYugahiZ.pyngdgrEK','student2.jpg',7,1,'Рунова','Вера Ивановна','vera1981@mail.ru',0,NULL),
(992,'syuzanna22011981','[\"ROLE_STUDENT\"]','$2y$13$QzRlEI8n0IOrpDasx21Ro.3kdsA/w4n2tPrdVdME3LTDyQ7TDIvYy','student12.jpg',8,1,'Прокашева','Сюзанна Александровна','syuzanna22011981@rambler.ru',0,NULL),
(993,'gavriil11041972','[\"ROLE_STUDENT\"]','$2y$13$F0ezAqcML/2YZ0d39pTJAO39K9Vd8JD52CACYQHx.vU/oqVTvndrm','student10.jpg',20,1,'Клименко','Гавриил Германович','gavriil11041972@gmail.com',0,NULL),
(994,'marfa.telicyna','[\"ROLE_STUDENT\"]','$2y$13$0TJAl//5.rfPtSolm9XJ7e1qejEn5fWBcG80X2tyH7qdLB5HUxOiC','student13.jpg',5,1,'Телицына','Марфа Михаиловна','marfa.telicyna@gmail.com',0,NULL),
(995,'ignat1981','[\"ROLE_STUDENT\"]','$2y$13$mxCnMKZuyCCu73e1g0zNUeg846z1Gs8Cbes2D9ylttpv3BrMPHONm','student14.jpg',5,1,'Мандрыко','Игнат Павлович','ignat1981@outlook.com',0,NULL),
(996,'olga74','[\"ROLE_STUDENT\"]','$2y$13$evNVu/yhKaPoSBFuSwuyTOZ6EwtmChcYZCbnZVxq3QDTAimym5YGO','student18.jpg',17,1,'Милюкова','Ольга Петровна','olga74@yandex.ru',0,NULL),
(997,'petr7861','[\"ROLE_STUDENT\"]','$2y$13$PULh1iMsspqFJtQdfNkxu.CMHT9tDttDNDkR8k/WcNuNNLp0Opw3y','student2.jpg',7,1,'Разуваев','Петр Константинович','petr7861@gmail.com',0,NULL),
(998,'valeriya56','[\"ROLE_STUDENT\"]','$2y$13$aEKSsY5gSKFaO.nGfYDo4.MMIOvL3EISIVBu/nCRLvSGlZq0lStsm','student10.jpg',10,1,'Чеботарёва','Валерия Степановна','valeriya56@ya.ru',0,NULL),
(999,'roman9861','[\"ROLE_STUDENT\"]','$2y$13$aRNQrK/ElwR7IC/n679to.K42cA/gmDG3NTP071lSeK8ECW8RQUSu','student2.jpg',3,1,'Пыстогов','Роман Тарасович','roman9861@yandex.ru',0,NULL),
(1000,'dmitriy26081979','[\"ROLE_STUDENT\"]','$2y$13$5vgtadCtCY.YfBGuky7oleHOuHUs0MtkR/9rXz9EYPs33Ibzy/Sji','student13.jpg',15,1,'Прокашев','Дмитрий Петрович','dmitriy26081979@yandex.ru',0,NULL),
(1001,'yuliana1990','[\"ROLE_STUDENT\"]','$2y$13$Fy2zrneebP60//U5W9XZAenYClWh7FLPjplWvOGp.VEDQP2KfaYM6','student6.jpg',15,1,'Кошляка','Юлиана Афанасьевна','yuliana1990@hotmail.com',0,NULL),
(1002,'filipp8332','[\"ROLE_STUDENT\"]','$2y$13$QdWeBFafOdlC9yTpbpVE3OT9ot1LaE2zLOx3.U7fu9oGUDNGC/xta','student1.jpg',20,1,'Другов','Филипп Герасимович','filipp8332@ya.ru',0,NULL),
(1003,'konstantin37','[\"ROLE_STUDENT\"]','$2y$13$M8dJEo5GDduMp7MlBKsIkOLO9Zp4hYp.MTjdXACL8K/gxhaNKxbVS','student9.jpg',15,1,'Яшкин','Константин Вячеславович','konstantin37@mail.ru',0,NULL),
(1004,'alla.kuratova','[\"ROLE_STUDENT\"]','$2y$13$KhRBheQkYfRQhe..tyNC0eCdJ/n3asEsVffxaE4GLcq43y/sZlcdS','student15.jpg',18,1,'Шкуратова','Алла Арсеньевна','alla.kuratova@ya.ru',0,NULL),
(1005,'elizaveta6645','[\"ROLE_STUDENT\"]','$2y$13$PUmMyub6rsWX8L3cyuJ3yeSyqjlZP3yHtW8OrIZW5tPTAxtZyMb92','student11.jpg',19,1,'Абумайлова','Елизавета Валериановна','elizaveta6645@mail.ru',0,NULL),
(1006,'pavel5967','[\"ROLE_STUDENT\"]','$2y$13$v6DZU71Ino63dA7Jk8MjHusSxUoK8rgOM67ZV1ewLoA3D2hg1Ne9.','student16.jpg',6,1,'Рытин','Павел Захарович','pavel5967@hotmail.com',0,NULL),
(1007,'alla1975','[\"ROLE_STUDENT\"]','$2y$13$8/dJYqlWDQsFhrjdNdGUA.Wiozci1D.h9g7pKl/fuho48eajtCP.O','student12.jpg',2,1,'Климцова','Алла Филипповна','alla1975@rambler.ru',0,NULL),
(1008,'georgiy74','[\"ROLE_STUDENT\"]','$2y$13$gzHi3c6NoKr26G/8fmxC2OxKviCPMwVUsn5IVfV/ME4DUdOdmg3A.','student12.jpg',9,1,'Кэбин','Георгий Аркадьевич','georgiy74@gmail.com',0,NULL),
(1009,'viktoriya09011961','[\"ROLE_STUDENT\"]','$2y$13$PPuBwmwztyDML7kBbDLgi.3qjRUSSh7wxhiJR9G99gnPI41MBlkB.','student6.jpg',2,1,'Капица','Виктория Никитьевна','viktoriya09011961@ya.ru',0,NULL),
(1010,'alisa8443','[\"ROLE_STUDENT\"]','$2y$13$JqXH1A7Cb1rAE/gFBgCBbeX9Bu9Fk0zTw1q8Q9tvp/S6mbGn.aUuO','student14.jpg',11,1,'Котяша','Алиса Ивановна','alisa8443@hotmail.com',0,NULL),
(1011,'gavriil25051990','[\"ROLE_STUDENT\"]','$2y$13$v5fMmgOIUXwfXi8UdB6xJe.KS9Xn8Z9Y5.wtkiF6tNod1b54EnkR.','student16.jpg',3,1,'Блохин','Гавриил Трофимович','gavriil25051990@outlook.com',0,NULL),
(1012,'albina.dyachenko','[\"ROLE_STUDENT\"]','$2y$13$8gR1gG.ahraCiRUb2M6hxulNqAUKpHec8iNrpwARGz3MXgTnvhV/6','student5.jpg',7,1,'Дьяченко','Альбина Никифоровна','albina.dyachenko@gmail.com',0,NULL),
(1013,'galina8948','[\"ROLE_STUDENT\"]','$2y$13$hjvU.8oH.O0MOhtLlFHU3.JVmwFx.oqzp3Jlu.BV7mgUomNk9Gksi','student14.jpg',16,1,'Шидловская','Галина Васильевна','galina8948@ya.ru',0,NULL),
(1014,'mariya4548','[\"ROLE_STUDENT\"]','$2y$13$E2SeKXluoSFd/z/QE0/8..7AzkglcCobph2c1C3WlRLfMS2obUapq','student5.jpg',4,1,'Евтушенко','Мария Георгьевна','mariya4548@yandex.ru',0,NULL),
(1015,'aleksandra1992','[\"ROLE_STUDENT\"]','$2y$13$pU722ekt/HdBtJpVS06.F.eArPkO05Aoqp1mCP8eDuBXnOzCU8XW.','student7.jpg',17,1,'Чунца','Александра Валериановна','aleksandra1992@gmail.com',0,NULL),
(1016,'olga01061991','[\"ROLE_STUDENT\"]','$2y$13$1ZHdnesIibMq2Iwdm4u./e.ZOAf0NWImZbrbeM/XppnA3zyA5K0aW','student14.jpg',2,1,'Черномырдина','Ольга Леонтьевна','olga01061991@hotmail.com',0,NULL),
(1017,'yuliya8601','[\"ROLE_STUDENT\"]','$2y$13$ZAfkb44wHvztlBVjJDAUiexYJRG5Jpvma.nogQ8.KdHqI0V.V9CZm','student12.jpg',6,1,'Шибалкина','Юлия Захаровна','yuliya8601@mail.ru',0,NULL),
(1018,'roman22111979','[\"ROLE_STUDENT\"]','$2y$13$Skrc1cB4sxSAUBKzJFbYe.qXUfGubNy9KcTWOM.gL5rK.KIHnQtgK','student20.jpg',4,1,'Ивашов','Роман Ираклиевич','roman22111979@ya.ru',0,NULL),
(1019,'vasilisa58','[\"ROLE_STUDENT\"]','$2y$13$ScilPeQ.xVM9Ts5V81Sj/.Eo1WPTqZICXB4yeLDlm2V2uma6cfFC2','student20.jpg',8,1,'Ярошенко','Василиса Вениаминовна','vasilisa58@hotmail.com',0,NULL),
(1020,'larisa.kolomnikova','[\"ROLE_STUDENT\"]','$2y$13$lZKG/0Ke1gbmXY.VQ.ny4.kQMYoiFUJO9fwq9xfk1DH9ayPwddmDe','student2.jpg',4,1,'Коломникова','Лариса Климентьевна','larisa.kolomnikova@ya.ru',0,NULL),
(1021,'lyubov29','[\"ROLE_STUDENT\"]','$2y$13$XjZq.e.ZLi7mQPGmu.LQ8etMCbJdrUgZ2yR/uTTUau74xDhXsEKEW','student20.jpg',10,1,'Лившица','Любовь Лльвона','lyubov29@ya.ru',0,NULL),
(1022,'vitaliy.malinovskiy','[\"ROLE_STUDENT\"]','$2y$13$KbvQnAyJY4dDK0arrN2ZSOjuze574uOGcP.g1lp373QFSptVOqxtG','student19.jpg',5,1,'Малиновский','Виталий Петрович','vitaliy.malinovskiy@hotmail.com',0,NULL),
(1023,'zahar1966','[\"ROLE_STUDENT\"]','$2y$13$Wde5jhDwcmHjOZMRhPGyLeGwl2NokmzHVlf32vbXJRnkTwKX2.VKG','student13.jpg',3,1,'Дуболадов','Захар Викторович','zahar1966@yandex.ru',0,NULL),
(1024,'yuliana1996','[\"ROLE_STUDENT\"]','$2y$13$BEJWnbqZ3opoydhkVpp8EurDmJ9Q6GKgFI0GIuCZMnCyxWkDwcXD.','student14.jpg',20,1,'Эллинская','Юлиана Тимофеевна','yuliana1996@rambler.ru',0,NULL),
(1025,'filipp03021986','[\"ROLE_STUDENT\"]','$2y$13$P.bQh94EUQy1EFVOXoglWODUbxeQjwauGi3yfeLuZZtWstpAR8igK','student3.jpg',7,1,'Ямов','Филипп Аркадьевич','filipp03021986@yandex.ru',0,NULL),
(1026,'aleksandr1983','[\"ROLE_STUDENT\"]','$2y$13$GfCAGAZqTsj3EEDY6GvUkuoF9EHYyAdIFyd.iExEqs9SVGmeeHmh.','student11.jpg',6,1,'Ясев','Александр Федорович','aleksandr1983@gmail.com',0,NULL),
(1027,'ulyana3037','[\"ROLE_STUDENT\"]','$2y$13$d2SA00VifjsLmJ0cXrpcQO9O4B0WGDnZntY0DnCOdWNH7i72l06H.','student6.jpg',13,1,'Савасина','Ульяна Юрьевна','ulyana3037@gmail.com',0,NULL),
(1028,'kira75','[\"ROLE_STUDENT\"]','$2y$13$0.K.o0G8a/Cuvm6uh4y9QO720ksi0Z18j/lY7y4IP5DqHKhzWHYjS','student12.jpg',18,1,'Страхова','Кира Лльвона','kira75@rambler.ru',0,NULL),
(1029,'pavel27','[\"ROLE_STUDENT\"]','$2y$13$J9UnguqcEYJZBCRucthuUeTMDgkpqtNDzWazGPvwt/A.vxPrldVpq','student10.jpg',8,1,'Пономарев','Павел Филиппович','pavel27@hotmail.com',0,NULL),
(1030,'danila.enotin','[\"ROLE_STUDENT\"]','$2y$13$0hUUWX2luOUitZk.oKzrVe3TGjetvi9gqFvjSXycuQJ2bbhk2BcDm','student16.jpg',19,1,'Енотин','Данила Степанович','danila.enotin@mail.ru',0,NULL),
(1031,'semen1988','[\"ROLE_STUDENT\"]','$2y$13$3Os80q3s4E3VHKZDSGwlWuWnG9Ae5mgqwI0NK3zcv0WRLH7kpGu62','student13.jpg',9,1,'Орехов','Семен Севастьянович','semen1988@outlook.com',0,NULL),
(1032,'marina.pushkina','[\"ROLE_STUDENT\"]','$2y$13$svIpiVRwQ4wytlaPL2ycieXEbz06iB0pWfmTdMSxLnMncgsjXO0RC','student18.jpg',7,1,'Пушкина','Марина Михаиловна','marina.pushkina@yandex.ru',0,NULL),
(1033,'yuliya3002','[\"ROLE_STUDENT\"]','$2y$13$UMep.6adnoAflZJ1xTlcAuPjtpAYcSAJZF9E5XIcrh2gaUdX.6rdC','student20.jpg',11,1,'Балановская','Юлия Феоктистовна','yuliya3002@rambler.ru',0,NULL),
(1034,'syuzanna27','[\"ROLE_STUDENT\"]','$2y$13$vGwa.tdEwMfXBVHMIT86rOd4F80H7WBMFyiNP40g0eU.quOiroRX6','student19.jpg',20,1,'Набережнева','Сюзанна Артемова','syuzanna27@mail.ru',0,NULL),
(1035,'anfisa1971','[\"ROLE_STUDENT\"]','$2y$13$f0dRyswFECiOcN4lY2pJOOPsZtxjZAcR0kK9u6IiIvjkrVYjahDTq','student8.jpg',3,1,'Абрашина','Анфиса Ильишна','anfisa1971@outlook.com',0,NULL),
(1036,'marina1994','[\"ROLE_STUDENT\"]','$2y$13$yoR1NCzWa73EWIVJpZC.xueap/3hVk/w.4Gal7OP2c0CW7YD1smTC','student12.jpg',2,1,'Зарица','Марина Никифоровна','marina1994@outlook.com',0,NULL),
(1037,'nika1914','[\"ROLE_STUDENT\"]','$2y$13$ELOnUwKD42hGhxs3t45rvuVBRa2zMI3TWhZyncrt7BenpB/I.yoni','student11.jpg',20,1,'Гарифуллина','Ника Денисовна','nika1914@ya.ru',0,NULL),
(1038,'yuliana1992','[\"ROLE_STUDENT\"]','$2y$13$26M04i45/gOomjqwhsul4.kZMMLK9TboXWBEkrIU/eGll4tFm3mCy','student7.jpg',1,1,'Бодрова','Юлиана Алексеевна','yuliana1992@rambler.ru',0,NULL),
(1039,'rada.aleksandrovich','[\"ROLE_STUDENT\"]','$2y$13$SYib7dfYfOCoQ0tyjGd5/O.saAUSYG3j7zrWuv311FN6lpLKrYwC.','student12.jpg',12,1,'Александрович','Рада Валерьевна','rada.aleksandrovich@yandex.ru',0,NULL),
(1040,'nikita18091991','[\"ROLE_STUDENT\"]','$2y$13$U6pK9f5DxTf.KnDMTYc/x.Lvp7UN4rpi3a1zLTZHeay9VvqDwMBxW','student17.jpg',6,1,'Якубов','Никита Валентинович','nikita18091991@outlook.com',0,NULL),
(1041,'syuzanna16','[\"ROLE_STUDENT\"]','$2y$13$JSpTPrldTsCQRi/hE81PMeL0AjE9YYLKUyR4b.Xpax11iPGKdt.Mi','student13.jpg',4,1,'Горева','Сюзанна Арсеньевна','syuzanna16@mail.ru',0,NULL),
(1042,'rada64','[\"ROLE_STUDENT\"]','$2y$13$IZbTCY8y0n2bL/rSDkzJDOF9G2NYYBTL.hrVDv865U8LvDDimnd3u','student7.jpg',8,1,'Куроптева','Рада Наумовна','rada64@ya.ru',0,NULL),
(1043,'raisa.lutugina','[\"ROLE_STUDENT\"]','$2y$13$fIVBDZFETIiacUo9fbclwuPNkVzMiDBDxBbi8mb7wvf4D2Fuj6PaG','student14.jpg',16,1,'Лутугина','Раиса Макаровна','raisa.lutugina@ya.ru',0,NULL),
(1044,'kirill94','[\"ROLE_STUDENT\"]','$2y$13$hVab4nQsJPYMgjzX4CUBIeJbzB9Kz3cr55XjGygLaLmdcMaYu4O5G','student13.jpg',8,1,'Смешной','Кирилл Феоктистович','kirill94@ya.ru',0,NULL),
(1045,'stepan11061993','[\"ROLE_STUDENT\"]','$2y$13$9P0.H8AupjPV1YNMVAt.aObwAu5b3QLyvc8UQEIdFEGCQIx2n9.IC','student5.jpg',5,1,'Стожко','Степан Николаевич','stepan11061993@yandex.ru',0,NULL),
(1046,'ekaterina7800','[\"ROLE_STUDENT\"]','$2y$13$Slu8jezu44UmuekQ0a.3v.C7sjuZNtpcC9pOepXuLW7297RQE126.','student6.jpg',18,1,'Корчагина','Екатерина Юрьевна','ekaterina7800@yandex.ru',0,NULL),
(1047,'petr04121975','[\"ROLE_STUDENT\"]','$2y$13$52.9zbX4Pbq0bOL03ebZqOQnfAGg2fPiKNJM1.GFNrJOnpycZgXH2','student4.jpg',3,1,'Ярушин','Петр Иванович','petr04121975@gmail.com',0,NULL),
(1048,'pavel1982','[\"ROLE_STUDENT\"]','$2y$13$uzIsb4YG0eog9aJJXmifqeW.118XyX7hF2iPbDSS7jM1AgA0jzzEK','student6.jpg',6,1,'Тарасов','Павел Никандрович','pavel1982@yandex.ru',0,NULL),
(1049,'ilya.soldatov','[\"ROLE_STUDENT\"]','$2y$13$qBoDcCkfz6cS6oM3ke7Bl.VWPxcxqXT5T8LtNew/42hPUqWIZS/6m','student1.jpg',15,1,'Солдатов','Илья Петрович','ilya.soldatov@outlook.com',0,NULL),
(1050,'milana.kuzieva','[\"ROLE_STUDENT\"]','$2y$13$zY6Pxq4EMiiVxFWQsrf57.Tskbrj1Zzi7ckJ3VKIqtaUgpibaqn86','student5.jpg',14,1,'Кузиева','Милана Иннокентьевна','milana.kuzieva@mail.ru',0,NULL),
(1051,'roman11011968','[\"ROLE_STUDENT\"]','$2y$13$rMQvV.IhvzopEZSeReX48e5aYUUDUSm/.kjoE10eK/LuQxPgQylyW','student3.jpg',16,1,'Маюров','Роман Наумович','roman11011968@mail.ru',0,NULL),
(1052,'kirill75','[\"ROLE_STUDENT\"]','$2y$13$/wPak7rOhXGND5qNTuhguOH0vx2JJIcnrzxT.r2INFqupt6h0drBq','student7.jpg',17,1,'Рагозин','Кирилл Романович','kirill75@hotmail.com',0,NULL),
(1053,'afanasiya20071991','[\"ROLE_STUDENT\"]','$2y$13$XU9vXoPhPnofin4m2ax7zOTfc5xO4CyfgX7eybK7iI4OptzedW/sm','student3.jpg',12,1,'Криворотова','Афанасия Ефимовна','afanasiya20071991@gmail.com',0,NULL),
(1054,'olga1971','[\"ROLE_STUDENT\"]','$2y$13$X3PICk6rRbSYuOkGXeOfE.RIDf3t.0rZveBLE2iSrysgC5uAC19wi','student5.jpg',14,1,'Ешевская','Ольга Макаровна','olga1971@gmail.com',0,NULL),
(1055,'nikifor.bodrov','[\"ROLE_STUDENT\"]','$2y$13$NJt3/ELod7f7iXMiRDZGd.xuWYyg0btsKsfS9ddsCj.Cy8NRnmrxi','student18.jpg',11,1,'Бодров','Никифор Акимович','nikifor.bodrov@hotmail.com',0,NULL),
(1056,'afanasiy1965','[\"ROLE_STUDENT\"]','$2y$13$39hlo2uo8pEe/7p2pXcbyev5vy3.dVB23ztBRr4xM4I7b9pIESyC2','student13.jpg',1,1,'Яновицкий','Афанасий Герасимович','afanasiy1965@yandex.ru',0,NULL),
(1057,'arina1994','[\"ROLE_STUDENT\"]','$2y$13$nSqZS80W.CI/K5pNSVJRDu3bEKxc49FPq2lXVhlrYDlCrqch.gsR.','student18.jpg',5,1,'Митяшова','Арина Васильевна','arina1994@rambler.ru',0,NULL),
(1058,'ignat20121988','[\"ROLE_STUDENT\"]','$2y$13$AIQ7TLAeBjLH2uwQqIvdqOL9jf57qqHGZlToBupL1tY1T7eTv.b/W','student6.jpg',13,1,'Мышелов','Игнат Макарович','ignat20121988@yandex.ru',0,NULL),
(1059,'maksim1980','[\"ROLE_STUDENT\"]','$2y$13$0gGDgBlwXINgA3cEZyVLIu2kTP35asU8jDyitpipgDeVVcY4I/JZ.','student17.jpg',17,1,'Тепляков','Максим Антонович','maksim1980@outlook.com',0,NULL),
(1060,'lyudmila1991','[\"ROLE_STUDENT\"]','$2y$13$Wms4ZX0tt9gt7LDL2GHEtOOqJHoRNhjBt/f1V9FaCImhmPjwOGtne','student11.jpg',3,1,'Ольховская','Людмила Павловна','lyudmila1991@outlook.com',0,NULL),
(1061,'ignat1986','[\"ROLE_STUDENT\"]','$2y$13$RuG/6XrqJojq5b0d4XwbY.NHrfyFO.Qg7xaeza7LP/248Xkn4jAp.','student13.jpg',1,1,'Крутиков','Игнат Герасимович','ignat1986@mail.ru',0,NULL),
(1062,'makar5509','[\"ROLE_STUDENT\"]','$2y$13$4l7Q3KCeaXmiTyGwCRpeu.NXn85hZBTY7H3GHuXXFukc4TqW9BBVa','student2.jpg',16,1,'Нужнов','Макар Петрович','makar5509@yandex.ru',0,NULL),
(1063,'albina22041991','[\"ROLE_STUDENT\"]','$2y$13$g.0eme0/BbuaWMHsy0y7Leg8v9t6N2lbgpCkckv/H0yy0LCCy.k.m','student19.jpg',7,1,'Жевлакова','Альбина Ивановна','albina22041991@outlook.com',0,NULL),
(1064,'larisa28101984','[\"ROLE_STUDENT\"]','$2y$13$H.zDGms6JIH9qaOA1zr4ROXjLcK80ZplkjlR3Lfr8tU.0fXkeBm3C','student5.jpg',9,1,'Кардапольцева','Лариса Васильевна','larisa28101984@hotmail.com',0,NULL),
(1065,'katerina1986','[\"ROLE_STUDENT\"]','$2y$13$3zQx69k4GGNJsUTDkKWsQebptS8QQHpplfWzWbcxLvqOYnt5rOMDa','student15.jpg',9,1,'Славакова','Катерина Егоровна','katerina1986@mail.ru',0,NULL),
(1066,'yurin21031988','[\"ROLE_STUDENT\"]','$2y$13$vXsBXOZnLf67d/MDSU3P.uuB2pfP5h7i6x4o1NCDWooi6j5aEnAzC','student19.jpg',5,1,'Амелин','Юрин Валентинович','yurin21031988@outlook.com',0,NULL),
(1067,'maksim.kalashnik','[\"ROLE_STUDENT\"]','$2y$13$FYInMzRFoQW0FggPUor4OeRjBaybiuwrD4OMZqxBjbXLl/enYGW1a','student1.jpg',2,1,'Калашник','Максим Юринович','maksim.kalashnik@ya.ru',0,NULL),
(1068,'efim.krutikov','[\"ROLE_STUDENT\"]','$2y$13$LpzkoZPJDYCrKwyAwRYZFe.QVOlOSDjH2VTXoaADo4wZTt.IP8J36','student5.jpg',2,1,'Крутиков','Ефим Ираклиевич','efim.krutikov@ya.ru',0,NULL),
(1069,'marina7980','[\"ROLE_STUDENT\"]','$2y$13$HXgmVdy.8WamqTr.hoqLk.6gY8RBtOMTD8Pl6jNN23IZ0XN4ZpTbC','student7.jpg',5,1,'Пушменкова','Марина Григориевна','marina7980@outlook.com',0,NULL),
(1070,'arseniy6495','[\"ROLE_STUDENT\"]','$2y$13$rJi7JOxhpaWV4b5IJkFB/uEFlMJY6qd30CK3O1NICF4vSVvCwSTkq','student20.jpg',14,1,'Силиванов','Арсений Никитьевич','arseniy6495@hotmail.com',0,NULL),
(1071,'nika1977','[\"ROLE_STUDENT\"]','$2y$13$RmLh/2UzvfvyEOGh8T3ZN.XAzw/RxeF2P8ZJx8GdTW8JRPvmc1TXG','student7.jpg',8,1,'Карнаухова','Ника Себастьяновна','nika1977@yandex.ru',0,NULL),
(1072,'klara21021991','[\"ROLE_STUDENT\"]','$2y$13$FZvH5FBHJSl.KgaNyWHjL.r02fy.dKjJKBuYVUm/Qjj1P/g0UTRMG','student13.jpg',6,1,'Эссена','Клара Валентиновна','klara21021991@yandex.ru',0,NULL),
(1073,'milana1977','[\"ROLE_STUDENT\"]','$2y$13$PylW/G8y0nMRa92Pb26TMeInf55xxGC7McyX4.UvH365f0vhf6LCy','student18.jpg',7,1,'Клецка','Милана Викторовна','milana1977@outlook.com',0,NULL),
(1074,'yuliana55','[\"ROLE_STUDENT\"]','$2y$13$S9.9dEpxy1jVkp0.adBTIeY9zVVOWHt/KLdCagUckEUGCM68ioZ7u','student10.jpg',4,1,'Каунайте','Юлиана Петровна','yuliana55@hotmail.com',0,NULL),
(1075,'klavdiya.kozina','[\"ROLE_STUDENT\"]','$2y$13$C/0bPign.SYXGGXrMr7VwOKGUlmt/hNP1yJn2GU5BV0o8lEOt04oa','student16.jpg',17,1,'Козина','Клавдия Дмитриевна','klavdiya.kozina@ya.ru',0,NULL),
(1076,'anton80','[\"ROLE_STUDENT\"]','$2y$13$.M.LUxIBL0cBVUFyYYRHeOD5ZInMr7pUHZwBT93VmZJrzScLxj9Zm','student16.jpg',20,1,'Миронов','Антон Яковеевичевич','anton80@rambler.ru',0,NULL),
(1077,'fedor1978','[\"ROLE_STUDENT\"]','$2y$13$tlclTW0KRkABX9I1iJdpJuc0hLhQPzwbdh.U/TencYj.M.spy6QZW','student19.jpg',12,1,'Шапцев','Федор Семенович','fedor1978@gmail.com',0,NULL),
(1078,'alena.juravleva','[\"ROLE_STUDENT\"]','$2y$13$vbDQIMKl99QVltrX3s4y0uyR5.R/YIyyK5WvultAZ/JZPptHZ7sBm','student16.jpg',14,1,'Журавлёва','Алена Константиновна','alena.juravleva@mail.ru',0,NULL),
(1079,'efim1979','[\"ROLE_STUDENT\"]','$2y$13$PsuXQR57eb0gaLzj84UcFOe9Hzb1mE3JmNNNdxZ8WdWg6JWyc.Yx.','student17.jpg',6,1,'Витинский','Ефим Юринович','efim1979@hotmail.com',0,NULL),
(1080,'viktoriya1980','[\"ROLE_STUDENT\"]','$2y$13$oWZ1aXUB/4gGhxdAIqRYtemfUZNx0djoWeH7ao.sE5i6HACVB.6Xi','student9.jpg',11,1,'Телицына','Виктория Васильевна','viktoriya1980@outlook.com',0,NULL),
(1081,'tatyana.zueva','[\"ROLE_STUDENT\"]','$2y$13$6OPL5Ba0aSoYBi9cV8hWcuTQb3q0sNtaD9K.qGFSFY15gVwj2V.u2','student13.jpg',15,1,'Зуева','Татьяна Васильевна','tatyana.zueva@hotmail.com',0,NULL),
(1082,'marfa.kizatova','[\"ROLE_STUDENT\"]','$2y$13$KkHw8alymtoJLTg1skwlKuV4pTcLUASq3FqlOO0QVRBcaZIM4tlPq','student14.jpg',20,1,'Кизатова','Марфа Арсеньевна','marfa.kizatova@outlook.com',0,NULL),
(1083,'ekaterina1992','[\"ROLE_STUDENT\"]','$2y$13$ARrvBQm6sc.uOtPwUonmKeq2fOyoUAfy53MFiL.UUDnO.77IeRrlu','student14.jpg',4,1,'Квитко','Екатерина Игнатьевна','ekaterina1992@rambler.ru',0,NULL),
(1084,'pelageya.sutulina','[\"ROLE_STUDENT\"]','$2y$13$npYHVF/cPR.aTZDl.p.hmO5XL77JAc0MlvUlvUBkntd8q0/jKIHh6','student10.jpg',4,1,'Сутулина','Пелагея Яковна','pelageya.sutulina@mail.ru',0,NULL),
(1085,'asya05091974','[\"ROLE_STUDENT\"]','$2y$13$XHO7oa8/XD2Ntrp/fN7QieDL12pCT0Ql4sXXt2VSGZvFpvfmXDAdm','student18.jpg',13,1,'Козловская','Ася Никитьевна','asya05091974@hotmail.com',0,NULL),
(1086,'viktoriya2190','[\"ROLE_STUDENT\"]','$2y$13$Jv5Fe.OdkUWLRHaL44WmUeZc8WcoVV.d7Oc2wI4poEb2G2iFU0txy','student1.jpg',8,1,'Голованова','Виктория Ефимовна','viktoriya2190@rambler.ru',0,NULL),
(1087,'konstantin1986','[\"ROLE_STUDENT\"]','$2y$13$BwhBUT8NrpZjGwWGSt2OYeWT/ONAtv1AmUnbeEVIzccOaBtjRaWty','student8.jpg',12,1,'Ростовцев','Константин Валерьевич','konstantin1986@yandex.ru',0,NULL),
(1088,'viktor.alenin','[\"ROLE_STUDENT\"]','$2y$13$KPgboxrDgU33MzXTf1HZfe1zIYTE2Wh20zaM2cv8/R9GBzGmc0H1.','student4.jpg',19,1,'Аленин','Виктор Феоктистович','viktor.alenin@mail.ru',0,NULL),
(1089,'apollinariya2482','[\"ROLE_STUDENT\"]','$2y$13$r9P1Nb/bNToJ1irs5c34ne.cbG.iGDMq2aDl68e5rk6hBczpdTOBu','student5.jpg',8,1,'Якубова','Аполлинария Трофимовна','apollinariya2482@yandex.ru',0,NULL),
(1090,'nikolay26051972','[\"ROLE_STUDENT\"]','$2y$13$EzYrTh7aSjvCf47Sgq7wxuEAlqI7t8SlbHSJ22Jf12cZtEXgRnqem','student1.jpg',20,1,'Ящин','Николай Фадеевич','nikolay26051972@outlook.com',0,NULL),
(1091,'kseniya4045','[\"ROLE_STUDENT\"]','$2y$13$buPmS/vtSer93XMFHuLXre5RTo4zhfjyQQY8lSWM1g9wr/KTDdScy','student18.jpg',3,1,'Устюжанина','Ксения Прокопьевна','kseniya4045@gmail.com',0,NULL),
(1092,'marina4620','[\"ROLE_STUDENT\"]','$2y$13$iJZKFPhN7LVFr7HBADSaZunvdw.qU/cykNoD17BPlq/mOiai7aK5W','student2.jpg',12,1,'Полторака','Марина Витальевна','marina4620@rambler.ru',0,NULL),
(1093,'elizaveta72','[\"ROLE_STUDENT\"]','$2y$13$GWcGyAJGUzfJlvnwNqHwOeFikNKB5wrhqP/AuBdiMN.0yTE7zIZrq','student7.jpg',10,1,'Педич','Елизавета Венедиктовна','elizaveta72@mail.ru',0,NULL),
(1094,'tamara1985','[\"ROLE_STUDENT\"]','$2y$13$aM/bssr6gx7KGrZlfK9ceuqtfxbXYBg0pTQrKUq58ZN/3Pccwaan.','student5.jpg',3,1,'Буркова','Тамара Марковна','tamara1985@hotmail.com',0,NULL),
(1095,'prohor26','[\"ROLE_STUDENT\"]','$2y$13$7wVgueUqIbbk1nVQZ60NR.kopCL5kvPitq7PglspQN/VRbxijQkXS','student1.jpg',20,1,'Васютин','Прохор Антонович','prohor26@mail.ru',0,NULL),
(1096,'nikolay01041974','[\"ROLE_STUDENT\"]','$2y$13$J1ecuJTI3VEzZXgNwKSL6eZRAB8nPOWV1lpN9WRwbOYtdfRvAJASG','student4.jpg',4,1,'Квартиров','Николай Филиппович','nikolay01041974@yandex.ru',0,NULL),
(1097,'pelageya1975','[\"ROLE_STUDENT\"]','$2y$13$O6JvzIFqYrcySobnw0A4eewnE6hsUwyx8ndJR89hxV0KyTeC7n6Tm','student12.jpg',10,1,'Калагина','Пелагея Данииловна','pelageya1975@gmail.com',0,NULL),
(1098,'konstantin07081992','[\"ROLE_STUDENT\"]','$2y$13$LAEU3qQHRaY35NJAhfEkYuNsWZ5i4DsKZm7UaIHcBeZKbEW0N3F1G','student4.jpg',2,1,'Цитников','Константин Яковеевичевич','konstantin07081992@outlook.com',0,NULL),
(1099,'anastasiya.zyuganova','[\"ROLE_STUDENT\"]','$2y$13$/zPvBfs2GjLX91uyw4R29u7YmB3ljzHgY5T42llEnpOMpMvI91Toe','student10.jpg',6,1,'Зюганова','Анастасия Валерьевна','anastasiya.zyuganova@outlook.com',0,NULL),
(1100,'sofiya20021969','[\"ROLE_STUDENT\"]','$2y$13$8i5uZBMB8YIePppTEGeXk.UKSkkP4GRTbRB18gz2JO8JvReyvEtEK','student20.jpg',11,1,'Шмелева','София Юлиановна','sofiya20021969@hotmail.com',0,NULL),
(1101,'yaroslava.erofeeva','[\"ROLE_STUDENT\"]','$2y$13$TL15fHC6AkooNf2tmNuTfOmnm72MfAJDXVwAVIYiNJBdc1GxfpJjK','student7.jpg',6,1,'Ерофеева','Ярослава Игнатьевна','yaroslava.erofeeva@yandex.ru',0,NULL),
(1102,'lyudmila24','[\"ROLE_STUDENT\"]','$2y$13$izQT4O3oK6fuKWlh829GzOu7k5OA8B.USi0zX//RclK8PXOzNgzSm','student4.jpg',6,1,'Янковская','Людмила Герасимовна','lyudmila24@hotmail.com',0,NULL),
(1103,'taras10121971','[\"ROLE_STUDENT\"]','$2y$13$TP7sNAVRhd1SsRBFrQF2u.yEjL7dGq4DeDa9JK9ViEPq/f0HL4.Ty','student10.jpg',17,1,'Стукалов','Тарас Акимович','taras10121971@hotmail.com',0,NULL),
(1104,'sergey17121963','[\"ROLE_STUDENT\"]','$2y$13$JoOsQje/RwGLWsqtdgWFHuH8GihUNdtISAi.ouh3V2uRyH9bb/roe','student5.jpg',14,1,'Шинский','Сергей Викторович','sergey17121963@ya.ru',0,NULL),
(1105,'aleksey.ikalov','[\"ROLE_STUDENT\"]','$2y$13$1FcCG.Hg3sr.aTGbzQLrTOAt1p0TRyH6MdiiVXJOCQWe1tjptuG1W','student10.jpg',4,1,'Шикалов','Алексей Иванович','aleksey.ikalov@gmail.com',0,NULL),
(1106,'zoya1971','[\"ROLE_STUDENT\"]','$2y$13$E7GOkKqEWSoL8zoxNh4ZX.LmN5FM10Dg4H26sh8yVfTq3WpcNwv3G','student7.jpg',16,1,'Папанова','Зоя Леонтьевна','zoya1971@yandex.ru',0,NULL),
(1107,'vasiliy31','[\"ROLE_STUDENT\"]','$2y$13$wCcEl07sFuFA2Ruq7X.ew.avA0oSoqyKXN/42.Gnb79ujNMZFYkbi','student13.jpg',20,1,'Кудяшов','Василий Романович','vasiliy31@hotmail.com',0,NULL),
(1108,'efim19061990','[\"ROLE_STUDENT\"]','$2y$13$vlyNDCfWd9jXP42nHvpT1O5XB0rV9QD3meIYvpYr.F8ucg.1HFfk6','student15.jpg',6,1,'Юмашев','Ефим Антонович','efim19061990@mail.ru',0,NULL),
(1109,'lev4367','[\"ROLE_STUDENT\"]','$2y$13$fvuCu2KuUcZPiWhld/vO3OQiN/I5AfvnQEX8836LMFXgiRvAPWmlC','student7.jpg',5,1,'Ломоносов','Лев Всеволодович','lev4367@ya.ru',0,NULL),
(1110,'prohor.jiganov','[\"ROLE_STUDENT\"]','$2y$13$Q5/Q8T2izAfl1lu1LpQnvO.pQLCyMuFbt71YenY73Jao22K0zYgGS','student9.jpg',20,1,'Жиганов','Прохор Петрович','prohor.jiganov@rambler.ru',0,NULL),
(1111,'serafima.zykina','[\"ROLE_STUDENT\"]','$2y$13$hzdcshkSmib.y6.a0RIR5uI6YCpt9vC3hvzG0xt1OQtL/AMTch9Te','student3.jpg',4,1,'Зыкина','Серафима Давидович','serafima.zykina@ya.ru',0,NULL),
(1112,'serafima24051977','[\"ROLE_STUDENT\"]','$2y$13$VP2r.753QZp/eah7n4/sIe7jk4IgJzNjLlKGudjhzVJfmCaEzkDEu','student20.jpg',14,1,'Гершковича','Серафима Герасимовна','serafima24051977@hotmail.com',0,NULL),
(1113,'nikifor.kutyukov','[\"ROLE_STUDENT\"]','$2y$13$irA8uT4eSlXVygP2gGAsx.8ihb0MEQ1C8OjHqP22fJO8QF/xPVpdy','student14.jpg',7,1,'Кутюков','Никифор Тимофеевич','nikifor.kutyukov@outlook.com',0,NULL),
(1114,'sergey1993','[\"ROLE_STUDENT\"]','$2y$13$YxBbekClEBmuO6CnW3oPQOobrzwKMTStb7dm34Wi3d3uazr75yfl6','student7.jpg',4,1,'Николаев','Сергей Порфирьевич','sergey1993@hotmail.com',0,NULL),
(1115,'kirill.lytkin','[\"ROLE_STUDENT\"]','$2y$13$NT96DSPi3He3dOIrcKBz9eCTOPO15MyPPLSL0iwtzmohWky6nTaga','student7.jpg',18,1,'Лыткин','Кирилл Павлович','kirill.lytkin@yandex.ru',0,NULL),
(1116,'konstantin66','[\"ROLE_STUDENT\"]','$2y$13$/8ExakQdHFCJD8TqJTQ2QOsaYejxRWESMZjv1RNB359biQ9WomDwm','student13.jpg',17,1,'Аносов','Константин Филиппович','konstantin66@gmail.com',0,NULL),
(1117,'timofey1973','[\"ROLE_STUDENT\"]','$2y$13$sDOcPeBWNuN67Zcqm1rFE.ygV046xchNny.6QMFr8.6nCy9BpdSZi','student1.jpg',9,1,'Куксов','Тимофей Федорович','timofey1973@ya.ru',0,NULL),
(1118,'vasilisa4615','[\"ROLE_STUDENT\"]','$2y$13$FlNlfO4S6AohhGjKQevUd.npvJ7joJcDDFnKIn48pIyB2VBo17QFm','student12.jpg',15,1,'Морина','Василиса Никитьевна','vasilisa4615@hotmail.com',0,NULL),
(1119,'nastasya97','[\"ROLE_STUDENT\"]','$2y$13$bXl.Sylt7uBjUzJszabid.cTq46uHu7lU3nzhKlGvEDURiZ90o1QW','student1.jpg',20,1,'Просвирнина','Настасья Саввановна','nastasya97@mail.ru',0,NULL),
(1120,'larisa.rusakova','[\"ROLE_STUDENT\"]','$2y$13$VhSxfeeVSv1yiCBGbpPo9ugLqhCr7e3G7/I8n43RLs1ZTKkMfounG','student8.jpg',15,1,'Русакова','Лариса Марковна','larisa.rusakova@ya.ru',0,NULL),
(1121,'afanasiya9185','[\"ROLE_STUDENT\"]','$2y$13$tMtk0FBOuZWdK2tkH1C/DOk.YpUTVp63z/DExK3sKDCZQYB.HX1H2','student18.jpg',8,1,'Мордвинова','Афанасия Феодосьевна','afanasiya9185@yandex.ru',0,NULL),
(1122,'savva.demyanov','[\"ROLE_STUDENT\"]','$2y$13$AMZyKgg1/VfUAOzo/WkCoOaB34YtPhNUg12ITQ0to/PhQHkDKTJqO','student8.jpg',15,1,'Демьянов','Савва Прокльев','savva.demyanov@gmail.com',0,NULL),
(1123,'zoya1983','[\"ROLE_STUDENT\"]','$2y$13$D8ebq7yWRpyCCbFFfOZEJOkrXpbgpvSAhMmX5vaL77CzGNH0f.DUm','student8.jpg',13,1,'Кахадзе','Зоя Семеновна','zoya1983@hotmail.com',0,NULL),
(1124,'lyubov1985','[\"ROLE_STUDENT\"]','$2y$13$VWOesyI1N3/wWGf22j.8/.V4/GxzKfhK.YwNsmg5zH3ta5pyJH5ry','student13.jpg',6,1,'Негина','Любовь Данииловна','lyubov1985@gmail.com',0,NULL),
(1125,'anna14','[\"ROLE_STUDENT\"]','$2y$13$HmbDaCT22PJDdgmdnNer8e67DaOxzQJiF9HLt.MktMDa/0/ial9qq','student9.jpg',13,1,'Гребенщикова','Анна Валентиновна','anna14@ya.ru',0,NULL),
(1126,'makar11101976','[\"ROLE_STUDENT\"]','$2y$13$P2XBATXQ/8lz9ix0c.yq0OiZ2OLQZyQK3SS8iccy/tBs7UnBBVg46','student9.jpg',20,1,'Пищальников','Макар Климентьевич','makar11101976@hotmail.com',0,NULL),
(1127,'veronika1967','[\"ROLE_STUDENT\"]','$2y$13$VxTgXCk7/AOmSgk09IX8rOqMD/zm8HyFUCN7zHfKPXAoyltCy5k9S','student14.jpg',9,1,'Лунина','Вероника Прокловна','veronika1967@mail.ru',0,NULL),
(1128,'inna1967','[\"ROLE_STUDENT\"]','$2y$13$VpK8QoxHnD2aC7Yde1X0VeaVagcZGhvypBgqKGmO.14tGQcIkC2j2','student2.jpg',15,1,'Васнева','Инна Тимофеевна','inna1967@outlook.com',0,NULL),
(1129,'leontiy06011963','[\"ROLE_STUDENT\"]','$2y$13$LBWz41demaoNMR1309EQk.NueSnIzqNenHTCnJAHYis4L6HIpGiqm','student11.jpg',14,1,'Горюшин','Леонтий Максимович','leontiy06011963@mail.ru',0,NULL),
(1130,'klavdiya25111983','[\"ROLE_STUDENT\"]','$2y$13$Ty.hdQANB6ze0./wPxHKx.Lq.penx0eD9yUuUSZSpW2CJ7bXQgh/S','student17.jpg',16,1,'Енина','Клавдия Якововна','klavdiya25111983@mail.ru',0,NULL),
(1131,'feliks.syroporshnev','[\"ROLE_STUDENT\"]','$2y$13$GjWgVuMx4Kaj9VDFMqAwwep5vLMZoJX2k/i/TNel1c0QynHNPIhYq','student11.jpg',20,1,'Сыропоршнев','Феликс Тимофеевич','feliks.syroporshnev@rambler.ru',0,NULL),
(1132,'mila.babysheva','[\"ROLE_STUDENT\"]','$2y$13$DBUYnjfrw7ZGJlbwcntUk.FtKj5AGpAFDZOJolBXq3stKttTncVza','student12.jpg',16,1,'Бабышева','Мила Захаровна','mila.babysheva@hotmail.com',0,NULL),
(1133,'georgiy7060','[\"ROLE_STUDENT\"]','$2y$13$xewyziSchd0qLnmRYGajzenF9AfU9u3OOL1395x5VB56IDs9LxvjG','student3.jpg',13,1,'Манякин','Георгий Максимоич','georgiy7060@hotmail.com',0,NULL),
(1134,'arseniy1980','[\"ROLE_STUDENT\"]','$2y$13$kxvrgba9wDN3l5Hc4o9ANeqwIkERuFYfBtIT0D5hzBQQAtscuPJe6','student10.jpg',15,1,'Золотухин','Арсений Власович','arseniy1980@outlook.com',0,NULL),
(1135,'svetlana.milehina','[\"ROLE_STUDENT\"]','$2y$13$et4QwvWc1c70CXseEuik5OTeWCee9Db40yGCdt0lXxl4V9QSyCCKu','student4.jpg',8,1,'Милехина','Светлана Юрьевна','svetlana.milehina@ya.ru',0,NULL),
(1136,'anjela2965','[\"ROLE_STUDENT\"]','$2y$13$fc7.ugGMdERSozS8UPl8n.S8e1ANpq.Duz/6.bqG8XikWThQDqoRC','student19.jpg',17,1,'Агальцова','Анжела Евгеньевна','anjela2965@yandex.ru',0,NULL),
(1137,'valentina1977','[\"ROLE_STUDENT\"]','$2y$13$6iHtFtM2rsxecGDl.QolwOtM5vCv1zRtysTjXGKEJKLiwoJyXhuBe','student14.jpg',17,1,'Кравчук','Валентина Ивановна','valentina1977@gmail.com',0,NULL),
(1138,'gerasim13011979','[\"ROLE_STUDENT\"]','$2y$13$rE5N00aXl6Wt7krtDucnSOw0bj9RPiioEMq1Y4x9BbuQX7mZJSyja','student20.jpg',10,1,'Карташов','Герасим Константинович','gerasim13011979@outlook.com',0,NULL),
(1139,'tamara36','[\"ROLE_STUDENT\"]','$2y$13$Ay4X39WYYOJfpQ.ouQI2IOaQ63G9cXFcKGp00c5E3e7idNbecU40C','student5.jpg',2,1,'Капустова','Тамара Герасимовна','tamara36@ya.ru',0,NULL),
(1140,'valeriya19','[\"ROLE_STUDENT\"]','$2y$13$LyoSz09mR.dnxkPPMpTQluwS4/4rR3aOyKJ.l/gefDcfXR5ZTTSXi','student11.jpg',7,1,'Туманова','Валерия Лльвона','valeriya19@yandex.ru',0,NULL),
(1141,'timofey9492','[\"ROLE_STUDENT\"]','$2y$13$Y88Wdf4hukqM3YobAFcYVusHfXw97EQSGhxl.pAfV7JEgFj2QYq9y','student16.jpg',11,1,'Горбунов','Тимофей Феодосивич','timofey9492@hotmail.com',0,NULL),
(1142,'albina91','[\"ROLE_STUDENT\"]','$2y$13$jiVOHIMfTikTBWYhonjkOuMpHWuXVaJ93nu1LzvQOp9jJNiHDpW9K','student14.jpg',2,1,'Куцака','Альбина Даниловна','albina91@rambler.ru',0,NULL),
(1143,'albina1967','[\"ROLE_STUDENT\"]','$2y$13$hByuNiDwUQUsrS7bpWJ9beAKJzqiw8A9yeG1P3N.AJPwR1F0/c.C2','student12.jpg',9,1,'Ухтомская','Альбина Ефимовна','albina1967@mail.ru',0,NULL),
(1144,'petr72','[\"ROLE_STUDENT\"]','$2y$13$rX/V3dnxCG.su2SOVDajcuw8zmlKxS.Wj906clDUrBA4sIkckYo/K','student13.jpg',15,1,'Папанов','Петр Ефимович','petr72@ya.ru',0,NULL),
(1145,'petr73','[\"ROLE_STUDENT\"]','$2y$13$fXWglZYf0wwg9AbIscq8w.dYS0AHJUqhT7F3XtBFTmE1mbpHtV8gy','student15.jpg',18,1,'Кратенко','Петр Артемович','petr73@rambler.ru',0,NULL),
(1146,'albina1994','[\"ROLE_STUDENT\"]','$2y$13$qTDrDhC8wfllbPe.haX6fu.3DGwMq619d2OtTCmX5sH0FMKkdeoGi','student3.jpg',1,1,'Андроникова','Альбина Арсеньевна','albina1994@rambler.ru',0,NULL),
(1147,'fedor1974','[\"ROLE_STUDENT\"]','$2y$13$QELjCYXILXojVBBv4jkROO9X.Emc8MiLmvxeAdgx8MbRbzXJWMWGa','student15.jpg',18,1,'Баушев','Федор Федотович','fedor1974@ya.ru',0,NULL),
(1148,'raisa15061978','[\"ROLE_STUDENT\"]','$2y$13$A5Haqxs4Qnebwds/plp2Hu22APBNPtlu26cYrHJxM0SYqczy9atUG','student5.jpg',12,1,'Завражнова','Раиса Севастьяновна','raisa15061978@hotmail.com',0,NULL),
(1149,'olga16091992','[\"ROLE_STUDENT\"]','$2y$13$6q.hxzVnfjdfHyhXdM7PVu7gMt0EVtXFMlzn1o6v7uUuPQ1ZlZHwO','student5.jpg',5,1,'Шибалова','Ольга Феликсовна','olga16091992@mail.ru',0,NULL),
(1150,'daniil.livshic','[\"ROLE_STUDENT\"]','$2y$13$dw9Z.0tHu.LOaMzkndCqGOCtpPsHxKtZ9Va7XDpQTU7rEz3ji.AUe','student11.jpg',8,1,'Лившиц','Даниил Константинович','daniil.livshic@yandex.ru',0,NULL),
(1151,'evgeniy1987','[\"ROLE_STUDENT\"]','$2y$13$l6ZMu1nYmx4/mHgHlZPQoOXYgnPbPVQBUFrkkTipdFhqqV1e/UHwS','student11.jpg',5,1,'Углицкий','Евгений Тимофеевич','evgeniy1987@rambler.ru',0,NULL),
(1152,'eva61','[\"ROLE_STUDENT\"]','$2y$13$RmezJJWH6WADqMRGqi186uqOQgz8JLA5SYm0lF7itui0za8s5zrT6','student6.jpg',10,1,'Есипова','Ева Алексеевна','eva61@outlook.com',0,NULL),
(1153,'ekaterina18021987','[\"ROLE_STUDENT\"]','$2y$13$t5vLnHJ4IDtLY0FctS9M/uHwRMa1IDOwF4yai3esNThYGIyu.ZfhG','student12.jpg',10,1,'Яловегина','Екатерина Антоновна','ekaterina18021987@yandex.ru',0,NULL),
(1154,'grigoriy.ramazan','[\"ROLE_STUDENT\"]','$2y$13$4a9HQKDyHrFI3VW4U8YOhOyFY1qZ.CYoOf36hDnidiRyeysKfV9sC','student1.jpg',13,1,'Рамазан','Григорий Кириллович','grigoriy.ramazan@yandex.ru',0,NULL),
(1155,'arseniy.ledovskoy','[\"ROLE_STUDENT\"]','$2y$13$laqmlISYpwXeP3kXghH0xuWOpTFGjGTJZ0aGptQJX2rqvqQ2FgwR2','student6.jpg',13,1,'Ледовской','Арсений Антонович','arseniy.ledovskoy@outlook.com',0,NULL),
(1156,'alisa5464','[\"ROLE_STUDENT\"]','$2y$13$f8ZdFnY6Ha8iM9xEfAztVux7e2yQX0yUGnw4aNxh.ZIQaingkR53a','student17.jpg',5,1,'Цыринская','Алиса Тимофеевна','alisa5464@rambler.ru',0,NULL),
(1157,'elena4901','[\"ROLE_STUDENT\"]','$2y$13$Hl2kSfRn4wJhG6BBJz11K.8wjH5a.DYHHAThuAiY905pa.gbHM9t.','student10.jpg',6,1,'Купцова','Елена Кузьминовна','elena4901@ya.ru',0,NULL),
(1158,'marina3714','[\"ROLE_STUDENT\"]','$2y$13$KEJ7MSvN1wMmSJWKRD2w5umKyv2IsVuc7VvZXnymVd/8j4SCJPJtK','student5.jpg',11,1,'Селиверстова','Марина Артемова','marina3714@hotmail.com',0,NULL),
(1159,'alina4654','[\"ROLE_STUDENT\"]','$2y$13$oTRTdvITOo/nKxKQniGY8utLbsXq9looYMcbUtrKCVUnD.IwSGxuK','student19.jpg',18,1,'Третьякова','Алина Кирилловна','alina4654@mail.ru',0,NULL),
(1160,'nina.ponomareva','[\"ROLE_STUDENT\"]','$2y$13$PvAUFNnpQ8Mif6HX0coqUOnL0GMSds2ieeFXMcZGvySf6xYO/ZfK6','student12.jpg',20,1,'Пономарева','Нина Тимофеевна','nina.ponomareva@mail.ru',0,NULL),
(1161,'lyubov9281','[\"ROLE_STUDENT\"]','$2y$13$fgCNwyak3Xi/jQGQQErHK.nRkVWiJzGRLkRL6fe/82pxgaqHF7y5u','student1.jpg',14,1,'Беркова','Любовь Ираклиевна','lyubov9281@gmail.com',0,NULL),
(1162,'denis.jurov','[\"ROLE_STUDENT\"]','$2y$13$ZYTaWA6XNmn5y0Hwb.EBUuZ9SgTNRZm/qI1.eHkJcJ7oHM0HYlPl.','student2.jpg',12,1,'Журов','Денис Никанорович','denis.jurov@yandex.ru',0,NULL),
(1163,'milana.sitnikova','[\"ROLE_STUDENT\"]','$2y$13$RoxV25BUUHbLSS8TcrKEUeoqIT9LgztMfyV2lCVd8fW0P2DY5Nlg.','student18.jpg',1,1,'Ситникова','Милана Никандровна','milana.sitnikova@yandex.ru',0,NULL),
(1164,'zoya62','[\"ROLE_STUDENT\"]','$2y$13$Bn4Upeb1Wpiool0MQEAauebBndMDpuXeDfQffvLbl9ZLgs6T7UOBW','student11.jpg',12,1,'Ялчевская','Зоя Витальевна','zoya62@yandex.ru',0,NULL),
(1165,'nikolay19','[\"ROLE_STUDENT\"]','$2y$13$qVb3Rzil4IHmo61AaLQw4eLjbcj7/FyEPRaKiLxui9rJFifYIlA0S','student3.jpg',6,1,'Элинский','Николай Игнатьевич','nikolay19@rambler.ru',0,NULL),
(1166,'aleksandra.everlakova','[\"ROLE_STUDENT\"]','$2y$13$TGNoTG7Y93Biqwp6FjaZNO/beKIRwZf8WQgXMFdWjX3Uwem1ZaKwq','student6.jpg',2,1,'Эверлакова','Александра Никитьевна','aleksandra.everlakova@ya.ru',0,NULL),
(1167,'ivan1975','[\"ROLE_STUDENT\"]','$2y$13$pHABiXcyfcx7kNDn7aZWsuDPjGEJhDYkY3RXpE5v1fW8iQWU5vE92','student17.jpg',8,1,'Хуснутдинов','Иван Фадеевич','ivan1975@hotmail.com',0,NULL),
(1168,'valentina47','[\"ROLE_STUDENT\"]','$2y$13$b3G8vDjNBxIbnMToRXOBvORNfVzrCgy/OQWu4teq5IdNv6pfaeDi2','student11.jpg',10,1,'Бузыцкова','Валентина Нифонтовна','valentina47@ya.ru',0,NULL),
(1169,'prohor1981','[\"ROLE_STUDENT\"]','$2y$13$Eou24vRV17jEs0crBoq1w.K0FFLPQr3B.1Pr6Ut4whZWqEMcwRVHe','student6.jpg',20,1,'Лобачёв','Прохор Адамович','prohor1981@gmail.com',0,NULL),
(1170,'nikolay.simakin','[\"ROLE_STUDENT\"]','$2y$13$dSak1PWcrXuefWkXL8e0A.5D6gAFMCttT4RvFKujKA4spCiAwAXQG','student18.jpg',18,1,'Симакин','Николай Евгениевич','nikolay.simakin@ya.ru',0,NULL),
(1171,'vasiliy.avdoshkin','[\"ROLE_STUDENT\"]','$2y$13$QXWoXZIxmOaN.F5PPep92OxLyoEGW/9Gx8VxCBbt/TLfz.n9KgA0m','student16.jpg',12,1,'Авдошкин','Василий Даниилович','vasiliy.avdoshkin@hotmail.com',0,NULL),
(1172,'klavdiya17051965','[\"ROLE_STUDENT\"]','$2y$13$bIM7we5kAK9t3Z50SxGlYeI0f0TuMEydZcQ5FuBbBtyxpeC10ZT0K','student3.jpg',2,1,'Гребенникова','Клавдия Ростиславовна','klavdiya17051965@mail.ru',0,NULL),
(1173,'janna.yakimovich','[\"ROLE_STUDENT\"]','$2y$13$SJ0KO1o28jACkzDnDzQhBepH1CtXDL7bvUdQIEiibgNoSZcPq332y','student3.jpg',5,1,'Якимович','Жанна Давидович','janna.yakimovich@gmail.com',0,NULL),
(1174,'anna5857','[\"ROLE_STUDENT\"]','$2y$13$tsbH5FHz6wkY9wjQtSdMhetPSrJ9zyibt81DgLNudzpFr0YIdXpKC','student12.jpg',6,1,'Беспалова','Анна Яковна','anna5857@ya.ru',0,NULL),
(1175,'valentin.agafonov','[\"ROLE_STUDENT\"]','$2y$13$SWr3n5074nA09nSIPCGi.e9e.Kg1uO3Zd8vvt0j195TRCS7xKeJ9C','student19.jpg',15,1,'Агафонов','Валентин Юринович','valentin.agafonov@gmail.com',0,NULL),
(1176,'taras26','[\"ROLE_STUDENT\"]','$2y$13$WAakcnKxApv1B/wUsAqN8ucq6MeKKmHUJQu2bGyUhYdoAZlaxdpVC','student16.jpg',13,1,'Пожарский','Тарас Ефимович','taras26@hotmail.com',0,NULL),
(1177,'rostislav94','[\"ROLE_STUDENT\"]','$2y$13$jwZqvdXop5fGF0fO2I7rcOYBRU.S5hSh4eyAtVqVgWBtiP5hqh.ku','student18.jpg',10,1,'Пищиков','Ростислав Феодосивич','rostislav94@mail.ru',0,NULL),
(1178,'evgeniya73','[\"ROLE_STUDENT\"]','$2y$13$ewD2n9JZn1CG023Mqm7vXO0hMQmWkFYFW5UqfffS.FKdcWUAP8di6','student16.jpg',15,1,'Чечина','Евгения Семеновна','evgeniya73@outlook.com',0,NULL),
(1179,'galina99','[\"ROLE_STUDENT\"]','$2y$13$bBrEzLkq.mPJSk/jTGVTP.bgnzmY5MiWo18a.fja7jPDdoH4s.Otu','student20.jpg',6,1,'Носкова','Галина Емельяновна','galina99@gmail.com',0,NULL),
(1180,'afanasiy1961','[\"ROLE_STUDENT\"]','$2y$13$xF270IDFeK8aRVmrIAx5aOoA9/ns7H/ELO2DThoGhYBH6EbbZA8zm','student13.jpg',14,1,'Бурый','Афанасий Александрович','afanasiy1961@mail.ru',0,NULL),
(1181,'anfisa6831','[\"ROLE_STUDENT\"]','$2y$13$o7Lb62ZJwL/lpNvsPgbelO/2ypMxOO8lziWCza9B2zKCILzK2ns86','student5.jpg',8,1,'Димова','Анфиса Феодосьевна','anfisa6831@rambler.ru',0,NULL),
(1182,'aleksandra1961','[\"ROLE_STUDENT\"]','$2y$13$db/uCXDgtLpBlo5eRZQNYeJ73XlcMotPbbY41vKABSS.dQn7MrEWq','student6.jpg',8,1,'Блок','Александра Максимовна','aleksandra1961@rambler.ru',0,NULL),
(1183,'lidiya28','[\"ROLE_STUDENT\"]','$2y$13$SvGONQW.g3GNWdi1KSAlQeY.5K0i5rgdU1QRe4b2FM0jDI4PJPpKS','student20.jpg',12,1,'Голубовская','Лидия Саввановна','lidiya28@ya.ru',0,NULL),
(1184,'emelyan9795','[\"ROLE_STUDENT\"]','$2y$13$SSUCa8P8vI6DGjSACEyOYOZx9ac/ym5uNEBp7sPLo5p8q9MM2bjqK','student16.jpg',10,1,'Янчуковский','Емельян Панкратович','emelyan9795@ya.ru',0,NULL),
(1185,'apollinariya09011992','[\"ROLE_STUDENT\"]','$2y$13$DhaUx6Ry1rmKgjTYzUK.i.siSCHBUA2Pc1VQ7um45oUjyG/sIvjPi','student12.jpg',10,1,'Ростова','Аполлинария Кирилловна','apollinariya09011992@gmail.com',0,NULL),
(1186,'oksana.kalnberzina','[\"ROLE_STUDENT\"]','$2y$13$Zz8Gh.zh.fTv3pLqfGyJCe/lIwmnCbrVmAsTpunDfXdb1.aVz5ley','student10.jpg',9,1,'Калнберзина','Оксана Герасимовна','oksana.kalnberzina@yandex.ru',0,NULL),
(1187,'ekaterina23','[\"ROLE_STUDENT\"]','$2y$13$f9fDvIOjfbagf5GQJoanj.9uvSMVwG9vd7GcYqOSXxfiTQw0ipmRC','student9.jpg',9,1,'Козланюк','Екатерина Себастьяновна','ekaterina23@yandex.ru',0,NULL),
(1188,'aleksey.nabadchikov','[\"ROLE_STUDENT\"]','$2y$13$23JZyzSGYb/9wUzvayXAj.T3q1dMT54vvVXUafRbCoiYTb1W4i6ky','student17.jpg',19,1,'Набадчиков','Алексей Елизарович','aleksey.nabadchikov@outlook.com',0,NULL),
(1189,'mihail07101983','[\"ROLE_STUDENT\"]','$2y$13$NWvFspfwqJ3ztdPh2RAH3.rPbxB.9pzK5Wfn9JI4EMbJFfN5i2qqW','student6.jpg',20,1,'Пичушкин','Михаил Нифонтович','mihail07101983@mail.ru',0,NULL),
(1190,'yulian5514','[\"ROLE_STUDENT\"]','$2y$13$eboPZhjsJDaBqpM/dgWiuuBeyUiKK3XQ.OoQ3BCKa6mT3Bha6jkPe','student20.jpg',3,1,'Карбаинов','Юлиан Никанорович','yulian5514@outlook.com',0,NULL),
(1191,'milana77','[\"ROLE_STUDENT\"]','$2y$13$zhXtPfYtSzU2dZu4xGZ4Q.nqaX.YaaYvPyjbl318ECpg0y1AeINh6','student16.jpg',11,1,'Ольховская','Милана Ефимовна','milana77@hotmail.com',0,NULL),
(1192,'yakov1961','[\"ROLE_STUDENT\"]','$2y$13$vSQDuwlk6ZTlCzSBB6uRueIPNurF4q8r5EOUd4gp/mbyhQbN0NTa2','student4.jpg',10,1,'Федулов','Яков Яковлевич','yakov1961@outlook.com',0,NULL),
(1193,'mila6670','[\"ROLE_STUDENT\"]','$2y$13$RD7u3U4PNF/aJWfsxvs2Qe3g8vYDgvIuSFWY.NqZ5AiGfBA73zsN2','student8.jpg',11,1,'Ульянова','Мила Порфнрьевна','mila6670@hotmail.com',0,NULL),
(1194,'janna.mayorova','[\"ROLE_STUDENT\"]','$2y$13$9sMbKMzm8HxEWe13.2.QaOUkc8FwqkDgl1kFmDHehSrn7zPXlm7LK','student11.jpg',11,1,'Майорова','Жанна Валериановна','janna.mayorova@mail.ru',0,NULL),
(1195,'nikita78','[\"ROLE_STUDENT\"]','$2y$13$PX.koOl87NKqjb1DHAOSpOKEEZnuRHyruWzg8B9zfZSw6uZ9alOL2','student11.jpg',18,1,'Староволков','Никита Михаилович','nikita78@gmail.com',0,NULL),
(1196,'irina07061968','[\"ROLE_STUDENT\"]','$2y$13$u5MaT0WsLZURgSNdCOkbFOymlAJBMlnE2Gql0mtZxg4ilCIhqIx7u','student4.jpg',12,1,'Гаголина','Ирина Афанасьевна','irina07061968@gmail.com',0,NULL),
(1197,'eva4687','[\"ROLE_STUDENT\"]','$2y$13$s8A4C93800CIeJa1zwFGMO.YRwQWpwbx660uZgaBMehEWqtskUPoG','student19.jpg',5,1,'Свалова','Ева Николаевна','eva4687@ya.ru',0,NULL),
(1198,'valeriy.barsukov','[\"ROLE_STUDENT\"]','$2y$13$MnHeE7LdwQAJGAeTIUeNCeC3Oktb/NyLs8KlkBIZdJdQ/u/36Spta','student6.jpg',9,1,'Барсуков','Валерий Сергеевич','valeriy.barsukov@hotmail.com',0,NULL),
(1199,'tatyana1968','[\"ROLE_STUDENT\"]','$2y$13$enRmk/qDDayWpka30c6qwu661PSZ6Zy0YztdpXdI2r2VTARW0vq4G','student5.jpg',13,1,'Языкина','Татьяна Валериановна','tatyana1968@rambler.ru',0,NULL),
(1200,'polina.bakshaeva','[\"ROLE_STUDENT\"]','$2y$13$cVNwyGY/O0cnYLgPrkxgHeebx5AE0S0R5e6o7zfU0VaNZ26tVVx/i','student15.jpg',11,1,'Бакшаева','Полина Антоновна','polina.bakshaeva@hotmail.com',0,NULL),
(1201,'vasiliy03091978','[\"ROLE_STUDENT\"]','$2y$13$/ewnh54HadpxZASVU5psC.KftwgEKKqkxRIvNcY1CXauFY85HmUtq','student17.jpg',8,1,'Кондюрин','Василий Валентинович','vasiliy03091978@mail.ru',0,NULL),
(1202,'viktoriya.usilova','[\"ROLE_STUDENT\"]','$2y$13$VBjB0m5LfVGwqLueWuQMPOVWls8RcQ86xaPCY5tNr86vPcmdtZhvC','student3.jpg',1,1,'Усилова','Виктория Тарасовна','viktoriya.usilova@ya.ru',0,NULL),
(1203,'aleksandr1974','[\"ROLE_STUDENT\"]','$2y$13$C15DNbfuxoHNUCQ2i0Go5OOUAK7Q3ynxnCDJcfT4IXF9qg6xEvG.O','student7.jpg',18,1,'Сусляков','Александр Захарович','aleksandr1974@ya.ru',0,NULL),
(1204,'yakov.garkin','[\"ROLE_STUDENT\"]','$2y$13$i0kqnT2e/wLHzPeAawnsN.zmn8iMOfPXRo8WSeseWzdTs1jsA2uEK','student17.jpg',10,1,'Гарькин','Яков Герасимович','yakov.garkin@ya.ru',0,NULL),
(1205,'leontiy2694','[\"ROLE_STUDENT\"]','$2y$13$56e6TIfulYDE7uHw5Cm2Uu1tryK9ZSCXQHPYRERTHLpjZ8DXh4MEi','student14.jpg',3,1,'Подколодный','Леонтий Егорович','leontiy2694@ya.ru',0,NULL),
(1206,'alisa01091983','[\"ROLE_STUDENT\"]','$2y$13$F906jdm2pY2DjpwBf6UqDuFqi68VoYQW85wRB4WDd3nk084fHMGsO','student2.jpg',7,1,'Богатырева','Алиса Севастьяновна','alisa01091983@rambler.ru',0,NULL),
(1207,'timofey.zaykov','[\"ROLE_STUDENT\"]','$2y$13$CUeYMPASsqYpt.JCmsX2leyzqVwIQFFSN1KpsfQg0CwOE/C3o7zjS','student13.jpg',15,1,'Зайков','Тимофей Климентьевич','timofey.zaykov@yandex.ru',0,NULL),
(1208,'ulyana.kiryanova','[\"ROLE_STUDENT\"]','$2y$13$AlPG1jaqI/xiCynMafZBT.5Ox1lQxIMIl.AZWrEkPM/vW17q1CzeG','student7.jpg',18,1,'Кирьянова','Ульяна Георгьевна','ulyana.kiryanova@gmail.com',0,NULL),
(1209,'kirill38','[\"ROLE_STUDENT\"]','$2y$13$NP83UyRVvCt9TwTztmw7S.EhziD3tVlbR9pr907cyF1DUUqSp1gra','student11.jpg',8,1,'Семенов','Кирилл Лаврентиич','kirill38@gmail.com',0,NULL),
(1210,'mariya10031973','[\"ROLE_STUDENT\"]','$2y$13$0QBzTbC8d4UV58ApLzNwr.VLrWsFF0PR89pZ62jfEIdnsyj.3PLoS','student10.jpg',5,1,'Туржанская','Мария Лукьяновна','mariya10031973@rambler.ru',0,NULL),
(1211,'aleksandr55','[\"ROLE_STUDENT\"]','$2y$13$vAYnyY5.jsH/rJ9Cs7NvxuEcQ1WpQDbMsxmou0OlqzEddMoMI9/zu','student15.jpg',8,1,'Кулешов','Александр Никандрович','aleksandr55@gmail.com',0,NULL),
(1212,'venedikt90','[\"ROLE_STUDENT\"]','$2y$13$COcURyu/UMtCl5JyMaKONecIvYpogwWmny0LncI5ErjF0i/wJwrpe','student6.jpg',15,1,'Жилин','Венедикт Венедиктович','venedikt90@rambler.ru',0,NULL),
(1213,'evgeniy.bogatyrev','[\"ROLE_STUDENT\"]','$2y$13$3jSQshJ5CsOEGrcvg8nA2uXUeNSzhFiim3SUQLP7e0EM1Cjkvl/1q','student10.jpg',7,1,'Богатырев','Евгений Валерианович','evgeniy.bogatyrev@rambler.ru',0,NULL),
(1214,'margarita05051996','[\"ROLE_STUDENT\"]','$2y$13$bkhIbEsDCcLKDMQZ7aTscO7EY1jiSXNjbTjJWpO3Aniw3Eh.nV3iG','student2.jpg',6,1,'Щепетинникова','Маргарита Филипповна','margarita05051996@yandex.ru',0,NULL),
(1215,'vasiliy.ionov','[\"ROLE_STUDENT\"]','$2y$13$gKMoL7kXQZPxfKyOTIdz.e9WnTWgzNeMWKi/4s69DHox3Pa.hgNOe','student10.jpg',12,1,'Ионов','Василий Макарович','vasiliy.ionov@outlook.com',0,NULL),
(1216,'pavel71','[\"ROLE_STUDENT\"]','$2y$13$OyYu6RdHi0qMez9Tz7wPdOCDg3hlm5JJ4BBzJFIjSiBHVkgn35HZe','student18.jpg',5,1,'Язовицкий','Павел Александрович','pavel71@yandex.ru',0,NULL),
(1217,'afanasiy16031977','[\"ROLE_STUDENT\"]','$2y$13$exsa8MYQoID.jvhDtS6taeyPBivEgWZ/d4AaXyH8w4uBvCZEBT/4S','student5.jpg',2,1,'Пушменков','Афанасий Власович','afanasiy16031977@yandex.ru',0,NULL),
(1218,'gavriil8593','[\"ROLE_STUDENT\"]','$2y$13$Tn.Dzze6yHAQ77vD2pEZueDbksTKtGwTw.gj5IuYe97a62OKBlJ06','student16.jpg',16,1,'Козарис','Гавриил Панкратович','gavriil8593@hotmail.com',0,NULL),
(1219,'pavel9583','[\"ROLE_STUDENT\"]','$2y$13$vlGoE/0MA4Uw/yjPTi0MNe1BYjUiuwXDW.QkPejx20ZuCHkOQdFBm','student9.jpg',17,1,'Онегин','Павел Севастьянович','pavel9583@outlook.com',0,NULL),
(1220,'nina6231','[\"ROLE_STUDENT\"]','$2y$13$xDafl9Q/xjHHOhY/d6hy7e1WVCGL7RVFsiefv5JeHSFN7H4Bo.RdO','student20.jpg',1,1,'Ященко','Нина Афанасьевна','nina6231@rambler.ru',0,NULL),
(1221,'mariya1992','[\"ROLE_STUDENT\"]','$2y$13$DfTzQP5JV3VvDKdrFcAHcuYcO/venTn38459q0c2e.nwVSFhPtBSW','student16.jpg',10,1,'Эпингер','Мария Никаноровна','mariya1992@gmail.com',0,NULL),
(1222,'nonna8355','[\"ROLE_STUDENT\"]','$2y$13$1tcvM7TqRQLRe5w9KcaBXunIGImfIIy5eN0Us.I1PqtERp3bx9IA.','student3.jpg',5,1,'Махнер','Нонна Романовна','nonna8355@hotmail.com',0,NULL),
(1223,'raisa29','[\"ROLE_STUDENT\"]','$2y$13$mnUA8Ci95E2j7k3l4Z0pQ.Jw8MEGRlVhFclNAb6G9tbrFBkgSWECG','student7.jpg',4,1,'Носкова','Раиса Николаевна','raisa29@gmail.com',0,NULL),
(1224,'ekaterina32','[\"ROLE_STUDENT\"]','$2y$13$YmvrxeRu/PSS4GZARDfS/utm9dM3ROPkwZiXyLSS5MDP/6jbCsxuK','student16.jpg',6,1,'Килессо','Екатерина Захаровна','ekaterina32@yandex.ru',0,NULL),
(1225,'maksim86','[\"ROLE_STUDENT\"]','$2y$13$UVOpVCDXPJBBMfgXVeaWDu4Hp7abyIUPiHsQmUzCZt1DIiFuuCAjK','student15.jpg',7,1,'Серебров','Максим Тимофеевич','maksim86@outlook.com',0,NULL),
(1226,'artem14111986','[\"ROLE_STUDENT\"]','$2y$13$zTXp9u2/LI11u46l0cPUQ.xfdSxYVWRgjx8KUOiM15ieXz432YBFG','student10.jpg',16,1,'Созыкин','Артем Константинович','artem14111986@mail.ru',0,NULL),
(1227,'yakov73','[\"ROLE_STUDENT\"]','$2y$13$eCu11qlmVSfF5IxuFrUjU.zPKZrtMhMRd8Iis5UQ2fUa9i5Fs/2N.','student10.jpg',20,1,'Кочергов','Яков Тимофеевич','yakov73@gmail.com',0,NULL),
(1228,'rimma1988','[\"ROLE_STUDENT\"]','$2y$13$RNCBG/FhL2o1G/t76kl7T.JZuqmji8CcNLNmiBdgkhuPfcTfbkny2','student4.jpg',12,1,'Игнатенкова','Римма Константиновна','rimma1988@ya.ru',0,NULL),
(1229,'georgiy.travkin','[\"ROLE_STUDENT\"]','$2y$13$AfC8NH.zYBsbDgfFKgPAyO1oSuxg.Tw5VzUOJqyLitZzoU1SSUn/S','student4.jpg',8,1,'Травкин','Георгий Васильевич','georgiy.travkin@gmail.com',0,NULL),
(1230,'artem73','[\"ROLE_STUDENT\"]','$2y$13$BxqbjeHVr08w9gY9n3lkDuzp3DW8zLQ4LsCGT3wm8AFv7AbYZ5Fam','student5.jpg',6,1,'Яльцев','Артем Прокопьевич','artem73@mail.ru',0,NULL),
(1231,'artem04031971','[\"ROLE_STUDENT\"]','$2y$13$2pwDYt8Kz6PYF9MGSAwVweD7U8vIZWMGbZsvvRmwjm98qMk41nbra','student18.jpg',15,1,'Ясинский','Артем Иванович','artem04031971@outlook.com',0,NULL),
(1232,'elizaveta.eglova','[\"ROLE_STUDENT\"]','$2y$13$YxzoDgwVsluQPybyQzH8Vec6zdX41UTq7c.hqURilHpPvmztA7m5q','student5.jpg',15,1,'Щеглова','Елизавета Константиновна','elizaveta.eglova@mail.ru',0,NULL),
(1233,'sevastyan9014','[\"ROLE_STUDENT\"]','$2y$13$8mkrNQHwKOJMDeDLAXQrSO9nHVg29lhSW31iiafsMDBr0dp99GTYu','student18.jpg',16,1,'Малинов','Севастьян Прохорович','sevastyan9014@yandex.ru',0,NULL),
(1234,'pavel.akimov','[\"ROLE_STUDENT\"]','$2y$13$tEW4EJSb46Vz10kM8Tz50eBxrJb7qX5/BHGG0X7m9P.JfaxCcguiq','student15.jpg',8,1,'Акимов','Павел Степанович','pavel.akimov@mail.ru',0,NULL),
(1235,'trofim1985','[\"ROLE_STUDENT\"]','$2y$13$eeCbM0My4YSd6Ey1naaS2.NlFhpLsmq9bhVXrVnj4vsGix1Gg7LjC','student1.jpg',9,1,'Колесов','Трофим Геннадьевич','trofim1985@mail.ru',0,NULL),
(1236,'vasilisa1965','[\"ROLE_STUDENT\"]','$2y$13$/2yjZIgAXubMkTRJgjo4j.88/0q9DBoqKJw4f3MStRvjLHgdZLMjK','student13.jpg',14,1,'Непеина','Василиса Иннокентьевна','vasilisa1965@rambler.ru',0,NULL),
(1237,'pelageya1965','[\"ROLE_STUDENT\"]','$2y$13$2GgJlm3f8dQtxQmsum3XN.ueEuh/TCiLmD3fFO.QUtJ0MeeQJ0Ofe','student12.jpg',15,1,'Прокашева','Пелагея Макаровна','pelageya1965@rambler.ru',0,NULL),
(1238,'trofim1969','[\"ROLE_STUDENT\"]','$2y$13$94PBcmHH/1qKp.iMrOgQM.DQfH.g.klxugn0XG0H/DzXOSuQtxNKa','student12.jpg',9,1,'Ярошенко','Трофим Степанович','trofim1969@rambler.ru',0,NULL),
(1239,'filipp3217','[\"ROLE_STUDENT\"]','$2y$13$HJ70l4wsyLpZtR0m6UdYW.XDUjRr.cOK8YY.ru47iAb9PEU8gl.T.','student10.jpg',4,1,'Лопатин','Филипп Вячеславович','filipp3217@hotmail.com',0,NULL),
(1240,'ivan.sysoev','[\"ROLE_STUDENT\"]','$2y$13$ThdbMNdEmcsrVrdadodHiOHPCP/PKq9UAZDMxXBmavSP7Mc7K87f6','student2.jpg',14,1,'Сысоев','Иван Кириллович','ivan.sysoev@gmail.com',0,NULL),
(1241,'rada.zaporojec','[\"ROLE_STUDENT\"]','$2y$13$wL/wbqQi7AwKzHVVurTO2O7hwiBhZ5XmBd4L25VYi4SF2VNW1QQim','student5.jpg',6,1,'Запорожец','Рада Прокловна','rada.zaporojec@mail.ru',0,NULL),
(1242,'semen14','[\"ROLE_STUDENT\"]','$2y$13$SZOULtnFjjrHWkxXW9HBz.y5tg6eFSpWPEOjTgJG2YsnxLn8llaEe','student16.jpg',16,1,'Андронов','Семен Нифонтович','semen14@gmail.com',0,NULL),
(1243,'fedor03011992','[\"ROLE_STUDENT\"]','$2y$13$mxs58V4oxzEEvyA9QZiNVe1DbtRzo5e7cJm1YAnWcHHJErxICF4Vm','student8.jpg',20,1,'Боголюбов','Федор Ефремович','fedor03011992@rambler.ru',0,NULL),
(1244,'kira4268','[\"ROLE_STUDENT\"]','$2y$13$3lEZHWyunohqhqhSKMUb8O9EpIvixpC94jkaoQT9tSe2HcKC7Vn7G','student6.jpg',1,1,'Шарапова','Кира Егоровна','kira4268@mail.ru',0,NULL),
(1245,'mark1988','[\"ROLE_STUDENT\"]','$2y$13$3eOJSOi7G7nXFAknIAwpyeTKpnH5YY1TLWszTMuKGijSbhpUVc7fu','student13.jpg',8,1,'Ямбаев','Марк Герасимович','mark1988@mail.ru',0,NULL),
(1246,'lana24','[\"ROLE_STUDENT\"]','$2y$13$5BZ6GdjgUjL29pZldSmDrORVsYfg1DbbwsHOdfly5LgRH9bbg0h/m','student2.jpg',8,1,'Чекудаева','Лана Прохоровна','lana24@mail.ru',0,NULL),
(1247,'tatyana36','[\"ROLE_STUDENT\"]','$2y$13$qTBmsRSijNLwfYXDJD44kuOrsizNItzyx/kgrAoIYUTgGvby6tzaq','student16.jpg',6,1,'Щеголяева','Татьяна Всеволодовна','tatyana36@outlook.com',0,NULL),
(1248,'aleksey.krasnobaev','[\"ROLE_STUDENT\"]','$2y$13$jyEG/p8JXvBsAXNBmmcxbexlT44Dt9VM.ci8dv3q/WrGrBF57WnCi','student16.jpg',9,1,'Краснобаев','Алексей Викторович','aleksey.krasnobaev@ya.ru',0,NULL),
(1249,'prohor1977','[\"ROLE_STUDENT\"]','$2y$13$bOANhrhWin6TuET32OY9yOvVLrr1UyRd3ag1iyR/BYsSsgTRVazYi','student14.jpg',7,1,'Ханинов','Прохор Севастьянович','prohor1977@outlook.com',0,NULL),
(1250,'daniil6219','[\"ROLE_STUDENT\"]','$2y$13$xJF1HGM1fF2uuRizWis6J.YAMaUtl78Zu9jCZuN/Taiwj5/G2gejS','student18.jpg',20,1,'Чупраков','Даниил Феодосивич','daniil6219@hotmail.com',0,NULL),
(1251,'gavriil57','[\"ROLE_STUDENT\"]','$2y$13$JoQZ7FBYJp6QyB2Ngmn3TOkw2HiIzUDFTAo1n6RivXU9enyebDbWu','student5.jpg',7,1,'Яппаров','Гавриил Ефимович','gavriil57@outlook.com',0,NULL),
(1252,'leontiy1969','[\"ROLE_STUDENT\"]','$2y$13$Z5DHgDwWrpAd4nTn8CqRs.JX3Xr.Rt5gotIbSuT3qbFzpmhZ65yle','student19.jpg',16,1,'Ромазан','Леонтий Нифонтович','leontiy1969@hotmail.com',0,NULL),
(1253,'valeriya7820','[\"ROLE_STUDENT\"]','$2y$13$rD3I1WVdoT/Bpu0hJ0i.C.lOPdSaCb/F.AsDlRqVA6An4sSsX4pni','student19.jpg',3,1,'Бурмакина','Валерия Тимофеевна','valeriya7820@gmail.com',0,NULL),
(1254,'galina34','[\"ROLE_STUDENT\"]','$2y$13$lHO5tKiQJjhz69p8klYM0eddRB059Q/ENu5ivatMX5BXEgITN4RQS','student18.jpg',1,1,'Статник','Галина Валентиновна','galina34@yandex.ru',0,NULL),
(1255,'valeriy58','[\"ROLE_STUDENT\"]','$2y$13$Len/QYKQzshmnAxm6wWb0.SkHYwfBBb9uZ1c5Pn8.0ElfA.l2FwzO','student19.jpg',11,1,'Фролов','Валерий Прохорович','valeriy58@outlook.com',0,NULL),
(1256,'nika28121993','[\"ROLE_STUDENT\"]','$2y$13$VigZBmqJs8FKzf1P81q9g.EbQSWWU4uJeBz2fVxnVuJDzg7EG5etW','student12.jpg',3,1,'Янкелевича','Ника Серафимовна','nika28121993@ya.ru',0,NULL),
(1257,'konstantin6927','[\"ROLE_STUDENT\"]','$2y$13$0XhZd9ujsQwmMVMzeyHrH.SrqlWHrFOWg/NHkm2/vny0K36L7.g0e','student9.jpg',12,1,'Ялбачев','Константин Яковлевич','konstantin6927@gmail.com',0,NULL),
(1258,'klara1969','[\"ROLE_STUDENT\"]','$2y$13$saoLidE6bLRumojdSnaBW.YwFbC1Lui5wtSUbg/0pwlItGuEfiidW','student14.jpg',16,1,'Журавлева','Клара Петровна','klara1969@ya.ru',0,NULL),
(1259,'raisa23121980','[\"ROLE_STUDENT\"]','$2y$13$Gt49/KXVsA885YMYbdXXqOnTpuEGZwaYC6drCGrDPTbvE8f2UPu76','student18.jpg',1,1,'Суворина','Раиса Васильевна','raisa23121980@mail.ru',0,NULL),
(1260,'danila1979','[\"ROLE_STUDENT\"]','$2y$13$GYKgIhFducsacd0QaqN1P.wOaxPsT4AbGuDonRqXBeO2qSP5Iz22.','student12.jpg',5,1,'Игумнов','Данила Яковлевич','danila1979@yandex.ru',0,NULL),
(1261,'inna69','[\"ROLE_STUDENT\"]','$2y$13$FTQmWdFzXAZ1Z9wbIM7dDOrh4Pydam.wB84YBMWwbljwvrA1cLMgK','student3.jpg',7,1,'Иванкова','Инна Семеновна','inna69@outlook.com',0,NULL),
(1262,'yuriy.larichev','[\"ROLE_STUDENT\"]','$2y$13$/LNc.snMR0RB4181aTzTw.RNMdZLQiPC94ORrylJL3uPBUOLsFk/W','student14.jpg',20,1,'Ларичев','Юрий Даниилович','yuriy.larichev@gmail.com',0,NULL),
(1263,'marianna1739','[\"ROLE_STUDENT\"]','$2y$13$.ZGjQ2MT3F1bZ/ivOT2iuOUFkKfYjjtoGU8Rr6qO0tvXoKg1.LDwy','student9.jpg',19,1,'Павленко','Марианна Николаевна','marianna1739@ya.ru',0,NULL),
(1264,'ignat18061996','[\"ROLE_STUDENT\"]','$2y$13$rnTYcNGQhMRKjibl58cc9ehsnJmavNi6iRHkEvQLc0pQdlecM90cS','student9.jpg',10,1,'Палванов','Игнат Ипполитович','ignat18061996@mail.ru',0,NULL),
(1265,'vitaliy47','[\"ROLE_STUDENT\"]','$2y$13$dR0.BXeywj4PMH2wBIdiouUjUp3.YpgdCU.XMXa3U0EQZj3hOccgi','student5.jpg',14,1,'Емельянов','Виталий Павлович','vitaliy47@mail.ru',0,NULL),
(1266,'janna.ulc','[\"ROLE_STUDENT\"]','$2y$13$dih9pm1Lp167lD5inx39RuKBzdhmBXTwZwQgZaqyUzwGu3vEBPeay','student6.jpg',10,1,'Шульц','Жанна Евгеньевна','janna.ulc@gmail.com',0,NULL),
(1267,'ivan8298','[\"ROLE_STUDENT\"]','$2y$13$hGMNalyUGG1TNpJSiSkrCuEGw9zCL0utnSa7bEsSMJQTzPlSHe7Lm','student19.jpg',7,1,'Ядров','Иван Романович','ivan8298@ya.ru',0,NULL),
(1268,'yakov45','[\"ROLE_STUDENT\"]','$2y$13$LiqfxZB0/ptJ/09wG3AvFuGyhL7HrG344xQCsaf4GR7G82DsrjmPu','student20.jpg',7,1,'Зайцев','Яков Дмитриевич','yakov45@rambler.ru',0,NULL),
(1269,'raisa3313','[\"ROLE_STUDENT\"]','$2y$13$yF8PFi/Iqp3bbrW51ZSO.Oh0DL5cM/WYe6i5LL3DsGgZZd/sBn.Xa','student9.jpg',7,1,'Самойлова','Раиса Емельяновна','raisa3313@outlook.com',0,NULL),
(1270,'varvara9836','[\"ROLE_STUDENT\"]','$2y$13$tLG73CNx.YhDDIbL60O8f.3IP6wlEz9tt5srZ3DUPTgHVyWoPO.JK','student3.jpg',20,1,'Трактирникова','Варвара Ефимовна','varvara9836@outlook.com',0,NULL),
(1271,'filipp3583','[\"ROLE_STUDENT\"]','$2y$13$jPSlxz6h6A/TlPiitjgBfOYJ9F4AfcM8s4SeVmYbf7udxL7toxkMG','student5.jpg',2,1,'Парамонов','Филипп Никифорович','filipp3583@gmail.com',0,NULL),
(1272,'oksana19031961','[\"ROLE_STUDENT\"]','$2y$13$rWDFwmRjQYhrAY7opgqytOvVJNOaACITEBlCuHtShEKvUfoSob/Ja','student4.jpg',9,1,'Щербина','Оксана Никандровна','oksana19031961@mail.ru',0,NULL),
(1273,'eva7975','[\"ROLE_STUDENT\"]','$2y$13$d0p/jPHI1wfIkRUnKT.6TukeMiXeODFAdsD32JcatYEhlgC/CP.yi','student18.jpg',1,1,'Водоватова','Ева Денисовна','eva7975@outlook.com',0,NULL),
(1274,'tatyana.urupina','[\"ROLE_STUDENT\"]','$2y$13$3dsm9mqyAlfRMlLN/yLAI.FMENgDbN8LfVE5gZesxHl0zAn5DZFmC','student10.jpg',9,1,'Шурупина','Татьяна Давидовна','tatyana.urupina@gmail.com',0,NULL),
(1275,'maryana1991','[\"ROLE_STUDENT\"]','$2y$13$deswF0qhIzXHvWQzDuGrs.VliVIZEVoaPAMw9dOKi00/USr7HCsp6','student5.jpg',12,1,'Саблина','Марьяна Константиновна','maryana1991@yandex.ru',0,NULL),
(1276,'arkadiy.idlovskiy','[\"ROLE_STUDENT\"]','$2y$13$eebFJ/I5XYdP0.zu2QnnqOmFJL3PyORMFvm4hTpsgL2TcrpSYGmTS','student2.jpg',1,1,'Шидловский','Аркадий Ираклиевич','arkadiy.idlovskiy@hotmail.com',0,NULL),
(1277,'adam33','[\"ROLE_STUDENT\"]','$2y$13$Un7PR/62FCDkAoHqufwZoODklV.2TdQrmT3a2Eej0D8psA6MF70AO','student9.jpg',5,1,'Добролюбов','Адам Семенович','adam33@outlook.com',0,NULL),
(1278,'marianna1992','[\"ROLE_STUDENT\"]','$2y$13$nZk4yZSwan8a74v4J30W6uXn6wtDkfut1zatFi7hb3q4OO6CmpU3K','student17.jpg',12,1,'Шаталова','Марианна Яковна','marianna1992@gmail.com',0,NULL),
(1279,'daniil.veselkov','[\"ROLE_STUDENT\"]','$2y$13$Vyq66tMjr2Yj0JP/dqoDvO95Ldxvmdpi/qxGuxjtG4gqDQdpA5Cua','student15.jpg',3,1,'Веселков','Даниил Юлианович','daniil.veselkov@rambler.ru',0,NULL),
(1280,'egor8628','[\"ROLE_STUDENT\"]','$2y$13$3/vnahuNxP23ysUnT/tz1eniV57CC98j.9MZcT0//g6L1nzLLMsFi','student5.jpg',9,1,'Цыринский','Егор Артемович','egor8628@mail.ru',0,NULL),
(1281,'viktoriya12011973','[\"ROLE_STUDENT\"]','$2y$13$CB6CyFpRI5GRVpZS2rHAn.7ShrcatsUFnTuZjvboHXsdR.Zo3IH/G','student18.jpg',1,1,'Блантер','Виктория Юрьевна','viktoriya12011973@outlook.com',0,NULL),
(1282,'alisa.vardygula','[\"ROLE_STUDENT\"]','$2y$13$ZRt5GFELj9t7gmvDR66D1e0TVK0yfbTy1p5vvTf9YBVWkk6m3Wkz.','student19.jpg',9,1,'Швардыгула','Алиса Георгьевна','alisa.vardygula@rambler.ru',0,NULL),
(1283,'yuliana14091984','[\"ROLE_STUDENT\"]','$2y$13$WVx0HM6j0oCRMY6c6n/4nepeprTC/sbTWevDN3fZYTiEiWNGvtCde','student16.jpg',17,1,'Давыдова','Юлиана Никаноровна','yuliana14091984@hotmail.com',0,NULL),
(1284,'viktor1980','[\"ROLE_STUDENT\"]','$2y$13$mgxHzOIZqQuhA2EJdB4GEOoG3GQind3fztY2/if36Gus2GgjQdc.6','student7.jpg',5,1,'Ярославцев','Виктор Федорович','viktor1980@mail.ru',0,NULL),
(1285,'viktoriya1994','[\"ROLE_STUDENT\"]','$2y$13$QFtvwXxA9W3oZKNW6RVwueM/QCiEkPWfryZdwghP93XL6EPJHDYvu','student6.jpg',12,1,'Кобыльских','Виктория Федотовна','viktoriya1994@rambler.ru',0,NULL),
(1286,'alla03071992','[\"ROLE_STUDENT\"]','$2y$13$4jokOHqkBl5rMWH2fCpSHOWS8bdiLVXy1IuqH8A8FrMzLPyftKbwW','student14.jpg',11,1,'Весовая','Алла Петровна','alla03071992@rambler.ru',0,NULL),
(1287,'taisiya9301','[\"ROLE_STUDENT\"]','$2y$13$KNUnjPl38km1Z5aCjorLNe7sOqV1x1D2zdiNSTjj350Jw8eKlrphq','student2.jpg',5,1,'Гриневеца','Таисия Семеновна','taisiya9301@rambler.ru',0,NULL),
(1288,'irina70','[\"ROLE_STUDENT\"]','$2y$13$GCnTLwDxiz0N2dpwCkp7degumw0LMIryXTZDKG8Ue8oTpfoT7hegC','student18.jpg',20,1,'Белякова','Ирина Ипполитовна','irina70@hotmail.com',0,NULL),
(1289,'kirill4972','[\"ROLE_STUDENT\"]','$2y$13$8U9qfqMYaQbt7g9ooI7J7O9KXHnJsJd./mEX7xyaIcs069ersobcW','student3.jpg',1,1,'Быков','Кирилл Герасимович','kirill4972@hotmail.com',0,NULL),
(1290,'egor37','[\"ROLE_STUDENT\"]','$2y$13$7WPQ8dyKS1LlgZLGUuPFWuNk4nkdORoKH4anOln9aFW9HzrWVKN5S','student10.jpg',6,1,'Яблонов','Егор Яковеевичевич','egor37@hotmail.com',0,NULL),
(1291,'svetlana1971','[\"ROLE_STUDENT\"]','$2y$13$WQot.ztp/.sRd0TFZvSwB.Bm3b7p0Qokyr2iCuCjgUybo5NriYlgi','student13.jpg',3,1,'Комракова','Светлана Константиновна','svetlana1971@hotmail.com',0,NULL),
(1292,'aleksandra.erbatyha','[\"ROLE_STUDENT\"]','$2y$13$oiVdxwcSJYNLfEQauKKoZeWLt0VYTtknAOe0e5TBjw3bKlhsfud9G','student13.jpg',18,1,'Щербатыха','Александра Максимовна','aleksandra.erbatyha@gmail.com',0,NULL),
(1293,'aleksey68','[\"ROLE_STUDENT\"]','$2y$13$HKcNM.pbc0pRYkqlaXaViOUTEERnNeh5wuYKWZNpRKbqIX.0TCCie','student4.jpg',16,1,'Якшибаев','Алексей Антонрвич','aleksey68@outlook.com',0,NULL),
(1294,'nastasya.pogrebnyak','[\"ROLE_STUDENT\"]','$2y$13$vs6.HAmD6EtBOhHA7yE9Ie8wz1dAFXLYjSIEayXGn5CoUFAwGSI.C','student19.jpg',9,1,'Погребняк','Настасья Егоровна','nastasya.pogrebnyak@mail.ru',0,NULL),
(1295,'savva1992','[\"ROLE_STUDENT\"]','$2y$13$8PGDWwqVHLzMSQj9.aCjgub8xCivG80QFT/EPc.IXb3YmVZLV9bz6','student1.jpg',19,1,'Самойлов','Савва Савванович','savva1992@yandex.ru',0,NULL),
(1296,'ignatiy14081981','[\"ROLE_STUDENT\"]','$2y$13$WDuRRuv54L1y4mkas7sTG.dDWyH/IroCTXpOJRw3JDO6qegRHQueu','student8.jpg',14,1,'Гайдученко','Игнатий Герасимович','ignatiy14081981@outlook.com',0,NULL),
(1297,'marianna2051','[\"ROLE_STUDENT\"]','$2y$13$Szyda7K1SVuIIZxepBkMOOz/0eHdoAqXCgjYOfyB2fHkfLSpa3F5a','student8.jpg',1,1,'Голубцова','Марианна Валерьевна','marianna2051@mail.ru',0,NULL),
(1298,'aleksey23','[\"ROLE_STUDENT\"]','$2y$13$aJpYEI7L6eEAL0NUdjss9OBJnLSK2TDnarILvh491J7pyeX6qFKJy','student17.jpg',18,1,'Белевич','Алексей Георгиевич','aleksey23@mail.ru',0,NULL),
(1299,'elizaveta49','[\"ROLE_STUDENT\"]','$2y$13$e0U/ZmGKzJWfo3MHZqmUi.iupi5MiNt7tcWjcT0gwCBHafzQc3FJy','student5.jpg',13,1,'Жеглова','Елизавета Петровна','elizaveta49@mail.ru',0,NULL),
(1300,'klavdiya.lapotnikova','[\"ROLE_STUDENT\"]','$2y$13$w23yLJXJZEukQf2IA0yXPeYPDGecMcX8W.C5Mtyz8PH7NzNbPcAdu','student7.jpg',2,1,'Лапотникова','Клавдия Максимовна','klavdiya.lapotnikova@gmail.com',0,NULL),
(1301,'vera.yakovenceva','[\"ROLE_STUDENT\"]','$2y$13$M5o8trsm.zshVE7.V9pktenINiQUYhy2dssTr5otEpP63FQ/bhSAG','student11.jpg',11,1,'Яковенцева','Вера Арсеньевна','vera.yakovenceva@gmail.com',0,NULL),
(1302,'arkadiy1989','[\"ROLE_STUDENT\"]','$2y$13$MYYceHKyhZwlyXZ90y00heeRLGE7XZXxr7qUMTNK.ukJkfai5oMAO','student17.jpg',12,1,'Матвеев','Аркадий Давидович','arkadiy1989@rambler.ru',0,NULL),
(1303,'janna06121962','[\"ROLE_STUDENT\"]','$2y$13$lt1hYdu1BK32DeLEKehyOO7lU9P8DEEgTuX2.xBLRFnoBOg/MGPZ6','student1.jpg',11,1,'Шидловская','Жанна Федоровна','janna06121962@rambler.ru',0,NULL),
(1304,'viktor3630','[\"ROLE_STUDENT\"]','$2y$13$yciV3AsKm1xKpSP.Ru9nWOOgP7uJey5ao7GtSYuT/SeIgozJ3zYwW','student20.jpg',4,1,'Завьялов','Виктор Фадеевич','viktor3630@yandex.ru',0,NULL),
(1305,'alla50','[\"ROLE_STUDENT\"]','$2y$13$p6SIrIAL0OhxTFN9JBgsY.ew1ByNqrL64lL/EZSBi5.3kEortB0cG','student2.jpg',6,1,'Хромова','Алла Леонтьевна','alla50@outlook.com',0,NULL),
(1306,'timofey16','[\"ROLE_STUDENT\"]','$2y$13$kGLAgfodAv731X/5/3MH6O/V7fLp34HkdcU5.LfisMJkRayEKHK0u','student5.jpg',17,1,'Мельников','Тимофей Валерьевич','timofey16@hotmail.com',0,NULL),
(1307,'janna08081981','[\"ROLE_STUDENT\"]','$2y$13$4j5gJWN1MiIPcocrHwK0AOXWDjeWfz.7cx3eFtZ5K1eoQ8lhCivU6','student4.jpg',1,1,'Боварина','Жанна Иннокентьевна','janna08081981@mail.ru',0,NULL),
(1308,'timofey1962','[\"ROLE_STUDENT\"]','$2y$13$yFNH0EoxDH4KjE4RuCIE5e1D/NW23KoTpey05UPlOCMh.K0p/K/6q','student15.jpg',18,1,'Максимушкин','Тимофей Кириллович','timofey1962@ya.ru',0,NULL),
(1309,'fedor25011968','[\"ROLE_STUDENT\"]','$2y$13$bNPSVakaPCTxDzeFu70XROk3Xk9reJMA0Y0782n0ClY3qI46sJS9G','student11.jpg',16,1,'Рыжов','Федор Ильич','fedor25011968@rambler.ru',0,NULL),
(1310,'kirill4852','[\"ROLE_STUDENT\"]','$2y$13$XudjKuMncD1NshiVXuVIiuAkn8R04x2TmE8jr3eR11PaRZE2B8dJ2','student14.jpg',12,1,'Митрохин','Кирилл Гаврннлович','kirill4852@mail.ru',0,NULL),
(1311,'marianna2548','[\"ROLE_STUDENT\"]','$2y$13$76gzBQsLs4B.UZk7F9etDOCbWZ.Kk.xmwG7Ny7c0doe.A3lW546Uq','student12.jpg',12,1,'Анасенко','Марианна Герасимовна','marianna2548@hotmail.com',0,NULL),
(1312,'maryamna37','[\"ROLE_STUDENT\"]','$2y$13$ucyBR7X6U6sLOUaKVSjrq.mcIc6J/fh2YEW7xidWw2T7lltv2gSBi','student11.jpg',13,1,'Дюкова','Марьямна Гаврннловна','maryamna37@ya.ru',0,NULL),
(1313,'kseniya07031990','[\"ROLE_STUDENT\"]','$2y$13$AyN7ZVGXCnNb8/gCsb8Vq.xGbmLOH.1A1D.6HXIdpeTuDMYhJ6ul6','student9.jpg',15,1,'Цельнера','Ксения Юрьевна','kseniya07031990@hotmail.com',0,NULL),
(1314,'leontiy18031989','[\"ROLE_STUDENT\"]','$2y$13$6/G6P3ASutbmq0Vx6Cpj1OmVR4N6suj.bymx0oGlXLMwrqbQItq7O','student4.jpg',14,1,'Иволгин','Леонтий Никифорович','leontiy18031989@yandex.ru',0,NULL),
(1315,'lana5638','[\"ROLE_STUDENT\"]','$2y$13$NcbRX/XtQxXYCltng4Q.VOs/T.nSgxcmVz0sKvBvZ0pjLchIFIfR6','student15.jpg',2,1,'Панова','Лана Егоровна','lana5638@rambler.ru',0,NULL),
(1316,'semen1970','[\"ROLE_STUDENT\"]','$2y$13$9GcgKNYQzBqV8OTTDGws6e0IOvwMbbxJu/dBtAS6qpopoeg.sefTa','student7.jpg',10,1,'Стаин','Семен Георгиевич','semen1970@mail.ru',0,NULL),
(1317,'leonid01111967','[\"ROLE_STUDENT\"]','$2y$13$hoXXSupRDLtL.4z.Q0uJn.NAPz0qzPHZNv96eMRzzOmmPKaWCykXG','student14.jpg',13,1,'Ивлев','Леонид Леонидович','leonid01111967@outlook.com',0,NULL),
(1318,'maksim50','[\"ROLE_STUDENT\"]','$2y$13$PGucqHWLxHLgdFx1MaYXyO1G23yIqIPUAZv7sxfoIccdpq8j.9Q72','student17.jpg',20,1,'Цитников','Максим Савванович','maksim50@hotmail.com',0,NULL),
(1319,'ekaterina22011974','[\"ROLE_STUDENT\"]','$2y$13$PESg0wzLQraYTu5Zr0MO2uSAQOrPTl7WfTXfHDOF1iD7V1YA3Y8C2','student4.jpg',4,1,'Элиашева','Екатерина Антоновна','ekaterina22011974@ya.ru',0,NULL),
(1320,'nataliya.yampolskaya','[\"ROLE_STUDENT\"]','$2y$13$jxd5h4uiTxsE2TCAvDGBBOav7hlJid/jccXxL3zNGPx2iZYH333YC','student11.jpg',12,1,'Ямпольская','Наталия Ростиславовна','nataliya.yampolskaya@ya.ru',0,NULL),
(1321,'varvara24071970','[\"ROLE_STUDENT\"]','$2y$13$tuyNCK5Suo7i.Gnl8EvWEeyPekej.uIHkbRGK57.ds.hCBTlQhbZe','student16.jpg',13,1,'Кулибина','Варвара Юлиановна','varvara24071970@rambler.ru',0,NULL),
(1322,'lyudmila76','[\"ROLE_STUDENT\"]','$2y$13$2kAyVussOUVrcVm0fmrgLejSdW3pJan4bAt9boknkSG6pEFLovqqy','student1.jpg',16,1,'Макаркина','Людмила Лаврентьевна','lyudmila76@ya.ru',0,NULL),
(1323,'lyubov76','[\"ROLE_STUDENT\"]','$2y$13$AvMSnVhcNWkVeSkm3pTiSO9wELyctUQOnD1h.fhY/g.EvpuWsP1su','student11.jpg',1,1,'Сиянгулова','Любовь Ираклиевна','lyubov76@mail.ru',0,NULL),
(1324,'pavel1996','[\"ROLE_STUDENT\"]','$2y$13$OMxMal7akDWVxJE8hY8V5OSK0gy6UbWgxklz70Fc9QjPUGwCrOiHq','student18.jpg',9,1,'Горчаков','Павел Филиппович','pavel1996@ya.ru',0,NULL),
(1325,'evgeniy95','[\"ROLE_STUDENT\"]','$2y$13$taGlgH4.i3NBCqZjWiFo5e60a/Nwd7p.VU8.rugGQm.uLk9SFVSJe','student12.jpg',4,1,'Бурцев','Евгений Севастьянович','evgeniy95@mail.ru',0,NULL),
(1326,'maryamna88','[\"ROLE_STUDENT\"]','$2y$13$UtClcQ2g3ZIJTsdTDgJ9Qe.RtJo5EZM3izY/9m49IGePc4Tz/vcuS','student14.jpg',5,1,'Ягужинская','Марьямна Федотовна','maryamna88@hotmail.com',0,NULL),
(1327,'savva11031983','[\"ROLE_STUDENT\"]','$2y$13$rorT0oa0dg0ZojYCELzeFuclGNr7eas7QnAjqrkoL2s38bxHrCEvu','student8.jpg',16,1,'Бесчастных','Савва Иванович','savva11031983@rambler.ru',0,NULL),
(1328,'viktoriya56','[\"ROLE_STUDENT\"]','$2y$13$MNGuie2qeTlEvJXbPEH6FOu2gt5qfFlgOO37stiieQzaGEEeUUa.y','student2.jpg',14,1,'Висенина','Виктория Ефимовна','viktoriya56@mail.ru',0,NULL),
(1329,'elena22011962','[\"ROLE_STUDENT\"]','$2y$13$ufYJPpailTAfBmLisH1f6uQXVQNZRdJWXiXbwyfDU9EI4X3j8T4H.','student12.jpg',11,1,'Шеповалова','Елена Серафимовна','elena22011962@hotmail.com',0,NULL),
(1330,'rada8055','[\"ROLE_STUDENT\"]','$2y$13$N/KC9yboLWN.Od.hWsP4t.VkCZ0rs/Ikm6MOlzzxXWlbMvdGh7ZZu','student14.jpg',11,1,'Чичикова','Рада Саввановна','rada8055@rambler.ru',0,NULL),
(1331,'feliks3367','[\"ROLE_STUDENT\"]','$2y$13$RpyEcew5nftnjilBejXg1uYngGnwcaxrvVcccR/mdafooV2dlISYa','student17.jpg',6,1,'Машарин','Феликс Артемович','feliks3367@hotmail.com',0,NULL),
(1332,'larisa.korjukova','[\"ROLE_STUDENT\"]','$2y$13$CcAarRPdafGP1SKFz8/fKORlpseY2J8SmEwuNt8s3jT6UIdSoaC1G','student13.jpg',18,1,'Коржукова','Лариса Кузьминовна','larisa.korjukova@hotmail.com',0,NULL),
(1333,'taras1993','[\"ROLE_STUDENT\"]','$2y$13$rcTgEBCrHGQjTHiaVvI37uYifDcC3TS5MdTKJ5GfC0uki6FnGLOoW','student7.jpg',16,1,'Смотров','Тарас Афанасьевич','taras1993@gmail.com',0,NULL),
(1334,'german5900','[\"ROLE_STUDENT\"]','$2y$13$FNxzeN9m5jO3z4PA3eczyOKCM4g2SQJ5I6Q4o.GRfW/SNXdqGCoL2','student7.jpg',12,1,'Буков','Герман Тарасович','german5900@mail.ru',0,NULL),
(1335,'efrem07061981','[\"ROLE_STUDENT\"]','$2y$13$8JHNIM1OPr1M0wUUyZmRzufhHYfitNdxU9qLyb4kWbFPVOSCjC1kK','student8.jpg',10,1,'Шеляпин','Ефрем Никифорович','efrem07061981@ya.ru',0,NULL),
(1336,'nadejda1986','[\"ROLE_STUDENT\"]','$2y$13$7FbO2kaA4ZQzPbypxIMvwOuvBg4qxDI6jMaPKvFDs4H8KHP85x5SG','student4.jpg',11,1,'Клюкина','Надежда Данииловна','nadejda1986@yandex.ru',0,NULL),
(1337,'dmitriy.berdyaev','[\"ROLE_STUDENT\"]','$2y$13$UTPccLwuBK3NRbNSvMU.2eMSgXSC1pXPpnDlegQsBepsenROh9YAy','student1.jpg',16,1,'Бердяев','Дмитрий Никифорович','dmitriy.berdyaev@mail.ru',0,NULL),
(1338,'alla11091981','[\"ROLE_STUDENT\"]','$2y$13$OUWv7eVDviVosiI4G1SDoeXHu8NkNr3mLInV7wIn3tvsO4oQwmPkO','student4.jpg',5,1,'Яншина','Алла Валерьевна','alla11091981@ya.ru',0,NULL),
(1339,'apollinariya1963','[\"ROLE_STUDENT\"]','$2y$13$LAZc6LD/n5IqdBOQxBG7WOvX2nmsc9TqubRNWwRAccy5XlUIiTzOa','student16.jpg',10,1,'Усатова','Аполлинария Кузьминовна','apollinariya1963@ya.ru',0,NULL),
(1340,'ignat08091972','[\"ROLE_STUDENT\"]','$2y$13$dxfbqZX3Airqv3t6jx5sKOooZHUGqt1nvmnYGlwyAc2CdE.1vQi3C','student15.jpg',18,1,'Фонвизин','Игнат Николаевич','ignat08091972@ya.ru',0,NULL),
(1341,'vitaliy1972','[\"ROLE_STUDENT\"]','$2y$13$MCnqoBWMSZk.3hfbbsvO0.//OD/J6A6LqUl.PfjHSEIAnI6kJSy2a','student14.jpg',16,1,'Акинфеев','Виталий Степанович','vitaliy1972@ya.ru',0,NULL),
(1342,'vasiliy07021965','[\"ROLE_STUDENT\"]','$2y$13$yWPe97InSlB1dGi/88mPtOyQtcpb9xg3ldFW3HYhMKsKP2wQ/Njuq','student8.jpg',12,1,'Немов','Василий Константинович','vasiliy07021965@outlook.com',0,NULL),
(1343,'syuzanna5850','[\"ROLE_STUDENT\"]','$2y$13$VK4/jC9LgvF.9jst5DHCyeNxWBI96qTq1Ju6hOKAjNE/wQLYUPzHu','student17.jpg',13,1,'Шихранова','Сюзанна Константиновна','syuzanna5850@hotmail.com',0,NULL),
(1344,'vasiliy10','[\"ROLE_STUDENT\"]','$2y$13$hbFSLHZahecQjhXjOe9r9.wXWNvFcUVt1FCI6e7lo8ZpQi3y.oArW','student17.jpg',7,1,'Руских','Василий Данилович','vasiliy10@gmail.com',0,NULL),
(1345,'lavrentiy24071960','[\"ROLE_STUDENT\"]','$2y$13$7t4FzXZmk.Pwz9yM5xfNQuEeuNDot7kt6IFq3yV5eo4stGa0GOmhy','student9.jpg',11,1,'Целиковский','Лаврентий Антонрвич','lavrentiy24071960@gmail.com',0,NULL),
(1346,'kseniya84','[\"ROLE_STUDENT\"]','$2y$13$DX6SmqzhlOcBKBFfgKARKOj5q0sdPzXKGjORDVhcAX0YbuehWM1Q.','student1.jpg',9,1,'Костина','Ксения Данииловна','kseniya84@hotmail.com',0,NULL),
(1347,'katerina8644','[\"ROLE_STUDENT\"]','$2y$13$W6LjnH0qEpIBa1Zo9M/F2.k96I/SvG0N0iOMoB0CUaEAt1.PDRhey','student18.jpg',12,1,'Окрокверцхова','Катерина Семеновна','katerina8644@ya.ru',0,NULL),
(1348,'nikolay15111960','[\"ROLE_STUDENT\"]','$2y$13$ZDwwKAHYbXrv5HzfR.9ct.fw8aXJVOIspxmSHVBL9zoI1ujfw7m/e','student4.jpg',9,1,'Эмский','Николай Иванович','nikolay15111960@mail.ru',0,NULL),
(1349,'anjela42','[\"ROLE_STUDENT\"]','$2y$13$pH.TMeKYWWHridbVvLy0xOSFWN0hXpf2C3eMCl1ABstcibRJuHTQK','student13.jpg',10,1,'Шалимова','Анжела Валерьевна','anjela42@gmail.com',0,NULL),
(1350,'alena.burilicheva','[\"ROLE_STUDENT\"]','$2y$13$DhPloPaIhNWAF/tYIz1p/Ot6HfGyfB6wgbNn/5VJfuL1QJIbdoZNy','student2.jpg',17,1,'Буриличева','Алена Геннадьевна','alena.burilicheva@yandex.ru',0,NULL),
(1351,'rada.tretyakova','[\"ROLE_STUDENT\"]','$2y$13$WnyBNhoA/yjcmeZmhFZeWOyoVGXx3Kzsxaxt.kIqIbu46yHyZ43IW','student5.jpg',7,1,'Третьякова','Рада Наумовна','rada.tretyakova@gmail.com',0,NULL),
(1352,'vitaliy07101995','[\"ROLE_STUDENT\"]','$2y$13$Ov1j9a4GimqD4VjUS9V5pePMTjanmTtkI1Z4JIKlg.YG..ZbOGWdK','student16.jpg',16,1,'Кочнев','Виталий Тимофеевич','vitaliy07101995@yandex.ru',0,NULL),
(1353,'feliks1985','[\"ROLE_STUDENT\"]','$2y$13$nyXdpBRnU20l1XID7gyT3.D28eei8Wyr.DmbOW0DHNUnA7bFRN0Ri','student8.jpg',13,1,'Сидоров','Феликс Артемович','feliks1985@yandex.ru',0,NULL),
(1354,'mark11101982','[\"ROLE_STUDENT\"]','$2y$13$ghAYRetNcUBGTGN4yrirsOjKVXo4UIDilNc4kci289OgfdAhg9.mG','student15.jpg',14,1,'Севостьянов','Марк Даниилович','mark11101982@gmail.com',0,NULL),
(1355,'lana17','[\"ROLE_STUDENT\"]','$2y$13$yYwdcfM1KWFP/LtqeasM/O8m1Up8gACkwf.PPyYhTTXxwjwmSJOTO','student1.jpg',1,1,'Сабанцева','Лана Прокопьевна','lana17@ya.ru',0,NULL),
(1356,'arkadiy1964','[\"ROLE_STUDENT\"]','$2y$13$fRP8f5hNGJPvDF2CtWSTA.5bmDC7hUlIG6MZvXb5zgzAFqXuANDdu','student4.jpg',1,1,'Язев','Аркадий Семенович','arkadiy1964@gmail.com',0,NULL),
(1357,'darya4580','[\"ROLE_STUDENT\"]','$2y$13$qWfavYho7093gpSg2Z9kyefZZjDlQ2loKc3dcPE.qv2gu3oqCj3bq','student8.jpg',9,1,'Нустрова','Дарья Никитьевна','darya4580@hotmail.com',0,NULL),
(1358,'roman9623','[\"ROLE_STUDENT\"]','$2y$13$sLXlqSndjiLGO3KbsNQwAODQnQAG5.wKPALbGrHBI8FAztQQpSSgC','student7.jpg',8,1,'Кириллов','Роман Петрович','roman9623@gmail.com',0,NULL),
(1359,'apollinariya55','[\"ROLE_STUDENT\"]','$2y$13$sLsgsAvhLOGwx8D.3LVINOYxfps.Jf/BUeMUEOztP/o63nrPmFjEq','student6.jpg',12,1,'Квасникова','Аполлинария Игнатевна','apollinariya55@gmail.com',0,NULL),
(1360,'vera09021971','[\"ROLE_STUDENT\"]','$2y$13$Zy.PguSs4SuXdtC/IXHBc.LQR1oc6/.Lp4wrDvqW8JIuLf5QqwsiC','student2.jpg',14,1,'Журова','Вера Павловна','vera09021971@ya.ru',0,NULL),
(1361,'david84','[\"ROLE_STUDENT\"]','$2y$13$xR8GG0jKxIVaO3XwNVyypuZO1gHDFKxtumZ4O.h.kJNNZ7wBWHiyi','student17.jpg',6,1,'Цирульников','Давид Юлианович','david84@gmail.com',0,NULL),
(1362,'raisa.kadetova','[\"ROLE_STUDENT\"]','$2y$13$E0XF/i4Z08gdDjeNSTfmvORRZ5T2gijAOiXCy8kVTCQxKdRnehzxe','student12.jpg',9,1,'Кадетова','Раиса Георгьевна','raisa.kadetova@gmail.com',0,NULL),
(1363,'klavdiya61','[\"ROLE_STUDENT\"]','$2y$13$pKxY6AK0770uvoOMs7M7a./sotf.oxsnfMiSHPcQxB95DDEkuWsRS','student8.jpg',5,1,'Бутусова','Клавдия Егоровна','klavdiya61@rambler.ru',0,NULL),
(1364,'nikolay43','[\"ROLE_STUDENT\"]','$2y$13$AqfUADndS3yE/uqCG0CBjuELRtW8PJuXZ3SXvctmzZRWNEy4s0r0y','student5.jpg',20,1,'Лосев','Николай Валентинович','nikolay43@ya.ru',0,NULL),
(1365,'katerina22091964','[\"ROLE_STUDENT\"]','$2y$13$Sa9K.PSljDuv5jO3Zld1webOubSNGxJO8l5vG0CmOvPObSnX7C2/a','student18.jpg',15,1,'Мажова','Катерина Адамовна','katerina22091964@gmail.com',0,NULL),
(1366,'nina.yakshibaeva','[\"ROLE_STUDENT\"]','$2y$13$1rjmHo.wgbCZi9hHhoCrJudt/uPRcL3QmK1Xzl6G7swVLPDWuUn1O','student11.jpg',11,1,'Якшибаева','Нина Павловна','nina.yakshibaeva@gmail.com',0,NULL),
(1367,'mihail7284','[\"ROLE_STUDENT\"]','$2y$13$ZjPIwuuH3PCbza6WZF/BDu0uaO66fnI6FudqoFFT8LGypbwxtnrmW','student15.jpg',9,1,'Добрынин','Михаил Леонидович','mihail7284@rambler.ru',0,NULL),
(1368,'tatyana21','[\"ROLE_STUDENT\"]','$2y$13$vj6lvt14o2ISpqMeWeFuNOnZodujaZg8H89FPj1wLtiVIOsb8XajC','student14.jpg',17,1,'Покалюк','Татьяна Степановна','tatyana21@gmail.com',0,NULL),
(1369,'konstantin1968','[\"ROLE_STUDENT\"]','$2y$13$SdNgu2FtPS3t9dLEItNWneSh2MwRakiHr52zvWsGJN2.kKUdbeKAq','student1.jpg',9,1,'Цуканов','Константин Адамович','konstantin1968@hotmail.com',0,NULL),
(1370,'venedikt7404','[\"ROLE_STUDENT\"]','$2y$13$IMGhYCW65xgXZ70vbne.PuJUieJrDRbtWIGqwXHwFygIrgM3PFCqO','student18.jpg',3,1,'Валеев','Венедикт Павлович','venedikt7404@yandex.ru',0,NULL),
(1371,'inna5786','[\"ROLE_STUDENT\"]','$2y$13$R5xsaBO734lLS9xa.2qreuwaSXBCNR53wh7m9AOtvtCnwZucqKo9e','student8.jpg',9,1,'Кулагинская','Инна Николаевна','inna5786@hotmail.com',0,NULL),
(1372,'arkadiy1993','[\"ROLE_STUDENT\"]','$2y$13$tUbyP4VXzOE6s6T5yP2tLeEvc5AxF4/r/Qxxx9LeV1r0pONDk0PPS','student13.jpg',16,1,'Гришко','Аркадий Иванович','arkadiy1993@rambler.ru',0,NULL),
(1373,'nina.rataeva','[\"ROLE_STUDENT\"]','$2y$13$aRdw/NegDTnRtsgyY/XJf.EZTy6/f.PWF6ZA1gty8SPZvQ0.QHCDO','student4.jpg',12,1,'Ратаева','Нина Юрьевна','nina.rataeva@gmail.com',0,NULL),
(1374,'nikolay9696','[\"ROLE_STUDENT\"]','$2y$13$N6LcErTosa7HWqDWOedUW.W64BdunJw.rz57TesvKzekz9m//R/LC','student3.jpg',9,1,'Дубинкин','Николай Серафимович','nikolay9696@ya.ru',0,NULL),
(1375,'egor24021972','[\"ROLE_STUDENT\"]','$2y$13$IKSR.5C3yCczPR962Tq3u.m3hmorszZt9PRF5y.2ygtyWPXl1Ctwa','student2.jpg',14,1,'Зайков','Егор Иннокентиевич','egor24021972@rambler.ru',0,NULL),
(1376,'daniil69','[\"ROLE_STUDENT\"]','$2y$13$tjmIHND2NfE4XU7hacDqMOeIylyKarqPo5I6edaifCIoWairyoIPy','student13.jpg',11,1,'Лягушкин','Даниил Филиппович','daniil69@hotmail.com',0,NULL),
(1377,'svetlana.yankina','[\"ROLE_STUDENT\"]','$2y$13$dBj9sxv83VEM5a8jp8jAiesZzjAGwGG9TeyYzg92KI8TTlZ2y.4Wu','student9.jpg',8,1,'Янкина','Светлана Всеволодовна','svetlana.yankina@hotmail.com',0,NULL),
(1378,'aleksandr12051996','[\"ROLE_STUDENT\"]','$2y$13$Bymb7DoS9lXmIR737vPO5.d87WfBiT5E3ttq3FKH5cXQfGFW.lgjS','student15.jpg',2,1,'Кравчук','Александр Тимофеевич','aleksandr12051996@outlook.com',0,NULL),
(1379,'rostislav14','[\"ROLE_STUDENT\"]','$2y$13$KjgvabAlkNF1wZ9j/IFv5OoArS4W8rF0bWL2myQ/IdxPnLB9OmUgS','student20.jpg',16,1,'Божко','Ростислав Никитьевич','rostislav14@outlook.com',0,NULL),
(1380,'rada21011976','[\"ROLE_STUDENT\"]','$2y$13$vKd/y8/uOiMWz7mSuchm7OxOg23nDzckkRkrh8GtM9PG.UBfgmTjm','student15.jpg',16,1,'Чебыкина','Рада Ивановна','rada21011976@hotmail.com',0,NULL),
(1381,'olga.zabirova','[\"ROLE_STUDENT\"]','$2y$13$R9dzsn1PIwKNaEKPYxDhUuAEr1mxraSVspcgxurBh4Vs/xKs.moKS','student9.jpg',18,1,'Забирова','Ольга Кирилловна','olga.zabirova@rambler.ru',0,NULL),
(1382,'pavel7952','[\"ROLE_STUDENT\"]','$2y$13$RhgfMxMYW.2WPKAQW0aMmOx5/DolLbSOJ2p.DAaRfbUmv7qMR1x7m','student1.jpg',5,1,'Казанец','Павел Леонтьевич','pavel7952@hotmail.com',0,NULL),
(1383,'sofiya3310','[\"ROLE_STUDENT\"]','$2y$13$JQmXU0WYQvExn.rOMnp1OeXVSSOmHy59ESrIpLVka5E8TZK4GJFsa','student14.jpg',10,1,'Медведева','София Никаноровна','sofiya3310@yandex.ru',0,NULL),
(1384,'arina18081970','[\"ROLE_STUDENT\"]','$2y$13$ULauJEEzRa3urT8xDBeYoe70Fpv9eyJM97Omvirn/seRyVc5LFcPW','student13.jpg',5,1,'Янко','Арина Давидович','arina18081970@gmail.com',0,NULL),
(1385,'anjela2799','[\"ROLE_STUDENT\"]','$2y$13$J.Db4JH9Tz1enA0sYs2YhOWjCzSG9NhVClbo3BxgjPxTGWD3Ti7XW','student7.jpg',12,1,'Ермушина','Анжела Панкратовна','anjela2799@rambler.ru',0,NULL),
(1386,'lev.konno','[\"ROLE_STUDENT\"]','$2y$13$3ocVrKFwfiz2faWXbj.4o.5/QlxxOdTHhWCfl.w8bH4eKJJyrF3qq','student4.jpg',12,1,'Конно','Лев Трофимович','lev.konno@hotmail.com',0,NULL),
(1387,'darya21121987','[\"ROLE_STUDENT\"]','$2y$13$Goh.ELUCmQCUPLiG3MrweuWSdHfatYBGFafS7X8lGVShUKecA7oiq','student7.jpg',6,1,'Козлитина','Дарья Филипповна','darya21121987@hotmail.com',0,NULL),
(1388,'antonina7284','[\"ROLE_STUDENT\"]','$2y$13$VwX5IRrf7ZoLMQJBs652JOog1RRWcJ4M6eQsX5cOhQnPEWhVVlFga','student8.jpg',2,1,'Тарина','Антонина Никаноровна','antonina7284@ya.ru',0,NULL),
(1389,'alla1985','[\"ROLE_STUDENT\"]','$2y$13$ZxpQDGQ5wq01s6T9Rm/joOogwzHCRcAnF3ymikjW4BUxZFSmqi6xy','student13.jpg',4,1,'Гурина','Алла Константиновна','alla1985@hotmail.com',0,NULL),
(1390,'afanasiy14','[\"ROLE_STUDENT\"]','$2y$13$cUZxpInUz8aTUPTRRqjPyuiRINKKskNpve0Kq80H1DfR0eSXiibt2','student6.jpg',19,1,'Пестов','Афанасий Климентович','afanasiy14@rambler.ru',0,NULL),
(1391,'petr1975','[\"ROLE_STUDENT\"]','$2y$13$kZB.iHEk1S86PXpqzrW7hOJ1toPjj9HVLtdj0X9OQpGG58xbAh7v6','student9.jpg',14,1,'Теплухин','Петр Георгиевич','petr1975@gmail.com',0,NULL),
(1392,'georgiy23121986','[\"ROLE_STUDENT\"]','$2y$13$j4bAMKcGr3wldDKXcW2jveRe5GkrTyo3/68wmU.oj/LWnai43A9zq','student15.jpg',15,1,'Кондюрин','Георгий Валерьевич','georgiy23121986@outlook.com',0,NULL),
(1393,'egor22','[\"ROLE_STUDENT\"]','$2y$13$e/7sNbP2dD/e3r7SNJ4ydOKbcAQIRFKsU5q8gvhI3eAQUMmrBQrHu','student3.jpg',20,1,'Шверник','Егор Арсеньевич','egor22@yandex.ru',0,NULL),
(1394,'milana1968','[\"ROLE_STUDENT\"]','$2y$13$oishhMmlLmH0zpJsuRMgLu89M7DOvPqJt7gQODGd8dbwBAEtAvqfO','student15.jpg',16,1,'Сиянко','Милана Саввановна','milana1968@outlook.com',0,NULL),
(1395,'kseniya73','[\"ROLE_STUDENT\"]','$2y$13$2I48DzKb7xFcksjJOdALOexskyBMwUjbu9.iO.3jNeEmrR1G7cpku','student3.jpg',7,1,'Горбачева','Ксения Павловна','kseniya73@mail.ru',0,NULL),
(1396,'veronika1963','[\"ROLE_STUDENT\"]','$2y$13$TGgfcGKz8CkEnbT19to97.BySKjj9WnDO/i6.7NzP5ryW55jAF11G','student16.jpg',9,1,'Голышева','Вероника Степановна','veronika1963@ya.ru',0,NULL),
(1397,'milana09061968','[\"ROLE_STUDENT\"]','$2y$13$OX5h3gSvXCTn6ICPyyKDF.zhSnIfs5/M1r3fh3GzH2CYn44V/QXUG','student7.jpg',20,1,'Гусева','Милана Даниловна','milana09061968@rambler.ru',0,NULL),
(1398,'maksim23','[\"ROLE_STUDENT\"]','$2y$13$.Q4/CZVmgtK0uKABZwWoeeV4fNdQPa0n5YF50m1GK5ZU8PKr2LwT2','student11.jpg',18,1,'Ходяев','Максим Никандрович','maksim23@yandex.ru',0,NULL),
(1399,'polina09081963','[\"ROLE_STUDENT\"]','$2y$13$sZZUdbbyUcDE9AMX.3shS.2IClc1q4z.3fY.5IzESvygi3yUSJTXa','student19.jpg',9,1,'Ямлиханова','Полина Алексеевна','polina09081963@mail.ru',0,NULL),
(1400,'anton.pomelov','[\"ROLE_STUDENT\"]','$2y$13$4DpzLi9zK2whDl9aWuLsiutqeceAPk/ruuQZ47ozbxpC.5E31AVqS','student19.jpg',15,1,'Помелов','Антон Арсеньевич','anton.pomelov@ya.ru',0,NULL),
(1401,'viktoriya.jeldina','[\"ROLE_STUDENT\"]','$2y$13$xyha08Wg31Y.LAyYC9ClUuVvSuOgjAh5T8i8ptEVe5kECq6nL8pwW','student1.jpg',20,1,'Желдина','Виктория Егоровна','viktoriya.jeldina@yandex.ru',0,NULL),
(1402,'antonina1984','[\"ROLE_STUDENT\"]','$2y$13$G4bfPSo2UY5hLeFVb71n7eQbaso1k07.WqcINiusfjdJoRd5zTOAS','student6.jpg',7,1,'Мамонтова','Антонина Лльвона','antonina1984@rambler.ru',0,NULL),
(1403,'katerina32','[\"ROLE_STUDENT\"]','$2y$13$lupMj/EVklMt0n0LZyDqk.JoCMbOB6mQS2zIE9d2WH9xcTPkSOvJG','student11.jpg',17,1,'Кузуба','Катерина Давидовна','katerina32@gmail.com',0,NULL),
(1404,'alena30','[\"ROLE_STUDENT\"]','$2y$13$DgYMVkWNG.eRHgiIwgf2NesuHaDwwrM74uOkTxYp6PO9H2pxwzaBi','student3.jpg',9,1,'Бобкова','Алена Юрьевна','alena30@hotmail.com',0,NULL),
(1405,'stepan7431','[\"ROLE_STUDENT\"]','$2y$13$EeTMRcK1gJskgJ1Fu9Oheu6nmy0JcMfcmKfUk2Mrv8gN95hfBYm4e','student19.jpg',15,1,'Астафьев','Степан Дмитриевич','stepan7431@hotmail.com',0,NULL),
(1406,'konstantin.loskov','[\"ROLE_STUDENT\"]','$2y$13$19fDq2DiFKaA2Y/91P8pTOgTG.jptweQQbPgCsBTl.lz8VKbv5HaS','student15.jpg',6,1,'Лоськов','Константин Петрович','konstantin.loskov@mail.ru',0,NULL),
(1407,'ivan25071995','[\"ROLE_STUDENT\"]','$2y$13$CVGJbfgAsncQQksxWLCTd.OuVT7pM.picGxa4GhOWRzCDJbiFFF2G','student1.jpg',18,1,'Талызин','Иван Ефимович','ivan25071995@yandex.ru',0,NULL),
(1408,'albina10091961','[\"ROLE_STUDENT\"]','$2y$13$Xf9TngeWhzWQe7y6dwnUA.KV46HezK7URTqZpbkIGrkaPUCz.5.CC','student17.jpg',19,1,'Содовская','Альбина Никандровна','albina10091961@gmail.com',0,NULL),
(1409,'valeriy96','[\"ROLE_STUDENT\"]','$2y$13$lGSBf7/YNuW/6P9zVXQgVuDtd/3a/FUOVr28w3ZB28yE2f94V9BLy','student13.jpg',6,1,'Рюмов','Валерий Серафимович','valeriy96@mail.ru',0,NULL),
(1410,'ignat9000','[\"ROLE_STUDENT\"]','$2y$13$lxQH/FZEjGvnsMtfWs.VFOvLThqGarSsIL0FOyrMrrS4o725sDhmC','student14.jpg',2,1,'Марин','Игнат Егорович','ignat9000@outlook.com',0,NULL),
(1411,'lavrentiy.kabicin','[\"ROLE_STUDENT\"]','$2y$13$V/njYf6x1tiuc5HjwsvfS.aKRrmTNa73BVoi70HWtPurCR4hKyvt2','student16.jpg',18,1,'Кабицин','Лаврентий Порфирьевич','lavrentiy.kabicin@rambler.ru',0,NULL),
(1412,'margarita.komzina','[\"ROLE_STUDENT\"]','$2y$13$s//ftRTZ1yvgHtkLZYqL8O1YMRzwJmIC5y7eT0dP0g6xOQsjaMqqC','student15.jpg',9,1,'Комзина','Маргарита Леонидовна','margarita.komzina@hotmail.com',0,NULL),
(1413,'evgeniya.dukacheva','[\"ROLE_STUDENT\"]','$2y$13$0mEXlTp69Si46r6DhLtGo.NOTAxSVPPeyqxe.Dg0BCDS6Uu07pr7y','student10.jpg',20,1,'Дукачёва','Евгения Сергеевна','evgeniya.dukacheva@rambler.ru',0,NULL),
(1414,'danila6668','[\"ROLE_STUDENT\"]','$2y$13$lpn.rfqmN.kuV4c6pBlBVOndt6YVzwAy/vLLAFTNab0GBx49umWNC','student6.jpg',16,1,'Майсак','Данила Власович','danila6668@gmail.com',0,NULL),
(1415,'tatyana.siyanovich','[\"ROLE_STUDENT\"]','$2y$13$Z.mI4FTO0NMUzyu2vPg.aOOx.RmeX1qtgFRInWtSuIGMCbZ5D2JGu','student7.jpg',8,1,'Сиянович','Татьяна Наумовна','tatyana.siyanovich@rambler.ru',0,NULL),
(1416,'mihail1996','[\"ROLE_STUDENT\"]','$2y$13$eA4/0RWAx/3xjdZfAfdbluQiUC.jjIeaRDlksJhsLYw0LtEv957ui','student19.jpg',19,1,'Порошин','Михаил Афанасьевич','mihail1996@ya.ru',0,NULL),
(1417,'alisa24021965','[\"ROLE_STUDENT\"]','$2y$13$PUyntzIevlAMb7AAvRf7d.YB10e/UjHmeyerT1PWd.SpaTFpZ83sy','student2.jpg',6,1,'Сухиха','Алиса Кирилловна','alisa24021965@hotmail.com',0,NULL),
(1418,'taras23011993','[\"ROLE_STUDENT\"]','$2y$13$TceVYIxfC7GNkKE7E.dmCOiEOE9QQgjOF3m2OGDHNpCB81A0wA.fa','student2.jpg',15,1,'Колбин','Тарас Дмитриевич','taras23011993@gmail.com',0,NULL),
(1419,'ignat.matvienko','[\"ROLE_STUDENT\"]','$2y$13$4WLIxe5S4wjhL/FV1kUxke8oLIclWZAeD.2T.ZgLXUr7alFAfNDp.','student3.jpg',17,1,'Матвиенко','Игнат Григорьевич','ignat.matvienko@hotmail.com',0,NULL),
(1420,'stepan22111992','[\"ROLE_STUDENT\"]','$2y$13$JXI1SDDFP6xcvqe5ABi1OuNYfF3uBpqJViqW5BhX25MSWy5K.cNLm','student4.jpg',19,1,'Амалиев','Степан Петрович','stepan22111992@ya.ru',0,NULL),
(1421,'evgeniya1972','[\"ROLE_STUDENT\"]','$2y$13$gnYhkdRhhjb8ZO705nFQq.YIJ0EprqSASOIni5LirATqHxdeUi2/q','student9.jpg',3,1,'Яушева','Евгения Климентьевна','evgeniya1972@ya.ru',0,NULL),
(1422,'valentina01071992','[\"ROLE_STUDENT\"]','$2y$13$p5flNBlCHGeEDW6tKOb1xugL7xAJnVD0i0/5n7IDrnX9UFDxiJsJu','student19.jpg',6,1,'Яндукина','Валентина Никифоровна','valentina01071992@ya.ru',0,NULL),
(1423,'anfisa1977','[\"ROLE_STUDENT\"]','$2y$13$QmnU1TaRXCCE5Nh6V/TXhOuemGEiVESPlTCSfdTDN5ZTU1F.3D5u2','student5.jpg',16,1,'Полевщикова','Анфиса Севастьяновна','anfisa1977@rambler.ru',0,NULL),
(1424,'rada1973','[\"ROLE_STUDENT\"]','$2y$13$ogAwEij1TxDE5xWKsujLEeBPHpPwJTmBX3t3e5MYWLo9k8AIPjPBO','student4.jpg',1,1,'Махова','Рада Дмитриевна','rada1973@gmail.com',0,NULL),
(1425,'nina1984','[\"ROLE_STUDENT\"]','$2y$13$5pZWSU8xPQxV0uKm4dn64uvZnPc.EqIlph8clUGSnBtDodXrHBw7u','student17.jpg',12,1,'Костомарова','Нина Михаиловна','nina1984@ya.ru',0,NULL),
(1426,'georgiy39','[\"ROLE_STUDENT\"]','$2y$13$tl4/5pbzfTgnQnBU6BJmUe3LiYMiRSR2UIeAI28/Ex/RJWOSu8nFa','student2.jpg',12,1,'Карабатов','Георгий Венедиктович','georgiy39@rambler.ru',0,NULL),
(1427,'elena.abakumova','[\"ROLE_STUDENT\"]','$2y$13$OSZ/CnF5iAyqO90avfn00eY4pn.bwSxFBa9dhS3Evnz.kUhtavWmi','student3.jpg',9,1,'Абакумова','Елена Наумовна','elena.abakumova@outlook.com',0,NULL),
(1428,'lana.yavlyuhina','[\"ROLE_STUDENT\"]','$2y$13$3FXV9OeoMg6MwK9SuLWdJeX/Lh2NZYKRdGktB8.l50floTUMeZGde','student4.jpg',14,1,'Явлюхина','Лана Георгьевна','lana.yavlyuhina@gmail.com',0,NULL),
(1429,'mila7607','[\"ROLE_STUDENT\"]','$2y$13$eK1GWHvCDV3MpM9fbEbH7efcjzTVirBh6piGLjMbSbFjiY7matsQe','student17.jpg',1,1,'Рытова','Мила Александровна','mila7607@rambler.ru',0,NULL),
(1430,'galina50','[\"ROLE_STUDENT\"]','$2y$13$l.JQX0rNIvP/wpRJO6KNj.shVmTIAqxJpqhut0rw70efL/QritT52','student1.jpg',12,1,'Горшкова','Галина Гермоновна','galina50@hotmail.com',0,NULL),
(1431,'yuliya67','[\"ROLE_STUDENT\"]','$2y$13$BS2xB0W4BDzHWqk5AbSpCe23iy2fSUAXKfHTvUsbvfP/vtpZidyJ.','student10.jpg',6,1,'Фонвизина','Юлия Власовна','yuliya67@ya.ru',0,NULL),
(1432,'mariya1986','[\"ROLE_STUDENT\"]','$2y$13$jfiKhDUlZxidych0yYQ9cOZiegGSaFV5g2juWVyTR.6AJPH7LoAKK','student2.jpg',3,1,'Гориславская','Мария Адамовна','mariya1986@hotmail.com',0,NULL),
(1433,'makar05111991','[\"ROLE_STUDENT\"]','$2y$13$JDepC1pWLKmB1sXF52bXDuQ4364qx3sYX68MtWs5bxn5pmhbjwPO2','student9.jpg',9,1,'Данилов','Макар Леонидович','makar05111991@hotmail.com',0,NULL),
(1434,'makar.kryuchkov','[\"ROLE_STUDENT\"]','$2y$13$04pa4Vf/lo.7zaexzJ2A/.ZDz/jPQxlNudzL7UXD5XU6GGxRRyUJ2','student13.jpg',4,1,'Крючков','Макар Яковлевич','makar.kryuchkov@rambler.ru',0,NULL),
(1435,'tatyana8982','[\"ROLE_STUDENT\"]','$2y$13$GOc2KEMVGChAhcvCmF6Am.iUiloJVa5FwcJENGqqUWaFlHfBoVgWC','student6.jpg',4,1,'Шушалева','Татьяна Валерьевна','tatyana8982@mail.ru',0,NULL),
(1436,'david14061982','[\"ROLE_STUDENT\"]','$2y$13$oDkIUFAFk2IO750WHcj8r.o8XW6BQm6PXcTqI5YQevDnyswuRxVq.','student16.jpg',7,1,'Шатохин','Давид Семенович','david14061982@ya.ru',0,NULL),
(1437,'nastasya19051995','[\"ROLE_STUDENT\"]','$2y$13$4RHL83Q22GVJaUFI5SoUduC5oHvFEQFe7CM.ik.8CeyMc6v2cU2oW','student5.jpg',17,1,'Зайкова','Настасья Георгьевна','nastasya19051995@gmail.com',0,NULL),
(1438,'marina78','[\"ROLE_STUDENT\"]','$2y$13$.VTZGK83JASFaCF602TXzOD.JVGPWUuYI6GfthEFCtbCLX9NA8Oaa','student6.jpg',8,1,'Веселова','Марина Прохоровна','marina78@hotmail.com',0,NULL),
(1439,'makar10041968','[\"ROLE_STUDENT\"]','$2y$13$Zl8UwuOIunUxbC8fpKuoR.jJEejNmPQIPCNOyQe9Wrh9CzKpvn.E.','student16.jpg',14,1,'Павленко','Макар Федорович','makar10041968@hotmail.com',0,NULL),
(1440,'katerina9486','[\"ROLE_STUDENT\"]','$2y$13$GDoYqbIdmdrr10FiOsuvS.xdXksPSkETyM0hx2PnPZkYpY0GS9M3S','student16.jpg',4,1,'Мурзакова','Катерина Аркадивна','katerina9486@rambler.ru',0,NULL),
(1441,'efrem06051970','[\"ROLE_STUDENT\"]','$2y$13$dn4h590S/PjqTKONu9s8oeUAKGlW7Bfra8zjq6Qs1N37HWs5zZ0eG','student4.jpg',11,1,'Кочубей','Ефрем Георгиевич','efrem06051970@rambler.ru',0,NULL),
(1442,'semen6005','[\"ROLE_STUDENT\"]','$2y$13$nhBCbw2ejwrNrDje5LBPhOmoW.fRgRDf.tGt0lJVdQii30ps7FRpa','student16.jpg',19,1,'Шапиро','Семен Емельянович','semen6005@mail.ru',0,NULL),
(1443,'anna02021963','[\"ROLE_STUDENT\"]','$2y$13$zhQSlLqS7l6pbt0whVYUeuV9J5MuGsJKjktxKkMrn5io9t7KYRyvG','student3.jpg',11,1,'Шадрина','Анна Лаврентьевна','anna02021963@mail.ru',0,NULL),
(1444,'maryamna33','[\"ROLE_STUDENT\"]','$2y$13$McWlm4ij1JLqyQxHP6QVreDWaimi5a0TVJxeUtaz2uaVVbXLE/Hmy','student9.jpg',1,1,'Яхненко','Марьямна Романовна','maryamna33@rambler.ru',0,NULL),
(1445,'prohor.jgulev','[\"ROLE_STUDENT\"]','$2y$13$BIJZcwUWpoOHfU83AxzyiOKV3H9.DcZi.x4nDfWux5Rs5aauSLgDG','student18.jpg',12,1,'Жгулёв','Прохор Тимофеевич','prohor.jgulev@mail.ru',0,NULL),
(1446,'tamara8928','[\"ROLE_STUDENT\"]','$2y$13$qvFbqVAQsNDvQS8jG4ecAe1LQS0sg96pPUzCC8hMH.0SGpklv8dlC','student18.jpg',16,1,'Золотова','Тамара Филипповна','tamara8928@mail.ru',0,NULL),
(1447,'kseniya.sudakova','[\"ROLE_STUDENT\"]','$2y$13$G9NLD6tKr0btIb7TxHRAIOSZxZ7hLa6facoLLOLLxWMamYWhzOzV2','student9.jpg',18,1,'Судакова','Ксения Данииловна','kseniya.sudakova@mail.ru',0,NULL),
(1448,'mark27081966','[\"ROLE_STUDENT\"]','$2y$13$nUfcgDZ.Zlt.PFgJwoR02.7xRH7NnaqxLz05neVCU9bjSFO.GT/FG','student20.jpg',19,1,'Невский','Марк Иванович','mark27081966@yandex.ru',0,NULL),
(1449,'vyacheslav21061971','[\"ROLE_STUDENT\"]','$2y$13$X1TWYbDYmCqvM1W.V2ZttuteQq.CnpJ3RlvYFDWDvyVGsz7BmxEJu','student5.jpg',7,1,'Ратников','Вячеслав Юрьевич','vyacheslav21061971@rambler.ru',0,NULL),
(1450,'daniil08101963','[\"ROLE_STUDENT\"]','$2y$13$.mVZy3PaYkuf6usdICAG1O0DeUq416IgLNtaHcd7RiYfCFXHQ5Cqe','student18.jpg',10,1,'Щекочихин','Даниил Трофимович','daniil08101963@ya.ru',0,NULL),
(1451,'yakov1975','[\"ROLE_STUDENT\"]','$2y$13$je0g2RRezw/QDDEsPX1HUeDxmvypNgEn9vpK2hSrLoqHOWWTnwkMe','student9.jpg',12,1,'Маркин','Яков Севастьянович','yakov1975@ya.ru',0,NULL),
(1452,'pavel.chernakov','[\"ROLE_STUDENT\"]','$2y$13$G285prMPIbouhkZobe/uBe.aWijFFKw5kUBEA.sNi8m0R70oQLTem','student10.jpg',14,1,'Чернаков','Павел Константинович','pavel.chernakov@yandex.ru',0,NULL),
(1453,'yurin5349','[\"ROLE_STUDENT\"]','$2y$13$EmZIzPJL2wSRBNXjP93ZreDrK.Jveksr1raBhBxuuISKfrVrmcUeG','student14.jpg',2,1,'Кирилов','Юрин Феодосивич','yurin5349@outlook.com',0,NULL),
(1454,'nadejda02031986','[\"ROLE_STUDENT\"]','$2y$13$UrZ5ti./tlllwnOu1Gsz7eeEocXSjRuNVUhiVreWi4SO34/265YQ6','student6.jpg',16,1,'Гремпель','Надежда Петровна','nadejda02031986@gmail.com',0,NULL),
(1455,'valentin4152','[\"ROLE_STUDENT\"]','$2y$13$Uv/XbxOqSyRmDRGQdHgSHO/oT3ub7IJZyugKBxyxO7ezP.cTomRMm','student15.jpg',3,1,'Чижов','Валентин Даниилович','valentin4152@gmail.com',0,NULL),
(1456,'mihail1960','[\"ROLE_STUDENT\"]','$2y$13$MrEU6FIyD99Uw0VxUA7jHet2/cFX.VubSeFfaWuIJtZktMirUGjiK','student3.jpg',8,1,'Синицын','Михаил Федорович','mihail1960@ya.ru',0,NULL),
(1457,'katerina1980','[\"ROLE_STUDENT\"]','$2y$13$jUDAhny7xZ3w43b1SxXefe7YTGZsuGP8buDVMTUWI.Yony7H3QRvC','student11.jpg',14,1,'Угольникова','Катерина Феодосьевна','katerina1980@hotmail.com',0,NULL),
(1458,'rada25111992','[\"ROLE_STUDENT\"]','$2y$13$l4njBA6IIxf67I3BWVO9/O3FsSjlwOez5Hln239z4EKgQkmVZLDgS','student15.jpg',13,1,'Сальникова','Рада Феоктистовна','rada25111992@mail.ru',0,NULL),
(1459,'ivan1991','[\"ROLE_STUDENT\"]','$2y$13$Dfzt98kdnP1qbZruu9vKJu6Ukd1eU9OteiYSQRRSBB11k9BkeT9Ze','student8.jpg',18,1,'Мусин','Иван Даниилович','ivan1991@rambler.ru',0,NULL),
(1460,'egor14031980','[\"ROLE_STUDENT\"]','$2y$13$0MrMR1usS.nu3XveKjG6seu08QzsS8QnOfmOVedLYifzNaSE0jAgy','student9.jpg',16,1,'Язьков','Егор Валерианович','egor14031980@ya.ru',0,NULL),
(1461,'fedot.kondr','[\"ROLE_STUDENT\"]','$2y$13$a6bPqADCwDQkC0KtdYUF2O3mTme0qTslw1aVLQi2j8glDKlSmoX2S','student3.jpg',8,1,'Кондр','Федот Порфирьевич','fedot.kondr@gmail.com',0,NULL),
(1462,'arseniy.krigunov','[\"ROLE_STUDENT\"]','$2y$13$xlqOm2dQG/niEn/cw8z5aewrUY1bhxZWOk1dOQ5fQJqi4dFK6lP52','student2.jpg',15,1,'Шкригунов','Арсений Егорович','arseniy.krigunov@yandex.ru',0,NULL),
(1463,'yuliya.putilina','[\"ROLE_STUDENT\"]','$2y$13$SZlqr35QX0wHS4T0aQDVse/IArGm2DOJQsHG79IjUDrgWNEPMugZK','student19.jpg',2,1,'Путилина','Юлия Степановна','yuliya.putilina@hotmail.com',0,NULL),
(1464,'semen78','[\"ROLE_STUDENT\"]','$2y$13$2SSLhtdh8nC1QNOWrTgIzuKwXoDHa5UoIFn4vEgsjbNPsBMCvczfW','student19.jpg',10,1,'Малинин','Семен Федорович','semen78@hotmail.com',0,NULL),
(1465,'ilya78','[\"ROLE_STUDENT\"]','$2y$13$i.MojBeo3w1VbcEGo3xp5uejWWfffGoiBkZ3EQrdSLi7l4TnC3OQu','student1.jpg',7,1,'Ласман','Илья Федорович','ilya78@yandex.ru',0,NULL),
(1466,'inna1985','[\"ROLE_STUDENT\"]','$2y$13$H8EAJQrUCfCxKaH396ziWewnMfoxQeMPVPRgJZ41Al105hPl5tDCW','student10.jpg',8,1,'Иванникова','Инна Кирилловна','inna1985@outlook.com',0,NULL),
(1467,'nina.grineveca','[\"ROLE_STUDENT\"]','$2y$13$6S17dMhJbCBQXkhdFsFEXecqFbFPCoN4WO4n8sh8AZmzftIcscUxC','student13.jpg',19,1,'Гриневеца','Нина Никаноровна','nina.grineveca@mail.ru',0,NULL),
(1468,'pavel6033','[\"ROLE_STUDENT\"]','$2y$13$dqVYlHznzwnoAuznfXW2BOL/.2T3ShIka/uYtc8IHjPPgQ1S.iGmS','student14.jpg',2,1,'Косинов','Павел Игнатьевич','pavel6033@hotmail.com',0,NULL),
(1469,'semen53','[\"ROLE_STUDENT\"]','$2y$13$cgs6g2ySa6cNNukTJaHlme0k9Xw9VOT/F9/0Dl/RVq5NdNnr4y.YC','student18.jpg',19,1,'Грош','Семен Иванович','semen53@mail.ru',0,NULL),
(1470,'maksim18061963','[\"ROLE_STUDENT\"]','$2y$13$vam0RyYOMGdjjy6bWsBKLOAhUXNhanZ2mYG5guQXGjtMC3T5IO1k6','student20.jpg',11,1,'Ягодников','Максим Егорович','maksim18061963@yandex.ru',0,NULL),
(1471,'tatyana1961','[\"ROLE_STUDENT\"]','$2y$13$9BnOmK2B8VZDjLWSL14JROZ9CsshPZR0dzcveo8LQzWEIvjYOrrtS','student11.jpg',2,1,'Алехина','Татьяна Кирилловна','tatyana1961@gmail.com',0,NULL),
(1472,'danila9609','[\"ROLE_STUDENT\"]','$2y$13$BsijJSGdggNpOElfkVVDYeoGkP5f5Egzudvc/KmBJJR0CRb8P4PHe','student6.jpg',7,1,'Яфаров','Данила Иванович','danila9609@hotmail.com',0,NULL),
(1473,'valentin1964','[\"ROLE_STUDENT\"]','$2y$13$3jNuJ9EHf365xqtHZ0DiRuaXDojOehOLaBm/mxSk6xFOmPj7YZ3DC','student10.jpg',9,1,'Руснак','Валентин Никандрович','valentin1964@hotmail.com',0,NULL),
(1474,'margarita1969','[\"ROLE_STUDENT\"]','$2y$13$lE4uH4GyCKGDlQqbh1JQ6OZ4Xg382G0Jw1TV0JEBwX9R8vetmPFQi','student2.jpg',9,1,'Коломийцева','Маргарита Себастьяновна','margarita1969@mail.ru',0,NULL),
(1475,'alisa.bylinkina','[\"ROLE_STUDENT\"]','$2y$13$Cb.NIppbMpgTeWx527m91e5KhaEP.2TOh90E.xHsuZOYF4RyH/O4q','student18.jpg',14,1,'Былинкина','Алиса Всеволодовна','alisa.bylinkina@outlook.com',0,NULL),
(1476,'egor73','[\"ROLE_STUDENT\"]','$2y$13$tctXIUGqdOdJa6Ijt9CXBu.cfx6On1gqvfqSxQUsfoxy9CDdRk/d.','student15.jpg',9,1,'Воробьев','Егор Романович','egor73@gmail.com',0,NULL),
(1477,'fedor14','[\"ROLE_STUDENT\"]','$2y$13$RVethw/4vdZfOk84wnUFFOpCnb31Q3c54Dxl/vTa3gdhhFifSPHye','student1.jpg',3,1,'Дейнекин','Федор Георгиевич','fedor14@outlook.com',0,NULL),
(1478,'irina25071984','[\"ROLE_STUDENT\"]','$2y$13$VI7a0PybHLz.rapRT4PQ0uBse9apNslXdOZuquD.bbtk5jkq5yLbe','student18.jpg',10,1,'Шурша','Ирина Макаровна','irina25071984@outlook.com',0,NULL),
(1479,'maryamna1961','[\"ROLE_STUDENT\"]','$2y$13$k6T/LMavvgRUKT7vRKxQze3XvikSyoqRrkQO4braxTKmX9FD.scei','student20.jpg',2,1,'Стрелкова','Марьямна Филипповна','maryamna1961@outlook.com',0,NULL),
(1480,'lyubov10031976','[\"ROLE_STUDENT\"]','$2y$13$EcE7y.WQYjWXd4oq4D2yxuJoyDag8ucw6BbnIuWAi3L/1daXLmfbC','student19.jpg',1,1,'Селиванова','Любовь Викторовна','lyubov10031976@ya.ru',0,NULL),
(1481,'mariya2680','[\"ROLE_STUDENT\"]','$2y$13$5FgHtaZF3Jb7boZL2nk4WufP4SMZ5qOWL6CQNsRWzeIwdijQFGOrS','student14.jpg',20,1,'Устимовича','Мария Трофимовна','mariya2680@yandex.ru',0,NULL),
(1482,'anton.kvartovskiy','[\"ROLE_STUDENT\"]','$2y$13$Q3Y3KXkxTP5dL47m4vfehe0xMlmh3RVI0EFvg1XDkXrYB4nwGqL8m','student3.jpg',8,1,'Квартовский','Антон Ильич','anton.kvartovskiy@rambler.ru',0,NULL),
(1483,'stepan10101971','[\"ROLE_STUDENT\"]','$2y$13$SyCHDSNDkdrkBOT8vzb/UuucqVTIxGn5/PgOV/yGfoyots5MVCfly','student8.jpg',17,1,'Урусов','Степан Федотович','stepan10101971@rambler.ru',0,NULL),
(1484,'lana1993','[\"ROLE_STUDENT\"]','$2y$13$miXC4rDWO3Ut.z9o9gcZIOjQQn.tqB1aZylHSOW2175s5zuNJmxmu','student9.jpg',5,1,'Андрющенко','Лана Егоровна','lana1993@hotmail.com',0,NULL),
(1485,'makar31','[\"ROLE_STUDENT\"]','$2y$13$AO7e4KiCL.3Fq3Ny5u508uBCmPSRtdL2zVfsDyFjYgvxnzI9boqW.','student15.jpg',15,1,'Дагин','Макар Денисович','makar31@yandex.ru',0,NULL),
(1486,'prohor3643','[\"ROLE_STUDENT\"]','$2y$13$PMwzcdz3Rua1crWggJAFjuNs.eiEx/5bMsAK9eGd72hSVL.K5UEGK','student8.jpg',2,1,'Рудаков','Прохор Юлианович','prohor3643@outlook.com',0,NULL),
(1487,'lana11','[\"ROLE_STUDENT\"]','$2y$13$G1KbLzqb3P0q/jYN2Es6/O4tl7BFz2tDu05tUlOTSx3wv4W/Uc06W','student14.jpg',8,1,'Серикова','Лана Сергеевна','lana11@ya.ru',0,NULL),
(1488,'leontiy.krivoplyasov','[\"ROLE_STUDENT\"]','$2y$13$vy5FfuVX2c80CkDr9wFuoO.1PjtqpSwSLUEsPlD3JMch/mXa3dtLW','student3.jpg',12,1,'Кривоплясов','Леонтий Федорович','leontiy.krivoplyasov@outlook.com',0,NULL),
(1489,'alina22021985','[\"ROLE_STUDENT\"]','$2y$13$EWbtT4Ntf10c.7fwtmlaKOzg1m7RQYbqIaQtBLCZy9BICq1aXbVlO','student16.jpg',20,1,'Ахвледиани','Алина Нифонтовна','alina22021985@outlook.com',0,NULL),
(1490,'egor88','[\"ROLE_STUDENT\"]','$2y$13$EfxPy9D1ujnzDXNNxHy7N.bkQTZsnLckqkNPgiZ.oqCS4I.ZxOotO','student1.jpg',16,1,'Косоруков','Егор Феоктистович','egor88@rambler.ru',0,NULL),
(1491,'semen5113','[\"ROLE_STUDENT\"]','$2y$13$Feij8yKPyzcrzfYj2xgQ6.YDBuQswBluqZQhXalio6GwqV0/DiEYy','student6.jpg',18,1,'Филимонов','Семен Ростиславович','semen5113@mail.ru',0,NULL),
(1492,'lyubov03051968','[\"ROLE_STUDENT\"]','$2y$13$3x8T9vCyUldvGVKgORFhnO6DlrWWx6ygR9ZL.ASCVWYYGR2qQJvpK','student15.jpg',13,1,'Симакина','Любовь Егоровна','lyubov03051968@rambler.ru',0,NULL),
(1493,'aleksandra37','[\"ROLE_STUDENT\"]','$2y$13$SdwqeEbUMGu14nS9lFVFX.NIRHoZ6ElBwfPYmJYWydGnDe7Jgmg.O','student3.jpg',4,1,'Гаврина','Александра Порфнрьевна','aleksandra37@yandex.ru',0,NULL),
(1494,'alina.burmakina','[\"ROLE_STUDENT\"]','$2y$13$ssXW0Egbs1WW5mJs2cTbsOLNtOdYDjTegmJ0A3PN5OMLqO1aBlWo2','student20.jpg',7,1,'Бурмакина','Алина Акимовна','alina.burmakina@yandex.ru',0,NULL),
(1495,'sofiya04051961','[\"ROLE_STUDENT\"]','$2y$13$eyj/WcddkwtCBFYlKOCwze4Xqs7iHdxfQDuCMgSKGZu0JS0nzk0xW','student10.jpg',3,1,'Канаша','София Денисовна','sofiya04051961@yandex.ru',0,NULL),
(1496,'asya1971','[\"ROLE_STUDENT\"]','$2y$13$fVUYPJ/tjUO2qxHNO6v5.ewZOtxDBywxlgPWhdZrziJycwqAyl5L.','student20.jpg',15,1,'Полкова','Ася Максимовна','asya1971@gmail.com',0,NULL),
(1497,'ignatiy11','[\"ROLE_STUDENT\"]','$2y$13$C4t5ExqPmpDEaZ4jl/5fCudDpWXzj.ls1xK3JjP.P6faCPrd6qHFO','student4.jpg',2,1,'Белозеров','Игнатий Наумович','ignatiy11@hotmail.com',0,NULL),
(1498,'nikifor1967','[\"ROLE_STUDENT\"]','$2y$13$eI97qnFwECZ/x5EjTUf/R.KVCxf1kulQ1l7jf8w3p5SBcE8AsMh7u','student13.jpg',20,1,'Яков','Никифор Михаилович','nikifor1967@outlook.com',0,NULL),
(1499,'trofim1977','[\"ROLE_STUDENT\"]','$2y$13$4VL0dVJ2m.SWRRtJQyyDz.LKUV3k.zo/hkcXi4Mp4DZZLzG/VyEiW','student3.jpg',17,1,'Сурков','Трофим Витальевич','trofim1977@ya.ru',0,NULL),
(1500,'arseniy36','[\"ROLE_STUDENT\"]','$2y$13$pjMoFBk0An9l9ZtWrSp7Iul99JYZhkkIU7qikrapUVr2LIzprwZ6.','student6.jpg',2,1,'Ящук','Арсений Константинович','arseniy36@mail.ru',0,NULL),
(1501,'kuzma20','[\"ROLE_STUDENT\"]','$2y$13$b7Rv6Rs19R7zgwDIgWquIOoU/3BMKtSkwSyEwDp7EFlli5M.VyOQm','student1.jpg',10,1,'Бубнов','Кузьма Тарасович','kuzma20@mail.ru',0,NULL),
(1502,'lyudmila.ekonomova','[\"ROLE_STUDENT\"]','$2y$13$1SxYbMXeWS6RKIcBcb.CV.Jtca8OPEUWLVFJDmuAhhwfT15mLDCcm','student4.jpg',9,1,'Экономова','Людмила Максимовна','lyudmila.ekonomova@yandex.ru',0,NULL),
(1503,'oksana1978','[\"ROLE_STUDENT\"]','$2y$13$QQrbHdm/G8EAxY8U87Hw1.rREe3g3OC1mMXf31ck4qTI1.DR/xZEi','student14.jpg',10,1,'Рыбьякова','Оксана Давидовна','oksana1978@ya.ru',0,NULL),
(1504,'eva3489','[\"ROLE_STUDENT\"]','$2y$13$GcCSsDu6WQTa2g6eWX5qk.zCpgrzVIChBiE0S2BEgVYkLn0rbEWmC','student8.jpg',4,1,'Дресвянина','Ева Вячеславовна','eva3489@ya.ru',0,NULL),
(1505,'kirill8971','[\"ROLE_STUDENT\"]','$2y$13$9TsW48o0eRkFggPFufX1TOMzzWC.mGuwpKhVUb8XmkBaP4iFu7Qu6','student7.jpg',13,1,'Коновалов','Кирилл Игнатьевич','kirill8971@hotmail.com',0,NULL),
(1506,'konstantin14','[\"ROLE_STUDENT\"]','$2y$13$YRJLVUnk1uGae6i7JF3I8e8aTJw8ilog2OaYOuW5ob7wEgfWOvagS','student18.jpg',18,1,'Кулешов','Константин Вячеславович','konstantin14@ya.ru',0,NULL),
(1507,'venedikt.antipov','[\"ROLE_STUDENT\"]','$2y$13$euM3Gb8PwwPq2iZXRElTAuIzVNof8Y/l4LpOLAJ0HNUnfRwEPWi/6','student3.jpg',8,1,'Антипов','Венедикт Георгиевич','venedikt.antipov@ya.ru',0,NULL),
(1508,'raisa3513','[\"ROLE_STUDENT\"]','$2y$13$OFsEbGpt6qP8p3H1Dn/xd.owUZuBbaOjzeGGtdaSCACZFUeIQ5eNm','student3.jpg',5,1,'Горяинова','Раиса Никифоровна','raisa3513@hotmail.com',0,NULL),
(1509,'vera1973','[\"ROLE_STUDENT\"]','$2y$13$Ec/FF.H5l9fVv2/vFCM61etuirhhaB3.pcAzK37ptOl/RP0A3pLG6','student15.jpg',3,1,'Эверская','Вера Власовна','vera1973@outlook.com',0,NULL),
(1510,'ulyana48','[\"ROLE_STUDENT\"]','$2y$13$XmSz5UIlfm5csV5pQfQev./YzdCbhobcvcR8PbXcUfCRA4fu2fHtG','student3.jpg',12,1,'Сулимова','Ульяна Викторовна','ulyana48@outlook.com',0,NULL),
(1511,'antonina1965','[\"ROLE_STUDENT\"]','$2y$13$8H9lbHTFNWALnoaBQolsRO1iFg7PA6ZA7WQ.6kqMIzVPBafKaHP4m','student12.jpg',2,1,'Сюсина','Антонина Викторовна','antonina1965@rambler.ru',0,NULL),
(1512,'kira1820','[\"ROLE_STUDENT\"]','$2y$13$ATdAh9yqsYYfItp5CxXgB.wYjWxA4vrtwK8zfARWUsQYhk/svzPXC','student10.jpg',13,1,'Раскатова','Кира Иннокентьевна','kira1820@yandex.ru',0,NULL),
(1513,'varvara89','[\"ROLE_STUDENT\"]','$2y$13$6HIDnYQtmXKSb7Wyx8kgkep.WiWYTvrzbyru6DvcMAA/h43DSVnJG','student11.jpg',11,1,'Ильина','Варвара Федотовна','varvara89@gmail.com',0,NULL),
(1514,'larisa19','[\"ROLE_STUDENT\"]','$2y$13$Hug385NwqtZ5cTA6KxMnE.Jy8eCl44QcjjXbOeGMqRrbLbuRHTFXu','student6.jpg',3,1,'Элькина','Лариса Евгеньевна','larisa19@gmail.com',0,NULL),
(1515,'kseniya23051980','[\"ROLE_STUDENT\"]','$2y$13$RFQAX1ACAmv6YAs770XtX.Ep9cXzvDsQaVDgHmuFKNiJxDzMCGaNa','student19.jpg',3,1,'Злобина','Ксения Антоновна','kseniya23051980@outlook.com',0,NULL),
(1516,'alisa6478','[\"ROLE_STUDENT\"]','$2y$13$GKfXtBmxqTvbVd4NhcWBu.hUrXurpALkSSA7l8ZIJW5TOHLq0eCkW','student13.jpg',20,1,'Тредиаковская','Алиса Адамовна','alisa6478@gmail.com',0,NULL),
(1517,'anton1235','[\"ROLE_STUDENT\"]','$2y$13$tYTI4phCKwBMpQLn8SlN/.HTaO8tpnO5K6j0wC4DTgj3AVf2svG/.','student13.jpg',2,1,'Жванецкий','Антон Егорович','anton1235@outlook.com',0,NULL),
(1518,'aleksey1170','[\"ROLE_STUDENT\"]','$2y$13$94FceNBqQoE3Zw3hjsh3Z.5h6P8.Wtumei79BeaEi08fRHO3b6.D2','student20.jpg',3,1,'Граббе','Алексей Леонтьевич','aleksey1170@ya.ru',0,NULL),
(1519,'denis1963','[\"ROLE_STUDENT\"]','$2y$13$7ZASEyFgFnNaRnygePT9vOaa6pZIx2iI.yPmWig6AQyl1/Lfb5dqu','student5.jpg',11,1,'Югов','Денис Алексеевич','denis1963@mail.ru',0,NULL),
(1520,'anfisa5524','[\"ROLE_STUDENT\"]','$2y$13$iOwQVZSyT7vT.1Yf3s4TKeY953TiEIUhOAiMN0Hn2gsnkhE9qPMO.','student4.jpg',3,1,'Кудашева','Анфиса Васильевна','anfisa5524@hotmail.com',0,NULL),
(1521,'semen2989','[\"ROLE_STUDENT\"]','$2y$13$Eg45sqma4DBTuhLq/uAsm.AQnvLBW2.P1kmj0zlCfOPjZwvRbhdly','student4.jpg',15,1,'Малинов','Семен Георгиевич','semen2989@gmail.com',0,NULL),
(1522,'marina1992','[\"ROLE_STUDENT\"]','$2y$13$02CIXqKJl.WnFyfFJDQNj.6EJClBAV1zOOeYV1MNcKXAj/JQL.c0u','student8.jpg',19,1,'Бирюкова','Марина Трофимовна','marina1992@mail.ru',0,NULL),
(1523,'tatyana5242','[\"ROLE_STUDENT\"]','$2y$13$3GtddGZpUi0qqrWiANd9luaFOzva8KtKMYi3WdidadqLY2aUQPf9G','student5.jpg',5,1,'Витвинина','Татьяна Саввановна','tatyana5242@yandex.ru',0,NULL),
(1524,'gennadiy26081985','[\"ROLE_STUDENT\"]','$2y$13$Dgo/TZz.JF.69D1uji7xe.VFLAQt6yY0pGWpPWwM6UjyKEO1Mp9y6','student18.jpg',12,1,'Воронин','Геннадий Константинович','gennadiy26081985@yandex.ru',0,NULL),
(1525,'gerasim1984','[\"ROLE_STUDENT\"]','$2y$13$9d18XWEGe/So9fVLIws16OPeUnJ.xyor7qN4Crp/fhfY0OqpHCxTu','student10.jpg',7,1,'Бебнев','Герасим Сергеевич','gerasim1984@outlook.com',0,NULL),
(1526,'trofim.bysov','[\"ROLE_STUDENT\"]','$2y$13$I1aKaptAMzAE5NENt7LF1eYLZLhaMcfRcW4M.fSpvbl7ytsWVI6cO','student6.jpg',15,1,'Бысов','Трофим Федорович','trofim.bysov@hotmail.com',0,NULL),
(1527,'arina30','[\"ROLE_STUDENT\"]','$2y$13$QMcidUQKeuSP8g6LCHioLOxXTASGEHraJJkXHusZFtA/PYyBQRpjK','student7.jpg',3,1,'Курнакова','Арина Степановна','arina30@rambler.ru',0,NULL),
(1528,'margarita5235','[\"ROLE_STUDENT\"]','$2y$13$y9ZJ0Q1/QULEdwh0I1hWe.aNaiR7KvizcN.HVyEFjnb/1fHTFo0eG','student3.jpg',6,1,'Яковкина','Маргарита Евгеньевна','margarita5235@gmail.com',0,NULL),
(1529,'vitaliy.vikash','[\"ROLE_STUDENT\"]','$2y$13$cc8X06pveeFsTDdta7ADZOBeX9MXm34R2qQXcV5wkM2c0J9qhzkC6','student4.jpg',18,1,'Викаш','Виталий Валентинович','vitaliy.vikash@outlook.com',0,NULL),
(1530,'karina66','[\"ROLE_STUDENT\"]','$2y$13$I.TCYfVL.votZH79snn8FuBI9pX2ZYsDJVe40NXy2sgw2LQCbHkk6','student14.jpg',2,1,'Яговенко','Карина Валентиновна','karina66@rambler.ru',0,NULL),
(1531,'nina.semerikova','[\"ROLE_STUDENT\"]','$2y$13$ys3/N9TsCdt5Ghzbg0Ptbe0nvVvS0.MMQWGaXSIB2KlKPpvQl7mGq','student11.jpg',14,1,'Семерикова','Нина Валентиновна','nina.semerikova@hotmail.com',0,NULL),
(1532,'dmitriy9402','[\"ROLE_STUDENT\"]','$2y$13$0M1VaPR2YyL4vGsgBfqsQe4UQWU3mEKNrE4wwoCGXekbWZknH/yqO','student3.jpg',19,1,'Балыков','Дмитрий Арсеньевич','dmitriy9402@yandex.ru',0,NULL),
(1533,'evgeniya83','[\"ROLE_STUDENT\"]','$2y$13$wGWR5amOuARNoRfhp1lm5uOEI5TutslUoOQdBw/nxqO8XMTJumdWG','student18.jpg',16,1,'Маслака','Евгения Викторовна','evgeniya83@hotmail.com',0,NULL),
(1534,'lavrentiy.pastuhov','[\"ROLE_STUDENT\"]','$2y$13$LOIqo9mLjw7b75FAWIyU1.aS2m96jVlgNBp7P1A2hvjAEKOh2VyXC','student6.jpg',11,1,'Пастухов','Лаврентий Никитьевич','lavrentiy.pastuhov@ya.ru',0,NULL),
(1535,'timofey01081975','[\"ROLE_STUDENT\"]','$2y$13$vRfHgBULQeSJ6xFyjOT1wOSvSywnOxBnZjp0n9ISCpPzM3793RRAa','student2.jpg',15,1,'Грибоедов','Тимофей Викторович','timofey01081975@yandex.ru',0,NULL),
(1536,'egor6246','[\"ROLE_STUDENT\"]','$2y$13$WrVwscMR0rqQo6nhSRwgxOyhrRR0pTcKb1kqoFfXBgpQXM3nDmm56','student15.jpg',2,1,'Яматин','Егор Афанасьевич','egor6246@rambler.ru',0,NULL),
(1537,'makar90','[\"ROLE_STUDENT\"]','$2y$13$ohSiw/90JfenUF.ZD45fLeoTX1tQxsjfMmXSzIIns2HGTn.04s/py','student17.jpg',9,1,'Тимошкин','Макар Алексеевич','makar90@hotmail.com',0,NULL),
(1538,'filipp1971','[\"ROLE_STUDENT\"]','$2y$13$5O7b18WE8QKJZou8zGkujOhzJWxy.h.71fTk32wGxjKNN/y./cYKi','student12.jpg',10,1,'Державин','Филипп Петрович','filipp1971@yandex.ru',0,NULL),
(1539,'anton.sadykov','[\"ROLE_STUDENT\"]','$2y$13$Q1csSpfoTPP5T44Nv5EINeVJbWg4SX/5cACjFrRWohGmE1DEHp/Zy','student11.jpg',18,1,'Садыков','Антон Савванович','anton.sadykov@mail.ru',0,NULL),
(1540,'nina1119','[\"ROLE_STUDENT\"]','$2y$13$f4s1IQJLDVl2mlqW7t304u9VLSvWLIsHWyun72kc.rGXF6cuwjwaS','student6.jpg',3,1,'Борзилова','Нина Герасимовна','nina1119@ya.ru',0,NULL),
(1541,'anton32','[\"ROLE_STUDENT\"]','$2y$13$4j6Juz.cDZ78YLIpmD61LeGUvW8mKtXS1ri8BsHmnxBPVZidlr5ta','student8.jpg',10,1,'Яманов','Антон Юрьевич','anton32@hotmail.com',0,NULL),
(1542,'marianna90','[\"ROLE_STUDENT\"]','$2y$13$1y096UaY142vASsMhbBDl.EgwGqmDe2MYxJ8EPPNzw8iXn0oujdwe','student13.jpg',8,1,'Челомцева','Марианна Валентиновна','marianna90@hotmail.com',0,NULL),
(1543,'aleksandr88','[\"ROLE_STUDENT\"]','$2y$13$pulsj2BHTAd11NpvNzf51exTlE.SBN8YkVw75qN3eODa6qBEnpI0u','student16.jpg',2,1,'Мисалов','Александр Гаврннлович','aleksandr88@ya.ru',0,NULL),
(1544,'roman13021986','[\"ROLE_STUDENT\"]','$2y$13$MdvnP1UbLWZ1mNPmfY71CeVMt30Qnm1IiKDESs.fSaKRKIfiWmjsW','student1.jpg',16,1,'Янаслов','Роман Георгиевич','roman13021986@rambler.ru',0,NULL),
(1545,'pelageya1967','[\"ROLE_STUDENT\"]','$2y$13$qTL4B5AXR32NQi8KqpCa9eI4KPfh/F2kndU54vSxaF75gyZokkWNa','student16.jpg',20,1,'Каткова','Пелагея Захаровна','pelageya1967@mail.ru',0,NULL),
(1546,'oksana.yasamanova','[\"ROLE_STUDENT\"]','$2y$13$XtBa/mKffRoQx.c3HZntMuXBgvF27sk2S0Jfi5cUzqgfN7PPdDuj2','student9.jpg',3,1,'Ясаманова','Оксана Ипполитовна','oksana.yasamanova@ya.ru',0,NULL),
(1547,'emelyan1986','[\"ROLE_STUDENT\"]','$2y$13$A3EbuXUpSlevZnVAMjwf5uwNhe940tIr9.GRRSBclyR.Exu/9zgpG','student17.jpg',13,1,'Хлебов','Емельян Никитович','emelyan1986@outlook.com',0,NULL),
(1548,'semen7588','[\"ROLE_STUDENT\"]','$2y$13$aW5woG50fx4MW4nAuOy.4OOFI0q3vgNPHNNjF.CE5S7tmK664OLtW','student2.jpg',6,1,'Хахалин','Семен Петрович','semen7588@mail.ru',0,NULL),
(1549,'yulian.urupov','[\"ROLE_STUDENT\"]','$2y$13$.9SM14hpjKWg5mwWorJcUe3uh.cD9rlnw/h64AhKN.6QtbgPBhAlK','student20.jpg',11,1,'Шурупов','Юлиан Макарович','yulian.urupov@hotmail.com',0,NULL),
(1550,'serafima1976','[\"ROLE_STUDENT\"]','$2y$13$83AA5skC4MJ7znm5y83N0upcOc9h1CmNnPh9sAoz4WjU/JI8oDZNy','student14.jpg',18,1,'Глаголева','Серафима Ипполитовна','serafima1976@ya.ru',0,NULL),
(1551,'timofey26031977','[\"ROLE_STUDENT\"]','$2y$13$CTMDwZwB/D3Y3wM1eyrmpu46MTUxthNXUNLfmL6QzF3nuIO90lC6i','student3.jpg',4,1,'Фастер','Тимофей Савванович','timofey26031977@rambler.ru',0,NULL),
(1552,'yuriy.ogurcov','[\"ROLE_STUDENT\"]','$2y$13$27T3.ItLNmBeP2y.NrIhsuckp0cdB565787oWoMzRDJPathICTxlu','student17.jpg',1,1,'Огурцов','Юрий Ефимович','yuriy.ogurcov@yandex.ru',0,NULL),
(1553,'yulian1971','[\"ROLE_STUDENT\"]','$2y$13$g6nda593DjJVsAYRmNX9suRB7WE0jg4xtG1SjIPiEG.M2ETrzEy/e','student10.jpg',3,1,'Негес','Юлиан Фадеевич','yulian1971@rambler.ru',0,NULL),
(1554,'nataliya1993','[\"ROLE_STUDENT\"]','$2y$13$wUVcQO143d9YtV9TcXXpbeujJ0O8uM5tsGOgUhgccwMximGdLXXym','student17.jpg',11,1,'Малиновская','Наталия Степановна','nataliya1993@ya.ru',0,NULL),
(1555,'vyacheslav2321','[\"ROLE_STUDENT\"]','$2y$13$/K6cPGqYJA6b2thOq9Lq.O1vWt6UnQ0mGizobztQPcXr9koLUAimW','student4.jpg',5,1,'Блоков','Вячеслав Иванович','vyacheslav2321@gmail.com',0,NULL),
(1556,'yakov1969','[\"ROLE_STUDENT\"]','$2y$13$8wvCsyCrYWaGn3wWb3EjA.inC1PRRTg5f2uWKQu67NmeosTaWGdya','student5.jpg',9,1,'Сутулин','Яков Георгиевич','yakov1969@ya.ru',0,NULL),
(1557,'janna.chebotova','[\"ROLE_STUDENT\"]','$2y$13$MCseRwtQrZucXVGXDI8S2evk8SeWUhL4C.5SrBUqqgpR/ZnfvKz2a','student4.jpg',8,1,'Чеботова','Жанна Филипповна','janna.chebotova@mail.ru',0,NULL),
(1558,'semen1976','[\"ROLE_STUDENT\"]','$2y$13$RBFP/R6MALRKgOl6tafoduZgLwhBVtJwKF/ljOjmqkKkzeHNx8Dgm','student1.jpg',13,1,'Малахов','Семен Викторович','semen1976@yandex.ru',0,NULL),
(1559,'sevastyan54','[\"ROLE_STUDENT\"]','$2y$13$4PbzKEb0mESGX.pu0gW3puy7D0oEgEM7U0QI67fmnjEptr7ErUaJ2','student6.jpg',8,1,'Паршин','Севастьян Арсеньевич','sevastyan54@ya.ru',0,NULL),
(1560,'maryana.yarova','[\"ROLE_STUDENT\"]','$2y$13$rbhMHj1lFBm.jIZ7.Fkiru/R8WhKvS86qJjFtfjEqnoQTdEFGFnWG','student8.jpg',19,1,'Ярова','Марьяна Ивановна','maryana.yarova@outlook.com',0,NULL),
(1561,'marina1969','[\"ROLE_STUDENT\"]','$2y$13$4DYC8e1GbzAGJCbgve/SWuCxx7A1XlSnFe8B2T/0qxxGKOALr3hU6','student14.jpg',1,1,'Цехановецкая','Марина Константиновна','marina1969@rambler.ru',0,NULL),
(1562,'valeriy75','[\"ROLE_STUDENT\"]','$2y$13$p1b0RpCqirHvOw/hL8ALleGyi4aqSObqppBTGJzN0WKJlwJ978mP6','student19.jpg',17,1,'Мысляев','Валерий Иннокентиевич','valeriy75@outlook.com',0,NULL),
(1563,'maryamna1818','[\"ROLE_STUDENT\"]','$2y$13$2J1Md9Y9o4NyAad95JAH7.6MwYO6b856VotyeLZEES3Sg/9lZzbW.','student3.jpg',16,1,'Шуляк','Марьямна Дмитриевна','maryamna1818@ya.ru',0,NULL),
(1564,'margarita.musina','[\"ROLE_STUDENT\"]','$2y$13$kQ7nDQFcu1TJ1E3A68p6NO8tsOGYodocbZiKfzC2SizyZJCNRR/FO','student14.jpg',7,1,'Мусина','Маргарита Афанасьевна','margarita.musina@hotmail.com',0,NULL),
(1565,'lyudmila1975','[\"ROLE_STUDENT\"]','$2y$13$YtMnl1oIKkC5CkDL83tzw.WfRUbyzxMalOBbHlqU.DqXi3VHYvsmi','student18.jpg',3,1,'Кудряшова','Людмила Георгьевна','lyudmila1975@outlook.com',0,NULL),
(1566,'viktoriya.fedchenkova','[\"ROLE_STUDENT\"]','$2y$13$cH5JOdGEoINMEq.o/Rpy9O83jvbAw95UPkwQ5Q.ywMbpskur1Fgbm','student13.jpg',20,1,'Федченкова','Виктория Егоровна','viktoriya.fedchenkova@yandex.ru',0,NULL),
(1567,'nonna1991','[\"ROLE_STUDENT\"]','$2y$13$SW8LrCVWAgFyF8.AUnmNd.anRsI2ZHrEM242vsq3ZSxbpf0B/WP6O','student18.jpg',9,1,'Нугаева','Нонна Степановна','nonna1991@yandex.ru',0,NULL),
(1568,'anton20021960','[\"ROLE_STUDENT\"]','$2y$13$XmF/RPeiTt1FWBZzLJ2b7O9rNH1ek0fYtIbAZb/Xt.aWd2IeFMTfK','student16.jpg',17,1,'Водянов','Антон Григорьевич','anton20021960@mail.ru',0,NULL),
(1569,'petr10051971','[\"ROLE_STUDENT\"]','$2y$13$.X21LqPDNS2BGi77n615MeGYJHEjCN08SQOFY/8iSefVNUikuSxly','student4.jpg',1,1,'Листунов','Петр Валентинович','petr10051971@gmail.com',0,NULL),
(1570,'efrem08051964','[\"ROLE_STUDENT\"]','$2y$13$V/hRc9uH6C.vXMOZmxT.0OtHYYEHRnYMtev7GXwendAl2L9fnqux6','student8.jpg',6,1,'Кокорин','Ефрем Васильевич','efrem08051964@yandex.ru',0,NULL),
(1571,'nikolay.nemov','[\"ROLE_STUDENT\"]','$2y$13$5lWNgjUFLPsmGR3rOgNWAesV.ebz17Mde8sNd/mkUGl2DUohdyD3i','student17.jpg',9,1,'Немов','Николай Захарович','nikolay.nemov@gmail.com',0,NULL),
(1572,'ivan12111981','[\"ROLE_STUDENT\"]','$2y$13$iOGn.jZyh8yjSTDN0iXzuOS7uqKW9/6abg7KLUl.9CrdSTfeO6S0q','student20.jpg',2,1,'Карчагин','Иван Емельянович','ivan12111981@gmail.com',0,NULL),
(1573,'aleksey01011987','[\"ROLE_STUDENT\"]','$2y$13$ajeYGIB3LrbG3qi0p3buLe3MzN8YGVI2ppCAipSTZbB1WRhMfZ0T2','student7.jpg',10,1,'Чкалов','Алексей Иванович','aleksey01011987@ya.ru',0,NULL),
(1574,'aleksandra.astredinova','[\"ROLE_STUDENT\"]','$2y$13$e8gJ9z.9OS6mfODRZRKPUOg7sgKba3EhZ3EsihTAuVuEnP5wPieEO','student15.jpg',3,1,'Астрединова','Александра Антоновна','aleksandra.astredinova@mail.ru',0,NULL),
(1575,'yakov09101962','[\"ROLE_STUDENT\"]','$2y$13$FAsppA69G2fL5Q4cPUngNeW9gHNtwb73PX66hvlX3NRBW6uaWIw9u','student3.jpg',20,1,'Борхес','Яков Фадеевич','yakov09101962@gmail.com',0,NULL),
(1576,'pelageya1994','[\"ROLE_STUDENT\"]','$2y$13$zrtsgiGEEr7qHcxBuiwEhOn4gD/zStC3.ptIB5wNACIBs9RhOES6u','student3.jpg',10,1,'Дюженкова','Пелагея Герасимовна','pelageya1994@gmail.com',0,NULL),
(1577,'valeriy14101978','[\"ROLE_STUDENT\"]','$2y$13$IpUbMxGkx4VBhzMs.6GooeboWUaJgAjZcC/M2/fruT0dus37H41Ny','student2.jpg',1,1,'Кудайбергенов','Валерий Григорьевич','valeriy14101978@mail.ru',0,NULL),
(1578,'sevastyan.krasotkin','[\"ROLE_STUDENT\"]','$2y$13$Lij8QIp46zZSaRfIkIIPo.ZJLIeFl7WwAhxJLfGBwKQoalF3n14lO','student17.jpg',8,1,'Красоткин','Севастьян Феодосивич','sevastyan.krasotkin@yandex.ru',0,NULL),
(1579,'veronika8049','[\"ROLE_STUDENT\"]','$2y$13$76gm/DQpLjPdw5HaFSTqO.UeX..niFeSGeMiY5dQv/ZvEivs.u3XO','student16.jpg',4,1,'Кравченко','Вероника Аркадьевна','veronika8049@mail.ru',0,NULL),
(1580,'yuliana9132','[\"ROLE_STUDENT\"]','$2y$13$tvMu1swPv8rm6jsyXUSkYOa0itMmIQl7QQxsESjDOb9IEfKpvuvL6','student2.jpg',4,1,'Бабинова','Юлиана Емельяновна','yuliana9132@yandex.ru',0,NULL),
(1581,'galina.zuykova','[\"ROLE_STUDENT\"]','$2y$13$20QFacyviOc0BI1yNEDHhe8HvZBPNlZDZl5obl/liw5rfQTOb5IkK','student3.jpg',19,1,'Зуйкова','Галина Евгеньевна','galina.zuykova@yandex.ru',0,NULL),
(1582,'kirill3769','[\"ROLE_STUDENT\"]','$2y$13$O/2CYhYgQewcXpAQ0VVTauPD1YGwCgQSO4BEqWDdJNvN1z.dj2vZ2','student6.jpg',6,1,'Зверев','Кирилл Алексеевич','kirill3769@rambler.ru',0,NULL),
(1583,'vasiliy43','[\"ROLE_STUDENT\"]','$2y$13$WRAyGD34O3sqNQzcyK/hyOieRHPPpoTvLHuSgs0x3KcpVvmsZY7xi','student8.jpg',20,1,'Этуш','Василий Филиппович','vasiliy43@yandex.ru',0,NULL),
(1584,'nonna6146','[\"ROLE_STUDENT\"]','$2y$13$stPUNIR4U43ik2HqdK6CSenobKN0oTjH2vMY3laomClnZAXVMv64K','student17.jpg',18,1,'Колотушкина','Нонна Никитьевна','nonna6146@outlook.com',0,NULL),
(1585,'rostislav07091980','[\"ROLE_STUDENT\"]','$2y$13$CbS/nkc111OjAPpyvmHOEOHYM05lcTJDnIqBNYgntY46drY1mpLZG','student7.jpg',20,1,'Эрдниев','Ростислав Захарович','rostislav07091980@ya.ru',0,NULL),
(1586,'klara8761','[\"ROLE_STUDENT\"]','$2y$13$Wo3SYHDzemnlVytKimCd1um6K8Xly7.dIaiyJQfslJuHt.Q2Qzo/6','student1.jpg',18,1,'Крыжова','Клара Адамовна','klara8761@outlook.com',0,NULL),
(1587,'alina46','[\"ROLE_STUDENT\"]','$2y$13$ehgb/Tw7b4ycYn4.289A..um74ol.vlT58Z8h0.vQ9hQNfRKKDZcq','student19.jpg',13,1,'Емельяненко','Алина Тимофеевна','alina46@outlook.com',0,NULL),
(1588,'maryana07011975','[\"ROLE_STUDENT\"]','$2y$13$qDdml.Ns/RZRl4XbF9BkM.MjFY3u3mpu9Bkmdc3PcAQK4T/lRS2IC','student16.jpg',1,1,'Солодская','Марьяна Всеволодовна','maryana07011975@mail.ru',0,NULL),
(1589,'konstantin01051986','[\"ROLE_STUDENT\"]','$2y$13$RqZqEexXoe6nkCbco3dN3uaUEv5CSwY4nQQK9oSL4zxVxnLZdCx8K','student17.jpg',7,1,'Яфаров','Константин Себастьянович','konstantin01051986@rambler.ru',0,NULL),
(1590,'konstantin.lobza','[\"ROLE_STUDENT\"]','$2y$13$uiMmUcLXidjQNS34P872uOwdRd4ITmfwCfDe7hiSQCPfXeCkXBTdi','student15.jpg',15,1,'Лобза','Константин Давидович','konstantin.lobza@gmail.com',0,NULL),
(1591,'margarita1986','[\"ROLE_STUDENT\"]','$2y$13$9xZDzuWYHqajRNiewpfLcurD0w1gEpLabJEMeVzHefgN.f95WAq4S','student14.jpg',3,1,'Волкова','Маргарита Никаноровна','margarita1986@gmail.com',0,NULL),
(1592,'tatyana7645','[\"ROLE_STUDENT\"]','$2y$13$gdYiQVi/Oaqd93JmLtJLvOudcfa4ZVwRWfNllUjm77rBGOvUBVIYa','student8.jpg',12,1,'Емельянова','Татьяна Всеволодовна','tatyana7645@rambler.ru',0,NULL),
(1593,'kirill7599','[\"ROLE_STUDENT\"]','$2y$13$BrpvAZSEUPypyCUhIVPjEuLVRSFN6L379bogaT2PuznmJRcyMmD7.','student15.jpg',19,1,'Дагин','Кирилл Ипполитович','kirill7599@outlook.com',0,NULL),
(1594,'pavel1994','[\"ROLE_STUDENT\"]','$2y$13$0SFsKgF.v9jcpnJHT93Zj.VtXPZyVx1YnRluU1jpcSFWhvxHJ6dWK','student4.jpg',1,1,'Яговенко','Павел Данилович','pavel1994@rambler.ru',0,NULL),
(1595,'georgiy1988','[\"ROLE_STUDENT\"]','$2y$13$0atqRG/HW0mXMSMldYL3Ee9eKqe.fAlNk1Mh9Ku.elTIAQGplLNo2','student3.jpg',18,1,'Ковалевский','Георгий Никандрович','georgiy1988@rambler.ru',0,NULL),
(1596,'aleksey9726','[\"ROLE_STUDENT\"]','$2y$13$jR9rCLAwZNwIwG6yr0BKQehmBZ9YrHhBAtSk6HqmpuCFQesLvL3Fu','student13.jpg',13,1,'Хованский','Алексей Игнатьевич','aleksey9726@ya.ru',0,NULL),
(1597,'denis1980','[\"ROLE_STUDENT\"]','$2y$13$82mXd5M3BxkNwvOQgtw1COy3rRRWkqc.VMXXpGbzqI9fSLTrhMKi2','student3.jpg',20,1,'Хоботилов','Денис Григорьевич','denis1980@hotmail.com',0,NULL),
(1598,'vera3590','[\"ROLE_STUDENT\"]','$2y$13$PYaZ4rBeg922w10D6Pf3gO9IXJTkU4IG/SI2BSWGkersQAmLOmafK','student4.jpg',2,1,'Гика','Вера Наумовна','vera3590@outlook.com',0,NULL),
(1599,'petr5298','[\"ROLE_STUDENT\"]','$2y$13$SnchbZncyNeNankFa8teZulujnDhijj36a/yIwtKucU5v9ctO1Vk2','student16.jpg',8,1,'Рыков','Петр Павлович','petr5298@mail.ru',0,NULL),
(1600,'raisa54','[\"ROLE_STUDENT\"]','$2y$13$pFZ2LZEDzEI/EsTTeHxsROYGbbcByY9tLLDfIwHI265wB2hl398f2','student6.jpg',14,1,'Ханцева','Раиса Всеволодовна','raisa54@ya.ru',0,NULL),
(1601,'klara24111960','[\"ROLE_STUDENT\"]','$2y$13$yzcmD90XP.6quOkzjXWEXeRoTXbmqblqzAUM6j25kfXg8GdGBe33q','student8.jpg',17,1,'Прокашева','Клара Валерьевна','klara24111960@yandex.ru',0,NULL),
(1602,'leontiy25071963','[\"ROLE_STUDENT\"]','$2y$13$rLiJYNmXKOZ/evORN1j5C.V7ms5/0VdoC13/RTSV2CRE14gnwWfTu','student17.jpg',7,1,'Шубкин','Леонтий Афанасьевич','leontiy25071963@mail.ru',0,NULL),
(1603,'denis19081977','[\"ROLE_STUDENT\"]','$2y$13$K3CF50Ocda9qGZnJpebFDe5dio.tllabnYXTiEwHdxy.DdIUMYKJW','student14.jpg',9,1,'Якуткин','Денис Емельянович','denis19081977@rambler.ru',0,NULL),
(1604,'vera6270','[\"ROLE_STUDENT\"]','$2y$13$kyA9BFQ.uqO1sM5Wc/IE..rYvBgcrRp8hJB.UADFw8tSXZ/ZsEUIK','student11.jpg',12,1,'Таушева','Вера Юрьевна','vera6270@ya.ru',0,NULL),
(1605,'elizaveta1986','[\"ROLE_STUDENT\"]','$2y$13$LilgymKW1KUcl6jC6qnjeOkpVPzzFF..hoXtMXaqSGQfu34nB6jRi','student15.jpg',1,1,'Лещенко','Елизавета Тимофеевна','elizaveta1986@mail.ru',0,NULL),
(1606,'klavdiya1976','[\"ROLE_STUDENT\"]','$2y$13$sYVOJH7WTeOrrn.Ew5GkEuBgYzG166S96edX0VKzEi6ex2bBzQkNa','student8.jpg',8,1,'Ерзова','Клавдия Семеновна','klavdiya1976@rambler.ru',0,NULL),
(1607,'daniil21081986','[\"ROLE_STUDENT\"]','$2y$13$OHtV8XNpxRS6rcRdMUZSC.rcCaKWgg1XpNADvJho3Qh2tjVxja7Iq','student1.jpg',9,1,'Махов','Даниил Евгеньевич','daniil21081986@mail.ru',0,NULL),
(1608,'anfisa.myatleva','[\"ROLE_STUDENT\"]','$2y$13$AFOsrnjo2qhgnI3O5qAdNez8duTq0d0XvltVXjQW8lsCfV/ifJmFq','student10.jpg',1,1,'Мятлева','Анфиса Евгеньевна','anfisa.myatleva@gmail.com',0,NULL),
(1609,'innokentiy1990','[\"ROLE_STUDENT\"]','$2y$13$29GujEzYDSoPmaOJlf42g.J.QvOjcq5H0Hn2v8T0sBKngLVgBfz/S','student17.jpg',16,1,'Муханов','Иннокентий Петрович','innokentiy1990@gmail.com',0,NULL),
(1610,'nastasya1985','[\"ROLE_STUDENT\"]','$2y$13$5F3syq/dHjudyn.sXwAW/.oRy/9qvuw7I75zA0i2WQIvDTTBfyNK2','student15.jpg',15,1,'Дешевых','Настасья Макаровна','nastasya1985@hotmail.com',0,NULL),
(1611,'efim1961','[\"ROLE_STUDENT\"]','$2y$13$IOur5Yj9l8osyY/FtHe/MuC0nS6excpFt7sGrOvebijhXgGOyspTy','student14.jpg',6,1,'Каунайте','Ефим Трофимович','efim1961@hotmail.com',0,NULL),
(1612,'yakov86','[\"ROLE_STUDENT\"]','$2y$13$E/dnJYzz2/AnYrHSFuOWDeyNP5ZR7SIQTSDN7mYrhgWRN.Rzfb2tW','student14.jpg',19,1,'Брагин','Яков Кириллович','yakov86@yandex.ru',0,NULL),
(1613,'lyubov12091979','[\"ROLE_STUDENT\"]','$2y$13$F6W1ETZW6jAwjIF5ukCTweW6AReknnyPsWO0wJhD7ceaoqeSx.3Au','student17.jpg',19,1,'Семёнова','Любовь Саввановна','lyubov12091979@hotmail.com',0,NULL),
(1614,'evgeniy17011993','[\"ROLE_STUDENT\"]','$2y$13$y0bEyXOv1pk/7gKLgEPv5OVc72aOqPs5GFntXCQdx1zVSF8ONIw4u','student1.jpg',2,1,'Вергун','Евгений Яковлевич','evgeniy17011993@ya.ru',0,NULL),
(1615,'darya8936','[\"ROLE_STUDENT\"]','$2y$13$ELIXEoXooLM6OqkeDvWQ/OYJzknaiTZaB.TgGLlGY2spwFTc5rPiG','student3.jpg',16,1,'Онипченко','Дарья Ивановна','darya8936@mail.ru',0,NULL),
(1616,'kirill03011971','[\"ROLE_STUDENT\"]','$2y$13$IC4VAVgmoOOIGNxEdYVgIeFgWOO6RD7pzn6zuizmF/EI3868JRfC6','student9.jpg',14,1,'Еромеев','Кирилл Федотович','kirill03011971@yandex.ru',0,NULL),
(1617,'zinaida13071981','[\"ROLE_STUDENT\"]','$2y$13$cEpeAt0AKIJs4777C1184u9VF9uL7T3koSR8OUeY1m/jStmXlJoXi','student4.jpg',9,1,'Петракова','Зинаида Евгеньевна','zinaida13071981@hotmail.com',0,NULL),
(1618,'arina6249','[\"ROLE_STUDENT\"]','$2y$13$Zz5OeAQEmskRxxlYiRnx3OLJVrc5l1ib75gEpCCjN2escXv.2SgqS','student17.jpg',4,1,'Кутичева','Арина Никаноровна','arina6249@mail.ru',0,NULL),
(1619,'valentin.gorlov','[\"ROLE_STUDENT\"]','$2y$13$59k7ZNI2xHpHPwRm2GNAhevNLRkBRyj4tPjMjPN6sAF3frPiSM.k.','student3.jpg',18,1,'Горлов','Валентин Ильич','valentin.gorlov@hotmail.com',0,NULL),
(1620,'elizaveta26','[\"ROLE_STUDENT\"]','$2y$13$thQnq5GrqnyxI0XbLG.opezCCufMPOv/.DpYDRJOvQdE35vkst69K','student17.jpg',18,1,'Горбунова','Елизавета Давидович','elizaveta26@hotmail.com',0,NULL),
(1621,'nikita14051970','[\"ROLE_STUDENT\"]','$2y$13$9O.0WlYtQ9sPwzK1KH69Y.Oax0m2nhIje/hf7FF15rDDZKzL403vS','student3.jpg',15,1,'Друганин','Никита Ильич','nikita14051970@hotmail.com',0,NULL),
(1622,'ulyana06091980','[\"ROLE_STUDENT\"]','$2y$13$tZyZkw/hkwGfg3u9QKATgekntCiDJBF1Xp9ILJWla39JGR.tFytae','student2.jpg',15,1,'Якушова','Ульяна Гермоновна','ulyana06091980@rambler.ru',0,NULL),
(1623,'daniil65','[\"ROLE_STUDENT\"]','$2y$13$uz4QfQuwlnPhzNDER.AJlu5EctI2kmxjensjz.mmMb4xC15WhuRq2','student5.jpg',6,1,'Сагунов','Даниил Яковеевичевич','daniil65@gmail.com',0,NULL),
(1624,'afanasiy1967','[\"ROLE_STUDENT\"]','$2y$13$7.8DclgjyASctzZvtc472Olv7fC25UCdlGSikEJn5DyYzbqYtddQK','student9.jpg',19,1,'Глухов','Афанасий Тимофеевич','afanasiy1967@rambler.ru',0,NULL),
(1625,'ekaterina9169','[\"ROLE_STUDENT\"]','$2y$13$bnwV.o5EO8dp.3X1tDglL.F5MVYSIHnf8QYp8x5jb.kc57XVTfdHS','student10.jpg',4,1,'Мишина','Екатерина Кузьминовна','ekaterina9169@outlook.com',0,NULL),
(1626,'filipp3927','[\"ROLE_STUDENT\"]','$2y$13$5tlSPjD8mNQU5PTSy6Tdv.lInDEh25LTX5hfI/xOlesV6Hf0iV/Gq','student9.jpg',11,1,'Кравчук','Филипп Панкратович','filipp3927@mail.ru',0,NULL),
(1627,'stepan.buhalo','[\"ROLE_STUDENT\"]','$2y$13$17rlfOh48s/J4r5jk5QxN.z5BBPDdoOdUXUXY1LvqdNl7wpcESviu','student13.jpg',19,1,'Бухало','Степан Николаевич','stepan.buhalo@gmail.com',0,NULL),
(1628,'ilya.talalihin','[\"ROLE_STUDENT\"]','$2y$13$wW7FCNgFBsPFH0DSUAjwsO9yk0PqUOvVo29eamPBRm5VBNgkp5EeG','student16.jpg',15,1,'Талалихин','Илья Игнатьевич','ilya.talalihin@yandex.ru',0,NULL),
(1629,'nikifor1979','[\"ROLE_STUDENT\"]','$2y$13$hYCtm..UH20cgknoOZ/nZuPnBAZnSYuNoWy5Vxr7cO42ec/zr2zEC','student4.jpg',18,1,'Сиянских','Никифор Алексеевич','nikifor1979@ya.ru',0,NULL),
(1630,'irina15101968','[\"ROLE_STUDENT\"]','$2y$13$B9ZFVj0FMKZUijzrfM7GGeI22oOcr0UlTi22mtrRJUCf1BZlO9Pz2','student18.jpg',8,1,'Селезнёва','Ирина Павловна','irina15101968@rambler.ru',0,NULL),
(1631,'varvara8186','[\"ROLE_STUDENT\"]','$2y$13$ooNjIR13cI27ZoS4cyuhzuoZ21BO9xj2ZLZ0/gO4FMk18TY22P4Ye','student6.jpg',16,1,'Шаньгина','Варвара Васильевна','varvara8186@outlook.com',0,NULL),
(1632,'valeriy27081981','[\"ROLE_STUDENT\"]','$2y$13$xFCWI1tBZ3hR0GKxAbaMJ./z7a48IB7LwO.cGz7rMAg4lsqqOsnJW','student14.jpg',20,1,'Туманов','Валерий Викторович','valeriy27081981@yandex.ru',0,NULL),
(1633,'anton61','[\"ROLE_STUDENT\"]','$2y$13$TwCobiHBhUbakpxzeOZig.wzttJIDOUt3ppGntldKP8uIhQ6oBgea','student17.jpg',15,1,'Печкин','Антон Саввеевич','anton61@rambler.ru',0,NULL),
(1634,'emelyan.ulyanov','[\"ROLE_STUDENT\"]','$2y$13$2/zvrd1HZM76Wpn/uUwtvOwgDFwa27FIfhOKYIOc/ZY8DyIfJNYui','student8.jpg',2,1,'Ульянов','Емельян Лукьевич','emelyan.ulyanov@gmail.com',0,NULL),
(1635,'katerina07121968','[\"ROLE_STUDENT\"]','$2y$13$fpQ2Xji0FHby9jkML35/.u4f.fPjL.jyvpfdP4KxGf6QmrxuDQdmu','student2.jpg',10,1,'Сиянина','Катерина Максимовна','katerina07121968@mail.ru',0,NULL),
(1636,'nastasya26','[\"ROLE_STUDENT\"]','$2y$13$fICu709v.vrJqpWgYOe.POeiVQ3m6tJ589ybi3VYOlEcWSBUdBhXe','student13.jpg',3,1,'Мерзлякова','Настасья Васильевна','nastasya26@outlook.com',0,NULL),
(1637,'yakov1977','[\"ROLE_STUDENT\"]','$2y$13$6guciyHz2eHkOfCD/3/td.Laqgc.RxAE06mgo0aDxXMj2S.c4M0TK','student5.jpg',14,1,'Шабалин','Яков Макарович','yakov1977@rambler.ru',0,NULL),
(1638,'afanasiya1976','[\"ROLE_STUDENT\"]','$2y$13$aLjCWiXn5.bzODzn8Od0TOwhNf1Eci/HHMc.e8qJ5dSFUJ0VF2jQa','student9.jpg',4,1,'Анисимова','Афанасия Вячеславовна','afanasiya1976@outlook.com',0,NULL),
(1639,'ivan13031965','[\"ROLE_STUDENT\"]','$2y$13$rbvpz6pRN8.d4S0jd/ATgOtdmwVVeIlk1U0nB0VvXNIqB8qjMlx4a','student11.jpg',1,1,'Алогрин','Иван Вячеславович','ivan13031965@hotmail.com',0,NULL),
(1640,'evgeniya17051963','[\"ROLE_STUDENT\"]','$2y$13$2QGhoekerJNWjoqYQ.PlfuGUKTewaE98nFgqlOuaOdqVK6ktAEkGO','student9.jpg',9,1,'Сотова','Евгения Филипповна','evgeniya17051963@rambler.ru',0,NULL),
(1641,'serafim2616','[\"ROLE_STUDENT\"]','$2y$13$05vnHEjwd0ypdnDGEuuIFuUuQpcgiiKp5p.i6d4Ql5V7OHsdancnW','student11.jpg',20,1,'Хабибуллин','Серафим Иванович','serafim2616@yandex.ru',0,NULL),
(1642,'semen38','[\"ROLE_STUDENT\"]','$2y$13$eiVVpYTFcfevoGECrqdWYOj7L3BCZRqPx9zBz.TDeWFHZh4./vC46','student17.jpg',16,1,'Штельмах','Семен Герасимович','semen38@gmail.com',0,NULL),
(1643,'margarita1961','[\"ROLE_STUDENT\"]','$2y$13$byE7gh9K0X1TSIBJgExQDe1SvncUTODqijpLtjsN0N7nFM29SmDIq','student17.jpg',7,1,'Круминьш','Маргарита Захаровна','margarita1961@yandex.ru',0,NULL),
(1644,'rimma15051976','[\"ROLE_STUDENT\"]','$2y$13$31nd8zwKLYYBOUJSe4Skhuzv4JyKdSY4SqlIA37BtOxMkILHaUsG6','student2.jpg',18,1,'Зверева','Римма Антоновна','rimma15051976@outlook.com',0,NULL),
(1645,'trofim1968','[\"ROLE_STUDENT\"]','$2y$13$2GLqWWdyFmwHoraxMzejyekyyHQWaLJgs0qSaEOomkVZZO1EGEila','student2.jpg',7,1,'Чернышев','Трофим Ильич','trofim1968@ya.ru',0,NULL),
(1646,'margarita.elmpt','[\"ROLE_STUDENT\"]','$2y$13$Lq9RWCo6UKWW5F0H07G1NeXbo2r7t88ilwYIY11Ciy8vkDq39HItS','student13.jpg',15,1,'Эльмпт','Маргарита Евгеньевна','margarita.elmpt@yandex.ru',0,NULL),
(1647,'david1973','[\"ROLE_STUDENT\"]','$2y$13$mTGl8jyO.JAcCjS9R7uu2enOi7ZoMIYNKO8WWN3sVlso3BUXsAf.a','student9.jpg',19,1,'Кутяков','Давид Гаврннлович','david1973@rambler.ru',0,NULL),
(1648,'viktor1988','[\"ROLE_STUDENT\"]','$2y$13$x2UoSBnyGQE1jTsb/ABPaeXuxEirVtMfmwQNSRa4MRI.kxiO8NcnS','student8.jpg',4,1,'Терентьев','Виктор Евгениевич','viktor1988@yandex.ru',0,NULL),
(1649,'vasiliy16111976','[\"ROLE_STUDENT\"]','$2y$13$PMHaexcMSxQ2rAFaQ3FyLOokjMD0EZud5jg9ev7WgW76LaqDSOiz.','student2.jpg',2,1,'Алехин','Василий Валентинович','vasiliy16111976@hotmail.com',0,NULL),
(1650,'georgiy.kairov','[\"ROLE_STUDENT\"]','$2y$13$.74t2Uhp0LfxvJ99UyhzT.2h8YV4v69DINBMz9T5c.ikmjf22MKay','student3.jpg',10,1,'Каиров','Георгий Петрович','georgiy.kairov@rambler.ru',0,NULL),
(1651,'sergey1963','[\"ROLE_STUDENT\"]','$2y$13$qU.jeHXzNda5pFjGzNGJHuBK6sZaWSBJEqyI6O73BvmbEXxllr57i','student12.jpg',17,1,'Кедров','Сергей Ростиславович','sergey1963@ya.ru',0,NULL),
(1652,'filipp1982','[\"ROLE_STUDENT\"]','$2y$13$FgcyqNMIhcJiWBZ3M9ohheTLfmHG/ihMSCkkrkoryCgo90huoahPK','student16.jpg',5,1,'Травкин','Филипп Даниилович','filipp1982@yandex.ru',0,NULL),
(1653,'maryamna7768','[\"ROLE_STUDENT\"]','$2y$13$/8e1amx66jaNVV.OEKQVtuEB4q8pU8JT2MQF1PqKqnXgTXFF4.Q4y','student2.jpg',11,1,'Матизова','Марьямна Власовна','maryamna7768@outlook.com',0,NULL),
(1654,'maksim10051969','[\"ROLE_STUDENT\"]','$2y$13$0gr7XhKn64niiz87yXRvrOPCBxTPhVoUeWdwWPm9blqhlcwV3ZtYG','student15.jpg',15,1,'Крутиков','Максим Аркадинович','maksim10051969@gmail.com',0,NULL),
(1655,'raisa2293','[\"ROLE_STUDENT\"]','$2y$13$jBXdenOBWtH18glibb/tEu7l83kDVT1RweF/KYf.lmdJ66WA1eXle','student18.jpg',11,1,'Веселова','Раиса Валентиновна','raisa2293@hotmail.com',0,NULL),
(1656,'makar6754','[\"ROLE_STUDENT\"]','$2y$13$UeNpGpU9ZswApWJDYwyHh.UGfo5l0KV3rCFOHsZqEGo127E1V7IYS','student19.jpg',5,1,'Моисеев','Макар Романович','makar6754@yandex.ru',0,NULL),
(1657,'eva.dudkina','[\"ROLE_STUDENT\"]','$2y$13$yO/1HQR1HPUS0Q50oAUS9.F/ireKCQpdXO1AVM8SJdzAX3sQjpQlm','student12.jpg',14,1,'Дудкина','Ева Якововна','eva.dudkina@mail.ru',0,NULL),
(1658,'maryana1274','[\"ROLE_STUDENT\"]','$2y$13$VcNR4oS7zPrqqa21YZ/LS.WaaixwPBE5GCxTo5w3SfSJYmhHl047i','student19.jpg',12,1,'Цыцына','Марьяна Георгьевна','maryana1274@mail.ru',0,NULL),
(1659,'afanasiy71','[\"ROLE_STUDENT\"]','$2y$13$kFIqkDG6fMIjUCn6csB0guayW6xC/gIF0qOrpH3tRjPXCRkzxoHI6','student12.jpg',6,1,'Фененко','Афанасий Серафимович','afanasiy71@yandex.ru',0,NULL),
(1660,'alina16031992','[\"ROLE_STUDENT\"]','$2y$13$uXrFCcM5PBcOzXvv2Z96geyobG290cQB9/fD1aQF7YtKT425Q2Tu6','student13.jpg',6,1,'Купревича','Алина Николаевна','alina16031992@rambler.ru',0,NULL),
(1661,'efim9590','[\"ROLE_STUDENT\"]','$2y$13$pAkheqUbO6F6b1/MDXtNR.2rPg0wfP7sVmh13MtHA3J8O3QAr5rwC','student8.jpg',10,1,'Есиков','Ефим Тарасович','efim9590@yandex.ru',0,NULL),
(1662,'valentina4129','[\"ROLE_STUDENT\"]','$2y$13$maiOpNTYj4pbYB7ZndFv3.Kv8b.3LTzY5.BKJPeU4bOKmVJ4nh3DW','student10.jpg',6,1,'Рунова','Валентина Игнатьевна','valentina4129@ya.ru',0,NULL),
(1663,'anna75','[\"ROLE_STUDENT\"]','$2y$13$cvm6kn9gwZJpga.6icCTH.kI1rgjYG0AR4KeKR8nf2QQZvUis0kEm','student8.jpg',14,1,'Хуртина','Анна Тимофеевна','anna75@mail.ru',0,NULL),
(1664,'ivan90','[\"ROLE_STUDENT\"]','$2y$13$fofxkOw2xhqB5J0nXY7IdOF.qYfrSpBQZwCNzLb0imKddqtKWlTbm','student1.jpg',1,1,'Колтышев','Иван Юрьевич','ivan90@hotmail.com',0,NULL),
(1665,'sofiya.kornienko','[\"ROLE_STUDENT\"]','$2y$13$fFBNjx8QvX3SX8kUHISzfOpiVdeyVNCx6SunruicOqbjBAqrobTOO','student14.jpg',5,1,'Корниенко','София Юрьевна','sofiya.kornienko@gmail.com',0,NULL),
(1666,'anjela1978','[\"ROLE_STUDENT\"]','$2y$13$NvpBppK.rWPDfs2ycE/80eq8cZpJXEdpiZHahWjySrNTACLU3rdv6','student2.jpg',20,1,'Черкашина','Анжела Афанасьевна','anjela1978@outlook.com',0,NULL),
(1667,'mihail47','[\"ROLE_STUDENT\"]','$2y$13$DCs612Cx4NXIKTDgtnW7Qe20FwqFKv64a.0Npxip8uT8XCOMaRqQ2','student7.jpg',10,1,'Ерёмин','Михаил Евгеньевич','mihail47@outlook.com',0,NULL),
(1668,'viktor05091977','[\"ROLE_STUDENT\"]','$2y$13$m7mgMTPaRcxF0uhP0RmGheb0CLNuhh/ezBZFWbvAU.JGiwDAPr9bG','student12.jpg',14,1,'Бершов','Виктор Витальевич','viktor05091977@rambler.ru',0,NULL),
(1669,'petr.nenashev','[\"ROLE_STUDENT\"]','$2y$13$7lkxGpL875MAR27UDns0TOUwpHQFvz1nFabw2S.zWl7rUu4S1bHxK','student8.jpg',12,1,'Ненашев','Петр Федотович','petr.nenashev@gmail.com',0,NULL),
(1670,'kirill.tupolev','[\"ROLE_STUDENT\"]','$2y$13$Ilvke9Jfa2nTkgtnKWQ6FeyJ3vDYPoAG2ZsWh3O6DwJkPP/AhYjYC','student8.jpg',7,1,'Туполев','Кирилл Петрович','kirill.tupolev@ya.ru',0,NULL),
(1671,'rostislav28111978','[\"ROLE_STUDENT\"]','$2y$13$NTfIIDG3Y8sudTtfGugHFevV2LbRIhBnZPztEamHYSUumMgm8wVju','student1.jpg',4,1,'Моисеев','Ростислав Филиппович','rostislav28111978@yandex.ru',0,NULL),
(1672,'elena1972','[\"ROLE_STUDENT\"]','$2y$13$O9DBmWZHCPegh5UHjhNP9u3ONQVg9ZUno0xBtrzSNaAHEC3YQyMD2','student3.jpg',4,1,'Блока','Елена Никифоровна','elena1972@gmail.com',0,NULL),
(1673,'arseniy4188','[\"ROLE_STUDENT\"]','$2y$13$WK6g46l5kO/.pMYYjxulHO1lk06ek9HCYw/Milsl2zor/UOFc6y1m','student1.jpg',15,1,'Шеховцов','Арсений Прохорович','arseniy4188@outlook.com',0,NULL),
(1674,'viktor48','[\"ROLE_STUDENT\"]','$2y$13$00uRF/Y9klbY82./bkqYNuIe7wRrwZq0xv0IHGC6aGjwuspJL0/Mu','student17.jpg',9,1,'Курушин','Виктор Витальевич','viktor48@mail.ru',0,NULL),
(1675,'svetlana25101993','[\"ROLE_STUDENT\"]','$2y$13$2irJnuQ4btV9S72YPDeXd.famu4naIXv1INXMMM2GdG/IVR/9y6EO','student20.jpg',3,1,'Зыкина','Светлана Ивановна','svetlana25101993@yandex.ru',0,NULL),
(1676,'karina4764','[\"ROLE_STUDENT\"]','$2y$13$ajGcK5qeAl2MM4mjZZlziek6fhuU8I0VRJd88laLTQqMoeCHNJWTK','student9.jpg',15,1,'Помельникова','Карина Тимофеевна','karina4764@yandex.ru',0,NULL),
(1677,'daniil6786','[\"ROLE_STUDENT\"]','$2y$13$ayYmwNxRofll4DPuVPvcWuWBVQgSyUTHMxwRh8vkttgsmuADuPQfW','student14.jpg',4,1,'Девятков','Даниил Степанович','daniil6786@hotmail.com',0,NULL),
(1678,'aleksey.eskin','[\"ROLE_STUDENT\"]','$2y$13$1hBuiitk64OubkqeTPqkC.6qfn2mTE2C7KCVosjvgt1RL0sfma4Km','student12.jpg',7,1,'Эскин','Алексей Александрович','aleksey.eskin@mail.ru',0,NULL),
(1679,'lyudmila27','[\"ROLE_STUDENT\"]','$2y$13$Zu.93UM7X5TFp2Qq6/5OFuYa6Izc2oBbE5mKKHCbXBpr.gL8OeW.G','student5.jpg',15,1,'Гриневец','Людмила Егоровна','lyudmila27@mail.ru',0,NULL),
(1680,'anastasiya02061968','[\"ROLE_STUDENT\"]','$2y$13$BL8ZrgPzqMWJRidws8FJj.c5WuOZhBQ0UzN02JhaVsTG6vFON.SKS','student3.jpg',13,1,'Капнист','Анастасия Аркадивна','anastasiya02061968@gmail.com',0,NULL),
(1681,'olga02091988','[\"ROLE_STUDENT\"]','$2y$13$Id.BbxnwrT/ji9HY6Ugj0urxS6qA/VEO00JNrRyPdn31e4czuiD1W','student9.jpg',12,1,'Зухина','Ольга Тимофеевна','olga02091988@hotmail.com',0,NULL),
(1682,'ignat1961','[\"ROLE_STUDENT\"]','$2y$13$H86m0CX6djd5wyKwxUH.DeR7HZLQqtNNe8kt5FUpiVjd9HrT/UX4G','student19.jpg',17,1,'Кривонос','Игнат Ефимович','ignat1961@ya.ru',0,NULL),
(1683,'janna1994','[\"ROLE_STUDENT\"]','$2y$13$1zEZFkIIlc40znnxPSPz..nZ6I7.Meq0r9aicER/VE70KylN3juDy','student5.jpg',18,1,'Бершова','Жанна Григорьевна','janna1994@mail.ru',0,NULL),
(1684,'arkadiy1988','[\"ROLE_STUDENT\"]','$2y$13$05MLjzZKypmMihGbl1HF2.Ja73AsYBFzW5M/xIREsbsmr4HVyUQkW','student5.jpg',5,1,'Кунаковский','Аркадий Леонидович','arkadiy1988@ya.ru',0,NULL),
(1685,'nonna42','[\"ROLE_STUDENT\"]','$2y$13$CK..aA0NPT0y0oGDTLaV1eWyF/6wvCg1FwJxJ.zqfxKkoXn5G4hOq','student13.jpg',3,1,'Белибердиева','Нонна Арсеньевна','nonna42@yandex.ru',0,NULL),
(1686,'anfisa60','[\"ROLE_STUDENT\"]','$2y$13$5CFQSHzYsCdtjuMsnTBnre3KVaWQ.gJOKsg8cd6lwqY/mfix.l/bm','student7.jpg',6,1,'Ланцова','Анфиса Антоновна','anfisa60@mail.ru',0,NULL),
(1687,'grigoriy23121977','[\"ROLE_STUDENT\"]','$2y$13$Bcp/8Wr0PFycWUNxj5Z1leXGthw6YeVN25msBtPybdXNIolsqgKDO','student18.jpg',3,1,'Хаслик','Григорий Венедиктович','grigoriy23121977@gmail.com',0,NULL),
(1688,'nikolay.gubin','[\"ROLE_STUDENT\"]','$2y$13$x6IY/OtbJEYcqBLvZ/7mCuJs2kUcCguJ.YWK/U9NRo2aAXMJEEIcC','student1.jpg',19,1,'Губин','Николай Макарович','nikolay.gubin@outlook.com',0,NULL),
(1689,'raisa9739','[\"ROLE_STUDENT\"]','$2y$13$nqnGX3yYzy/BSGkYLp6PN.Hyl6wptbVv64nopaisQYssB.qqK/vHG','student16.jpg',2,1,'Голова','Раиса Тимофеевна','raisa9739@hotmail.com',0,NULL),
(1690,'lev15051969','[\"ROLE_STUDENT\"]','$2y$13$zKp5YN9D/S8An3n5xCwo5euVJA3lPps1PSEfXEMFU0.2xoeGGLRqa','student7.jpg',6,1,'Демидов','Лев Константинович','lev15051969@rambler.ru',0,NULL),
(1691,'fedot9689','[\"ROLE_STUDENT\"]','$2y$13$y8WxABy7k8KTqtooFFESYu/B6/Ez8HccKPysUB5NxLnKc1FE.3tIi','student13.jpg',6,1,'Рязанов','Федот Кириллович','fedot9689@rambler.ru',0,NULL),
(1692,'ilya1963','[\"ROLE_STUDENT\"]','$2y$13$3YzlvswyUsjqoCW07TKAQOxqy5BX0/8TPgUjh47waNEbe.O7vqQS2','student9.jpg',19,1,'Голубчиков','Илья Максимович','ilya1963@yandex.ru',0,NULL),
(1693,'georgiy79','[\"ROLE_STUDENT\"]','$2y$13$fdJPvfqF0YSv158fb92mMusAwaWYWNIJLGSRTuUD.zv1ucmcZLm5O','student17.jpg',1,1,'Ульянов','Георгий Дмитриевич','georgiy79@gmail.com',0,NULL),
(1694,'timofey9330','[\"ROLE_STUDENT\"]','$2y$13$tA/Sa8ZwH73TeNuG94YVyeFPzj5HrXtOXD1Rev4Aam1WBLbv/5kam','student18.jpg',19,1,'Ясинский','Тимофей Герасимович','timofey9330@yandex.ru',0,NULL),
(1695,'georgiy59','[\"ROLE_STUDENT\"]','$2y$13$KJVCIb5JVrtoyxep9sad9.pivjHesBlRvcHiHRinYgjI7R4./2ej6','student12.jpg',15,1,'Ульяшин','Георгий Дмитриевич','georgiy59@hotmail.com',0,NULL),
(1696,'marina7617','[\"ROLE_STUDENT\"]','$2y$13$pd78Evj8AhEEYIDA6hCJGuji2Kvug/M8oK7oxinEPBa33lPuoBcDK','student12.jpg',18,1,'Цыринская','Марина Сергеевна','marina7617@outlook.com',0,NULL),
(1697,'zinaida19101974','[\"ROLE_STUDENT\"]','$2y$13$s0vVRwZxwMGi5W4nH8.V3uRiNvWhVeWV2FImz4pAXAp5uP7PxOsvu','student1.jpg',20,1,'Шабунина','Зинаида Федоровна','zinaida19101974@rambler.ru',0,NULL),
(1698,'svetlana27061976','[\"ROLE_STUDENT\"]','$2y$13$h2BvrIxkaJet9u0i9SwaYuIesKY5nt.8H/p/mbs577SmiB967v0Mq','student7.jpg',13,1,'Казанцева','Светлана Филипповна','svetlana27061976@outlook.com',0,NULL),
(1699,'filipp1968','[\"ROLE_STUDENT\"]','$2y$13$KblIrS2DGKXVjcEn9/guJeAgvqLrPUI1cCF4T3M6aDICvA4xvJOZi','student11.jpg',5,1,'Крылаев','Филипп Ираклиевич','filipp1968@ya.ru',0,NULL),
(1700,'nonna1983','[\"ROLE_STUDENT\"]','$2y$13$GHj4JILsI5CEcTCJ4.RPGuybbCS7w8yWTWNIdxYrYdXV9MBTvjur.','student14.jpg',12,1,'Корнейчука','Нонна Павловна','nonna1983@hotmail.com',0,NULL),
(1701,'sergey49','[\"ROLE_STUDENT\"]','$2y$13$RWhYVfsqe0R9Cd0jcpZyBOmqlUzxjKHZPNlCHDwEmCzZ1hY1iLwlG','student15.jpg',8,1,'Золин','Сергей Максимович','sergey49@outlook.com',0,NULL),
(1702,'alla.belomestina','[\"ROLE_STUDENT\"]','$2y$13$6VMyqP358.4yjJazXCHUge4u39a2EXjpMHytR8Mn56shTC1l.nqNm','student6.jpg',12,1,'Беломестина','Алла Прокловна','alla.belomestina@ya.ru',0,NULL),
(1703,'maryana13101960','[\"ROLE_STUDENT\"]','$2y$13$OPcyw8TlWs1tPnXZiSndAO5OLtncbXOIyYpifoxYC4D5MVyn8o50e','student7.jpg',14,1,'Балинская','Марьяна Саввановна','maryana13101960@ya.ru',0,NULL),
(1704,'trofim1982','[\"ROLE_STUDENT\"]','$2y$13$L3VQi/W9wGYSo7FJZTZaOOjWkRCiMCCCiNkd4HR3W8wpWEtoOt/GO','student4.jpg',4,1,'Яхин','Трофим Львович','trofim1982@mail.ru',0,NULL),
(1705,'vasiliy1562','[\"ROLE_STUDENT\"]','$2y$13$//G/cg61LB5X8La/wbgvueAh/rC9ep7a8QQGxgPi/mNDB3b8wtypm','student16.jpg',14,1,'Цыганков','Василий Семенович','vasiliy1562@ya.ru',0,NULL),
(1706,'antonina1985','[\"ROLE_STUDENT\"]','$2y$13$SGuL7e4VLGd6Km8iV6Jo9evwd81guum4eZ1EhqmcU2s0exWdH7uy6','student1.jpg',13,1,'Дубровина','Антонина Панкратовна','antonina1985@rambler.ru',0,NULL),
(1707,'olga22','[\"ROLE_STUDENT\"]','$2y$13$CXg/0Pxbb4gdYTJv9o8nH.lZtEJEHXpuhOlr38EGr5.1yrrlyL6Um','student8.jpg',16,1,'Хитрово','Ольга Юрьевна','olga22@ya.ru',0,NULL),
(1708,'nikolay5949','[\"ROLE_STUDENT\"]','$2y$13$lQRuZ/rYUXr3lF.A9WJlyOlikQhh0sMhfTFHJPWgtVqtEjwZEangG','student12.jpg',7,1,'Никашин','Николай Львович','nikolay5949@yandex.ru',0,NULL),
(1709,'lyudmila1996','[\"ROLE_STUDENT\"]','$2y$13$zq/pIFF6oH1hbRk4WS/aLeLJR1CN0lgmNpf7fJvcUlfkmkIYVK0w2','student20.jpg',19,1,'Нефёдова','Людмила Константиновна','lyudmila1996@yandex.ru',0,NULL),
(1710,'vasiliy1985','[\"ROLE_STUDENT\"]','$2y$13$WBI2UkXUVrgBEjvmtkMbLO3OGk/sBj1n6LKKjTbN.yQW/PMtWqzYW','student16.jpg',19,1,'Морозов','Василий Венедиктович','vasiliy1985@yandex.ru',0,NULL),
(1711,'rimma.yahimovicha','[\"ROLE_STUDENT\"]','$2y$13$b7zRBdfYb2WthTigg9iOxempjikPUBlHCLIP8Qgx9r4yU0e6mwNHq','student11.jpg',14,1,'Яхимовича','Римма Всеволодовна','rimma.yahimovicha@hotmail.com',0,NULL),
(1712,'mark03081991','[\"ROLE_STUDENT\"]','$2y$13$4irDpbTsbA21AQRrSGIbHOIKMeVSwAVECLbg.T6hCPVBXiWC/cd.a','student5.jpg',19,1,'Расторгуев','Марк Тимофеевич','mark03081991@outlook.com',0,NULL),
(1713,'timofey5053','[\"ROLE_STUDENT\"]','$2y$13$avdYdyoiJ/vmj0MEmA9i6OVTmg2MTTIYdKrNLwei.29gQcEussSAC','student16.jpg',4,1,'Шеншин','Тимофей Феоктистович','timofey5053@hotmail.com',0,NULL),
(1714,'nika63','[\"ROLE_STUDENT\"]','$2y$13$hDsu0g1woZV5A6pLXhV5FuBT0rj3tk5c4Rr8SVhhPr6jTTcfVFo/q','student1.jpg',18,1,'Юсупова','Ника Давидовна','nika63@rambler.ru',0,NULL),
(1715,'antonina22011971','[\"ROLE_STUDENT\"]','$2y$13$g8PXZqoDe7/lSnuSW/nkMuMP3R72iaXIlF0RP2yHK/S1dj3dHZR/i','student17.jpg',8,1,'Сомкина','Антонина Никифоровна','antonina22011971@ya.ru',0,NULL),
(1716,'alla11121968','[\"ROLE_STUDENT\"]','$2y$13$YOawdEucdYIZmfujWKXV8.dS1Sb1oUCi5gutxoJtfA/aPNR22kQHu','student20.jpg',6,1,'Таушева','Алла Александровна','alla11121968@mail.ru',0,NULL),
(1717,'anjela49','[\"ROLE_STUDENT\"]','$2y$13$pYODn/.XmFIhYwUiEfBsROJgUsAmilPPdx12bLnmkAzifa5AdxkHy','student8.jpg',17,1,'Хорькова','Анжела Данииловна','anjela49@gmail.com',0,NULL),
(1718,'polina.katranovskaya','[\"ROLE_STUDENT\"]','$2y$13$LJlz/EKMHYBRmW0.qtyKR.o97BALipMybS4gyjCrsDvBz7t.yqV6i','student16.jpg',3,1,'Катрановская','Полина Ивановна','polina.katranovskaya@mail.ru',0,NULL),
(1719,'aleksandr9632','[\"ROLE_STUDENT\"]','$2y$13$u4tZkWcOQZfJbdF33LZjoOr9H88p6fyUE4nCPLRzb0sG43cGkZISW','student11.jpg',5,1,'Карибжанов','Александр Климентович','aleksandr9632@hotmail.com',0,NULL),
(1720,'vyacheslav9796','[\"ROLE_STUDENT\"]','$2y$13$KF56uW57iA.7M27zLpqAR.uzJRgxf3BwsTIWms4vksNfDUKH97a2.','student10.jpg',15,1,'Унковский','Вячеслав Константинович','vyacheslav9796@hotmail.com',0,NULL),
(1721,'zinaida2936','[\"ROLE_STUDENT\"]','$2y$13$Q0z7caIB8ETs7a5VzwymeuVmv02xxwxu0zGofpkhKTAc8vNJ6o.Tm','student10.jpg',13,1,'Карташёва','Зинаида Серафимовна','zinaida2936@mail.ru',0,NULL),
(1722,'apollinariya4571','[\"ROLE_STUDENT\"]','$2y$13$QdBmix12HMLbhKjj2kjiAex7fgNA494uFm93fxvbJsHBfs/l9yRw2','student11.jpg',6,1,'Балинская','Аполлинария Порфнрьевна','apollinariya4571@rambler.ru',0,NULL),
(1723,'ilya13101960','[\"ROLE_STUDENT\"]','$2y$13$rugkn6zCh8dEL4thOdwF8e2Zn.JJyUgKeJ.j7jWEdo4iXf3/W3GB2','student14.jpg',1,1,'Иванников','Илья Юринович','ilya13101960@mail.ru',0,NULL),
(1724,'yuriy36','[\"ROLE_STUDENT\"]','$2y$13$Wgxwz/CNJ/xkUnsE0.dnKuQBxyH7UB.VbM8TbuHlZHLwIaLKLKwsK','student13.jpg',18,1,'Чернышев','Юрий Прокопьевич','yuriy36@ya.ru',0,NULL),
(1725,'kirill.nikolaichev','[\"ROLE_STUDENT\"]','$2y$13$TQjkxaAoq6THHjuJHAGIMen/3mZK1gHGgttlmwWDdxyUpz37Vppki','student2.jpg',15,1,'Николаичев','Кирилл Степанович','kirill.nikolaichev@ya.ru',0,NULL),
(1726,'sevastyan.kuzin','[\"ROLE_STUDENT\"]','$2y$13$xmBCKo5sFPXGiG7ciGqMCe1ovS24oYrAFo8f2hKwJLCRuKE.pymoG','student14.jpg',17,1,'Кузин','Севастьян Юрьевич','sevastyan.kuzin@hotmail.com',0,NULL),
(1727,'aleksey1429','[\"ROLE_STUDENT\"]','$2y$13$8M/OZNEJAfibGFoodCICKOjgbn26/1Oia0EBpbd6QneB0emtTbcyS','student12.jpg',4,1,'Сильвестров','Алексей Трофимович','aleksey1429@outlook.com',0,NULL),
(1728,'eva09011977','[\"ROLE_STUDENT\"]','$2y$13$j5CIE747tZMcs/Q5B7oJTe5VH8BQnHptwMwU/9a.9c8nC5UHLp2Ra','student9.jpg',8,1,'Сподарева','Ева Семеновна','eva09011977@rambler.ru',0,NULL),
(1729,'evgeniya1963','[\"ROLE_STUDENT\"]','$2y$13$aNDXT4Jugvxy09Cm1Kyl9ecaMrQU9pExdtsBsXK.zO10yGahUNkZG','student2.jpg',11,1,'Калугина','Евгения Георгьевна','evgeniya1963@outlook.com',0,NULL),
(1730,'mila16051966','[\"ROLE_STUDENT\"]','$2y$13$dN0xbf2.Mvd852lN6SFfMeqARB/oIaeNA0R76R1pCP.mzwH6G3gVq','student16.jpg',10,1,'Герцая','Мила Антоновна','mila16051966@mail.ru',0,NULL),
(1731,'semen6577','[\"ROLE_STUDENT\"]','$2y$13$mOwh/PZN1z9qHZX7llEsKODGqpFNcft0kg7dXre62anv17kOi0gyi','student9.jpg',8,1,'Набиуллин','Семен Павлович','semen6577@gmail.com',0,NULL),
(1732,'svetlana98','[\"ROLE_STUDENT\"]','$2y$13$vd6gWFscEjAJxYukR7uz0eOdz4RGnZzbuPzrUuUCqkAwJeocL4js2','student16.jpg',14,1,'Ахвледиани','Светлана Елизаровна','svetlana98@rambler.ru',0,NULL),
(1733,'arseniy89','[\"ROLE_STUDENT\"]','$2y$13$s8xV2eLS4fbomcPE5xsU2OZ0pURXV3Y/gqXJh9Gx27XGTcCVgQlzO','student9.jpg',8,1,'Ивашкин','Арсений Афанасьевич','arseniy89@outlook.com',0,NULL),
(1734,'tamara.marina','[\"ROLE_STUDENT\"]','$2y$13$fu5hCJGx7aPG/PdIzctBsukHmj0be7OEb6Qa63Tzq1XmkamcKUP.G','student12.jpg',13,1,'Марьина','Тамара Ефремовна','tamara.marina@rambler.ru',0,NULL),
(1735,'trofim14021974','[\"ROLE_STUDENT\"]','$2y$13$cOEHuqw7J5AF.ke5csbEuOmwEM0lXOGC4wwJLWTs2KIjt8zuk09/K','student3.jpg',3,1,'Горностаев','Трофим Петрович','trofim14021974@outlook.com',0,NULL),
(1736,'yurin10101981','[\"ROLE_STUDENT\"]','$2y$13$bjekGrmEGDrng45bJ0nTD.W8Yi5OWQ.bOEdVjfu09NASDgwVmC7Qq','student7.jpg',16,1,'Черномырдин','Юрин Серафимович','yurin10101981@rambler.ru',0,NULL),
(1737,'aleksandr1977','[\"ROLE_STUDENT\"]','$2y$13$hNfShI3txTeGcclTtDA1GOMm0EbkLtj9C4DC3Wix1JH8JkLdQYQZm','student19.jpg',12,1,'Хватов','Александр Артемович','aleksandr1977@rambler.ru',0,NULL),
(1738,'konstantin04011992','[\"ROLE_STUDENT\"]','$2y$13$u7VRwkZKaY2LYtJ/AbOoSO/eAYFWBS42jLI/NAzcrzF0vCARTV5sm','student4.jpg',5,1,'Федосеев','Константин Ефремович','konstantin04011992@mail.ru',0,NULL),
(1739,'anton.jilenkov','[\"ROLE_STUDENT\"]','$2y$13$Rw70I2iir5VjJnXQlOnqLOWnGngkxxZRcEcTvjwYqw0ob70.52JIO','student4.jpg',13,1,'Жиленков','Антон Трофимович','anton.jilenkov@yandex.ru',0,NULL),
(1740,'maksim24','[\"ROLE_STUDENT\"]','$2y$13$pvs8LYu02BFowOS8nK3ENOBd5v19qA3fV0SoEoVnWbUQESm3l5lYK','student16.jpg',12,1,'Яншин','Максим Ираклиевич','maksim24@rambler.ru',0,NULL),
(1741,'olga25031962','[\"ROLE_STUDENT\"]','$2y$13$q.NoYxMVE6OQglqZ2FvL3.CjQYxu6Cil.RTS65tRFwkjW5LtA8Tyu','student13.jpg',3,1,'Ясеневская','Ольга Яковна','olga25031962@rambler.ru',0,NULL),
(1742,'viktor97','[\"ROLE_STUDENT\"]','$2y$13$ZDb4igmX3YLnm76tLf/Ou.tc.WCrD3oIFtZtjWJcBdDOAt.5LJ4u6','student5.jpg',1,1,'Лигачёв','Виктор Порфирьевич','viktor97@mail.ru',0,NULL),
(1743,'pavel5598','[\"ROLE_STUDENT\"]','$2y$13$a0RaacEmyZ7kZA2QMDeEM.KT0bYaPzl6sTCqQpNlmt5Hye8.uLteq','student11.jpg',3,1,'Убейсобакин','Павел Климентович','pavel5598@ya.ru',0,NULL),
(1744,'makar05061971','[\"ROLE_STUDENT\"]','$2y$13$zK1hL2QT5rDT4Qm9yU2wC.nE7BpnU6Qg7MDPx.7gr4za.k7cZU2HS','student11.jpg',17,1,'Матеров','Макар Никанорович','makar05061971@gmail.com',0,NULL),
(1745,'afanasiya22071988','[\"ROLE_STUDENT\"]','$2y$13$TIVZmzthTK0oTFEQO/39X.vKSsp6bUHnxec3mdRIxLNEGR3GAmVrC','student19.jpg',7,1,'Гавриленкова','Афанасия Георгьевна','afanasiya22071988@ya.ru',0,NULL),
(1746,'yulian.vihrov','[\"ROLE_STUDENT\"]','$2y$13$cDyCdXwtCvpt1AAP0eKLZuLzq7KPIKqdrq.8lnQv6EXvb2mqw2Xgm','student12.jpg',18,1,'Вихров','Юлиан Кириллович','yulian.vihrov@gmail.com',0,NULL),
(1747,'anastasiya9742','[\"ROLE_STUDENT\"]','$2y$13$7pw14GVEPHhQLEG.2EZlKeA0b.i5O4PVcCx6BvtpB5vhfLiVMp/Re','student14.jpg',8,1,'Цедлиц','Анастасия Лльвона','anastasiya9742@hotmail.com',0,NULL),
(1748,'vasiliy2503','[\"ROLE_STUDENT\"]','$2y$13$Fyv5yWxKmi3SaP9hAFybD.mKf.BbGb98pa79s9TymP4IeYsWphD1O','student13.jpg',2,1,'Краснобаев','Василий Маркович','vasiliy2503@mail.ru',0,NULL),
(1749,'yulian.vaenga','[\"ROLE_STUDENT\"]','$2y$13$s3QZMcFHBtJrUmYMmt2TJuqnSdbAOiToeP1uY2BNdkSNWJz8/gAq.','student5.jpg',10,1,'Ваенга','Юлиан Кириллович','yulian.vaenga@outlook.com',0,NULL),
(1750,'vera6336','[\"ROLE_STUDENT\"]','$2y$13$rfVmtHhcOjk9QDD8sNTf5OiL1CiDmRjsHJiaPfGOksOUzZmdXN4WO','student3.jpg',20,1,'Воейкова','Вера Ростиславовна','vera6336@yandex.ru',0,NULL),
(1751,'yuliya22','[\"ROLE_STUDENT\"]','$2y$13$ZNUksqXIp85sm4u2yEdeY.HLnLU201Ap7u3geokD/JiwoBUivMJMC','student17.jpg',19,1,'Штыкова','Юлия Максимовна','yuliya22@outlook.com',0,NULL),
(1752,'yuriy.ignatev','[\"ROLE_STUDENT\"]','$2y$13$X/imLkXkiQiWmEzKIwU0cu932EvBoHSWXOKX5efi0/VFXDhwZcgPy','student20.jpg',4,1,'Игнатьев','Юрий Нифонтович','yuriy.ignatev@rambler.ru',0,NULL),
(1753,'klara45','[\"ROLE_STUDENT\"]','$2y$13$iXCB9XVWj3YIbLZ1AzRD9.YhkkR4wyb3nDNdnUfhI/S2yVUhRTiUC','student18.jpg',16,1,'Ильина','Клара Данииловна','klara45@outlook.com',0,NULL),
(1754,'marianna02041988','[\"ROLE_STUDENT\"]','$2y$13$QXp2kHXCMxjG8YtPseoR2.6Qup5GvY15JqP1smBJMt8ZV9DnQ4bCG','student16.jpg',7,1,'Блок','Марианна Романовна','marianna02041988@ya.ru',0,NULL),
(1755,'galina3012','[\"ROLE_STUDENT\"]','$2y$13$BNineKXCU8wzQIsg3OyzUOXeGCAVE7pk6MubvY8Vi9VzPzGHBpgo.','student10.jpg',7,1,'Тычинина','Галина Елизаровна','galina3012@gmail.com',0,NULL),
(1756,'semen1968','[\"ROLE_STUDENT\"]','$2y$13$/r6.8cvqkmrWD.iPrrqni.LBG6pWHjl0b4AW9nZMl3vTnAz/RwwE2','student17.jpg',14,1,'Бурый','Семен Ипполитович','semen1968@rambler.ru',0,NULL),
(1757,'valentin09111976','[\"ROLE_STUDENT\"]','$2y$13$QzinQohBHjeyxQWtvg.ZwuQE3igOvLbOQOElWdiSXRRtWMHHf3MTq','student13.jpg',13,1,'Якубовский','Валентин Львович','valentin09111976@rambler.ru',0,NULL),
(1758,'fedor04041977','[\"ROLE_STUDENT\"]','$2y$13$6VJwN6dDwkjMO6q8BkTMAun6AltTCm..j8ytOupwPoWdxOHeq/izC','student1.jpg',7,1,'Бурцов','Федор Ефимович','fedor04041977@rambler.ru',0,NULL),
(1759,'inna.rubanova','[\"ROLE_STUDENT\"]','$2y$13$MfZo.W42aIUaZGuUe5BcXefHbOwHK2lHtvxo5GeHiTbGhujpIeYg2','student5.jpg',11,1,'Рубанова','Инна Викторовна','inna.rubanova@yandex.ru',0,NULL),
(1760,'gerasim.uglickiy','[\"ROLE_STUDENT\"]','$2y$13$YtF9yntsYTtmHGpoNNS2AuzmT2fZXFhAEAL06.RJTikqqDufvhADi','student8.jpg',6,1,'Углицкий','Герасим Валерианович','gerasim.uglickiy@ya.ru',0,NULL),
(1761,'rimma06081971','[\"ROLE_STUDENT\"]','$2y$13$XlUJvQh5TARauTOyIP3RWev3LGqbiWpyHa0JEC8VBI2BlQQW/iU76','student9.jpg',13,1,'Хабенская','Римма Прохор','rimma06081971@ya.ru',0,NULL),
(1762,'janna37','[\"ROLE_STUDENT\"]','$2y$13$qcDyQX5pYCf0bPyCbmjwD.s2Jd6sVTZLr9uH5vJzUWhlBLwK/GyBe','student18.jpg',5,1,'Головнина','Жанна Леонтьевна','janna37@ya.ru',0,NULL),
(1763,'marianna1963','[\"ROLE_STUDENT\"]','$2y$13$wko7bFwvh1xovzQHXdW42uLfALJo4VfenObgvlTgqJ/O4gRwN.mau','student9.jpg',1,1,'Делова','Марианна Егоровна','marianna1963@mail.ru',0,NULL),
(1764,'evgeniya4141','[\"ROLE_STUDENT\"]','$2y$13$i8xDNGucJwptB3SypFSodOAfXtLMWTjd1Al17QJvFkOnMZj9WusZG','student2.jpg',8,1,'Норина','Евгения Валерьевна','evgeniya4141@ya.ru',0,NULL),
(1765,'efim45','[\"ROLE_STUDENT\"]','$2y$13$lnsC6Q7FxV66cZEbAlQ2Qe.IHLFhojTUm.f3m/PLJMr1krMOi0K0e','student4.jpg',10,1,'Пенкин','Ефим Аркадинович','efim45@gmail.com',0,NULL),
(1766,'kirill6653','[\"ROLE_STUDENT\"]','$2y$13$4qoj3Mptknmk.pMKDeh1cOb0hpTxbb5SuaL9vuUQuRUKsKbmpJT4S','student11.jpg',19,1,'Никишин','Кирилл Серафимович','kirill6653@hotmail.com',0,NULL),
(1767,'sergey13021984','[\"ROLE_STUDENT\"]','$2y$13$X/WMm7FPaM8Ljoo3p2XVWusqXvCg9MZteWJgRPRsMCvr6KyTqdkOi','student2.jpg',17,1,'Яловкин','Сергей Акимович','sergey13021984@yandex.ru',0,NULL),
(1768,'nikifor06081991','[\"ROLE_STUDENT\"]','$2y$13$XnhACHSP0qvNUwyizw81n.HIHOjtqGRFrxjL7XmfuDirsO0R/6jvq','student9.jpg',20,1,'Янович','Никифор Георгиевич','nikifor06081991@rambler.ru',0,NULL),
(1769,'dmitriy18','[\"ROLE_STUDENT\"]','$2y$13$fv01qx.1bqpNkSZqP9sMzesYq.ZB/eTPEjh3kyZNNJwR.KM1z6F2i','student9.jpg',17,1,'Афанасьев','Дмитрий Васильевич','dmitriy18@hotmail.com',0,NULL),
(1770,'elena.kuksilova','[\"ROLE_STUDENT\"]','$2y$13$d0F6XUfrScsj.T32TZDjd.bED3NYsRE6dciVbg8QS.fdDabNN4yq2','student14.jpg',9,1,'Куксилова','Елена Павловна','elena.kuksilova@gmail.com',0,NULL),
(1771,'veniamin1974','[\"ROLE_STUDENT\"]','$2y$13$jCat0zl300PkKZofXJVEAOojUpY70aDFuA6n.McO.qvgCOF5Vaxvy','student3.jpg',20,1,'Постников','Вениамин Маркович','veniamin1974@gmail.com',0,NULL),
(1772,'filipp.habalov','[\"ROLE_STUDENT\"]','$2y$13$STL1FuHNGhmt4fojNlTuD.9udMjwYAyqgZX4iLWEhut6zjuVmPePS','student8.jpg',7,1,'Хабалов','Филипп Ипполитович','filipp.habalov@rambler.ru',0,NULL),
(1773,'viktor.molodyh','[\"ROLE_STUDENT\"]','$2y$13$IA0T.6sqJn2Lb5jwgg0u0eZCUvXzy/dwx/lQ33ktci0rz8i.ZRec6','student6.jpg',4,1,'Молодых','Виктор Трофимович','viktor.molodyh@rambler.ru',0,NULL),
(1774,'zoya1930','[\"ROLE_STUDENT\"]','$2y$13$TCEPl6BnkLmM0RkIjypOl.K.5CjKxhfBr3a2WNsxUG9L3okcFrY3K','student16.jpg',8,1,'Бонч-Бруевич','Зоя Нифонтовна','zoya1930@rambler.ru',0,NULL),
(1775,'tamara02061971','[\"ROLE_STUDENT\"]','$2y$13$cRYoOrA.kiIn/Mq3a2GaxOn66/e5UIJZLsWMrZ9Plr9lzGhULmJ/m','student9.jpg',15,1,'Радостина','Тамара Михаиловна','tamara02061971@gmail.com',0,NULL),
(1776,'aleksandr.aristov','[\"ROLE_STUDENT\"]','$2y$13$m4ycu/i59034H2qwbPJwLuqMv46HDoSLtGKiABPpSrOFxo0bhhqG.','student16.jpg',20,1,'Аристов','Александр Себастьянович','aleksandr.aristov@mail.ru',0,NULL),
(1777,'marfa.kuvykina','[\"ROLE_STUDENT\"]','$2y$13$aiLxR5xtq5/18vYwc8M.nuZZIk3fA8FotEJLmSCPFEY7yMplUnsCa','student18.jpg',18,1,'Кувыкина','Марфа Лукьяновна','marfa.kuvykina@yandex.ru',0,NULL),
(1778,'anna.krylaeva','[\"ROLE_STUDENT\"]','$2y$13$hhNDU5bkytmbZ0f7yaRKQemkFhCp1G.Whd999aU7Jj9ewlHoSiyve','student14.jpg',12,1,'Крылаева','Анна Макаровна','anna.krylaeva@ya.ru',0,NULL),
(1779,'yuliana1961','[\"ROLE_STUDENT\"]','$2y$13$Ay8qRYYsoUp4wr1p5u8eNu3Js9.kwxTt86iJXMNGAc11R3qUoApN6','student8.jpg',3,1,'Мозговая','Юлиана Максимовна','yuliana1961@rambler.ru',0,NULL),
(1780,'lana45','[\"ROLE_STUDENT\"]','$2y$13$zaMuvJEnLQFjGNU2R1QWU.GRKCtuJMl1mYeAG1e8R1iQAmpIDFZpy','student17.jpg',8,1,'Иканова','Лана Ильиновна','lana45@ya.ru',0,NULL),
(1781,'viktoriya1970','[\"ROLE_STUDENT\"]','$2y$13$86NYgSUZn9qgmi9I1elZa.ULQFjyISCQe/n0QPcpO3UK2vvZpZhBW','student19.jpg',17,1,'Боварина','Виктория Евгеньевна','viktoriya1970@gmail.com',0,NULL),
(1782,'valentin7563','[\"ROLE_STUDENT\"]','$2y$13$g1tQ9ydxzvLqTw6mZqji7OvGmrlRW47.DIqoBH.Jba7U/TJQmzYyW','student5.jpg',13,1,'Фахриев','Валентин Павлович','valentin7563@mail.ru',0,NULL),
(1783,'ignat.preobrajenskiy','[\"ROLE_STUDENT\"]','$2y$13$cbTcfG8YBg3EqxQGCR9h0eseukSTjs2j5i..pG478v.3p8.WJOzJ2','student9.jpg',6,1,'Преображенский','Игнат Александрович','ignat.preobrajenskiy@gmail.com',0,NULL),
(1784,'ulyana1988','[\"ROLE_STUDENT\"]','$2y$13$YW6VqoLletFp0iwt2IoQBuHz4OPpTryOYknWEauajWmXF6F/x3pXS','student2.jpg',8,1,'Каменских','Ульяна Денисовна','ulyana1988@ya.ru',0,NULL),
(1785,'ignat1987','[\"ROLE_STUDENT\"]','$2y$13$q2AU5t3OnPz0VX4Y91oONONAl6lSI187uQBYH/qZOCGyPKsjoBDBO','student2.jpg',1,1,'Бендлин','Игнат Севастьянович','ignat1987@yandex.ru',0,NULL),
(1786,'lidiya15','[\"ROLE_STUDENT\"]','$2y$13$GaPCERV.i7ebOtUkkSEsvOEmBttfIZztzaL/KzlOF8z5DwMjlkagG','student17.jpg',18,1,'Шкригунова','Лидия Алексеевна','lidiya15@ya.ru',0,NULL),
(1787,'nina06021974','[\"ROLE_STUDENT\"]','$2y$13$0oPehXeONulVV/wq9LuZouRItsS9YUooLT1LkblhgvuP2Y.R9UfoC','student4.jpg',4,1,'Воскобойникова','Нина Федоровна','nina06021974@hotmail.com',0,NULL),
(1788,'anfisa1966','[\"ROLE_STUDENT\"]','$2y$13$/jgf.aIYbMlVRMSDiFPAhuICRbOeGd7lBYIkY/Te8m2ScYYY0gI6C','student9.jpg',20,1,'Эфирова','Анфиса Фадеевна','anfisa1966@ya.ru',0,NULL),
(1789,'ulyana1996','[\"ROLE_STUDENT\"]','$2y$13$cfcgTeT8CAmFDYjqg0s3T.E84JDMejAcvDZhinn8BzrlyWb.RNJgO','student15.jpg',11,1,'Рыбалкина','Ульяна Степановна','ulyana1996@gmail.com',0,NULL),
(1790,'david11081986','[\"ROLE_STUDENT\"]','$2y$13$bSYVzSp51lh2PdEjMkBAnu94miiOneennk4b/2I/vEzrIUKvje4ly','student7.jpg',19,1,'Волошин','Давид Феодосивич','david11081986@ya.ru',0,NULL),
(1791,'ekaterina23111988','[\"ROLE_STUDENT\"]','$2y$13$DN/fE.N6Y71Glehl06hrh.R1w2Hjahhwk2ff2fqMhjdcbIq6vFfDO','student2.jpg',12,1,'Кувыкина','Екатерина Никифоровна','ekaterina23111988@yandex.ru',0,NULL),
(1792,'leontiy7380','[\"ROLE_STUDENT\"]','$2y$13$kdWsdfWLeq4wNGqSxniKH.z/C9GiGLlej60FH5.BP9ee6ZzOzyPC.','student17.jpg',18,1,'Пушной','Леонтий Витальевич','leontiy7380@hotmail.com',0,NULL),
(1793,'kira.alieva','[\"ROLE_STUDENT\"]','$2y$13$Q1J/QNbsuD7Llce1OtTRNuDnbe98zmK172paTk1KuNLgKfGVHG/5K','student2.jpg',6,1,'Алиева','Кира Михаиловна','kira.alieva@outlook.com',0,NULL),
(1794,'alina3801','[\"ROLE_STUDENT\"]','$2y$13$ws6dZOQgFNheO9OUbbMUKuAWIu7EjmpFAs/I7MOUR9cQ82/bX.PIm','student14.jpg',13,1,'Емельянова','Алина Геннадьевна','alina3801@yandex.ru',0,NULL),
(1795,'milana.moskvina','[\"ROLE_STUDENT\"]','$2y$13$v/xzypdMGzMlN6RcqvQLZu3mH10ss0hnISNyJB2.1sfGxYL3t7HZe','student20.jpg',15,1,'Москвина','Милана Макаровна','milana.moskvina@ya.ru',0,NULL),
(1796,'elizaveta26021992','[\"ROLE_STUDENT\"]','$2y$13$rXQhPIsDF2IkKkcZjvndR.CxVzPQFuZ0Fo1PoPWoG7sPvy37kM7bu','student6.jpg',7,1,'Шастина','Елизавета Вячеславовна','elizaveta26021992@outlook.com',0,NULL),
(1797,'anna99','[\"ROLE_STUDENT\"]','$2y$13$vTeeEV0RQhjj.MyvQXbK3uqbEPDYdXqBoUZVWEjp7l/GTj4bc19GC','student10.jpg',2,1,'Пугина','Анна Федоровна','anna99@yandex.ru',0,NULL),
(1798,'kirill04071990','[\"ROLE_STUDENT\"]','$2y$13$SSXngXRPlzyaPQLWCPf59OrZzhSz7FxMS076hEWjukRRL1qLkKl2y','student9.jpg',2,1,'Осипов','Кирилл Феликсович','kirill04071990@rambler.ru',0,NULL),
(1799,'lyudmila1960','[\"ROLE_STUDENT\"]','$2y$13$w3MaZ9FYmmFGTnyiV.tc8ugIuI.mwa.BbCGrOAfuZ4dykp71WoFri','student8.jpg',4,1,'Курышина','Людмила Нифонтовна','lyudmila1960@outlook.com',0,NULL),
(1800,'daniil.gilev','[\"ROLE_STUDENT\"]','$2y$13$zhhoi4GSxTKgMEHUctNG7eBobwbaDn2aqZCgNbsbOvGJosD1LO5Vu','student10.jpg',7,1,'Гилёв','Даниил Афанасьевич','daniil.gilev@ya.ru',0,NULL),
(1801,'yakov.kinjaev','[\"ROLE_STUDENT\"]','$2y$13$aXV/.Ob9.owUWosTqSNz1u2C0spHPm1xhWT33pZnvz5i5gNP4/k5S','student19.jpg',5,1,'Кинжаев','Яков Прохорович','yakov.kinjaev@hotmail.com',0,NULL),
(1802,'efim4682','[\"ROLE_STUDENT\"]','$2y$13$oa1gp.J6YzZjlIgNWs2yhuio4tAfkQYojBOWG1wvu.cboI7OO4NAu','student11.jpg',9,1,'Улицкий','Ефим Викторович','efim4682@yandex.ru',0,NULL),
(1803,'kirill9911','[\"ROLE_STUDENT\"]','$2y$13$Vraw1oH96g9esi/I35lpHeMjMSwhXemGMDrWmu2BHxrYzoRFNb9p.','student11.jpg',16,1,'Кочетов','Кирилл Алексеевич','kirill9911@gmail.com',0,NULL),
(1804,'evgeniya10','[\"ROLE_STUDENT\"]','$2y$13$P7bM4l6sDSlup4VpLhogBebXJi5txWiZjEcg0qHoaUGr3tmQ9NhcG','student19.jpg',18,1,'Янзинова','Евгения Феоктистовна','evgeniya10@outlook.com',0,NULL),
(1805,'sergey15051987','[\"ROLE_STUDENT\"]','$2y$13$5oJ7X8UVX2SMRSz.1ov4YOgE69NnENxG98HgRF972KxFB1GSy5AI2','student7.jpg',12,1,'Ярошевич','Сергей Кириллович','sergey15051987@rambler.ru',0,NULL),
(1806,'viktoriya19121981','[\"ROLE_STUDENT\"]','$2y$13$2KX2IdxrRie9aq2o35nhaurKyXKLrAJJxTSCvoPZ/O/aWT85RIArq','student11.jpg',18,1,'Муравей','Виктория Феодосьевна','viktoriya19121981@rambler.ru',0,NULL),
(1807,'timofey1313','[\"ROLE_STUDENT\"]','$2y$13$ilP721af/JjmhFLn9wOQ6.m/CbuBWZlnS8odHUxVMapfRQXYApKJK','student11.jpg',8,1,'Ванин','Тимофей Александрович','timofey1313@rambler.ru',0,NULL),
(1808,'yaroslava19121988','[\"ROLE_STUDENT\"]','$2y$13$Kve4h/x7tmKyrwpB4CwYgexcmdMTz8HEpEpfneaB4ENrhvQgFnAsu','student8.jpg',9,1,'Гальцева','Ярослава Егоровна','yaroslava19121988@hotmail.com',0,NULL),
(1809,'yuliana7977','[\"ROLE_STUDENT\"]','$2y$13$abJ/3PzGJ9Hz0ClPgawNOuWIiJB8WeKEUwuMetZsrljY5vnmQnQee','student8.jpg',10,1,'Огородникова','Юлиана Николаевна','yuliana7977@rambler.ru',0,NULL),
(1810,'vera26061995','[\"ROLE_STUDENT\"]','$2y$13$IXb76YBAIB7TioPglReOouLhgKEbHx9cMUuA06mZP1kjfqSDnqouC','student4.jpg',19,1,'Панарина','Вера Семеновна','vera26061995@rambler.ru',0,NULL),
(1811,'serafim68','[\"ROLE_STUDENT\"]','$2y$13$DDA6mzZeqc5Z0isnlG/5wurJe1wIDmtktxp1k.WUJyPl8n7xsRr/u','student15.jpg',3,1,'Садков','Серафим Витальевич','serafim68@rambler.ru',0,NULL),
(1812,'roman1980','[\"ROLE_STUDENT\"]','$2y$13$0clrcZjsRxNxkTkUIxsnj.brul2Twyi1SuG4pPfzsPEz.Xs8topm6','student11.jpg',13,1,'Кондратьев','Роман Никифорович','roman1980@hotmail.com',0,NULL),
(1813,'german20021990','[\"ROLE_STUDENT\"]','$2y$13$zhp7XFltqdFTbAYyZVDwsuDX5nKm4sbAnvvs9eSeSXiekDQwuI0ES','student15.jpg',12,1,'Якименко','Герман Маркович','german20021990@outlook.com',0,NULL),
(1814,'valeriy.nikitenko','[\"ROLE_STUDENT\"]','$2y$13$RIKciYOTDl6RwV8rD4lxs.9PXXY95DaZ7.6ZOFGp.06VPJYd3Cvc2','student9.jpg',19,1,'Никитенко','Валерий Никитович','valeriy.nikitenko@hotmail.com',0,NULL),
(1815,'antonina93','[\"ROLE_STUDENT\"]','$2y$13$iDMuOfWzry9lVzU3jQ4nHePqyTS2D29zAl/wIaw/Ig6YSvjyHpELm','student3.jpg',19,1,'Рогова','Антонина Елизаровна','antonina93@yandex.ru',0,NULL),
(1816,'vitaliy2579','[\"ROLE_STUDENT\"]','$2y$13$lAHyQZ5eWMbGDJ/7jCEbOeChTsdBG.fdKckKZXVAYiOqm9HcKzOW6','student9.jpg',19,1,'Гаврин','Виталий Леонтьевич','vitaliy2579@gmail.com',0,NULL),
(1817,'fedor16','[\"ROLE_STUDENT\"]','$2y$13$MyfNLmmM55BGJ4k0YB44l.vGikG2VmAaFUsHjUJh/fb/MD/PW5y9y','student15.jpg',2,1,'Трутнев','Федор Прокопьевич','fedor16@gmail.com',0,NULL),
(1818,'nikita9678','[\"ROLE_STUDENT\"]','$2y$13$gOzpytj/v.S43g9szbplNOY1BrsY0XgyKg.8tGq7WSaLQMA1Pubni','student3.jpg',2,1,'Шипулин','Никита Себастьянович','nikita9678@ya.ru',0,NULL),
(1819,'tatyana.savickaya','[\"ROLE_STUDENT\"]','$2y$13$YpmQRK/zhcu9cDXnipmLUeDuwpjTj52ZMkLuuuJQTcZ1Vb6hp0ScS','student20.jpg',1,1,'Савицкая','Татьяна Панкратовна','tatyana.savickaya@gmail.com',0,NULL),
(1820,'anjela.bunina','[\"ROLE_STUDENT\"]','$2y$13$2cxwl02w8eZ1hnRnmkToF.OF21/TPL81OVkR6A2/cuc63gooNtgxa','student13.jpg',9,1,'Бунина','Анжела Иннокентьевна','anjela.bunina@outlook.com',0,NULL),
(1821,'efim1988','[\"ROLE_STUDENT\"]','$2y$13$TOfLcKK2/EhBXRhMQfOxzODl4Sn4Abct.cKqc156xp3pExk2ISNLS','student13.jpg',20,1,'Яндуткин','Ефим Ираклиевич','efim1988@mail.ru',0,NULL),
(1822,'danila28121964','[\"ROLE_STUDENT\"]','$2y$13$VQBT5huUto3ObKS5sRZz7uv.NsO12QV6EKmDnYxIGS9RWUcRqGLoG','student3.jpg',4,1,'Буркин','Данила Филиппович','danila28121964@hotmail.com',0,NULL),
(1823,'yurin61','[\"ROLE_STUDENT\"]','$2y$13$6olv97gVR6YjZWbThfgVM.8h0XcV0zt9c8AQzOWNARL97ESKpNecm','student10.jpg',12,1,'Сучков','Юрин Федорович','yurin61@gmail.com',0,NULL),
(1824,'karina6927','[\"ROLE_STUDENT\"]','$2y$13$elbSd3kTZnLXBJeRG9POWObNNGUuQ2AZyY8LZx5AaXLbNHu.MVzgq','student16.jpg',7,1,'Трушевская','Карина Ипполитовна','karina6927@hotmail.com',0,NULL),
(1825,'vasiliy25061971','[\"ROLE_STUDENT\"]','$2y$13$NVMOvn1xcf8LGtlN9lvADOl61hC.KBJVWXoBfZsNIU0Ety5Jx/Ode','student8.jpg',14,1,'Двуреченский','Василий Семенович','vasiliy25061971@mail.ru',0,NULL),
(1826,'aleksandra23111962','[\"ROLE_STUDENT\"]','$2y$13$NENLG0GRBikYNH4l53NLreojdvkhompxqpAgzCOvP3DjJtddApeSK','student7.jpg',16,1,'Лаврентьева','Александра Иннокентьевна','aleksandra23111962@gmail.com',0,NULL),
(1827,'roman1966','[\"ROLE_STUDENT\"]','$2y$13$pymrskErFXcK1XW4whAoCePieeG0dNvAFoXYl6N9hPy2dm5hf.J16','student4.jpg',9,1,'Силиванов','Роман Денисович','roman1966@ya.ru',0,NULL),
(1828,'maksim9417','[\"ROLE_STUDENT\"]','$2y$13$rEKrwYRzUIsZVDn3QbKuA.7Y.xtpos4M5Q78RlxoRPUBxbAyzybNK','student5.jpg',9,1,'Кирилов','Максим Георгиевич','maksim9417@outlook.com',0,NULL);
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

-- Dump completed on 2024-04-21 13:18:38
