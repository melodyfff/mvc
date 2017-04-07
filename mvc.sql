/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50614
Source Host           : 127.0.0.1:3306
Source Database       : mvc

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-04-07 23:23:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kmu_order_list
-- ----------------------------
DROP TABLE IF EXISTS `kmu_order_list`;
CREATE TABLE `kmu_order_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `state` int(1) DEFAULT '0',
  `date` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kmu_order_list
-- ----------------------------
INSERT INTO `kmu_order_list` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '2017-04-19 23:13:31');
INSERT INTO `kmu_order_list` VALUES ('3', '1', null, '1', null, null, null, null, null, '0', '0', '2017-04-07 23:14:24');

-- ----------------------------
-- Table structure for kmu_sellershow
-- ----------------------------
DROP TABLE IF EXISTS `kmu_sellershow`;
CREATE TABLE `kmu_sellershow` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `seller_id` bigint(20) NOT NULL,
  `seller_name` varchar(255) NOT NULL,
  `seller_url` varchar(255) NOT NULL,
  `seller_logo` varchar(255) NOT NULL,
  `score_num` double(5,0) DEFAULT NULL,
  `start_price` int(11) DEFAULT NULL,
  `send_time` int(11) DEFAULT NULL,
  `send_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kmu_sellershow
-- ----------------------------
INSERT INTO `kmu_sellershow` VALUES ('64', '2', '楚渝老麻抄手', '11111111111', 'http://p1.meituan.net/xianfu/0b9ac31440b0643220d9e0827ea1318642564.jpg', '4', '15', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('65', '3', '东北小吃（新天地步行街店）', '11111111111', 'http://p1.meituan.net/xianfu/70869fe207a0e5df5870db59825f5e95186929.jpg', '4', '10', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('66', '4', '辣有道麻辣香锅', '11111111111', 'http://p0.meituan.net/xianfu/d6e3b2dd807fdaf1bcc465876857d032266240.jpg', '4', '20', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('67', '5', '靖子家土耳其烤肉木桶饭', '11111111111', 'http://p1.meituan.net/xianfu/b8bcd8d475dad9cd8c0a409f9bf1f21742299.jpg', '4', '10', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('68', '6', '黄焖鸡米饭', '11111111111', 'http://p0.meituan.net/xianfu/d089a232288d504f7c4e64861e7ea20d30720.jpg', '4', '0', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('69', '7', '当麦基（昆工店）', '11111111111', 'http://p0.meituan.net/xianfu/43b31430f65e4a7ac630e2837957590d82289.jpg', '4', '20', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('70', '8', '半亩园烤肉脆皮鸡饭', '11111111111', 'http://p1.meituan.net/xianfu/aadea49e0e27d759d3e958eda8ac9ed245056.jpg', '4', '12', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('71', '0', '百碗香卤肉饭', '11111111111', 'http://p0.meituan.net/xianfu/11dd424197922267adf1f8973a4c196226624.jpg', '4', '0', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('72', '0', '吖咪甜品', '11111111111', 'http://p1.meituan.net/xianfu/93d0495b10b664b85cc263a32ad2613b28672.jpg', '4', '16', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('73', '0', '周记黑鸭', '11111111111', 'http://p1.meituan.net/xianfu/904a8fae0a27b953b434bf21a67817ae10240.jpeg', '4', '20', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('74', '0', '一贯烧快捷餐厅（大学城店）', '11111111111', 'http://p0.meituan.net/xianfu/89cffac07c383e648aa64e5cfdee0a1229465.jpg', '4', '10', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('75', '0', '顿顿披萨', '11111111111', 'http://p1.meituan.net/xianfu/cb6f87452f48e4bac96e4060a8a55583461341.jpg', '4', '20', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('76', '0', '碗碗香卤肉饭', '11111111111', 'http://p1.meituan.net/xianfu/5d12605401ce4d45c3c9ea80869c4714210014.jpg', '4', '10', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('77', '0', '四川宜宾燃面', '11111111111', 'http://p1.meituan.net/xianfu/57117391b33e6590ee9251072823cc4b229434.jpg', '4', '11', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('78', '0', '北北饺子宴', '11111111111', 'http://p0.meituan.net/xianfu/757559d5a7b5555cd4bfd157d4acf8b828672.jpg', '4', '10', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('79', '0', '大学时代', '11111111111', 'http://p1.meituan.net/xianfu/1afb4627e41d2253f6bf572d8efba78134816.jpg', '4', '10', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('80', '0', '重庆鸡公煲（步行街店）', '11111111111', 'http://p1.meituan.net/xianfu/4f76746e44401112d5065a1a55d1d79c41328.jpg', '4', '15', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('81', '0', '外婆家的私房小锅米线', '11111111111', 'http://p0.meituan.net/xianfu/ef257aa7495fff38ab078e068dd791de34816.jpg', '4', '11', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('82', '0', '尝一口鸡脚', '11111111111', 'http://p1.meituan.net/xianfu/c4df6a841824bedbcffb561c19b6b71a53530.jpg', '4', '30', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('83', '0', '弥勒竹园卤鸡米线', '11111111111', 'http://p1.meituan.net/xianfu/79f9636514ed26352e0da79e9391eed934816.jpg', '4', '12', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('84', '0', '德克士（易初莲花店）', '11111111111', 'http://p0.meituan.net/xianfu/4e634ada59b52ae7eb09990158a0a7626855.jpeg', '4', '30', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('85', '0', '华莱士（水晶郦城）', '11111111111', 'http://p0.meituan.net/xianfu/459d9c6d5a400ed231b97a8fc5f0d9bc6955.jpeg', '4', '30', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('86', '0', '麦丰荷叶饭', '11111111111', 'http://p1.meituan.net/xianfu/51dc2f7947e05dede5e999f230381375268299.jpg', '4', '15', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('87', '0', '林妹妹沾水米线（冉家坝店）', '11111111111', 'http://p0.meituan.net/xianfu/f0472fb3a5a2d1a9bbf7005a4c37a033117274.jpg', '4', '15', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('88', '0', '尊宝比萨（北环店）', '11111111111', 'http://p0.meituan.net/xianfu/e02898a6d72eababb1903f678cc50c4f5243.jpeg', '4', '30', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('89', '0', '华莱士【冉家坝】', '11111111111', 'http://p0.meituan.net/xianfu/459d9c6d5a400ed231b97a8fc5f0d9bc6955.jpeg', '4', '35', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('90', '0', '丰寿司居酒屋', '11111111111', 'http://p0.meituan.net/xianfu/7e85d929932b69e24a1d8d5c8c408d67122726.png', '4', '20', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('91', '0', '便当骑士【美团特推】', '11111111111', 'http://p0.meituan.net/xianfu/2514635a405e3a409908d30f32fa68e130720.jpg', '4', '15', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('92', '0', '乡村基（北部新区星湖路餐厅）', '11111111111', 'http://p1.meituan.net/xianfu/e6edd45efc4a6f9e33310a9972cfa18f7532.jpeg', '4', '0', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('93', '0', '乡村基（财富中心餐厅）', '11111111111', 'http://p1.meituan.net/xianfu/e6edd45efc4a6f9e33310a9972cfa18f7532.jpeg', '4', '0', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('94', '0', '汉城烤肉馆（韩式拌饭）', '11111111111', 'http://p0.meituan.net/xianfu/79e932cb52d77eaf3f5730b2f13e08f363488.jpg', '4', '20', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('95', '0', '肯德基宅急送（星湖路店）', '11111111111', 'http://p0.meituan.net/xianfu/0016f9e2ec997b0ff9f744ec0b9142d415083.jpeg', '4', '0', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('96', '0', '家常味', '11111111111', 'http://p0.meituan.net/xianfu/04aaf2856569803ec0152ef683e5b812348489.jpg', '4', '20', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('97', '0', '加班狗爆款美食（冉家坝店）', '11111111111', 'http://p1.meituan.net/xianfu/2bbfc3c37b4d87a59bb687dff4d08bfc247766.jpg', '4', '0', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('98', '0', '垫江石磨豆花（龙山分店）', '11111111111', 'http://p1.meituan.net/xianfu/685b32ee8c700e09e1eb3e214492f05c355711.jpg', '4', '15', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('99', '0', '小矮牛披萨（龙湖水晶郦城店）', '11111111111', 'http://p1.meituan.net/xianfu/badb27fb2e067ea2686a855b4ccb6f50198289.jpg', '4', '20', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('100', '0', '守柴炉北京烤鸭（北环店）', '11111111111', 'http://p1.meituan.net/xianfu/aeda92a577e6bd91d4e24af2c8fced758547.jpeg', '4', '20', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('101', '0', '陶然居（巾帼酒店）', '11111111111', 'http://p0.meituan.net/xianfu/ff334f2db46b0c2e2d0f3b699408c4cc19051.jpg', '4', '20', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('102', '0', 'HiRice饭来了（财富中心店）', '11111111111', 'http://p1.meituan.net/xianfu/92a73a00fc9cf92d347fe9f3b9eccb4541050.jpg', '4', '0', '40', '0');
INSERT INTO `kmu_sellershow` VALUES ('103', '0', '711（渝北双子座）', '11111111111', 'http://p1.meituan.net/xianfu/ac450c0d091a5982ca5a6e31c971cfed11715.jpg', '4', '30', '40', '0');

-- ----------------------------
-- Table structure for kmu_seller_food
-- ----------------------------
DROP TABLE IF EXISTS `kmu_seller_food`;
CREATE TABLE `kmu_seller_food` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seller_id` bigint(20) NOT NULL,
  `seller_name` varchar(255) NOT NULL,
  `food_type` varchar(255) NOT NULL,
  `food_name` varchar(255) NOT NULL,
  `food_price` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of kmu_seller_food
-- ----------------------------
INSERT INTO `kmu_seller_food` VALUES ('1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for kmu_seller_food_type
-- ----------------------------
DROP TABLE IF EXISTS `kmu_seller_food_type`;
CREATE TABLE `kmu_seller_food_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `food_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of kmu_seller_food_type
-- ----------------------------
INSERT INTO `kmu_seller_food_type` VALUES ('1', '1', 'dasd');

-- ----------------------------
-- Table structure for x_role
-- ----------------------------
DROP TABLE IF EXISTS `x_role`;
CREATE TABLE `x_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_role
-- ----------------------------
INSERT INTO `x_role` VALUES ('1', '管理员');
INSERT INTO `x_role` VALUES ('2', '普通用户');
INSERT INTO `x_role` VALUES ('3', '商家');

-- ----------------------------
-- Table structure for x_seller
-- ----------------------------
DROP TABLE IF EXISTS `x_seller`;
CREATE TABLE `x_seller` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_name` varchar(255) DEFAULT NULL,
  `seller_logo` varchar(255) DEFAULT NULL,
  `send_time` int(11) NOT NULL DEFAULT '30',
  `start_price` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_seller
-- ----------------------------
INSERT INTO `x_seller` VALUES ('3', '3', 'sam1', 'test2', '0', '0');
INSERT INTO `x_seller` VALUES ('5', '3', 'sam1', 'test2', '0', '0');

-- ----------------------------
-- Table structure for x_user
-- ----------------------------
DROP TABLE IF EXISTS `x_user`;
CREATE TABLE `x_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sexual` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_user
-- ----------------------------
INSERT INTO `x_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('3', 'sam', 'ee11cbb19052e40b07aac0ca060c23ee', '3', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('4', 'tom', 'ee11cbb19052e40b07aac0ca060c23ee', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('7', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('9', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('10', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('11', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('12', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('13', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('14', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('15', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('16', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('17', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('18', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('19', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('20', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('21', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('22', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('23', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('24', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('25', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('26', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('27', '1', '1', '2', null, null, null, null, null, null);
INSERT INTO `x_user` VALUES ('28', 'mytest', 'aaa', '2', null, null, null, null, null, '2017-04-03 00:26:15');
INSERT INTO `x_user` VALUES ('29', 'mytest', 'aaa', '2', null, null, null, null, null, '2017-04-03 00:26:16');
INSERT INTO `x_user` VALUES ('30', 'mytest', 'aaa', '2', null, null, null, null, '张三1', '2017-04-03 00:26:18');
INSERT INTO `x_user` VALUES ('31', 'mytest2', 'aaa', '2', null, null, null, null, '张三1', '2017-04-03 00:26:19');
INSERT INTO `x_user` VALUES ('33', 'user2', '202cb962ac59075b964b07152d234b70', '3', null, null, null, null, null, '2017-04-03 00:26:23');
INSERT INTO `x_user` VALUES ('34', '1111111111111', 'fa1d3eb08a879de9a4cd9995a1aa91e1', '2', '11111111111', '111111111111', '111111111111@qq.com', '男', '111111111111', '2017-04-03 22:24:41');
INSERT INTO `x_user` VALUES ('35', '这是一个测试', '50b49acf132c1efad4b74966e125b93a', '2', null, '这是一个测试', '111@qq.com', '男', '这是一个测试', '2017-04-03 02:07:04');
INSERT INTO `x_user` VALUES ('36', '这是一个测试2', 'e10adc3949ba59abbe56e057f20f883e', '2', '11111111111', '这是一个测试32131231233', '123@qq.com', '女', '这是一个测试12312321', '2017-04-03 21:45:15');
INSERT INTO `x_user` VALUES ('38', 'mytest3', '9d31bf30be6d55650f7c886eafc73950', '2', '11111111111', 'mytest3', 'mytest3@qq.com', '未知', 'mytest3', '2017-04-03 22:25:06');
INSERT INTO `x_user` VALUES ('39', 'user1', 'e10adc3949ba59abbe56e057f20f883e', '2', '11111111111', 'user1', 'user1@qq.com', '男', 'user1', '2017-04-03 22:44:32');
