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
-- Table structure for table `cm_info`
--

DROP TABLE IF EXISTS `cm_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_yxb` int(11) DEFAULT NULL,
  `org_dq` int(11) DEFAULT NULL,
  `org_jxs` int(11) DEFAULT NULL,
  `org_code` varchar(500) DEFAULT NULL,
  `city_sf` int(11) DEFAULT NULL,
  `city_cs` int(11) DEFAULT NULL,
  `city_code` varchar(500) DEFAULT NULL,
  `sqr_xm` varchar(50) DEFAULT NULL COMMENT '申请人姓名',
  `sqr_zjlx` varchar(50) DEFAULT NULL COMMENT '申请人证件类型',
  `sqr_zjhm` varchar(100) DEFAULT NULL COMMENT '申请人证件号码',
  `sqr_dhhm` varchar(50) DEFAULT NULL COMMENT '申请人电话号码',
  `sjgcr_xm` varchar(50) DEFAULT NULL COMMENT '实际购车人姓名',
  `sjgcr_zjhm` varchar(50) DEFAULT NULL COMMENT '实际购车人证件号码',
  `sjgcr_dhhm` varchar(50) DEFAULT NULL COMMENT '实际购车人电话号码',
  `gsqrgx` varchar(50) DEFAULT NULL COMMENT '跟申请人关系',
  `hkzt` varchar(50) DEFAULT NULL COMMENT '还款状态',
  `xb` varchar(50) DEFAULT NULL COMMENT '性别',
  `nl` int(11) DEFAULT NULL COMMENT '年龄',
  `csrq` date DEFAULT NULL COMMENT '出生日期',
  `hyzk` varchar(50) DEFAULT NULL COMMENT '婚姻状况',
  `dqzt` varchar(50) DEFAULT NULL COMMENT '当前状态',
  `htbh` varchar(50) DEFAULT NULL COMMENT '合同编号',
  `htjhrq` date DEFAULT NULL COMMENT '合同激活日期',
  `sqtjrq` date DEFAULT NULL COMMENT '申请提交日期',
  `yf` int(11) DEFAULT NULL COMMENT '月份',
  `hzjjrq` date DEFAULT NULL COMMENT '核准拒绝日期',
  `zc` int(11) DEFAULT NULL COMMENT '周次',
  `cxi` varchar(50) DEFAULT NULL COMMENT '车系',
  `cxing` varchar(50) DEFAULT NULL COMMENT '车型',
  `cphm` varchar(50) DEFAULT NULL COMMENT '车牌号码',
  `vin` varchar(100) DEFAULT NULL COMMENT 'VIN号',
  `gcrq` date DEFAULT NULL COMMENT '购车日期',
  `jcrq` date DEFAULT NULL COMMENT '交车日期',
  `fkfs` varchar(50) DEFAULT NULL COMMENT '付款方式',
  `jszbh` varchar(50) DEFAULT NULL COMMENT '驾驶证编号',
  `jzdqr` date DEFAULT NULL COMMENT '驾照到期日',
  `jtrs` varchar(50) DEFAULT NULL COMMENT '家庭人数',
  `jycd` varchar(50) DEFAULT NULL COMMENT '教育程度',
  `dksqhm` varchar(50) DEFAULT NULL COMMENT '贷款申请号码',
  `hylx` int(11) DEFAULT NULL COMMENT '行业类型',
  `hyzlx` int(11) DEFAULT NULL COMMENT '行业子类型',
  `hyzlx_code` varchar(500) DEFAULT NULL COMMENT '行业子类型编号',
  `zylx` varchar(100) DEFAULT NULL COMMENT '职业类型',
  `hkszd` varchar(50) DEFAULT NULL COMMENT '户口所在地',
  `ysr` int(11) DEFAULT NULL COMMENT '月收入',
  `jkr_sf` int(11) DEFAULT NULL COMMENT '借款人省份',
  `jkr_cs` int(11) DEFAULT NULL COMMENT '借款人城市',
  `hkdz` varchar(200) DEFAULT NULL COMMENT '户口地址',
  `dzlx` varchar(50) DEFAULT NULL COMMENT '地址类型',
  `fclx` varchar(50) DEFAULT NULL COMMENT '房产类型',
  `jznx` int(11) DEFAULT NULL COMMENT '居住年限',
  `gsmc` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `qyxz` varchar(50) DEFAULT NULL COMMENT '企业性质',
  `zw` varchar(50) DEFAULT NULL COMMENT '职位',
  `gsdh` varchar(50) DEFAULT NULL COMMENT '公司电话',
  `dzy` varchar(200) DEFAULT NULL COMMENT '地址一',
  `gznx` int(11) DEFAULT NULL COMMENT '工作年限',
  `zcjg` double DEFAULT NULL COMMENT '资产价格',
  `csys` varchar(50) DEFAULT NULL COMMENT '车身颜色',
  `cpz` varchar(50) DEFAULT NULL COMMENT '产品组',
  `cplx` varchar(50) DEFAULT NULL COMMENT '产品类型',
  `dkqs` varchar(50) DEFAULT NULL COMMENT '贷款期数',
  `xsjg` double DEFAULT NULL COMMENT '销售价格',
  `sfkbl` double DEFAULT NULL COMMENT '首付款比例',
  `sfkje` double DEFAULT NULL COMMENT '首付款金额',
  `dkje` double DEFAULT NULL COMMENT '贷款金额',
  `khll` double DEFAULT NULL COMMENT '客户利率',
  `lxze` double DEFAULT NULL COMMENT '利息总额',
  `gcyhke` double DEFAULT NULL COMMENT '购车月还款额',
  `khsqbm` varchar(50) DEFAULT NULL COMMENT '客户申请编码',
  `jsr_xm` varchar(50) DEFAULT NULL COMMENT '介绍人姓名',
  `jsr_lxdh` varchar(50) DEFAULT NULL COMMENT '介绍人联系电话',
  `xqah` varchar(100) DEFAULT NULL COMMENT '兴趣爱好',
  `yyxhsl` varchar(50) DEFAULT NULL COMMENT '拥有小孩数量',
  `dygxhnljd` varchar(50) DEFAULT NULL COMMENT '第一个小孩年龄阶段',
  `degxhnljd` varchar(50) DEFAULT NULL COMMENT '第二个小孩年龄阶段',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sqr_zjhm` (`sqr_zjlx`),
  KEY `sjgcr_zjhm` (`sjgcr_zjhm`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_info`
--

