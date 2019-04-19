CREATE DATABASE  IF NOT EXISTS `storesystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `storesystem`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: storesystem
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `ano` char(6) NOT NULL,
  `aname` varchar(50) NOT NULL,
  `apassword` varchar(20) NOT NULL,
  `aip` varchar(20) NOT NULL,
  `astatus` varchar(10) NOT NULL,
  `aremark` varchar(100) DEFAULT NULL,
  `alevel` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('111111','赵一','123456','192.118','在线','健康',20),('111211','钱二','123457','192.127','离线','病假',1),('111311','孙三','123458','192.135','在线','健康',2),('111411','李明','123459','192.143','在线','健康',2),('123146','田甜','123461','192.162','在线',NULL,2),('123459','陆娜','123462','192.172','离线',NULL,3),('156351','赵满','123460','192.152','离线','骨折',2),('545641','王文','456465','192.551','在线',NULL,3),('654634','王宇','548435','192.652','离线',NULL,3),('666666','超级管理员1号','123456','121.212','生病','无',100),('968966','李德','987661','192.111','离线',NULL,3);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer` (
  `bno` char(6) NOT NULL,
  `bpassword` varchar(20) NOT NULL,
  `bname` varchar(20) NOT NULL,
  `bremark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES ('311666','123456','赵笨笨','生病'),('312365','123456','梅尔',NULL),('369854','123456','爱德华',NULL),('654987','123456','娜美',NULL),('655459','123456','吕布',NULL),('687314','123456','罗克',NULL),('897564','123456','佐罗',NULL),('965234','123456','杨明羽',NULL),('981652','123456','路飞飞',NULL),('987532','123456','沙博',NULL);
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification`
--

DROP TABLE IF EXISTS `classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification` (
  `cno` char(5) NOT NULL,
  `cname` varchar(20) NOT NULL,
  `sno` char(3) NOT NULL,
  PRIMARY KEY (`cno`),
  KEY `fk_classifiction_sno` (`sno`),
  CONSTRAINT `fk_classifiction_sno` FOREIGN KEY (`sno`) REFERENCES `storehouse` (`sno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification`
--

LOCK TABLES `classification` WRITE;
/*!40000 ALTER TABLE `classification` DISABLE KEYS */;
INSERT INTO `classification` VALUES ('00101','水果','001'),('00102','蔬菜','001'),('00103','肉类','001'),('00201','零食','002'),('00202','甜点','002'),('00301','办公用品','003'),('00401','空调','004'),('00402','冰箱','004'),('00501','酒','005'),('00502','饮料','005'),('00601','成人用品','006');
/*!40000 ALTER TABLE `classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `getorder`
--

DROP TABLE IF EXISTS `getorder`;
/*!50001 DROP VIEW IF EXISTS `getorder`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `getorder` AS SELECT 
 1 AS `ono`,
 1 AS `cno`,
 1 AS `gno`,
 1 AS `bno`,
 1 AS `odate`,
 1 AS `onumber`,
 1 AS `omoney`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `getstorehouse`
--

DROP TABLE IF EXISTS `getstorehouse`;
/*!50001 DROP VIEW IF EXISTS `getstorehouse`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `getstorehouse` AS SELECT 
 1 AS `仓库编号`,
 1 AS `仓库名`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `gno` char(7) NOT NULL,
  `sno` char(3) NOT NULL,
  `cno` char(5) NOT NULL,
  `gname` varchar(20) NOT NULL,
  `gstocklimit` int(11) unsigned DEFAULT NULL,
  `gnowstock` int(11) unsigned DEFAULT NULL,
  `gremark` varchar(100) DEFAULT NULL,
  `gprice` float unsigned DEFAULT NULL,
  PRIMARY KEY (`gno`),
  KEY `fk_goods_sno` (`sno`),
  KEY `fk_goods_cno` (`cno`),
  CONSTRAINT `fk_goods_cno` FOREIGN KEY (`cno`) REFERENCES `classification` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_goods_sno` FOREIGN KEY (`sno`) REFERENCES `storehouse` (`sno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES ('0010101','001','00101','苹果',1000,168,'',5.98),('0010102','001','00101','香蕉',1000,187,'',2.54),('0010201','001','00102','胡萝卜',500,70,'',4.01),('0010301','001','00103','牛肉',1000,40,NULL,40.6),('0020101','002','00201','辣条',600,23,NULL,0.5),('0020201','002','00202','好丽友',800,200,NULL,3),('0020202','002','00202','小蛋糕',400,68,NULL,4),('0030101','003','00301','高级钢笔',600,300,NULL,98),('0030102','003','00301','狼毫',200,15,'',198),('0040101','004','00401','格力变频',500,160,NULL,3999),('0040102','004','00401','美的中央',25,10,NULL,15269),('0040201','004','00402','美的冰箱',100,25,NULL,2666),('0050101','005','00501','黄金酒',1000,10,NULL,500),('0050102','005','00501','贵州茅台',1000,250,NULL,1000),('0050103','005','00501','迎驾贡酒',1000,60,NULL,80),('0050201','005','00502','可口可乐',1000,400,NULL,3.5),('0050202','005','00502','芬达',1000,450,NULL,3.5),('0060101','006','00601','小娃娃',200,10,NULL,500);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ono` char(20) NOT NULL,
  `cno` char(5) NOT NULL,
  `gno` char(7) NOT NULL,
  `bno` char(6) NOT NULL,
  `odate` date NOT NULL,
  `onumber` int(11) unsigned DEFAULT NULL,
  `omoney` float unsigned DEFAULT NULL,
  PRIMARY KEY (`ono`),
  KEY `fk_oders_cno` (`cno`),
  KEY `fk_oders_gno` (`gno`),
  KEY `fk_oders_bno` (`bno`),
  CONSTRAINT `fk_oders_bno` FOREIGN KEY (`bno`) REFERENCES `buyer` (`bno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_oders_cno` FOREIGN KEY (`cno`) REFERENCES `classification` (`cno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_oders_gno` FOREIGN KEY (`gno`) REFERENCES `goods` (`gno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('1234567890','00201','0020101','311666','2017-11-01',50,25),('2017050498542586','00103','0010301','311666','2017-05-04',150,6090),('8798798789','00301','0030102','311666','2017-11-01',21,4158);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `rano` char(6) NOT NULL,
  `rtype` varchar(10) NOT NULL,
  `rtime` date NOT NULL,
  `rgname` varchar(20) NOT NULL,
  `rnumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES ('111111','出货','2017-11-03','苹果',20),('111111','进货','2017-11-03','苹果',100),('111111','出货','2017-11-03','苹果',12);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `saletable`
--

DROP TABLE IF EXISTS `saletable`;
/*!50001 DROP VIEW IF EXISTS `saletable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `saletable` AS SELECT 
 1 AS `商品名`,
 1 AS `数量`,
 1 AS `总金额`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `storehouse`
--

DROP TABLE IF EXISTS `storehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouse` (
  `sno` char(3) NOT NULL,
  `ano` char(6) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `sremark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `fk_storehouse_ano` (`ano`),
  CONSTRAINT `fk_storehouse_ano` FOREIGN KEY (`ano`) REFERENCES `administrator` (`ano`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouse`
--

LOCK TABLES `storehouse` WRITE;
/*!40000 ALTER TABLE `storehouse` DISABLE KEYS */;
INSERT INTO `storehouse` VALUES ('001','111111','1号仓',NULL),('002','111211','2号仓',NULL),('003','111311','3号仓',NULL),('004','111411','4号仓',NULL),('005','123146','5号仓',NULL),('006','156351','6号仓',NULL);
/*!40000 ALTER TABLE `storehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `suno` char(6) NOT NULL,
  `suname` varchar(20) NOT NULL,
  `suremark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`suno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('000001','开心农场',NULL),('000002','牛忙肉庄',NULL),('000003','达利园',NULL),('000004','城北文具',NULL),('000005','格力',NULL),('000006','美的',NULL),('000007','奥克斯',NULL),('000008','戴尔',NULL),('000009','五粮液',NULL),('000010','百年迎驾',NULL),('000011','茅台',NULL),('000012','可口可乐',NULL),('000013','秋名山公司',NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `topgoods`
--

DROP TABLE IF EXISTS `topgoods`;
/*!50001 DROP VIEW IF EXISTS `topgoods`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `topgoods` AS SELECT 
 1 AS `gno`,
 1 AS `sno`,
 1 AS `cno`,
 1 AS `gname`,
 1 AS `gstocklimit`,
 1 AS `gnowstock`,
 1 AS `gremark`,
 1 AS `gprice`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!50001 DROP VIEW IF EXISTS `userinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `userinfo` AS SELECT 
 1 AS `ID`,
 1 AS `姓名`,
 1 AS `备注`,
 1 AS `等级`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'storesystem'
--

--
-- Dumping routines for database 'storesystem'
--

--
-- Final view structure for view `getorder`
--

/*!50001 DROP VIEW IF EXISTS `getorder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getorder` AS select `orders`.`ono` AS `ono`,`orders`.`cno` AS `cno`,`orders`.`gno` AS `gno`,`orders`.`bno` AS `bno`,`orders`.`odate` AS `odate`,`orders`.`onumber` AS `onumber`,`orders`.`omoney` AS `omoney` from `orders` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getstorehouse`
--

/*!50001 DROP VIEW IF EXISTS `getstorehouse`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getstorehouse` AS select `storehouse`.`sno` AS `仓库编号`,`storehouse`.`sname` AS `仓库名` from `storehouse` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `saletable`
--

/*!50001 DROP VIEW IF EXISTS `saletable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `saletable` AS select `goods`.`gname` AS `商品名`,count(`orders`.`onumber`) AS `数量`,count(`orders`.`omoney`) AS `总金额` from (`goods` join `orders`) where (`goods`.`gno` = `orders`.`gno`) group by `goods`.`gname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `topgoods`
--

/*!50001 DROP VIEW IF EXISTS `topgoods`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `topgoods` AS select `goods`.`gno` AS `gno`,`goods`.`sno` AS `sno`,`goods`.`cno` AS `cno`,`goods`.`gname` AS `gname`,`goods`.`gstocklimit` AS `gstocklimit`,`goods`.`gnowstock` AS `gnowstock`,`goods`.`gremark` AS `gremark`,`goods`.`gprice` AS `gprice` from `goods` order by `goods`.`gnowstock` desc limit 0,10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userinfo`
--

/*!50001 DROP VIEW IF EXISTS `userinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userinfo` AS select `administrator`.`ano` AS `ID`,`administrator`.`aname` AS `姓名`,`administrator`.`aremark` AS `备注`,`administrator`.`alevel` AS `等级` from `administrator` */;
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

-- Dump completed on 2017-11-03 14:24:54
