/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : secondhand

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2018-11-15 19:38:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `pwd` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '13770301026', '123456');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `introduced_text` text COLLATE utf8_bin,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `self_fk` (`parent_id`),
  CONSTRAINT `self_fk` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '电子产品', null, null);
INSERT INTO `category` VALUES ('2', '生活用品', null, null);
INSERT INTO `category` VALUES ('3', '书籍阅读', null, null);
INSERT INTO `category` VALUES ('4', '服装物品', null, null);
INSERT INTO `category` VALUES ('5', '手机平板', null, '1');
INSERT INTO `category` VALUES ('6', '音乐设备', null, '1');
INSERT INTO `category` VALUES ('7', '电脑配备', null, '1');
INSERT INTO `category` VALUES ('8', '宿舍神器', null, '2');
INSERT INTO `category` VALUES ('9', '卫生用品', null, '2');
INSERT INTO `category` VALUES ('10', '床上用品', null, '2');
INSERT INTO `category` VALUES ('11', '文化历史', null, '3');
INSERT INTO `category` VALUES ('12', '大学书籍', null, '3');
INSERT INTO `category` VALUES ('13', '小说动漫', null, '3');
INSERT INTO `category` VALUES ('14', '衣物鞋子', null, '4');
INSERT INTO `category` VALUES ('15', '项链戒指', null, '4');
INSERT INTO `category` VALUES ('16', '眼部装饰', null, '4');
INSERT INTO `category` VALUES ('17', '世界名著', null, '3');
INSERT INTO `category` VALUES ('18', '代步工具', null, '2');
INSERT INTO `category` VALUES ('19', '其他相关', null, '1');
INSERT INTO `category` VALUES ('20', '其他相关', null, '3');
INSERT INTO `category` VALUES ('21', '其他相关', null, '2');
INSERT INTO `category` VALUES ('22', '帽子围巾', null, '4');
INSERT INTO `category` VALUES ('23', '背包挂包', null, '4');
INSERT INTO `category` VALUES ('24', '其他相关', null, '4');

-- ----------------------------
-- Table structure for `evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `star_level` int(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `crop_id` int(11) DEFAULT NULL,
  `evaluate_date` date DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluate_user_fk` (`user_id`),
  KEY `evaluate_user_fk2` (`crop_id`),
  KEY `evaluate_order_fk` (`order_id`),
  CONSTRAINT `evaluate_order_fk` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `evaluate_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `evaluate_user_fk2` FOREIGN KEY (`crop_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES ('2', '不错！', null, '1', '1', '2018-04-21', '15');
INSERT INTO `evaluate` VALUES ('5', '还不错的购物体验！', null, '1', '3', '2018-05-20', '23');
INSERT INTO `evaluate` VALUES ('6', '比较符合预期。', null, '2', '2', '2018-05-24', '46');
INSERT INTO `evaluate` VALUES ('7', '商家的东西蛮好的！', null, '7', '1', '2018-05-25', '50');
INSERT INTO `evaluate` VALUES ('8', '可以，勉强吧', null, '7', '1', '2018-05-25', '51');
INSERT INTO `evaluate` VALUES ('9', '不错的东西！', null, '7', '1', '2018-05-25', '52');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `introduced_text` text COLLATE utf8_bin NOT NULL,
  `picture_path` varchar(255) COLLATE utf8_bin NOT NULL,
  `cover_pic` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `quantity` int(4) NOT NULL,
  `price` double NOT NULL,
  `used_month` int(4) DEFAULT NULL,
  `publish_date` date NOT NULL,
  `goods_state` int(11) NOT NULL,
  `audit_state` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `failure_text` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_user_fk` (`user_id`),
  KEY `goods_category_f` (`category_id`),
  CONSTRAINT `goods_category_f` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `goods_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '小米5', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '2', '2000', '5', '2018-03-14', '0', '1', '3', '5', null);
