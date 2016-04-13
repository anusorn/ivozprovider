-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: oasis
-- ------------------------------------------------------
-- Server version	5.5.47-0+deb8u1

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
-- Table structure for table `ApplicationServers`
--

DROP TABLE IF EXISTS `ApplicationServers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApplicationServers` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `ip` varbinary(16) NOT NULL,
  `transport` varchar(4) NOT NULL DEFAULT 'udp',
  `from_pattern` varchar(64) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ApplicationServers`
--

LOCK TABLES `ApplicationServers` WRITE;
/*!40000 ALTER TABLE `ApplicationServers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ApplicationServers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BrandOperators`
--

DROP TABLE IF EXISTS `BrandOperators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BrandOperators` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `brandId` int(10) unsigned NOT NULL,
  `username` varchar(50) NOT NULL,
  `pass` varchar(80) NOT NULL COMMENT '[password]',
  `email` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1',
  `timezoneId` mediumint(8) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `MainOperatorsUniqueBrandUsername` (`brandId`,`username`),
  KEY `brandId` (`brandId`),
  KEY `timezoneId` (`timezoneId`),
  CONSTRAINT `BrandOperators_ibfk_3` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `BrandOperators_ibfk_2` FOREIGN KEY (`timezoneId`) REFERENCES `Timezones` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BrandOperators`
--

