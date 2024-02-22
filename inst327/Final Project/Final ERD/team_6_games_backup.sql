CREATE DATABASE  IF NOT EXISTS `group6-games` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `group6-games`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: group6-games
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `consoles`
--

DROP TABLE IF EXISTS `consoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consoles` (
  `console_id` int NOT NULL,
  `console_name` varchar(45) NOT NULL,
  PRIMARY KEY (`console_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consoles`
--

LOCK TABLES `consoles` WRITE;
/*!40000 ALTER TABLE `consoles` DISABLE KEYS */;
INSERT INTO `consoles` VALUES (1,'GB'),(2,'SNES'),(3,'N64');
/*!40000 ALTER TABLE `consoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developers`
--

DROP TABLE IF EXISTS `developers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developers` (
  `developer_id` int NOT NULL,
  `developer_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`developer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developers`
--

LOCK TABLES `developers` WRITE;
/*!40000 ALTER TABLE `developers` DISABLE KEYS */;
INSERT INTO `developers` VALUES (1,'Nintendo'),(2,'Rare'),(3,'Heavy Iron Studios'),(4,'Sculpture Software'),(5,'Square'),(6,'Capcom'),(7,'HAL Laboratory'),(8,'Game Freak'),(9,'Enix'),(10,'Heartbeat'),(11,'Produce'),(12,'Nova Co.'),(13,'Iguana Entertainment'),(14,'Hudson Soft'),(15,'EA Sports'),(16,'Midway Games'),(17,'Black Ops Entertainment'),(18,'Interactive Studio'),(19,'Tiburon Entertainment'),(20,'The 3DO Company'),(21,'Kodiak Interactive'),(22,'Angel Studio'),(23,'Edge of Reality'),(24,'High Voltage Software'),(25,'Acclaim Entertainment'),(26,'Konami Holdings Corp'),(27,'Probe Entertainment');
/*!40000 ALTER TABLE `developers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `game_id` int NOT NULL AUTO_INCREMENT,
  `game_title` varchar(45) NOT NULL,
  `developer_id` int NOT NULL,
  `publisher_id` int NOT NULL,
  `console_id` int NOT NULL,
  `release_date` datetime DEFAULT NULL,
  PRIMARY KEY (`game_id`,`developer_id`,`publisher_id`,`console_id`),
  KEY `fk_games_developers1_idx` (`developer_id`),
  KEY `fk_games_publishers1_idx` (`publisher_id`),
  KEY `fk_games_consoles1_idx` (`console_id`),
  CONSTRAINT `fk_games_consoles` FOREIGN KEY (`console_id`) REFERENCES `consoles` (`console_id`),
  CONSTRAINT `fk_games_developers1` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`developer_id`),
  CONSTRAINT `fk_games_publishers1` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Pokemon Red/Blue',1,1,1,'1996-02-27 00:00:00'),(2,'Tetris',1,1,1,'1989-06-14 00:00:00'),(3,'Pokemon Gold/Silver',1,1,1,'1999-11-21 00:00:00'),(4,'Super Mario Land',1,1,1,'1989-04-21 00:00:00'),(5,'Dr. Mario',1,1,1,'1990-06-27 00:00:00'),(6,'Kirby\'s Dream Land',7,1,1,'1992-04-27 00:00:00'),(7,'F-1 Race',7,1,1,'1984-11-02 00:00:00'),(8,'Donkey Kong Land',2,1,1,'1995-06-26 00:00:00'),(9,'The Legend of Zelda: Link\'s Awakening',1,1,1,'1993-06-06 00:00:00'),(11,'Yu-Gi-Oh! Duel Monsters',26,17,1,'1998-12-16 00:00:00'),(12,'Baseball',1,1,1,'1983-12-07 00:00:00'),(13,'Disney\'s DuckTales',6,2,1,'1989-09-14 00:00:00'),(16,'Tetris DX',1,1,1,'1998-10-21 00:00:00'),(17,'Yakuman',1,1,1,'1989-04-21 00:00:00'),(18,'Game & Watch Gallery',1,1,1,'1997-02-01 00:00:00'),(19,'Final Fantasy Legend III',5,3,1,'1991-12-13 00:00:00'),(20,'Yoshi',1,1,1,'1991-12-14 00:00:00'),(21,'Super Mario World',1,1,2,'1990-11-21 00:00:00'),(22,'Donkey Kong Country',2,1,2,'1994-11-21 00:00:00'),(24,'F-Zero',1,1,2,'1990-11-21 00:00:00'),(25,'Mortal kombat II',4,5,2,'1994-09-09 00:00:00'),(26,'Final Fantasy II',5,3,2,'1991-07-19 00:00:00'),(27,'Street Fighter II: The World Warrior',6,2,2,'1992-06-10 00:00:00'),(28,'Star Fox',1,1,2,'1993-02-21 00:00:00'),(29,'Earthbound',7,1,2,'1994-08-27 00:00:00'),(30,'Super Mario All-Stars',1,1,2,'1993-07-14 00:00:00'),(31,'Final Fantasy III',5,3,2,'1994-04-02 00:00:00'),(32,'Killer Instinct',2,1,2,'1995-08-30 00:00:00'),(33,'Dragon Quest VI: Maboroshi no Daichi',10,4,2,'1995-12-09 00:00:00'),(34,'Mega Man X',6,2,2,'1993-12-17 00:00:00'),(35,'Super Bomberman 2',11,9,2,'1994-04-28 00:00:00'),(36,'Fatal Fury 2',12,8,2,'1993-11-26 00:00:00'),(37,'Chrono Trigger',5,3,2,'1995-03-11 00:00:00'),(38,'Donkey Kong Country 2: Diddy\'s Kong Quest',2,1,2,'1995-11-20 00:00:00'),(39,'Mario Paint',1,1,2,'1992-07-14 00:00:00'),(40,'NFL Quarterback Club 98',13,13,3,'1997-10-24 00:00:00'),(41,'Bomberman 64: The Second Attack!',14,14,3,'1999-12-03 00:00:00'),(43,'Mortal Kombat Trilogy',16,16,3,'1996-09-01 00:00:00'),(44,'Knockout Kings 2000',17,17,3,'1999-10-03 00:00:00'),(47,'Killer Instinct Gold',2,1,3,'1996-11-25 00:00:00'),(51,'Conker\'s Bad Fur Day',2,2,3,'1996-03-05 00:00:00'),(53,'San Francisco Rush: Extreme Racing',16,16,3,'1996-12-24 00:00:00'),(55,'WWF Attitude',25,4,3,'1999-01-01 00:00:00'),(56,'Blast Corps',2,2,3,'1997-03-21 00:00:00'),(60,'Ready 2 Rumble Boxing',18,16,3,'1999-09-08 00:00:00');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL,
  `genre_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Action'),(2,'Adventure'),(3,'Shooter'),(4,'Racing'),(5,'Platform'),(6,'Sports'),(7,'Role-Playing'),(8,'Puzzle'),(9,'Music'),(10,'Simulation'),(11,'Fighting'),(12,'Strategy'),(13,'Arcade'),(14,'Flight'),(15,'Survival'),(16,'Fishing'),(17,'Mecha'),(18,'Space Flight'),(19,'Party'),(20,'Mecha'),(21,'Sim'),(22,'Hack and Slash'),(23,'First-Person'),(24,'Third-Person'),(25,'Beat \'em up'),(26,'Hunting'),(27,'Visual Novel'),(28,'Mystery'),(29,'Anime'),(30,'Cyberpunk');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres_has_games`
--

DROP TABLE IF EXISTS `genres_has_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres_has_games` (
  `genre_id` int NOT NULL,
  `game_id` int NOT NULL,
  `console_id` int NOT NULL,
  `developer_id` int NOT NULL,
  `publisher_id` int NOT NULL,
  PRIMARY KEY (`genre_id`,`game_id`,`console_id`,`developer_id`,`publisher_id`),
  KEY `fk_genres_has_games_games1_idx` (`game_id`,`console_id`,`developer_id`,`publisher_id`),
  KEY `fk_genres_has_games_genres1_idx` (`genre_id`),
  KEY `fk_genres_has_games_games1` (`game_id`,`developer_id`,`publisher_id`),
  CONSTRAINT `fk_genres_has_games_games1` FOREIGN KEY (`game_id`, `developer_id`, `publisher_id`) REFERENCES `games` (`game_id`, `developer_id`, `publisher_id`),
  CONSTRAINT `fk_genres_has_games_genres1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres_has_games`
--

LOCK TABLES `genres_has_games` WRITE;
/*!40000 ALTER TABLE `genres_has_games` DISABLE KEYS */;
INSERT INTO `genres_has_games` VALUES (1,9,1,1,1),(1,56,3,2,2),(2,41,3,14,14),(3,28,2,1,1),(4,7,1,7,1),(4,24,2,1,1),(4,53,3,16,16),(5,4,1,1,1),(5,6,1,7,1),(5,8,1,2,1),(5,13,1,6,2),(5,21,2,1,1),(5,22,2,2,1),(5,30,2,1,1),(5,38,2,2,1),(5,51,3,2,2),(6,12,1,1,1),(6,40,2,13,13),(6,60,3,18,16),(7,1,1,1,1),(7,3,1,1,1),(7,19,1,5,3),(7,26,2,5,3),(7,29,2,7,1),(7,31,2,5,3),(7,33,2,10,4),(7,37,2,5,3),(8,2,1,1,1),(8,5,1,1,1),(8,16,1,1,1),(8,20,1,1,1),(8,35,2,11,9),(9,17,1,1,1),(9,18,1,1,1),(9,39,2,1,1),(11,25,2,4,5),(11,27,2,6,2),(11,32,2,2,1),(11,34,2,6,2),(11,36,2,12,8),(11,43,3,16,16),(11,44,3,17,17),(11,47,3,2,1),(11,55,3,25,4),(12,11,1,26,17);
/*!40000 ALTER TABLE `genres_has_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `publisher_id` int NOT NULL,
  `publisher_name` varchar(45) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Nintendo'),(2,'Capcom'),(3,'Squaresoft'),(4,'Enix Corporation'),(5,'Acclaim Entertainment'),(6,'Namco Bandai Games'),(7,'Laguna'),(8,'Takara'),(9,'Hudson Soft'),(10,'THQ'),(11,'Acclaim Entertainment'),(12,'Electronic Arts'),(13,'GT Interactive'),(14,'Hasbro'),(15,'Activision'),(16,'LEGO media'),(17,'Konami Digital Entertainment'),(18,'Midway Games');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `region_id` int NOT NULL,
  `region` varchar(45) NOT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'NA'),(2,'JP'),(3,'PAL');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions_has_games`
--

DROP TABLE IF EXISTS `regions_has_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions_has_games` (
  `region_id` int NOT NULL,
  `game_id` int NOT NULL,
  `developer_id` int NOT NULL,
  `publisher_id` int NOT NULL,
  `console_id` int NOT NULL,
  `sales` float DEFAULT NULL,
  PRIMARY KEY (`region_id`,`game_id`,`developer_id`,`publisher_id`,`console_id`),
  KEY `fk_regions_has_games_games1_idx` (`game_id`,`developer_id`,`publisher_id`,`console_id`),
  KEY `fk_regions_has_games_regions1_idx` (`region_id`),
  CONSTRAINT `fk_regions_has_games_games1` FOREIGN KEY (`game_id`, `developer_id`, `publisher_id`, `console_id`) REFERENCES `games` (`game_id`, `developer_id`, `publisher_id`, `console_id`),
  CONSTRAINT `fk_regions_has_games_regions1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions_has_games`
--

LOCK TABLES `regions_has_games` WRITE;
/*!40000 ALTER TABLE `regions_has_games` DISABLE KEYS */;
INSERT INTO `regions_has_games` VALUES (1,1,1,1,1,11.27),(1,2,1,1,1,23.2),(1,3,1,1,1,9),(1,4,1,1,1,10.83),(1,5,1,1,1,2.18),(1,6,7,1,1,2.71),(1,7,7,1,1,1.73),(1,8,2,1,1,1.97),(1,9,1,1,1,2.21),(1,11,26,17,1,0),(1,12,1,1,1,0.66),(1,13,6,2,1,0.82),(1,16,1,1,1,1.06),(1,17,1,1,1,0),(1,18,1,1,1,0.63),(1,19,5,3,1,0),(1,20,1,1,1,0),(1,21,1,1,2,12.78),(1,22,2,1,2,4.36),(1,24,1,1,2,1.37),(1,25,4,5,2,1.48),(1,26,5,3,2,0.24),(1,27,6,2,2,2.47),(1,28,1,1,2,1.61),(1,29,7,1,2,0),(1,30,1,1,2,5.99),(1,31,5,3,2,0.86),(1,32,2,1,2,2.26),(1,33,10,4,2,0),(1,34,6,2,2,0.57),(1,35,11,9,2,0),(1,36,12,8,2,0),(1,37,5,3,2,0.28),(1,38,2,1,2,2.1),(1,39,1,1,2,1.43),(1,41,14,14,3,0.05),(1,43,16,16,3,0.72),(1,44,17,17,3,0.63),(1,47,2,1,3,0.61),(1,51,2,2,3,0.53),(1,55,25,4,3,0.57),(1,56,2,2,3,0.39),(1,60,18,16,3,0.47),(2,1,1,1,1,10.22),(2,2,1,1,1,4.22),(2,3,1,1,1,7.2),(2,4,1,1,1,4.18),(2,5,1,1,1,2),(2,6,7,1,1,1.7),(2,7,7,1,1,0.59),(2,8,2,1,1,1.07),(2,9,1,1,1,0.54),(2,11,26,17,1,1.61),(2,12,1,1,1,0.65),(2,13,6,2,1,0.35),(2,16,1,1,1,0.2),(2,17,1,1,1,1.28),(2,18,1,1,1,0.09),(2,19,5,3,1,0.76),(2,20,1,1,1,0.73),(2,21,1,1,2,3.54),(2,22,2,1,2,3),(2,24,1,1,2,0.89),(2,25,4,5,2,0),(2,26,5,3,2,1.33),(2,27,6,2,2,2.87),(2,28,1,1,2,0.8),(2,29,7,1,2,0.81),(2,30,1,1,2,2.12),(2,31,5,3,2,2.55),(2,32,2,1,2,0.12),(2,33,10,4,2,3.19),(2,34,6,2,2,0.5),(2,35,11,9,2,0.81),(2,36,12,8,2,0.45),(2,37,5,3,2,2.02),(2,38,2,1,2,2.2),(2,39,1,1,2,0.71),(2,41,14,14,3,0.11),(2,43,16,16,3,0),(2,44,17,17,3,0),(2,47,2,1,3,0),(2,51,2,2,3,0),(2,55,25,4,3,0),(2,56,2,2,3,0.17),(2,60,18,16,3,0),(3,1,1,1,1,9.89),(3,2,1,1,1,2.84),(3,3,1,1,1,6.89),(3,4,1,1,1,3.13),(3,5,1,1,1,1.16),(3,6,7,1,1,0.72),(3,7,7,1,1,1.09),(3,8,2,1,1,0.87),(3,9,1,1,1,1.09),(3,11,26,17,1,0.01),(3,12,1,1,1,0.3),(3,13,6,2,1,0.26),(3,16,1,1,1,0.67),(3,17,1,1,1,0),(3,18,1,1,1,0.28),(3,19,5,3,1,0),(3,20,1,1,1,0),(3,21,1,1,2,4.3),(3,22,2,1,2,1.94),(3,24,1,1,2,0.58),(3,25,4,5,2,0.45),(3,26,5,3,2,0.21),(3,27,6,2,2,0.95),(3,28,1,1,2,0.58),(3,29,7,1,2,0),(3,30,1,1,2,2.44),(3,31,5,3,2,0.02),(3,32,2,1,2,0.82),(3,33,10,4,2,0),(3,34,6,2,2,0.09),(3,35,11,9,2,0),(3,36,12,8,2,0),(3,37,5,3,2,0.01),(3,38,2,1,2,0.85),(3,39,1,1,2,0.61),(3,41,14,14,3,0.01),(3,43,16,16,3,0.24),(3,44,17,17,3,0.29),(3,47,2,1,3,0.2),(3,51,2,2,3,0.24),(3,55,25,4,3,0.14),(3,56,2,2,3,0.15),(3,60,18,16,3,0.12);
/*!40000 ALTER TABLE `regions_has_games` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-10 20:56:02