INSERT INTO `goods` VALUES ('2', '小米6', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '1', '2000', '5', '2018-03-14', '0', '1', '3', '6', null);
INSERT INTO `goods` VALUES ('3', '小米7', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '1', '2000', '5', '2018-03-14', '0', '0', '2', '7', null);
INSERT INTO `goods` VALUES ('6', '小米27', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '2', '2000', '5', '2018-03-14', '0', '1', '3', '8', null);
INSERT INTO `goods` VALUES ('8', '小米12', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '1', '2000', '5', '2018-03-14', '0', '1', '3', '10', null);
INSERT INTO `goods` VALUES ('14', '小米plus', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '1', '2000', '5', '2018-03-14', '0', '1', '3', '14', null);
INSERT INTO `goods` VALUES ('16', '小米max5', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '1', '2000', '5', '2018-03-14', '0', '0', '2', '15', null);
INSERT INTO `goods` VALUES ('17', '小米max6', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '1', '2000', '5', '2018-03-14', '0', '1', '3', '14', null);
INSERT INTO `goods` VALUES ('19', '小米plus5', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '1', '2000', '5', '2018-03-14', '0', '0', '2', '11', null);
INSERT INTO `goods` VALUES ('25', '小米max15', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '1', '2000', '5', '2018-03-14', '0', '2', '1', '6', '照片与商品不符');
INSERT INTO `goods` VALUES ('26', '小米max16', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '1', '2000', '5', '2018-03-14', '0', '2', '1', '1', '照片与商品不符');
INSERT INTO `goods` VALUES ('27', '小米a7', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '1', '2000', '5', '2018-03-14', '0', '2', '2', '1', '信息过于简单');
INSERT INTO `goods` VALUES ('42', '小米7', 0xE5889AE4B9B0E69DA535E4B8AAE69C88EFBC8CE68DA2E6898BE69CBAE4BA86, '', null, '1', '2000', '5', '2018-03-14', '0', '0', '2', '1', null);
INSERT INTO `goods` VALUES ('52', '吉他谱', 0x3130, '1/2dc17d58-54a2-438d-ada5-92bcac16cc9b', '1.png', '1', '10', '10', '2018-03-09', '0', '2', '1', '5', '请介绍详细！');
INSERT INTO `goods` VALUES ('58', '道德经', 0xE4B9A6EFBC8CE4B99FE4B88DE697A7E4BA86E38082E58FAFE4BBA5E79C8BE79C8BEFBC8CE5B7B2E7BB8FE8838CE4B88BE69DA5E4BA86EFBC8CE8BDACE6898BE68DA2E782B9E992B1E38082, '1/b4a21213-9b8d-4939-a607-92a3527c8f3a', '1.jpg', '1', '20', '5', '2018-04-29', '0', '1', '2', '11', null);
INSERT INTO `goods` VALUES ('59', '三字经', 0xE590AFE89299E8AFBBE789A9, '1/255e21d1-a433-4af9-b199-a6ed8ceff545', '1.jpg', '6', '33', '1', '2018-04-29', '0', '1', '3', '11', null);
INSERT INTO `goods` VALUES ('60', '影集CD', 0x4265796F6E64E4B990E9989F, '1/83d4d09f-39c2-48eb-ae26-59fb7323fc76', '1.jpg', '1', '20', '12', '2018-05-05', '0', '1', '1', '8', null);
INSERT INTO `goods` VALUES ('61', '女士包包', 0xE5889AE4B9B0E585A5E6B2A1E5A49AE4B985E79A84E58C85E58C85EFBC8CE69C80E8BF91E680A5E99C80E794A8E992B1EFBC8CE5A4A7E5AEB6E99C80E8A681E79A84E58FAFE4BBA5E585A5E6898BEFBC8CE7BB9DE5AFB9E8B4A8E9878FEFBC81, '1/8cc09d1d-20e7-4152-8c79-c5ffc1832e2d', '1.jpg', '4', '500', '1', '2018-05-23', '0', '1', '1', '23', null);
INSERT INTO `goods` VALUES ('62', '男士皮鞋', 0xE99E8BE5AD90E587BAE594AEEFBC8CE6B2A1E7A9BFE5A49AE4B985EFBC8CE7BB9DE5AFB9E79C9FE79AAEEFBC8CE5B9B6E697A0E7A0B4E68D9FE38082, '1/bff5e0d8-00fb-492f-9f7c-c4769e5e6576', '1.jpg', '2', '100', '1', '2018-05-23', '0', '1', '1', '14', null);
INSERT INTO `goods` VALUES ('63', '墨镜', 0xE697A0E7A0B4E68D9FE38082E58F88E99C80E8A681E79A84E5908CE5ADA6E58FAFE4BBA5E79C8BE79C8BE38082, '1/5ecdf2a7-bf55-483a-a19d-5582a7bc1920', '1.jpg', '1', '20', '4', '2018-05-23', '0', '1', '1', '16', null);
INSERT INTO `goods` VALUES ('64', '宠物物品', 0xE68993E58C85E587BAE594AEE38082E788B1E78B97E78B97E79A84E5ADA6E5A6B9E4BBACE58FAFE4BBA5E68993E58C85E5B8A6E59B9EEFBC81, '1/e127ccc5-31c6-407b-8f1c-8a188f252c36', '1.gif', '1', '1000', '6', '2018-05-23', '0', '1', '1', '21', null);
INSERT INTO `goods` VALUES ('65', '女士上衣', 0xE799BDE889B254E681A4EFBC8CE5BE88E5A5BDE79A84E69D90E8B4A8EFBC81, '1/d253ce99-3f59-4782-a448-c18501e7eb8d', '1.jpg', '0', '140', '2', '2018-05-23', '0', '1', '1', '14', null);
INSERT INTO `goods` VALUES ('66', '戒指', 0xE4B880E5AFB9E68892E5AD90EFBC8CE98082E59088E5A4A7E5AEB6E79A84E38082, '1/2edad3d1-392c-42e9-9eaf-6aedff8f94bb', '1.png', '0', '111', '5', '2018-05-23', '0', '1', '1', '15', null);
INSERT INTO `goods` VALUES ('67', '男士墨镜', 0xE697A0E7A0B4E68D9F, '1/9b7f15cb-3cd6-4537-90ca-2aa6b4dfe39d', '1.jpg', '1', '200', '3', '2018-05-23', '0', '1', '1', '16', null);
INSERT INTO `goods` VALUES ('68', '椅子', 0xE79AAEE6A485E5AD90EFBC8CE6AF95E4B89AE4BA86EFBC8CE5ADA6E995BFE5B8A6E4B88DE8B5B0E4BA86E38082E4BEBFE5AE9CE587BAE594AEEFBC81, '1/1596f01f-a8fc-4535-a67c-f22f708ab06f', '1.jpg', '1', '88', '36', '2018-05-23', '0', '1', '1', '8', null);
INSERT INTO `goods` VALUES ('69', '背包', 0xE8838CE58C85E38082E5A5B3E5A3ABE794A8E79A84EFBC8CE5A4A7E5AEB6E69C89E99C80E8A681E79A84E8AF9DE5B8A6E8B5B0, '1/b21f325d-c66e-4dcd-b2d7-78b749d85d36', '1.jpg', '1', '50', '2', '2018-05-23', '0', '0', '1', '23', null);
INSERT INTO `goods` VALUES ('70', '吉他', 0xE794A8E4BA86E4B880E5B9B4E79A84EFBC8CE58E9FE4BBB73630302EE5ADA6E5BC9FE58FAFE4BBA5E68BBFE69DA5E585A5E997A8E78EA9E78EA9E38082, '1/995c13f2-d05d-491e-af4a-7a7327a1d70e', '1.jpg', '1', '200', '12', '2018-05-23', '0', '1', '1', '21', null);
INSERT INTO `goods` VALUES ('71', '盆栽', 0xE5AEBFE8888DE7BE8EE58C96, '1/5047e7d3-eba3-40a6-a757-7b5a6e878964', '1.gif', '1', '30', '6', '2018-05-23', '0', '1', '1', '8', null);
INSERT INTO `goods` VALUES ('72', '耳机', 0xE8BF87E6898BE6B2A1E5A49AE4B985EFBC8CE6AF95E4B89AE4BA86E38082, '2/f28490a9-f302-42e7-a974-771b582c5d6e', '1.png', '1', '50', '2', '2018-05-23', '0', '1', '2', '6', null);
INSERT INTO `goods` VALUES ('74', '手机', 0xE8A681E4B9B0E79A84E5BFABE5958AEFBC8CE4BBB7E6A0BCE58FAFE4BC98E683A0, '2/63cde73c-d384-4a88-9805-161fb67a9166', '1.gif', '1', '2500', '5', '2018-05-23', '0', '2', '2', '5', '图片不真实。');
INSERT INTO `goods` VALUES ('75', '项链', 0xE9A1B9E993BEE9A1B9E993BEE9A1B9E993BEE9A1B9E993BEE9A1B9E993BEEFBC8CE587BAE594AE, '2/dca4a11b-9df6-43ec-82b4-6b0c4a424c73', '1.png', '1', '120', '1', '2018-05-23', '0', '1', '2', '15', null);
INSERT INTO `goods` VALUES ('76', '黑色T恤', 0xE4B9B0E4BA86E4B98BE5908EEFBC8CE4B88DE683B3E7A9BFE4BA86E38082E7BB9DE5AFB9E696B0, '2/0566cd23-c7bc-468e-b58d-399b987b4fa4', '1.jpg', '1', '50', '0', '2018-05-23', '0', '1', '2', '14', null);
INSERT INTO `goods` VALUES ('77', 'T恤', 0xE781B0E889B2, '2/34d6f276-9e69-4e48-b67b-fd25da1c1bdb', '1.jpg', '2', '20', '1', '2018-05-23', '0', '1', '2', '14', null);
INSERT INTO `goods` VALUES ('78', '上衣', 0xE69D90E8B4A8E99D9EE5B8B8E5A5BD, '2/135f87ad-5773-40e2-999b-3c98e9e93c95', '1.jpg', '1', '99', '0', '2018-05-23', '0', '1', '2', '14', null);
INSERT INTO `goods` VALUES ('79', '耳环', 0xE697B6E5B09AE880B3E78EAFEFBC8CE4BEBFE5AE9CE587BAE594AE, '2/ef0101ff-815c-4bb4-a707-1eb12c435da8', '1.jpg', '5', '77', '1', '2018-05-23', '0', '1', '2', '15', null);
INSERT INTO `goods` VALUES ('80', '电风扇', 0xE79599E7BB99E5ADA6E5BC9FE5ADA6E5A6B9E4BBAC, '2/42327184-b407-4958-89c8-3b47796d495b', '1.jpg', '2', '8', '12', '2018-05-23', '0', '1', '2', '8', null);
INSERT INTO `goods` VALUES ('81', '手表', 0xE88BA5E698AFE4B88DE6BBA1E6848F20E58FAFE4BBA5E58D8FE59586E4BBB7E992B1, '2/fa345855-5795-4afd-927c-77dd1ec68cf1', '1.jpg', '1', '500', '3', '2018-04-18', '0', '1', '2', '24', null);
INSERT INTO `goods` VALUES ('82', '手表', 0xE4BEBFE5AE9CE587BAE594AE, '2/8d7388cd-5245-430a-839c-528ce5d8855c', '1.jpg', '1', '200', '2', '2018-05-23', '0', '1', '2', '24', null);
INSERT INTO `goods` VALUES ('83', '唇膏', 0xE69CAAE5BC80E5B081E79A84EFBC8CE8BDACE6898B, '6/5b4c69ae-03e3-4225-84bc-89e49fa748c7', '1.jpg', '2', '20', '0', '2018-05-23', '0', '1', '6', '21', null);
INSERT INTO `goods` VALUES ('84', '吉他', 0xE58E9FE4BBB732303030E59089E4BB9620E794A8E4BA8634E5B9B420E8BDACE6898B, '6/f0ed47cd-1e8d-4d73-a752-89b45f7f6254', '1.jpg', '1', '800', '48', '2018-05-23', '0', '1', '6', '6', null);
INSERT INTO `goods` VALUES ('85', '皮椅子', 0xE5ADA6E5BC9FE5ADA6E5A6B9E58FAFE4BBA5E79C8BE79C8BEFBC8CE59D90E8B5B7E69DA5E89BAEE88892E69C8DE79A84, '6/23948e44-1c6f-43f7-9e69-8cbf0de04974', '1.jpg', '3', '100', '12', '2018-05-23', '0', '1', '6', '8', null);
INSERT INTO `goods` VALUES ('86', '皮鞋', 0xE7899BE79AAE, '6/f1a905cb-5204-4d5f-b1c5-0ed2416b86e3', '1.jpg', '2', '120', '5', '2018-03-14', '0', '2', '6', '14', '信息请填详细！');
INSERT INTO `goods` VALUES ('87', '玩具熊', 0xE58FAFE788B1E59089E7A5A5E789A9, '6/7d5772b6-2482-4d0b-bbd8-f2b95a3cac41', '1.jpg', '1', '50', '2', '2018-05-23', '0', '0', '6', '10', null);
INSERT INTO `goods` VALUES ('88', '订书机', 0xE8AEA2E4B9A6E69CBA20E696B9E4BEBF, '6/3ca72ca7-3970-4534-8f6f-71302b29800e', '1.jpg', '1', '5', '2', '2018-05-23', '0', '2', '6', '8', 'Xx');
INSERT INTO `goods` VALUES ('89', '多功能小刀', 0xE5A49AE58A9FE883BDE696B9E4BEBFE5B08FE58880, '6/9dfb887b-8ea5-4422-a935-0e890eb486df', '1.jpg', '1', '30', '7', '2018-05-23', '0', '0', '6', '8', null);
INSERT INTO `goods` VALUES ('90', '自行车', 0xE8BDACE8AEA934E5B9B4E79A84E887AAE8A18CE8BDA6EFBC8CE4B88AE8AFBEE99D9EE5B8B8E696B9E4BEBF, '6/070e46e5-10d2-446a-b9d6-fe26e8076a2d', '1.jpg', '1', '500', '48', '2018-05-23', '0', '0', '6', '18', null);
INSERT INTO `goods` VALUES ('91', '头戴式耳机', 0xE79599E7BB99E5ADA6E5BC9FE5ADA6E5A6B9E4BBACE79A84EFBC8CE5BFABE69DA5E4B9B0, '2/af356c64-75d4-4971-ba20-ef55a5bc61c8', '1.png', '2', '80', '12', '2018-05-25', '0', '0', '2', '6', null);

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_message` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `message_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_user_fk` (`user_id`),
  KEY `message_goods` (`goods_id`),
  CONSTRAINT `message_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '能不能便宜点 ，便宜点我就买了', null, '2', '1', '1', '2018-03-22 06:23:54');