LOCK TABLES `BrandOperators` WRITE;
/*!40000 ALTER TABLE `BrandOperators` DISABLE KEYS */;
/*!40000 ALTER TABLE `BrandOperators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BrandURLs`
--

DROP TABLE IF EXISTS `BrandURLs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BrandURLs` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `klearTheme` varchar(200) DEFAULT '',
  `urlType` varchar(25) NOT NULL COMMENT '[enum:god|brand|admin|user]',
  `name` varchar(200) DEFAULT '',
  `logoFileSize` int(11) unsigned DEFAULT NULL COMMENT '[FSO]',
  `logoMimeType` varchar(80) DEFAULT NULL,
  `logoBaseName` varchar(255) DEFAULT NULL,
  `userTheme` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `BrandURLs_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BrandURLs`
--

LOCK TABLES `BrandURLs` WRITE;
/*!40000 ALTER TABLE `BrandURLs` DISABLE KEYS */;
INSERT INTO `BrandURLs` VALUES (3,1,'http://example.com','blitzer','god','Oasis SuperUser portal',NULL,NULL,NULL,'default');
/*!40000 ALTER TABLE `BrandURLs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Brands`
--

DROP TABLE IF EXISTS `Brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `nif` varchar(25) NOT NULL,
  `extensionBlackListRegExp` varchar(255) DEFAULT '',
  `domain` varchar(255) NOT NULL,
  `defaultTimezoneId` mediumint(8) unsigned NOT NULL,
  `logoFileSize` int(11) unsigned DEFAULT NULL COMMENT '[FSO]',
  `logoMimeType` varchar(80) DEFAULT NULL,
  `logoBaseName` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) NOT NULL,
  `postalCode` varchar(10) NOT NULL,
  `town` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `registryData` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `domain` (`domain`),
  KEY `defaultTimezoneId` (`defaultTimezoneId`),
  CONSTRAINT `Brands_ibfk_1` FOREIGN KEY (`defaultTimezoneId`) REFERENCES `Timezones` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brands`
--

LOCK TABLES `Brands` WRITE;
/*!40000 ALTER TABLE `Brands` DISABLE KEYS */;
INSERT INTO `Brands` VALUES (1,'Demo Brand','0123456789ABCDEF','','demobrand.ivozprovider.com',190,NULL,NULL,NULL,'Isle of Man, heaven of heterosexual women','40901','Man Town','Man Province','Isle of Man','More required inputs');
/*!40000 ALTER TABLE `Brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BrandsRelLanguages`
--

DROP TABLE IF EXISTS `BrandsRelLanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BrandsRelLanguages` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `brandId` int(10) unsigned NOT NULL,
  `languageId` binary(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brandId` (`brandId`),
  KEY `languageId` (`languageId`),
  CONSTRAINT `BrandsRelLanguages_ibfk_3` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `BrandsRelLanguages_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `Languages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BrandsRelLanguages`
--

LOCK TABLES `BrandsRelLanguages` WRITE;
/*!40000 ALTER TABLE `BrandsRelLanguages` DISABLE KEYS */;
INSERT INTO `BrandsRelLanguages` VALUES ('570390a4-07f8-49c9-9918-3c2b0a0a00c0',1,'57038fb4-068c-424d-aadf-3c270a0a00c0'),('570390a4-7b10-453d-ba34-3c2b0a0a00c0',1,'57038fc5-d2d0-402d-af60-3c2a0a0a00c0');
/*!40000 ALTER TABLE `BrandsRelLanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `CDRs`
--

DROP TABLE IF EXISTS `CDRs`;
/*!50001 DROP VIEW IF EXISTS `CDRs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CDRs` (
  `proxy` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `calldate` tinyint NOT NULL,
  `start_time` tinyint NOT NULL,
  `end_time` tinyint NOT NULL,
  `duration` tinyint NOT NULL,
  `caller` tinyint NOT NULL,
  `callee` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `subtype` tinyint NOT NULL,
  `companyId` tinyint NOT NULL,
  `companyName` tinyint NOT NULL,
  `asIden` tinyint NOT NULL,
  `asAddress` tinyint NOT NULL,
  `callid` tinyint NOT NULL,
  `xcallid` tinyint NOT NULL,
  `parsed` tinyint NOT NULL,
  `diversion` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Calendars`
--

DROP TABLE IF EXISTS `Calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Calendars` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `Calendars_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calendars`
--

LOCK TABLES `Calendars` WRITE;
/*!40000 ALTER TABLE `Calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `Calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CallACL`
--

DROP TABLE IF EXISTS `CallACL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CallACL` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `defaultPolicy` varchar(10) NOT NULL COMMENT '[enum:allow|deny]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyId_2` (`companyId`,`name`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `CallAcl_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CallACL`
--

LOCK TABLES `CallACL` WRITE;
/*!40000 ALTER TABLE `CallACL` DISABLE KEYS */;
/*!40000 ALTER TABLE `CallACL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CallACLPatterns`
--

DROP TABLE IF EXISTS `CallACLPatterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CallACLPatterns` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `regExp` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `CallACLPatterns_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CallACLPatterns`
--

LOCK TABLES `CallACLPatterns` WRITE;
/*!40000 ALTER TABLE `CallACLPatterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `CallACLPatterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CallACLRelPatterns`
--

DROP TABLE IF EXISTS `CallACLRelPatterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CallACLRelPatterns` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `CallACLId` binary(36) NOT NULL,
  `CallACLPatternId` binary(36) NOT NULL,
  `priority` smallint(6) NOT NULL,
  `policy` varchar(25) NOT NULL COMMENT '[enum:allow|deny]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_callACLId_priority` (`CallACLId`,`priority`),
  KEY `CallACLId` (`CallACLId`),
  KEY `CallACLPatternId` (`CallACLPatternId`),
  CONSTRAINT `CallACLRelPatterns_ibfk_1` FOREIGN KEY (`CallACLId`) REFERENCES `CallACL` (`id`) ON DELETE CASCADE,
  CONSTRAINT `CallACLRelPatterns_ibfk_2` FOREIGN KEY (`CallACLPatternId`) REFERENCES `CallACLPatterns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CallACLRelPatterns`
--

LOCK TABLES `CallACLRelPatterns` WRITE;
/*!40000 ALTER TABLE `CallACLRelPatterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `CallACLRelPatterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CallForwardSettings`
--

DROP TABLE IF EXISTS `CallForwardSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CallForwardSettings` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `userId` binary(36) NOT NULL,
  `callTypeFilter` varchar(25) NOT NULL COMMENT '[enum:internal|external|both]',
  `callForwardType` varchar(25) NOT NULL COMMENT '[enum:inconditional|noAnswer|busy|userNotRegistered]',
  `targetType` varchar(25) NOT NULL COMMENT '[enum:number|extension|voicemail]',
  `numberValue` varchar(25) DEFAULT NULL,
  `extensionId` binary(36) DEFAULT NULL,
  `voiceMailUserId` binary(36) DEFAULT NULL,
  `noAnswerTimeout` smallint(4) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `extensionId` (`extensionId`),
  KEY `voiceMailUserId` (`voiceMailUserId`),
  CONSTRAINT `CallForwardSettings_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `CallForwardSettings_ibfk_2` FOREIGN KEY (`extensionId`) REFERENCES `Extensions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `CallForwardSettings_ibfk_3` FOREIGN KEY (`voiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CallForwardSettings`
--

LOCK TABLES `CallForwardSettings` WRITE;
/*!40000 ALTER TABLE `CallForwardSettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `CallForwardSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Companies`
--

DROP TABLE IF EXISTS `Companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Companies` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `brandId` int(10) unsigned NOT NULL,
  `name` varchar(80) NOT NULL,
  `nif` varchar(25) NOT NULL,
  `defaultTimezoneId` mediumint(8) unsigned NOT NULL,
  `applicationServerId` binary(36) DEFAULT NULL,
  `transformationRulesetGroupsId` binary(36) DEFAULT NULL,
  `externalMaxCalls` int(10) unsigned NOT NULL DEFAULT '0',
  `postalAddress` varchar(255) NOT NULL,
  `postalCode` varchar(10) NOT NULL,
  `town` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `invoiceLanguageId` binary(36) DEFAULT NULL,
  `outbound_prefix` varchar(255) DEFAULT NULL,
  `countryId` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brandId` (`brandId`),
  KEY `defaultTimezoneId` (`defaultTimezoneId`),
  KEY `applicationServerId` (`applicationServerId`),
  KEY `Companies_ibfk_7` (`transformationRulesetGroupsId`),
  KEY `invoiceLanguageId` (`invoiceLanguageId`),
  KEY `countryId` (`countryId`),
  CONSTRAINT `Companies_ibfk_9` FOREIGN KEY (`countryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Companies_ibfk_2` FOREIGN KEY (`defaultTimezoneId`) REFERENCES `Timezones` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Companies_ibfk_4` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Companies_ibfk_5` FOREIGN KEY (`applicationServerId`) REFERENCES `ApplicationServers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Companies_ibfk_7` FOREIGN KEY (`transformationRulesetGroupsId`) REFERENCES `TransformationRulesetGroupsUsers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Companies_ibfk_8` FOREIGN KEY (`invoiceLanguageId`) REFERENCES `Languages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Companies`
--

LOCK TABLES `Companies` WRITE;
/*!40000 ALTER TABLE `Companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `CompanyAdmins`
--

DROP TABLE IF EXISTS `CompanyAdmins`;
/*!50001 DROP VIEW IF EXISTS `CompanyAdmins`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CompanyAdmins` (
  `id` tinyint NOT NULL,
  `companyId` tinyint NOT NULL,
  `timezoneId` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `pass` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `active` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Countries` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL COMMENT '[ml]',
  `name_en` varchar(100) DEFAULT NULL,
  `name_es` varchar(100) DEFAULT NULL,
  `calling_code` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `languageCode` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
INSERT INTO `Countries` VALUES (1,'AF',NULL,'Afghanistan','Afghanistan',93),(2,'AL',NULL,'Albania','Albania',355),(3,'DE',NULL,'Germany','Germany',49),(4,'AD',NULL,'Andorra','Andorra',376),(5,'AO',NULL,'Angola','Angola',244),(6,'AI',NULL,'Anguilla','Anguilla',1264),(7,'AQ',NULL,'Antarctica','Antarctica',672),(8,'AG',NULL,'Antigua and Barbuda','Antigua and Barbuda',1268),(9,'SA',NULL,'Saudi Arabia','Saudi Arabia',966),(10,'DZ',NULL,'Algeria','Algeria',213),(11,'AR',NULL,'Argentina','Argentina',54),(12,'AM',NULL,'Armenia','Armenia',374),(13,'AW',NULL,'Aruba','Aruba',297),(14,'AU',NULL,'Australia','Australia',61),(15,'AT',NULL,'Austria','Austria',43),(16,'AZ',NULL,'Azerbaijan','Azerbaijan',994),(17,'BS',NULL,'Bahamas','Bahamas',1242),(18,'BH',NULL,'Bahrain','Bahrain',973),(19,'BD',NULL,'Bangladesh','Bangladesh',880),(20,'BB',NULL,'Barbados','Barbados',1246),(21,'BE',NULL,'Belgium','Belgium',32),(22,'BZ',NULL,'Belize','Belize',501),(23,'BJ',NULL,'Benin','Benin',229),(24,'BM',NULL,'Bermuda','Bermuda',1441),(25,'BY',NULL,'Belarus','Belarus',375),(26,'BO',NULL,'Bolivia','Bolivia',591),(27,'BA',NULL,'Bosnia and Herzegovina','Bosnia and Herzegovina',387),(28,'BW',NULL,'Botswana','Botswana',267),(29,'BR',NULL,'Brazil','Brazil',55),(30,'BN',NULL,'Brunei Darussalam','Brunei Darussalam',673),(31,'BG',NULL,'Bulgaria','Bulgaria',359),(32,'BF',NULL,'Burkina Faso','Burkina Faso',226),(33,'BI',NULL,'Burundi','Burundi',257),(34,'BT',NULL,'Bhutan','Bhutan',975),(35,'CV',NULL,'Cape Verde','Cape Verde',238),(36,'KH',NULL,'Cambodia','Cambodia',855),(37,'CM',NULL,'Cameroon','Cameroon',237),(38,'CA',NULL,'Canada','Canada',1),(39,'TD',NULL,'Chad','Chad',235),(40,'CL',NULL,'Chile','Chile',56),(41,'CN',NULL,'China','China',86),(42,'CY',NULL,'Cyprus','Cyprus',357),(43,'VA',NULL,'Holy See (Vatican City State)','Holy See (Vatican City State)',379),(44,'CO',NULL,'Colombia','Colombia',57),(45,'KM',NULL,'Comoros','Comoros',269),(46,'CG',NULL,'Congo','Congo',242),(47,'KP',NULL,'Korea, Democratic Peoples Republic of','Korea, Democratic Peoples Republic of',850),(48,'KR',NULL,'Korea, Republic of','Korea, Republic of',82),(49,'CI',NULL,'Ivory Coast','Ivory Coast',225),(50,'CR',NULL,'Costa Rica','Costa Rica',506),(51,'HR',NULL,'Croatia','Croatia',385),(52,'CU',NULL,'Cuba','Cuba',53),(53,'DK',NULL,'Denmark','Denmark',45),(54,'DM',NULL,'Dominica','Dominica',1767),(55,'EC',NULL,'Ecuador','Ecuador',593),(56,'EG',NULL,'Egypt','Egypt',20),(57,'SV',NULL,'El Salvador','El Salvador',503),(58,'AE',NULL,'United Arab Emirates','United Arab Emirates',971),(59,'ER',NULL,'Eritrea','Eritrea',291),(60,'SK',NULL,'Slovakia','Slovakia',421),(61,'SI',NULL,'Slovenia','Slovenia',386),(62,'ES',NULL,'Spain','Spain',34),(63,'US',NULL,'United States','United States',1),(64,'EE',NULL,'Estonia','Estonia',372),(65,'ET',NULL,'Ethiopia','Ethiopia',251),(66,'PH',NULL,'Philippines','Philippines',63),(67,'FI',NULL,'Finland','Finland',358),(68,'FJ',NULL,'Fiji','Fiji',679),(69,'FR',NULL,'France','France',33),(70,'GA',NULL,'Gabon','Gabon',241),(71,'GM',NULL,'Gambia','Gambia',220),(72,'GE',NULL,'Georgia','Georgia',995),(73,'GH',NULL,'Ghana','Ghana',233),(74,'GI',NULL,'Gibraltar','Gibraltar',350),(75,'GD',NULL,'Grenada','Grenada',1473),(76,'GR',NULL,'Greece','Greece',30),(77,'GL',NULL,'Greenland','Greenland',299),(78,'GP',NULL,'Guadeloupe','Guadeloupe',590),(79,'GU',NULL,'Guam','Guam',1671),(80,'GT',NULL,'Guatemala','Guatemala',502),(81,'GF',NULL,'French Guiana','French Guiana',594),(82,'GG',NULL,'Guernsey','Guernsey',44),(83,'GN',NULL,'Guinea','Guinea',224),(84,'GQ',NULL,'Equatorial Guinea','Equatorial Guinea',240),(85,'GW',NULL,'GuineaBissau','GuineaBissau',245),(86,'GY',NULL,'Guyana','Guyana',592),(87,'HT',NULL,'Haiti','Haiti',509),(88,'HN',NULL,'Honduras','Honduras',504),(89,'HU',NULL,'Hungary','Hungary',36),(90,'IN',NULL,'India','India',91),(91,'ID',NULL,'Indonesia','Indonesia',62),(92,'IR',NULL,'Iran, Islamic Republic of','Iran, Islamic Republic of',98),(93,'IQ',NULL,'Iraq','Iraq',964),(94,'IE',NULL,'Ireland','Ireland',353),(95,'BV',NULL,'Bouvet Island','Bouvet Island',47),(96,'CX',NULL,'Christmas Island','Christmas Island',61),(97,'IM',NULL,'Isle of Man','Isle of Man',44),(98,'NU',NULL,'Niue','Niue',683),(99,'NF',NULL,'Norfolk Island','Norfolk Island',672),(100,'IS',NULL,'Iceland','Iceland',354),(101,'AX',NULL,'Aland Islands','Aland Islands',358),(102,'KY',NULL,'Cayman Islands','Cayman Islands',1345),(103,'CC',NULL,'Cocos (Keeling) Islands','Cocos (Keeling) Islands',61),(104,'CK',NULL,'Cook Islands','Cook Islands',682),(105,'FO',NULL,'Faroe Islands','Faroe Islands',298),(106,'GS',NULL,'South Georgia and the South Sandwich Islands','South Georgia and the South Sandwich Islands',500),(107,'HM',NULL,'Heard Island and McDonald Mcdonald Islands','Heard Island and McDonald Mcdonald Islands',672),(108,'FK',NULL,'Falkland Islands (Malvinas)','Falkland Islands (Malvinas)',500),(109,'MP',NULL,'Northern Mariana Islands','Northern Mariana Islands',1670),(110,'MH',NULL,'Marshall Islands','Marshall Islands',692),(111,'UM',NULL,'United States Minor Outlying Islands','United States Minor Outlying Islands',1),(112,'PN',NULL,'Pitcairn','Pitcairn',870),(113,'SB',NULL,'Solomon Islands','Solomon Islands',677),(114,'TC',NULL,'Turks and Caicos Islands','Turks and Caicos Islands',1649),(115,'VG',NULL,'British Virgin Islands','British Virgin Islands',1284),(116,'VI',NULL,'US Virgin Islands','US Virgin Islands',1340),(117,'IL',NULL,'Israel','Israel',972),(118,'IT',NULL,'Italy','Italy',39),(119,'JM',NULL,'Jamaica','Jamaica',1876),(120,'JP',NULL,'Japan','Japan',81),(121,'JE',NULL,'Jersey','Jersey',44),(122,'JO',NULL,'Jordan','Jordan',962),(123,'KZ',NULL,'Kazakhstan','Kazakhstan',7),(124,'KE',NULL,'Kenya','Kenya',254),(125,'KG',NULL,'Kyrgyzstan','Kyrgyzstan',996),(126,'KI',NULL,'Kiribati','Kiribati',686),(127,'KW',NULL,'Kuwait','Kuwait',965),(128,'LA',NULL,'Lao Peoples Democratic Republic','Lao Peoples Democratic Republic',856),(129,'LS',NULL,'Lesotho','Lesotho',266),(130,'LV',NULL,'Latvia','Latvia',371),(131,'LB',NULL,'Lebanon','Lebanon',961),(132,'LR',NULL,'Liberia','Liberia',231),(133,'LY',NULL,'Libya','Libya',218),(134,'LI',NULL,'Liechtenstein','Liechtenstein',423),(135,'LT',NULL,'Lithuania','Lithuania',370),(136,'LU',NULL,'Luxembourg','Luxembourg',352),(137,'MK',NULL,'Macedonia, the Former Yugoslav Republic of','Macedonia, the Former Yugoslav Republic of',389),(138,'MG',NULL,'Madagascar','Madagascar',261),(139,'MY',NULL,'Malaysia','Malaysia',60),(140,'MW',NULL,'Malawi','Malawi',265),(141,'MV',NULL,'Maldives','Maldives',960),(142,'ML',NULL,'Mali','Mali',223),(143,'MT',NULL,'Malta','Malta',356),(144,'MA',NULL,'Morocco','Morocco',212),(145,'MQ',NULL,'Martinique','Martinique',596),(146,'MU',NULL,'Mauritius','Mauritius',230),(147,'MR',NULL,'Mauritania','Mauritania',222),(148,'YT',NULL,'Mayotte','Mayotte',262),(149,'MX',NULL,'Mexico','Mexico',52),(150,'FM',NULL,'Micronesia, Federated States of','Micronesia, Federated States of',691),(151,'MD',NULL,'Moldova, Republic of','Moldova, Republic of',373),(152,'MC',NULL,'Monaco','Monaco',377),(153,'MN',NULL,'Mongolia','Mongolia',976),(154,'ME',NULL,'Montenegro','Montenegro',382),(155,'MS',NULL,'Montserrat','Montserrat',1664),(156,'MZ',NULL,'Mozambique','Mozambique',258),(157,'MM',NULL,'Myanmar','Myanmar',95),(158,'NA',NULL,'Namibia','Namibia',264),(159,'NR',NULL,'Nauru','Nauru',674),(160,'NP',NULL,'Nepal','Nepal',977),(161,'NI',NULL,'Nicaragua','Nicaragua',505),(162,'NE',NULL,'Niger','Niger',227),(163,'NG',NULL,'Nigeria','Nigeria',234),(164,'NO',NULL,'Norway','Norway',47),(165,'NC',NULL,'New Caledonia','New Caledonia',687),(166,'NZ',NULL,'New Zealand','New Zealand',64),(167,'OM',NULL,'Oman','Oman',968),(168,'NL',NULL,'Netherlands','Netherlands',31),(169,'PK',NULL,'Pakistan','Pakistan',92),(170,'PW',NULL,'Palau','Palau',680),(171,'PA',NULL,'Panama','Panama',507),(172,'PG',NULL,'Papua New Guinea','Papua New Guinea',675),(173,'PY',NULL,'Paraguay','Paraguay',595),(174,'PE',NULL,'Peru','Peru',51),(175,'PF',NULL,'French Polynesia','French Polynesia',689),(176,'PL',NULL,'Poland','Poland',48),(177,'PT',NULL,'Portugal','Portugal',351),(178,'PR',NULL,'Puerto Rico','Puerto Rico',1),(179,'QA',NULL,'Qatar','Qatar',974),(180,'HK',NULL,'Hong Kong','Hong Kong',852),(181,'MO',NULL,'Macao','Macao',853),(182,'GB',NULL,'United Kingdom','United Kingdom',44),(183,'CF',NULL,'Central African Republic','Central African Republic',236),(184,'CZ',NULL,'Czech Republic','Czech Republic',420),(185,'CD',NULL,'Democratic Republic of the Congo','Democratic Republic of the Congo',243),(186,'DO',NULL,'Dominican Republic','Dominican Republic',1809),(187,'RE',NULL,'Reunion','Reunion',262),(188,'RW',NULL,'Rwanda','Rwanda',250),(189,'RO',NULL,'Romania','Romania',40),(190,'RU',NULL,'Russian Federation','Russian Federation',7),(191,'EH',NULL,'Western Sahara','Western Sahara',212),(192,'WS',NULL,'Samoa','Samoa',685),(193,'AS',NULL,'American Samoa','American Samoa',1684),(194,'BL',NULL,'Saint Barthalemy','Saint Barthalemy',590),(195,'KN',NULL,'Saint Kitts and Nevis','Saint Kitts and Nevis',1869),(196,'SM',NULL,'San Marino','San Marino',378),(197,'MF',NULL,'Saint Martin (French part)','Saint Martin (French part)',590),(198,'PM',NULL,'Saint Pierre and Miquelon','Saint Pierre and Miquelon',508),(199,'VC',NULL,'Saint Vincent and the Grenadines','Saint Vincent and the Grenadines',1784),(200,'SH',NULL,'Saint Helena','Saint Helena',290),(201,'LC',NULL,'Saint Lucia','Saint Lucia',1758),(202,'ST',NULL,'Sao Tome and Principe','Sao Tome and Principe',239),(203,'SN',NULL,'Senegal','Senegal',221),(204,'RS',NULL,'Serbia','Serbia',381),(205,'SC',NULL,'Seychelles','Seychelles',248),(206,'SL',NULL,'Sierra Leone','Sierra Leone',232),(207,'SG',NULL,'Singapore','Singapore',65),(208,'SY',NULL,'Syrian Arab Republic','Syrian Arab Republic',963),(209,'SO',NULL,'Somalia','Somalia',252),(210,'LK',NULL,'Sri Lanka','Sri Lanka',94),(211,'SZ',NULL,'Swaziland','Swaziland',268),(212,'ZA',NULL,'South Africa','South Africa',27),(213,'SD',NULL,'Sudan','Sudan',249),(214,'SE',NULL,'Sweden','Sweden',46),(215,'CH',NULL,'Switzerland','Switzerland',41),(216,'SR',NULL,'Suriname','Suriname',597),(217,'SJ',NULL,'Svalbard and Jan Mayen','Svalbard and Jan Mayen',47),(218,'TH',NULL,'Thailand','Thailand',66),(219,'TW',NULL,'Taiwan, Province of China','Taiwan, Province of China',886),(220,'TZ',NULL,'United Republic of Tanzania','United Republic of Tanzania',255),(221,'TJ',NULL,'Tajikistan','Tajikistan',992),(222,'IO',NULL,'British Indian Ocean Territory','British Indian Ocean Territory',246),(223,'TF',NULL,'French Southern Territories','French Southern Territories',262),(224,'PS',NULL,'Palestine, State of','Palestine, State of',970),(225,'TL',NULL,'TimorLeste','TimorLeste',670),(226,'TG',NULL,'Togo','Togo',228),(227,'TK',NULL,'Tokelau','Tokelau',690),(228,'TO',NULL,'Tonga','Tonga',676),(229,'TT',NULL,'Trinidad and Tobago','Trinidad and Tobago',1868),(230,'TN',NULL,'Tunisia','Tunisia',216),(231,'TM',NULL,'Turkmenistan','Turkmenistan',993),(232,'TR',NULL,'Turkey','Turkey',90),(233,'TV',NULL,'Tuvalu','Tuvalu',688),(234,'UA',NULL,'Ukraine','Ukraine',380),(235,'UG',NULL,'Uganda','Uganda',256),(236,'UY',NULL,'Uruguay','Uruguay',598),(237,'UZ',NULL,'Uzbekistan','Uzbekistan',998),(238,'VU',NULL,'Vanuatu','Vanuatu',678),(239,'VE',NULL,'Venezuela','Venezuela',58),(240,'VN',NULL,'Viet Nam','Viet Nam',84),(241,'WF',NULL,'Wallis and Futuna','Wallis and Futuna',681),(242,'YE',NULL,'Yemen','Yemen',967),(243,'DJ',NULL,'Djibouti','Djibouti',253),(244,'ZM',NULL,'Zambia','Zambia',260),(245,'ZW',NULL,'Zimbabwe','Zimbabwe',263),(246,'BQ',NULL,'Bonaire','Bonaire',599),(247,'CW',NULL,'CuraÃ§ao','CuraÃ§ao',599),(248,'SX',NULL,'Sint Maarten (Dutch part)','Sint Maarten (Dutch part)',1721),(249,'SS',NULL,'South Sudan','South Sudan',211),(311,'DO-II',NULL,'Dominican Republic','Dominican Republic',1829),(312,'DO-III',NULL,'Dominican Republic','Dominican Republic',1849);
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DDIs`
--

DROP TABLE IF EXISTS `DDIs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DDIs` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `DDI` varchar(25) NOT NULL,
  `externalCallFilterId` binary(36) DEFAULT NULL,
  `routeType` varchar(25) NOT NULL COMMENT '[enum:user|IVRCommon|IVRCustom|huntGroup|fax]',
  `userId` binary(36) DEFAULT NULL,
  `IVRCommonId` binary(36) DEFAULT NULL,
  `IVRCustomId` binary(36) DEFAULT NULL,
  `huntGroupId` binary(36) DEFAULT NULL,
  `faxId` binary(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `DDI` (`DDI`),
  KEY `companyId` (`companyId`),
  KEY `externalCallFilterId` (`externalCallFilterId`),
  KEY `userId` (`userId`),
  KEY `IVRCommonId` (`IVRCommonId`),
  KEY `IVRCustomId` (`IVRCustomId`),
  KEY `huntGroupId` (`huntGroupId`),
  KEY `faxId` (`faxId`),
  CONSTRAINT `DDIs_ibfk_7` FOREIGN KEY (`faxId`) REFERENCES `Faxes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `DDIs_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `DDIs_ibfk_2` FOREIGN KEY (`externalCallFilterId`) REFERENCES `ExternalCallFilters` (`id`) ON DELETE SET NULL,
  CONSTRAINT `DDIs_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `DDIs_ibfk_4` FOREIGN KEY (`IVRCommonId`) REFERENCES `IVRCommon` (`id`) ON DELETE SET NULL,
  CONSTRAINT `DDIs_ibfk_5` FOREIGN KEY (`IVRCustomId`) REFERENCES `IVRCustom` (`id`) ON DELETE SET NULL,
  CONSTRAINT `DDIs_ibfk_6` FOREIGN KEY (`huntGroupId`) REFERENCES `HuntGroups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DDIs`
--

LOCK TABLES `DDIs` WRITE;
/*!40000 ALTER TABLE `DDIs` DISABLE KEYS */;
/*!40000 ALTER TABLE `DDIs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Extensions`
--

DROP TABLE IF EXISTS `Extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Extensions` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `number` varchar(10) NOT NULL,
  `routeType` varchar(25) NOT NULL COMMENT '[enum:user|IVRCommon|IVRCustom|huntGroup]',
  `IVRCommonId` binary(36) DEFAULT NULL,
  `IVRCustomId` binary(36) DEFAULT NULL,
  `huntGroupId` binary(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyId_2` (`companyId`,`number`),
  KEY `companyId` (`companyId`),
  KEY `IVRCommonId` (`IVRCommonId`),
  KEY `IVRCustomId` (`IVRCustomId`),
  KEY `huntGroupId` (`huntGroupId`),
  CONSTRAINT `Extensions_ibfk_4` FOREIGN KEY (`huntGroupId`) REFERENCES `HuntGroups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Extensions_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Extensions_ibfk_2` FOREIGN KEY (`IVRCommonId`) REFERENCES `IVRCommon` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Extensions_ibfk_3` FOREIGN KEY (`IVRCustomId`) REFERENCES `IVRCustom` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Extensions`
--

LOCK TABLES `Extensions` WRITE;
/*!40000 ALTER TABLE `Extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExternalCallFilterRelCalendars`
--

DROP TABLE IF EXISTS `ExternalCallFilterRelCalendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalCallFilterRelCalendars` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `filterId` binary(36) NOT NULL,
  `calendarId` binary(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filterId` (`filterId`),
  KEY `calendarId` (`calendarId`),
  CONSTRAINT `ExternalCallFilterRelCalendars_ibfk_1` FOREIGN KEY (`filterId`) REFERENCES `ExternalCallFilters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ExternalCallFilterRelCalendars_ibfk_2` FOREIGN KEY (`calendarId`) REFERENCES `Calendars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExternalCallFilterRelCalendars`
--

LOCK TABLES `ExternalCallFilterRelCalendars` WRITE;
/*!40000 ALTER TABLE `ExternalCallFilterRelCalendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExternalCallFilterRelCalendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExternalCallFilterRelSchedules`
--

DROP TABLE IF EXISTS `ExternalCallFilterRelSchedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalCallFilterRelSchedules` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `filterId` binary(36) NOT NULL,
  `scheduleId` binary(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filterId` (`filterId`),
  KEY `scheduleId` (`scheduleId`),
  CONSTRAINT `ExternalCallFilterRelSchedules_ibfk_1` FOREIGN KEY (`filterId`) REFERENCES `ExternalCallFilters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ExternalCallFilterRelSchedules_ibfk_2` FOREIGN KEY (`scheduleId`) REFERENCES `Schedules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExternalCallFilterRelSchedules`
--

LOCK TABLES `ExternalCallFilterRelSchedules` WRITE;
/*!40000 ALTER TABLE `ExternalCallFilterRelSchedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExternalCallFilterRelSchedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExternalCallFilters`
--

DROP TABLE IF EXISTS `ExternalCallFilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalCallFilters` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `welcomeLocutionId` binary(36) DEFAULT NULL,
  `holidayLocutionId` binary(36) DEFAULT NULL,
  `outOfScheduleLocutionId` binary(36) DEFAULT NULL,
  `holidayTargetType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `holidayNumberValue` varchar(25) DEFAULT NULL,
  `holidayExtensionId` binary(36) DEFAULT NULL,
  `holidayVoiceMailUserId` binary(36) DEFAULT NULL,
  `outOfScheduleTargetType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `outOfScheduleNumberValue` varchar(25) DEFAULT NULL,
  `outOfScheduleExtensionId` binary(36) DEFAULT NULL,
  `outOfScheduleVoiceMailUserId` binary(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  KEY `welcomeLocutionId` (`welcomeLocutionId`),
  KEY `holidayLocutionId` (`holidayLocutionId`),
  KEY `outOfScheduleLocutionId` (`outOfScheduleLocutionId`),
  KEY `holidayExtensionId` (`holidayExtensionId`),
  KEY `outOfScheduleExtensionId` (`outOfScheduleExtensionId`),
  KEY `holidayVoiceMailUserId` (`holidayVoiceMailUserId`),
  KEY `outOfScheduleVoiceMailUserId` (`outOfScheduleVoiceMailUserId`),
  CONSTRAINT `ExternalCallFilters_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ExternalCallFilters_ibfk_2` FOREIGN KEY (`welcomeLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ExternalCallFilters_ibfk_3` FOREIGN KEY (`holidayLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ExternalCallFilters_ibfk_4` FOREIGN KEY (`outOfScheduleLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ExternalCallFilters_ibfk_5` FOREIGN KEY (`holidayExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ExternalCallFilters_ibfk_6` FOREIGN KEY (`outOfScheduleExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ExternalCallFilters_ibfk_7` FOREIGN KEY (`holidayVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ExternalCallFilters_ibfk_8` FOREIGN KEY (`outOfScheduleVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExternalCallFilters`
--

LOCK TABLES `ExternalCallFilters` WRITE;
/*!40000 ALTER TABLE `ExternalCallFilters` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExternalCallFilters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faxes`
--

DROP TABLE IF EXISTS `Faxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faxes` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sendByEmail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `outgoingDDI` binary(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FaxesUniqueCompanyfaxname` (`companyId`,`name`),
  KEY `companyId` (`companyId`),
  KEY `outgoingDDI` (`outgoingDDI`),
  CONSTRAINT `Faxes_ibfk_2` FOREIGN KEY (`outgoingDDI`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Faxes_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faxes`
--

LOCK TABLES `Faxes` WRITE;
/*!40000 ALTER TABLE `Faxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Faxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FaxesInOut`
--

DROP TABLE IF EXISTS `FaxesInOut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FaxesInOut` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `calldate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Hora de recepcion del fax',
  `faxId` binary(36) NOT NULL,
  `src` varchar(128) DEFAULT NULL,
  `dst` varchar(128) DEFAULT NULL,
  `type` varchar(20) DEFAULT 'Out' COMMENT '[enum:In|Out]',
  `pages` varchar(64) DEFAULT NULL,
  `status` enum('error','pending','inprogress','completed') DEFAULT NULL,
  `fileFileSize` int(11) unsigned DEFAULT NULL COMMENT '[FSO]',
  `fileMimeType` varchar(80) DEFAULT NULL,
  `fileBaseName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faxId` (`faxId`),
  CONSTRAINT `FaxesInOut_ibfk_2` FOREIGN KEY (`faxId`) REFERENCES `Faxes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FaxesInOut`
--

LOCK TABLES `FaxesInOut` WRITE;
/*!40000 ALTER TABLE `FaxesInOut` DISABLE KEYS */;
/*!40000 ALTER TABLE `FaxesInOut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GenericCallACLPatterns`
--

DROP TABLE IF EXISTS `GenericCallACLPatterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenericCallACLPatterns` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `brandId` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `regExp` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `GenericCallACLPatterns_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GenericCallACLPatterns`
--

LOCK TABLES `GenericCallACLPatterns` WRITE;
/*!40000 ALTER TABLE `GenericCallACLPatterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `GenericCallACLPatterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GenericMusicOnHold`
--

DROP TABLE IF EXISTS `GenericMusicOnHold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenericMusicOnHold` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `name` varchar(80) NOT NULL,
  `originalFileFileSize` int(11) unsigned DEFAULT NULL COMMENT '[FSO:keepExtension]',
  `originalFileMimeType` varchar(80) DEFAULT NULL,
  `originalFileBaseName` varchar(255) DEFAULT NULL,
  `encodedFileFileSize` int(11) unsigned DEFAULT NULL COMMENT '[FSO:keepExtension|storeInBaseFolder]',
  `encodedFileMimeType` varchar(80) DEFAULT NULL,
  `encodedFileBaseName` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL COMMENT '[enum:pending|encoding|ready|error]',
  `brandId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fGenericMusicOnHold_ibfk_1` (`brandId`),
  CONSTRAINT `fGenericMusicOnHold_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GenericMusicOnHold`
--

LOCK TABLES `GenericMusicOnHold` WRITE;
/*!40000 ALTER TABLE `GenericMusicOnHold` DISABLE KEYS */;
/*!40000 ALTER TABLE `GenericMusicOnHold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GenericServices`
--

DROP TABLE IF EXISTS `GenericServices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenericServices` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `brandId` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `GenericServices_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GenericServices`
--

LOCK TABLES `GenericServices` WRITE;
/*!40000 ALTER TABLE `GenericServices` DISABLE KEYS */;
/*!40000 ALTER TABLE `GenericServices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HolidayDates`
--

DROP TABLE IF EXISTS `HolidayDates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HolidayDates` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `calendarId` binary(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `eventDate` date NOT NULL,
  `locutionId` binary(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendarId` (`calendarId`),
  KEY `locutionId` (`locutionId`),
  CONSTRAINT `HolidayDates_ibfk_2` FOREIGN KEY (`locutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `HolidayDates_ibfk_1` FOREIGN KEY (`calendarId`) REFERENCES `Calendars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HolidayDates`
--

LOCK TABLES `HolidayDates` WRITE;
/*!40000 ALTER TABLE `HolidayDates` DISABLE KEYS */;
/*!40000 ALTER TABLE `HolidayDates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HuntGroupCallForwardSettings`
--

DROP TABLE IF EXISTS `HuntGroupCallForwardSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HuntGroupCallForwardSettings` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `huntGroupId` binary(36) NOT NULL,
  `callTypeFilter` varchar(25) DEFAULT NULL COMMENT '[enum:internal|external|both]',
  `callTargetType` varchar(25) NOT NULL COMMENT '[enum:number|extension|voicemail]',
  `callNumberValue` varchar(25) DEFAULT NULL,
  `callExtensionId` binary(36) DEFAULT NULL,
  `callVoiceMailUserId` binary(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `huntGroupId` (`huntGroupId`),
  KEY `callExtensionId` (`callExtensionId`),
  KEY `callVoiceMailUserId` (`callVoiceMailUserId`),
  CONSTRAINT `HuntGroupCallForwardSettings_ibfk_1` FOREIGN KEY (`huntGroupId`) REFERENCES `HuntGroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HuntGroupCallForwardSettings_ibfk_2` FOREIGN KEY (`callExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HuntGroupCallForwardSettings_ibfk_3` FOREIGN KEY (`callVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HuntGroupCallForwardSettings`
--

LOCK TABLES `HuntGroupCallForwardSettings` WRITE;
/*!40000 ALTER TABLE `HuntGroupCallForwardSettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `HuntGroupCallForwardSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HuntGroups`
--

DROP TABLE IF EXISTS `HuntGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HuntGroups` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `companyId` binary(36) NOT NULL,
  `strategy` varchar(25) NOT NULL COMMENT '[enum:ringAll|linear|roundRobin|random]',
  `ringAllTimeout` smallint(6) NOT NULL,
  `nextUserPosition` smallint(4) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `HuntGroups_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HuntGroups`
--

LOCK TABLES `HuntGroups` WRITE;
/*!40000 ALTER TABLE `HuntGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `HuntGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HuntGroupsRelUsers`
--

DROP TABLE IF EXISTS `HuntGroupsRelUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HuntGroupsRelUsers` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `huntGroupId` binary(36) NOT NULL,
  `userId` binary(36) NOT NULL,
  `timeoutTime` smallint(6) NOT NULL,
  `priority` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `huntGroupId` (`huntGroupId`),
  KEY `userId` (`userId`),
  CONSTRAINT `HuntGroupsRelUsers_ibfk_1` FOREIGN KEY (`huntGroupId`) REFERENCES `HuntGroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `HuntGroupsRelUsers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HuntGroupsRelUsers`
--

LOCK TABLES `HuntGroupsRelUsers` WRITE;
/*!40000 ALTER TABLE `HuntGroupsRelUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `HuntGroupsRelUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IVRCommon`
--

DROP TABLE IF EXISTS `IVRCommon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IVRCommon` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `blackListRegExp` varchar(255) DEFAULT NULL,
  `welcomeLocutionId` binary(36) DEFAULT NULL,
  `noAnswerLocutionId` binary(36) DEFAULT NULL,
  `errorLocutionId` binary(36) DEFAULT NULL,
  `successLocutionId` binary(36) DEFAULT NULL,
  `timeout` smallint(5) unsigned NOT NULL,
  `noAnswerTimeout` mediumint(9) DEFAULT '10',
  `timeoutTargetType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `timeoutNumberValue` varchar(25) DEFAULT NULL,
  `timeoutExtensionId` binary(36) DEFAULT NULL,
  `timeoutVoiceMailUserId` binary(36) DEFAULT NULL,
  `errorTargetType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `errorNumberValue` varchar(25) DEFAULT NULL,
  `errorExtensionId` binary(36) DEFAULT NULL,
  `errorVoiceMailUserId` binary(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  KEY `welcomeLocutionId` (`welcomeLocutionId`),
  KEY `noAnswerLocutionId` (`noAnswerLocutionId`),
  KEY `errorLocutionId` (`errorLocutionId`),
  KEY `successLocutionId` (`successLocutionId`),
  KEY `noAnswerExtensionId` (`timeoutExtensionId`),
  KEY `errorExtensionId` (`errorExtensionId`),
  KEY `noAnswerVoiceMailUserId` (`timeoutVoiceMailUserId`),
  KEY `errorVoiceMailUserId` (`errorVoiceMailUserId`),
  CONSTRAINT `IVRCommon_ibfk_9` FOREIGN KEY (`errorVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCommon_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `IVRCommon_ibfk_2` FOREIGN KEY (`welcomeLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCommon_ibfk_3` FOREIGN KEY (`noAnswerLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCommon_ibfk_4` FOREIGN KEY (`errorLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCommon_ibfk_5` FOREIGN KEY (`successLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCommon_ibfk_6` FOREIGN KEY (`timeoutExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCommon_ibfk_7` FOREIGN KEY (`errorExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCommon_ibfk_8` FOREIGN KEY (`timeoutVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IVRCommon`
--

LOCK TABLES `IVRCommon` WRITE;
/*!40000 ALTER TABLE `IVRCommon` DISABLE KEYS */;
/*!40000 ALTER TABLE `IVRCommon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IVRCustom`
--

DROP TABLE IF EXISTS `IVRCustom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IVRCustom` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `welcomeLocutionId` binary(36) DEFAULT NULL,
  `noAnswerLocutionId` binary(36) DEFAULT NULL,
  `errorLocutionId` binary(36) DEFAULT NULL,
  `successLocutionId` binary(36) DEFAULT NULL,
  `timeout` smallint(5) unsigned NOT NULL,
  `noAnswerTimeout` mediumint(9) DEFAULT '10',
  `timeoutTargetType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `timeoutNumberValue` varchar(25) DEFAULT NULL,
  `timeoutExtensionId` binary(36) DEFAULT NULL,
  `timeoutVoiceMailUserId` binary(36) DEFAULT NULL,
  `errorTargetType` varchar(25) DEFAULT NULL COMMENT '[enum:number|extension|voicemail]',
  `errorNumberValue` varchar(25) DEFAULT NULL,
  `errorExtensionId` binary(36) DEFAULT NULL,
  `errorVoiceMailUserId` binary(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  KEY `welcomeLocutionId` (`welcomeLocutionId`),
  KEY `noAnswerLocutionId` (`noAnswerLocutionId`),
  KEY `errorLocutionId` (`errorLocutionId`),
  KEY `successLocutionId` (`successLocutionId`),
  KEY `noAnswerExtensionId` (`timeoutExtensionId`),
  KEY `errorExtensionId` (`errorExtensionId`),
  KEY `noAnswerVoiceMailUserId` (`timeoutVoiceMailUserId`),
  KEY `errorVoiceMailUserId` (`errorVoiceMailUserId`),
  CONSTRAINT `IVRCustom_ibfk_9` FOREIGN KEY (`errorVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCustom_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `IVRCustom_ibfk_2` FOREIGN KEY (`welcomeLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCustom_ibfk_3` FOREIGN KEY (`noAnswerLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCustom_ibfk_4` FOREIGN KEY (`errorLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCustom_ibfk_5` FOREIGN KEY (`successLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCustom_ibfk_6` FOREIGN KEY (`timeoutExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCustom_ibfk_7` FOREIGN KEY (`errorExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCustom_ibfk_8` FOREIGN KEY (`timeoutVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IVRCustom`
--

LOCK TABLES `IVRCustom` WRITE;
/*!40000 ALTER TABLE `IVRCustom` DISABLE KEYS */;
/*!40000 ALTER TABLE `IVRCustom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IVRCustomEntries`
--

DROP TABLE IF EXISTS `IVRCustomEntries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IVRCustomEntries` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `IVRCustomId` binary(36) NOT NULL,
  `entry` smallint(2) unsigned NOT NULL,
  `welcomeLocutionId` binary(36) DEFAULT NULL,
  `targetType` varchar(25) NOT NULL COMMENT '[enum:number|extension|voicemail]',
  `targetNumberValue` varchar(25) DEFAULT NULL,
  `targetExtensionId` binary(36) DEFAULT NULL,
  `targetVoiceMailUserId` binary(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueIVRCutomIdAndEntry` (`IVRCustomId`,`entry`),
  KEY `IVRCustomId` (`IVRCustomId`),
  KEY `welcomeLocutionId` (`welcomeLocutionId`),
  KEY `targetExtensionId` (`targetExtensionId`),
  KEY `targetVoiceMailUserId` (`targetVoiceMailUserId`),
  CONSTRAINT `IVRCustomEntries_ibfk_4` FOREIGN KEY (`targetVoiceMailUserId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCustomEntries_ibfk_1` FOREIGN KEY (`IVRCustomId`) REFERENCES `IVRCustom` (`id`) ON DELETE CASCADE,
  CONSTRAINT `IVRCustomEntries_ibfk_2` FOREIGN KEY (`welcomeLocutionId`) REFERENCES `Locutions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `IVRCustomEntries_ibfk_3` FOREIGN KEY (`targetExtensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IVRCustomEntries`
--

LOCK TABLES `IVRCustomEntries` WRITE;
/*!40000 ALTER TABLE `IVRCustomEntries` DISABLE KEYS */;
/*!40000 ALTER TABLE `IVRCustomEntries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceTemplates`
--

DROP TABLE IF EXISTS `InvoiceTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoiceTemplates` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `name` varchar(55) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `template` text,
  `brandId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `InvoiceTemplates_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceTemplates`
--

LOCK TABLES `InvoiceTemplates` WRITE;
/*!40000 ALTER TABLE `InvoiceTemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvoiceTemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices`
--

DROP TABLE IF EXISTS `Invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(300) NOT NULL,
  `inDate` datetime DEFAULT NULL,
  `outDate` datetime DEFAULT NULL,
  `total` decimal(10,3) DEFAULT NULL,
  `taxRate` decimal(10,3) DEFAULT NULL,
  `totalWithTax` decimal(10,3) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL COMMENT '[enum:waiting|processing|created|error]',
  `companyId` binary(36) NOT NULL,
  `brandId` int(10) unsigned NOT NULL,
  `pdfFileFileSize` int(11) unsigned DEFAULT NULL COMMENT '[FSO]',
  `pdfFileMimeType` varchar(80) DEFAULT NULL,
  `pdfFileBaseName` varchar(255) DEFAULT NULL,
  `invoiceTemplateId` binary(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numberLanguage` (`number`),
  KEY `brandId` (`brandId`),
  KEY `companyId` (`companyId`),
  KEY `invoiceTemplateId` (`invoiceTemplateId`),
  CONSTRAINT `Invoices_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Invoices_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Invoices_ibfk_4` FOREIGN KEY (`invoiceTemplateId`) REFERENCES `InvoiceTemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices`
--

LOCK TABLES `Invoices` WRITE;
/*!40000 ALTER TABLE `Invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Languages`
--

DROP TABLE IF EXISTS `Languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Languages` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `iden` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '[ml]',
  `name_en` varchar(100) NOT NULL DEFAULT '',
  `name_es` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `languageIden` (`iden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Languages`
--

LOCK TABLES `Languages` WRITE;
/*!40000 ALTER TABLE `Languages` DISABLE KEYS */;
INSERT INTO `Languages` VALUES ('57038fb4-068c-424d-aadf-3c270a0a00c0','es_ES','','Spanish','EspaÃ±ol'),('57038fc5-d2d0-402d-af60-3c2a0a0a00c0','en_EN','','English','InglÃ©s');
/*!40000 ALTER TABLE `Languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LcrRuleTarget`
--

DROP TABLE IF EXISTS `LcrRuleTarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LcrRuleTarget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  `gw_id` int(10) unsigned NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `weight` int(10) unsigned NOT NULL DEFAULT '1',
  `peeringContractsRelLcrRulesId` binary(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_id_gw_id_idx` (`rule_id`,`gw_id`),
  KEY `brandId` (`brandId`),
  KEY `gw_id` (`gw_id`),
  KEY `peeringContractsRelLcrRulesId` (`peeringContractsRelLcrRulesId`),
  CONSTRAINT `LcrRuleTarget_ibfk_5` FOREIGN KEY (`peeringContractsRelLcrRulesId`) REFERENCES `PeeringContractsRelLcrRules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `LcrRuleTarget_ibfk_2` FOREIGN KEY (`rule_id`) REFERENCES `LcrRules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `LcrRuleTarget_ibfk_3` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `LcrRuleTarget_ibfk_4` FOREIGN KEY (`gw_id`) REFERENCES `PeerServers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LcrRuleTarget`
--

LOCK TABLES `LcrRuleTarget` WRITE;
/*!40000 ALTER TABLE `LcrRuleTarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `LcrRuleTarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LcrRules`
--

DROP TABLE IF EXISTS `LcrRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LcrRules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brandId` int(10) unsigned NOT NULL,
  `prefix` varchar(16) DEFAULT NULL,
  `from_uri` varchar(64) DEFAULT NULL,
  `request_uri` varchar(64) DEFAULT NULL,
  `stopper` int(10) unsigned NOT NULL DEFAULT '0',
  `enabled` int(10) unsigned NOT NULL DEFAULT '1',
  `tag` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lcr_id_prefix_tagIdx` (`brandId`,`tag`),
  UNIQUE KEY `brandId` (`brandId`,`prefix`,`from_uri`,`request_uri`),
  CONSTRAINT `LcrRules_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LcrRules`
--

LOCK TABLES `LcrRules` WRITE;
/*!40000 ALTER TABLE `LcrRules` DISABLE KEYS */;
/*!40000 ALTER TABLE `LcrRules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locutions`
--

DROP TABLE IF EXISTS `Locutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Locutions` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `fileFileSize` int(11) unsigned DEFAULT NULL COMMENT '[FSO:keepExtension]',
  `fileMimeType` varchar(80) DEFAULT NULL,
  `fileBaseName` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `Locutions_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locutions`
--

LOCK TABLES `Locutions` WRITE;
/*!40000 ALTER TABLE `Locutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Locutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MainOperators`
--

DROP TABLE IF EXISTS `MainOperators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MainOperators` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `username` varchar(50) NOT NULL,
  `pass` varchar(80) NOT NULL COMMENT '[password]',
  `email` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1',
  `timezoneId` mediumint(8) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `timezoneId` (`timezoneId`),
  CONSTRAINT `MainOperators_ibfk_1` FOREIGN KEY (`timezoneId`) REFERENCES `Timezones` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MainOperators`
--

LOCK TABLES `MainOperators` WRITE;
/*!40000 ALTER TABLE `MainOperators` DISABLE KEYS */;
INSERT INTO `MainOperators` VALUES ('54f079e8-8534-46c9-ae01-1b76ac110003','admin','$2a$08$ToDhikHKFDznPJVrbPGpeONfmbr3Y9dIrvnyNgN8S7QZ918SeCF0W','admin@example.com',1,145,'admin','oasis');
/*!40000 ALTER TABLE `MainOperators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicOnHold`
--

DROP TABLE IF EXISTS `MusicOnHold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicOnHold` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `originalFileFileSize` int(11) unsigned DEFAULT NULL COMMENT '[FSO:keepExtension]',
  `originalFileMimeType` varchar(80) DEFAULT NULL,
  `originalFileBaseName` varchar(255) DEFAULT NULL,
  `encodedFileFileSize` int(11) unsigned DEFAULT NULL COMMENT '[FSO:keepExtension|storeInBaseFolder]',
  `encodedFileMimeType` varchar(80) DEFAULT NULL,
  `encodedFileBaseName` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL COMMENT '[enum:pending|encoding|ready|error]',
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `MusicOnHold_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicOnHold`
--

LOCK TABLES `MusicOnHold` WRITE;
/*!40000 ALTER TABLE `MusicOnHold` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicOnHold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PeerServers`
--

DROP TABLE IF EXISTS `PeerServers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeerServers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peeringContractId` binary(36) NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `brandId` int(10) unsigned NOT NULL,
  `hostname` varchar(64) DEFAULT NULL,
  `port` smallint(5) unsigned DEFAULT NULL,
  `params` varchar(64) DEFAULT NULL,
  `uri_scheme` tinyint(3) unsigned DEFAULT NULL,
  `transport` tinyint(3) unsigned DEFAULT NULL,
  `strip` tinyint(3) unsigned DEFAULT NULL,
  `prefix` varchar(16) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `defunct` int(10) unsigned DEFAULT NULL,
  `sendPAI` tinyint(1) unsigned DEFAULT '0',
  `sendRPID` tinyint(1) unsigned DEFAULT '0',
  `useAuthUserAsFromUser` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip_brandid` (`ip`,`brandId`),
  KEY `peeringContractId` (`peeringContractId`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `PeerServers_ibfk_1` FOREIGN KEY (`peeringContractId`) REFERENCES `PeeringContracts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `PeerServers_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PeerServers`
--

LOCK TABLES `PeerServers` WRITE;
/*!40000 ALTER TABLE `PeerServers` DISABLE KEYS */;
/*!40000 ALTER TABLE `PeerServers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PeeringContracts`
--

DROP TABLE IF EXISTS `PeeringContracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeeringContracts` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `brandId` int(10) unsigned NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL DEFAULT '',
  `transformationRulesetGroupsTrunksId` binary(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brandId` (`brandId`),
  KEY `PeeringContracts_ibfk_2` (`transformationRulesetGroupsTrunksId`),
  CONSTRAINT `PeeringContracts_ibfk_2` FOREIGN KEY (`transformationRulesetGroupsTrunksId`) REFERENCES `TransformationRulesetGroupsTrunks` (`id`) ON DELETE SET NULL,
  CONSTRAINT `PeeringContracts_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PeeringContracts`
--

LOCK TABLES `PeeringContracts` WRITE;
/*!40000 ALTER TABLE `PeeringContracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `PeeringContracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PeeringContractsRelLcrRules`
--

DROP TABLE IF EXISTS `PeeringContractsRelLcrRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeeringContractsRelLcrRules` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `brandId` int(10) unsigned NOT NULL,
  `lcrRuleId` int(10) unsigned NOT NULL,
  `peeringContractId` binary(36) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `weight` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lcrRuleId` (`lcrRuleId`,`peeringContractId`),
  KEY `PeeringContractsRelLcrRules_ibfk_2` (`peeringContractId`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `PeeringContractsRelLcrRules_ibfk_3` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `PeeringContractsRelLcrRules_ibfk_1` FOREIGN KEY (`lcrRuleId`) REFERENCES `LcrRules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `PeeringContractsRelLcrRules_ibfk_2` FOREIGN KEY (`peeringContractId`) REFERENCES `PeeringContracts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PeeringContractsRelLcrRules`
--

LOCK TABLES `PeeringContractsRelLcrRules` WRITE;
/*!40000 ALTER TABLE `PeeringContractsRelLcrRules` DISABLE KEYS */;
/*!40000 ALTER TABLE `PeeringContractsRelLcrRules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PickUpGroups`
--

DROP TABLE IF EXISTS `PickUpGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PickUpGroups` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `name` varchar(50) NOT NULL,
  `companyId` binary(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `PickUpGroups_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PickUpGroups`
--

LOCK TABLES `PickUpGroups` WRITE;
/*!40000 ALTER TABLE `PickUpGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `PickUpGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PickUpRelUsers`
--

DROP TABLE IF EXISTS `PickUpRelUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PickUpRelUsers` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `pickUpGroupId` binary(36) NOT NULL,
  `userId` binary(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pickUpGroupId` (`pickUpGroupId`),
  KEY `userId` (`userId`),
  CONSTRAINT `PickUpRelUsers_ibfk_1` FOREIGN KEY (`pickUpGroupId`) REFERENCES `PickUpGroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `PickUpRelUsers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PickUpRelUsers`
--

LOCK TABLES `PickUpRelUsers` WRITE;
/*!40000 ALTER TABLE `PickUpRelUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `PickUpRelUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PricingPlans`
--

DROP TABLE IF EXISTS `PricingPlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PricingPlans` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL COMMENT '[ml]',
  `name_en` varchar(55) NOT NULL,
  `name_es` varchar(55) NOT NULL,
  `description` varchar(55) NOT NULL COMMENT '[ml]',
  `description_en` varchar(55) NOT NULL,
  `description_es` varchar(55) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `brandId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `PricingPlans_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PricingPlans`
--

LOCK TABLES `PricingPlans` WRITE;
/*!40000 ALTER TABLE `PricingPlans` DISABLE KEYS */;
/*!40000 ALTER TABLE `PricingPlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PricingPlansRelCompanies`
--

DROP TABLE IF EXISTS `PricingPlansRelCompanies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PricingPlansRelCompanies` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pricingPlanId` mediumint(8) unsigned NOT NULL,
  `companyId` binary(36) NOT NULL,
  `validFrom` datetime DEFAULT NULL,
  `validTo` datetime DEFAULT NULL,
  `metric` mediumint(8) NOT NULL DEFAULT '10',
  `brandId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pricingPlanIdCompanyId` (`pricingPlanId`,`companyId`),
  UNIQUE KEY `metricCompanyId` (`companyId`,`metric`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `PricingPlansRelCompanies_ibfk_1` FOREIGN KEY (`pricingPlanId`) REFERENCES `PricingPlans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PricingPlansRelCompanies_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PricingPlansRelCompanies_ibfk_3` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PricingPlansRelCompanies`
--

LOCK TABLES `PricingPlansRelCompanies` WRITE;
/*!40000 ALTER TABLE `PricingPlansRelCompanies` DISABLE KEYS */;
/*!40000 ALTER TABLE `PricingPlansRelCompanies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PricingPlansRelTargetPatterns`
--

DROP TABLE IF EXISTS `PricingPlansRelTargetPatterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PricingPlansRelTargetPatterns` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `connectionCharge` decimal(10,3) NOT NULL,
  `periodTime` mediumint(8) NOT NULL,
  `perPeriodCharge` decimal(10,3) NOT NULL,
  `metric` mediumint(8) NOT NULL DEFAULT '10',
  `pricingPlanId` mediumint(8) unsigned NOT NULL,
  `targetPatternId` mediumint(8) unsigned NOT NULL,
  `brandId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pricingPlanId` (`pricingPlanId`,`targetPatternId`),
  UNIQUE KEY `metricPricingPlanId` (`pricingPlanId`,`metric`),
  KEY `targetPatternId` (`targetPatternId`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `PricingPlansRelTargetPatterns_ibfk_1` FOREIGN KEY (`pricingPlanId`) REFERENCES `PricingPlans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PricingPlansRelTargetPatterns_ibfk_2` FOREIGN KEY (`targetPatternId`) REFERENCES `TargetPatterns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PricingPlansRelTargetPatterns_ibfk_3` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PricingPlansRelTargetPatterns`
--

LOCK TABLES `PricingPlansRelTargetPatterns` WRITE;
/*!40000 ALTER TABLE `PricingPlansRelTargetPatterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `PricingPlansRelTargetPatterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedules`
--

DROP TABLE IF EXISTS `Schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schedules` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `timeIn` time NOT NULL,
  `timeout` time NOT NULL,
  `monday` tinyint(1) unsigned DEFAULT '0',
  `tuesday` tinyint(1) unsigned DEFAULT '0',
  `wednesday` tinyint(1) unsigned DEFAULT '0',
  `thursday` tinyint(1) unsigned DEFAULT '0',
  `friday` tinyint(1) unsigned DEFAULT '0',
  `saturday` tinyint(1) unsigned DEFAULT '0',
  `sunday` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `Schedules_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedules`
--

LOCK TABLES `Schedules` WRITE;
/*!40000 ALTER TABLE `Schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Services`
--

DROP TABLE IF EXISTS `Services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Services` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `Services_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Services`
--

LOCK TABLES `Services` WRITE;
/*!40000 ALTER TABLE `Services` DISABLE KEYS */;
/*!40000 ALTER TABLE `Services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TargetPatterns`
--

DROP TABLE IF EXISTS `TargetPatterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TargetPatterns` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL COMMENT '[ml]',
  `name_en` varchar(55) NOT NULL,
  `name_es` varchar(55) NOT NULL,
  `description` varchar(55) NOT NULL COMMENT '[ml]',
  `description_en` varchar(55) NOT NULL,
  `description_es` varchar(55) NOT NULL,
  `regExp` varchar(80) NOT NULL,
  `brandId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `regExpBrand` (`regExp`,`brandId`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `TargetPatterns_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TargetPatterns`
--

LOCK TABLES `TargetPatterns` WRITE;
/*!40000 ALTER TABLE `TargetPatterns` DISABLE KEYS */;
/*!40000 ALTER TABLE `TargetPatterns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TerminalManufacturers`
--

DROP TABLE IF EXISTS `TerminalManufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TerminalManufacturers` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `iden` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iden` (`iden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TerminalManufacturers`
--

LOCK TABLES `TerminalManufacturers` WRITE;
/*!40000 ALTER TABLE `TerminalManufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `TerminalManufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TerminalModels`
--

DROP TABLE IF EXISTS `TerminalModels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TerminalModels` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `iden` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `TerminalManufacturerId` binary(36) NOT NULL,
  `genericTemplate` text,
  `specificTemplate` text,
  `genericUrlPattern` varchar(225) DEFAULT NULL,
  `specificUrlPattern` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iden` (`iden`),
  KEY `TerminalManufacturerId` (`TerminalManufacturerId`),
  CONSTRAINT `TerminalModels_ibfk_1` FOREIGN KEY (`TerminalManufacturerId`) REFERENCES `TerminalManufacturers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TerminalModels`
--

LOCK TABLES `TerminalModels` WRITE;
/*!40000 ALTER TABLE `TerminalModels` DISABLE KEYS */;
/*!40000 ALTER TABLE `TerminalModels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Terminals`
--

DROP TABLE IF EXISTS `Terminals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Terminals` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `TerminalModelId` binary(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sorcery_id` varchar(40) NOT NULL,
  `aors` varchar(200) DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) NOT NULL DEFAULT 'all',
  `allow` varchar(200) NOT NULL DEFAULT 'alaw',
  `direct_media` enum('yes','no') NOT NULL DEFAULT 'yes',
  `mailboxes_aors` varchar(100) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `send_pai` enum('yes','no') DEFAULT NULL,
  `send_rpid` enum('yes','no') DEFAULT NULL,
  `contact` varchar(40) DEFAULT NULL,
  `default_expiration` int(11) DEFAULT NULL,
  `max_contacts` int(11) NOT NULL DEFAULT '5',
  `minimum_expiration` int(11) DEFAULT NULL,
  `remove_existing` enum('yes','no') DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `maximum_expiration` int(11) DEFAULT NULL,
  `support_path` enum('yes','no') NOT NULL DEFAULT 'yes',
  `password` varchar(25) NOT NULL DEFAULT '' COMMENT '[password]',
  `subscribecontext` varchar(40) NOT NULL DEFAULT 'default',
  `companyId` binary(36) NOT NULL,
  `mac` varchar(12) DEFAULT NULL,
  `lastProvisionDate` timestamp NULL DEFAULT NULL,
  `direct_media_method` varchar(64) DEFAULT 'update' COMMENT '[enum:update|invite|reinvite]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`sorcery_id`),
  KEY `TerminalModelId` (`TerminalModelId`),
  KEY `Terminals_CompanyId_ibfk_2` (`companyId`),
  CONSTRAINT `Terminals_CompanyId_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Terminals_ibfk_1` FOREIGN KEY (`TerminalModelId`) REFERENCES `TerminalModels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Terminals`
--

LOCK TABLES `Terminals` WRITE;
/*!40000 ALTER TABLE `Terminals` DISABLE KEYS */;
/*!40000 ALTER TABLE `Terminals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Timezones`
--

DROP TABLE IF EXISTS `Timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Timezones` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `countryId` mediumint(8) unsigned DEFAULT NULL,
  `tz` varchar(255) NOT NULL,
  `comment` varchar(150) DEFAULT '',
  `timeZoneLabel` varchar(20) NOT NULL DEFAULT '' COMMENT '[ml]',
  `timeZoneLabel_en` varchar(20) NOT NULL DEFAULT '',
  `timeZoneLabel_es` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `countryId` (`countryId`),
  CONSTRAINT `Timezones_ibfk_2` FOREIGN KEY (`countryId`) REFERENCES `Countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Timezones`
--

LOCK TABLES `Timezones` WRITE;
/*!40000 ALTER TABLE `Timezones` DISABLE KEYS */;
INSERT INTO `Timezones` VALUES (1,4,'Europe/Andorra',NULL,'','',''),(2,58,'Asia/Dubai',NULL,'','',''),(3,1,'Asia/Kabul',NULL,'','',''),(4,8,'America/Antigua',NULL,'','',''),(5,6,'America/Anguilla',NULL,'','',''),(6,2,'Europe/Tirane',NULL,'','',''),(7,12,'Asia/Yerevan',NULL,'','',''),(8,5,'Africa/Luanda',NULL,'','',''),(9,7,'Antarctica/McMurdo','McMurdo, South Pole, Scott (New Zealand time)','','',''),(10,7,'Antarctica/Rothera','Rothera Station, Adelaide Island','','',''),(11,7,'Antarctica/Palmer','Palmer Station, Anvers Island','','',''),(12,7,'Antarctica/Mawson','Mawson Station, Holme Bay','','',''),(13,7,'Antarctica/Davis','Davis Station, Vestfold Hills','','',''),(14,7,'Antarctica/Casey','Casey Station, Bailey Peninsula','','',''),(15,7,'Antarctica/Vostok','Vostok Station, Lake Vostok','','',''),(16,7,'Antarctica/DumontDUrville','Dumont-d\'Urville Station, Adelie Land','','',''),(17,7,'Antarctica/Syowa','Syowa Station, E Ongul I','','',''),(18,7,'Antarctica/Troll','Troll Station, Queen Maud Land','','',''),(19,11,'America/Argentina/Buenos_Aires','Buenos Aires (BA, CF)','','',''),(20,11,'America/Argentina/Cordoba','most locations (CB, CC, CN, ER, FM, MN, SE, SF)','','',''),(21,11,'America/Argentina/Salta','(SA, LP, NQ, RN)','','',''),(22,11,'America/Argentina/Jujuy','Jujuy (JY)','','',''),(23,11,'America/Argentina/Tucuman','Tucuman (TM)','','',''),(24,11,'America/Argentina/Catamarca','Catamarca (CT), Chubut (CH)','','',''),(25,11,'America/Argentina/La_Rioja','La Rioja (LR)','','',''),(26,11,'America/Argentina/San_Juan','San Juan (SJ)','','',''),(27,11,'America/Argentina/Mendoza','Mendoza (MZ)','','',''),(28,11,'America/Argentina/San_Luis','San Luis (SL)','','',''),(29,11,'America/Argentina/Rio_Gallegos','Santa Cruz (SC)','','',''),(30,11,'America/Argentina/Ushuaia','Tierra del Fuego (TF)','','',''),(31,193,'Pacific/Pago_Pago',NULL,'','',''),(32,15,'Europe/Vienna',NULL,'','',''),(33,14,'Australia/Lord_Howe','Lord Howe Island','','',''),(34,14,'Antarctica/Macquarie','Macquarie Island','','',''),(35,14,'Australia/Hobart','Tasmania - most locations','','',''),(36,14,'Australia/Currie','Tasmania - King Island','','',''),(37,14,'Australia/Melbourne','Victoria','','',''),(38,14,'Australia/Sydney','New South Wales - most locations','','',''),(39,14,'Australia/Broken_Hill','New South Wales - Yancowinna','','',''),(40,14,'Australia/Brisbane','Queensland - most locations','','',''),(41,14,'Australia/Lindeman','Queensland - Holiday Islands','','',''),(42,14,'Australia/Adelaide','South Australia','','',''),(43,14,'Australia/Darwin','Northern Territory','','',''),(44,14,'Australia/Perth','Western Australia - most locations','','',''),(45,14,'Australia/Eucla','Western Australia - Eucla area','','',''),(46,13,'America/Aruba',NULL,'','',''),(47,101,'Europe/Mariehamn',NULL,'','',''),(48,16,'Asia/Baku',NULL,'','',''),(49,27,'Europe/Sarajevo',NULL,'','',''),(50,20,'America/Barbados',NULL,'','',''),(51,19,'Asia/Dhaka',NULL,'','',''),(52,21,'Europe/Brussels',NULL,'','',''),(53,32,'Africa/Ouagadougou',NULL,'','',''),(54,31,'Europe/Sofia',NULL,'','',''),(55,18,'Asia/Bahrain',NULL,'','',''),(56,33,'Africa/Bujumbura',NULL,'','',''),(57,23,'Africa/Porto-Novo',NULL,'','',''),(58,194,'America/St_Barthelemy',NULL,'','',''),(59,24,'Atlantic/Bermuda',NULL,'','',''),(60,30,'Asia/Brunei',NULL,'','',''),(61,26,'America/La_Paz',NULL,'','',''),(62,246,'America/Kralendijk',NULL,'','',''),(63,29,'America/Noronha','Atlantic islands','','',''),(64,29,'America/Belem','Amapa, E Para','','',''),(65,29,'America/Fortaleza','NE Brazil (MA, PI, CE, RN, PB)','','',''),(66,29,'America/Recife','Pernambuco','','',''),(67,29,'America/Araguaina','Tocantins','','',''),(68,29,'America/Maceio','Alagoas, Sergipe','','',''),(69,29,'America/Bahia','Bahia','','',''),(70,29,'America/Sao_Paulo','S & SE Brazil (GO, DF, MG, ES, RJ, SP, PR, SC, RS)','','',''),(71,29,'America/Campo_Grande','Mato Grosso do Sul','','',''),(72,29,'America/Cuiaba','Mato Grosso','','',''),(73,29,'America/Santarem','W Para','','',''),(74,29,'America/Porto_Velho','Rondonia','','',''),(75,29,'America/Boa_Vista','Roraima','','',''),(76,29,'America/Manaus','E Amazonas','','',''),(77,29,'America/Eirunepe','W Amazonas','','',''),(78,29,'America/Rio_Branco','Acre','','',''),(79,17,'America/Nassau',NULL,'','',''),(80,34,'Asia/Thimphu',NULL,'','',''),(81,28,'Africa/Gaborone',NULL,'','',''),(82,25,'Europe/Minsk',NULL,'','',''),(83,22,'America/Belize',NULL,'','',''),(84,38,'America/St_Johns','Newfoundland Time, including SE Labrador','','',''),(85,38,'America/Halifax','Atlantic Time - Nova Scotia (most places), PEI','','',''),(86,38,'America/Glace_Bay','Atlantic Time - Nova Scotia - places that did not observe DST 1966-1971','','',''),(87,38,'America/Moncton','Atlantic Time - New Brunswick','','',''),(88,38,'America/Goose_Bay','Atlantic Time - Labrador - most locations','','',''),(89,38,'America/Blanc-Sablon','Atlantic Standard Time - Quebec - Lower North Shore','','',''),(90,38,'America/Toronto','Eastern Time - Ontario & Quebec - most locations','','',''),(91,38,'America/Nipigon','Eastern Time - Ontario & Quebec - places that did not observe DST 1967-1973','','',''),(92,38,'America/Thunder_Bay','Eastern Time - Thunder Bay, Ontario','','',''),(93,38,'America/Iqaluit','Eastern Time - east Nunavut - most locations','','',''),(94,38,'America/Pangnirtung','Eastern Time - Pangnirtung, Nunavut','','',''),(95,38,'America/Resolute','Central Time - Resolute, Nunavut','','',''),(96,38,'America/Atikokan','Eastern Standard Time - Atikokan, Ontario and Southampton I, Nunavut','','',''),(97,38,'America/Rankin_Inlet','Central Time - central Nunavut','','',''),(98,38,'America/Winnipeg','Central Time - Manitoba & west Ontario','','',''),(99,38,'America/Rainy_River','Central Time - Rainy River & Fort Frances, Ontario','','',''),(100,38,'America/Regina','Central Standard Time - Saskatchewan - most locations','','',''),(101,38,'America/Swift_Current','Central Standard Time - Saskatchewan - midwest','','',''),(102,38,'America/Edmonton','Mountain Time - Alberta, east British Columbia & west Saskatchewan','','',''),(103,38,'America/Cambridge_Bay','Mountain Time - west Nunavut','','',''),(104,38,'America/Yellowknife','Mountain Time - central Northwest Territories','','',''),(105,38,'America/Inuvik','Mountain Time - west Northwest Territories','','',''),(106,38,'America/Creston','Mountain Standard Time - Creston, British Columbia','','',''),(107,38,'America/Dawson_Creek','Mountain Standard Time - Dawson Creek & Fort Saint John, British Columbia','','',''),(108,38,'America/Vancouver','Pacific Time - west British Columbia','','',''),(109,38,'America/Whitehorse','Pacific Time - south Yukon','','',''),(110,38,'America/Dawson','Pacific Time - north Yukon','','',''),(111,103,'Indian/Cocos',NULL,'','',''),(112,185,'Africa/Kinshasa','west Dem. Rep. of Congo','','',''),(113,185,'Africa/Lubumbashi','east Dem. Rep. of Congo','','',''),(114,183,'Africa/Bangui',NULL,'','',''),(115,46,'Africa/Brazzaville',NULL,'','',''),(116,215,'Europe/Zurich',NULL,'','',''),(117,49,'Africa/Abidjan',NULL,'','',''),(118,104,'Pacific/Rarotonga',NULL,'','',''),(119,40,'America/Santiago','most locations','','',''),(120,40,'Pacific/Easter','Easter Island','','',''),(121,37,'Africa/Douala',NULL,'','',''),(122,41,'Asia/Shanghai','Beijing Time','','',''),(123,41,'Asia/Urumqi','Xinjiang Time','','',''),(124,44,'America/Bogota',NULL,'','',''),(125,50,'America/Costa_Rica',NULL,'','',''),(126,52,'America/Havana',NULL,'','',''),(127,35,'Atlantic/Cape_Verde',NULL,'','',''),(128,247,'America/Curacao',NULL,'','',''),(129,96,'Indian/Christmas',NULL,'','',''),(130,42,'Asia/Nicosia',NULL,'','',''),(131,184,'Europe/Prague',NULL,'','',''),(132,3,'Europe/Berlin','most locations','','',''),(133,3,'Europe/Busingen','Busingen','','',''),(134,243,'Africa/Djibouti',NULL,'','',''),(135,53,'Europe/Copenhagen',NULL,'','',''),(136,54,'America/Dominica',NULL,'','',''),(137,186,'America/Santo_Domingo',NULL,'','',''),(138,10,'Africa/Algiers',NULL,'','',''),(139,55,'America/Guayaquil','mainland','','',''),(140,55,'Pacific/Galapagos','Galapagos Islands','','',''),(141,64,'Europe/Tallinn',NULL,'','',''),(142,56,'Africa/Cairo',NULL,'','',''),(143,191,'Africa/El_Aaiun',NULL,'','',''),(144,59,'Africa/Asmara',NULL,'','',''),(145,62,'Europe/Madrid','mainland','','',''),(146,62,'Africa/Ceuta','Ceuta & Melilla','','',''),(147,62,'Atlantic/Canary','Canary Islands','','',''),(148,65,'Africa/Addis_Ababa',NULL,'','',''),(149,67,'Europe/Helsinki',NULL,'','',''),(150,68,'Pacific/Fiji',NULL,'','',''),(151,108,'Atlantic/Stanley',NULL,'','',''),(152,150,'Pacific/Chuuk','Chuuk (Truk) and Yap','','',''),(153,150,'Pacific/Pohnpei','Pohnpei (Ponape)','','',''),(154,150,'Pacific/Kosrae','Kosrae','','',''),(155,105,'Atlantic/Faroe',NULL,'','',''),(156,69,'Europe/Paris',NULL,'','',''),(157,70,'Africa/Libreville',NULL,'','',''),(158,182,'Europe/London',NULL,'','',''),(159,75,'America/Grenada',NULL,'','',''),(160,72,'Asia/Tbilisi',NULL,'','',''),(161,81,'America/Cayenne',NULL,'','',''),(162,82,'Europe/Guernsey',NULL,'','',''),(163,73,'Africa/Accra',NULL,'','',''),(164,74,'Europe/Gibraltar',NULL,'','',''),(165,77,'America/Godthab','most locations','','',''),(166,77,'America/Danmarkshavn','east coast, north of Scoresbysund','','',''),(167,77,'America/Scoresbysund','Scoresbysund / Ittoqqortoormiit','','',''),(168,77,'America/Thule','Thule / Pituffik','','',''),(169,71,'Africa/Banjul',NULL,'','',''),(170,83,'Africa/Conakry',NULL,'','',''),(171,78,'America/Guadeloupe',NULL,'','',''),(172,84,'Africa/Malabo',NULL,'','',''),(173,76,'Europe/Athens',NULL,'','',''),(174,106,'Atlantic/South_Georgia',NULL,'','',''),(175,80,'America/Guatemala',NULL,'','',''),(176,79,'Pacific/Guam',NULL,'','',''),(177,85,'Africa/Bissau',NULL,'','',''),(178,86,'America/Guyana',NULL,'','',''),(179,180,'Asia/Hong_Kong',NULL,'','',''),(180,88,'America/Tegucigalpa',NULL,'','',''),(181,51,'Europe/Zagreb',NULL,'','',''),(182,87,'America/Port-au-Prince',NULL,'','',''),(183,89,'Europe/Budapest',NULL,'','',''),(184,91,'Asia/Jakarta','Java & Sumatra','','',''),(185,91,'Asia/Pontianak','west & central Borneo','','',''),(186,91,'Asia/Makassar','east & south Borneo, Sulawesi (Celebes), Bali, Nusa Tengarra, west Timor','','',''),(187,91,'Asia/Jayapura','west New Guinea (Irian Jaya) & Malukus (Moluccas)','','',''),(188,94,'Europe/Dublin',NULL,'','',''),(189,117,'Asia/Jerusalem',NULL,'','',''),(190,97,'Europe/Isle_of_Man',NULL,'','',''),(191,90,'Asia/Kolkata',NULL,'','',''),(192,222,'Indian/Chagos',NULL,'','',''),(193,93,'Asia/Baghdad',NULL,'','',''),(194,92,'Asia/Tehran',NULL,'','',''),(195,100,'Atlantic/Reykjavik',NULL,'','',''),(196,118,'Europe/Rome',NULL,'','',''),(197,121,'Europe/Jersey',NULL,'','',''),(198,119,'America/Jamaica',NULL,'','',''),(199,122,'Asia/Amman',NULL,'','',''),(200,120,'Asia/Tokyo',NULL,'','',''),(201,124,'Africa/Nairobi',NULL,'','',''),(202,125,'Asia/Bishkek',NULL,'','',''),(203,36,'Asia/Phnom_Penh',NULL,'','',''),(204,126,'Pacific/Tarawa','Gilbert Islands','','',''),(205,126,'Pacific/Enderbury','Phoenix Islands','','',''),(206,126,'Pacific/Kiritimati','Line Islands','','',''),(207,45,'Indian/Comoro',NULL,'','',''),(208,195,'America/St_Kitts',NULL,'','',''),(209,47,'Asia/Pyongyang',NULL,'','',''),(210,48,'Asia/Seoul',NULL,'','',''),(211,127,'Asia/Kuwait',NULL,'','',''),(212,102,'America/Cayman',NULL,'','',''),(213,123,'Asia/Almaty','most locations','','',''),(214,123,'Asia/Qyzylorda','Qyzylorda (Kyzylorda, Kzyl-Orda)','','',''),(215,123,'Asia/Aqtobe','Aqtobe (Aktobe)','','',''),(216,123,'Asia/Aqtau','Atyrau (Atirau, Gur\'yev), Mangghystau (Mankistau)','','',''),(217,123,'Asia/Oral','West Kazakhstan','','',''),(218,128,'Asia/Vientiane',NULL,'','',''),(219,131,'Asia/Beirut',NULL,'','',''),(220,201,'America/St_Lucia',NULL,'','',''),(221,134,'Europe/Vaduz',NULL,'','',''),(222,210,'Asia/Colombo',NULL,'','',''),(223,132,'Africa/Monrovia',NULL,'','',''),(224,129,'Africa/Maseru',NULL,'','',''),(225,135,'Europe/Vilnius',NULL,'','',''),(226,136,'Europe/Luxembourg',NULL,'','',''),(227,130,'Europe/Riga',NULL,'','',''),(228,133,'Africa/Tripoli',NULL,'','',''),(229,144,'Africa/Casablanca',NULL,'','',''),(230,152,'Europe/Monaco',NULL,'','',''),(231,151,'Europe/Chisinau',NULL,'','',''),(232,154,'Europe/Podgorica',NULL,'','',''),(233,197,'America/Marigot',NULL,'','',''),(234,138,'Indian/Antananarivo',NULL,'','',''),(235,110,'Pacific/Majuro','most locations','','',''),(236,110,'Pacific/Kwajalein','Kwajalein','','',''),(237,137,'Europe/Skopje',NULL,'','',''),(238,142,'Africa/Bamako',NULL,'','',''),(239,157,'Asia/Rangoon',NULL,'','',''),(240,153,'Asia/Ulaanbaatar','most locations','','',''),(241,153,'Asia/Hovd','Bayan-Olgiy, Govi-Altai, Hovd, Uvs, Zavkhan','','',''),(242,153,'Asia/Choibalsan','Dornod, Sukhbaatar','','',''),(243,181,'Asia/Macau',NULL,'','',''),(244,109,'Pacific/Saipan',NULL,'','',''),(245,145,'America/Martinique',NULL,'','',''),(246,147,'Africa/Nouakchott',NULL,'','',''),(247,155,'America/Montserrat',NULL,'','',''),(248,143,'Europe/Malta',NULL,'','',''),(249,146,'Indian/Mauritius',NULL,'','',''),(250,141,'Indian/Maldives',NULL,'','',''),(251,140,'Africa/Blantyre',NULL,'','',''),(252,149,'America/Mexico_City','Central Time - most locations','','',''),(253,149,'America/Cancun','Central Time - Quintana Roo','','',''),(254,149,'America/Merida','Central Time - Campeche, Yucatan','','',''),(255,149,'America/Monterrey','Mexican Central Time - Coahuila, Durango, Nuevo Leon, Tamaulipas away from US border','','',''),(256,149,'America/Matamoros','US Central Time - Coahuila, Durango, Nuevo Leon, Tamaulipas near US border','','',''),(257,149,'America/Mazatlan','Mountain Time - S Baja, Nayarit, Sinaloa','','',''),(258,149,'America/Chihuahua','Mexican Mountain Time - Chihuahua away from US border','','',''),(259,149,'America/Ojinaga','US Mountain Time - Chihuahua near US border','','',''),(260,149,'America/Hermosillo','Mountain Standard Time - Sonora','','',''),(261,149,'America/Tijuana','US Pacific Time - Baja California near US border','','',''),(262,149,'America/Santa_Isabel','Mexican Pacific Time - Baja California away from US border','','',''),(263,149,'America/Bahia_Banderas','Mexican Central Time - Bahia de Banderas','','',''),(264,139,'Asia/Kuala_Lumpur','peninsular Malaysia','','',''),(265,139,'Asia/Kuching','Sabah & Sarawak','','',''),(266,156,'Africa/Maputo',NULL,'','',''),(267,158,'Africa/Windhoek',NULL,'','',''),(268,165,'Pacific/Noumea',NULL,'','',''),(269,162,'Africa/Niamey',NULL,'','',''),(270,99,'Pacific/Norfolk',NULL,'','',''),(271,163,'Africa/Lagos',NULL,'','',''),(272,161,'America/Managua',NULL,'','',''),(273,168,'Europe/Amsterdam',NULL,'','',''),(274,164,'Europe/Oslo',NULL,'','',''),(275,160,'Asia/Kathmandu',NULL,'','',''),(276,159,'Pacific/Nauru',NULL,'','',''),(277,98,'Pacific/Niue',NULL,'','',''),(278,166,'Pacific/Auckland','most locations','','',''),(279,166,'Pacific/Chatham','Chatham Islands','','',''),(280,167,'Asia/Muscat',NULL,'','',''),(281,171,'America/Panama',NULL,'','',''),(282,174,'America/Lima',NULL,'','',''),(283,175,'Pacific/Tahiti','Society Islands','','',''),(284,175,'Pacific/Marquesas','Marquesas Islands','','',''),(285,175,'Pacific/Gambier','Gambier Islands','','',''),(286,172,'Pacific/Port_Moresby','most locations','','',''),(287,172,'Pacific/Bougainville','Bougainville','','',''),(288,66,'Asia/Manila',NULL,'','',''),(289,169,'Asia/Karachi',NULL,'','',''),(290,176,'Europe/Warsaw',NULL,'','',''),(291,198,'America/Miquelon',NULL,'','',''),(292,112,'Pacific/Pitcairn',NULL,'','',''),(293,178,'America/Puerto_Rico',NULL,'','',''),(294,224,'Asia/Gaza','Gaza Strip','','',''),(295,224,'Asia/Hebron','West Bank','','',''),(296,177,'Europe/Lisbon','mainland','','',''),(297,177,'Atlantic/Madeira','Madeira Islands','','',''),(298,177,'Atlantic/Azores','Azores','','',''),(299,170,'Pacific/Palau',NULL,'','',''),(300,173,'America/Asuncion',NULL,'','',''),(301,179,'Asia/Qatar',NULL,'','',''),(302,187,'Indian/Reunion',NULL,'','',''),(303,189,'Europe/Bucharest',NULL,'','',''),(304,204,'Europe/Belgrade',NULL,'','',''),(305,190,'Europe/Kaliningrad','Moscow-01 - Kaliningrad','','',''),(306,190,'Europe/Moscow','Moscow+00 - west Russia','','',''),(307,190,'Europe/Simferopol','Moscow+00 - Crimea','','',''),(308,190,'Europe/Volgograd','Moscow+00 - Caspian Sea','','',''),(309,190,'Europe/Samara','Moscow+00 (Moscow+01 after 2014-10-26) - Samara, Udmurtia','','',''),(310,190,'Asia/Yekaterinburg','Moscow+02 - Urals','','',''),(311,190,'Asia/Omsk','Moscow+03 - west Siberia','','',''),(312,190,'Asia/Novosibirsk','Moscow+03 - Novosibirsk','','',''),(313,190,'Asia/Novokuznetsk','Moscow+03 (Moscow+04 after 2014-10-26) - Kemerovo','','',''),(314,190,'Asia/Krasnoyarsk','Moscow+04 - Yenisei River','','',''),(315,190,'Asia/Irkutsk','Moscow+05 - Lake Baikal','','',''),(316,190,'Asia/Chita','Moscow+06 (Moscow+05 after 2014-10-26) - Zabaykalsky','','',''),(317,190,'Asia/Yakutsk','Moscow+06 - Lena River','','',''),(318,190,'Asia/Khandyga','Moscow+06 - Tomponsky, Ust-Maysky','','',''),(319,190,'Asia/Vladivostok','Moscow+07 - Amur River','','',''),(320,190,'Asia/Sakhalin','Moscow+07 - Sakhalin Island','','',''),(321,190,'Asia/Ust-Nera','Moscow+07 - Oymyakonsky','','',''),(322,190,'Asia/Magadan','Moscow+08 (Moscow+07 after 2014-10-26) - Magadan','','',''),(323,190,'Asia/Srednekolymsk','Moscow+08 - E Sakha, N Kuril Is','','',''),(324,190,'Asia/Kamchatka','Moscow+08 (Moscow+09 after 2014-10-26) - Kamchatka','','',''),(325,190,'Asia/Anadyr','Moscow+08 (Moscow+09 after 2014-10-26) - Bering Sea','','',''),(326,188,'Africa/Kigali',NULL,'','',''),(327,9,'Asia/Riyadh',NULL,'','',''),(328,113,'Pacific/Guadalcanal',NULL,'','',''),(329,205,'Indian/Mahe',NULL,'','',''),(330,213,'Africa/Khartoum',NULL,'','',''),(331,214,'Europe/Stockholm',NULL,'','',''),(332,207,'Asia/Singapore',NULL,'','',''),(333,200,'Atlantic/St_Helena',NULL,'','',''),(334,61,'Europe/Ljubljana',NULL,'','',''),(335,217,'Arctic/Longyearbyen',NULL,'','',''),(336,60,'Europe/Bratislava',NULL,'','',''),(337,206,'Africa/Freetown',NULL,'','',''),(338,196,'Europe/San_Marino',NULL,'','',''),(339,203,'Africa/Dakar',NULL,'','',''),(340,209,'Africa/Mogadishu',NULL,'','',''),(341,216,'America/Paramaribo',NULL,'','',''),(342,249,'Africa/Juba',NULL,'','',''),(343,202,'Africa/Sao_Tome',NULL,'','',''),(344,57,'America/El_Salvador',NULL,'','',''),(345,248,'America/Lower_Princes',NULL,'','',''),(346,208,'Asia/Damascus',NULL,'','',''),(347,211,'Africa/Mbabane',NULL,'','',''),(348,114,'America/Grand_Turk',NULL,'','',''),(349,39,'Africa/Ndjamena',NULL,'','',''),(350,223,'Indian/Kerguelen',NULL,'','',''),(351,226,'Africa/Lome',NULL,'','',''),(352,218,'Asia/Bangkok',NULL,'','',''),(353,221,'Asia/Dushanbe',NULL,'','',''),(354,227,'Pacific/Fakaofo',NULL,'','',''),(355,225,'Asia/Dili',NULL,'','',''),(356,231,'Asia/Ashgabat',NULL,'','',''),(357,230,'Africa/Tunis',NULL,'','',''),(358,228,'Pacific/Tongatapu',NULL,'','',''),(359,232,'Europe/Istanbul',NULL,'','',''),(360,229,'America/Port_of_Spain',NULL,'','',''),(361,233,'Pacific/Funafuti',NULL,'','',''),(362,219,'Asia/Taipei',NULL,'','',''),(363,220,'Africa/Dar_es_Salaam',NULL,'','',''),(364,234,'Europe/Kiev','most locations','','',''),(365,234,'Europe/Uzhgorod','Ruthenia','','',''),(366,234,'Europe/Zaporozhye','Zaporozh\'ye, E Lugansk / Zaporizhia, E Luhansk','','',''),(367,235,'Africa/Kampala',NULL,'','',''),(368,111,'Pacific/Johnston','Johnston Atoll','','',''),(369,111,'Pacific/Midway','Midway Islands','','',''),(370,111,'Pacific/Wake','Wake Island','','',''),(371,63,'America/New_York','Eastern Time','','',''),(372,63,'America/Detroit','Eastern Time - Michigan - most locations','','',''),(373,63,'America/Kentucky/Louisville','Eastern Time - Kentucky - Louisville area','','',''),(374,63,'America/Kentucky/Monticello','Eastern Time - Kentucky - Wayne County','','',''),(375,63,'America/Indiana/Indianapolis','Eastern Time - Indiana - most locations','','',''),(376,63,'America/Indiana/Vincennes','Eastern Time - Indiana - Daviess, Dubois, Knox & Martin Counties','','',''),(377,63,'America/Indiana/Winamac','Eastern Time - Indiana - Pulaski County','','',''),(378,63,'America/Indiana/Marengo','Eastern Time - Indiana - Crawford County','','',''),(379,63,'America/Indiana/Petersburg','Eastern Time - Indiana - Pike County','','',''),(380,63,'America/Indiana/Vevay','Eastern Time - Indiana - Switzerland County','','',''),(381,63,'America/Chicago','Central Time','','',''),(382,63,'America/Indiana/Tell_City','Central Time - Indiana - Perry County','','',''),(383,63,'America/Indiana/Knox','Central Time - Indiana - Starke County','','',''),(384,63,'America/Menominee','Central Time - Michigan - Dickinson, Gogebic, Iron & Menominee Counties','','',''),(385,63,'America/North_Dakota/Center','Central Time - North Dakota - Oliver County','','',''),(386,63,'America/North_Dakota/New_Salem','Central Time - North Dakota - Morton County (except Mandan area)','','',''),(387,63,'America/North_Dakota/Beulah','Central Time - North Dakota - Mercer County','','',''),(388,63,'America/Denver','Mountain Time','','',''),(389,63,'America/Boise','Mountain Time - south Idaho & east Oregon','','',''),(390,63,'America/Phoenix','Mountain Standard Time - Arizona (except Navajo)','','',''),(391,63,'America/Los_Angeles','Pacific Time','','',''),(392,63,'America/Metlakatla','Pacific Standard Time - Annette Island, Alaska','','',''),(393,63,'America/Anchorage','Alaska Time','','',''),(394,63,'America/Juneau','Alaska Time - Alaska panhandle','','',''),(395,63,'America/Sitka','Alaska Time - southeast Alaska panhandle','','',''),(396,63,'America/Yakutat','Alaska Time - Alaska panhandle neck','','',''),(397,63,'America/Nome','Alaska Time - west Alaska','','',''),(398,63,'America/Adak','Aleutian Islands','','',''),(399,63,'Pacific/Honolulu','Hawaii','','',''),(400,236,'America/Montevideo',NULL,'','',''),(401,237,'Asia/Samarkand','west Uzbekistan','','',''),(402,237,'Asia/Tashkent','east Uzbekistan','','',''),(403,43,'Europe/Vatican',NULL,'','',''),(404,199,'America/St_Vincent',NULL,'','',''),(405,239,'America/Caracas',NULL,'','',''),(406,115,'America/Tortola',NULL,'','',''),(407,116,'America/St_Thomas',NULL,'','',''),(408,240,'Asia/Ho_Chi_Minh',NULL,'','',''),(409,238,'Pacific/Efate',NULL,'','',''),(410,241,'Pacific/Wallis',NULL,'','',''),(411,192,'Pacific/Apia',NULL,'','',''),(412,242,'Asia/Aden',NULL,'','',''),(413,148,'Indian/Mayotte',NULL,'','',''),(414,212,'Africa/Johannesburg',NULL,'','',''),(415,244,'Africa/Lusaka',NULL,'','',''),(416,245,'Africa/Harare',NULL,'','','');
/*!40000 ALTER TABLE `Timezones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransformationRulesetGroupsTrunks`
--

DROP TABLE IF EXISTS `TransformationRulesetGroupsTrunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransformationRulesetGroupsTrunks` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `brandId` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `caller_in` int(11) DEFAULT NULL,
  `callee_in` int(11) DEFAULT NULL,
  `caller_out` int(11) DEFAULT NULL,
  `callee_out` int(11) DEFAULT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_idx` (`name`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `TransformationRulesetGroupsTrunks_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransformationRulesetGroupsTrunks`
--

LOCK TABLES `TransformationRulesetGroupsTrunks` WRITE;
/*!40000 ALTER TABLE `TransformationRulesetGroupsTrunks` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransformationRulesetGroupsTrunks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransformationRulesetGroupsUsers`
--

DROP TABLE IF EXISTS `TransformationRulesetGroupsUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransformationRulesetGroupsUsers` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `brandId` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `caller_in` int(11) DEFAULT NULL,
  `callee_in` int(11) DEFAULT NULL,
  `caller_out` int(11) DEFAULT NULL,
  `callee_out` int(11) DEFAULT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_idx` (`name`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `TransformationRulesetGroupsUsers_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransformationRulesetGroupsUsers`
--

LOCK TABLES `TransformationRulesetGroupsUsers` WRITE;
/*!40000 ALTER TABLE `TransformationRulesetGroupsUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransformationRulesetGroupsUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `companyId` binary(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(80) NOT NULL COMMENT '[password]',
  `timezoneId` mediumint(8) unsigned DEFAULT NULL,
  `terminalId` binary(36) DEFAULT NULL,
  `extensionId` binary(36) DEFAULT NULL,
  `outgoingDDIId` binary(36) DEFAULT NULL,
  `callACLId` binary(36) DEFAULT NULL,
  `doNotDisturb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isBoss` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bossAssistantId` binary(36) DEFAULT NULL,
  `exceptionBoosAssistantRegExp` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `maxCalls` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `callWaiting` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `attachVoicemailSound` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `voicemailEnabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tokenKey` varchar(125) DEFAULT NULL,
  `isCompanyAdmin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `countryId` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UsersUniqueCompanyUsername` (`companyId`,`username`),
  UNIQUE KEY `uniqueTerminalId` (`terminalId`),
  UNIQUE KEY `terminalId_2` (`terminalId`),
  UNIQUE KEY `uniqueExtensionId` (`extensionId`),
  KEY `companyId` (`companyId`),
  KEY `timezoneId` (`timezoneId`),
  KEY `terminalId` (`terminalId`),
  KEY `outgoingDDIId` (`outgoingDDIId`),
  KEY `callACLId` (`callACLId`),
  KEY `bossAssistantId` (`bossAssistantId`),
  KEY `countryId` (`countryId`),
  CONSTRAINT `Users_ibfk_12` FOREIGN KEY (`countryId`) REFERENCES `Countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Users_ibfk_10` FOREIGN KEY (`callACLId`) REFERENCES `CallACL` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_11` FOREIGN KEY (`bossAssistantId`) REFERENCES `Users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_3` FOREIGN KEY (`terminalId`) REFERENCES `Terminals` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_7` FOREIGN KEY (`extensionId`) REFERENCES `Extensions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_8` FOREIGN KEY (`timezoneId`) REFERENCES `Timezones` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Users_ibfk_9` FOREIGN KEY (`outgoingDDIId`) REFERENCES `DDIs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `XMLRPCLogs`
--

DROP TABLE IF EXISTS `XMLRPCLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `XMLRPCLogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proxy` varchar(10) NOT NULL,
  `module` varchar(10) NOT NULL,
  `method` varchar(10) NOT NULL,
  `mapperName` varchar(20) NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execDate` datetime DEFAULT NULL,
  `finishDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `XMLRPCLogs`
--

LOCK TABLES `XMLRPCLogs` WRITE;
/*!40000 ALTER TABLE `XMLRPCLogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `XMLRPCLogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ast_musiconhold`
--

DROP TABLE IF EXISTS `ast_musiconhold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ast_musiconhold` (
  `name` varchar(80) NOT NULL,
  `mode` enum('custom','files','mp3nb','quietmp3nb','quietmp3') DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `application` varchar(255) DEFAULT NULL,
  `digit` varchar(1) DEFAULT NULL,
  `sort` varchar(10) DEFAULT NULL,
  `format` varchar(10) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_musiconhold`
--

LOCK TABLES `ast_musiconhold` WRITE;
/*!40000 ALTER TABLE `ast_musiconhold` DISABLE KEYS */;
/*!40000 ALTER TABLE `ast_musiconhold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ast_ps_aors`
--

DROP TABLE IF EXISTS `ast_ps_aors`;
/*!50001 DROP VIEW IF EXISTS `ast_ps_aors`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ast_ps_aors` (
  `sorcery_id` tinyint NOT NULL,
  `contact` tinyint NOT NULL,
  `default_expiration` tinyint NOT NULL,
  `mailboxes` tinyint NOT NULL,
  `max_contacts` tinyint NOT NULL,
  `minimum_expiration` tinyint NOT NULL,
  `remove_existing` tinyint NOT NULL,
  `qualify_frequency` tinyint NOT NULL,
  `authenticate_qualify` tinyint NOT NULL,
  `maximum_expiration` tinyint NOT NULL,
  `outbound_proxy` tinyint NOT NULL,
  `support_path` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ast_ps_contacts`
--

DROP TABLE IF EXISTS `ast_ps_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ast_ps_contacts` (
  `sorcery_id` varchar(255) NOT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `expiration_time` varchar(40) DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `path` text,
  `user_agent` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`sorcery_id`),
  KEY `ast_ps_contacts_id` (`sorcery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_ps_contacts`
--

LOCK TABLES `ast_ps_contacts` WRITE;
/*!40000 ALTER TABLE `ast_ps_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ast_ps_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ast_ps_endpoints`
--

DROP TABLE IF EXISTS `ast_ps_endpoints`;
/*!50001 DROP VIEW IF EXISTS `ast_ps_endpoints`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ast_ps_endpoints` (
  `sorcery_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `aors` tinyint NOT NULL,
  `auth` tinyint NOT NULL,
  `context` tinyint NOT NULL,
  `disallow` tinyint NOT NULL,
  `allow` tinyint NOT NULL,
  `direct_media` tinyint NOT NULL,
  `direct_media_method` tinyint NOT NULL,
  `mailboxes_aors` tinyint NOT NULL,
  `outbound_proxy` tinyint NOT NULL,
  `send_pai` tinyint NOT NULL,
  `send_rpid` tinyint NOT NULL,
  `contact` tinyint NOT NULL,
  `default_expiration` tinyint NOT NULL,
  `max_contacts` tinyint NOT NULL,
  `minimum_expiration` tinyint NOT NULL,
  `remove_existing` tinyint NOT NULL,
  `qualify_frequency` tinyint NOT NULL,
  `authenticate_qualify` tinyint NOT NULL,
  `maximum_expiration` tinyint NOT NULL,
  `support_path` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `subscribecontext` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ast_ps_identify`
--

DROP TABLE IF EXISTS `ast_ps_identify`;
/*!50001 DROP VIEW IF EXISTS `ast_ps_identify`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ast_ps_identify` (
  `sorcery_id` tinyint NOT NULL,
  `endpoint` tinyint NOT NULL,
  `match` tinyint NOT NULL,
  `type` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ast_voicemail`
--

DROP TABLE IF EXISTS `ast_voicemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ast_voicemail` (
  `uniqueid` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(80) NOT NULL,
  `mailbox` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `fullname` varchar(80) DEFAULT NULL,
  `alias` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `pager` varchar(80) DEFAULT NULL,
  `attach` enum('yes','no') DEFAULT NULL,
  `attachfmt` varchar(10) DEFAULT NULL,
  `serveremail` varchar(80) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `tz` varchar(30) DEFAULT NULL,
  `deleteast_voicemail` enum('yes','no') DEFAULT NULL,
  `saycid` enum('yes','no') DEFAULT NULL,
  `sendast_voicemail` enum('yes','no') DEFAULT NULL,
  `review` enum('yes','no') DEFAULT NULL,
  `tempgreetwarn` enum('yes','no') DEFAULT NULL,
  `operator` enum('yes','no') DEFAULT NULL,
  `envelope` enum('yes','no') DEFAULT NULL,
  `sayduration` int(11) DEFAULT NULL,
  `forcename` enum('yes','no') DEFAULT NULL,
  `forcegreetings` enum('yes','no') DEFAULT NULL,
  `callback` varchar(80) DEFAULT NULL,
  `dialout` varchar(80) DEFAULT NULL,
  `exitcontext` varchar(80) DEFAULT NULL,
  `maxmsg` int(11) DEFAULT NULL,
  `volgain` decimal(5,2) DEFAULT NULL,
  `imapuser` varchar(80) DEFAULT NULL,
  `imappassword` varchar(80) DEFAULT NULL,
  `imapserver` varchar(80) DEFAULT NULL,
  `imapport` varchar(8) DEFAULT NULL,
  `imapflags` varchar(80) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `ast_voicemail_mailbox` (`mailbox`),
  KEY `ast_voicemail_context` (`context`),
  KEY `ast_voicemail_mailbox_context` (`mailbox`,`context`),
  KEY `ast_voicemail_imapuser` (`imapuser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_voicemail`
--

LOCK TABLES `ast_voicemail` WRITE;
/*!40000 ALTER TABLE `ast_voicemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ast_voicemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_address`
--

DROP TABLE IF EXISTS `kam_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grp` int(11) unsigned NOT NULL DEFAULT '1',
  `ip_addr` varchar(50) NOT NULL,
  `mask` int(11) NOT NULL DEFAULT '32',
  `port` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(64) DEFAULT NULL,
  `peerServerId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peerServerId` (`peerServerId`),
  CONSTRAINT `kam_address_ibfk_1` FOREIGN KEY (`peerServerId`) REFERENCES `PeerServers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_address`
--

LOCK TABLES `kam_address` WRITE;
/*!40000 ALTER TABLE `kam_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_dispatcher`
--

DROP TABLE IF EXISTS `kam_dispatcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_dispatcher` (
  `id` binary(36) NOT NULL COMMENT '[uuid]',
  `setid` int(11) NOT NULL DEFAULT '0',
  `destination` varchar(192) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `attrs` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(64) NOT NULL DEFAULT '',
  `applicationServerId` binary(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `applicationServerId` (`applicationServerId`),
  CONSTRAINT `kam_dispatcher_ibfk_1` FOREIGN KEY (`applicationServerId`) REFERENCES `ApplicationServers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_dispatcher`
--

LOCK TABLES `kam_dispatcher` WRITE;
/*!40000 ALTER TABLE `kam_dispatcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_dispatcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_acc`
--

DROP TABLE IF EXISTS `kam_trunks_acc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_trunks_acc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(16) NOT NULL DEFAULT '',
  `from_tag` varchar(64) NOT NULL DEFAULT '',
  `to_tag` varchar(64) NOT NULL DEFAULT '',
  `callid` varchar(255) NOT NULL DEFAULT '',
  `sip_code` varchar(3) NOT NULL DEFAULT '',
  `sip_reason` varchar(128) NOT NULL DEFAULT '',
  `src_ip` varchar(64) DEFAULT NULL,
  `from_user` varchar(64) DEFAULT NULL,
  `from_domain` varchar(64) DEFAULT NULL,
  `ruri_user` varchar(64) DEFAULT NULL,
  `ruri_domain` varchar(64) DEFAULT NULL,
  `cseq` int(10) unsigned DEFAULT NULL,
  `localtime` datetime NOT NULL,
  `utctime` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `callid_idx` (`callid`)
) ENGINE=InnoDB AUTO_INCREMENT=3188 DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_acc`
--

LOCK TABLES `kam_trunks_acc` WRITE;
/*!40000 ALTER TABLE `kam_trunks_acc` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_acc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_acc_cdrs`
--

DROP TABLE IF EXISTS `kam_trunks_acc_cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_trunks_acc_cdrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calldate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `duration` float(10,3) NOT NULL DEFAULT '0.000',
  `caller` varchar(128) DEFAULT NULL,
  `callee` varchar(128) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `subtype` varchar(64) DEFAULT NULL,
  `companyId` varchar(64) DEFAULT NULL,
  `companyName` varchar(64) DEFAULT NULL,
  `asIden` varchar(64) DEFAULT NULL,
  `asAddress` varchar(64) DEFAULT NULL,
  `callid` varchar(128) DEFAULT NULL,
  `xcallid` varchar(128) DEFAULT NULL,
  `parsed` enum('yes','no','error') DEFAULT 'no',
  `diversion` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `start_time_idx` (`start_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1892 DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_acc_cdrs`
--

LOCK TABLES `kam_trunks_acc_cdrs` WRITE;
/*!40000 ALTER TABLE `kam_trunks_acc_cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_acc_cdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_dialog`
--

DROP TABLE IF EXISTS `kam_trunks_dialog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_trunks_dialog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash_entry` int(10) unsigned NOT NULL,
  `hash_id` int(10) unsigned NOT NULL,
  `callid` varchar(255) NOT NULL,
  `from_uri` varchar(128) NOT NULL,
  `from_tag` varchar(64) NOT NULL,
  `to_uri` varchar(128) NOT NULL,
  `to_tag` varchar(64) NOT NULL,
  `caller_cseq` varchar(20) NOT NULL,
  `callee_cseq` varchar(20) NOT NULL,
  `caller_route_set` varchar(512) DEFAULT NULL,
  `callee_route_set` varchar(512) DEFAULT NULL,
  `caller_contact` varchar(128) NOT NULL,
  `callee_contact` varchar(128) NOT NULL,
  `caller_sock` varchar(64) NOT NULL,
  `callee_sock` varchar(64) NOT NULL,
  `state` int(10) unsigned NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `timeout` int(10) unsigned NOT NULL DEFAULT '0',
  `sflags` int(10) unsigned NOT NULL DEFAULT '0',
  `iflags` int(10) unsigned NOT NULL DEFAULT '0',
  `toroute_name` varchar(32) DEFAULT NULL,
  `req_uri` varchar(128) NOT NULL,
  `xdata` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hash_idx` (`hash_entry`,`hash_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_dialog`
--

LOCK TABLES `kam_trunks_dialog` WRITE;
/*!40000 ALTER TABLE `kam_trunks_dialog` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_dialog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_dialog_vars`
--

DROP TABLE IF EXISTS `kam_trunks_dialog_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_trunks_dialog_vars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash_entry` int(10) unsigned NOT NULL,
  `hash_id` int(10) unsigned NOT NULL,
  `dialog_key` varchar(128) NOT NULL,
  `dialog_value` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash_idx` (`hash_entry`,`hash_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_dialog_vars`
--

LOCK TABLES `kam_trunks_dialog_vars` WRITE;
/*!40000 ALTER TABLE `kam_trunks_dialog_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_dialog_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_dialplan`
--

DROP TABLE IF EXISTS `kam_trunks_dialplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_trunks_dialplan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dpid` int(11) NOT NULL,
  `pr` int(11) NOT NULL,
  `match_op` int(11) NOT NULL,
  `match_exp` varchar(64) NOT NULL,
  `match_len` int(11) NOT NULL,
  `subst_exp` varchar(64) NOT NULL,
  `repl_exp` varchar(64) NOT NULL,
  `attrs` varchar(64) NOT NULL,
  `transformationRulesetGroupsTrunksId` binary(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kam_trunks_dialplan_ibfk_2` (`transformationRulesetGroupsTrunksId`),
  CONSTRAINT `kam_trunks_dialplan_ibfk_2` FOREIGN KEY (`transformationRulesetGroupsTrunksId`) REFERENCES `TransformationRulesetGroupsTrunks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_dialplan`
--

LOCK TABLES `kam_trunks_dialplan` WRITE;
/*!40000 ALTER TABLE `kam_trunks_dialplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_dialplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `kam_trunks_domain`
--

DROP TABLE IF EXISTS `kam_trunks_domain`;
/*!50001 DROP VIEW IF EXISTS `kam_trunks_domain`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `kam_trunks_domain` (
  `domain` tinyint NOT NULL,
  `DID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kam_trunks_domain_attrs`
--

DROP TABLE IF EXISTS `kam_trunks_domain_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_trunks_domain_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_attrs_idx` (`did`,`name`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_domain_attrs`
--

LOCK TABLES `kam_trunks_domain_attrs` WRITE;
/*!40000 ALTER TABLE `kam_trunks_domain_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_domain_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_htable`
--

DROP TABLE IF EXISTS `kam_trunks_htable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_trunks_htable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key_name` varchar(64) NOT NULL DEFAULT '',
  `key_type` int(11) NOT NULL DEFAULT '0',
  `value_type` int(11) NOT NULL DEFAULT '0',
  `key_value` varchar(128) NOT NULL DEFAULT '',
  `expires` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_htable`
--

LOCK TABLES `kam_trunks_htable` WRITE;
/*!40000 ALTER TABLE `kam_trunks_htable` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_htable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_location`
--

DROP TABLE IF EXISTS `kam_trunks_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_trunks_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `contact` varchar(255) NOT NULL DEFAULT '',
  `received` varchar(128) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2030-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT '1.00',
  `callid` varchar(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int(11) NOT NULL DEFAULT '1',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cflags` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `socket` varchar(64) DEFAULT NULL,
  `methods` int(11) DEFAULT NULL,
  `instance` varchar(255) DEFAULT NULL,
  `reg_id` int(11) NOT NULL DEFAULT '0',
  `server_id` int(11) NOT NULL DEFAULT '0',
  `connection_id` int(11) NOT NULL DEFAULT '0',
  `keepalive` int(11) NOT NULL DEFAULT '0',
  `partition` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ruid_idx` (`ruid`),
  KEY `account_contact_idx` (`username`,`domain`,`contact`),
  KEY `expires_idx` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_location`
--

LOCK TABLES `kam_trunks_location` WRITE;
/*!40000 ALTER TABLE `kam_trunks_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_missed_calls`
--

DROP TABLE IF EXISTS `kam_trunks_missed_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_trunks_missed_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(16) NOT NULL DEFAULT '',
  `from_tag` varchar(64) NOT NULL DEFAULT '',
  `to_tag` varchar(64) NOT NULL DEFAULT '',
  `callid` varchar(255) NOT NULL DEFAULT '',
  `sip_code` varchar(3) NOT NULL DEFAULT '',
  `sip_reason` varchar(128) NOT NULL DEFAULT '',
  `src_ip` varchar(64) DEFAULT NULL,
  `from_user` varchar(64) DEFAULT NULL,
  `from_domain` varchar(64) DEFAULT NULL,
  `ruri_user` varchar(64) DEFAULT NULL,
  `ruri_domain` varchar(64) DEFAULT NULL,
  `cseq` int(10) unsigned DEFAULT NULL,
  `localtime` datetime NOT NULL,
  `utctime` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `callid_idx` (`callid`)
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_missed_calls`
--

LOCK TABLES `kam_trunks_missed_calls` WRITE;
/*!40000 ALTER TABLE `kam_trunks_missed_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_missed_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_uacreg`
--

DROP TABLE IF EXISTS `kam_trunks_uacreg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_trunks_uacreg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `l_uuid` varchar(64) NOT NULL DEFAULT '',
  `l_username` varchar(64) NOT NULL DEFAULT 'unused',
  `l_domain` varchar(128) NOT NULL DEFAULT 'unused',
  `r_username` varchar(64) NOT NULL DEFAULT '',
  `r_domain` varchar(128) NOT NULL DEFAULT '',
  `realm` varchar(64) NOT NULL DEFAULT '',
  `auth_username` varchar(64) NOT NULL DEFAULT '',
  `auth_password` varchar(64) NOT NULL DEFAULT '',
  `auth_proxy` varchar(64) NOT NULL DEFAULT '',
  `expires` int(11) NOT NULL DEFAULT '0',
  `brandId` int(10) unsigned NOT NULL,
  `peeringContractId` binary(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `l_uuid_idx` (`l_uuid`),
  KEY `brandId` (`brandId`),
  KEY `peeringContractId` (`peeringContractId`),
  CONSTRAINT `kam_trunks_uacreg_ibfk_2` FOREIGN KEY (`peeringContractId`) REFERENCES `PeeringContracts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `kam_trunks_uacreg_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_uacreg`
--

LOCK TABLES `kam_trunks_uacreg` WRITE;
/*!40000 ALTER TABLE `kam_trunks_uacreg` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_uacreg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_trunks_usr_preferences`
--

DROP TABLE IF EXISTS `kam_trunks_usr_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_trunks_usr_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(128) NOT NULL DEFAULT '0',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(32) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `value` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `ua_idx` (`uuid`,`attribute`),
  KEY `uda_idx` (`username`,`domain`,`attribute`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_trunks_usr_preferences`
--

LOCK TABLES `kam_trunks_usr_preferences` WRITE;
/*!40000 ALTER TABLE `kam_trunks_usr_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_trunks_usr_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_acc`
--

DROP TABLE IF EXISTS `kam_users_acc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_users_acc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(16) NOT NULL DEFAULT '',
  `from_tag` varchar(64) NOT NULL DEFAULT '',
  `to_tag` varchar(64) NOT NULL DEFAULT '',
  `callid` varchar(255) NOT NULL DEFAULT '',
  `sip_code` varchar(3) NOT NULL DEFAULT '',
  `sip_reason` varchar(128) NOT NULL DEFAULT '',
  `src_ip` varchar(64) DEFAULT NULL,
  `from_user` varchar(64) DEFAULT NULL,
  `from_domain` varchar(64) DEFAULT NULL,
  `ruri_user` varchar(64) DEFAULT NULL,
  `ruri_domain` varchar(64) DEFAULT NULL,
  `cseq` int(10) unsigned DEFAULT NULL,
  `localtime` datetime NOT NULL,
  `utctime` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `callid_idx` (`callid`)
) ENGINE=InnoDB AUTO_INCREMENT=3188 DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_acc`
--

LOCK TABLES `kam_users_acc` WRITE;
/*!40000 ALTER TABLE `kam_users_acc` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_acc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_acc_cdrs`
--

DROP TABLE IF EXISTS `kam_users_acc_cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_users_acc_cdrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calldate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `duration` float(10,3) NOT NULL DEFAULT '0.000',
  `caller` varchar(128) DEFAULT NULL,
  `callee` varchar(128) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `subtype` varchar(64) DEFAULT NULL,
  `companyId` varchar(64) DEFAULT NULL,
  `companyName` varchar(64) DEFAULT NULL,
  `asIden` varchar(64) DEFAULT NULL,
  `asAddress` varchar(64) DEFAULT NULL,
  `callid` varchar(128) DEFAULT NULL,
  `xcallid` varchar(128) DEFAULT NULL,
  `parsed` enum('yes','no','error') DEFAULT 'no',
  `diversion` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `start_time_idx` (`start_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1892 DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_acc_cdrs`
--

LOCK TABLES `kam_users_acc_cdrs` WRITE;
/*!40000 ALTER TABLE `kam_users_acc_cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_acc_cdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_dialog`
--

DROP TABLE IF EXISTS `kam_users_dialog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_users_dialog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash_entry` int(10) unsigned NOT NULL,
  `hash_id` int(10) unsigned NOT NULL,
  `callid` varchar(255) NOT NULL,
  `from_uri` varchar(128) NOT NULL,
  `from_tag` varchar(64) NOT NULL,
  `to_uri` varchar(128) NOT NULL,
  `to_tag` varchar(64) NOT NULL,
  `caller_cseq` varchar(20) NOT NULL,
  `callee_cseq` varchar(20) NOT NULL,
  `caller_route_set` varchar(512) DEFAULT NULL,
  `callee_route_set` varchar(512) DEFAULT NULL,
  `caller_contact` varchar(128) NOT NULL,
  `callee_contact` varchar(128) NOT NULL,
  `caller_sock` varchar(64) NOT NULL,
  `callee_sock` varchar(64) NOT NULL,
  `state` int(10) unsigned NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `timeout` int(10) unsigned NOT NULL DEFAULT '0',
  `sflags` int(10) unsigned NOT NULL DEFAULT '0',
  `iflags` int(10) unsigned NOT NULL DEFAULT '0',
  `toroute_name` varchar(32) DEFAULT NULL,
  `req_uri` varchar(128) NOT NULL,
  `xdata` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hash_idx` (`hash_entry`,`hash_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_dialog`
--

LOCK TABLES `kam_users_dialog` WRITE;
/*!40000 ALTER TABLE `kam_users_dialog` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_dialog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_dialog_vars`
--

DROP TABLE IF EXISTS `kam_users_dialog_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_users_dialog_vars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash_entry` int(10) unsigned NOT NULL,
  `hash_id` int(10) unsigned NOT NULL,
  `dialog_key` varchar(128) NOT NULL,
  `dialog_value` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash_idx` (`hash_entry`,`hash_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_dialog_vars`
--

LOCK TABLES `kam_users_dialog_vars` WRITE;
/*!40000 ALTER TABLE `kam_users_dialog_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_dialog_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_dialplan`
--

DROP TABLE IF EXISTS `kam_users_dialplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_users_dialplan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dpid` int(11) NOT NULL,
  `pr` int(11) NOT NULL,
  `match_op` int(11) NOT NULL,
  `match_exp` varchar(64) NOT NULL,
  `match_len` int(11) NOT NULL,
  `subst_exp` varchar(64) NOT NULL,
  `repl_exp` varchar(64) NOT NULL,
  `attrs` varchar(64) NOT NULL,
  `transformationRulesetGroupsUsersId` binary(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kam_users_dialplan_ibfk_2` (`transformationRulesetGroupsUsersId`),
  CONSTRAINT `kam_users_dialplan_ibfk_2` FOREIGN KEY (`transformationRulesetGroupsUsersId`) REFERENCES `TransformationRulesetGroupsUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_dialplan`
--

LOCK TABLES `kam_users_dialplan` WRITE;
/*!40000 ALTER TABLE `kam_users_dialplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_dialplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `kam_users_domain`
--

DROP TABLE IF EXISTS `kam_users_domain`;
/*!50001 DROP VIEW IF EXISTS `kam_users_domain`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `kam_users_domain` (
  `domain` tinyint NOT NULL,
  `DID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kam_users_domain_attrs`
--

DROP TABLE IF EXISTS `kam_users_domain_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_users_domain_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_attrs_idx` (`did`,`name`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_domain_attrs`
--

LOCK TABLES `kam_users_domain_attrs` WRITE;
/*!40000 ALTER TABLE `kam_users_domain_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_domain_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_htable`
--

DROP TABLE IF EXISTS `kam_users_htable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_users_htable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key_name` varchar(64) NOT NULL DEFAULT '',
  `key_type` int(11) NOT NULL DEFAULT '0',
  `value_type` int(11) NOT NULL DEFAULT '0',
  `key_value` varchar(128) NOT NULL DEFAULT '',
  `expires` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_htable`
--

LOCK TABLES `kam_users_htable` WRITE;
/*!40000 ALTER TABLE `kam_users_htable` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_htable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_location`
--

DROP TABLE IF EXISTS `kam_users_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_users_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `contact` varchar(255) NOT NULL DEFAULT '',
  `received` varchar(128) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2030-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT '1.00',
  `callid` varchar(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int(11) NOT NULL DEFAULT '1',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cflags` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `socket` varchar(64) DEFAULT NULL,
  `methods` int(11) DEFAULT NULL,
  `instance` varchar(255) DEFAULT NULL,
  `reg_id` int(11) NOT NULL DEFAULT '0',
  `server_id` int(11) NOT NULL DEFAULT '0',
  `connection_id` int(11) NOT NULL DEFAULT '0',
  `keepalive` int(11) NOT NULL DEFAULT '0',
  `partition` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ruid_idx` (`ruid`),
  KEY `account_contact_idx` (`username`,`domain`,`contact`),
  KEY `expires_idx` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_location`
--

LOCK TABLES `kam_users_location` WRITE;
/*!40000 ALTER TABLE `kam_users_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_location_attrs`
--

DROP TABLE IF EXISTS `kam_users_location_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_users_location_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `aname` varchar(64) NOT NULL DEFAULT '',
  `atype` int(11) NOT NULL DEFAULT '0',
  `avalue` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `account_record_idx` (`username`,`domain`,`ruid`),
  KEY `last_modified_idx` (`last_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_location_attrs`
--

LOCK TABLES `kam_users_location_attrs` WRITE;
/*!40000 ALTER TABLE `kam_users_location_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_location_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_missed_calls`
--

DROP TABLE IF EXISTS `kam_users_missed_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_users_missed_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(16) NOT NULL DEFAULT '',
  `from_tag` varchar(64) NOT NULL DEFAULT '',
  `to_tag` varchar(64) NOT NULL DEFAULT '',
  `callid` varchar(255) NOT NULL DEFAULT '',
  `sip_code` varchar(3) NOT NULL DEFAULT '',
  `sip_reason` varchar(128) NOT NULL DEFAULT '',
  `src_ip` varchar(64) DEFAULT NULL,
  `from_user` varchar(64) DEFAULT NULL,
  `from_domain` varchar(64) DEFAULT NULL,
  `ruri_user` varchar(64) DEFAULT NULL,
  `ruri_domain` varchar(64) DEFAULT NULL,
  `cseq` int(10) unsigned DEFAULT NULL,
  `localtime` datetime NOT NULL,
  `utctime` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `callid_idx` (`callid`)
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_missed_calls`
--

LOCK TABLES `kam_users_missed_calls` WRITE;
/*!40000 ALTER TABLE `kam_users_missed_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_missed_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kam_users_usr_preferences`
--

DROP TABLE IF EXISTS `kam_users_usr_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kam_users_usr_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(128) NOT NULL DEFAULT '0',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(32) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `value` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `ua_idx` (`uuid`,`attribute`),
  KEY `uda_idx` (`username`,`domain`,`attribute`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='[ignore]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kam_users_usr_preferences`
--

LOCK TABLES `kam_users_usr_preferences` WRITE;
/*!40000 ALTER TABLE `kam_users_usr_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `kam_users_usr_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parsedCDRs`
--

DROP TABLE IF EXISTS `parsedCDRs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parsedCDRs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calldate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Llamada establecida pata 1',
  `src` varchar(128) DEFAULT NULL COMMENT 'Real Caller',
  `src_dialed` varchar(128) DEFAULT NULL COMMENT 'Dialed Number',
  `src_duration` int(10) unsigned DEFAULT NULL COMMENT 'Duracion llamada pata 1',
  `dst` varchar(128) DEFAULT NULL COMMENT 'Final Callee, numero llamado en pata 2',
  `dst_src_cid` varchar(128) DEFAULT NULL COMMENT 'Numero mostrado como origen en pata 2',
  `dst_duration` int(10) unsigned DEFAULT NULL COMMENT 'Duracion llamada pata 2',
  `type` varchar(256) DEFAULT NULL COMMENT 'Mucha miga, needs work',
  `desc` varchar(256) DEFAULT NULL,
  `fw_desc` varchar(256) DEFAULT NULL,
  `ext_forwarder` varchar(32) DEFAULT NULL,
  `oasis_forwarder` varchar(32) DEFAULT NULL,
  `forward_to` varchar(32) DEFAULT NULL,
  `companyId` binary(36) DEFAULT NULL,
  `brandId` int(10) unsigned DEFAULT NULL,
  `aleg` varchar(128) DEFAULT NULL COMMENT 'callid pata 1',
  `bleg` varchar(128) DEFAULT NULL COMMENT 'callid pata 2',
  `metered` tinyint(1) DEFAULT '0',
  `meteringDate` datetime DEFAULT '0000-00-00 00:00:00',
  `pricingPlanId` mediumint(8) unsigned DEFAULT NULL,
  `targetPatternId` mediumint(8) unsigned DEFAULT NULL,
  `price` decimal(10,3) DEFAULT NULL,
  `pricingPlanDetails` text,
  `invoiceId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brandId` (`brandId`),
  KEY `companyId` (`companyId`),
  KEY `pricingPlanId` (`pricingPlanId`),
  KEY `targetPatternId` (`targetPatternId`),
  KEY `invoiceId` (`invoiceId`),
  CONSTRAINT `parsedCDRs_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `parsedCDRs_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `parsedCDRs_ibfk_3` FOREIGN KEY (`pricingPlanId`) REFERENCES `PricingPlans` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `parsedCDRs_ibfk_4` FOREIGN KEY (`targetPatternId`) REFERENCES `TargetPatterns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `parsedCDRs_ibfk_5` FOREIGN KEY (`invoiceId`) REFERENCES `Invoices` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2388 DEFAULT CHARSET=latin1 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parsedCDRs`
--

LOCK TABLES `parsedCDRs` WRITE;
/*!40000 ALTER TABLE `parsedCDRs` DISABLE KEYS */;
/*!40000 ALTER TABLE `parsedCDRs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxyTrunks`
--

DROP TABLE IF EXISTS `proxyTrunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxyTrunks` (
  `id` binary(36) NOT NULL COMMENT '[uuid:php]',
  `TerminalModelId` binary(36) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sorcery_id` varchar(40) NOT NULL,
  `aors` varchar(200) DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) NOT NULL DEFAULT 'all',
  `allow` varchar(200) NOT NULL DEFAULT 'alaw',
  `direct_media` enum('yes','no') NOT NULL DEFAULT 'yes',
  `mailboxes_aors` varchar(100) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `send_pai` enum('yes','no') NOT NULL DEFAULT 'yes',
  `send_rpid` enum('yes','no') NOT NULL DEFAULT 'no',
  `contact` varchar(40) DEFAULT NULL,
  `default_expiration` int(11) DEFAULT NULL,
  `max_contacts` int(11) DEFAULT NULL,
  `minimum_expiration` int(11) DEFAULT NULL,
  `remove_existing` enum('yes','no') DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `maximum_expiration` int(11) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `password` varchar(25) NOT NULL DEFAULT '' COMMENT '[password]',
  `subscribecontext` varchar(40) NOT NULL DEFAULT 'default',
  `direct_media_method` varchar(64) DEFAULT 'update' COMMENT '[enum:update|invite|reinvite]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`sorcery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[entity]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxyTrunks`
--

LOCK TABLES `proxyTrunks` WRITE;
/*!40000 ALTER TABLE `proxyTrunks` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxyTrunks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `table_name` varchar(32) NOT NULL,
  `table_version` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `table_name_idx` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES ('ApplicationServers',5),('kam_address',6),('kam_dispatcher',4),('kam_trunks_acc',5),('kam_trunks_acc_cdrs',2),('kam_trunks_dialog',7),('kam_trunks_dialog_vars',1),('kam_trunks_dialplan',2),('kam_trunks_domain',2),('kam_trunks_domain_attrs',1),('kam_trunks_htable',2),('kam_trunks_missed_calls',4),('kam_trunks_uacreg',1),('kam_trunks_usr_preferences',2),('kam_users_acc',5),('kam_users_acc_cdrs',2),('kam_users_dialog',7),('kam_users_dialog_vars',1),('kam_users_dialplan',2),('kam_users_domain',2),('kam_users_domain_attrs',1),('kam_users_htable',2),('kam_users_location',8),('kam_users_location_attrs',1),('kam_users_missed_calls',4),('kam_users_subscriber',6),('kam_users_usr_preferences',2),('LcrRules',2),('LcrRuleTarget',1),('PeerServers',3);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `CDRs`
--

/*!50001 DROP TABLE IF EXISTS `CDRs`*/;
/*!50001 DROP VIEW IF EXISTS `CDRs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `CDRs` AS select 'proxyusers' AS `proxy`,`kam_users_acc_cdrs`.`id` AS `id`,`kam_users_acc_cdrs`.`calldate` AS `calldate`,`kam_users_acc_cdrs`.`start_time` AS `start_time`,`kam_users_acc_cdrs`.`end_time` AS `end_time`,`kam_users_acc_cdrs`.`duration` AS `duration`,`kam_users_acc_cdrs`.`caller` AS `caller`,`kam_users_acc_cdrs`.`callee` AS `callee`,`kam_users_acc_cdrs`.`type` AS `type`,`kam_users_acc_cdrs`.`subtype` AS `subtype`,`kam_users_acc_cdrs`.`companyId` AS `companyId`,`kam_users_acc_cdrs`.`companyName` AS `companyName`,`kam_users_acc_cdrs`.`asIden` AS `asIden`,`kam_users_acc_cdrs`.`asAddress` AS `asAddress`,`kam_users_acc_cdrs`.`callid` AS `callid`,`kam_users_acc_cdrs`.`xcallid` AS `xcallid`,`kam_users_acc_cdrs`.`parsed` AS `parsed`,`kam_users_acc_cdrs`.`diversion` AS `diversion` from `kam_users_acc_cdrs` union select 'proxytrunks' AS `proxy`,`kam_trunks_acc_cdrs`.`id` AS `id`,`kam_trunks_acc_cdrs`.`calldate` AS `calldate`,`kam_trunks_acc_cdrs`.`start_time` AS `start_time`,`kam_trunks_acc_cdrs`.`end_time` AS `end_time`,`kam_trunks_acc_cdrs`.`duration` AS `duration`,`kam_trunks_acc_cdrs`.`caller` AS `caller`,`kam_trunks_acc_cdrs`.`callee` AS `callee`,`kam_trunks_acc_cdrs`.`type` AS `type`,`kam_trunks_acc_cdrs`.`subtype` AS `subtype`,`kam_trunks_acc_cdrs`.`companyId` AS `companyId`,`kam_trunks_acc_cdrs`.`companyName` AS `companyName`,`kam_trunks_acc_cdrs`.`asIden` AS `asIden`,`kam_trunks_acc_cdrs`.`asAddress` AS `asAddress`,`kam_trunks_acc_cdrs`.`callid` AS `callid`,`kam_trunks_acc_cdrs`.`xcallid` AS `xcallid`,`kam_trunks_acc_cdrs`.`parsed` AS `parsed`,`kam_trunks_acc_cdrs`.`diversion` AS `diversion` from `kam_trunks_acc_cdrs` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CompanyAdmins`
--

/*!50001 DROP TABLE IF EXISTS `CompanyAdmins`*/;
/*!50001 DROP VIEW IF EXISTS `CompanyAdmins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `CompanyAdmins` AS select `Users`.`id` AS `id`,`Users`.`companyId` AS `companyId`,`Users`.`timezoneId` AS `timezoneId`,`Users`.`username` AS `username`,`Users`.`pass` AS `pass`,`Users`.`name` AS `name`,`Users`.`lastname` AS `lastname`,`Users`.`email` AS `email`,`Users`.`active` AS `active` from `Users` where (`Users`.`isCompanyAdmin` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ast_ps_aors`
--

/*!50001 DROP TABLE IF EXISTS `ast_ps_aors`*/;
/*!50001 DROP VIEW IF EXISTS `ast_ps_aors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ast_ps_aors` AS select `ast_ps_endpoints`.`sorcery_id` AS `sorcery_id`,`ast_ps_endpoints`.`contact` AS `contact`,`ast_ps_endpoints`.`default_expiration` AS `default_expiration`,`ast_ps_endpoints`.`mailboxes_aors` AS `mailboxes`,`ast_ps_endpoints`.`max_contacts` AS `max_contacts`,`ast_ps_endpoints`.`minimum_expiration` AS `minimum_expiration`,`ast_ps_endpoints`.`remove_existing` AS `remove_existing`,`ast_ps_endpoints`.`qualify_frequency` AS `qualify_frequency`,`ast_ps_endpoints`.`authenticate_qualify` AS `authenticate_qualify`,`ast_ps_endpoints`.`maximum_expiration` AS `maximum_expiration`,`ast_ps_endpoints`.`outbound_proxy` AS `outbound_proxy`,`ast_ps_endpoints`.`support_path` AS `support_path` from `ast_ps_endpoints` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ast_ps_endpoints`
--

/*!50001 DROP TABLE IF EXISTS `ast_ps_endpoints`*/;
/*!50001 DROP VIEW IF EXISTS `ast_ps_endpoints`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ast_ps_endpoints` AS select `Terminals`.`sorcery_id` AS `sorcery_id`,`Terminals`.`name` AS `name`,`Terminals`.`aors` AS `aors`,`Terminals`.`auth` AS `auth`,`Terminals`.`context` AS `context`,`Terminals`.`disallow` AS `disallow`,`Terminals`.`allow` AS `allow`,`Terminals`.`direct_media` AS `direct_media`,`Terminals`.`direct_media_method` AS `direct_media_method`,`Terminals`.`mailboxes_aors` AS `mailboxes_aors`,`Terminals`.`outbound_proxy` AS `outbound_proxy`,`Terminals`.`send_pai` AS `send_pai`,`Terminals`.`send_rpid` AS `send_rpid`,`Terminals`.`contact` AS `contact`,`Terminals`.`default_expiration` AS `default_expiration`,`Terminals`.`max_contacts` AS `max_contacts`,`Terminals`.`minimum_expiration` AS `minimum_expiration`,`Terminals`.`remove_existing` AS `remove_existing`,`Terminals`.`qualify_frequency` AS `qualify_frequency`,`Terminals`.`authenticate_qualify` AS `authenticate_qualify`,`Terminals`.`maximum_expiration` AS `maximum_expiration`,`Terminals`.`support_path` AS `support_path`,`Terminals`.`password` AS `password`,`Terminals`.`subscribecontext` AS `subscribecontext` from `Terminals` union select `proxyTrunks`.`sorcery_id` AS `sorcery_id`,`proxyTrunks`.`name` AS `name`,`proxyTrunks`.`aors` AS `aors`,`proxyTrunks`.`auth` AS `auth`,`proxyTrunks`.`context` AS `context`,`proxyTrunks`.`disallow` AS `disallow`,`proxyTrunks`.`allow` AS `allow`,`proxyTrunks`.`direct_media` AS `direct_media`,`proxyTrunks`.`direct_media_method` AS `direct_media_method`,`proxyTrunks`.`mailboxes_aors` AS `mailboxes_aors`,`proxyTrunks`.`outbound_proxy` AS `outbound_proxy`,`proxyTrunks`.`send_pai` AS `send_pai`,`proxyTrunks`.`send_rpid` AS `send_rpid`,`proxyTrunks`.`contact` AS `contact`,`proxyTrunks`.`default_expiration` AS `default_expiration`,`proxyTrunks`.`max_contacts` AS `max_contacts`,`proxyTrunks`.`minimum_expiration` AS `minimum_expiration`,`proxyTrunks`.`remove_existing` AS `remove_existing`,`proxyTrunks`.`qualify_frequency` AS `qualify_frequency`,`proxyTrunks`.`authenticate_qualify` AS `authenticate_qualify`,`proxyTrunks`.`maximum_expiration` AS `maximum_expiration`,`proxyTrunks`.`support_path` AS `support_path`,`proxyTrunks`.`password` AS `password`,`proxyTrunks`.`subscribecontext` AS `subscribecontext` from `proxyTrunks` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ast_ps_identify`
--

/*!50001 DROP TABLE IF EXISTS `ast_ps_identify`*/;
/*!50001 DROP VIEW IF EXISTS `ast_ps_identify`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ast_ps_identify` AS (select `proxyTrunks`.`sorcery_id` AS `sorcery_id`,`proxyTrunks`.`name` AS `endpoint`,substr(`proxyTrunks`.`contact`,5) AS `match`,'identify' AS `type` from `proxyTrunks`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kam_trunks_domain`
--

/*!50001 DROP TABLE IF EXISTS `kam_trunks_domain`*/;
/*!50001 DROP VIEW IF EXISTS `kam_trunks_domain`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kam_trunks_domain` AS select `Brands`.`domain` AS `domain`,`Brands`.`domain` AS `DID` from `Brands` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kam_users_domain`
--

/*!50001 DROP TABLE IF EXISTS `kam_users_domain`*/;
/*!50001 DROP VIEW IF EXISTS `kam_users_domain`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kam_users_domain` AS select `Brands`.`domain` AS `domain`,`Brands`.`domain` AS `DID` from `Brands` */;
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

-- Dump completed on 2016-04-06 15:31:30