CREATE DATABASE  IF NOT EXISTS `spycraft` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `spycraft`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: spycraft
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `actor` (
  `idactor` int(11) NOT NULL AUTO_INCREMENT,
  `actor_name` varchar(45) NOT NULL,
  `actor_type_idactor_type` int(11) NOT NULL,
  `discipline` int(11) NOT NULL COMMENT '0 - 10 a measure of ability to maintain discipline among members. 0 = undisciplined / 10 = highly disciplined',
  `political` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non political, eg criminal gang\n1 = political, eg trade union',
  `motivation` int(11) NOT NULL COMMENT '0 - 10 ideological motivation, 0 - not much motivation / 10 - highly motivated, eg islamic jihadi fighter = 10 / greenpeace foot soldier',
  `technology` int(11) NOT NULL COMMENT '0-10, a measure of an orgnisations technological proficiency, 0 = none . 10 = highly sophisticated knowledge of encryption, surveillance, etc',
  `propaganda` int(11) NOT NULL,
  `recruitment` int(11) NOT NULL,
  `agility` int(11) NOT NULL COMMENT '0-10 ability to adapt to changing circumstances in the theatre of conflict',
  `hierarchical` int(11) NOT NULL COMMENT '0 = non-hierarchical, eg distributed cells that act independently and without knowledge of each other\n10 = absolute hierarchy to the point where group will cease to function without leader "kill the head and the body dies"',
  `weapons` int(11) NOT NULL COMMENT '0-10 where 0 equals rank amateur with weapons, 10 high level of proficiency and access of weapons up to and including military hardware',
  `espionage` int(11) NOT NULL COMMENT '0-10 ability to conduct intelligence/counter intelligence operations within the theatre of war, eg Ethnic Gang low, government intelligence agency high. ',
  `diplomacy` int(11) NOT NULL COMMENT '0-10 metric indicating receptivity to diplomacy when all other factors are equal, eg a criminal gang might be amenable to peace offerings, compared to a religiously motivated terrorist who cannot be reasoned with. 10 = high receptivity to diplomacy, 0 = insane fanatic prepared to die in the name of his cause',
  PRIMARY KEY (`idactor`),
  KEY `fk_actor_actor_type1_idx` (`actor_type_idactor_type`),
  CONSTRAINT `fk_actor_actor_type1` FOREIGN KEY (`actor_type_idactor_type`) REFERENCES `actor_type` (`idactor_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_type`
--

DROP TABLE IF EXISTS `actor_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `actor_type` (
  `idactor_type` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `multiplier` int(11) NOT NULL DEFAULT '0' COMMENT 'a number that acts as a force multiplier in the calculation of an actors particular ability, eg a MILITARY type actor receives a bonus in TECHNOLOGY and WEAPONS. Probably further decomposition of this metric will be needed, eg multiplier for weapons, multiplier for propaganda and so on. ',
  PRIMARY KEY (`idactor_type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_type`
--

LOCK TABLES `actor_type` WRITE;
/*!40000 ALTER TABLE `actor_type` DISABLE KEYS */;
INSERT INTO `actor_type` VALUES (1,'AGENCY','Intelligence Agency',7),(2,'TRADE UNION','Trade Union',5),(3,'MEDIA','Legacy Media Organisation',3),(4,'MILITARY','Conventional Nation State Military',7),(5,'MILITIA','Domestic Insurgent',5),(6,'TERRORIST','Ideological Paramilitary',8),(7,'INFLUENCER','Subversive Idea Specialist',4),(8,'POLITICAL','Domestic Political Organisation',5),(9,'INDUSTRY','Industry Regulatory Body',0),(10,'LOBBYIST','Political Influencer',0),(11,'RELIGION','Theistic based Religious Belief',0);
/*!40000 ALTER TABLE `actor_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `agent` (
  `idagent` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `second_name` varchar(45) NOT NULL,
  `alias` varchar(45) DEFAULT 'null',
  `discipline` int(11) DEFAULT NULL,
  `political` int(11) DEFAULT NULL,
  `motivation` int(11) DEFAULT NULL,
  `technology` int(11) DEFAULT NULL,
  `propaganda` int(11) DEFAULT NULL,
  `recruitment` int(11) DEFAULT NULL,
  `agility` int(11) DEFAULT NULL,
  `weapons` int(11) DEFAULT NULL,
  `espionage` int(11) DEFAULT NULL,
  `diplomacy` int(11) DEFAULT NULL,
  `actor_idactor` int(11) NOT NULL,
  PRIMARY KEY (`idagent`),
  KEY `fk_agent_actor1_idx` (`actor_idactor`),
  CONSTRAINT `fk_agent_actor1` FOREIGN KEY (`actor_idactor`) REFERENCES `actor` (`idactor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citizen`
--

DROP TABLE IF EXISTS `citizen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `citizen` (
  `id_citizen` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `second_name` varchar(45) NOT NULL,
  `political_spectrum` int(11) NOT NULL COMMENT '0 = hard left, 10 = hard right',
  `propaganda_susceptible` int(11) NOT NULL COMMENT '0 = extremely susceptible, 10 = immoveable',
  `volatility` int(11) NOT NULL COMMENT '0 = passive / 5 = extremely volatile',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_citizen`),
  UNIQUE KEY `idcitizen_UNIQUE` (`id_citizen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citizen`
--

LOCK TABLES `citizen` WRITE;
/*!40000 ALTER TABLE `citizen` DISABLE KEYS */;
/*!40000 ALTER TABLE `citizen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `event` (
  `idevent` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `scenario_id_scenario` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idevent`),
  KEY `fk_event_scenario1_idx` (`scenario_id_scenario`),
  CONSTRAINT `fk_event_scenario1` FOREIGN KEY (`scenario_id_scenario`) REFERENCES `scenario` (`id_scenario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_actor_scenario`
--

DROP TABLE IF EXISTS `link_actor_scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `link_actor_scenario` (
  `scenario_id_scenario` int(11) NOT NULL,
  `actor_idactor` int(11) NOT NULL,
  KEY `fk_link_actor_scenario_scenario1_idx` (`scenario_id_scenario`),
  KEY `fk_link_actor_scenario_actor1_idx` (`actor_idactor`),
  CONSTRAINT `fk_link_actor_scenario_actor1` FOREIGN KEY (`actor_idactor`) REFERENCES `actor` (`idactor`),
  CONSTRAINT `fk_link_actor_scenario_scenario1` FOREIGN KEY (`scenario_id_scenario`) REFERENCES `scenario` (`id_scenario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_actor_scenario`
--

LOCK TABLES `link_actor_scenario` WRITE;
/*!40000 ALTER TABLE `link_actor_scenario` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_actor_scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_agent_scenario`
--

DROP TABLE IF EXISTS `link_agent_scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `link_agent_scenario` (
  `agent_idagent` int(11) NOT NULL,
  `scenario_id_scenario` int(11) NOT NULL,
  KEY `fk_link_agent_scenario_agent1_idx` (`agent_idagent`),
  KEY `fk_link_agent_scenario_scenario1_idx` (`scenario_id_scenario`),
  CONSTRAINT `fk_link_agent_scenario_agent1` FOREIGN KEY (`agent_idagent`) REFERENCES `agent` (`idagent`),
  CONSTRAINT `fk_link_agent_scenario_scenario1` FOREIGN KEY (`scenario_id_scenario`) REFERENCES `scenario` (`id_scenario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_agent_scenario`
--

LOCK TABLES `link_agent_scenario` WRITE;
/*!40000 ALTER TABLE `link_agent_scenario` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_agent_scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario`
--

DROP TABLE IF EXISTS `scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `scenario` (
  `id_scenario` int(11) NOT NULL AUTO_INCREMENT,
  `scenario_type_id_scenario_type` int(11) NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `long_desc` text NOT NULL,
  PRIMARY KEY (`id_scenario`),
  UNIQUE KEY `idscenario_UNIQUE` (`id_scenario`),
  KEY `fk_scenario_scenario_type_idx` (`scenario_type_id_scenario_type`),
  CONSTRAINT `fk_scenario_scenario_type` FOREIGN KEY (`scenario_type_id_scenario_type`) REFERENCES `scenario_type` (`id_scenario_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario`
--

LOCK TABLES `scenario` WRITE;
/*!40000 ALTER TABLE `scenario` DISABLE KEYS */;
/*!40000 ALTER TABLE `scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario_action`
--

DROP TABLE IF EXISTS `scenario_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `scenario_action` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(45) NOT NULL,
  `scenario_type_id_scenario_type` int(11) NOT NULL,
  PRIMARY KEY (`id_action`),
  KEY `fk_scenario_action_scenario_type1_idx` (`scenario_type_id_scenario_type`),
  CONSTRAINT `fk_scenario_action_scenario_type1` FOREIGN KEY (`scenario_type_id_scenario_type`) REFERENCES `scenario_type` (`id_scenario_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario_action`
--

LOCK TABLES `scenario_action` WRITE;
/*!40000 ALTER TABLE `scenario_action` DISABLE KEYS */;
INSERT INTO `scenario_action` VALUES (1,'ATTACK',1),(2,'DEFEND',1),(3,'WITHDRAW',1),(4,'NEGOTIATE',1),(5,'OBFUSCATE',1),(6,'INFILTRATE',1),(7,'MISINFORMATION',1),(8,'PROBE',1);
/*!40000 ALTER TABLE `scenario_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario_type`
--

DROP TABLE IF EXISTS `scenario_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `scenario_type` (
  `id_scenario_type` int(11) NOT NULL AUTO_INCREMENT,
  `scenario_scope` varchar(10) NOT NULL,
  `scenario_type` varchar(45) NOT NULL,
  `scenario_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`id_scenario_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario_type`
--

LOCK TABLES `scenario_type` WRITE;
/*!40000 ALTER TABLE `scenario_type` DISABLE KEYS */;
INSERT INTO `scenario_type` VALUES (1,'GLOBAL','DC','Direct Confrontation'),(2,'LOCAL','DC','Direct Confrontation'),(3,'LOCAL','ISA','Industrial Strike Action'),(4,'LOCAL','ME','Local Media Event'),(5,'GLOBAL','ME','Global Media Event'),(6,'LOCAL','SAB','Local Saboteur Event');
/*!40000 ALTER TABLE `scenario_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-25  0:32:53
