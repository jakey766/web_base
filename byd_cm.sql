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
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_info`
--

LOCK TABLES `cm_info` WRITE;
/*!40000 ALTER TABLE `cm_info` DISABLE KEYS */;
INSERT INTO `cm_info` VALUES (163,85,86,87,',85,86,87,',493,494,',493,494,','陈一','1','440281198003308411','18746921734',NULL,'',NULL,NULL,'4','2',36,'1980-01-01','2','Converted','BZ100001','2015-03-23','2015-03-20',3,'2015-03-23',12,'旗舰版','QIN',NULL,NULL,'2015-04-23',NULL,'1','915058626','2017-01-02','3','5','BX-A000002000',31,32,NULL,'国家机关、党群组织、企业、事业单位负责人','西安',12500,493,494,'陕西省西安市未央区凤城三路与朱宏路路口',NULL,'6',8,'政府部门','8','徐汇区法院主任',NULL,NULL,6,209800,'魔力橙','比亚迪--标准贷','标准贷款-等额本金（个人）',NULL,146800,20,29360,14.49,117440,26234.47,4041.83,'00000001','廖瀚卿','15989300244','打球','1','2',NULL,0),(164,85,86,87,',85,86,87,',493,494,',493,494,','吴二','1','440301198510142738','18746921735',NULL,'',NULL,NULL,'4','2',31,'1985-01-01','2','Converted','BZ100002','2015-03-23','2015-03-20',3,'2015-03-23',12,'豪华版','QIN',NULL,NULL,'2015-04-23',NULL,'2','915066589','2017-02-02','5','5','BX-A000003000',31,32,NULL,'办事人员和有关人员','西安',9800,493,494,'陕西省西安市未央区凤城三路与朱宏路路口',NULL,'6',10,'政府部门','8','奉贤区法院院长兼党委书记',NULL,NULL,6,209800,'天山白','比亚迪--标准贷','标准贷款-等额本金（个人）',NULL,146800,20,29360,14.49,117440,26234.47,4041.83,'00000002','谷传明','13703176338','看书','1','1',NULL,0),(165,88,89,90,',88,89,90,',495,496,',495,496,','张三','1','230302199104184222','18746921736',NULL,'',NULL,NULL,'5','1',25,'1991-01-01','5','Converted','BZ100003','2015-05-04','2015-04-23',4,'2015-04-24',17,'尊贵版','G5',NULL,NULL,'2015-06-04',NULL,'2','A16005939','2017-03-02','4','5','BX-A000013001',15,33,NULL,'专业技术人员','六安',12000,495,496,'六安市金安区东方汽车城皖西大道南侧A52号',NULL,'8',12,'政府部门','8','徐汇区法院院长兼党委书记',NULL,NULL,1,85900,'皓月银','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,76900,40,30760,14.49,46140,11026.56,1587.96,'00000003','张嘉煜','13902900066','运动','0',NULL,NULL,0),(166,88,89,90,',88,89,90,',495,496,',495,496,','李四','1','22010419820822153X','18746921737',NULL,'',NULL,NULL,'5','1',34,'1982-01-01','2','Converted','BZ100010','2015-05-08','2015-04-24',4,'2015-04-27',17,'尊贵版','SURUI',NULL,NULL,'2015-06-08',NULL,'2','916011327','2017-04-02','5','2','BX-A000015001',13,34,NULL,'专业技术人员','六安',7800,495,496,'六安市金安区东方汽车城皖西大道南侧A52号',NULL,'8',11,'政府部门','8',' 金山区法院院长兼党委书记',NULL,NULL,10,73900,'德兰黑','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,73000,30,21900,14.49,51100,12211.76,1758.66,'00000004','陈岳俊','13501557735','旅游','1','3',NULL,0),(167,91,92,93,',91,92,93,',491,492,',491,492,','王五','1','440181198708205174','18746921738',NULL,'',NULL,NULL,'5','1',29,'1987-01-01','2','Converted','BZ100004','2015-05-04','2015-04-24',4,'2015-04-27',17,'尊贵版','F3',NULL,NULL,'2015-06-04',NULL,'2','916013025','2017-05-02','5','3','BX-A000016000',18,35,NULL,'办事人员和有关人员','长沙',5000,491,492,'长沙市雨花区经开区桃阳村黄谷路',NULL,'7',3,'政府部门','8',' 徐汇区法院政治部主任兼纪委书记',NULL,NULL,1,45900,'天山白','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,42900,30.07,12900,14.49,30000,7169.28,1032.48,'00000005','王卓欤','15243602288','打球','1','2',NULL,0),(168,94,95,96,',94,95,96,',497,498,',497,498,','杨六','1','140102198905065178','18746921739',NULL,'',NULL,NULL,'5','1',27,'1989-01-01','2','Converted','BZ100007','2015-05-06','2015-04-27',4,'2015-04-29',17,'旗舰版','S7',NULL,NULL,'2015-06-06',NULL,'2','916000476','2017-06-02','5','4','BX-A000017000',24,36,NULL,'商业、服务业人员','南充',8600,497,498,'南充市高坪区航空港工业集中区',NULL,'7',2,'上海艾领德国际贸易公司','9','上海艾领德国际贸易公司董事长',NULL,NULL,5,116900,'巧克力棕','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,115900,30,34770,14.49,81130,19388.48,2792.18,'00000006','朱卫国','13488659647','看书','1','1',NULL,0),(169,94,95,96,',94,95,96,',497,498,',497,498,','林七','1','440307198709054824','18746921740',NULL,'',NULL,NULL,'5','1',29,'1987-01-01','2','Converted','BZ100008','2015-05-06','2015-04-27',4,'2015-04-28',17,'豪华版','S7',NULL,NULL,'2015-06-06',NULL,'2','916007181','2017-07-02','8','3','BX-A000018000',24,36,NULL,'专业技术人员','南充',13000,497,498,'南充市高坪区航空港工业集中区',NULL,'1',2,'政府部门','8','武汉海关关长',NULL,NULL,5,116900,'天山白','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,116900,30,35070,14.49,81830,19555.72,2816.27,'00000007','杨国平','18991902693','运动','2','3','1',0),(170,94,95,97,',94,95,97,',497,499,',497,499,','赵八','1','421002197212271423','18746921741',NULL,'',NULL,NULL,'5','1',44,'1972-01-01','2','Converted','BZ100005','2015-05-05','2015-04-27',4,'2015-04-29',17,'豪华版','S7',NULL,NULL,'2015-06-05',NULL,'2','916005239','2017-08-02','5','2','BX-A000020000',13,34,NULL,'专业技术人员','泸州',18000,497,499,'四川省泸州市纳溪区浙江产业园',NULL,'3',2,'政府部门','8','上海铁路局副局长',NULL,NULL,5,139900,'巧克力棕','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,139900,20.01,28000,14.49,111900,26741.76,3851.16,'00000008','潘学刚','13611981186','旅游','1','15',NULL,0),(171,94,95,97,',94,95,97,',497,499,',497,499,','黄九','1','420105198811253678','18746921742',NULL,'',NULL,NULL,'5','1',28,'1988-01-01','2','Converted','BZ100006','2015-05-05','2015-04-28',4,'2015-04-30',17,'豪华版','NEWF3',NULL,NULL,'2015-06-05',NULL,'2','916010640','2017-09-02','4','3','BX-A000021001',31,32,NULL,'商业、服务业人员','泸州',6700,497,499,'四川省泸州市纳溪区浙江产业园',NULL,'1',3,'上海华勤通讯技术有限公司','10','上海华勤通讯技术有限公司市场总监',NULL,NULL,1,51900,'雅典银','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,45900,32.46,14900,14.49,31000,4894.16,1495.59,'00000009','王强鹰','18016367263','打球','2','3','1',0),(172,85,86,98,',85,86,98,',493,500,',493,500,','江十','1','440301197403213818','18746921743',NULL,'',NULL,NULL,'5','1',42,'1974-01-01','2','Converted','BZ100022','2015-05-20','2015-04-29',4,'2015-04-30',17,'旗舰版','S6',NULL,NULL,'2015-06-20',NULL,'2','A16007445','2017-10-02','5','4','BX-A000023000',11,111,NULL,'专业技术人员','榆林',6000,493,500,'陕西省榆林市草海则小学旁',NULL,'8',8,'中国经营报','8','中国经营报记者',NULL,NULL,8,109900,'天山白','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,103395,30,31018.5,14.49,72376.5,17296.62,2490.92,'00000010','李延春','13809116467','看书','1','13',NULL,0),(173,94,95,97,',94,95,97,',497,499,',497,499,','吴一','1','370202198706240424','18746921744',NULL,'',NULL,NULL,'5','1',29,'1987-01-01','2','Converted','BZ100050','2015-05-27','2015-05-04',5,'2015-05-05',18,'旗舰版','NEWF3',NULL,NULL,'2015-06-27',NULL,'2','916007951','2017-11-02','4','3','BX-A000025000',24,36,NULL,'专业技术人员','泸州',5900,497,499,'四川省泸州市纳溪区浙江产业园',NULL,'7',3,'政府部门','8','上海市团委副书记、团市委常委、少年部部长',NULL,NULL,1,55900,'雅典银','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,54900,21.68,11900,14.49,43000,10276.04,1479.89,'00000011','苏剑波','13661793223','运动','1','2',NULL,0),(174,91,99,100,',91,99,100,',501,502,',501,502,','陈二','1','432502196810141713','18746921745',NULL,'',NULL,NULL,'5','1',48,'1968-01-01','2','Converted','BZ100009','2015-05-14','2015-05-05',5,'2015-05-05',18,'豪华版','SURUI',NULL,NULL,'2015-06-14',NULL,'2','A16012773','2017-12-02','5','3','BX-A000032000',12,114,NULL,'生产、运输设备操作人员及有关人员','赣州',8600,501,502,'赣州经济技术开发迎宾大道南侧金潭路西侧',NULL,'8',4,'上海电气集团上海电机厂有限公司','11','上海电气集团上海电机厂有限公司经理',NULL,NULL,1,83900,'瑞亚银','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,75600,31.22,23600,14.49,52000,12427.04,1789.64,'00000012','刘建波','13608526297','旅游','2','15','9',0),(175,91,99,101,',91,99,101,',501,503,',501,503,','李三','1','421127198305232816','18746921746',NULL,'',NULL,NULL,'5','1',33,'1983-01-01','2','Converted','BZ100019','2015-05-19','2015-05-05',5,'2015-05-06',18,'尊贵版','S6',NULL,NULL,'2015-06-19',NULL,'2','A15047009','2018-01-02','5','3','BX-A000034000',12,116,NULL,'办事人员和有关人员','宜春',5600,501,503,'江西省高安市新世纪工业城',NULL,'8',5,'上海胜佰太阳能科技有限公司','10','上海胜佰太阳能科技有限公司商务总监',NULL,NULL,3,97900,'德兰黑','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,97900,30.54,29900,14.49,68000,16250.44,2340.29,'00000013','刘建波','13608526297','打球','2','7','5',0),(176,94,95,96,',94,95,96,',497,498,',497,498,','张四','1','362401199211150023','18746921747',NULL,'',NULL,NULL,'5','1',24,'1992-01-01','5','Converted','BZ100012','2015-05-14','2015-05-05',5,'2015-05-08',18,'尊贵版','G5',NULL,NULL,'2015-06-14',NULL,'2','915059417','2018-02-02','7','3','200000',22,117,NULL,'专业技术人员','南充',6000,497,498,'南充市高坪区航空港工业集中区',NULL,'8',7,'政府部门','8','公务员',NULL,NULL,5,102900,'水晶白','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,99900,20,19980,14.49,79920,19099.08,2750.53,'00000014','刘丹军','18673162177','看书','0',NULL,NULL,0),(177,88,89,102,',88,89,102,',495,504,',495,504,','杨五','1','310222198606280219','18746921748',NULL,'',NULL,NULL,'5','1',30,'1986-01-01','2','Converted','BZ100047','2015-05-25','2015-05-06',5,'2015-05-06',18,'尊贵版','S7',NULL,NULL,'2015-06-25',NULL,'2','A15041704','2018-03-02','6','3','BX-A000030000',18,119,NULL,'商业、服务业人员','滁州',7800,495,504,'安微省滁州市丰乐大道2599号',NULL,'3',4,'政府部门','8','公务员',NULL,NULL,8,129900,'巧克力棕','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,127900,30,38370,14.49,89530,21395.72,3081.27,'00000015','黄道铭','18662556999','运动','2','4','1',0),(178,91,99,103,',91,99,103,',505,506,',505,506,','王六','1','370727198411039459','18746921749',NULL,'',NULL,NULL,'5','2',32,'1984-01-01','2','Converted','BZ100025','2015-05-20','2015-05-07',5,'2015-05-08',19,'尊贵版','F0',NULL,NULL,'2015-06-20',NULL,'2','A15069101','2018-04-02','5','5','BX-A000046000',18,35,NULL,'商业、服务业人员','驻马店',4000,505,506,'驻马店市开源大道东段（市车管所旁）',NULL,'6',3,'政府部门','8','公务员',NULL,NULL,3,42900,'天山白','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,40000,30,12000,14.49,28000,6691.4,963.65,'00000016','许金强','18621398181','旅游','1','5',NULL,0),(179,85,86,98,',85,86,98,',493,500,',493,500,','赵七','1','430626198003045122','18746921750',NULL,'',NULL,NULL,'5','2',36,'1980-01-01','2','Converted','BZ100015','2015-05-20','2015-05-07',5,'2015-05-08',19,'旗舰版','G5',NULL,NULL,'2015-06-20',NULL,'2','915062340','2018-05-02','5','4','BX-A000040000',31,32,NULL,'专业技术人员','榆林',7200,493,500,'陕西省榆林市草海则小学旁',NULL,'8',4,'银松公司','9','银松公司总裁',NULL,NULL,0,93900,'天山白','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,90000,30,27000,14.49,63000,9946.08,3039.42,'00000017','黎宾','13817212368','打球','1','8',NULL,0),(180,85,86,98,',85,86,98,',493,500,',493,500,','林八','1','510132198412086662','18746921751',NULL,'',NULL,NULL,'6','1',32,'1984-01-01','2','Converted','BZ100021','2015-05-20','2015-05-07',5,'2015-05-08',19,'豪华版','F3',NULL,NULL,'2015-06-20',NULL,'2','916003142','2018-06-02','4','4','BX-A000045000',14,122,NULL,'办事人员和有关人员','榆林',4500,493,500,'陕西省榆林市草海则小学旁',NULL,'8',2,'政府部门','8','经信委',NULL,NULL,1,50900,'天山白','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,47000,20,9400,14.49,37600,3016.04,3384.67,'00000018','黎宾','13817212368','看书','2','4','2',0),(181,88,89,90,',88,89,90,',495,496,',495,496,','江九','1','430105199305121325','18746921752',NULL,'',NULL,NULL,'5','1',23,'1993-01-01','5','Converted','BZ100017','2015-05-19','2015-05-07',5,'2015-05-07',19,'豪华版','S7',NULL,NULL,'2015-06-19',NULL,'2','916003143','2018-07-02','5','4','BX-A000035000',14,123,NULL,'办事人员和有关人员','六安',9000,495,496,'六安市金安区东方汽车城皖西大道南侧A52号',NULL,'3',3,'政府部门','8','中央人民广播电台副总',NULL,NULL,1,129900,'德兰黑','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,126900,30,38070,14.49,88830,21228.48,3057.18,'00000019','高晋琪','13997056995','运动','0',NULL,NULL,0),(182,88,89,102,',88,89,102,',495,504,',495,504,','黄十','1','120106199303060020','18746921753',NULL,'',NULL,NULL,'5','1',23,'1993-01-01','5','Converted','BZ100041','2015-05-28','2015-05-07',5,'2015-05-07',19,'豪华版','NEWF3',NULL,NULL,'2015-06-28',NULL,'2','916003144','2018-08-02','6','4','BX-A000038000',12,124,NULL,'生产、运输设备操作人员及有关人员','滁州',8200,495,504,'安微省滁州市丰乐大道2599号',NULL,'5',4,'政府部门','8','中国人民对外友好协会拉美处主管',NULL,NULL,2,55900,'德兰黑','比亚迪--标准贷','标准贷款-等额本息（个人）',NULL,50385,20,10077,14.49,40308,9632.64,1387.24,'00000020','周爱涛','15000181806','旅游','0',NULL,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dist`
--

