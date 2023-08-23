-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: bbms
-- ------------------------------------------------------
-- Server version	5.5.62

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
-- Table structure for table `blood`
--

DROP TABLE IF EXISTS `blood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blood` (
  `Code` int(11) NOT NULL,
  `Did` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Code`),
  KEY `Did` (`Did`),
  CONSTRAINT `blood_ibfk_1` FOREIGN KEY (`Did`) REFERENCES `donor` (`DID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood`
--

LOCK TABLES `blood` WRITE;
/*!40000 ALTER TABLE `blood` DISABLE KEYS */;
INSERT INTO `blood` VALUES (1,1,500,1),(2,2,1000,2),(3,3,250,1),(4,4,1000,1),(5,5,1500,1);
/*!40000 ALTER TABLE `blood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodbank`
--

DROP TABLE IF EXISTS `bloodbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloodbank` (
  `BnkNo` int(11) NOT NULL,
  `Did` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phno` int(11) DEFAULT NULL,
  `issues` varchar(20) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BnkNo`),
  KEY `Did` (`Did`),
  CONSTRAINT `bloodbank_ibfk_1` FOREIGN KEY (`Did`) REFERENCES `donor` (`DID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodbank`
--

LOCK TABLES `bloodbank` WRITE;
/*!40000 ALTER TABLE `bloodbank` DISABLE KEYS */;
INSERT INTO `bloodbank` VALUES (1,1,'amlla',965871354,'no','odd'),(2,2,'bacd',96599354,'yes','qodd'),(3,3,'malall',78945122,'no','oius'),(4,4,'jabl',95647123,'no','ous');
/*!40000 ALTER TABLE `bloodbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodbankmanager`
--

DROP TABLE IF EXISTS `bloodbankmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloodbankmanager` (
  `Bno` int(11) DEFAULT NULL,
  `Empid` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phno` int(11) DEFAULT NULL,
  PRIMARY KEY (`Empid`),
  KEY `Bno` (`Bno`),
  CONSTRAINT `bloodbankmanager_ibfk_1` FOREIGN KEY (`Bno`) REFERENCES `bloodbank` (`BnkNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodbankmanager`
--

LOCK TABLES `bloodbankmanager` WRITE;
/*!40000 ALTER TABLE `bloodbankmanager` DISABLE KEYS */;
INSERT INTO `bloodbankmanager` VALUES (1,1,'ald',97845641),(2,2,'qoei',12345682),(3,3,'qcof',75315964),(4,4,'alfd',15923648);
/*!40000 ALTER TABLE `bloodbankmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details` (
  `email` varchar(30) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `details_ibfk_1` FOREIGN KEY (`email`) REFERENCES `donor` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
INSERT INTO `details` VALUES ('abaaadac@gmail.com','abadc'),('abaac@gmail.com','abadc'),('abc@gmail.com','abc'),('ac@gmail.com','cadl'),('baac@gmail.com','dc');
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor` (
  `DID` int(11) NOT NULL DEFAULT '0',
  `Blood_type` char(20) DEFAULT NULL,
  `Gender` char(3) DEFAULT NULL,
  `Health` char(10) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Phno` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DID`),
  UNIQUE KEY `un` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (1,'A+','M','good',20,985674120,'abc@gmail.com'),(2,'A+','M','good',20,975674220,'abaac@gmail.com'),(3,'B+','F','good',20,980587420,'abaaadac@gmail.com'),(4,'O+','M','good',30,468567420,'baac@gmail.com'),(5,'A+','F','bad',36,908579420,'ac@gmail.com'),(6,'AB+','M','good',45,95648217,'ababas@gmail.com'),(7,'AB-','F','good',38,69382714,'namas@gmail.com'),(8,'A+','M','good',0,74185296,'abcsd@gmail.com');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger emp_trigger before insert on donor 
for each row begin 
if new.age < 18 then set new.age = 0;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger immp_trigger 
after delete on donor
for each row 
begin 
insert into donor_log values(old.did,old.blood_type,old.gender,old.health,old.age,old.phno,old.email);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `donor_details`
--

DROP TABLE IF EXISTS `donor_details`;
/*!50001 DROP VIEW IF EXISTS `donor_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `donor_details` (
  `name` tinyint NOT NULL,
  `phno` tinyint NOT NULL,
  `gender` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `donor_log`
--

DROP TABLE IF EXISTS `donor_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor_log` (
  `did` int(11) DEFAULT NULL,
  `blood_type` varchar(29) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `health` varchar(30) DEFAULT NULL,
  `phno` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor_log`
--

LOCK TABLES `donor_log` WRITE;
/*!40000 ALTER TABLE `donor_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `donor_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `emergency`
--

DROP TABLE IF EXISTS `emergency`;
/*!50001 DROP VIEW IF EXISTS `emergency`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `emergency` (
  `name` tinyint NOT NULL,
  `bloodtype` tinyint NOT NULL,
  `age` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `Hno` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `request_no` int(11) DEFAULT NULL,
  `phno` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Hno`),
  KEY `request_no` (`request_no`),
  CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`request_no`) REFERENCES `requests` (`Rid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,'jagan',1,45127839,'vishakapatnam'),(2,'chandrababu',2,48521639,'vizag'),(3,'cbm',4,7531264,'jamjam'),(4,'cmr',5,45781236,'rajgam'),(5,'jayam',6,73192586,'polamml');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `isid` int(11) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`isid`),
  KEY `empid` (`empid`),
  CONSTRAINT `issues_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `bloodbankmanager` (`Empid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,'incomplete'),(2,2,'complete'),(3,4,'incomplete');
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!50001 DROP VIEW IF EXISTS `manager`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `manager` (
  `name` tinyint NOT NULL,
  `phno` tinyint NOT NULL,
  `isid` tinyint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `pid` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `Hno` int(11) DEFAULT NULL,
  `Gender` varchar(30) DEFAULT NULL,
  `Bloodtype` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `Hno` (`Hno`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`Hno`) REFERENCES `hospital` (`Hno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'asddd',1,'M','A+',21),(2,'addl',2,'M','B+',22),(3,'qpoad',3,'F','O+',35),(4,'jalaa',4,'M','B+',22),(5,'majam',5,'M','B+',55),(6,'maalfm',5,'M','B+',0);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger agecheck before insert on patient for each row begin if new.age < 0 then set new.age =0; end if; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `patient_details`
--

DROP TABLE IF EXISTS `patient_details`;
/*!50001 DROP VIEW IF EXISTS `patient_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `patient_details` (
  `name` tinyint NOT NULL,
  `Bloodtype` tinyint NOT NULL,
  `age` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receptionist` (
  `Did` int(11) DEFAULT NULL,
  `phno` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `Bnkno` int(11) DEFAULT NULL,
  `Empno` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Empno`),
  KEY `Did` (`Did`),
  KEY `Bnkno` (`Bnkno`),
  CONSTRAINT `receptionist_ibfk_1` FOREIGN KEY (`Did`) REFERENCES `donor` (`DID`),
  CONSTRAINT `receptionist_ibfk_2` FOREIGN KEY (`Bnkno`) REFERENCES `bloodbank` (`BnkNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptionist`
--

LOCK TABLES `receptionist` WRITE;
/*!40000 ALTER TABLE `receptionist` DISABLE KEYS */;
INSERT INTO `receptionist` VALUES (1,997456120,'ramgol',1,1),(2,784512963,'rewal',2,2),(3,210345675,'qwela',3,3),(4,745682193,'oolas',4,4);
/*!40000 ALTER TABLE `receptionist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `receptionist_entries`
--

DROP TABLE IF EXISTS `receptionist_entries`;
/*!50001 DROP VIEW IF EXISTS `receptionist_entries`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `receptionist_entries` (
  `Empno` tinyint NOT NULL,
  `address` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `Bno` int(11) DEFAULT NULL,
  `Rid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Rid`),
  KEY `Bno` (`Bno`),
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`Bno`) REFERENCES `bloodbank` (`BnkNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (2,1,1),(3,2,1),(4,3,3),(1,4,1),(1,5,2),(2,6,1),(2,7,3);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `donor_details`
--

/*!50001 DROP TABLE IF EXISTS `donor_details`*/;
/*!50001 DROP VIEW IF EXISTS `donor_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `donor_details` AS select `de`.`Name` AS `name`,`d`.`Phno` AS `phno`,`d`.`Gender` AS `gender` from (`donor` `d` join `details` `de`) where (`d`.`email` = `de`.`email`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `emergency`
--

/*!50001 DROP TABLE IF EXISTS `emergency`*/;
/*!50001 DROP VIEW IF EXISTS `emergency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emergency` AS select `patient`.`name` AS `name`,`patient`.`Bloodtype` AS `bloodtype`,`patient`.`age` AS `age` from `patient` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manager`
--

/*!50001 DROP TABLE IF EXISTS `manager`*/;
/*!50001 DROP VIEW IF EXISTS `manager`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manager` AS select `b`.`name` AS `name`,`b`.`phno` AS `phno`,`i`.`isid` AS `isid`,`i`.`status` AS `status` from (`bloodbankmanager` `b` join `issues` `i`) where (`b`.`Empid` = `i`.`empid`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_details`
--

/*!50001 DROP TABLE IF EXISTS `patient_details`*/;
/*!50001 DROP VIEW IF EXISTS `patient_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_details` AS select `patient`.`name` AS `name`,`patient`.`Bloodtype` AS `Bloodtype`,`patient`.`age` AS `age` from `patient` where (`patient`.`age` > 25) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `receptionist_entries`
--

/*!50001 DROP TABLE IF EXISTS `receptionist_entries`*/;
/*!50001 DROP VIEW IF EXISTS `receptionist_entries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `receptionist_entries` AS select `r`.`Empno` AS `Empno`,`r`.`address` AS `address` from (`receptionist` `r` join `donor` `d`) where (`r`.`Did` = `d`.`DID`) */;
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

-- Dump completed on 2022-08-06 13:12:57
