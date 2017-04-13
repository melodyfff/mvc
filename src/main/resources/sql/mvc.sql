/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50614
Source Host           : 127.0.0.1:3306
Source Database       : mvc

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-04-09 22:55:29
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
  `date` timestamp NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kmu_order_list
-- ----------------------------
INSERT INTO `kmu_order_list` VALUES ('4', '3', '东北小吃（新天地步行街店）', '3', '测试', '11111111111', '怡园A', '辣一点', '皇帝炒饭  ', '1998', '0', '2017-04-09 17:09:56');
INSERT INTO `kmu_order_list` VALUES ('5', '3', '东北小吃（新天地步行街店）', '3', '测试', '11111111111', '怡园A', '怡园1栋1137', '皇帝炒饭  ', '999', '0', '2017-04-09 17:11:36');
INSERT INTO `kmu_order_list` VALUES ('6', '3', '东北小吃（新天地步行街店）', '3', '测试3', '11111111111', '憬园B', '1137', '皇帝炒饭X1#皇帝米线X1#尊贵套X1#尊贵套二X1#', '3994', '0', '2017-04-09 17:13:21');
INSERT INTO `kmu_order_list` VALUES ('7', '3', '东北小吃（新天地步行街店）', '43', '测试4', '11111111111', '怡园A', '', '皇帝炒饭X1#皇帝米线X1#尊贵套X1#尊贵套二X2#', '4992', '0', '2017-04-09 18:13:34');
INSERT INTO `kmu_order_list` VALUES ('8', '3', '东北小吃（新天地步行街店）', '43', '123123', '11111111111', '憬园B', '', '皇帝米线X1#尊贵套二X1#', '1997', '0', '2017-04-09 18:14:08');
INSERT INTO `kmu_order_list` VALUES ('9', '45', '这是一个测试', '45', '123', '11111111111', '怡园A', '', '测试X1#', '111', '0', '2017-04-09 19:32:38');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of kmu_seller_food
-- ----------------------------
INSERT INTO `kmu_seller_food` VALUES ('1', '1', '1', '1', '1', '1');
INSERT INTO `kmu_seller_food` VALUES ('20', '3', '东北小吃（新天地步行街店）', '皇帝套餐', '皇帝炒饭', '999');
INSERT INTO `kmu_seller_food` VALUES ('21', '4', '辣有道麻辣香锅', '昆工屌丝套餐', '屌丝香锅', '25');
INSERT INTO `kmu_seller_food` VALUES ('22', '3', '东北小吃（新天地步行街店）', '尊贵套餐', '尊贵套', '998');
INSERT INTO `kmu_seller_food` VALUES ('23', '3', '东北小吃（新天地步行街店）', '皇帝套餐', '皇帝米线', '999');
INSERT INTO `kmu_seller_food` VALUES ('24', '3', '东北小吃（新天地步行街店）', '尊贵套餐', '尊贵套二', '998');

-- ----------------------------
-- Table structure for kmu_seller_food_type
-- ----------------------------
DROP TABLE IF EXISTS `kmu_seller_food_type`;
CREATE TABLE `kmu_seller_food_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `food_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of kmu_seller_food_type
-- ----------------------------
INSERT INTO `kmu_seller_food_type` VALUES ('1', '2', 'dasd');
INSERT INTO `kmu_seller_food_type` VALUES ('2', '2', 'dasda');
INSERT INTO `kmu_seller_food_type` VALUES ('29', '3', '皇帝套餐');
INSERT INTO `kmu_seller_food_type` VALUES ('30', '4', '昆工屌丝套餐');
INSERT INTO `kmu_seller_food_type` VALUES ('31', '3', '尊贵套餐');

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
  `score_num` double(5,0) DEFAULT '4',
  `send_time` int(11) NOT NULL DEFAULT '30',
  `start_price` int(11) NOT NULL DEFAULT '0',
  `send_price` int(11) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_seller