LOCK TABLES `cm_info` WRITE;
/*!40000 ALTER TABLE `cm_info` DISABLE KEYS */;
INSERT INTO `cm_info` VALUES (1,0,0,0,NULL,1,3,',1,3,','张三',NULL,'123456','13800138000',NULL,NULL,NULL,'PY',NULL,'1',0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,'LC0CD4C37F1105125',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,1,3,13,',1,3,13,',1,4,',1,4,','姜昆鹏','身份证','123456','13800138000','卓鸿博','654321','13900139000','朋友','还款中','男',27,'1989-01-01','已婚','正常','123456','2016-10-23','2016-10-24',10,'2016-10-25',24,'旗舰版','秦','12345','1111','2016-10-20','2016-10-26','全款','3333','2016-10-31','5','本科','1234',-1,-1,NULL,NULL,NULL,0,-1,-1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(82,65,66,67,',65,66,67,',103,104,',103,104,','陈一','身份证','440281198003308411','18746921734',NULL,'',NULL,NULL,'Special-mention关注','女性',36,'1980-01-01','已婚','Converted','BZ100001','2015-03-23','2015-03-20',3,'2015-03-23',12,'旗舰版','秦',NULL,NULL,'2015-04-23',NULL,'全款','915058626','2017-01-02','3','本科','BX-A000002000',-1,-1,NULL,'国家机关、党群组织、企业、事业单位负责人','西安',12500,103,104,'陕西省西安市未央区凤城三路与朱宏路路口',NULL,'直系亲属房',8,'政府部门','国家行政机关单位','徐汇区法院主任',NULL,NULL,6,209800,'魔力橙','比亚迪--标准贷','标准贷款-等额本金（个人）','36期',146800,20,29360,14.49,0,26234.47,4041.83,'00000001','廖瀚卿','15989300244','打球','1','2',NULL,0),(83,65,66,67,',65,66,67,',103,104,',103,104,','吴二','身份证','440301198510142738','18746921735',NULL,'',NULL,NULL,'Special-mention关注','女性',31,'1985-01-01','已婚','Converted','BZ100002','2015-03-23','2015-03-20',3,'2015-03-23',12,'豪华版','秦',NULL,NULL,'2015-04-23',NULL,'贷款','915066589','2017-02-02','5','本科','BX-A000003000',-1,-1,NULL,'办事人员和有关人员','西安',9800,103,104,'陕西省西安市未央区凤城三路与朱宏路路口',NULL,'直系亲属房',10,'政府部门','国家行政机关单位','奉贤区法院院长兼党委书记',NULL,NULL,6,209800,'天山白','比亚迪--标准贷','标准贷款-等额本金（个人）','36期',146800,20,29360,14.49,0,26234.47,4041.83,'00000002','谷传明','13703176338','看书','1','1',NULL,0),(84,68,69,70,',68,69,70,',105,106,',105,106,','张三','身份证','230302199104184222','18746921736',NULL,'',NULL,NULL,'Pass正常','男性',25,'1991-01-01','未婚','Converted','BZ100003','2015-05-04','2015-04-23',4,'2015-04-24',17,'尊贵版','G5',NULL,NULL,'2015-06-04',NULL,'贷款','A16005939','2017-03-02','4','本科','BX-A000013001',-1,-1,NULL,'专业技术人员','六安',12000,105,106,'六安市金安区东方汽车城皖西大道南侧A52号',NULL,'自建房',12,'政府部门','国家行政机关单位','徐汇区法院院长兼党委书记',NULL,NULL,1,85900,'皓月银','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',76900,40,30760,14.49,0,11026.56,1587.96,'00000003','张嘉煜','13902900066','运动','0',NULL,NULL,0),(85,68,69,70,',68,69,70,',105,106,',105,106,','李四','身份证','22010419820822153X','18746921737',NULL,'',NULL,NULL,'Pass正常','男性',34,'1982-01-01','已婚','Converted','BZ100010','2015-05-08','2015-04-24',4,'2015-04-27',17,'尊贵版','速锐',NULL,NULL,'2015-06-08',NULL,'贷款','916011327','2017-04-02','5','初中','BX-A000015001',-1,-1,NULL,'专业技术人员','六安',7800,105,106,'六安市金安区东方汽车城皖西大道南侧A52号',NULL,'自建房',11,'政府部门','国家行政机关单位',' 金山区法院院长兼党委书记',NULL,NULL,10,73900,'德兰黑','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',73000,30,21900,14.49,0,12211.76,1758.66,'00000004','陈岳俊','13501557735','旅游','1','3',NULL,0),(86,71,72,73,',71,72,73,',2,6,',2,6,','王五','身份证','440181198708205174','18746921738',NULL,'',NULL,NULL,'Pass正常','男性',29,'1987-01-01','已婚','Converted','BZ100004','2015-05-04','2015-04-24',4,'2015-04-27',17,'尊贵版','F3',NULL,NULL,'2015-06-04',NULL,'贷款','916013025','2017-05-02','5','高中及中专','BX-A000016000',-1,-1,NULL,'办事人员和有关人员','长沙',5000,2,6,'长沙市雨花区经开区桃阳村黄谷路',NULL,'租赁房',3,'政府部门','国家行政机关单位',' 徐汇区法院政治部主任兼纪委书记',NULL,NULL,1,45900,'天山白','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',42900,30.07,12900,14.49,0,7169.28,1032.48,'00000005','王卓欤','15243602288','打球','1','2',NULL,0),(87,74,75,76,',74,75,76,',107,108,',107,108,','杨六','身份证','140102198905065178','18746921739',NULL,'',NULL,NULL,'Pass正常','男性',27,'1989-01-01','已婚','Converted','BZ100007','2015-05-06','2015-04-27',4,'2015-04-29',17,'旗舰版','S7',NULL,NULL,'2015-06-06',NULL,'贷款','916000476','2017-06-02','5','大专','BX-A000017000',-1,-1,NULL,'商业、服务业人员','南充',8600,107,108,'南充市高坪区航空港工业集中区',NULL,'租赁房',2,'上海艾领德国际贸易公司','外资','上海艾领德国际贸易公司董事长',NULL,NULL,5,116900,'巧克力棕','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',115900,30,34770,14.49,0,19388.48,2792.18,'00000006','朱卫国','13488659647','看书','1','1',NULL,0),(88,74,75,76,',74,75,76,',107,108,',107,108,','林七','身份证','440307198709054824','18746921740',NULL,'',NULL,NULL,'Pass正常','男性',29,'1987-01-01','已婚','Converted','BZ100008','2015-05-06','2015-04-27',4,'2015-04-28',17,'豪华版','S7',NULL,NULL,'2015-06-06',NULL,'贷款','916007181','2017-07-02','8','高中及中专','BX-A000018000',-1,-1,NULL,'专业技术人员','南充',13000,107,108,'南充市高坪区航空港工业集中区',NULL,'全款自购商品房',2,'政府部门','国家行政机关单位','武汉海关关长',NULL,NULL,5,116900,'天山白','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',116900,30,35070,14.49,0,19555.72,2816.27,'00000007','杨国平','18991902693','运动','2','3','1',0),(89,74,75,77,',74,75,77,',107,109,',107,109,','赵八','身份证','421002197212271423','18746921741',NULL,'',NULL,NULL,'Pass正常','男性',44,'1972-01-01','已婚','Converted','BZ100005','2015-05-05','2015-04-27',4,'2015-04-29',17,'豪华版','S7',NULL,NULL,'2015-06-05',NULL,'贷款','916005239','2017-08-02','5','初中','BX-A000020000',-1,-1,NULL,'专业技术人员','泸州',18000,107,109,'四川省泸州市纳溪区浙江产业园',NULL,'按揭自购商品房',2,'政府部门','国家行政机关单位','上海铁路局副局长',NULL,NULL,5,139900,'巧克力棕','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',139900,20.01,28000,14.49,0,26741.76,3851.16,'00000008','潘学刚','13611981186','旅游','1','15',NULL,0),(90,74,75,77,',74,75,77,',107,109,',107,109,','黄九','身份证','420105198811253678','18746921742',NULL,'',NULL,NULL,'Pass正常','男性',28,'1988-01-01','已婚','Converted','BZ100006','2015-05-05','2015-04-28',4,'2015-04-30',17,'豪华版','全新F3',NULL,NULL,'2015-06-05',NULL,'贷款','916010640','2017-09-02','4','高中及中专','BX-A000021001',-1,-1,NULL,'商业、服务业人员','泸州',6700,107,109,'四川省泸州市纳溪区浙江产业园',NULL,'全款自购商品房',3,'上海华勤通讯技术有限公司','合资','上海华勤通讯技术有限公司市场总监',NULL,NULL,1,51900,'雅典银','比亚迪--标准贷','标准贷款-等额本息（个人）','24期',45900,32.46,14900,14.49,0,4894.16,1495.59,'00000009','王强鹰','18016367263','打球','2','3','1',0),(91,65,66,78,',65,66,78,',103,110,',103,110,','江十','身份证','440301197403213818','18746921743',NULL,'',NULL,NULL,'Pass正常','男性',42,'1974-01-01','已婚','Converted','BZ100022','2015-05-20','2015-04-29',4,'2015-04-30',17,'旗舰版','S6',NULL,NULL,'2015-06-20',NULL,'贷款','A16007445','2017-10-02','5','大专','BX-A000023000',-1,-1,NULL,'专业技术人员','榆林',6000,103,110,'陕西省榆林市草海则小学旁',NULL,'自建房',8,'中国经营报','国家行政机关单位','中国经营报记者',NULL,NULL,8,109900,'天山白','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',103395,30,31018.5,14.49,0,17296.62,2490.92,'00000010','李延春','13809116467','看书','1','13',NULL,0),(92,74,75,77,',74,75,77,',107,109,',107,109,','吴一','身份证','370202198706240424','18746921744',NULL,'',NULL,NULL,'Pass正常','男性',29,'1987-01-01','已婚','Converted','BZ100050','2015-05-27','2015-05-04',5,'2015-05-05',18,'旗舰版','全新F3',NULL,NULL,'2015-06-27',NULL,'贷款','916007951','2017-11-02','4','高中及中专','BX-A000025000',-1,-1,NULL,'专业技术人员','泸州',5900,107,109,'四川省泸州市纳溪区浙江产业园',NULL,'租赁房',3,'政府部门','国家行政机关单位','上海市团委副书记、团市委常委、少年部部长',NULL,NULL,1,55900,'雅典银','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',54900,21.68,11900,14.49,0,10276.04,1479.89,'00000011','苏剑波','13661793223','运动','1','2',NULL,0),(93,71,79,80,',71,79,80,',112,113,',112,113,','陈二','身份证','432502196810141713','18746921745',NULL,'',NULL,NULL,'Pass正常','男性',48,'1968-01-01','已婚','Converted','BZ100009','2015-05-14','2015-05-05',5,'2015-05-05',18,'豪华版','速锐',NULL,NULL,'2015-06-14',NULL,'贷款','A16012773','2017-12-02','5','高中及中专','BX-A000032000',-1,-1,NULL,'生产、运输设备操作人员及有关人员','赣州',8600,112,113,'赣州经济技术开发迎宾大道南侧金潭路西侧',NULL,'自建房',4,'上海电气集团上海电机厂有限公司','国营','上海电气集团上海电机厂有限公司经理',NULL,NULL,1,83900,'瑞亚银','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',75600,31.22,23600,14.49,0,12427.04,1789.64,'00000012','刘建波','13608526297','旅游','2','15','9',0),(94,71,79,81,',71,79,81,',112,115,',112,115,','李三','身份证','421127198305232816','18746921746',NULL,'',NULL,NULL,'Pass正常','男性',33,'1983-01-01','已婚','Converted','BZ100019','2015-05-19','2015-05-05',5,'2015-05-06',18,'尊贵版','S6',NULL,NULL,'2015-06-19',NULL,'贷款','A15047009','2018-01-02','5','高中及中专','BX-A000034000',-1,-1,NULL,'办事人员和有关人员','宜春',5600,112,115,'江西省高安市新世纪工业城',NULL,'自建房',5,'上海胜佰太阳能科技有限公司','合资','上海胜佰太阳能科技有限公司商务总监',NULL,NULL,3,97900,'德兰黑','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',97900,30.54,29900,14.49,0,16250.44,2340.29,'00000013','刘建波','13608526297','打球','2','7','5',0),(95,74,75,76,',74,75,76,',107,108,',107,108,','张四','身份证','362401199211150023','18746921747',NULL,'',NULL,NULL,'Pass正常','男性',24,'1992-01-01','未婚','Converted','BZ100012','2015-05-14','2015-05-05',5,'2015-05-08',18,'尊贵版','G5',NULL,NULL,'2015-06-14',NULL,'贷款','915059417','2018-02-02','7','高中及中专','200000',-1,-1,NULL,'专业技术人员','南充',6000,107,108,'南充市高坪区航空港工业集中区',NULL,'自建房',7,'政府部门','国家行政机关单位','公务员',NULL,NULL,5,102900,'水晶白','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',99900,20,19980,14.49,0,19099.08,2750.53,'00000014','刘丹军','18673162177','看书','0',NULL,NULL,0),(96,68,69,82,',68,69,82,',105,118,',105,118,','杨五','身份证','310222198606280219','18746921748',NULL,'',NULL,NULL,'Pass正常','男性',30,'1986-01-01','已婚','Converted','BZ100047','2015-05-25','2015-05-06',5,'2015-05-06',18,'尊贵版','S7',NULL,NULL,'2015-06-25',NULL,'贷款','A15041704','2018-03-02','6','高中及中专','BX-A000030000',-1,-1,NULL,'商业、服务业人员','滁州',7800,105,118,'安微省滁州市丰乐大道2599号',NULL,'按揭自购商品房',4,'政府部门','国家行政机关单位','公务员',NULL,NULL,8,129900,'巧克力棕','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',127900,30,38370,14.49,0,21395.72,3081.27,'00000015','黄道铭','18662556999','运动','2','4','1',0),(97,71,79,83,',71,79,83,',120,121,',120,121,','王六','身份证','370727198411039459','18746921749',NULL,'',NULL,NULL,'Pass正常','女性',32,'1984-01-01','已婚','Converted','BZ100025','2015-05-20','2015-05-07',5,'2015-05-08',19,'尊贵版','F0',NULL,NULL,'2015-06-20',NULL,'贷款','A15069101','2018-04-02','5','本科','BX-A000046000',-1,-1,NULL,'商业、服务业人员','驻马店',4000,120,121,'驻马店市开源大道东段（市车管所旁）',NULL,'直系亲属房',3,'政府部门','国家行政机关单位','公务员',NULL,NULL,3,42900,'天山白','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',40000,30,12000,14.49,0,6691.4,963.65,'00000016','许金强','18621398181','旅游','1','5',NULL,0),(98,65,66,78,',65,66,78,',103,110,',103,110,','赵七','身份证','430626198003045122','18746921750',NULL,'',NULL,NULL,'Pass正常','女性',36,'1980-01-01','已婚','Converted','BZ100015','2015-05-20','2015-05-07',5,'2015-05-08',19,'旗舰版','G5',NULL,NULL,'2015-06-20',NULL,'贷款','915062340','2018-05-02','5','大专','BX-A000040000',-1,-1,NULL,'专业技术人员','榆林',7200,103,110,'陕西省榆林市草海则小学旁',NULL,'自建房',4,'银松公司','外资','银松公司总裁',NULL,NULL,0,93900,'天山白','比亚迪--标准贷','标准贷款-等额本息（个人）','24期',90000,30,27000,14.49,0,9946.08,3039.42,'00000017','黎宾','13817212368','打球','1','8',NULL,0),(99,65,66,78,',65,66,78,',103,110,',103,110,','林八','身份证','510132198412086662','18746921751',NULL,'',NULL,NULL,'Doubtful可疑','男性',32,'1984-01-01','已婚','Converted','BZ100021','2015-05-20','2015-05-07',5,'2015-05-08',19,'豪华版','F3',NULL,NULL,'2015-06-20',NULL,'贷款','916003142','2018-06-02','4','大专','BX-A000045000',-1,-1,NULL,'办事人员和有关人员','榆林',4500,103,110,'陕西省榆林市草海则小学旁',NULL,'自建房',2,'政府部门','国家行政机关单位','经信委',NULL,NULL,1,50900,'天山白','比亚迪--标准贷','标准贷款-等额本息（个人）','12期',47000,20,9400,14.49,0,3016.04,3384.67,'00000018','黎宾','13817212368','看书','2','4','2',0),(100,68,69,70,',68,69,70,',105,106,',105,106,','江九','身份证','430105199305121325','18746921752',NULL,'',NULL,NULL,'Pass正常','男性',23,'1993-01-01','未婚','Converted','BZ100017','2015-05-19','2015-05-07',5,'2015-05-07',19,'豪华版','S7',NULL,NULL,'2015-06-19',NULL,'贷款','916003143','2018-07-02','5','大专','BX-A000035000',-1,-1,NULL,'办事人员和有关人员','六安',9000,105,106,'六安市金安区东方汽车城皖西大道南侧A52号',NULL,'按揭自购商品房',3,'政府部门','国家行政机关单位','中央人民广播电台副总',NULL,NULL,1,129900,'德兰黑','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',126900,30,38070,14.49,0,21228.48,3057.18,'00000019','高晋琪','13997056995','运动','0',NULL,NULL,0),(101,68,69,82,',68,69,82,',105,118,',105,118,','黄十','身份证','120106199303060020','18746921753',NULL,'',NULL,NULL,'Pass正常','男性',23,'1993-01-01','未婚','Converted','BZ100041','2015-05-28','2015-05-07',5,'2015-05-07',19,'豪华版','全新F3',NULL,NULL,'2015-06-28',NULL,'贷款','916003144','2018-08-02','6','大专','BX-A000038000',-1,-1,NULL,'生产、运输设备操作人员及有关人员','滁州',8200,105,118,'安微省滁州市丰乐大道2599号',NULL,'公司房',4,'政府部门','国家行政机关单位','中国人民对外友好协会拉美处主管',NULL,NULL,2,55900,'德兰黑','比亚迪--标准贷','标准贷款-等额本息（个人）','36期',50385,20,10077,14.49,0,9632.64,1387.24,'00000020','周爱涛','15000181806','旅游','0',NULL,NULL,0);
/*!40000 ALTER TABLE `cm_info` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dist`
--

LOCK TABLES `sys_dist` WRITE;
/*!40000 ALTER TABLE `sys_dist` DISABLE KEYS */;
INSERT INTO `sys_dist` VALUES (1,'ZJLX','1','身份证',''),(2,'ZJLX','2','护照',''),(3,'XB','1','男',''),(4,'XB','2','女',''),(5,'JYCD','7','博士',''),(6,'JYCD','6','硕士',''),(7,'JYCD','5','本科',''),(8,'JYCD','4','大专',''),(9,'JYCD','3','中专及高中',''),(10,'JYCD','2','初中',''),(11,'JYCD','1','小学',''),(13,'FCLX','1','全款自购商品房',''),(14,'FCLX','2','全款自购经适房',''),(15,'FCLX','3','按揭自购商品房',''),(16,'FCLX','4','按揭自购经适房',''),(17,'FCLX','5','公司房',''),(18,'FCLX','6','直系亲属房',''),(19,'FCLX','7','租赁房',''),(20,'FCLX','8','自建房',''),(21,'FCLX','9','宅基地',''),(22,'FCLX','10','公产房',''),(23,'FCLX','11','小产权房',''),(24,'HYZK','1','单身',''),(25,'HYZK','2','已婚',''),(26,'HYZK','3','离婚',''),(27,'HYZK','4','丧偶',''),(28,'JTRS','1','1',''),(29,'JTRS','2','2',''),(30,'JTRS','3','3',''),(31,'JTRS','4','4',''),(32,'JTRS','5','5',''),(33,'JTRS','6','6',''),(34,'JTRS','7','7',''),(35,'JTRS','8','8',''),(61,'FKFS','1','全款',''),(62,'FKFS','2','贷款',''),(63,'HKZT','1','已还款',''),(64,'HKZT','2','未还款',''),(65,'HKZT','3','还款中',''),(66,'DQZT','1','正常',''),(67,'DQZT','2','异常',''),(68,'QYXZ','1','国有',''),(69,'QYXZ','2','集体',''),(70,'QYXZ','3','联营',''),(71,'QYXZ','4','股份制',''),(72,'QYXZ','5','私营',''),(73,'QYXZ','6','个体',''),(74,'QYXZ','7','合伙',''),(75,'DKQS','12','12期',''),(76,'DKQS','24','24期',''),(77,'DKQS','36','36期',''),(80,'YYHZSL','1','1',''),(81,'YYHZSL','2','2',''),(82,'YYHZSL','3','3',''),(83,'YYHZSL','4','4',''),(84,'YYHZSL','5','5',''),(91,'CXING','QIN','秦',''),(92,'CXING','G5','G5',''),(93,'CXING','S7','S7',''),(94,'CXING','SURUI','速锐',''),(95,'CXYS','天山白','天山白',''),(96,'CXYS','皓月银','皓月银',''),(97,'CXYS','魔力橙','魔力橙',''),(98,'CXYS','德兰黑','德兰黑',''),(99,'CXYS','巧克力棕','巧克力棕',''),(102,'CXI','旗舰版','旗舰版',''),(103,'CXI','豪华版','豪华版',''),(104,'CXI','尊贵版','尊贵版',''),(105,'LZGX','FQ','夫妻',''),(106,'LZGX','FZN','父子/女',''),(107,'LZGX','PY','朋友',''),(108,'ZYLX','1','公务员',''),(109,'ZYLX','100','其他',''),(110,'HKZT','Special-mention关注','Special-mention关注','导入时系统自动添加'),(111,'DQZT','Converted','Converted','导入时系统自动添加'),(112,'ZJLX','身份证','身份证','导入时系统自动添加'),(113,'HYZK','已婚','已婚','导入时系统自动添加'),(114,'XB','女性','女性','导入时系统自动添加'),(115,'JYCD','本科','本科','导入时系统自动添加'),(116,'ZYLX','国家机关、党群组织、企业、事业单位负责人','国家机关、党群组织、企业、事业单位负责人','导入时系统自动添加'),(117,'FCLX','直系亲属房','直系亲属房','导入时系统自动添加'),(118,'QYXZ','国家行政机关单位','国家行政机关单位','导入时系统自动添加'),(119,'CXING','秦','秦','导入时系统自动添加'),(120,'ZYLX','办事人员和有关人员','办事人员和有关人员','导入时系统自动添加'),(121,'HKZT','Pass正常','Pass正常','导入时系统自动添加'),(122,'HYZK','未婚','未婚','导入时系统自动添加'),(123,'XB','男性','男性','导入时系统自动添加'),(124,'ZYLX','专业技术人员','专业技术人员','导入时系统自动添加'),(125,'FCLX','自建房','自建房','导入时系统自动添加'),(126,'JYCD','初中','初中','导入时系统自动添加'),(127,'CXING','速锐','速锐','导入时系统自动添加'),(128,'JYCD','高中及中专','高中及中专','导入时系统自动添加'),(129,'FCLX','租赁房','租赁房','导入时系统自动添加'),(130,'CXING','F3','F3','导入时系统自动添加'),(131,'JYCD','大专','大专','导入时系统自动添加'),(132,'ZYLX','商业、服务业人员','商业、服务业人员','导入时系统自动添加'),(133,'QYXZ','外资','外资','导入时系统自动添加'),(134,'FCLX','全款自购商品房','全款自购商品房','导入时系统自动添加'),(135,'FCLX','按揭自购商品房','按揭自购商品房','导入时系统自动添加'),(136,'QYXZ','合资','合资','导入时系统自动添加'),(137,'CXING','全新F3','全新F3','导入时系统自动添加'),(138,'CXYS','雅典银','雅典银','导入时系统自动添加'),(139,'CXING','S6','S6','导入时系统自动添加'),(140,'ZYLX','生产、运输设备操作人员及有关人员','生产、运输设备操作人员及有关人员','导入时系统自动添加'),(141,'QYXZ','国营','国营','导入时系统自动添加'),(142,'CXYS','瑞亚银','瑞亚银','导入时系统自动添加'),(143,'CXYS','水晶白','水晶白','导入时系统自动添加'),(144,'CXING','F0','F0','导入时系统自动添加'),(145,'HKZT','Doubtful可疑','Doubtful可疑','导入时系统自动添加'),(146,'FCLX','公司房','公司房','导入时系统自动添加'),(147,'FKFS','全款','全款','导入时系统自动添加'),(148,'FKFS','贷款','贷款','导入时系统自动添加'),(149,'YYHZSL','0','0','导入时系统自动添加'),(150,'LZGX','朋友','朋友','导入时系统自动添加'),(151,'HKZT','还款中','还款中','导入时系统自动添加'),(152,'XB','男','男','导入时系统自动添加'),(153,'DQZT','正常','正常','导入时系统自动添加'),(154,'DKQS','36期','36期','导入时系统自动添加'),(155,'DKQS','24期','24期','导入时系统自动添加'),(156,'DKQS','12期','12期','导入时系统自动添加');
/*!40000 ALTER TABLE `sys_dist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_field`
--

DROP TABLE IF EXISTS `sys_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_field` (
  `fname` varchar(100) NOT NULL COMMENT '字段名',
  `sname` varchar(100) NOT NULL COMMENT '显示字段名',
  `name` varchar(100) NOT NULL COMMENT '显示名',
  `stype` varchar(50) NOT NULL COMMENT '展现类型',
  `ftype` varchar(50) NOT NULL COMMENT '数据类型',
  `dist_type` varchar(50) DEFAULT NULL COMMENT '字典类型',
  `dist_key` varchar(100) DEFAULT NULL COMMENT '字典值',
  `tree_level` int(11) NOT NULL DEFAULT '0' COMMENT '树层次',
  `list` int(1) NOT NULL DEFAULT '0' COMMENT '0:不放入列表,1:放入列表',
  `query` int(1) NOT NULL DEFAULT '0' COMMENT '0:不做为查询条件,1:做为查询条件',
  `layer_width` int(4) NOT NULL DEFAULT '1' COMMENT '占宽',
  `sort_index` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `jrgs_name` varchar(100) DEFAULT NULL COMMENT '金融公司表格名',
  `bb_name` varchar(100) DEFAULT NULL COMMENT '八部系统表格名',
  `xfxt_name` varchar(100) DEFAULT NULL COMMENT '销服系统表格名',
  PRIMARY KEY (`fname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字段配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_field`
--

LOCK TABLES `sys_field` WRITE;
/*!40000 ALTER TABLE `sys_field` DISABLE KEYS */;
INSERT INTO `sys_field` VALUES ('city_cs','city_cs_show','城市','tree','int','CITY',NULL,2,1,1,1,5,NULL,NULL,NULL),('city_sf','city_sf_show','省份','tree','int','CITY','city_cs',1,1,1,1,4,NULL,NULL,NULL),('cphm','cphm','车牌号码','text','string',NULL,NULL,0,0,0,1,27,NULL,NULL,NULL),('cplx','cplx','产品类型','text','string',NULL,NULL,0,0,0,1,57,NULL,NULL,NULL),('cpz','cpz','产品组','text','string',NULL,NULL,0,0,0,1,56,NULL,NULL,NULL),('csys','csys_show','车身颜色','dist','string','CXYS',NULL,0,0,0,1,55,NULL,NULL,NULL),('cxi','cxi_show','车系','dist','string','CXI',NULL,0,0,0,1,25,NULL,NULL,NULL),('cxing','cxing_show','车型','dist','string','CXING',NULL,0,0,0,1,26,NULL,NULL,NULL),('degxhnljd','degxhnljd','第二个小孩年龄阶段','text','string',NULL,NULL,0,0,0,1,72,NULL,NULL,NULL),('dkje','dkje','贷款金额','text','double',NULL,NULL,0,0,0,1,62,NULL,NULL,NULL),('dkqs','dkqs_show','贷款期数','dist','string','DKQS',NULL,0,0,0,1,58,'贷款期数（月）',NULL,NULL),('dksqhm','dksqhm','贷款申请号码','text','string',NULL,NULL,0,0,0,1,36,NULL,NULL,NULL),('dqzt','dqzt_show','当前状态','dist','string','DQZT',NULL,0,0,0,1,18,NULL,NULL,NULL),('dygxhnljd','dygxhnljd','第一个小孩年龄阶段','text','string',NULL,NULL,0,0,0,1,71,NULL,NULL,NULL),('dzlx','dzlx','地址类型','text','string',NULL,NULL,0,0,0,1,45,NULL,NULL,NULL),('dzy','dzy','地址一','text','string',NULL,NULL,0,0,0,1,52,NULL,NULL,NULL),('fclx','fclx_show','房产类型','dist','string','FCLX',NULL,0,0,0,1,46,NULL,NULL,NULL),('fkfs','fkfs_show','付款方式','dist','string','FKFS',NULL,0,0,0,1,31,NULL,NULL,NULL),('gcrq','gcrq','购车日期','date','date',NULL,NULL,0,0,0,1,29,NULL,NULL,NULL),('gcyhke','gcyhke','购车月还款额','text','double',NULL,NULL,0,0,0,1,65,NULL,NULL,NULL),('gsdh','gsdh','公司电话','text','string',NULL,NULL,0,0,0,1,51,NULL,NULL,NULL),('gsmc','gsmc','公司名称','text','string',NULL,NULL,0,0,0,1,48,'公司名称（自填项）',NULL,NULL),('gsqrgx','gsqrgx_show','跟申请人关系','dist','string','LZGX',NULL,0,0,0,1,13,NULL,NULL,NULL),('gznx','gznx','工作年限','text','int',NULL,NULL,0,0,0,1,53,'工作年限（年）',NULL,NULL),('hkdz','hkdz','户口地址','text','string',NULL,NULL,0,0,0,1,44,NULL,NULL,NULL),('hkszd','hkszd','户口所在地','text','string',NULL,NULL,0,0,0,1,40,NULL,NULL,NULL),('hkzt','hkzt_show','还款状态','dist','string','HKZT',NULL,0,0,0,1,14,NULL,NULL,NULL),('htbh','htbh','合同编号','text','string',NULL,NULL,0,0,0,1,19,NULL,NULL,NULL),('htjhrq','htjhrq','合同激活日期','date','date',NULL,NULL,0,0,0,1,20,NULL,NULL,NULL),('hylx','hylx_show','行业类型','tree','int','HYLX','hyzlx',1,0,0,1,37,NULL,NULL,NULL),('hyzk','hyzk_show','婚姻状况','dist','string','HYZK',NULL,0,0,0,1,17,NULL,NULL,NULL),('hyzlx','hyzlx_show','行业子类型','tree','int','HYLX',NULL,2,0,0,1,38,NULL,NULL,NULL),('hzjjrq','hzjjrq','核准拒绝日期','date','date',NULL,NULL,0,0,0,1,23,NULL,NULL,NULL),('jcrq','jcrq','交车日期','date','date',NULL,NULL,0,0,0,1,30,NULL,NULL,NULL),('jkr_cs','jkr_cs_show','借款人城市','tree','int','CITY',NULL,2,0,0,1,43,NULL,NULL,NULL),('jkr_sf','jkr_sf_show','借款人省份','tree','int','CITY','jkr_cs',1,0,0,1,42,NULL,NULL,NULL),('jsr_lxdh','jsr_lxdh','介绍人联系电话','text','string',NULL,NULL,0,0,0,1,68,NULL,NULL,NULL),('jsr_xm','jsr_xm','介绍人姓名','text','string',NULL,NULL,0,0,0,1,67,'介绍人',NULL,NULL),('jszbh','jszbh','驾驶证编号','text','string',NULL,NULL,0,0,0,1,32,'驾驶证档案编号',NULL,NULL),('jtrs','jtrs_show','家庭人数','dist','string','JTRS',NULL,0,0,0,1,34,NULL,NULL,NULL),('jycd','jycd_show','教育程度','dist','string','JYCD',NULL,0,0,0,1,35,NULL,NULL,NULL),('jzdqr','jzdqr','驾照到期日','date','date',NULL,NULL,0,0,0,1,33,NULL,NULL,NULL),('jznx','jznx','居住年限','text','int',NULL,NULL,0,0,0,1,47,NULL,NULL,NULL),('khll','hkll','客户利率','text','double',NULL,NULL,0,0,0,1,63,NULL,NULL,NULL),('khsqbm','khsqbm','客户申请编码','text','string',NULL,NULL,0,0,0,1,66,NULL,NULL,NULL),('lxze','lxze','利息总额','text','double',NULL,NULL,0,0,0,1,64,NULL,NULL,NULL),('nl','nl','年龄','text','int',NULL,NULL,0,0,0,1,16,'年龄（年）',NULL,NULL),('org_dq','org_dq_show','大区','org','int','-1','org_jxs',2,1,1,1,2,NULL,NULL,NULL),('org_jxs','org_jxs_show','经销商','org','int','-1',NULL,3,1,1,1,3,'经销商名称','经销商名称','经销商名称'),('org_yxb','org_yxb_show','营销部','org','int','0','org_dq',1,1,1,1,1,NULL,NULL,NULL),('qyxz','qyxz_show','企业性质','dist','string','QYXZ',NULL,0,0,0,1,49,NULL,NULL,NULL),('sfkbl','sfkbl','首付款比例','text','double',NULL,NULL,0,0,0,1,60,'首付款比例 %',NULL,NULL),('sfkje','sfkje','首付款金额','text','double',NULL,NULL,0,0,0,1,61,NULL,NULL,NULL),('sjgcr_dhhm','sjgcr_dhhm','购车人电话号码','text','string',NULL,NULL,0,1,1,1,12,NULL,'实际购车人电话号码',NULL),('sjgcr_xm','sjgcr_xm','购车人姓名','text','string',NULL,NULL,0,1,1,1,10,NULL,'实际购车人姓名','客户名称'),('sjgcr_zjhm','sjgcr_zjhm','购车人证件号码','text','string',NULL,NULL,0,1,1,1,11,NULL,'实际购车人证件号码','证件号码'),('sqr_dhhm','sqr_dhhm','申请人电话号码','text','string',NULL,NULL,0,1,1,1,9,'电话','申请人电话',NULL),('sqr_xm','sqr_xm','申请人姓名','text','string',NULL,NULL,0,1,1,1,6,'姓名（中文）','申请人姓名',NULL),('sqr_zjhm','sqr_zjhm','申请人证件号码','text','string',NULL,NULL,0,1,1,1,8,'证件号码','申请人证件号码',NULL),('sqr_zjlx','sqr_zjlx_show','申请人证件类型','dist','string','ZJLX',NULL,0,0,0,1,7,'证件类型',NULL,NULL),('sqtjrq','sqtjrq','申请提交日期','date','date',NULL,NULL,0,0,0,1,21,NULL,NULL,NULL),('vin','vin','VIN号','text','string',NULL,NULL,0,0,0,1,28,NULL,NULL,NULL),('xb','xb_show','性别','dist','string','XB',NULL,0,0,0,1,15,NULL,NULL,NULL),('xqah','xqah','兴趣爱好','text','string',NULL,NULL,0,0,0,1,69,NULL,NULL,NULL),('xsjg','xsjg','销售价格','text','double',NULL,NULL,0,0,0,1,59,NULL,NULL,NULL),('yf','yf','月份','text','int',NULL,NULL,0,0,0,1,22,NULL,NULL,NULL),('ysr','ysr','月收入','text','int',NULL,NULL,0,0,0,1,41,NULL,NULL,NULL),('yyxhsl','yyxhsl_show','拥有小孩数量','dist','string','YYHZSL',NULL,0,0,0,1,70,NULL,NULL,NULL),('zc','zc','周次','text','int',NULL,NULL,0,0,0,1,24,NULL,NULL,NULL),('zcjg','zcjg','资产价格','text','double',NULL,NULL,0,0,0,1,54,NULL,NULL,NULL),('zw','zw','职位','text','string',NULL,NULL,0,0,0,1,50,NULL,NULL,NULL),('zylx','zylx_show','职业类型','dist','string','ZYLX',NULL,0,0,0,1,39,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_field` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='系统-菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'客户信息','index.jspx',1,1),(2,0,'系统管理','#',1,10),(3,2,'用户管理','admin/user/list.jspx',1,1),(4,2,'角色管理','admin/role/list.jspx',1,2),(5,2,'菜单权限管理','admin/menu/list.jspx',1,3),(6,1,'客户信息查询','cm/list.jspx',1,2),(7,2,'组织机构管理','admin/org/list.jspx',1,4),(8,1,'新增客户信息','cm/add.jspx',1,3),(9,6,'修改客户信息','cm/edit.jspx',0,1),(10,6,'删除客户信息','cm/delete.do',0,2),(11,2,'普通字典管理','admin/dist/list.jspx',1,5),(12,2,'树形字典管理','admin/tree/list.jspx',1,6),(13,2,'字段配置','admin/field/list.jspx',1,7),(14,1,'导入客户信息','cm/imp.jspx',1,4);
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
  `name` varchar(100) NOT NULL COMMENT '名称',
  `code` varchar(500) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`),
  KEY `type_pid` (`type`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_org`
--

LOCK TABLES `sys_org` WRITE;
/*!40000 ALTER TABLE `sys_org` DISABLE KEYS */;
INSERT INTO `sys_org` VALUES (1,1,0,'深圳营销部',',1,'),(3,2,1,'宝安大区',',1,3,'),(4,2,1,'福田大区',',1,4,'),(5,2,1,'龙岗大区',',1,5,'),(6,2,1,'龙华大区',',1,6,'),(9,1,0,'上海营销部',',9,'),(10,2,9,'上海一区',',9,10,'),(11,2,9,'上海二区',',9,11,'),(12,2,9,'上海三区',',9,12,'),(13,3,3,'深圳市东盛汽车销售服务有限公司',',1,3,13,'),(14,3,3,'深圳金环怡投资有限公司',',1,3,14,'),(15,3,4,'深圳市三维都灵汽车销售服务有限公司',',1,4,15,'),(16,3,4,'深圳市粤迪汽车贸易有限公司南山分公司',',1,4,16,'),(17,3,4,'深圳市盛世开元汽车销售有限公司福田城市展厅分公司',',1,4,17,'),(18,3,5,'深圳市湛宝实业发展有限公司',',1,5,18,'),(19,3,5,'深圳市泽然浩商贸有限公司',',1,5,19,'),(65,0,0,'西北营销部',',65,'),(66,0,65,'西北大区',',65,66,'),(67,0,66,'西安嘉丽实业有限公司',',65,66,67,'),(68,0,0,'华东营销部',',68,'),(69,0,68,'华东大区',',68,69,'),(70,0,69,'安徽金丰汽车销售服务有限公司',',68,69,70,'),(71,0,0,'华中营销部',',71,'),(72,0,71,'华南大区',',71,72,'),(73,0,72,'湖南岳迪汽车销售有限公司',',71,72,73,'),(74,0,0,'西南营销部',',74,'),(75,0,74,'川渝鄂大区',',74,75,'),(76,0,75,'南充博宇车业有限公司',',74,75,76,'),(77,0,75,'泸州忠山汽车销售有限责任公司',',74,75,77,'),(78,0,66,'榆林市晶鑫汽贸有限责任公司',',65,66,78,'),(79,0,71,'华中大区',',71,79,'),(80,0,79,'赣州众和汽车销售服务有限公司',',71,79,80,'),(81,0,79,'宜春年富汽车贸易有限公司',',71,79,81,'),(82,0,69,'安徽畅通汽车销售有限公司',',68,69,82,'),(83,0,79,'驻马店市东方汽车贸易服务有限公司',',71,79,83,'),(84,0,0,'湖南岳迪汽车销售有限公司',',84,');
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
  `fields` text COMMENT '可见字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统-角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (2,'管理员','管理系统','org_yxb,org_dq,org_jxs,city_sf,city_cs,sqr_xm,sqr_zjlx,sqr_zjhm,sqr_dhhm,sjgcr_xm,sjgcr_zjhm,sjgcr_dhhm,gsqrgx,hkzt,xb,nl,hyzk,dqzt,htbh,htjhrq,sqtjrq,yf,hzjjrq,zc,cxi,cxing,cphm,vin,gcrq,jcrq,fkfs,jszbh,jzdqr,jtrs,jycd,dksqhm,hylx,hyzlx,zylx,hkszd,ysr,jkr_sf,jkr_cs,hkdz,dzlx,fclx,jznx,gsmc,qyxz,zw,gsdh,dzy,gznx,zcjg,csys,cpz,cplx,dkqs,xsjg,sfkbl,sfkje,dkje,khll,lxze,gcyhke,khsqbm,jsr_xm,jsr_lxdh,xqah,yyxhsl,dygxhnljd,degxhnljd'),(3,'普通用户','普通用户','org_yxb,org_dq,org_jxs,city_sf,city_cs,sqr_xm,sqr_zjlx,sqr_zjhm,sqr_dhhm,sjgcr_xm,sjgcr_zjhm,sjgcr_dhhm,gsqrgx,hkzt,xb,nl,hyzk,dqzt,htbh,htjhrq,sqtjrq,yf,hzjjrq,zc,cxi,cxing,cphm,vin,gcrq,jcrq,fkfs,jszbh,jzdqr,dksqhm,jkr_sf,jkr_cs,csys,cpz,cplx,dkqs,khsqbm,jsr_xm,jsr_lxdh');
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
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COMMENT='系统-角色-菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (167,2,1),(168,2,6),(169,2,9),(170,2,10),(171,2,8),(172,2,14),(173,2,2),(174,2,3),(175,2,4),(176,2,5),(177,2,7),(178,2,11),(179,2,12),(180,2,13),(182,3,1),(183,3,6),(184,3,9),(185,3,8),(186,3,14);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_tree`
--

DROP TABLE IF EXISTS `sys_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '类型',
  `level` int(11) NOT NULL COMMENT '层次',
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `code` varchar(500) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`),
  KEY `type_pid` (`type`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_tree`
--

LOCK TABLES `sys_tree` WRITE;
/*!40000 ALTER TABLE `sys_tree` DISABLE KEYS */;
INSERT INTO `sys_tree` VALUES (1,'CITY',1,0,'广东',',1,'),(2,'CITY',1,0,'湖南',',2,'),(3,'CITY',2,1,'广州',',1,3,'),(4,'CITY',2,1,'深圳',',1,4,'),(5,'CITY',2,1,'佛山',',1,5,'),(6,'CITY',2,2,'长沙',',2,6,'),(8,'CITY',2,2,'娄底',',2,8,'),(9,'CITY',2,1,'东莞',',1,9,'),(11,'HYLX',1,0,'采矿业',',11,'),(12,'HYLX',1,0,'制造业',',12,'),(13,'HYLX',1,0,'建筑业',',13,'),(14,'HYLX',1,0,'金融业',',14,'),(15,'HYLX',1,0,'房地产业',',15,'),(16,'HYLX',1,0,'教育',',16,'),(17,'HYLX',1,0,'国际组织',',17,'),(18,'HYLX',1,0,'批发和零售业',',18,'),(19,'HYLX',1,0,'住宿和餐饮业',',19,'),(20,'HYLX',1,0,'卫生和社会工作',',20,'),(21,'HYLX',1,0,'租赁和商务服务业',',21,'),(22,'HYLX',1,0,'交通运输、仓储和邮政业',',22,'),(23,'HYLX',1,0,'电力、热力、燃气及水生产和供应业',',23,'),(24,'HYLX',1,0,'居民服务、修理和其他服务业',',24,'),(25,'HYLX',1,0,'水利、环境和公共设施管理业',',25,'),(26,'HYLX',1,0,'信息传输、软件和信息技术服务业',',26,'),(27,'HYLX',1,0,'科学研究和技术服务业',',27,'),(28,'HYLX',1,0,'农、林、牧、渔业',',28,'),(29,'HYLX',1,0,'公共管理、社会保障和社会组织',',29,'),(30,'HYLX',1,0,'文化、体育和娱乐业',',30,'),(31,'HYLX',1,0,'其他',',31,'),(32,'HYLX',2,31,'其他',',31,32,'),(33,'HYLX',2,15,'房地产开发经营',',15,33,'),(34,'HYLX',2,13,'房屋和土木工程建筑业',',13,34,'),(35,'HYLX',2,18,'批发业 Wholesale Trade',',18,35,'),(36,'HYLX',2,24,'其他服务业 Other Services',',24,36,'),(103,'CITY',1,0,'陕西',',103,'),(104,'CITY',2,103,'西安',',103,104,'),(105,'CITY',1,0,'安徽',',105,'),(106,'CITY',2,105,'六安',',105,106,'),(107,'CITY',1,0,'四川',',107,'),(108,'CITY',2,107,'南充',',107,108,'),(109,'CITY',2,107,'泸州',',107,109,'),(110,'CITY',2,103,'榆林',',103,110,'),(111,'HYLX',2,11,'煤炭开采和洗选业',',11,111,'),(112,'CITY',1,0,'江西',',112,'),(113,'CITY',2,112,'赣州',',112,113,'),(114,'HYLX',2,12,'家具制造业',',12,114,'),(115,'CITY',2,112,'宜春',',112,115,'),(116,'HYLX',2,12,'工艺品及其他制造业',',12,116,'),(117,'HYLX',2,22,'道路运输业',',22,117,'),(118,'CITY',2,105,'滁州',',105,118,'),(119,'HYLX',2,18,'零售业 Retail Trade',',18,119,'),(120,'CITY',1,0,'河南',',120,'),(121,'CITY',2,120,'驻马店',',120,121,'),(122,'HYLX',2,14,'银行业',',14,122,'),(123,'HYLX',2,14,'其他金融活动',',14,123,'),(124,'HYLX',2,12,'仪器仪表及文化、办公用机械制造业',',12,124,');
/*!40000 ALTER TABLE `sys_tree` ENABLE KEYS */;
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
INSERT INTO `sys_user` VALUES (1,'admin','f6fdffe48c908deb0f4c3bd36c032e72','管理员','','','2016-09-25 11:14:13','2016-10-27 20:41:59',0,',2,',',管理员,',''),(2,'dw_jiangkunpeng','99800032b7d26893553ce81530e0f821','姜昆鹏','15899954940','jakey766@163.com','2016-09-25 11:14:40','2016-10-23 18:16:13',0,',3,',',普通用户,',',1,');
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

-- Dump completed on 2016-10-27 22:08:30
