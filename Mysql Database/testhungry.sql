/*
Navicat MySQL Data Transfer

Source Server         : conn
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : testhungry

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-12-30 15:31:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '快餐便当');
INSERT INTO `category` VALUES ('2', '暖胃粉面');
INSERT INTO `category` VALUES ('3', '炸鸡汉堡');
INSERT INTO `category` VALUES ('4', '甜品饮品');
INSERT INTO `category` VALUES ('5', '生鲜果蔬');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `create_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `fid` (`fid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `food` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `food`
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` float(50,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT 'noimg',
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('1', '肉片豆腐烩饭', '8.00', '好吃！！！', 'c1_f1', '1'); 
INSERT INTO `food` VALUES ('2', '肉片薯仔烩饭', '8.00', '好吃！！！', 'c1_f2', '1');
INSERT INTO `food` VALUES ('3', '鸡蛋炒肉烩饭', '10.00', '好吃！！！', 'c1_f3', '1');
INSERT INTO `food` VALUES ('4', '肉片茄子烩饭', '10.00', '好吃！！！', 'c1_f4', '1');
INSERT INTO `food` VALUES ('5', '肉片凉瓜炒蛋烩饭', '11.00', '好吃！！！', 'c1_f5', '1');
INSERT INTO `food` VALUES ('6', '牛肉丸米粉', '10.00', '好吃！！！', 'c2_f6', '2');
INSERT INTO `food` VALUES ('7', '双丸米粉', '12.00', '好吃！！！', 'c2_f7', '2');
INSERT INTO `food` VALUES ('8', '牛筋丸米粉', '10.00', '好吃！！！', 'c2_f8', '2');
INSERT INTO `food` VALUES ('9', '牛腩河粉', '12.00', '好吃！！！', 'c2_f9', '2');
INSERT INTO `food` VALUES ('10', '肉片青瓜烩饭', '9.00', '好吃！！！', 'c1_f10', '1');
INSERT INTO `food` VALUES ('11', '肉片椰菜烩饭', '8.00', '好吃！！！', 'c1_f11', '1');
INSERT INTO `food` VALUES ('12', '排骨生菜烩饭', '12.00', '好吃！！！', 'c1_f12', '1');
INSERT INTO `food` VALUES ('13', '鸡肉西兰花烩饭', '12.00', '好吃！！！', 'c1_f13', '1');
INSERT INTO `food` VALUES ('14', '鸡肉薯仔烩饭', '11.00', '好吃！！！', 'c1_f14', '1');
INSERT INTO `food` VALUES ('15', '韭菜炒蛋烩饭', '8.00', '好吃！！！', 'c1_f15', '1');
INSERT INTO `food` VALUES ('16', '瘦肉+肉丸米粉', '8.00', '好吃！！！', 'c2_f16', '2');
INSERT INTO `food` VALUES ('17', '牛肉丸河粉', '12.00', '好吃！！！', 'c2_f17', '2');
INSERT INTO `food` VALUES ('18', '奥尔良烤鸡腿', '8.00', '好吃！！！', 'c3_f18', '3');
INSERT INTO `food` VALUES ('19', '炸鸡腿', '8.00', '好吃！！！', 'c3_f19', '3');
INSERT INTO `food` VALUES ('20', '老北京鸡肉卷', '8.00', '好吃！！！', 'c3_f20', '3');
INSERT INTO `food` VALUES ('21', '香辣鸡腿堡', '10.00', '好吃！！！', 'c3_f21', '3');
INSERT INTO `food` VALUES ('22', '巨无霸', '15.00', '好吃！！！', 'c3_f22', '3');
INSERT INTO `food` VALUES ('23', '奥尔良烤鸡', '20.00', '好吃！！！', 'c3_f23', '3');
INSERT INTO `food` VALUES ('24', '红豆奶茶', '10.00', '好喝！！！', 'c4_f24', '4');
INSERT INTO `food` VALUES ('25', '珍珠奶茶', '12.00', '好喝！！！', 'c4_f25', '4');
INSERT INTO `food` VALUES ('26', '鲜芋奶茶', '11.00', '好喝！！！', 'c4_f26', '4');
INSERT INTO `food` VALUES ('27', '焦糖奶茶', '10.00', '好喝！！！', 'c4_f27', '4');
INSERT INTO `food` VALUES ('28', '布丁奶茶', '10.00', '好喝！！！', 'c4_f28', '4');
INSERT INTO `food` VALUES ('29', '椰果奶茶', '9.00', '好喝！！！', 'c4_f29', '4');
INSERT INTO `food` VALUES ('31', '番石榴', '4.50', '好吃！！！', 'c5_f31', '5');
INSERT INTO `food` VALUES ('32', '红柿子', '6.50', '好吃！！！', 'c5_f32', '5');
INSERT INTO `food` VALUES ('33', '火龙果', '7.50', '好吃！！！', 'c5_f33', '5');
INSERT INTO `food` VALUES ('34', '龙眼', '26.00', '好吃！！！', 'c5_f34', '5');
INSERT INTO `food` VALUES ('35', '沙糖桔', '7.50', '好吃！！！', 'c5_f35', '5');
INSERT INTO `food` VALUES ('36', '青提', '13.50', '好吃！！！', 'c5_f36', '5');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `fid` (`fid`),
  KEY `oid` (`oid`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `food` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_3` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', '1', '12', '1', '6');
INSERT INTO `orderitem` VALUES ('2', '2', '12', '1', '10');
INSERT INTO `orderitem` VALUES ('3', '5', '12', '1', '5');
INSERT INTO `orderitem` VALUES ('4', '4', '22', '2', '12');
INSERT INTO `orderitem` VALUES ('6', '8', '22', '2', '5');
INSERT INTO `orderitem` VALUES ('7', '4', '17', '1', '10');
INSERT INTO `orderitem` VALUES ('8', '7', '17', '1', '7');
INSERT INTO `orderitem` VALUES ('9', '1', '17', '1', '9');
INSERT INTO `orderitem` VALUES ('10', '3', '17', '1', '4');
INSERT INTO `orderitem` VALUES ('11', '6', '17', '1', '2');
INSERT INTO `orderitem` VALUES ('12', '8', '17', '1', '5');
INSERT INTO `orderitem` VALUES ('13', '3', '18', '1', '1');
INSERT INTO `orderitem` VALUES ('14', '4', '18', '1', '4');
INSERT INTO `orderitem` VALUES ('15', '6', '18', '1', '5');
INSERT INTO `orderitem` VALUES ('18', '5', '19', '1', '1');
INSERT INTO `orderitem` VALUES ('19', '8', '19', '1', '6');
INSERT INTO `orderitem` VALUES ('20', '9', '19', '1', '6');
INSERT INTO `orderitem` VALUES ('22', '2', '21', '1', '1');
INSERT INTO `orderitem` VALUES ('53', '2', null, '2', '2');
INSERT INTO `orderitem` VALUES ('55', '3', '24', '8', '1');
INSERT INTO `orderitem` VALUES ('56', '2', '23', '1', '7');
INSERT INTO `orderitem` VALUES ('57', '19', '23', '1', '3');
INSERT INTO `orderitem` VALUES ('59', '18', '24', '8', '3');
INSERT INTO `orderitem` VALUES ('60', '27', '24', '8', '1');
INSERT INTO `orderitem` VALUES ('62', '2', '25', '8', '9');
INSERT INTO `orderitem` VALUES ('63', '4', '25', '8', '6');

-- ----------------------------
-- Table structure for `order_`
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `delivery_date` varchar(255) DEFAULT NULL,
  `confirm_date` varchar(255) DEFAULT NULL,
  `total_price` float(50,1) DEFAULT NULL,
  `is_pay` int(5) DEFAULT '0',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `order__ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES ('1', null, null, null, null, null, null, null, '666.0', '0', null);
INSERT INTO `order_` VALUES ('12', '201812102932', 'df', 'df', 'df', '2018-12-10', null, null, '66.0', '0', '1');
INSERT INTO `order_` VALUES ('13', '201812102395', '', '', '', '2018-12-10', null, null, '1088.5', '0', '1');
INSERT INTO `order_` VALUES ('14', '201812118615', '', '', '', '2018-12-11', null, null, '1088.5', '0', '1');
INSERT INTO `order_` VALUES ('17', '201812116867', '', '', '', '2018-12-11', '2018-12-18 19:45:56', null, '1088.5', '1', '1');
INSERT INTO `order_` VALUES ('18', '201812127624', 'gh', 'gh', 'gh', '2018-12-12', '2018-12-14 13:17:34', '2018-12-18 20:09:06', '475.0', '1', '1');
INSERT INTO `order_` VALUES ('19', '201812125454', '', '', '', '2018-12-12', null, null, '279.0', '0', '1');
INSERT INTO `order_` VALUES ('21', '201812132214', 'hj', 'hj', '13059264451', '2018-12-13 00:20:42', '2018-12-18 23:25:46', null, '60.5', '1', '1');
INSERT INTO `order_` VALUES ('22', '201812164965', 'df', 'df', '13059264451', '2018-12-16 21:25:37', null, null, '290.0', '1', '2');
INSERT INTO `order_` VALUES ('23', '201812186563', 'dfdddddddddddddddd', 'dddddd', '13059264451', '2018-12-18 22:01:34', '2018-12-18 22:02:37', '2018-12-18 22:02:53', '80.0', '1', '1');
INSERT INTO `order_` VALUES ('24', '201812185297', 'lll', 'jjj', '13456822215', '2018-12-18 22:34:05', null, null, '44.0', '0', '8');
INSERT INTO `order_` VALUES ('25', '201812207227', 'jh', 'df', '13059264451', '2018-12-20 08:39:51', '2018-12-20 08:40:25', '2018-12-20 08:40:35', '132.0', '1', '8');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '测试账号', '123456', '', '2018-12-14');
INSERT INTO `user` VALUES ('2', '测试帐号2', '123456', '', '2018-12-14');
INSERT INTO `user` VALUES ('3', 'hong', '123456', '', '2018-12-17 10:17:27');
INSERT INTO `user` VALUES ('4', 'jiahong', '520', '', '2018-12-17 10:18:29');
INSERT INTO `user` VALUES ('5', 'jiahong', null, null, '2018-12-17 15:06:13');
INSERT INTO `user` VALUES ('6', 'jiahong', null, null, '2018-12-17 15:15:41');
INSERT INTO `user` VALUES ('7', 'liangjiahone', '123456', '', '2018-12-17 15:37:05');
INSERT INTO `user` VALUES ('8', 'hong666', '111111', '13672916255', '2018-12-17 22:35:06');