-- ----------------------------
INSERT INTO `x_seller` VALUES ('64', '2', '楚渝老麻抄手王', 'http://p1.meituan.net/xianfu/0b9ac31440b0643220d9e0827ea1318642564.jpg', '4', '15', '40', '13', '2017-04-08 15:56:12');
INSERT INTO `x_seller` VALUES ('65', '3', '东北小吃（新天地步行街店）', 'http://p1.meituan.net/xianfu/70869fe207a0e5df5870db59825f5e95186929.jpg', '4', '10', '40', '120', '2017-04-08 15:56:12');
INSERT INTO `x_seller` VALUES ('66', '4', '辣有道麻辣香锅', 'http://p0.meituan.net/xianfu/d6e3b2dd807fdaf1bcc465876857d032266240.jpg', '4', '20', '40', '0', '2017-04-08 15:56:12');
INSERT INTO `x_seller` VALUES ('67', '5', '靖子家土耳其烤肉木桶饭', 'http://p1.meituan.net/xianfu/b8bcd8d475dad9cd8c0a409f9bf1f21742299.jpg', '4', '10', '40', '0', '2017-04-08 15:56:12');
INSERT INTO `x_seller` VALUES ('68', '6', '黄焖鸡米饭', 'http://p0.meituan.net/xianfu/d089a232288d504f7c4e64861e7ea20d30720.jpg', '4', '0', '40', '0', '2017-04-08 15:56:12');
INSERT INTO `x_seller` VALUES ('69', '7', '当麦基（昆工店）', 'http://p0.meituan.net/xianfu/43b31430f65e4a7ac630e2837957590d82289.jpg', '4', '20', '40', '0', '2017-04-08 15:56:12');
INSERT INTO `x_seller` VALUES ('70', '8', '半亩园烤肉脆皮鸡饭', 'http://p1.meituan.net/xianfu/aadea49e0e27d759d3e958eda8ac9ed245056.jpg', '4', '12', '40', '0', '2017-04-08 15:56:12');
INSERT INTO `x_seller` VALUES ('71', '9', '百碗香卤肉饭', 'http://p0.meituan.net/xianfu/11dd424197922267adf1f8973a4c196226624.jpg', '4', '0', '40', '0', '2017-04-08 15:56:12');
INSERT INTO `x_seller` VALUES ('72', '10', '吖咪甜品', 'http://p1.meituan.net/xianfu/93d0495b10b664b85cc263a32ad2613b28672.jpg', '4', '16', '40', '0', '2017-04-08 15:56:12');
INSERT INTO `x_seller` VALUES ('73', '11', '周记黑鸭', 'http://p1.meituan.net/xianfu/904a8fae0a27b953b434bf21a67817ae10240.jpeg', '4', '20', '40', '0', '2017-04-08 15:56:12');
INSERT INTO `x_seller` VALUES ('74', '12', '一贯烧快捷餐厅（大学城店）', 'http://p0.meituan.net/xianfu/89cffac07c383e648aa64e5cfdee0a1229465.jpg', '4', '10', '40', '0', '2017-04-08 15:56:12');
INSERT INTO `x_seller` VALUES ('75', '13', '顿顿披萨', 'http://p1.meituan.net/xianfu/cb6f87452f48e4bac96e4060a8a55583461341.jpg', '4', '20', '40', '0', '2017-04-08 15:56:12');
INSERT INTO `x_seller` VALUES ('76', '14', '碗碗香卤肉饭', 'http://p1.meituan.net/xianfu/5d12605401ce4d45c3c9ea80869c4714210014.jpg', '4', '10', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('77', '15', '四川宜宾燃面', 'http://p1.meituan.net/xianfu/57117391b33e6590ee9251072823cc4b229434.jpg', '4', '11', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('78', '16', '北北饺子宴', 'http://p0.meituan.net/xianfu/757559d5a7b5555cd4bfd157d4acf8b828672.jpg', '4', '10', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('79', '17', '大学时代', 'http://p1.meituan.net/xianfu/1afb4627e41d2253f6bf572d8efba78134816.jpg', '4', '10', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('80', '18', '重庆鸡公煲（步行街店）', 'http://p1.meituan.net/xianfu/4f76746e44401112d5065a1a55d1d79c41328.jpg', '4', '15', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('81', '19', '外婆家的私房小锅米线', 'http://p0.meituan.net/xianfu/ef257aa7495fff38ab078e068dd791de34816.jpg', '4', '11', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('82', '20', '尝一口鸡脚', 'http://p1.meituan.net/xianfu/c4df6a841824bedbcffb561c19b6b71a53530.jpg', '4', '30', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('83', '21', '弥勒竹园卤鸡米线', 'http://p1.meituan.net/xianfu/79f9636514ed26352e0da79e9391eed934816.jpg', '4', '12', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('84', '22', '德克士（易初莲花店）', 'http://p0.meituan.net/xianfu/4e634ada59b52ae7eb09990158a0a7626855.jpeg', '4', '30', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('85', '23', '华莱士（水晶郦城）', 'http://p0.meituan.net/xianfu/459d9c6d5a400ed231b97a8fc5f0d9bc6955.jpeg', '4', '30', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('86', '24', '麦丰荷叶饭', 'http://p1.meituan.net/xianfu/51dc2f7947e05dede5e999f230381375268299.jpg', '4', '15', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('87', '25', '林妹妹沾水米线（冉家坝店）', 'http://p0.meituan.net/xianfu/f0472fb3a5a2d1a9bbf7005a4c37a033117274.jpg', '4', '15', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('88', '26', '尊宝比萨（北环店）', 'http://p0.meituan.net/xianfu/e02898a6d72eababb1903f678cc50c4f5243.jpeg', '4', '30', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('89', '27', '华莱士【冉家坝】', 'http://p0.meituan.net/xianfu/459d9c6d5a400ed231b97a8fc5f0d9bc6955.jpeg', '4', '35', '40', '0', '2017-04-08 15:56:13');
INSERT INTO `x_seller` VALUES ('90', '28', '丰寿司居酒屋', 'http://p0.meituan.net/xianfu/7e85d929932b69e24a1d8d5c8c408d67122726.png', '4', '20', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('91', '29', '便当骑士【美团特推】', 'http://p0.meituan.net/xianfu/2514635a405e3a409908d30f32fa68e130720.jpg', '4', '15', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('92', '30', '乡村基（北部新区星湖路餐厅）', 'http://p1.meituan.net/xianfu/e6edd45efc4a6f9e33310a9972cfa18f7532.jpeg', '4', '0', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('93', '31', '乡村基（财富中心餐厅）', 'http://p1.meituan.net/xianfu/e6edd45efc4a6f9e33310a9972cfa18f7532.jpeg', '4', '0', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('94', '32', '汉城烤肉馆（韩式拌饭）', 'http://p0.meituan.net/xianfu/79e932cb52d77eaf3f5730b2f13e08f363488.jpg', '4', '20', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('95', '33', '肯德基宅急送（星湖路店）', 'http://p0.meituan.net/xianfu/0016f9e2ec997b0ff9f744ec0b9142d415083.jpeg', '4', '0', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('96', '34', '家常味', 'http://p0.meituan.net/xianfu/04aaf2856569803ec0152ef683e5b812348489.jpg', '4', '20', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('97', '35', '加班狗爆款美食（冉家坝店）', 'http://p1.meituan.net/xianfu/2bbfc3c37b4d87a59bb687dff4d08bfc247766.jpg', '4', '0', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('98', '36', '垫江石磨豆花（龙山分店）', 'http://p1.meituan.net/xianfu/685b32ee8c700e09e1eb3e214492f05c355711.jpg', '4', '15', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('99', '37', '小矮牛披萨（龙湖水晶郦城店）', 'http://p1.meituan.net/xianfu/badb27fb2e067ea2686a855b4ccb6f50198289.jpg', '4', '20', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('100', '38', '守柴炉北京烤鸭（北环店）', 'http://p1.meituan.net/xianfu/aeda92a577e6bd91d4e24af2c8fced758547.jpeg', '4', '20', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('101', '39', '陶然居（巾帼酒店）', 'http://p0.meituan.net/xianfu/ff334f2db46b0c2e2d0f3b699408c4cc19051.jpg', '4', '20', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('102', '40', 'HiRice饭来了（财富中心店）', 'http://p1.meituan.net/xianfu/92a73a00fc9cf92d347fe9f3b9eccb4541050.jpg', '4', '0', '40', '0', '2017-04-08 15:56:14');
INSERT INTO `x_seller` VALUES ('103', '41', '711（渝北双子座）', 'http://p1.meituan.net/xianfu/ac450c0d091a5982ca5a6e31c971cfed11715.jpg', '4', '30', '40', '0', '2017-04-08 15:56:14');

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
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_user
-- ----------------------------
INSERT INTO `x_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', null, null, null, null, null, '2017-04-08 16:06:18');
INSERT INTO `x_user` VALUES ('2', 'test2', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '12344444444', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:18');
INSERT INTO `x_user` VALUES ('3', 'test3', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '12333121111', '这是一个地址', '123@qq.com', '男', '姓名', '2017-04-08 16:06:18');
INSERT INTO `x_user` VALUES ('4', 'test4', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:18');
INSERT INTO `x_user` VALUES ('5', 'test5', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:18');
INSERT INTO `x_user` VALUES ('6', 'test6', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:19');
INSERT INTO `x_user` VALUES ('7', 'test7', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:19');
INSERT INTO `x_user` VALUES ('8', 'test8', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:19');
INSERT INTO `x_user` VALUES ('9', 'test9', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:19');
INSERT INTO `x_user` VALUES ('10', 'test10', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:19');
INSERT INTO `x_user` VALUES ('11', 'test11', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:19');
INSERT INTO `x_user` VALUES ('12', 'test12', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:19');
INSERT INTO `x_user` VALUES ('15', 'test15', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:19');
INSERT INTO `x_user` VALUES ('16', 'test16', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:19');
INSERT INTO `x_user` VALUES ('17', 'test17', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:19');
INSERT INTO `x_user` VALUES ('18', 'test18', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:19');
INSERT INTO `x_user` VALUES ('19', 'test19', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('20', 'test20', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('21', 'test21', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('22', 'test22', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('23', 'test23', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('24', 'test24', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('25', 'test25', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('26', 'test26', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('27', 'test27', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('28', 'test28', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('29', 'test29', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('30', 'test30', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('31', 'test31', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('32', 'test32', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:20');
INSERT INTO `x_user` VALUES ('33', 'test33', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:21');
INSERT INTO `x_user` VALUES ('34', 'test34', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:21');
INSERT INTO `x_user` VALUES ('35', 'test35', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:21');
INSERT INTO `x_user` VALUES ('36', 'test36', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:21');
INSERT INTO `x_user` VALUES ('37', 'test37', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:21');
INSERT INTO `x_user` VALUES ('38', 'test38', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:21');
INSERT INTO `x_user` VALUES ('39', 'test39', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:21');
INSERT INTO `x_user` VALUES ('40', 'test40', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:21');
INSERT INTO `x_user` VALUES ('41', 'test41', 'ee11cbb19052e40b07aac0ca060c23ee', '3', '11111111111', '这是一个地址', '123@qq.com', '女', '姓名', '2017-04-08 16:06:21');
INSERT INTO `x_user` VALUES ('42', 'wowowow', 'b7f7b5a6fdca58b0f09ee400e5d880f1', '2', '11111111111', 'wowowow', 'wowowow@q.com', '男', 'wowowow', '2017-04-08 17:07:31');
INSERT INTO `x_user` VALUES ('43', 'mytest', 'e10adc3949ba59abbe56e057f20f883e', '2', '11111111111', '111111111111111111', '11111@qq.com', '男', 'ascsa', '2017-04-08 17:30:51');
INSERT INTO `x_user` VALUES ('44', 'mytest33', 'e10adc3949ba59abbe56e057f20f883e', '2', '11111111111', '111111111111', '111@qq.com', '男', '1111111', '2017-04-09 18:53:36');
INSERT INTO `x_user` VALUES ('46', 'mytest5', 'e10adc3949ba59abbe56e057f20f883e', '2', '12333333333', '123', '1@qq.com', '男', '123', '2017-04-09 18:57:39');
INSERT INTO `x_user` VALUES ('47', 'mytest7', 'e10adc3949ba59abbe56e057f20f883e', '2', '11111111111', '11', '1112@qq.com', '男', '111', '2017-04-09 19:02:25');
INSERT INTO `x_user` VALUES ('48', 'test77', 'bbb8aae57c104cda40c93843ad5e6db8', '2', '12231111111', '123', '1@qq.com', '男', '123', '2017-04-09 19:03:23');
INSERT INTO `x_user` VALUES ('49', 'mytest99', 'adbc91a43e988a3b5b745b8529a90b61', '2', '11111111111', '111111111111111', '111111@q.com', '男', '111111111111', '2017-04-09 19:05:07');
