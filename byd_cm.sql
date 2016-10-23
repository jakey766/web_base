/*
MySQL Data Transfer
Source Host: localhost
Source Database: byd_cm
Target Host: localhost
Target Database: byd_cm
Date: 2016/10/23 17:07:06
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for cm_info
-- ----------------------------
DROP TABLE IF EXISTS `cm_info`;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_dist
-- ----------------------------
DROP TABLE IF EXISTS `sys_dist`;
CREATE TABLE `sys_dist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '类型',
  `key` varchar(100) NOT NULL COMMENT '字典键',
  `name` varchar(100) NOT NULL COMMENT '字典值',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_type_key` (`type`,`key`),
  KEY `idx_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_field
-- ----------------------------
DROP TABLE IF EXISTS `sys_field`;
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

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(20) NOT NULL COMMENT '菜单名',
  `uri` text COMMENT '链接',
  `is_menu` int(1) NOT NULL COMMENT '是否做为菜单',
  `sort_index` int(11) DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='系统-菜单';

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '类型',
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `code` varchar(500) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`),
  KEY `type_pid` (`type`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名',
  `desc` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统-角色';

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COMMENT='系统-角色-菜单';

-- ----------------------------
-- Table structure for sys_tree
-- ----------------------------
DROP TABLE IF EXISTS `sys_tree`;
CREATE TABLE `sys_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '类型',
  `level` int(11) NOT NULL COMMENT '层次',
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `code` varchar(500) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`),
  KEY `type_pid` (`type`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
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

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `cm_info` VALUES ('1', '0', '0', '0', null, '1', '3', ',1,3,', '张三', null, '123456', '13800138000', null, null, null, 'PY', null, '1', '0', null, null, null, null, null, null, '0', null, '0', null, null, null, 'LC0CD4C37F1105125', null, null, null, null, null, null, null, null, '0', '0', null, null, null, '0', '0', '0', null, null, null, '0', null, null, null, null, null, '0', '0', null, null, null, null, '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, '1');
INSERT INTO `cm_info` VALUES ('2', '1', '3', '13', null, '1', '4', null, '姜昆鹏', '1', '123456', '13800138000', '卓鸿博', '654321', '13900139000', 'PY', null, null, '0', null, null, null, null, null, null, '0', null, '0', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, null, null, '0', '0', '0', null, null, null, '0', null, null, null, null, null, '0', '0', null, null, null, null, '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, '0');
INSERT INTO `cm_info` VALUES ('3', '0', '0', '0', null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, '0', null, '0', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, null, null, '0', '0', '0', null, null, null, '0', null, null, null, null, null, '0', '0', null, null, null, null, '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, '1');
INSERT INTO `cm_info` VALUES ('4', '0', '0', '0', null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, '0', null, '0', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, null, null, '0', '0', '0', null, null, null, '0', null, null, null, null, null, '0', '0', null, null, null, null, '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, '1');
INSERT INTO `cm_info` VALUES ('5', '9', '10', '0', null, '2', '6', null, '张三', '1', '123456', '13800138000', '张三', '123456', '13800138000', 'FQ', null, null, '0', null, null, null, null, null, null, '0', null, '0', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, null, null, '0', '0', '0', null, null, null, '0', null, null, null, null, null, '0', '0', null, null, null, null, '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_dist` VALUES ('1', 'ZJLX', '1', '身份证', '');
INSERT INTO `sys_dist` VALUES ('2', 'ZJLX', '2', '护照', '');
INSERT INTO `sys_dist` VALUES ('3', 'XB', '1', '男', '');
INSERT INTO `sys_dist` VALUES ('4', 'XB', '2', '女', '');
INSERT INTO `sys_dist` VALUES ('5', 'JYCD', '7', '博士', '');
INSERT INTO `sys_dist` VALUES ('6', 'JYCD', '6', '硕士', '');
INSERT INTO `sys_dist` VALUES ('7', 'JYCD', '5', '本科', '');
INSERT INTO `sys_dist` VALUES ('8', 'JYCD', '4', '大专', '');
INSERT INTO `sys_dist` VALUES ('9', 'JYCD', '3', '中专及高中', '');
INSERT INTO `sys_dist` VALUES ('10', 'JYCD', '2', '初中', '');
INSERT INTO `sys_dist` VALUES ('11', 'JYCD', '1', '小学', '');
INSERT INTO `sys_dist` VALUES ('13', 'FCLX', '1', '全款自购商品房', '');
INSERT INTO `sys_dist` VALUES ('14', 'FCLX', '2', '全款自购经适房', '');
INSERT INTO `sys_dist` VALUES ('15', 'FCLX', '3', '按揭自购商品房', '');
INSERT INTO `sys_dist` VALUES ('16', 'FCLX', '4', '按揭自购经适房', '');
INSERT INTO `sys_dist` VALUES ('17', 'FCLX', '5', '公司房', '');
INSERT INTO `sys_dist` VALUES ('18', 'FCLX', '6', '直系亲属房', '');
INSERT INTO `sys_dist` VALUES ('19', 'FCLX', '7', '租赁房', '');
INSERT INTO `sys_dist` VALUES ('20', 'FCLX', '8', '自建房', '');
INSERT INTO `sys_dist` VALUES ('21', 'FCLX', '9', '宅基地', '');
INSERT INTO `sys_dist` VALUES ('22', 'FCLX', '10', '公产房', '');
INSERT INTO `sys_dist` VALUES ('23', 'FCLX', '11', '小产权房', '');
INSERT INTO `sys_dist` VALUES ('24', 'HYZK', '1', '单身', '');
INSERT INTO `sys_dist` VALUES ('25', 'HYZK', '2', '已婚', '');
INSERT INTO `sys_dist` VALUES ('26', 'HYZK', '3', '离婚', '');
INSERT INTO `sys_dist` VALUES ('27', 'HYZK', '4', '丧偶', '');
INSERT INTO `sys_dist` VALUES ('28', 'JTRS', '1', '1', '');
INSERT INTO `sys_dist` VALUES ('29', 'JTRS', '2', '2', '');
INSERT INTO `sys_dist` VALUES ('30', 'JTRS', '3', '3', '');
INSERT INTO `sys_dist` VALUES ('31', 'JTRS', '4', '4', '');
INSERT INTO `sys_dist` VALUES ('32', 'JTRS', '5', '5', '');
INSERT INTO `sys_dist` VALUES ('33', 'JTRS', '6', '6', '');
INSERT INTO `sys_dist` VALUES ('34', 'JTRS', '7', '7', '');
INSERT INTO `sys_dist` VALUES ('35', 'JTRS', '8', '8', '');
INSERT INTO `sys_dist` VALUES ('61', 'FKFS', '1', '全款', '');
INSERT INTO `sys_dist` VALUES ('62', 'FKFS', '2', '贷款', '');
INSERT INTO `sys_dist` VALUES ('63', 'HKZT', '1', '已还款', '');
INSERT INTO `sys_dist` VALUES ('64', 'HKZT', '2', '未还款', '');
INSERT INTO `sys_dist` VALUES ('65', 'HKZT', '3', '还款中', '');
INSERT INTO `sys_dist` VALUES ('66', 'DQZT', '1', '正常', '');
INSERT INTO `sys_dist` VALUES ('67', 'DQZT', '2', '异常', '');
INSERT INTO `sys_dist` VALUES ('68', 'QYXZ', '1', '国有', '');
INSERT INTO `sys_dist` VALUES ('69', 'QYXZ', '2', '集体', '');
INSERT INTO `sys_dist` VALUES ('70', 'QYXZ', '3', '联营', '');
INSERT INTO `sys_dist` VALUES ('71', 'QYXZ', '4', '股份制', '');
INSERT INTO `sys_dist` VALUES ('72', 'QYXZ', '5', '私营', '');
INSERT INTO `sys_dist` VALUES ('73', 'QYXZ', '6', '个体', '');
INSERT INTO `sys_dist` VALUES ('74', 'QYXZ', '7', '合伙', '');
INSERT INTO `sys_dist` VALUES ('75', 'DKQS', '12', '12期', '');
INSERT INTO `sys_dist` VALUES ('76', 'DKQS', '24', '24期', '');
INSERT INTO `sys_dist` VALUES ('77', 'DKQS', '36', '36期', '');
INSERT INTO `sys_dist` VALUES ('80', 'YYHZSL', '1', '1', '');
INSERT INTO `sys_dist` VALUES ('81', 'YYHZSL', '2', '2', '');
INSERT INTO `sys_dist` VALUES ('82', 'YYHZSL', '3', '3', '');
INSERT INTO `sys_dist` VALUES ('83', 'YYHZSL', '4', '4', '');
INSERT INTO `sys_dist` VALUES ('84', 'YYHZSL', '5', '5', '');
INSERT INTO `sys_dist` VALUES ('91', 'CXING', 'QIN', '秦', '');
INSERT INTO `sys_dist` VALUES ('92', 'CXING', 'G5', 'G5', '');
INSERT INTO `sys_dist` VALUES ('93', 'CXING', 'S7', 'S7', '');
INSERT INTO `sys_dist` VALUES ('94', 'CXING', 'SURUI', '速锐', '');
INSERT INTO `sys_dist` VALUES ('95', 'CXYS', '天山白', '天山白', '');
INSERT INTO `sys_dist` VALUES ('96', 'CXYS', '皓月银', '皓月银', '');
INSERT INTO `sys_dist` VALUES ('97', 'CXYS', '魔力橙', '魔力橙', '');
INSERT INTO `sys_dist` VALUES ('98', 'CXYS', '德兰黑', '德兰黑', '');
INSERT INTO `sys_dist` VALUES ('99', 'CXYS', '巧克力棕', '巧克力棕', '');
INSERT INTO `sys_dist` VALUES ('102', 'CXI', '旗舰版', '旗舰版', '');
INSERT INTO `sys_dist` VALUES ('103', 'CXI', '豪华版', '豪华版', '');
INSERT INTO `sys_dist` VALUES ('104', 'CXI', '尊贵版', '尊贵版', '');
INSERT INTO `sys_dist` VALUES ('105', 'LZGX', 'FQ', '夫妻', '');
INSERT INTO `sys_dist` VALUES ('106', 'LZGX', 'FZN', '父子/女', '');
INSERT INTO `sys_dist` VALUES ('107', 'LZGX', 'PY', '朋友', '');
INSERT INTO `sys_field` VALUES ('city_cs', 'city_cs_show', '城市', 'tree', 'int', 'CITY', null, '2', '1', '1', '1', '5', null, null, null);
INSERT INTO `sys_field` VALUES ('city_sf', 'city_sf_show', '省份', 'tree', 'int', 'CITY', 'city_cs', '1', '1', '1', '1', '4', null, null, null);
INSERT INTO `sys_field` VALUES ('cphm', 'cphm', '车牌号码', 'text', 'string', null, null, '0', '0', '0', '1', '27', null, null, null);
INSERT INTO `sys_field` VALUES ('cplx', 'cplx', '产品类型', 'text', 'string', null, null, '0', '0', '0', '1', '57', null, null, null);
INSERT INTO `sys_field` VALUES ('cpz', 'cpz', '产品组', 'text', 'string', null, null, '0', '0', '0', '1', '56', null, null, null);
INSERT INTO `sys_field` VALUES ('csys', 'csys_show', '车身颜色', 'dist', 'int', 'CXYS', null, '0', '0', '0', '1', '55', null, null, null);
INSERT INTO `sys_field` VALUES ('cxi', 'cxi_show', '车系', 'dist', 'int', 'CXI', null, '0', '0', '0', '1', '25', null, null, null);
INSERT INTO `sys_field` VALUES ('cxing', 'cxing_show', '车型', 'dist', 'int', 'CXING', null, '0', '0', '0', '1', '26', null, null, null);
INSERT INTO `sys_field` VALUES ('degxhnljd', 'degxhnljd', '第二个小孩年龄阶段', 'text', 'string', null, null, '0', '0', '0', '1', '72', null, null, null);
INSERT INTO `sys_field` VALUES ('dkje', 'dkje', '贷款金额', 'text', 'double', null, null, '0', '0', '0', '1', '62', null, null, null);
INSERT INTO `sys_field` VALUES ('dkqs', 'dkqs_show', '贷款期数', 'dist', 'int', 'DKQS', null, '0', '0', '0', '1', '58', null, null, null);
INSERT INTO `sys_field` VALUES ('dksqhm', 'dksqhm', '贷款申请号码', 'text', 'string', null, null, '0', '0', '0', '1', '36', null, null, null);
INSERT INTO `sys_field` VALUES ('dqzt', 'dqzt_show', '当前状态', 'dist', 'int', 'DQZT', null, '0', '0', '0', '1', '18', null, null, null);
INSERT INTO `sys_field` VALUES ('dygxhnljd', 'dygxhnljd', '第一个小孩年龄阶段', 'text', 'string', null, null, '0', '0', '0', '1', '71', null, null, null);
INSERT INTO `sys_field` VALUES ('dzlx', 'dzlx', '地址类型', 'text', 'string', null, null, '0', '0', '0', '1', '45', null, null, null);
INSERT INTO `sys_field` VALUES ('dzy', 'dzy', '地址一', 'text', 'string', null, null, '0', '0', '0', '1', '52', null, null, null);
INSERT INTO `sys_field` VALUES ('fclx', 'fclx_show', '房产类型', 'dist', 'int', 'FCLX', null, '0', '0', '0', '1', '46', null, null, null);
INSERT INTO `sys_field` VALUES ('fkfs', 'fkfs_show', '付款方式', 'dist', 'int', 'FKFS', null, '0', '0', '0', '1', '31', null, null, null);
INSERT INTO `sys_field` VALUES ('gcrq', 'gcrq', '购车日期', 'date', 'date', null, null, '0', '0', '0', '1', '29', null, null, null);
INSERT INTO `sys_field` VALUES ('gcyhke', 'gcyhke', '购车月还款额', 'text', 'double', null, null, '0', '0', '0', '1', '65', null, null, null);
INSERT INTO `sys_field` VALUES ('gsdh', 'gsdh', '公司电话', 'text', 'string', null, null, '0', '0', '0', '1', '51', null, null, null);
INSERT INTO `sys_field` VALUES ('gsmc', 'gsmc', '公司名称', 'text', 'string', null, null, '0', '0', '0', '1', '48', null, null, null);
INSERT INTO `sys_field` VALUES ('gsqrgx', 'gsqrgx_show', '跟申请人关系', 'dist', 'int', 'LZGX', null, '0', '0', '0', '1', '13', null, null, null);
INSERT INTO `sys_field` VALUES ('gznx', 'gznx', '工作年限', 'text', 'int', null, null, '0', '0', '0', '1', '53', null, null, null);
INSERT INTO `sys_field` VALUES ('hkdz', 'hkdz', '户口地址', 'text', 'string', null, null, '0', '0', '0', '1', '44', null, null, null);
INSERT INTO `sys_field` VALUES ('hkszd', 'hkszd', '户口所在地', 'text', 'string', null, null, '0', '0', '0', '1', '40', null, null, null);
INSERT INTO `sys_field` VALUES ('hkzt', 'hkzt_show', '还款状态', 'dist', 'int', 'HKZT', null, '0', '0', '0', '1', '14', null, null, null);
INSERT INTO `sys_field` VALUES ('htbh', 'htbh', '合同编号', 'text', 'string', null, null, '0', '0', '0', '1', '19', null, null, null);
INSERT INTO `sys_field` VALUES ('htjhrq', 'htjhrq', '合同激活日期', 'date', 'date', null, null, '0', '0', '0', '1', '20', null, null, null);
INSERT INTO `sys_field` VALUES ('hylx', 'hylx_show', '行业类型', 'dist', 'int', 'HYLX', null, '0', '0', '0', '1', '37', null, null, null);
INSERT INTO `sys_field` VALUES ('hyzk', 'hyzk_show', '婚姻状况', 'dist', 'int', 'HYZK', null, '0', '0', '0', '1', '17', null, null, null);
INSERT INTO `sys_field` VALUES ('hyzlx', 'hyzlx_show', '行业子类型', 'dist', 'int', 'HYZLX', null, '0', '0', '0', '1', '38', null, null, null);
INSERT INTO `sys_field` VALUES ('hzjjrq', 'hzjjrq', '核准拒绝日期', 'date', 'date', null, null, '0', '0', '0', '1', '23', null, null, null);
INSERT INTO `sys_field` VALUES ('jcrq', 'jcrq', '交车日期', 'date', 'date', null, null, '0', '0', '0', '1', '30', null, null, null);
INSERT INTO `sys_field` VALUES ('jkr_cs', 'jkr_cs_show', '借款人城市', 'tree', 'int', 'CITY', null, '2', '0', '0', '1', '43', null, null, null);
INSERT INTO `sys_field` VALUES ('jkr_sf', 'jkr_sf_show', '借款人省份', 'tree', 'int', 'CITY', 'jkr_cs', '1', '0', '0', '1', '42', null, null, null);
INSERT INTO `sys_field` VALUES ('jsr_lxdh', 'jsr_lxdh', '介绍人联系电话', 'text', 'string', null, null, '0', '0', '0', '1', '68', null, null, null);
INSERT INTO `sys_field` VALUES ('jsr_xm', 'jsr_xm', '介绍人姓名', 'text', 'string', null, null, '0', '0', '0', '1', '67', null, null, null);
INSERT INTO `sys_field` VALUES ('jszbh', 'jszbh', '驾驶证编号', 'text', 'string', null, null, '0', '0', '0', '1', '32', null, null, null);
INSERT INTO `sys_field` VALUES ('jtrs', 'jtrs_show', '家庭人数', 'dist', 'int', 'JTRS', null, '0', '0', '0', '1', '34', null, null, null);
INSERT INTO `sys_field` VALUES ('jycd', 'jycd_show', '教育程度', 'dist', 'int', 'JYCD', null, '0', '0', '0', '1', '35', null, null, null);
INSERT INTO `sys_field` VALUES ('jzdqr', 'jzdqr', '驾照到期日', 'date', 'date', null, null, '0', '0', '0', '1', '33', null, null, null);
INSERT INTO `sys_field` VALUES ('jznx', 'jznx', '居住年限', 'text', 'int', null, null, '0', '0', '0', '1', '47', null, null, null);
INSERT INTO `sys_field` VALUES ('khll', 'hkll', '客户利率', 'text', 'double', null, null, '0', '0', '0', '1', '63', null, null, null);
INSERT INTO `sys_field` VALUES ('khsqbm', 'khsqbm', '客户申请编码', 'text', 'string', null, null, '0', '0', '0', '1', '66', null, null, null);
INSERT INTO `sys_field` VALUES ('lxze', 'lxze', '利息总额', 'text', 'double', null, null, '0', '0', '0', '1', '64', null, null, null);
INSERT INTO `sys_field` VALUES ('nl', 'nl', '年龄', 'text', 'int', null, null, '0', '0', '0', '1', '16', null, null, null);
INSERT INTO `sys_field` VALUES ('org_dq', 'org_dq_show', '大区', 'org', 'int', '-1', 'org_jxs', '2', '1', '1', '1', '2', null, null, null);
INSERT INTO `sys_field` VALUES ('org_jxs', 'org_jxs_show', '经销商', 'org', 'int', '-1', null, '3', '1', '1', '1', '3', null, null, null);
INSERT INTO `sys_field` VALUES ('org_yxb', 'org_yxb_show', '营销部', 'org', 'int', '0', 'org_dq', '1', '1', '1', '1', '1', null, null, null);
INSERT INTO `sys_field` VALUES ('qyxz', 'qyxz_show', '企业性质', 'dist', 'int', 'QYXZ', null, '0', '0', '0', '1', '49', null, null, null);
INSERT INTO `sys_field` VALUES ('sfkbl', 'sfkbl', '首付款比例', 'text', 'double', null, null, '0', '0', '0', '1', '60', null, null, null);
INSERT INTO `sys_field` VALUES ('sfkje', 'sfkje', '首付款金额', 'text', 'double', null, null, '0', '0', '0', '1', '61', null, null, null);
INSERT INTO `sys_field` VALUES ('sjgcr_dhhm', 'sjgcr_dhhm', '购车人电话号码', 'text', 'string', null, null, '0', '1', '1', '1', '12', null, '实际购车人电话号码', null);
INSERT INTO `sys_field` VALUES ('sjgcr_xm', 'sjgcr_xm', '购车人姓名', 'text', 'string', null, null, '0', '1', '1', '1', '10', null, '实际购车人姓名', '客户名称');
INSERT INTO `sys_field` VALUES ('sjgcr_zjhm', 'sjgcr_zjhm', '购车人证件号码', 'text', 'string', null, null, '0', '1', '1', '1', '11', null, '实际购车人证件号码', '证件号码');
INSERT INTO `sys_field` VALUES ('sqr_dhhm', 'sqr_dhhm', '申请人电话号码', 'text', 'string', null, null, '0', '1', '1', '1', '9', '电话', '申请人电话', null);
INSERT INTO `sys_field` VALUES ('sqr_xm', 'sqr_xm', '申请人姓名', 'text', 'string', null, null, '0', '1', '1', '1', '6', '姓名（中文）', '申请人姓名', null);
INSERT INTO `sys_field` VALUES ('sqr_zjhm', 'sqr_zjhm', '申请人证件号码', 'text', 'string', null, null, '0', '1', '1', '1', '8', '证件号码', '申请人证件号码', null);
INSERT INTO `sys_field` VALUES ('sqr_zjlx', 'sqr_zjlx_show', '申请人证件类型', 'dist', 'int', 'ZJLX', null, '0', '0', '0', '1', '7', null, null, null);
INSERT INTO `sys_field` VALUES ('sqtjrq', 'sqtjrq', '申请提交日期', 'date', 'date', null, null, '0', '0', '0', '1', '21', null, null, null);
INSERT INTO `sys_field` VALUES ('vin', 'vin', 'VIN号', 'text', 'string', null, null, '0', '0', '0', '1', '28', null, null, null);
INSERT INTO `sys_field` VALUES ('xb', 'xb_show', '性别', 'dist', 'int', 'XB', null, '0', '0', '0', '1', '15', null, null, null);
INSERT INTO `sys_field` VALUES ('xqah', 'xqah', '兴趣爱好', 'text', 'string', null, null, '0', '0', '0', '1', '69', null, null, null);
INSERT INTO `sys_field` VALUES ('xsjg', 'xsjg', '销售价格', 'text', 'double', null, null, '0', '0', '0', '1', '59', null, null, null);
INSERT INTO `sys_field` VALUES ('yf', 'yf', '月份', 'text', 'int', null, null, '0', '0', '0', '1', '22', null, null, null);
INSERT INTO `sys_field` VALUES ('ysr', 'ysr', '月收入', 'text', 'int', null, null, '0', '0', '0', '1', '41', null, null, null);
INSERT INTO `sys_field` VALUES ('yyxhsl', 'yyxhsl_show', '拥有小孩数量', 'dist', 'int', 'YYHZSL', null, '0', '0', '0', '1', '70', null, null, null);
INSERT INTO `sys_field` VALUES ('zc', 'zc', '周次', 'text', 'int', null, null, '0', '0', '0', '1', '24', null, null, null);
INSERT INTO `sys_field` VALUES ('zcjg', 'zcjg', '资产价格', 'text', 'double', null, null, '0', '0', '0', '1', '54', null, null, null);
INSERT INTO `sys_field` VALUES ('zw', 'zw', '职位', 'text', 'string', null, null, '0', '0', '0', '1', '50', null, null, null);
INSERT INTO `sys_field` VALUES ('zylx', 'zylx_show', '职业类型', 'dist', 'int', 'ZYLX', null, '0', '0', '0', '1', '39', null, null, null);
INSERT INTO `sys_menu` VALUES ('1', '0', '客户信息', 'index.jspx', '1', '1');
INSERT INTO `sys_menu` VALUES ('2', '0', '系统管理', '#', '1', '10');
INSERT INTO `sys_menu` VALUES ('3', '2', '用户管理', 'admin/user/list.jspx', '1', '1');
INSERT INTO `sys_menu` VALUES ('4', '2', '角色管理', 'admin/role/list.jspx', '1', '2');
INSERT INTO `sys_menu` VALUES ('5', '2', '菜单权限管理', 'admin/menu/list.jspx', '1', '3');
INSERT INTO `sys_menu` VALUES ('6', '1', '客户信息查询', 'cm/list.jspx', '1', '2');
INSERT INTO `sys_menu` VALUES ('7', '2', '组织机构管理', 'admin/org/list.jspx', '1', '4');
INSERT INTO `sys_menu` VALUES ('8', '1', '新增客户信息', 'cm/add.jspx', '1', '3');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改客户信息', 'cm/edit.jspx', '0', '1');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除客户信息', 'cm/delete.do', '0', '2');
INSERT INTO `sys_menu` VALUES ('11', '2', '普通字典管理', 'admin/dist/list.jspx', '1', '5');
INSERT INTO `sys_menu` VALUES ('12', '2', '树形字典管理', 'admin/tree/list.jspx', '1', '6');
INSERT INTO `sys_menu` VALUES ('13', '2', '字段配置', 'admin/field/list.jspx', '1', '7');
INSERT INTO `sys_menu` VALUES ('14', '1', '导入客户信息', 'cm/imp.jspx', '1', '4');
INSERT INTO `sys_org` VALUES ('1', '1', '0', '深圳营销部', ',1,');
INSERT INTO `sys_org` VALUES ('3', '2', '1', '宝安大区', ',1,3,');
INSERT INTO `sys_org` VALUES ('4', '2', '1', '福田大区', ',1,4,');
INSERT INTO `sys_org` VALUES ('5', '2', '1', '龙岗大区', ',1,5,');
INSERT INTO `sys_org` VALUES ('6', '2', '1', '龙华大区', ',1,6,');
INSERT INTO `sys_org` VALUES ('9', '1', '0', '上海营销部', ',9,');
INSERT INTO `sys_org` VALUES ('10', '2', '9', '上海一区', ',9,10,');
INSERT INTO `sys_org` VALUES ('11', '2', '9', '上海二区', ',9,11,');
INSERT INTO `sys_org` VALUES ('12', '2', '9', '上海三区', ',9,12,');
INSERT INTO `sys_org` VALUES ('13', '3', '3', '深圳市东盛汽车销售服务有限公司', ',1,3,13,');
INSERT INTO `sys_org` VALUES ('14', '3', '3', '深圳金环怡投资有限公司', ',1,3,14,');
INSERT INTO `sys_org` VALUES ('15', '3', '4', '深圳市三维都灵汽车销售服务有限公司', ',1,4,15,');
INSERT INTO `sys_org` VALUES ('16', '3', '4', '深圳市粤迪汽车贸易有限公司南山分公司', ',1,4,16,');
INSERT INTO `sys_org` VALUES ('17', '3', '4', '深圳市盛世开元汽车销售有限公司福田城市展厅分公司', ',1,4,17,');
INSERT INTO `sys_org` VALUES ('18', '3', '5', '深圳市湛宝实业发展有限公司', ',1,5,18,');
INSERT INTO `sys_org` VALUES ('19', '3', '5', '深圳市泽然浩商贸有限公司', ',1,5,19,');
INSERT INTO `sys_role` VALUES ('2', '管理员', '管理系统');
INSERT INTO `sys_role` VALUES ('3', '普通用户', '普通用户');
INSERT INTO `sys_role_menu` VALUES ('74', '3', '1');
INSERT INTO `sys_role_menu` VALUES ('75', '3', '6');
INSERT INTO `sys_role_menu` VALUES ('76', '3', '8');
INSERT INTO `sys_role_menu` VALUES ('122', '2', '1');
INSERT INTO `sys_role_menu` VALUES ('123', '2', '6');
INSERT INTO `sys_role_menu` VALUES ('124', '2', '9');
INSERT INTO `sys_role_menu` VALUES ('125', '2', '10');
INSERT INTO `sys_role_menu` VALUES ('126', '2', '8');
INSERT INTO `sys_role_menu` VALUES ('127', '2', '14');
INSERT INTO `sys_role_menu` VALUES ('128', '2', '2');
INSERT INTO `sys_role_menu` VALUES ('129', '2', '3');
INSERT INTO `sys_role_menu` VALUES ('130', '2', '4');
INSERT INTO `sys_role_menu` VALUES ('131', '2', '5');
INSERT INTO `sys_role_menu` VALUES ('132', '2', '7');
INSERT INTO `sys_role_menu` VALUES ('133', '2', '11');
INSERT INTO `sys_role_menu` VALUES ('134', '2', '12');
INSERT INTO `sys_role_menu` VALUES ('135', '2', '13');
INSERT INTO `sys_tree` VALUES ('1', 'CITY', '1', '0', '广东', ',1,');
INSERT INTO `sys_tree` VALUES ('2', 'CITY', '1', '0', '湖南', ',2,');
INSERT INTO `sys_tree` VALUES ('3', 'CITY', '2', '1', '广州', ',1,3,');
INSERT INTO `sys_tree` VALUES ('4', 'CITY', '2', '1', '深圳', ',1,4,');
INSERT INTO `sys_tree` VALUES ('5', 'CITY', '2', '1', '佛山', ',1,5,');
INSERT INTO `sys_tree` VALUES ('6', 'CITY', '2', '2', '长沙', ',2,6,');
INSERT INTO `sys_tree` VALUES ('8', 'CITY', '2', '2', '娄底', ',2,8,');
INSERT INTO `sys_tree` VALUES ('9', 'CITY', '2', '1', '东莞', ',1,9,');
INSERT INTO `sys_tree` VALUES ('11', 'HYLX', '1', '0', '采矿业', ',11,');
INSERT INTO `sys_tree` VALUES ('12', 'HYLX', '1', '0', '制造业', ',12,');
INSERT INTO `sys_tree` VALUES ('13', 'HYLX', '1', '0', '建筑业', ',13,');
INSERT INTO `sys_tree` VALUES ('14', 'HYLX', '1', '0', '金融业', ',14,');
INSERT INTO `sys_tree` VALUES ('15', 'HYLX', '1', '0', '房地产业', ',15,');
INSERT INTO `sys_tree` VALUES ('16', 'HYLX', '1', '0', '教育', ',16,');
INSERT INTO `sys_tree` VALUES ('17', 'HYLX', '1', '0', '国际组织', ',17,');
INSERT INTO `sys_tree` VALUES ('18', 'HYLX', '1', '0', '批发和零售业', ',18,');
INSERT INTO `sys_tree` VALUES ('19', 'HYLX', '1', '0', '住宿和餐饮业', ',19,');
INSERT INTO `sys_tree` VALUES ('20', 'HYLX', '1', '0', '卫生和社会工作', ',20,');
INSERT INTO `sys_tree` VALUES ('21', 'HYLX', '1', '0', '租赁和商务服务业', ',21,');
INSERT INTO `sys_tree` VALUES ('22', 'HYLX', '1', '0', '交通运输、仓储和邮政业', ',22,');
INSERT INTO `sys_tree` VALUES ('23', 'HYLX', '1', '0', '电力、热力、燃气及水生产和供应业', ',23,');
INSERT INTO `sys_tree` VALUES ('24', 'HYLX', '1', '0', '居民服务、修理和其他服务业', ',24,');
INSERT INTO `sys_tree` VALUES ('25', 'HYLX', '1', '0', '水利、环境和公共设施管理业', ',25,');
INSERT INTO `sys_tree` VALUES ('26', 'HYLX', '1', '0', '信息传输、软件和信息技术服务业', ',26,');
INSERT INTO `sys_tree` VALUES ('27', 'HYLX', '1', '0', '科学研究和技术服务业', ',27,');
INSERT INTO `sys_tree` VALUES ('28', 'HYLX', '1', '0', '农、林、牧、渔业', ',28,');
INSERT INTO `sys_tree` VALUES ('29', 'HYLX', '1', '0', '公共管理、社会保障和社会组织', ',29,');
INSERT INTO `sys_tree` VALUES ('30', 'HYLX', '1', '0', '文化、体育和娱乐业', ',30,');
INSERT INTO `sys_tree` VALUES ('31', 'HYLX', '1', '0', '其他', ',31,');
INSERT INTO `sys_tree` VALUES ('32', 'HYLX', '2', '31', '其他', ',31,32,');
INSERT INTO `sys_tree` VALUES ('33', 'HYLX', '2', '15', '房地产开发经营', ',15,33,');
INSERT INTO `sys_tree` VALUES ('34', 'HYLX', '2', '13', '房屋和土木工程建筑业', ',13,34,');
INSERT INTO `sys_tree` VALUES ('35', 'HYLX', '2', '18', '批发业 Wholesale Trade', ',18,35,');
INSERT INTO `sys_tree` VALUES ('36', 'HYLX', '2', '24', '其他服务业 Other Services', ',24,36,');
INSERT INTO `sys_user` VALUES ('1', 'admin', 'f6fdffe48c908deb0f4c3bd36c032e72', '管理员', '', '', '2016-09-25 11:14:13', '2016-10-10 23:15:36', '0', ',2,', ',管理员,', ',1,9,');
INSERT INTO `sys_user` VALUES ('2', 'dw_jiangkunpeng', '99800032b7d26893553ce81530e0f821', '姜昆鹏', '15899954940', 'jakey766@163.com', '2016-09-25 11:14:40', '2016-10-10 23:15:59', '0', ',3,2,', ',普通用户,管理员,', ',3,');
