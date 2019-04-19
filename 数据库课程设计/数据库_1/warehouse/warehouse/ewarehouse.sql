/*
SQLyog Community Edition- MySQL GUI v5.22a
Host - 5.0.41-community-nt : Database - ewarehouse
*********************************************************************
Server version : 5.0.41-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `ewarehouse`;

USE `ewarehouse`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `employeeinfotable` */

DROP TABLE IF EXISTS `employeeinfotable`;

CREATE TABLE `employeeinfotable` (
  `EmployeeId` varchar(45) NOT NULL COMMENT '职员ID(登录用)',
  `EmployeeName` varchar(45) NOT NULL COMMENT '职员名称',
  `Password` varchar(45) NOT NULL COMMENT '职员登陆密码',
  `Department` varchar(45) NOT NULL COMMENT '职员所属部门',
  `EmployeeTel` varchar(45) NOT NULL COMMENT '职员联系电话',
  `EmployeeEmail` varchar(45) NOT NULL COMMENT '职员E-mail',
  `LoginPower` int(10) unsigned default '0' COMMENT '职员登录权限',
  PRIMARY KEY  (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职员信息表';

/*Data for the table `employeeinfotable` */

insert  into `employeeinfotable`(`EmployeeId`,`EmployeeName`,`Password`,`Department`,`EmployeeTel`,`EmployeeEmail`,`LoginPower`) values ('fido','高智?','123','仓储部','67707504','fido@qq.com',1),('huangrenhe2007','黄仁和','123','财务部','67707505','huangrenhe@126.com',2),('jacob','黄健','123','管理部','67707507','jacob@126.com',3),('kiwi_yun','王蓓云','123','仓储部','67707506','kiwiyun@yahoo.com',2),('liuyingting','刘应霆','123','管理部','67707507','liuyingting@gmail.com',3),('michaelfan','樊梦臾','XCHILY','管理部门','13627280049','812537869@QQ.COM',0),('qianyulan','钱瑜兰','123','采购部','67707508','qianyulan@163.com',1),('sym','施怡敏','123','技术部','67708361','yuanguluyouyou@163.com',2);

/*Table structure for table `goodsinfotable` */

DROP TABLE IF EXISTS `goodsinfotable`;

CREATE TABLE `goodsinfotable` (
  `GoodsId` varchar(45) NOT NULL COMMENT '商品ID',
  `GoodsName` varchar(45) NOT NULL COMMENT '商品名称',
  `GoodsClassId` varchar(45) NOT NULL COMMENT '商品分类ID',
  `SuppliersId` varchar(45) NOT NULL COMMENT '供应商ID',
  `GoodsProductPlace` varchar(200) NOT NULL COMMENT '商品产地',
  `GoodsPrice` double unsigned NOT NULL COMMENT '商品采购价',
  `ModelOfGoods` varchar(200) NOT NULL COMMENT '商品型号',
  `VolumeOfGoods` double unsigned NOT NULL COMMENT '商品体积',
  PRIMARY KEY  (`GoodsId`),
  KEY `FK_goodsinfotable_1` (`GoodsClassId`),
  KEY `FK_goodsinfotable_2` (`SuppliersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息表';

/*Data for the table `goodsinfotable` */

insert  into `goodsinfotable`(`GoodsId`,`GoodsName`,`GoodsClassId`,`SuppliersId`,`GoodsProductPlace`,`GoodsPrice`,`ModelOfGoods`,`VolumeOfGoods`) values ('010001','飞利浦220X1SW','1','20080812001','北京',1699,'22英寸 淡蓝色 液晶',0.08),('010002','飞利浦220SW9','1','20080812001','北京',1150,'22英寸 黑色 液晶',0.087),('010003','华硕VK266H','1','20080812001','北京',2850,'25.5英寸 黑色 液晶',0.11),('010004','华硕LS221H','1','20080812001','北京',2300,'22英寸 黑色 液晶 皮革材质',0.09),('010005','飞利浦190CW9','1','20080812001','北京',950,'19英寸 黑色 液晶',0.08),('010006','华硕VW193D','1','20080812001','北京',950,'19英寸 蓝色 液晶',0.078),('010007','三星T220P','1','20080812001','北京',1560,'22英寸 蓝色 液晶',0.08),('010008','长城M2231','1','20090716001','杭州',1080,'21.5英寸 黑色 液晶',0.06),('010009','长城M932','1','20090716001','杭州',790,'18.5英寸 蓝色 液晶',0.05),('020001','联想超薄三代500G ','2','20090718001','上海',788,'500GB',0.008),('020002','希捷500GB 7200.12 16M(串口/散)','2','20090718001','上海',365,'500GB 台式机',0.007),('020003','希捷1TB 7200.12 32M(串口/散)','2','20090718001','上海',580,'1TB 台式机',0.009),('020004','日立1TB 7200转 7K1000(HDT721010SLA360)','2','20090718001','上海',520,'1TB 台式机',0.008),('020005','WD 808.8GB 32MB(绿版)','2','20090718001','上海',465,'808.8GB 台式机',0.008),('020006','WD 1TB 7200转 32MB(串口WD1001FALS)','2','20090718001','上海',670,'1TB 台式机',0.009),('020007','希捷Barracuda LP系列(ST32000542AS/2TB)','2','20090718001','上海',1590,'2TB 台式机',0.01),('020008','希捷160GB 7200.11 8MB（串口/散）','2','20090718001','上海',265,'160GB 台式机',0.007),('030001','七彩虹 键鼠光电套装 ','3','20080812001','北京',55,'黑色 光电套装',0.03),('030002','罗技无影手Pro 2400无线','3','20080812001','北京',200,'无线 USB 双开关 黑色',0.034),('030003','雷柏8900・Air纤薄.悬浮按键多媒体激光键鼠套装','3','20080812001','北京',438,'无线激光 USB 双开关 黑色白色',0.035),('030004','双飞燕零延迟无线光电套7100','3','20080812001','北京',168,'USB接口 主动跳频防干扰技术 无线键盘',0.038),('030005','新贵倾城之恋＠尚品KM-108','3','20080812001','北京',108,'时尚外观 USB接口',0.041),('030006','Razer Aurantia橘仓金蛛','3','20080812001','北京',320,'104个按键可通过宏命令进行 有线 USB接口',0.037),('040001','雅马哈YAMAHA NS-SW700重低音音响','4','20080812001','上海',5950,'NS-SW700 黑色 重低音',0.105),('050001','腾达 1024S 24口千兆交换机','5','20090718001','深圳',951,'1024S 24口 千兆',0.009),('060001','梅捷 A790GM3+ 主板 ','6','20080812001','珠江',759,'AMD SY-A790+ 单核',0.005),('060002','华硕 ASUS P5QL/EPU 主板','6','20080812001','台湾',704,'Intel 1.6GHz 单核',0.005),('070001','Intel 酷睿2双核 E7400 (盒)','7','20090716001','香港',770,'CORE 2 DUO 主频2793MHz',0.01),('080001','酷冷至尊毁灭者RC-K100','8','20090718001','台湾',299,'镀锌钢板 6.3kg',0.039),('080002','航嘉多核DH6','8','20090716001','天津',378,'20+4P、3个大4P、1个小4P  台式机类',0.006);

/*Table structure for table `goodsstocktable` */

DROP TABLE IF EXISTS `goodsstocktable`;

CREATE TABLE `goodsstocktable` (
  `GoodsId` varchar(45) NOT NULL COMMENT '商品ID',
  `GoodsNum` int(10) unsigned default NULL COMMENT '商品库存数量',
  `DistrictName` varchar(45) default NULL COMMENT '区位ID',
  PRIMARY KEY  (`GoodsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库存表';

/*Data for the table `goodsstocktable` */

insert  into `goodsstocktable`(`GoodsId`,`GoodsNum`,`DistrictName`) values ('010001',121,'A'),('010002',103,'A'),('010003',1206,'A'),('010004',158,'A'),('010005',100,'A'),('010006',90,'A'),('010007',121,'A'),('010008',100,'A'),('010009',191,'A'),('020001',5000,'B'),('030001',510,'C'),('040001',425,'D'),('050001',1500,'E'),('060001',1352,'F'),('060002',1635,'F'),('070001',1135,'G'),('080001',215,'H'),('080002',121,'H');

/*Table structure for table `goodstypetable` */

DROP TABLE IF EXISTS `goodstypetable`;

CREATE TABLE `goodstypetable` (
  `GoodsClassId` varchar(45) NOT NULL COMMENT '商品分类ID',
  `GoodsClassName` varchar(45) NOT NULL COMMENT '商品分类名称',
  PRIMARY KEY  (`GoodsClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类表';

/*Data for the table `goodstypetable` */

insert  into `goodstypetable`(`GoodsClassId`,`GoodsClassName`) values ('1','显示器'),('2','硬盘'),('3','键盘/鼠标'),('4','音箱'),('5','网络设备'),('6','主板'),('7','CPU'),('8','机箱/电源');

/*Table structure for table `instoreinfotable` */

DROP TABLE IF EXISTS `instoreinfotable`;

CREATE TABLE `instoreinfotable` (
  `DistrictId` varchar(45) NOT NULL COMMENT '区位ID',
  `DistrictName` varchar(45) NOT NULL COMMENT '区位名称',
  `GoodsClassId` varchar(45) default NULL COMMENT '商品分类ID',
  `DistrictVolume` double unsigned NOT NULL COMMENT '区位体积',
  `GoodVolumeMax` double unsigned default '0' COMMENT '警戒体积上限',
  `GoodVolumeMin` double unsigned default '0' COMMENT '警戒体积下限',
  `FreeVolume` double unsigned default NULL COMMENT '空闲体积',
  `Change1` varchar(45) default '0' COMMENT '用于修改',
  PRIMARY KEY  USING BTREE (`DistrictId`),
  KEY `FK_InstoreInfoTable_1` (`GoodsClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓储区域信息表; InnoDB free: 4096 kB; (`GoodsClassId`';

/*Data for the table `instoreinfotable` */

insert  into `instoreinfotable`(`DistrictId`,`DistrictName`,`GoodsClassId`,`DistrictVolume`,`GoodVolumeMax`,`GoodVolumeMin`,`FreeVolume`,`Change1`) values ('A','仓储A区','1',300,140,10,94.229,'0'),('B','仓储B区','2',80,65,35,40,'0'),('C','仓储C区','3',60,40,15,24.7,'0'),('D','仓储D区','4',120,100,40,75.375,'0'),('E','仓储E区','5',50,40,20,36.5,'0'),('F','仓储F区','6',40,35,10,25.065,'0'),('G','仓储G区','7',20,18,10,8.65,'0'),('H','仓储H区','8',65,45,20,55.889,'0');

/*Table structure for table `invoiceinfotable` */

DROP TABLE IF EXISTS `invoiceinfotable`;

CREATE TABLE `invoiceinfotable` (
  `InvoiceId` varchar(45) NOT NULL COMMENT '发货单ID',
  `GoodsId` varchar(45) NOT NULL COMMENT '商品ID',
  `ClientsId` varchar(45) NOT NULL COMMENT '客户ID',
  `EmployeeId` varchar(45) default NULL COMMENT '职员ID',
  `IGoodsNum` int(10) unsigned NOT NULL COMMENT '发货商品数量',
  `IDocMadeTime` datetime NOT NULL COMMENT '发货单单据生成时间',
  `EmployeeApprovalTime` datetime default NULL COMMENT '操作员确定时间',
  `IState` varchar(45) NOT NULL COMMENT '发货单据状态',
  `ID` int(10) unsigned NOT NULL auto_increment COMMENT '自动编号',
  PRIMARY KEY  (`ID`),
  KEY `FK_InvoiceInfoTable_1` (`GoodsId`),
  KEY `FK_InvoiceInfoTable_2` (`ClientsId`),
  KEY `FK_InvoiceInfoTable_3` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `invoiceinfotable` */

insert  into `invoiceinfotable`(`InvoiceId`,`GoodsId`,`ClientsId`,`EmployeeId`,`IGoodsNum`,`IDocMadeTime`,`EmployeeApprovalTime`,`IState`,`ID`) values ('20090803145227','010001','20090723002','jacob',1,'2009-08-03 14:52:34',NULL,'未处理',34),('20090803145227','010001','20090722001','jacob',2,'2009-08-03 14:52:44',NULL,'未处理',35),('20090803145227','010001','20090722001','jacob',0,'2009-08-05 10:49:14',NULL,'未处理',36),('20090803145227','010001','20090722001','jacob',1,'2009-08-05 10:49:29',NULL,'未处理',37);

/*Table structure for table `operaterecordtable` */

DROP TABLE IF EXISTS `operaterecordtable`;

CREATE TABLE `operaterecordtable` (
  `OperateId` int(10) unsigned NOT NULL auto_increment COMMENT '数据库操作记录编号',
  `EmployeeId` varchar(45) NOT NULL COMMENT '职员ID',
  `OperateType` varchar(45) NOT NULL COMMENT '操作类型:入库，出库，数据更新（盘点），单据更新',
  `OperateTime` datetime NOT NULL COMMENT '操作时间',
  `OperateInfo` varchar(400) default NULL COMMENT '操作内容',
  `AddInfo` varchar(400) default NULL COMMENT '备注',
  `Approval` varchar(45) default '0' COMMENT '部门管理者是否审批',
  PRIMARY KEY  (`OperateId`),
  KEY `FK_OperateRecordTable_1` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作记录表';

/*Data for the table `operaterecordtable` */

insert  into `operaterecordtable`(`OperateId`,`EmployeeId`,`OperateType`,`OperateTime`,`OperateInfo`,`AddInfo`,`Approval`) values (20090796,'huangrenhe2007','数据更新（盘点）','2009-07-29 09:36:11','010002的库存信息已更新',NULL,'0'),(20090803,'fido','出库','2009-07-29 15:08:43','20090729111649',NULL,'0'),(20090804,'fido','出库','2009-07-29 15:08:43','20090729131723',NULL,'0'),(20090805,'fido','出库','2009-07-29 15:08:43','20090729150535',NULL,'0'),(20090808,'huangrenhe2007','数据更新（盘点）','2009-07-29 17:29:50','010002的库存信息已更新',NULL,'0'),(20090810,'huangrenhe2007','数据更新（盘点）','2009-07-29 17:31:18','010001的库存信息已更新',NULL,'0'),(20090813,'huangrenhe2007','数据更新（盘点）','2009-07-30 09:00:46','010002的库存信息已更新',NULL,'0'),(20090815,'huangrenhe2007','数据更新（盘点）','2009-07-30 09:05:30','010002的库存信息已更新',NULL,'0'),(20090816,'huangrenhe2007','数据更新（盘点）','2009-07-30 09:05:33','010003的库存信息已更新',NULL,'0'),(20090817,'fido','入库','2009-07-30 09:15:29','20090725171219',NULL,'0'),(20090890,'fido','入库','2009-07-31 09:33:57','20090728103341',NULL,'0'),(20090891,'fido','入库','2009-07-31 09:33:57','20090728103341',NULL,'0'),(20090892,'fido','入库','2009-07-31 09:34:00','20090728105209',NULL,'0'),(20090893,'fido','出库','2009-07-31 09:45:39','20090731094441',NULL,'0'),(20090908,'fido','入库','2009-08-01 10:04:30','20090729165848',NULL,'0'),(20090909,'fido','入库','2009-08-01 10:04:30','20090729165848',NULL,'0'),(20090910,'fido','入库','2009-08-01 10:04:30','20090729165848',NULL,'0'),(20090911,'fido','入库','2009-08-01 10:04:30','20090729165848',NULL,'0'),(20090912,'fido','入库','2009-08-01 10:04:30','20090729165848',NULL,'0'),(20090913,'fido','入库','2009-08-01 10:04:30','20090729165848',NULL,'0'),(20090914,'fido','出库','2009-08-01 10:04:45','20090729111649',NULL,'0'),(20090915,'fido','出库','2009-08-01 10:04:45','20090729131723',NULL,'0'),(20090916,'fido','出库','2009-08-01 10:05:05','20090729111649',NULL,'0'),(20090917,'fido','出库','2009-08-01 10:05:05','20090729131723',NULL,'0'),(20090918,'fido','出库','2009-08-01 10:05:32','20090729111649',NULL,'0'),(20090919,'fido','出库','2009-08-01 10:05:32','20090729131723',NULL,'0'),(20090920,'fido','出库','2009-08-01 10:05:32','20090729150535',NULL,'0'),(20090921,'fido','出库','2009-08-01 10:05:32','20090731094441',NULL,'0'),(20090924,'fido','盘点','2009-08-01 14:26:34','010004','13','已审批'),(20090925,'fido','入库','2009-08-01 15:20:37','20090729131628',NULL,'0'),(20090926,'fido','入库','2009-08-01 15:20:37','20090729131628',NULL,'0'),(20090927,'fido','出库','2009-08-01 15:21:01','20090731095613',NULL,'0'),(20090928,'fido','出库','2009-08-01 15:21:01','20090731102019',NULL,'0'),(20090929,'fido','入库','2009-08-03 12:21:13','20090729150345',NULL,'0'),(20090930,'fido','入库','2009-08-03 12:21:13','20090729150345',NULL,'0'),(20090931,'fido','出库','2009-08-03 12:21:20','20090731095844',NULL,'0'),(20090932,'fido','盘点','2009-08-03 12:21:57','030001','66','已审批'),(20090933,'fido','盘点','2009-08-03 13:00:31','010001','66','已审批，并已更新数据库'),(20090959,'fido','盘点','2009-08-03 17:18:50','010007','12','已审批'),(20090960,'fido','盘点','2009-08-03 17:23:16','010001','90','已审批，并已更新数据库'),(20090961,'fido','盘点','2009-08-03 17:56:05','010001','63','已审批，并已更新数据库'),(20090962,'fido','盘点','2009-08-04 11:21:35','010008','50','已审批'),(20090963,'fido','盘点','2009-08-04 11:21:40','030001','66','已审批'),(20090964,'fido','盘点','2009-08-04 11:21:48','060002','80','已审批'),(20090965,'fido','盘点','2009-08-04 11:59:59','010001','12','已审批，并已更新数据库'),(20090966,'fido','盘点','2009-08-04 12:06:18','010001','12','已审批，并已更新数据库'),(20090967,'huangrenhe2007','数据更新（盘点）','2009-08-04 12:13:51','010001的库存信息已更新',NULL,'0'),(20090968,'fido','盘点','2010-07-19 10:39:17','010001','','未处理');

/*Table structure for table `stockininfotable` */

DROP TABLE IF EXISTS `stockininfotable`;

CREATE TABLE `stockininfotable` (
  `StockInId` varchar(45) NOT NULL COMMENT '入库单ID',
  `GoodsId` varchar(45) NOT NULL COMMENT '商品ID',
  `SuppliersId` varchar(45) NOT NULL COMMENT '供应商ID',
  `EmployeeId` varchar(45) default NULL COMMENT '职员ID',
  `SGoodsNum` int(10) unsigned NOT NULL COMMENT '入库商品数量',
  `SDocMadeTime` datetime NOT NULL COMMENT '入库单据生成时间',
  `StockInTime` datetime default NULL COMMENT '操作员操作时间',
  `SState` varchar(45) NOT NULL default '未处理' COMMENT '入库单据状态',
  `ID` int(10) unsigned NOT NULL auto_increment COMMENT '自动编号',
  PRIMARY KEY  (`ID`),
  KEY `FK_StockInInfoTable_2` (`SuppliersId`),
  KEY `FK_StockInInfoTable_3` (`EmployeeId`),
  KEY `FK_StockInInfoTable_1` (`GoodsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库单信息表';

/*Data for the table `stockininfotable` */

insert  into `stockininfotable`(`StockInId`,`GoodsId`,`SuppliersId`,`EmployeeId`,`SGoodsNum`,`SDocMadeTime`,`StockInTime`,`SState`,`ID`) values ('20090725171219','010002','20080812001','fido',13,'2009-07-25 17:12:33','2009-07-30 09:15:29','已处理',12),('20090727092526','010003','20080812001','fido',56,'2009-07-27 09:25:51','2009-07-30 09:20:13','已处理',13),('20090727092526','010001','20080812001','fido',45,'2009-07-27 09:26:05','2009-07-30 09:20:13','已处理',14),('20090728105209','010001','20080812001','jacob',2,'2009-07-28 10:52:18','2009-07-31 09:34:00','已处理',18),('20090728110011','010001','20080812001','jacob',23,'2009-07-28 11:00:16','2009-08-01 09:46:14','已处理',19),('20090728110011','010001','20080812001','jacob',11,'2009-07-28 11:00:19','2009-08-01 09:46:14','已处理',20),('20090728115527','010009','20090716001','fido',11,'2009-07-28 11:55:40','2009-08-01 09:55:30','已处理',22),('20090728140240','030002','20080812001','jacob',12,'2009-07-28 14:02:56','2009-08-01 09:55:36','已处理',23),('20090728140240','040001','20080812001','jacob',12,'2009-07-28 14:03:00','2009-08-01 09:55:36','已处理',24),('20090728140240','060001','20080812001','jacob',12,'2009-07-28 14:03:04','2009-08-01 09:55:36','已处理',25),('20090728140240','020001','20090718001','jacob',12,'2009-07-28 14:03:16','2009-08-01 09:55:36','已处理',26),('20090729131628','020002','20090718001','jacob',65,'2009-07-29 13:16:40','2009-08-01 15:20:37','已处理',29),('20090729131628','020005','20090718001','jacob',12,'2009-07-29 13:16:43','2009-08-01 15:20:37','已处理',30),('20090729150345','030004','20080812001','jacob',1,'2009-07-29 15:03:51','2009-08-03 12:21:13','已处理',31),('20090729150345','030004','20080812001','jacob',22,'2009-07-29 15:04:01','2009-08-03 12:21:13','已处理',32),('20090728110011','010001','20080812001','jacob',11,'2009-07-29 15:04:22','2009-08-01 09:46:14','已处理',33),('20090729161616','010004','20080812001','jacob',1,'2009-07-29 16:16:29','2009-08-03 13:05:36','已处理',37),('20090729161616','010004','20080812001','jacob',1,'2009-07-29 16:16:31','2009-08-03 13:05:36','已处理',38),('20090729161616','010004','20080812001','jacob',11,'2009-07-29 16:17:02','2009-08-03 13:05:36','已处理',39),('20090729161828','010001','20080812001','jacob',1,'2009-07-29 16:18:34','2009-08-03 13:34:15','已处理',45),('20090729161828','010001','20080812001','jacob',1,'2009-07-29 16:18:42','2009-08-03 13:34:15','已处理',50),('20090725171219','010001','20080812001','jacob',1,'2009-07-29 16:32:59','2009-07-30 09:15:29','已处理',51),('20090725171219','010007','20080812001','jacob',1,'2009-07-29 16:33:04','2009-07-30 09:15:29','已处理',52),('20090725171219','080001','20090718001','jacob',1,'2009-07-29 16:33:10','2009-07-30 09:15:29','已处理',53),('20090725171219','080002','20090716001','jacob',1,'2009-07-29 16:33:12','2009-07-30 09:15:29','已处理',54),('20090725171219','020002','20090718001','jacob',1,'2009-07-29 16:33:30','2009-07-30 09:15:29','已处理',55),('20090725171219','050001','20090718001','jacob',1,'2009-07-29 16:33:32','2009-07-30 09:15:29','已处理',56),('20090729165848','010001','20080812001','jacob',1,'2009-07-29 16:58:52','2009-08-01 10:04:30','已处理',57),('20090729165848','010001','20080812001','jacob',2,'2009-07-29 16:58:56','2009-08-01 10:04:30','已处理',58),('20090805110134','010001','20080812001','jacob',0,'2009-08-05 11:01:41',NULL,'未处理',59),('20090805110134','010001','20080812001','jacob',2,'2009-08-05 11:12:05',NULL,'未处理',60),('20090805110134','010001','20080812001','jacob',2,'2009-08-05 11:12:58',NULL,'未处理',61),('20090805110134','010001','20080812001','jacob',2,'2009-08-05 11:13:35',NULL,'未处理',62),('20090805110134','010001','20080812001','jacob',2,'2009-08-05 11:14:12',NULL,'未处理',63),('20090805110134','010001','20080812001','jacob',2,'2009-08-05 11:16:35',NULL,'未处理',64),('20090805110134','010001','20080812001','jacob',2,'2009-08-05 11:18:05',NULL,'未处理',65),('20090805110134','010001','20080812001','jacob',2,'2009-08-05 11:20:19',NULL,'未处理',66),('20090805110134','010001','20080812001','jacob',2,'2009-08-05 11:20:42',NULL,'未处理',67),('20090805110134','010001','20080812001','jacob',2,'2009-08-05 11:24:08',NULL,'未处理',68),('20090805110134','010001','20080812001','jacob',10,'2009-08-05 11:24:59',NULL,'未处理',69);

/*Table structure for table `suppliersinfotable` */

DROP TABLE IF EXISTS `suppliersinfotable`;

CREATE TABLE `suppliersinfotable` (
  `SuppliersId` varchar(45) NOT NULL COMMENT '供应商ID',
  `SuppliersName` varchar(45) NOT NULL COMMENT '供应商名称',
  `SuppliersChargePerson` varchar(45) NOT NULL COMMENT '供应商负责人',
  `SuppliersLocation` varchar(45) NOT NULL COMMENT '供应商地址',
  `SuppliersTel` varchar(45) NOT NULL COMMENT '供应商联系电话',
  `SuppliersEmail` varchar(45) NOT NULL COMMENT '供应商E-mail',
  PRIMARY KEY  (`SuppliersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商信息表';

/*Data for the table `suppliersinfotable` */

insert  into `suppliersinfotable`(`SuppliersId`,`SuppliersName`,`SuppliersChargePerson`,`SuppliersLocation`,`SuppliersTel`,`SuppliersEmail`) values ('20090716094324','上海艳辉电子有限公司','郭艳辉','上海市杨浦区松花江路','021-54876259','guoyanhui@sohoo.com'),('20090718144323','上海伟伟科技有限公司','高伟','上海市奉贤区芙蓉江路','021-58962458','gaowei@yahoo.com'),('20090724092538','上海普陀科技发展公司','Kathy','上海市普陀区祥林路200号','021-67708523','kathy@gmail.com'),('20090725123456','上海松江一鸣公司','王一鸣','上海市松江区文汇路600弄','021-67785964','wangyiming@110.com'),('20090801105610','上海医群科技股份有限公司','李医群','上海市静安区万发路1987号','021-67708459','liyiqun@126.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