LOCK TABLES `sys_dist` WRITE;
/*!40000 ALTER TABLE `sys_dist` DISABLE KEYS */;
INSERT INTO `sys_dist` VALUES (1,'ZJLX','1','身份证',''),(2,'ZJLX','2','护照',''),(3,'XB','1','男性',''),(4,'XB','2','女性',''),(5,'JYCD','7','博士',''),(6,'JYCD','6','硕士',''),(7,'JYCD','5','本科',''),(8,'JYCD','4','大专',''),(9,'JYCD','3','高中及中专',''),(10,'JYCD','2','初中',''),(11,'JYCD','1','小学',''),(13,'FCLX','1','全款自购商品房',''),(14,'FCLX','2','全款自购经适房',''),(15,'FCLX','3','按揭自购商品房',''),(16,'FCLX','4','按揭自购经适房',''),(17,'FCLX','5','公司房',''),(18,'FCLX','6','直系亲属房',''),(19,'FCLX','7','租赁房',''),(20,'FCLX','8','自建房',''),(21,'FCLX','9','宅基地',''),(22,'FCLX','10','公产房',''),(23,'FCLX','11','小产权房',''),(24,'HYZK','1','单身',''),(25,'HYZK','2','已婚',''),(26,'HYZK','3','离婚',''),(27,'HYZK','4','丧偶',''),(28,'JTRS','1','1',''),(29,'JTRS','2','2',''),(30,'JTRS','3','3',''),(31,'JTRS','4','4',''),(32,'JTRS','5','5',''),(33,'JTRS','6','6',''),(34,'JTRS','7','7',''),(35,'JTRS','8','8',''),(61,'FKFS','1','全款',''),(62,'FKFS','2','贷款',''),(65,'HKZT','3','还款中',''),(66,'DQZT','1','正常',''),(67,'DQZT','2','异常',''),(68,'QYXZ','1','国有',''),(69,'QYXZ','2','集体',''),(70,'QYXZ','3','联营',''),(71,'QYXZ','4','股份制',''),(72,'QYXZ','5','私营',''),(73,'QYXZ','6','个体',''),(74,'QYXZ','7','合伙',''),(75,'DKQS','12','12期',''),(76,'DKQS','24','24期',''),(77,'DKQS','36','36期',''),(80,'YYHZSL','1','1',''),(81,'YYHZSL','2','2',''),(82,'YYHZSL','3','3',''),(83,'YYHZSL','4','4',''),(84,'YYHZSL','5','5',''),(91,'CXING','QIN','秦',''),(92,'CXING','G5','G5',''),(93,'CXING','S7','S7',''),(94,'CXING','SURUI','速锐',''),(95,'CXYS','天山白','天山白',''),(96,'CXYS','皓月银','皓月银',''),(97,'CXYS','魔力橙','魔力橙',''),(98,'CXYS','德兰黑','德兰黑',''),(99,'CXYS','巧克力棕','巧克力棕',''),(102,'CXI','旗舰版','旗舰版',''),(103,'CXI','豪华版','豪华版',''),(104,'CXI','尊贵版','尊贵版',''),(105,'LZGX','FQ','夫妻',''),(106,'LZGX','FZN','父子/女',''),(107,'LZGX','PY','朋友',''),(108,'ZYLX','1','公务员',''),(109,'ZYLX','100','其他',''),(111,'DQZT','Converted','Converted','导入时系统自动添加'),(116,'ZYLX','国家机关、党群组织、企业、事业单位负责人','国家机关、党群组织、企业、事业单位负责人','导入时系统自动添加'),(120,'ZYLX','办事人员和有关人员','办事人员和有关人员','导入时系统自动添加'),(124,'ZYLX','专业技术人员','专业技术人员','导入时系统自动添加'),(130,'CXING','F3','F3','导入时系统自动添加'),(132,'ZYLX','商业、服务业人员','商业、服务业人员','导入时系统自动添加'),(138,'CXYS','雅典银','雅典银','导入时系统自动添加'),(139,'CXING','S6','S6','导入时系统自动添加'),(140,'ZYLX','生产、运输设备操作人员及有关人员','生产、运输设备操作人员及有关人员','导入时系统自动添加'),(142,'CXYS','瑞亚银','瑞亚银','导入时系统自动添加'),(143,'CXYS','水晶白','水晶白','导入时系统自动添加'),(144,'CXING','F0','F0','导入时系统自动添加'),(149,'YYHZSL','0','0','导入时系统自动添加'),(157,'QYXZ','8','国家行政机关单位',''),(158,'QYXZ','9','外资',''),(159,'QYXZ','10','合资',''),(160,'QYXZ','11','国营',''),(162,'CXING','NEWF3','全新F3',''),(163,'HKZT','4','Special-mention关注',''),(164,'HKZT','5','Pass正常',''),(165,'HKZT','6','Doubtful可疑',''),(187,'HYZK','5','未婚','');
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
INSERT INTO `sys_field` VALUES ('city_cs','city_cs_show','城市','tree','int','CITY',NULL,2,1,1,1,5,NULL,NULL,NULL),('city_sf','city_sf_show','省份','tree','int','CITY','city_cs',1,1,1,1,4,NULL,NULL,NULL),('cphm','cphm','车牌号码','text','string',NULL,NULL,0,0,0,1,27,NULL,NULL,NULL),('cplx','cplx','产品类型','text','string',NULL,NULL,0,0,0,1,57,NULL,NULL,NULL),('cpz','cpz','产品组','text','string',NULL,NULL,0,0,0,1,56,NULL,NULL,NULL),('csys','csys_show','车身颜色','dist','string','CXYS',NULL,0,0,0,1,55,NULL,NULL,NULL),('cxi','cxi_show','车系','dist','string','CXI',NULL,0,0,0,1,25,NULL,NULL,NULL),('cxing','cxing_show','车型','dist','string','CXING',NULL,0,0,0,1,26,NULL,NULL,NULL),('degxhnljd','degxhnljd','第二个小孩年龄阶段','text','string',NULL,NULL,0,0,0,1,72,NULL,NULL,NULL),('dkje','dkje','贷款金额','text','double',NULL,NULL,0,0,0,1,62,NULL,NULL,NULL),('dkqs','dkqs_show','贷款期数','dist','string','DKQS',NULL,0,0,0,1,58,'贷款期数（月）',NULL,NULL),('dksqhm','dksqhm','贷款申请号码','text','string',NULL,NULL,0,0,0,1,36,NULL,NULL,NULL),('dqzt','dqzt_show','当前状态','dist','string','DQZT',NULL,0,0,0,1,18,NULL,NULL,NULL),('dygxhnljd','dygxhnljd','第一个小孩年龄阶段','text','string',NULL,NULL,0,0,0,1,71,NULL,NULL,NULL),('dzlx','dzlx','地址类型','text','string',NULL,NULL,0,0,0,1,45,NULL,NULL,NULL),('dzy','dzy','地址一','text','string',NULL,NULL,0,0,0,1,52,NULL,NULL,NULL),('fclx','fclx_show','房产类型','dist','string','FCLX',NULL,0,0,0,1,46,NULL,NULL,NULL),('fkfs','fkfs_show','付款方式','dist','string','FKFS',NULL,0,0,0,1,31,NULL,NULL,NULL),('gcrq','gcrq','购车日期','date','date',NULL,NULL,0,0,0,1,29,NULL,NULL,NULL),('gcyhke','gcyhke','购车月还款额','text','double',NULL,NULL,0,0,0,1,65,NULL,NULL,NULL),('gsdh','gsdh','公司电话','text','string',NULL,NULL,0,0,0,1,51,NULL,NULL,NULL),('gsmc','gsmc','公司名称','text','string',NULL,NULL,0,0,0,1,48,'公司名称（自填项）',NULL,NULL),('gsqrgx','gsqrgx_show','跟申请人关系','dist','string','LZGX',NULL,0,0,0,1,13,NULL,NULL,NULL),('gznx','gznx','工作年限','text','int',NULL,NULL,0,0,0,1,53,'工作年限（年）',NULL,NULL),('hkdz','hkdz','户口地址','text','string',NULL,NULL,0,0,0,1,44,NULL,NULL,NULL),('hkszd','hkszd','户口所在地','text','string',NULL,NULL,0,0,0,1,40,NULL,NULL,NULL),('hkzt','hkzt_show','还款状态','dist','string','HKZT',NULL,0,0,0,1,14,NULL,NULL,NULL),('htbh','htbh','合同编号','text','string',NULL,NULL,0,0,0,1,19,NULL,NULL,NULL),('htjhrq','htjhrq','合同激活日期','date','date',NULL,NULL,0,0,0,1,20,NULL,NULL,NULL),('hylx','hylx_show','行业类型','tree','int','HYLX','hyzlx',1,0,0,1,37,NULL,NULL,NULL),('hyzk','hyzk_show','婚姻状况','dist','string','HYZK',NULL,0,0,0,1,17,NULL,NULL,NULL),('hyzlx','hyzlx_show','行业子类型','tree','int','HYLX',NULL,2,0,0,1,38,NULL,NULL,NULL),('hzjjrq','hzjjrq','核准拒绝日期','date','date',NULL,NULL,0,0,0,1,23,NULL,NULL,NULL),('jcrq','jcrq','交车日期','date','date',NULL,NULL,0,0,0,1,30,NULL,NULL,NULL),('jkr_cs','jkr_cs_show','借款人城市','tree','int','CITY',NULL,2,0,0,1,43,NULL,NULL,NULL),('jkr_sf','jkr_sf_show','借款人省份','tree','int','CITY','jkr_cs',1,0,0,1,42,NULL,NULL,NULL),('jsr_lxdh','jsr_lxdh','介绍人联系电话','text','string',NULL,NULL,0,0,0,1,68,NULL,NULL,NULL),('jsr_xm','jsr_xm','介绍人姓名','text','string',NULL,NULL,0,0,0,1,67,'介绍人',NULL,NULL),('jszbh','jszbh','驾驶证编号','text','string',NULL,NULL,0,0,0,1,32,'驾驶证档案编号',NULL,NULL),('jtrs','jtrs_show','家庭人数','dist','string','JTRS',NULL,0,0,0,1,34,NULL,NULL,NULL),('jycd','jycd_show','教育程度','dist','string','JYCD',NULL,0,0,0,1,35,NULL,NULL,NULL),('jzdqr','jzdqr','驾照到期日','date','date',NULL,NULL,0,0,0,1,33,NULL,NULL,NULL),('jznx','jznx','居住年限','text','int',NULL,NULL,0,0,0,1,47,NULL,NULL,NULL),('khll','hkll','客户利率','text','double',NULL,NULL,0,0,0,1,63,NULL,NULL,NULL),('khsqbm','khsqbm','客户申请编码','text','string',NULL,NULL,0,0,0,1,66,NULL,NULL,NULL),('lxze','lxze','利息总额','text','double',NULL,NULL,0,0,0,1,64,NULL,NULL,NULL),('nl','nl','年龄','text','int',NULL,NULL,0,1,1,1,16,'年龄（年）',NULL,NULL),('org_dq','org_dq_show','大区','org','int','-1','org_jxs',2,1,1,1,2,NULL,NULL,NULL),('org_jxs','org_jxs_show','经销商','org','int','-1',NULL,3,1,1,1,3,'经销商名称','经销商名称','经销商名称'),('org_yxb','org_yxb_show','营销部','org','int','0','org_dq',1,1,1,1,1,NULL,NULL,NULL),('qyxz','qyxz_show','企业性质','dist','string','QYXZ',NULL,0,0,0,1,49,NULL,NULL,NULL),('sfkbl','sfkbl','首付款比例','text','double',NULL,NULL,0,0,0,1,60,'首付款比例 %',NULL,NULL),('sfkje','sfkje','首付款金额','text','double',NULL,NULL,0,0,0,1,61,NULL,NULL,NULL),('sjgcr_dhhm','sjgcr_dhhm','购车人电话号码','text','string',NULL,NULL,0,1,1,1,12,NULL,'实际购车人电话号码',NULL),('sjgcr_xm','sjgcr_xm','购车人姓名','text','string',NULL,NULL,0,1,1,1,10,NULL,'实际购车人姓名','客户名称'),('sjgcr_zjhm','sjgcr_zjhm','购车人证件号码','text','string',NULL,NULL,0,1,1,1,11,NULL,'实际购车人证件号码','证件号码'),('sqr_dhhm','sqr_dhhm','申请人电话号码','text','string',NULL,NULL,0,1,1,1,9,'电话','申请人电话',NULL),('sqr_xm','sqr_xm','申请人姓名','text','string',NULL,NULL,0,1,1,1,6,'姓名（中文）','申请人姓名',NULL),('sqr_zjhm','sqr_zjhm','申请人证件号码','text','string',NULL,NULL,0,1,1,1,8,'证件号码','申请人证件号码',NULL),('sqr_zjlx','sqr_zjlx_show','申请人证件类型','dist','string','ZJLX',NULL,0,0,0,1,7,'证件类型',NULL,NULL),('sqtjrq','sqtjrq','申请提交日期','date','date',NULL,NULL,0,0,0,1,21,NULL,NULL,NULL),('vin','vin','VIN号','text','string',NULL,NULL,0,0,0,1,28,NULL,NULL,NULL),('xb','xb_show','性别','dist','string','XB',NULL,0,0,0,1,15,NULL,NULL,NULL),('xqah','xqah','兴趣爱好','text','string',NULL,NULL,0,0,0,1,69,NULL,NULL,NULL),('xsjg','xsjg','销售价格','text','double',NULL,NULL,0,0,0,1,59,NULL,NULL,NULL),('yf','yf','月份','text','int',NULL,NULL,0,0,0,1,22,NULL,NULL,NULL),('ysr','ysr','月收入','text','int',NULL,NULL,0,0,0,1,41,NULL,NULL,NULL),('yyxhsl','yyxhsl_show','拥有小孩数量','dist','string','YYHZSL',NULL,0,0,0,1,70,NULL,NULL,NULL),('zc','zc','周次','text','int',NULL,NULL,0,0,0,1,24,NULL,NULL,NULL),('zcjg','zcjg','资产价格','text','double',NULL,NULL,0,0,0,1,54,NULL,NULL,NULL),('zw','zw','职位','text','string',NULL,NULL,0,0,0,1,50,NULL,NULL,NULL),('zylx','zylx_show','职业类型','dist','string','ZYLX',NULL,0,0,0,1,39,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='系统-菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'客户信息','index.jspx',1,1),(2,0,'系统管理','#',1,10),(3,2,'用户管理','admin/user/list.jspx',1,1),(4,2,'角色管理','admin/role/list.jspx',1,2),(5,2,'系统功能管理','admin/menu/list.jspx',1,3),(6,1,'客户信息查询','cm/list.jspx',1,2),(7,2,'组织机构管理','admin/org/list.jspx',1,4),(8,1,'新增客户信息','cm/add.jspx',1,3),(9,1,'修改客户信息','cm/edit.jspx',0,1),(10,1,'删除客户信息','cm/delete.do',0,2),(11,2,'普通字典管理','admin/dist/list.jspx',1,5),(12,2,'树形字典管理','admin/tree/list.jspx',1,6),(13,2,'字段配置','admin/field/list.jspx',1,7),(14,1,'导入客户信息','cm/imp.jspx',1,4),(15,11,'新增字典','admin/dist/add.do',0,2),(16,11,'修改字典','admin/dist/update.do',0,3),(17,11,'删除字典','admin/dist/delete.do',0,4),(18,13,'修改字段配置','admin/field/update.do',0,2),(19,5,'新增系统功能','admin/menu/add.do',0,2),(20,5,'修改系统功能','admin/menu/update.do',0,3),(21,5,'删除系统功能','admin/menu/delete.do',0,4),(22,7,'新增组织机构','admin/org/add.do',0,2),(23,7,'修改组织机构','admin/org/update.do',0,3),(24,7,'删除组织机构','admin/org/delete.do',0,4),(25,4,'新增角色','admin/role/add.do',0,2),(26,4,'修改角色','admin/role/update.do',0,3),(27,4,'删除角色','admin/role/delete.do',0,4),(28,12,'新增树字典','admin/tree/add.do',0,2),(29,12,'修改树字典','admin/tree/update.do',0,3),(30,12,'删除树字典','admin/tree/delete.do',0,4),(31,3,'新增用户','admin/user/add.do',0,2),(32,3,'修改用户','admin/user/update.do',0,3),(33,3,'删除用户','admin/user/delete.do',0,4),(34,11,'字典列表','admin/dist/list.do',0,1),(35,5,'系统功能列表','admin/menu/list.do',0,1),(36,7,'组织机构列表','admin/org/list.do',0,1),(37,4,'角色列表','admin/role/list.do',0,1),(38,12,'树字典列表','admin/tree/list.do',0,1),(39,3,'用户列表','admin/user/list.do',0,1),(40,13,'字段列表','admin/field/loadAll.do',0,1),(41,1,'导出客户信息','cm/exp.do',0,5),(42,1,'客户信息明细','cm/detail.jspx',0,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_org`
--

LOCK TABLES `sys_org` WRITE;
/*!40000 ALTER TABLE `sys_org` DISABLE KEYS */;
INSERT INTO `sys_org` VALUES (1,1,0,'深圳营销部',',1,'),(3,2,1,'宝安大区',',1,3,'),(4,2,1,'福田大区',',1,4,'),(5,2,1,'龙岗大区',',1,5,'),(6,2,1,'龙华大区',',1,6,'),(9,1,0,'上海营销部',',9,'),(10,2,9,'上海一区',',9,10,'),(11,2,9,'上海二区',',9,11,'),(12,2,9,'上海三区',',9,12,'),(13,3,3,'深圳市东盛汽车销售服务有限公司',',1,3,13,'),(14,3,3,'深圳金环怡投资有限公司',',1,3,14,'),(15,3,4,'深圳市三维都灵汽车销售服务有限公司',',1,4,15,'),(16,3,4,'深圳市粤迪汽车贸易有限公司南山分公司',',1,4,16,'),(18,3,5,'深圳市湛宝实业发展有限公司',',1,5,18,'),(19,3,5,'深圳市泽然浩商贸有限公司',',1,5,19,'),(85,1,0,'西北营销部',',85,'),(86,2,85,'西北大区',',85,86,'),(87,3,86,'西安嘉丽实业有限公司',',85,86,87,'),(88,1,0,'华东营销部',',88,'),(89,2,88,'华东大区',',88,89,'),(90,3,89,'安徽金丰汽车销售服务有限公司',',88,89,90,'),(91,1,0,'华中营销部',',91,'),(92,2,91,'华南大区',',91,92,'),(93,3,92,'湖南岳迪汽车销售有限公司',',91,92,93,'),(94,1,0,'西南营销部',',94,'),(95,2,94,'川渝鄂大区',',94,95,'),(96,3,95,'南充博宇车业有限公司',',94,95,96,'),(97,3,95,'泸州忠山汽车销售有限责任公司',',94,95,97,'),(98,3,86,'榆林市晶鑫汽贸有限责任公司',',85,86,98,'),(99,2,91,'华中大区',',91,99,'),(100,3,99,'赣州众和汽车销售服务有限公司',',91,99,100,'),(101,3,99,'宜春年富汽车贸易有限公司',',91,99,101,'),(102,3,89,'安徽畅通汽车销售有限公司',',88,89,102,'),(103,3,99,'驻马店市东方汽车贸易服务有限公司',',91,99,103,');
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
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8 COMMENT='系统-角色-菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (413,2,1),(414,2,9),(415,2,6),(416,2,10),(417,2,8),(418,2,14),(419,2,41),(420,2,42),(421,2,2),(422,2,3),(423,2,39),(424,2,31),(425,2,32),(426,2,33),(427,2,4),(428,2,37),(429,2,25),(430,2,26),(431,2,27),(432,2,5),(433,2,35),(434,2,19),(435,2,20),(436,2,21),(437,2,7),(438,2,36),(439,2,22),(440,2,23),(441,2,24),(442,2,11),(443,2,34),(444,2,15),(445,2,16),(446,2,17),(447,2,12),(448,2,38),(449,2,28),(450,2,29),(451,2,30),(452,2,13),(453,2,40),(454,2,18),(476,3,1),(477,3,9),(478,3,6),(479,3,10),(480,3,8),(481,3,14),(482,3,41),(483,3,42);
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
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_tree`
--

LOCK TABLES `sys_tree` WRITE;
/*!40000 ALTER TABLE `sys_tree` DISABLE KEYS */;
INSERT INTO `sys_tree` VALUES (11,'HYLX',1,0,'采矿业',',11,'),(12,'HYLX',1,0,'制造业',',12,'),(13,'HYLX',1,0,'建筑业',',13,'),(14,'HYLX',1,0,'金融业',',14,'),(15,'HYLX',1,0,'房地产业',',15,'),(16,'HYLX',1,0,'教育',',16,'),(17,'HYLX',1,0,'国际组织',',17,'),(18,'HYLX',1,0,'批发和零售业',',18,'),(19,'HYLX',1,0,'住宿和餐饮业',',19,'),(20,'HYLX',1,0,'卫生和社会工作',',20,'),(21,'HYLX',1,0,'租赁和商务服务业',',21,'),(22,'HYLX',1,0,'交通运输、仓储和邮政业',',22,'),(23,'HYLX',1,0,'电力、热力、燃气及水生产和供应业',',23,'),(24,'HYLX',1,0,'居民服务、修理和其他服务业',',24,'),(25,'HYLX',1,0,'水利、环境和公共设施管理业',',25,'),(26,'HYLX',1,0,'信息传输、软件和信息技术服务业',',26,'),(27,'HYLX',1,0,'科学研究和技术服务业',',27,'),(28,'HYLX',1,0,'农、林、牧、渔业',',28,'),(29,'HYLX',1,0,'公共管理、社会保障和社会组织',',29,'),(30,'HYLX',1,0,'文化、体育和娱乐业',',30,'),(31,'HYLX',1,0,'其他',',31,'),(32,'HYLX',2,31,'其他',',31,32,'),(33,'HYLX',2,15,'房地产开发经营',',15,33,'),(34,'HYLX',2,13,'房屋和土木工程建筑业',',13,34,'),(35,'HYLX',2,18,'批发业 Wholesale Trade',',18,35,'),(36,'HYLX',2,24,'其他服务业 Other Services',',24,36,'),(111,'HYLX',2,11,'煤炭开采和洗选业',',11,111,'),(114,'HYLX',2,12,'家具制造业',',12,114,'),(116,'HYLX',2,12,'工艺品及其他制造业',',12,116,'),(117,'HYLX',2,22,'道路运输业',',22,117,'),(119,'HYLX',2,18,'零售业 Retail Trade',',18,119,'),(122,'HYLX',2,14,'银行业',',14,122,'),(123,'HYLX',2,14,'其他金融活动',',14,123,'),(124,'HYLX',2,12,'仪器仪表及文化、办公用机械制造业',',12,124,'),(150,'CITY',1,0,'河北省',',150,'),(151,'CITY',2,150,'石家庄',',150,151,'),(152,'CITY',2,150,'保定市',',150,152,'),(153,'CITY',2,150,'秦皇岛',',150,153,'),(154,'CITY',2,150,'唐山市',',150,154,'),(155,'CITY',2,150,'邯郸市',',150,155,'),(156,'CITY',2,150,'邢台市',',150,156,'),(157,'CITY',2,150,'沧州市',',150,157,'),(158,'CITY',2,150,'承德市',',150,158,'),(159,'CITY',2,150,'廊坊市',',150,159,'),(160,'CITY',2,150,'衡水市',',150,160,'),(161,'CITY',2,150,'张家口',',150,161,'),(162,'CITY',1,0,'山西省',',162,'),(163,'CITY',2,162,'太原市',',162,163,'),(164,'CITY',2,162,'大同市',',162,164,'),(165,'CITY',2,162,'阳泉市',',162,165,'),(166,'CITY',2,162,'长治市',',162,166,'),(167,'CITY',2,162,'临汾市',',162,167,'),(168,'CITY',2,162,'晋中市',',162,168,'),(169,'CITY',2,162,'运城市',',162,169,'),(170,'CITY',2,162,'晋城市',',162,170,'),(171,'CITY',2,162,'忻州市',',162,171,'),(172,'CITY',2,162,'朔州市',',162,172,'),(173,'CITY',2,162,'吕梁市',',162,173,'),(174,'CITY',1,0,'内蒙古',',174,'),(175,'CITY',2,174,'呼和浩特',',174,175,'),(176,'CITY',2,174,'呼伦贝尔',',174,176,'),(177,'CITY',2,174,'包头市',',174,177,'),(178,'CITY',2,174,'赤峰市',',174,178,'),(179,'CITY',2,174,'乌海市',',174,179,'),(180,'CITY',2,174,'通辽市',',174,180,'),(181,'CITY',2,174,'鄂尔多斯',',174,181,'),(182,'CITY',2,174,'乌兰察布',',174,182,'),(183,'CITY',2,174,'巴彦淖尔',',174,183,'),(184,'CITY',1,0,'辽宁省',',184,'),(185,'CITY',2,184,'盘锦市',',184,185,'),(186,'CITY',2,184,'鞍山市',',184,186,'),(187,'CITY',2,184,'抚顺市',',184,187,'),(188,'CITY',2,184,'本溪市',',184,188,'),(189,'CITY',2,184,'铁岭市',',184,189,'),(190,'CITY',2,184,'锦州市',',184,190,'),(191,'CITY',2,184,'丹东市',',184,191,'),(192,'CITY',2,184,'辽阳市',',184,192,'),(193,'CITY',2,184,'葫芦岛',',184,193,'),(194,'CITY',2,184,'阜新市',',184,194,'),(195,'CITY',2,184,'朝阳市',',184,195,'),(196,'CITY',2,184,'营口市',',184,196,'),(197,'CITY',1,0,'吉林省',',197,'),(198,'CITY',2,197,'吉林市',',197,198,'),(199,'CITY',2,197,'通化市',',197,199,'),(200,'CITY',2,197,'白城市',',197,200,'),(201,'CITY',2,197,'四平市',',197,201,'),(202,'CITY',2,197,'辽源市',',197,202,'),(203,'CITY',2,197,'松原市',',197,203,'),(204,'CITY',2,197,'白山市',',197,204,'),(205,'CITY',1,0,'黑龙江省',',205,'),(206,'CITY',2,205,'伊春市',',205,206,'),(207,'CITY',2,205,'牡丹江',',205,207,'),(208,'CITY',2,205,'大庆市',',205,208,'),(209,'CITY',2,205,'鸡西市',',205,209,'),(210,'CITY',2,205,'鹤岗市',',205,210,'),(211,'CITY',2,205,'绥化市',',205,211,'),(212,'CITY',2,205,'双鸭山',',205,212,'),(213,'CITY',2,205,'七台河',',205,213,'),(214,'CITY',2,205,'佳木斯',',205,214,'),(215,'CITY',2,205,'黑河市',',205,215,'),(216,'CITY',2,205,'齐齐哈尔市',',205,216,'),(217,'CITY',1,0,'江苏省',',217,'),(218,'CITY',2,217,'无锡市',',217,218,'),(219,'CITY',2,217,'常州市',',217,219,'),(220,'CITY',2,217,'扬州市',',217,220,'),(221,'CITY',2,217,'徐州市',',217,221,'),(222,'CITY',2,217,'苏州市',',217,222,'),(223,'CITY',2,217,'连云港',',217,223,'),(224,'CITY',2,217,'盐城市',',217,224,'),(225,'CITY',2,217,'淮安市',',217,225,'),(226,'CITY',2,217,'宿迁市',',217,226,'),(227,'CITY',2,217,'镇江市',',217,227,'),(228,'CITY',2,217,'南通市',',217,228,'),(229,'CITY',2,217,'泰州市',',217,229,'),(230,'CITY',1,0,'浙江省',',230,'),(231,'CITY',2,230,'绍兴市',',230,231,'),(232,'CITY',2,230,'温州市',',230,232,'),(233,'CITY',2,230,'湖州市',',230,233,'),(234,'CITY',2,230,'嘉兴市',',230,234,'),(235,'CITY',2,230,'台州市',',230,235,'),(236,'CITY',2,230,'金华市',',230,236,'),(237,'CITY',2,230,'舟山市',',230,237,'),(238,'CITY',2,230,'衢州市',',230,238,'),(239,'CITY',2,230,'丽水市',',230,239,'),(240,'CITY',2,230,'安徽省',',230,240,'),(241,'CITY',1,0,'福建省',',241,'),(242,'CITY',2,241,'福州市',',241,242,'),(243,'CITY',2,241,'泉州市',',241,243,'),(244,'CITY',2,241,'漳州市',',241,244,'),(245,'CITY',2,241,'南平市',',241,245,'),(246,'CITY',2,241,'三明市',',241,246,'),(247,'CITY',2,241,'龙岩市',',241,247,'),(248,'CITY',2,241,'莆田市',',241,248,'),(249,'CITY',2,241,'宁德市',',241,249,'),(250,'CITY',1,0,'江西省',',250,'),(251,'CITY',2,250,'南昌市',',250,251,'),(252,'CITY',2,250,'赣州市',',250,252,'),(253,'CITY',2,250,'景德镇',',250,253,'),(254,'CITY',2,250,'九江市',',250,254,'),(255,'CITY',2,250,'萍乡市',',250,255,'),(256,'CITY',2,250,'新余市',',250,256,'),(257,'CITY',2,250,'抚州市',',250,257,'),(258,'CITY',2,250,'宜春市',',250,258,'),(259,'CITY',2,250,'上饶市',',250,259,'),(260,'CITY',2,250,'鹰潭市',',250,260,'),(261,'CITY',2,250,'吉安市',',250,261,'),(262,'CITY',1,0,'山东省',',262,'),(263,'CITY',2,262,'潍坊市',',262,263,'),(264,'CITY',2,262,'淄博市',',262,264,'),(265,'CITY',2,262,'威海市',',262,265,'),(266,'CITY',2,262,'枣庄市',',262,266,'),(267,'CITY',2,262,'泰安市',',262,267,'),(268,'CITY',2,262,'临沂市',',262,268,'),(269,'CITY',2,262,'东营市',',262,269,'),(270,'CITY',2,262,'济宁市',',262,270,'),(271,'CITY',2,262,'烟台市',',262,271,'),(272,'CITY',2,262,'菏泽市',',262,272,'),(273,'CITY',2,262,'日照市',',262,273,'),(274,'CITY',2,262,'德州市',',262,274,'),(275,'CITY',2,262,'聊城市',',262,275,'),(276,'CITY',2,262,'滨州市',',262,276,'),(277,'CITY',2,262,'莱芜市',',262,277,'),(278,'CITY',1,0,'河南省',',278,'),(279,'CITY',2,278,'郑州市',',278,279,'),(280,'CITY',2,278,'洛阳市',',278,280,'),(281,'CITY',2,278,'焦作市',',278,281,'),(282,'CITY',2,278,'商丘市',',278,282,'),(283,'CITY',2,278,'信阳市',',278,283,'),(284,'CITY',2,278,'新乡市',',278,284,'),(285,'CITY',2,278,'安阳市',',278,285,'),(286,'CITY',2,278,'开封市',',278,286,'),(287,'CITY',2,278,'漯河市',',278,287,'),(288,'CITY',2,278,'南阳市',',278,288,'),(289,'CITY',2,278,'鹤壁市',',278,289,'),(290,'CITY',2,278,'平顶山',',278,290,'),(291,'CITY',2,278,'濮阳市',',278,291,'),(292,'CITY',2,278,'许昌市',',278,292,'),(293,'CITY',2,278,'周口市',',278,293,'),(294,'CITY',2,278,'三门峡',',278,294,'),(295,'CITY',2,278,'驻马店',',278,295,'),(296,'CITY',1,0,'湖北省',',296,'),(297,'CITY',2,296,'荆门市',',296,297,'),(298,'CITY',2,296,'咸宁市',',296,298,'),(299,'CITY',2,296,'襄樊市',',296,299,'),(300,'CITY',2,296,'荆州市',',296,300,'),(301,'CITY',2,296,'黄石市',',296,301,'),(302,'CITY',2,296,'宜昌市',',296,302,'),(303,'CITY',2,296,'随州市',',296,303,'),(304,'CITY',2,296,'鄂州市',',296,304,'),(305,'CITY',2,296,'孝感市',',296,305,'),(306,'CITY',2,296,'黄冈市',',296,306,'),(307,'CITY',2,296,'十堰市',',296,307,'),(308,'CITY',1,0,'湖南省',',308,'),(309,'CITY',2,308,'长沙市',',308,309,'),(310,'CITY',2,308,'郴州市',',308,310,'),(311,'CITY',2,308,'娄底市',',308,311,'),(312,'CITY',2,308,'衡阳市',',308,312,'),(313,'CITY',2,308,'株洲市',',308,313,'),(314,'CITY',2,308,'湘潭市',',308,314,'),(315,'CITY',2,308,'岳阳市',',308,315,'),(316,'CITY',2,308,'常德市',',308,316,'),(317,'CITY',2,308,'邵阳市',',308,317,'),(318,'CITY',2,308,'益阳市',',308,318,'),(319,'CITY',2,308,'永州市',',308,319,'),(320,'CITY',2,308,'张家界',',308,320,'),(321,'CITY',2,308,'怀化市',',308,321,'),(322,'CITY',1,0,'广东省',',322,'),(323,'CITY',2,322,'江门市',',322,323,'),(324,'CITY',2,322,'佛山市',',322,324,'),(325,'CITY',2,322,'汕头市',',322,325,'),(326,'CITY',2,322,'湛江市',',322,326,'),(327,'CITY',2,322,'韶关市',',322,327,'),(328,'CITY',2,322,'中山市',',322,328,'),(329,'CITY',2,322,'珠海市',',322,329,'),(330,'CITY',2,322,'茂名市',',322,330,'),(331,'CITY',2,322,'肇庆市',',322,331,'),(332,'CITY',2,322,'阳江市',',322,332,'),(333,'CITY',2,322,'惠州市',',322,333,'),(334,'CITY',2,322,'潮州市',',322,334,'),(335,'CITY',2,322,'揭阳市',',322,335,'),(336,'CITY',2,322,'清远市',',322,336,'),(337,'CITY',2,322,'河源市',',322,337,'),(338,'CITY',2,322,'东莞市',',322,338,'),(339,'CITY',2,322,'汕尾市',',322,339,'),(340,'CITY',2,322,'云浮市',',322,340,'),(341,'CITY',1,0,'广西省',',341,'),(342,'CITY',2,341,'南宁市',',341,342,'),(343,'CITY',2,341,'贺州市',',341,343,'),(344,'CITY',2,341,'柳州市',',341,344,'),(345,'CITY',2,341,'桂林市',',341,345,'),(346,'CITY',2,341,'梧州市',',341,346,'),(347,'CITY',2,341,'北海市',',341,347,'),(348,'CITY',2,341,'玉林市',',341,348,'),(349,'CITY',2,341,'钦州市',',341,349,'),(350,'CITY',2,341,'百色市',',341,350,'),(351,'CITY',2,341,'防城港',',341,351,'),(352,'CITY',2,341,'贵港市',',341,352,'),(353,'CITY',2,341,'河池市',',341,353,'),(354,'CITY',2,341,'崇左市',',341,354,'),(355,'CITY',2,341,'来宾市',',341,355,'),(356,'CITY',1,0,'海南省',',356,'),(357,'CITY',2,356,'海口市',',356,357,'),(358,'CITY',2,356,'三亚市',',356,358,'),(359,'CITY',1,0,'四川省',',359,'),(360,'CITY',2,359,'乐山市',',359,360,'),(361,'CITY',2,359,'雅安市',',359,361,'),(362,'CITY',2,359,'广安市',',359,362,'),(363,'CITY',2,359,'南充市',',359,363,'),(364,'CITY',2,359,'自贡市',',359,364,'),(365,'CITY',2,359,'泸州市',',359,365,'),(366,'CITY',2,359,'内江市',',359,366,'),(367,'CITY',2,359,'宜宾市',',359,367,'),(368,'CITY',2,359,'广元市',',359,368,'),(369,'CITY',2,359,'达州市',',359,369,'),(370,'CITY',2,359,'资阳市',',359,370,'),(371,'CITY',2,359,'绵阳市',',359,371,'),(372,'CITY',2,359,'眉山市',',359,372,'),(373,'CITY',2,359,'巴中市',',359,373,'),(374,'CITY',2,359,'攀枝花',',359,374,'),(375,'CITY',2,359,'遂宁市',',359,375,'),(376,'CITY',2,359,'德阳市',',359,376,'),(377,'CITY',1,0,'贵州省',',377,'),(378,'CITY',2,377,'贵阳市',',377,378,'),(379,'CITY',2,377,'安顺市',',377,379,'),(380,'CITY',2,377,'遵义市',',377,380,'),(381,'CITY',2,377,'六盘水',',377,381,'),(382,'CITY',1,0,'云南省',',382,'),(383,'CITY',2,382,'昆明市',',382,383,'),(384,'CITY',2,382,'玉溪市',',382,384,'),(385,'CITY',2,382,'大理市',',382,385,'),(386,'CITY',2,382,'曲靖市',',382,386,'),(387,'CITY',2,382,'昭通市',',382,387,'),(388,'CITY',2,382,'保山市',',382,388,'),(389,'CITY',2,382,'丽江市',',382,389,'),(390,'CITY',2,382,'临沧市',',382,390,'),(391,'CITY',1,0,'西藏',',391,'),(392,'CITY',2,391,'拉萨市',',391,392,'),(393,'CITY',2,391,'阿里',',391,393,'),(394,'CITY',1,0,'陕西省',',394,'),(395,'CITY',2,394,'咸阳市',',394,395,'),(396,'CITY',2,394,'榆林市',',394,396,'),(397,'CITY',2,394,'宝鸡市',',394,397,'),(398,'CITY',2,394,'铜川市',',394,398,'),(399,'CITY',2,394,'渭南市',',394,399,'),(400,'CITY',2,394,'汉中市',',394,400,'),(401,'CITY',2,394,'安康市',',394,401,'),(402,'CITY',2,394,'商洛市',',394,402,'),(403,'CITY',2,394,'延安市',',394,403,'),(404,'CITY',1,0,'甘肃省',',404,'),(405,'CITY',2,404,'兰州市',',404,405,'),(406,'CITY',2,404,'白银市',',404,406,'),(407,'CITY',2,404,'武威市',',404,407,'),(408,'CITY',2,404,'金昌市',',404,408,'),(409,'CITY',2,404,'平凉市',',404,409,'),(410,'CITY',2,404,'张掖市',',404,410,'),(411,'CITY',2,404,'嘉峪关',',404,411,'),(412,'CITY',2,404,'酒泉市',',404,412,'),(413,'CITY',2,404,'庆阳市',',404,413,'),(414,'CITY',2,404,'定西市',',404,414,'),(415,'CITY',2,404,'陇南市',',404,415,'),(416,'CITY',2,404,'天水市',',404,416,'),(417,'CITY',1,0,'青海省',',417,'),(418,'CITY',2,417,'西宁市',',417,418,'),(419,'CITY',1,0,'宁夏',',419,'),(420,'CITY',2,419,'银川市',',419,420,'),(421,'CITY',2,419,'固原市',',419,421,'),(422,'CITY',2,419,'青铜峡市',',419,422,'),(423,'CITY',2,419,'石嘴山市',',419,423,'),(424,'CITY',2,419,'中卫市',',419,424,'),(425,'CITY',1,0,'新疆',',425,'),(426,'CITY',2,425,'乌鲁木齐',',425,426,'),(427,'CITY',2,425,'克拉玛依市',',425,427,'),(428,'CITY',1,0,'香港特别行政区',',428,'),(429,'CITY',2,428,'香港岛',',428,429,'),(430,'CITY',2,428,'九龙',',428,430,'),(431,'CITY',2,428,'新界',',428,431,'),(432,'CITY',2,428,'新界西',',428,432,'),(433,'CITY',1,0,'澳门特别行政区',',433,'),(434,'CITY',2,433,'澳门半岛',',433,434,'),(435,'CITY',2,433,'澳门离岛',',433,435,'),(436,'CITY',1,0,'台湾',',436,'),(437,'CITY',2,436,'基隆市',',436,437,'),(438,'CITY',2,436,'台中市',',436,438,'),(439,'CITY',2,436,'新竹市',',436,439,'),(440,'CITY',2,436,'台南市',',436,440,'),(441,'CITY',2,436,'嘉义市',',436,441,'),(442,'CITY',2,436,'台北县',',436,442,'),(443,'CITY',2,436,'台东县',',436,443,'),(444,'CITY',2,436,'澎湖县',',436,444,'),(445,'CITY',2,436,'花莲县',',436,445,'),(446,'CITY',2,436,'屏东县',',436,446,'),(447,'CITY',2,436,'高雄县',',436,447,'),(448,'CITY',2,436,'台南县',',436,448,'),(449,'CITY',2,436,'嘉义县',',436,449,'),(450,'CITY',2,436,'云林县',',436,450,'),(451,'CITY',2,436,'南投县',',436,451,'),(452,'CITY',2,436,'彰化县',',436,452,'),(453,'CITY',2,436,'台中县',',436,453,'),(454,'CITY',2,436,'苗栗县',',436,454,'),(455,'CITY',2,436,'桃园县',',436,455,'),(456,'CITY',2,436,'宜兰县',',436,456,'),(457,'CITY',2,436,'新竹县',',436,457,'),(458,'CITY',2,436,'台北市',',436,458,'),(459,'CITY',2,436,'高雄市',',436,459,'),(460,'CITY',2,436,'马祖县',',436,460,'),(461,'CITY',2,436,'金门县',',436,461,'),(491,'CITY',1,0,'湖南',',491,'),(492,'CITY',2,491,'长沙',',491,492,'),(493,'CITY',1,0,'陕西',',493,'),(494,'CITY',2,493,'西安',',493,494,'),(495,'CITY',1,0,'安徽',',495,'),(496,'CITY',2,495,'六安',',495,496,'),(497,'CITY',1,0,'四川',',497,'),(498,'CITY',2,497,'南充',',497,498,'),(499,'CITY',2,497,'泸州',',497,499,'),(500,'CITY',2,493,'榆林',',493,500,'),(501,'CITY',1,0,'江西',',501,'),(502,'CITY',2,501,'赣州',',501,502,'),(503,'CITY',2,501,'宜春',',501,503,'),(504,'CITY',2,495,'滁州',',495,504,'),(505,'CITY',1,0,'河南',',505,'),(506,'CITY',2,505,'驻马店',',505,506,');
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
INSERT INTO `sys_user` VALUES (1,'admin','f6fdffe48c908deb0f4c3bd36c032e72','管理员','','','2016-09-25 11:14:13','2016-10-30 18:28:19',0,',2,',',管理员,',',1,9,85,91,'),(2,'dw_jiangkunpeng','99800032b7d26893553ce81530e0f821','姜昆鹏','15899954940','jakey766@163.com','2016-09-25 11:14:40','2016-10-30 18:28:31',0,',3,',',普通用户,',',3,4,86,');
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

-- Dump completed on 2016-10-30 19:16:29