INSERT INTO `message` VALUES ('2', '好的 我会修改', '1', '3', null, null, '2018-03-23 15:24:11');
INSERT INTO `message` VALUES ('3', '这个保修期还多久', null, '1', '1', '1', '2018-03-15 21:24:20');
INSERT INTO `message` VALUES ('4', '8个月', '3', '3', null, null, '2018-03-23 15:24:30');
INSERT INTO `message` VALUES ('5', '贵了！！！！', null, '2', '1', '1', '2018-03-23 12:24:33');
INSERT INTO `message` VALUES ('6', '太旧了 便宜些就可以', null, '1', '2', '0', '2018-04-04 20:36:11');
INSERT INTO `message` VALUES ('7', '1800可以吗？', null, '1', '2', '0', '2018-04-05 20:36:15');
INSERT INTO `message` VALUES ('8', '呃呃呃！', null, '1', '2', '0', '2018-04-24 20:36:18');
INSERT INTO `message` VALUES ('11', '不贵了大兄弟', '5', '3', null, null, '2018-04-22 02:37:10');
INSERT INTO `message` VALUES ('12', '能具体哪些歌吗？', null, '2', '60', '1', '2018-05-09 11:46:27');
INSERT INTO `message` VALUES ('13', '我要买了！', null, '2', '60', '0', '2018-05-09 11:46:49');
INSERT INTO `message` VALUES ('14', '《秘密警察》专辑', '12', '1', null, null, '2018-05-09 12:01:10');
INSERT INTO `message` VALUES ('15', '我要！', null, '1', '58', null, '2018-05-09 16:45:57');
INSERT INTO `message` VALUES ('16', '便宜点？', null, '2', '61', '0', '2018-05-23 14:21:43');
INSERT INTO `message` VALUES ('17', '什么材质？', null, '2', '61', '0', '2018-05-23 14:22:10');
INSERT INTO `message` VALUES ('18', '很好的项链，有详细的数据吗', null, '1', '75', '1', '2018-05-23 23:22:58');
INSERT INTO `message` VALUES ('19', '谢谢！', null, '1', '75', '1', '2018-05-23 23:27:11');
INSERT INTO `message` VALUES ('20', '暂时没有额。不好意思', '18', '2', null, '0', '2018-05-23 23:31:24');
INSERT INTO `message` VALUES ('22', '准备下单了！', null, '2', '68', '0', '2018-05-25 20:36:01');
INSERT INTO `message` VALUES ('23', '？？？？', '19', '2', null, '0', '2018-05-25 21:12:39');
INSERT INTO `message` VALUES ('24', 's', null, '2', '61', '0', '2018-05-26 08:39:34');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `send_date` date DEFAULT NULL,
  `over_date` date DEFAULT NULL,
  `order_state` int(1) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `get_way` int(11) DEFAULT NULL,
  `pay_way` int(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `crop_id` int(11) DEFAULT NULL,
  `order_number` varchar(14) COLLATE utf8_bin DEFAULT NULL,
  `shipping_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_user_fk` (`user_id`),
  KEY `order_user_fk1` (`crop_id`),
  CONSTRAINT `order_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `order_user_fk1` FOREIGN KEY (`crop_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('13', '2018-04-08', '2018-04-11', null, '-1', '22', '0', '0', '1', '1', '18040811112324', '软件学院9栋');
INSERT INTO `order` VALUES ('15', '2018-04-08', '2018-04-09', null, '2', '12.5', '1', '0', '1', '1', '18040811122324', '软件学院9栋');
INSERT INTO `order` VALUES ('20', '2018-04-17', '2018-05-16', null, '1', '10', '0', '0', '1', '1', '18041711171918', '软件学院9栋');
INSERT INTO `order` VALUES ('21', '2018-04-17', '2018-05-16', null, '1', '2000', '0', '0', '1', '3', '18041711181918', '软件学院9栋');
INSERT INTO `order` VALUES ('23', '2018-04-17', '2018-05-01', '2018-05-16', '2', '2002.5', '1', '0', '1', '3', '18041711221919', '软件学院9栋');
INSERT INTO `order` VALUES ('25', '2018-04-17', '2018-05-01', '2018-05-16', '2', '2000', '0', '0', '1', '3', '18041711121928', '软件学院9栋');
INSERT INTO `order` VALUES ('27', '2018-04-29', null, null, '0', '2002.5', '1', '0', '3', '3', '18042911131803', '软件学院9栋');
INSERT INTO `order` VALUES ('28', '2018-04-29', '2018-05-16', null, '1', '20', '0', '0', '1', '2', '18042911122014', '软件学院9栋');
INSERT INTO `order` VALUES ('43', '2018-05-09', '2018-05-24', null, '1', '35.5', '1', '0', '1', '3', '18050911121337', '软件学院9栋');
INSERT INTO `order` VALUES ('44', '2018-05-23', null, null, '0', '30', '0', '0', '2', '1', '18052311162336', '软件学院9栋2号');
INSERT INTO `order` VALUES ('45', '2018-05-23', null, null, '0', '50', '0', '0', '2', '2', '18052311172336', '软件学院9栋2号');
INSERT INTO `order` VALUES ('46', '2018-05-23', '2018-05-23', '2018-05-24', '2', '99', '0', '0', '2', '2', '18052311182339', '软件学院9栋');
INSERT INTO `order` VALUES ('47', '2018-05-24', '2018-05-24', null, '1', '102.5', '1', '0', '2', '1', '18052411110010', '软件学院9栋');
INSERT INTO `order` VALUES ('48', '2018-05-24', null, null, '0', '70', '0', '0', '6', '2', '18052411111302', '软件学院9栋');
INSERT INTO `order` VALUES ('49', '2018-05-24', null, null, '0', '100', '0', '0', '6', '6', '18052411121302', '软件学院9栋');
INSERT INTO `order` VALUES ('50', '2018-05-25', '2018-05-25', '2018-05-25', '2', '100', '0', '0', '7', '1', '18052511111818', '');
INSERT INTO `order` VALUES ('51', '2018-05-25', '2018-05-25', '2018-05-25', '2', '100', '0', '0', '7', '1', '18052511121824', '');
INSERT INTO `order` VALUES ('52', '2018-05-25', '2018-05-25', '2018-05-25', '2', '100', '0', '0', '7', '1', '18052511131826', '');
INSERT INTO `order` VALUES ('53', '2018-05-25', null, null, '0', '100', '0', '0', '7', '1', '18052511141827', '');
INSERT INTO `order` VALUES ('54', '2018-05-25', null, null, '0', '100', '0', '0', '7', '1', '18052511111838', '');
INSERT INTO `order` VALUES ('55', '2018-05-26', null, null, '0', '141', '0', '0', '2', '1', '18052611130017', '软件学院9栋');
INSERT INTO `order` VALUES ('56', '2018-05-26', null, null, '0', '50', '0', '0', '2', '2', '18052611140017', '软件学院9栋');
INSERT INTO `order` VALUES ('57', '2018-05-26', null, null, '0', '240', '0', '0', '2', '1', '18052611110839', '软件学院9栋');
INSERT INTO `order` VALUES ('58', '2018-05-26', null, null, '0', '50', '0', '0', '2', '2', '18052611120839', '软件学院9栋');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_goods_fk` (`goods_id`),
  KEY `item_order_fk` (`order_id`),
  CONSTRAINT `item_goods_fk` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_order_fk` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('16', '60', '15', '1', '10');
INSERT INTO `orderitem` VALUES ('21', '52', '20', '1', '10');
INSERT INTO `orderitem` VALUES ('22', '2', '21', '1', '2000');
INSERT INTO `orderitem` VALUES ('24', '2', '23', '1', '2000');
INSERT INTO `orderitem` VALUES ('26', '2', '25', '1', '2000');
INSERT INTO `orderitem` VALUES ('30', '2', '27', '1', '2000');
INSERT INTO `orderitem` VALUES ('31', '58', '28', '1', '20');
INSERT INTO `orderitem` VALUES ('45', '59', '43', '1', '33');
INSERT INTO `orderitem` VALUES ('46', '71', '44', '1', '30');
INSERT INTO `orderitem` VALUES ('47', '72', '45', '1', '50');
INSERT INTO `orderitem` VALUES ('48', '78', '46', '1', '99');
INSERT INTO `orderitem` VALUES ('49', '62', '47', '1', '100');
INSERT INTO `orderitem` VALUES ('50', '77', '48', '1', '20');
INSERT INTO `orderitem` VALUES ('51', '72', '48', '1', '50');
INSERT INTO `orderitem` VALUES ('52', '85', '49', '1', '100');
INSERT INTO `orderitem` VALUES ('53', '62', '50', '1', '100');
INSERT INTO `orderitem` VALUES ('54', '62', '51', '1', '100');
INSERT INTO `orderitem` VALUES ('55', '62', '52', '1', '100');
INSERT INTO `orderitem` VALUES ('56', '62', '53', '1', '100');
INSERT INTO `orderitem` VALUES ('57', '62', '54', '1', '100');
INSERT INTO `orderitem` VALUES ('58', '71', '55', '1', '30');
INSERT INTO `orderitem` VALUES ('59', '66', '55', '1', '111');
INSERT INTO `orderitem` VALUES ('60', '76', '56', '1', '50');
INSERT INTO `orderitem` VALUES ('61', '65', '57', '1', '140');
INSERT INTO `orderitem` VALUES ('62', '62', '57', '1', '100');
INSERT INTO `orderitem` VALUES ('63', '72', '58', '1', '50');

-- ----------------------------
-- Table structure for `sign`
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `collection_user_fk` (`user_id`),
  KEY `collection_goods_id` (`goods_id`),
  CONSTRAINT `collection_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES ('26', '1', '58');
INSERT INTO `sign` VALUES ('28', '1', '61');
INSERT INTO `sign` VALUES ('29', '1', '63');
INSERT INTO `sign` VALUES ('30', '1', '72');
INSERT INTO `sign` VALUES ('31', '6', '61');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pwd` varchar(20) COLLATE utf8_bin NOT NULL,
  `alias_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `real_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `phone_number` varchar(11) COLLATE utf8_bin NOT NULL,
  `alipay_number` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `sno` varchar(30) COLLATE utf8_bin NOT NULL,
  `head_img` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123456', 'Ch', 'he', '13712002336', '111111111111', '男', '软件学院9栋', 'XXXXXX@qq.com', '8000222011', '1.png');
INSERT INTO `user` VALUES ('2', '123456', 'Blues.Li', '李小龙', '13844441025', null, '男', '软件学院9栋', 'XXXXXX212@qq.com', '8000111011', '2.jpg');
INSERT INTO `user` VALUES ('3', '123456', '楚庄王', '撒旦', '13170301009', '136777777', '男', '软件学院9栋', '1258号@qq.com', '8000111022', '3.png');
INSERT INTO `user` VALUES ('4', '123456', 'XXXX', 'XXX', '13766778877', null, '男', null, 'x@qq.com', '8000114015', null);
INSERT INTO `user` VALUES ('5', '123456', 'YYYY', 'YYY', '13258877789', null, '女', null, 'y@qq.com', '8000115111', null);
INSERT INTO `user` VALUES ('6', '123456', '苌弘', '化碧', '13555256636', '13766666666', '男', '软件学院9栋', '982363116@qq.com', '8100111010', null);
INSERT INTO `user` VALUES ('7', '123456', 'aaaa', null, '13211427215', null, null, null, null, '8000114118', null);
