-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Papyrus
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `Fournis`
--

DROP TABLE IF EXISTS `Fournis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fournis` (
  `numfou` varchar(25) NOT NULL,
  `nomfou` varchar(25) NOT NULL,
  `ruefou` varchar(50) NOT NULL,
  `posfou` char(5) NOT NULL,
  `vilfou` varchar(30) NOT NULL,
  `confou` varchar(15) NOT NULL,
  `satisf` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`numfou`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fournis`
--

LOCK TABLES `Fournis` WRITE;
/*!40000 ALTER TABLE `Fournis` DISABLE KEYS */;
INSERT INTO `Fournis` VALUES ('1','jean','rue','80000','Amiens','confou',3),('120','GROGRIGAN','20 rue du papier','92200','papercity','Georges',8),('540','ECLIPSE','53 rue laisse flotter les rubans','78250','Bugbugville','Nestor',7),('8700','MEDICIS','120 rue des plantes','75014','Paris','Lison',NULL),('9120','DISCOBOL','11 rue des sports','85100','La Roche sur Yon','Hercule',8),('9150','DEPANPAP','26 avenue des locomotives','59987','Coroncountry','Pollux',5),('9180','HURRYTAPE','68 boulevard des octets','04044','Dumpville','Track',NULL);
/*!40000 ALTER TABLE `Fournis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produit`
--

DROP TABLE IF EXISTS `Produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produit` (
  `codart` varchar(4) NOT NULL,
  `libart` varchar(50) NOT NULL,
  `stkale` int(11) NOT NULL,
  `stkphy` int(11) NOT NULL,
  `qteann` int(11) NOT NULL,
  `unimes` varchar(50) NOT NULL,
  PRIMARY KEY (`codart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produit`
--

LOCK TABLES `Produit` WRITE;
/*!40000 ALTER TABLE `Produit` DISABLE KEYS */;
INSERT INTO `Produit` VALUES ('B001','Bande magnétique 1200',20,87,240,'unité'),('B002','Bande magnétique 6250',20,12,410,'unite'),('D035','CD R slim 80 mm',40,42,150,'B010'),('D050','CD R-W 80mm',50,4,0,'B010'),('I100','Papier 1 ex continu',100,557,3500,'B1000'),('I105','Papier 2 ex continu',75,5,2300,'B1000'),('I108','Papier 3 ex continu',200,557,3500,'B500'),('I110','Papier 4 ex continu',10,12,63,'B400'),('P220','Pré-imprimé commande',500,2500,24500,'B500'),('P230','Pré-imprimé facture',500,250,12500,'B500'),('P240','Pré-imprimé bulletin paie',500,3000,6250,'B500'),('P250','Pré-imprimé bon livraison',500,2500,24500,'B500'),('P270','Pré-imprimé bon fabrication',500,2500,24500,'B500'),('R080','ruban Epson 850',10,2,120,'unite'),('R132','ruban impl 1200 lignes',25,200,182,'unite');
/*!40000 ALTER TABLE `Produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vente`
--

DROP TABLE IF EXISTS `Vente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vente` (
  `codart` varchar(4) NOT NULL,
  `numfou` varchar(25) NOT NULL,
  `delliv` tinyint(4) NOT NULL,
  `qte1` int(11) DEFAULT NULL,
  `prix1` varchar(50) NOT NULL,
  `qte2` int(11) DEFAULT NULL,
  `prix2` varchar(50) DEFAULT NULL,
  `qte3` int(11) DEFAULT NULL,
  `prix3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codart`,`numfou`),
  KEY `numfou` (`numfou`),
  CONSTRAINT `Vente_ibfk_1` FOREIGN KEY (`codart`) REFERENCES `Produit` (`codart`),
  CONSTRAINT `Vente_ibfk_2` FOREIGN KEY (`numfou`) REFERENCES `Fournis` (`numfou`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vente`
--

LOCK TABLES `Vente` WRITE;
/*!40000 ALTER TABLE `Vente` DISABLE KEYS */;
INSERT INTO `Vente` VALUES ('B001','8700',15,0,'150',50,'145',100,'140'),('B002','8700',15,0,'210',50,'200',100,'185'),('D035','120',0,0,'40',0,'0',0,'0'),('D035','9120',5,0,'40',100,'30',0,'0'),('I100','120',90,0,'700',50,'600',120,'500'),('I100','540',70,0,'710',60,'630',100,'600'),('I100','9120',60,0,'800',70,'600',90,'500'),('I100','9150',90,0,'650',90,'600',200,'590'),('I100','9180',30,0,'720',50,'670',100,'490'),('I105','120',90,10,'705',50,'630',120,'500'),('I105','540',70,0,'810',60,'645',100,'600'),('I105','8700',30,0,'720',50,'670',100,'510'),('I105','9120',60,0,'920',70,'800',90,'700'),('I105','9150',90,0,'685',90,'600',200,'590'),('I108','120',90,5,'795',30,'720',100,'680'),('I108','9120',60,0,'920',70,'820',100,'780'),('I110','9120',60,0,'950',70,'850',90,'790'),('I110','9180',90,0,'900',70,'870',90,'835'),('P220','120',15,0,'3700',100,'3500',0,'0'),('P220','8700',20,50,'3500',100,'3350',0,'0'),('P230','120',30,0,'5200',100,'5000',0,'0'),('P230','8700',60,0,'5000',50,'4900',0,'0'),('P240','120',15,0,'2200',100,'2000',0,'0'),('P250','120',30,0,'1500',100,'1400',500,'1200'),('P250','9120',30,0,'1500',100,'1400',500,'1200'),('R080','9120',10,0,'120',100,'100',0,'0'),('R132','9120',5,0,'275',0,'0',0,'0');
/*!40000 ALTER TABLE `Vente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entcom`
--

DROP TABLE IF EXISTS `entcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entcom` (
  `numcom` int(11) NOT NULL,
  `obscom` varchar(50) DEFAULT NULL,
  `datcom` date NOT NULL,
  `numfou` varchar(25) NOT NULL,
  PRIMARY KEY (`numcom`),
  KEY `numfou` (`numfou`),
  CONSTRAINT `entcom_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `Fournis` (`numfou`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entcom`
--

LOCK TABLES `entcom` WRITE;
/*!40000 ALTER TABLE `entcom` DISABLE KEYS */;
INSERT INTO `entcom` VALUES (70010,NULL,'2007-02-10','120'),(70011,'Commande urgente','2007-03-01','540'),(70020,NULL,'2007-04-25','9180'),(70025,'Commande urgente','2007-04-30','9150'),(70210,'Commande cadencée','2007-05-05','120'),(70250,'Commande cadencée','2007-10-02','8700'),(70300,NULL,'2007-06-06','9120'),(70620,NULL,'2007-10-02','540'),(70625,NULL,'2007-10-09','120'),(70629,NULL,'2007-10-12','9180');
/*!40000 ALTER TABLE `entcom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligcom`
--

DROP TABLE IF EXISTS `ligcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ligcom` (
  `numlig` tinyint(4) NOT NULL,
  `qtecde` int(11) NOT NULL,
  `priuni` varchar(50) NOT NULL,
  `qteliv` int(11) DEFAULT NULL,
  `derliv` datetime NOT NULL,
  `codart` varchar(4) NOT NULL,
  `numcom` int(11) NOT NULL,
  KEY `codart` (`codart`),
  KEY `numcom` (`numcom`),
  KEY `numlig` (`numlig`) USING BTREE,
  CONSTRAINT `ligcom_ibfk_1` FOREIGN KEY (`codart`) REFERENCES `Produit` (`codart`),
  CONSTRAINT `ligcom_ibfk_2` FOREIGN KEY (`numcom`) REFERENCES `entcom` (`numcom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligcom`
--

LOCK TABLES `ligcom` WRITE;
/*!40000 ALTER TABLE `ligcom` DISABLE KEYS */;
INSERT INTO `ligcom` VALUES (1,3000,'470',3000,'2007-03-15 00:00:00','I100',70010),(2,2000,'485',2000,'2007-07-05 00:00:00','I105',70010),(3,1000,'680',1000,'2007-08-20 00:00:00','I108',70010),(4,200,'40',250,'2007-02-20 00:00:00','D035',70010),(5,6000,'3500',6000,'2007-03-31 00:00:00','P220',70010),(6,6000,'2000',2000,'2007-03-31 00:00:00','P240',70010),(1,1000,'600',1000,'2007-05-16 00:00:00','I105',70011),(1,200,'140',NULL,'2007-12-31 00:00:00','B001',70020),(2,200,'140',NULL,'2007-12-31 00:00:00','B002',70020),(1,1000,'590',1000,'2007-05-15 00:00:00','I100',70025),(2,500,'590',500,'2007-05-15 00:00:00','I105',70025),(1,1000,'470',1000,'2007-07-15 00:00:00','I100',70210),(2,10000,'3500',10000,'2007-08-31 00:00:00','P220',70010),(1,50,'790',50,'2007-10-31 00:00:00','I110',70300),(1,15000,'4900',12000,'2007-12-15 00:00:00','P230',70250),(2,10000,'3350',10000,'2007-11-10 00:00:00','P220',70250),(1,200,'600',200,'2007-11-01 00:00:00','I105',70620),(1,1000,'470',1000,'2007-10-15 00:00:00','I100',70625),(2,10000,'3500',10000,'2007-10-31 00:00:00','P220',70625),(1,200,'140',NULL,'2007-12-31 00:00:00','B001',70629),(2,200,'140',NULL,'2007-12-31 00:00:00','B002',70629);
/*!40000 ALTER TABLE `ligcom` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-05 14:10:38
