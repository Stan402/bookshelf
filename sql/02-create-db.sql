CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test`;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `printYear` int DEFAULT 0,
  `readAlready` boolean DEFAULT false,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `books` WRITE;


INSERT INTO `books` VALUES 
	(1,'Title1','some book called Title1','author1','1234560001',2001,false),
	(2,'Title2','some book called Title2','author2','1234560002',2002,TRUE),
	(3,'Title3','some book called Title3','author3','1234560003',2003,false),
	(4,'Title4','some book called Title4','author4','1234560004',2004,false),
	(5,'Title5','some book called Title5','author5','1234560005',2005,true),
	(6,'Title6','some book called Title6','author6','1234560006',2006,false),
	(7,'Title7','some book called Title7','author7','1234560007',2007,false),
	(8,'Title8','some book called Title8','author8','1234567001',2008,false),
	(9,'Title9','some book called Title9','author9','1234567002',2009,false),
	(10,'Title10','some book called Title10','author10','12345003',2010,false),
	(11,'Title11','some book called Title11','author11','1234567004',2011,false),
	(12,'Title12','some book called Title12','author12','1234567005',2012,false),
	(13,'Title13','some book called Title13','author13','1234567006',2013,false),
	(14,'Title14','some book called Title14','author14','1234567007',2014,false),
	(15,'Title15','some book called Title15','author15','1234567807',2015,false),
	(16,'Title16','some book called Title16','author1','1234567801',2001,false),
	(17,'Title17','some book called Title17','author2','1234567802',2002,false),
	(18,'Title18','some book called Title18','author3','1234567803',2003,false),
	(19,'Title19','some book called Title19','author4','1234567804',2004,false),
	(20,'Title20','some book called Title20','author5','1234567805',2005,false),
	(21,'Title21','some book called Title21','author6','1234567806',2006,false),
	(22,'Title22','some book called Title22','author7','1234567807',2007,false),
	(23,'Title23','some book called Title23','author8','1234567901',2008,false),
	(24,'Title24','some book called Title24','author9','1234567902',2009,false),
	(25,'Title25','some book called Title25','author10','1234567903',2010,false),
	(26,'Title26','some book called Title26','author11','1234567904',2011,false),
	(27,'Title27','some book called Title27','author12','1234567905',2012,false),
	(28,'Title28','some book called Title28','author13','1234567906',2013,false),
	(29,'Title29','some book called Title29','author14','1234567907',2014,false),
	(30,'Title30','some book called Title30','author15','1234567407',2015,false),
	(31,'Title31','some book called Title31','author14','1234567897',2017,false),
	(32,'Title32','some book called Title32','author15','1234567890',2017,false);

UNLOCK TABLES;

