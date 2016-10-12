CREATE DATABASE  IF NOT EXISTS `byd_cm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `byd_cm`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: byd_cm
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `sys_city`
--

DROP TABLE IF EXISTS `sys_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '类型',
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `code` varchar(500) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`),
  KEY `type_pid` (`type`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_city`
--

LOCK TABLES `sys_city` WRITE;
/*!40000 ALTER TABLE `sys_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dist`
--

DROP TABLE IF EXISTS `sys_dist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '类型',
  `key` varchar(100) NOT NULL COMMENT '字典键',
  `name` varchar(100) NOT NULL COMMENT '字典值',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_type_key` (`type`,`key`),
  KEY `idx_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dist`
--

LOCK TABLES `sys_dist` WRITE;
/*!40000 ALTER TABLE `sys_dist` DISABLE KEYS */;
INSERT INTO `sys_dist` VALUES (1,'ZJLX','1','身份证',''),(2,'ZJLX','2','护照',''),(3,'XB','1','男',''),(4,'XB','2','女',''),(5,'JYCD','7','博士',''),(6,'JYCD','6','硕士',''),(7,'JYCD','5','本科',''),(8,'JYCD','4','大专',''),(9,'JYCD','3','中专及高中',''),(10,'JYCD','2','初中',''),(11,'JYCD','1','小学',''),(13,'FCLX','1','全款自购商品房',''),(14,'FCLX','2','全款自购经适房',''),(15,'FCLX','3','按揭自购商品房',''),(16,'FCLX','4','按揭自购经适房',''),(17,'FCLX','5','公司房',''),(18,'FCLX','6','直系亲属房',''),(19,'FCLX','7','租赁房',''),(20,'FCLX','8','自建房',''),(21,'FCLX','9','宅基地',''),(22,'FCLX','10','公产房',''),(23,'FCLX','11','小产权房',''),(24,'HYZK','1','单身',''),(25,'HYZK','2','已婚',''),(26,'HYZK','3','离婚',''),(27,'HYZK','4','丧偶',''),(28,'JTRS','1','1',''),(29,'JTRS','2','2',''),(30,'JTRS','3','3',''),(31,'JTRS','4','4',''),(32,'JTRS','5','5',''),(33,'JTRS','6','6',''),(34,'JTRS','7','7',''),(35,'JTRS','8','8',''),(36,'HYLX','1','采矿业',''),(37,'HYLX','2','制造业',''),(38,'HYLX','3','建筑业',''),(39,'HYLX','4','金融业',''),(40,'HYLX','5','房地产业',''),(41,'HYLX','6','教育',''),(42,'HYLX','7','国际组织',''),(43,'HYLX','8','批发和零售业',''),(44,'HYLX','9','住宿和餐饮业',''),(45,'HYLX','10','卫生和社会工作',''),(46,'HYLX','11','租赁和商务服务业',''),(47,'HYLX','12','交通运输、仓储和邮政业',''),(48,'HYLX','13','电力、热力、燃气及水生产和供应业',''),(49,'HYLX','14','居民服务、修理和其他服务业',''),(50,'HYLX','15','水利、环境和公共设施管理业',''),(51,'HYLX','16','信息传输、软件和信息技术服务业',''),(52,'HYLX','17','科学研究和技术服务业',''),(53,'HYLX','18','农、林、牧、渔业',''),(54,'HYLX','19','公共管理、社会保障和社会组织',''),(55,'HYLX','20','文化、体育和娱乐业',''),(56,'HYLX','21','其他',''),(57,'SFJC','1','是',''),(58,'SFJC','2','否',''),(59,'SFSP','1','是',''),(60,'SFSP','2','否',''),(61,'FKFS','1','全款',''),(62,'FKFS','2','贷款',''),(63,'HKZT','1','已还款',''),(64,'HKZT','2','未还款',''),(65,'HKZT','3','还款中',''),(66,'DQZT','1','正常',''),(67,'DQZT','2','异常',''),(68,'QYXZ','1','国有',''),(69,'QYXZ','2','集体',''),(70,'QYXZ','3','联营',''),(71,'QYXZ','4','股份制',''),(72,'QYXZ','5','私营',''),(73,'QYXZ','6','个体',''),(74,'QYXZ','7','合伙',''),(75,'DKQS','12','12期',''),(76,'DKQS','24','24期',''),(77,'DKQS','36','36期',''),(78,'SCGC','1','是',''),(79,'SCGC','2','否',''),(80,'YYHZSL','1','1',''),(81,'YYHZSL','2','2',''),(82,'YYHZSL','3','3',''),(83,'YYHZSL','4','4',''),(84,'YYHZSL','5','5',''),(85,'AZCDZ','1','是',''),(86,'AZCDZ','2','否',''),(87,'JXS','湖南岳迪汽车销售有限公司','湖南岳迪汽车销售有限公司',''),(88,'JXS','西安嘉丽实业有限公司','西安嘉丽实业有限公司',''),(89,'JXS','安徽金丰汽车销售服务有限公司','安徽金丰汽车销售服务有限公司',''),(90,'JXS','南充博宇车业有限公司','南充博宇车业有限公司',''),(91,'CXING','QIN','秦',''),(92,'CXING','G5','G5',''),(93,'CXING','S7','S7',''),(94,'CXING','SURUI','速锐',''),(95,'CXYS','天山白','天山白',''),(96,'CXYS','皓月银','皓月银',''),(97,'CXYS','魔力橙','魔力橙',''),(98,'CXYS','德兰黑','德兰黑',''),(99,'CXYS','巧克力棕','巧克力棕',''),(102,'CXI','旗舰版','旗舰版',''),(103,'CXI','豪华版','豪华版',''),(104,'CXI','尊贵版','尊贵版','');
/*!40000 ALTER TABLE `sys_dist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(20) NOT NULL COMMENT '菜单名',
  `uri` text COMMENT '链接',
  `is_menu` int(1) NOT NULL COMMENT '是否做为菜单',
  `sort_index` int(11) DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='系统-菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'客户信息','index.jspx',1,1),(2,0,'系统管理','#',1,10),(3,2,'用户管理','admin/user/list.jspx',1,1),(4,2,'角色管理','admin/role/list.jspx',1,2),(5,2,'菜单权限管理','admin/menu/list.jspx',1,3),(6,1,'客户信息查询','cm/list.jspx',1,2),(7,2,'组织机构管理','admin/org/list.jspx',1,4),(8,1,'新增客户信息','cm/add.jspx',1,3),(9,6,'修改客户信息','cm/edit.jspx',0,1),(10,6,'删除客户信息','cm/delete.do',0,2),(11,2,'字典管理','admin/dist/list.jspx',1,5);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_org`
--

DROP TABLE IF EXISTS `sys_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '类型',
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `code` varchar(500) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`),
  KEY `type_pid` (`type`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_org`
--

LOCK TABLES `sys_org` WRITE;
/*!40000 ALTER TABLE `sys_org` DISABLE KEYS */;
INSERT INTO `sys_org` VALUES (1,1,0,'深圳营销部',',1,'),(3,2,1,'宝安大区',',1,3,'),(4,2,1,'福田大区',',1,4,'),(5,2,1,'龙岗大区',',1,5,'),(6,2,1,'龙华大区',',1,6,'),(9,1,0,'上海营销部',',9,'),(10,2,9,'上海一区',',9,10,'),(11,2,9,'上海二区',',9,11,'),(12,2,9,'上海三区',',9,12,');
/*!40000 ALTER TABLE `sys_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名',
  `desc` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统-角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (2,'管理员','管理系统'),(3,'普通用户','普通用户');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='系统-角色-菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (74,3,1),(75,3,6),(76,3,8),(77,2,1),(78,2,6),(79,2,9),(80,2,10),(81,2,8),(82,2,2),(83,2,3),(84,2,4),(85,2,5),(86,2,7),(87,2,11);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除标识',
  `role_ids` varchar(500) DEFAULT NULL COMMENT '角色IDs',
  `role_names` varchar(500) DEFAULT NULL COMMENT '角色名s',
  `org_ids` varchar(1000) DEFAULT NULL COMMENT '可查询权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `username` (`username`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统-用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','f6fdffe48c908deb0f4c3bd36c032e72','管理员','','','2016-09-25 11:14:13','2016-10-10 23:15:36',0,',2,',',管理员,',',1,9,'),(2,'dw_jiangkunpeng','99800032b7d26893553ce81530e0f821','姜昆鹏','15899954940','jakey766@163.com','2016-09-25 11:14:40','2016-10-10 23:15:59',0,',3,2,',',普通用户,管理员,',',3,');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'byd_cm'
--

--
-- Dumping routines for database 'byd_cm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-12 22:47:39
