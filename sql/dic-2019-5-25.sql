/*
Navicat MySQL Data Transfer

Source Server         : 47.104.105.151
Source Server Version : 50556
Source Host           : 47.104.105.151:3306
Source Database       : dic

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2019-05-25 21:59:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for think_dic
-- ----------------------------
DROP TABLE IF EXISTS `think_dic`;
CREATE TABLE `think_dic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(512) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_dic
-- ----------------------------
INSERT INTO `think_dic` VALUES ('1', 'LONGMAN', 'https://www.ldoceonline.com/dictionary/{0}', '2019-05-22 10:49:45', '2019-05-22 10:49:48');
INSERT INTO `think_dic` VALUES ('2', 'MERRIAN', 'https://www.merriam-webster.com/dictionary/{0}', '2019-05-22 10:52:24', '2019-05-22 10:52:27');
INSERT INTO `think_dic` VALUES ('3', 'iCIBA', 'http://www.iciba.com/{0}', '2019-05-22 11:37:46', '2019-05-22 11:37:48');
INSERT INTO `think_dic` VALUES ('4', 'youdao', 'http://dict.youdao.com/w/{0}', '2019-05-22 11:38:50', '2019-05-22 11:38:52');
INSERT INTO `think_dic` VALUES ('5', 'dictionary', 'https://www.dictionary.com/browse/{0}', '2019-05-22 11:39:54', '2019-05-22 11:39:56');
INSERT INTO `think_dic` VALUES ('6', 'Dict.cn', 'http://dict.cn/{0}', '2019-05-22 11:40:35', '2019-05-22 11:40:37');
INSERT INTO `think_dic` VALUES ('7', 'Cambridge', 'https://dictionary.cambridge.org/dictionary/english/{0}', '2019-05-22 11:42:43', '2019-05-22 11:42:46');

-- ----------------------------
-- Table structure for think_search
-- ----------------------------
DROP TABLE IF EXISTS `think_search`;
CREATE TABLE `think_search` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `search_count` int(11) DEFAULT '1',
  `text` varchar(256) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_search
-- ----------------------------
INSERT INTO `think_search` VALUES ('2', '1', '5', 'time', '2019-05-22 14:34:39', '2019-05-23 16:20:58');
INSERT INTO `think_search` VALUES ('3', '2', '1', 'game', '2019-05-22 14:34:41', '2019-05-21 16:29:11');
INSERT INTO `think_search` VALUES ('9', '1', '3', 'work', '2019-05-21 17:58:29', '2019-05-21 21:55:56');
INSERT INTO `think_search` VALUES ('15', '1', '3', 'combo', '2019-05-21 21:34:28', '2019-05-22 09:49:32');
INSERT INTO `think_search` VALUES ('18', '1', '2', 'look', '2019-05-21 22:20:49', '2019-05-21 22:23:09');
INSERT INTO `think_search` VALUES ('19', '1', '1', 'took', '2019-05-21 22:21:07', '2019-05-21 22:21:07');
INSERT INTO `think_search` VALUES ('23', '1', '1', 'wood', '2019-05-22 09:53:47', '2019-05-22 09:53:47');
INSERT INTO `think_search` VALUES ('24', '1', '1', 'temperature', '2019-05-22 09:54:22', '2019-05-22 09:54:22');
INSERT INTO `think_search` VALUES ('25', '1', '1', 'priority', '2019-05-22 09:56:54', '2019-05-22 09:56:54');
INSERT INTO `think_search` VALUES ('26', '1', '1', 'fahrenheit', '2019-05-22 09:58:41', '2019-05-22 09:58:41');
INSERT INTO `think_search` VALUES ('27', '1', '5', 'entrepreneur', '2019-05-22 10:00:27', '2019-05-22 17:00:48');
INSERT INTO `think_search` VALUES ('28', '1', '1', 'typography', '2019-05-22 10:13:33', '2019-05-22 10:13:33');
INSERT INTO `think_search` VALUES ('29', '1', '7', 'badge', '2019-05-22 10:14:27', '2019-05-22 11:43:10');
INSERT INTO `think_search` VALUES ('34', '1', '2', 'scammer', '2019-05-22 12:06:41', '2019-05-22 17:01:10');
INSERT INTO `think_search` VALUES ('35', '1', '3', 'register', '2019-05-22 14:06:57', '2019-05-22 16:57:35');
INSERT INTO `think_search` VALUES ('36', '3', '1', 'game', '2019-05-22 14:17:57', '2019-05-22 14:17:57');
INSERT INTO `think_search` VALUES ('39', '1', '2', 'alternatively', '2019-05-22 17:48:45', '2019-05-22 17:49:23');
INSERT INTO `think_search` VALUES ('40', '1', '2', 'aggregate', '2019-05-22 17:49:46', '2019-05-22 17:51:35');
INSERT INTO `think_search` VALUES ('41', '1', '2', 'flexible', '2019-05-22 17:52:17', '2019-05-22 17:53:13');
INSERT INTO `think_search` VALUES ('42', '1', '2', 'tweak', '2019-05-22 17:55:21', '2019-05-22 17:56:02');
INSERT INTO `think_search` VALUES ('43', '1', '1', 'vary', '2019-05-22 17:56:34', '2019-05-22 17:56:34');
INSERT INTO `think_search` VALUES ('44', '1', '3', 'invocation', '2019-05-22 17:58:50', '2019-05-22 18:28:54');
INSERT INTO `think_search` VALUES ('45', '1', '3', 'serial', '2019-05-22 17:59:18', '2019-05-22 18:25:08');
INSERT INTO `think_search` VALUES ('46', '1', '1', 'frequently', '2019-05-22 21:15:56', '2019-05-22 21:15:56');
INSERT INTO `think_search` VALUES ('47', '1', '1', 'regularly', '2019-05-22 21:16:42', '2019-05-22 21:16:42');
INSERT INTO `think_search` VALUES ('48', '1', '1', 'inhale', '2019-05-22 21:29:40', '2019-05-22 21:29:40');
INSERT INTO `think_search` VALUES ('49', '1', '1', 'exhale', '2019-05-22 21:29:44', '2019-05-22 21:29:44');
INSERT INTO `think_search` VALUES ('50', '1', '4', 'well', '2019-05-22 21:34:49', '2019-05-22 22:51:00');
INSERT INTO `think_search` VALUES ('51', '1', '1', 'dividend', '2019-05-23 10:56:20', '2019-05-23 10:56:20');
INSERT INTO `think_search` VALUES ('52', '1', '1', 'gap', '2019-05-23 10:58:57', '2019-05-23 10:58:57');
INSERT INTO `think_search` VALUES ('53', '1', '1', 'revenue', '2019-05-23 11:06:46', '2019-05-23 11:06:46');
INSERT INTO `think_search` VALUES ('54', '1', '1', 'fight', '2019-05-23 15:09:14', '2019-05-23 15:09:14');
INSERT INTO `think_search` VALUES ('55', '1', '1', 'adjust', '2019-05-23 20:34:22', '2019-05-23 20:34:22');
INSERT INTO `think_search` VALUES ('56', '1', '1', 'job', '2019-05-23 20:34:28', '2019-05-23 20:34:28');
INSERT INTO `think_search` VALUES ('57', '1', '1', 'watch', '2019-05-23 20:34:42', '2019-05-23 20:34:42');
INSERT INTO `think_search` VALUES ('58', '1', '1', 'offense', '2019-05-23 20:34:48', '2019-05-23 20:34:48');
INSERT INTO `think_search` VALUES ('59', '1', '1', 'got', '2019-05-23 20:35:25', '2019-05-23 20:35:25');
INSERT INTO `think_search` VALUES ('60', '1', '1', 'test', '2019-05-23 20:40:16', '2019-05-23 20:40:16');
INSERT INTO `think_search` VALUES ('61', '1', '1', 'noticeable', '2019-05-23 20:58:55', '2019-05-23 20:58:55');
INSERT INTO `think_search` VALUES ('62', '1', '1', 'critical', '2019-05-23 20:59:42', '2019-05-23 20:59:42');
INSERT INTO `think_search` VALUES ('63', '1', '1', 'verbose', '2019-05-23 21:01:27', '2019-05-23 21:01:27');
INSERT INTO `think_search` VALUES ('64', '1', '1', 'worthwhile', '2019-05-23 21:03:09', '2019-05-23 21:03:09');
INSERT INTO `think_search` VALUES ('66', '1', '1', 'evolve', '2019-05-23 21:04:02', '2019-05-23 21:04:02');
INSERT INTO `think_search` VALUES ('67', '1', '1', 'obsolete', '2019-05-23 21:05:27', '2019-05-23 21:05:27');
INSERT INTO `think_search` VALUES ('68', '1', '2', 'stick', '2019-05-23 21:06:12', '2019-05-23 21:19:21');
INSERT INTO `think_search` VALUES ('70', '1', '1', 'sore', '2019-05-23 21:19:43', '2019-05-23 21:19:43');
INSERT INTO `think_search` VALUES ('72', '1', '1', 'telescope', '2019-05-23 21:22:59', '2019-05-23 21:22:59');
INSERT INTO `think_search` VALUES ('73', '1', '1', 'telescoped', '2019-05-23 21:23:14', '2019-05-23 21:23:14');
INSERT INTO `think_search` VALUES ('74', '1', '2', 'hone', '2019-05-23 23:36:47', '2019-05-23 23:37:07');
INSERT INTO `think_search` VALUES ('75', '1', '1', 'concrete', '2019-05-23 23:39:16', '2019-05-23 23:39:16');
INSERT INTO `think_search` VALUES ('76', '1', '1', 'consistent', '2019-05-23 23:39:54', '2019-05-23 23:39:54');
INSERT INTO `think_search` VALUES ('77', '1', '1', 'shaver', '2019-05-24 09:53:06', '2019-05-24 09:53:06');
INSERT INTO `think_search` VALUES ('78', '1', '2', 'bachelor', '2019-05-24 09:54:02', '2019-05-24 10:17:55');
INSERT INTO `think_search` VALUES ('79', '1', '2', 'bachelorette', '2019-05-24 09:55:17', '2019-05-24 10:16:50');
INSERT INTO `think_search` VALUES ('80', '1', '3', ' Awkward', '2019-05-24 12:37:13', '2019-05-24 12:38:41');
INSERT INTO `think_search` VALUES ('82', '1', '1', 'commitment', '2019-05-24 12:49:45', '2019-05-24 12:49:45');
INSERT INTO `think_search` VALUES ('83', '1', '1', 'gonna', '2019-05-24 14:13:57', '2019-05-24 14:13:57');
INSERT INTO `think_search` VALUES ('84', '1', '2', 'wash', '2019-05-24 14:46:50', '2019-05-24 15:58:06');
INSERT INTO `think_search` VALUES ('85', '1', '1', 'rub', '2019-05-24 14:46:54', '2019-05-24 14:46:54');
INSERT INTO `think_search` VALUES ('86', '1', '1', 'wipe', '2019-05-24 14:46:59', '2019-05-24 14:46:59');
INSERT INTO `think_search` VALUES ('88', '1', '5', 'masterpiece', '2019-05-24 15:58:44', '2019-05-24 16:33:16');
INSERT INTO `think_search` VALUES ('95', '1', '2', 'trash', '2019-05-25 11:45:55', '2019-05-25 13:45:03');

-- ----------------------------
-- Table structure for think_user
-- ----------------------------
DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `search_dic` varchar(255) DEFAULT '',
  `history_count` int(11) DEFAULT '10',
  `top_count` int(11) DEFAULT '10',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_user
-- ----------------------------
INSERT INTO `think_user` VALUES ('1', 'admin@126.com', '111111', 'LONGMAN', '10', '10', '2019-05-22 14:34:49', '2019-05-25 21:29:26');
INSERT INTO `think_user` VALUES ('2', 'game@qq.com', '111111', 'LONGMAN', '10', '10', '2019-05-22 14:34:52', '2019-05-21 16:28:54');
INSERT INTO `think_user` VALUES ('3', 'admin@qq.com', '111111', 'LONGMAN', '10', '10', '2019-05-22 14:15:07', '2019-05-22 14:18:03');
INSERT INTO `think_user` VALUES ('4', 'ky1031983138@qq.com', 'keke613@530', '', '10', '10', '2019-05-22 16:38:02', '2019-05-22 16:38:02');
INSERT INTO `think_user` VALUES ('5', '1113868077@qq.com', '619629', '', '10', '10', '2019-05-22 16:46:08', '2019-05-22 16:46:08');
INSERT INTO `think_user` VALUES ('6', '476231506@qq.com', '476231506', 'youdao', '5', '10', '2019-05-22 16:58:18', '2019-05-22 17:01:49');

-- ----------------------------
-- Table structure for think_word
-- ----------------------------
DROP TABLE IF EXISTS `think_word`;
CREATE TABLE `think_word` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `familar` tinyint(4) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_word
-- ----------------------------
INSERT INTO `think_word` VALUES ('1', '1', 'has', '1', '2019-05-25 12:29:02', '2019-05-25 21:24:39');
INSERT INTO `think_word` VALUES ('2', '1', 'found', '1', '2019-05-25 13:01:45', '2019-05-25 13:01:45');
INSERT INTO `think_word` VALUES ('3', '1', 'find', '1', '2019-05-25 13:01:50', '2019-05-25 13:01:50');
INSERT INTO `think_word` VALUES ('4', '1', 'at', '1', '2019-05-25 13:01:57', '2019-05-25 21:08:18');
INSERT INTO `think_word` VALUES ('5', '1', 'is', '1', '2019-05-25 13:02:01', '2019-05-25 13:02:01');
INSERT INTO `think_word` VALUES ('6', '1', 'in', '1', '2019-05-25 13:02:05', '2019-05-25 13:02:05');
INSERT INTO `think_word` VALUES ('7', '1', 'are', '1', '2019-05-25 13:02:10', '2019-05-25 13:02:10');
INSERT INTO `think_word` VALUES ('8', '1', 'not', '1', '2019-05-25 13:02:15', '2019-05-25 13:02:15');
INSERT INTO `think_word` VALUES ('9', '1', 'china', '1', '2019-05-25 13:12:10', '2019-05-25 13:12:10');
INSERT INTO `think_word` VALUES ('10', '1', 'us', '1', '2019-05-25 13:12:14', '2019-05-25 21:46:46');
INSERT INTO `think_word` VALUES ('11', '1', 'of', '1', '2019-05-25 13:12:18', '2019-05-25 21:00:44');
INSERT INTO `think_word` VALUES ('12', '1', 'a', '1', '2019-05-25 21:00:46', '2019-05-25 21:00:46');
INSERT INTO `think_word` VALUES ('13', '1', 'global', '1', '2019-05-25 21:00:47', '2019-05-25 21:00:47');
INSERT INTO `think_word` VALUES ('14', '1', 'tussle', '0', '2019-05-25 21:00:49', '2019-05-25 21:48:25');
INSERT INTO `think_word` VALUES ('15', '1', 'between', '1', '2019-05-25 21:00:49', '2019-05-25 21:00:49');
INSERT INTO `think_word` VALUES ('16', '1', 'the', '1', '2019-05-25 21:00:50', '2019-05-25 21:06:43');
INSERT INTO `think_word` VALUES ('17', '1', 'led', '1', '2019-05-25 21:00:51', '2019-05-25 21:00:51');
INSERT INTO `think_word` VALUES ('18', '1', 'it.\n\nthat', '1', '2019-05-25 21:00:51', '2019-05-25 21:00:51');
INSERT INTO `think_word` VALUES ('19', '1', 'brand', '0', '2019-05-25 21:00:52', '2019-05-25 21:48:34');
INSERT INTO `think_word` VALUES ('20', '1', 'with', '1', '2019-05-25 21:00:53', '2019-05-25 21:00:53');
INSERT INTO `think_word` VALUES ('21', '1', 'huawei', '1', '2019-05-25 21:08:01', '2019-05-25 21:08:11');
INSERT INTO `think_word` VALUES ('22', '1', 'itself', '1', '2019-05-25 21:08:46', '2019-05-25 21:08:46');
INSERT INTO `think_word` VALUES ('23', '1', 'center', '1', '2019-05-25 21:08:47', '2019-05-25 21:08:47');
INSERT INTO `think_word` VALUES ('24', '1', 'and', '1', '2019-05-25 21:08:49', '2019-05-25 21:08:49');
INSERT INTO `think_word` VALUES ('25', '1', 'after', '1', '2019-05-25 21:08:49', '2019-05-25 21:08:49');
INSERT INTO `think_word` VALUES ('26', '1', 'administration', '1', '2019-05-25 21:08:51', '2019-05-25 21:08:51');
INSERT INTO `think_word` VALUES ('27', '1', 'trump\'s', '1', '2019-05-25 21:08:52', '2019-05-25 21:08:52');
INSERT INTO `think_word` VALUES ('28', '1', 'placed', '1', '2019-05-25 21:08:53', '2019-05-25 21:08:53');
INSERT INTO `think_word` VALUES ('29', '1', 'on', '1', '2019-05-25 21:08:55', '2019-05-25 21:08:55');
INSERT INTO `think_word` VALUES ('30', '1', 'do', '1', '2019-05-25 21:08:58', '2019-05-25 21:08:58');
INSERT INTO `think_word` VALUES ('31', '1', 'could', '1', '2019-05-25 21:08:58', '2019-05-25 21:08:58');
INSERT INTO `think_word` VALUES ('32', '1', 'business', '1', '2019-05-25 21:08:59', '2019-05-25 21:46:43');
INSERT INTO `think_word` VALUES ('33', '1', 'limiting', '1', '2019-05-25 21:09:01', '2019-05-25 21:09:01');
INSERT INTO `think_word` VALUES ('34', '1', 'to', '1', '2019-05-25 21:09:02', '2019-05-25 21:11:27');
INSERT INTO `think_word` VALUES ('35', '1', 'google', '1', '2019-05-25 21:09:03', '2019-05-25 21:09:03');
INSERT INTO `think_word` VALUES ('36', '1', 'future', '1', '2019-05-25 21:09:05', '2019-05-25 21:09:05');
INSERT INTO `think_word` VALUES ('37', '1', 'access', '1', '2019-05-25 21:09:06', '2019-05-25 21:09:06');
INSERT INTO `think_word` VALUES ('38', '1', 'updates,', '1', '2019-05-25 21:09:11', '2019-05-25 21:09:11');
INSERT INTO `think_word` VALUES ('39', '1', 'all', '1', '2019-05-25 21:09:15', '2019-05-25 21:09:15');
INSERT INTO `think_word` VALUES ('40', '1', 'activities', '1', '2019-05-25 21:09:16', '2019-05-25 21:09:16');
INSERT INTO `think_word` VALUES ('41', '1', 'multiple', '1', '2019-05-25 21:09:21', '2019-05-25 21:09:21');
INSERT INTO `think_word` VALUES ('42', '1', 'retailers', '0', '2019-05-25 21:09:23', '2019-05-25 21:48:44');
INSERT INTO `think_word` VALUES ('43', '1', 'world', '1', '2019-05-25 21:09:37', '2019-05-25 21:09:37');
INSERT INTO `think_word` VALUES ('44', '1', 'it', '1', '2019-05-25 21:09:41', '2019-05-25 21:09:41');
INSERT INTO `think_word` VALUES ('45', '1', 'for', '1', '2019-05-25 21:09:42', '2019-05-25 21:09:42');
INSERT INTO `think_word` VALUES ('46', '1', 'fear', '1', '2019-05-25 21:09:43', '2019-05-25 21:09:43');
INSERT INTO `think_word` VALUES ('47', '1', 'dealing', '1', '2019-05-25 21:09:44', '2019-05-25 21:09:44');
INSERT INTO `think_word` VALUES ('48', '1', 'stop', '1', '2019-05-25 21:09:45', '2019-05-25 21:09:45');
INSERT INTO `think_word` VALUES ('49', '1', 'around', '1', '2019-05-25 21:09:46', '2019-05-25 21:09:46');
INSERT INTO `think_word` VALUES ('50', '1', 'government.', '1', '2019-05-25 21:12:31', '2019-05-25 21:48:06');
INSERT INTO `think_word` VALUES ('51', '1', 'brands', '0', '2019-05-25 21:16:25', '2019-05-25 21:48:19');
INSERT INTO `think_word` VALUES ('52', '1', 'ceased', '0', '2019-05-25 21:24:33', '2019-05-25 21:48:22');
INSERT INTO `think_word` VALUES ('53', '1', 'from', '1', '2019-05-25 21:24:51', '2019-05-25 21:24:51');
INSERT INTO `think_word` VALUES ('54', '1', 'easy', '1', '2019-05-25 21:25:30', '2019-05-25 21:25:30');
INSERT INTO `think_word` VALUES ('55', '1', 'exclusive', '1', '2019-05-25 21:25:31', '2019-05-25 21:25:31');
INSERT INTO `think_word` VALUES ('56', '1', 'checkout.', '1', '2019-05-25 21:25:32', '2019-05-25 21:25:32');
INSERT INTO `think_word` VALUES ('57', '1', 'up', '1', '2019-05-25 21:25:34', '2019-05-25 21:25:34');
INSERT INTO `think_word` VALUES ('58', '1', 'designer', '1', '2019-05-25 21:25:35', '2019-05-25 21:25:35');
INSERT INTO `think_word` VALUES ('59', '1', 'selection', '1', '2019-05-25 21:25:37', '2019-05-25 21:25:37');
INSERT INTO `think_word` VALUES ('60', '1', 'shop', '1', '2019-05-25 21:25:38', '2019-05-25 21:25:38');
INSERT INTO `think_word` VALUES ('61', '1', 'than', '1', '2019-05-25 21:25:39', '2019-05-25 21:25:39');
INSERT INTO `think_word` VALUES ('62', '1', 'more', '1', '2019-05-25 21:25:39', '2019-05-25 21:25:39');
INSERT INTO `think_word` VALUES ('63', '1', 'designers.', '1', '2019-05-25 21:25:41', '2019-05-25 21:25:41');
INSERT INTO `think_word` VALUES ('64', '1', 'fast', '1', '2019-05-25 21:25:42', '2019-05-25 21:25:42');
INSERT INTO `think_word` VALUES ('65', '1', 'shipping.', '1', '2019-05-25 21:25:43', '2019-05-25 21:25:43');
INSERT INTO `think_word` VALUES ('66', '1', 'styles:', '1', '2019-05-25 21:25:44', '2019-05-25 21:25:44');
INSERT INTO `think_word` VALUES ('67', '1', 'runway', '1', '2019-05-25 21:25:46', '2019-05-25 21:25:46');
INSERT INTO `think_word` VALUES ('68', '1', 'refined.', '1', '2019-05-25 21:25:47', '2019-05-25 21:25:47');
INSERT INTO `think_word` VALUES ('69', '1', 'off.', '1', '2019-05-25 21:26:25', '2019-05-25 21:26:25');
INSERT INTO `think_word` VALUES ('70', '1', 'secure', '1', '2019-05-25 21:26:27', '2019-05-25 21:26:27');
INSERT INTO `think_word` VALUES ('71', '1', 'streetwear,', '1', '2019-05-25 21:26:31', '2019-05-25 21:26:31');
INSERT INTO `think_word` VALUES ('72', '1', 'designers,', '1', '2019-05-25 21:26:33', '2019-05-25 21:26:33');
INSERT INTO `think_word` VALUES ('73', '1', 'streetwear.', '1', '2019-05-25 21:26:36', '2019-05-25 21:26:36');
INSERT INTO `think_word` VALUES ('74', '1', 'fashion', '1', '2019-05-25 21:26:46', '2019-05-25 21:26:46');
INSERT INTO `think_word` VALUES ('75', '1', 'be', '1', '2019-05-25 21:27:11', '2019-05-25 21:27:11');
INSERT INTO `think_word` VALUES ('76', '1', 'art,', '1', '2019-05-25 21:27:13', '2019-05-25 21:27:13');
INSERT INTO `think_word` VALUES ('77', '1', 'also', '1', '2019-05-25 21:27:17', '2019-05-25 21:27:17');
INSERT INTO `think_word` VALUES ('78', '1', 'music', '1', '2019-05-25 21:27:21', '2019-05-25 21:27:21');
INSERT INTO `think_word` VALUES ('79', '1', 'outside', '1', '2019-05-25 21:28:12', '2019-05-25 21:28:12');
INSERT INTO `think_word` VALUES ('80', '1', 'as', '1', '2019-05-25 21:28:14', '2019-05-25 21:28:14');
INSERT INTO `think_word` VALUES ('81', '1', 'arm', '1', '2019-05-25 21:47:43', '2019-05-25 21:48:07');
INSERT INTO `think_word` VALUES ('82', '1', 'networks', '1', '2019-05-25 21:47:46', '2019-05-25 21:48:02');
INSERT INTO `think_word` VALUES ('83', '1', '‘entity', '1', '2019-05-25 21:47:51', '2019-05-25 21:48:11');
INSERT INTO `think_word` VALUES ('84', '1', 'android', '1', '2019-05-25 21:47:59', '2019-05-25 21:47:59');
INSERT INTO `think_word` VALUES ('85', '1', 'sanctions', '0', '2019-05-25 21:48:03', '2019-05-25 21:48:38');
INSERT INTO `think_word` VALUES ('86', '1', 'blocking', '1', '2019-05-25 21:48:09', '2019-05-25 21:48:09');
INSERT INTO `think_word` VALUES ('87', '1', 'huawei’s', '1', '2019-05-25 21:48:10', '2019-05-25 21:48:10');
INSERT INTO `think_word` VALUES ('88', '1', 'list’,', '1', '2019-05-25 21:48:12', '2019-05-25 21:48:12');
INSERT INTO `think_word` VALUES ('89', '1', 'chip', '1', '2019-05-25 21:48:13', '2019-05-25 21:48:13');
INSERT INTO `think_word` VALUES ('90', '1', 'uk-based', '0', '2019-05-25 21:48:13', '2019-05-25 21:48:15');
INSERT INTO `think_word` VALUES ('91', '1', 'compete', '1', '2019-05-25 21:49:47', '2019-05-25 21:49:47');
INSERT INTO `think_word` VALUES ('92', '1', 'play', '1', '2019-05-25 21:49:48', '2019-05-25 21:49:48');
INSERT INTO `think_word` VALUES ('93', '1', 'an', '1', '2019-05-25 21:49:50', '2019-05-25 21:49:50');
INSERT INTO `think_word` VALUES ('94', '1', 'team,', '1', '2019-05-25 21:49:51', '2019-05-25 21:49:51');
INSERT INTO `think_word` VALUES ('95', '1', 'was', '1', '2019-05-25 21:49:55', '2019-05-25 21:49:55');
INSERT INTO `think_word` VALUES ('96', '1', 'team', '1', '2019-05-25 21:49:56', '2019-05-25 21:49:56');
INSERT INTO `think_word` VALUES ('97', '1', 'basketball', '1', '2019-05-25 21:49:58', '2019-05-25 21:49:58');
INSERT INTO `think_word` VALUES ('98', '1', 'professional', '1', '2019-05-25 21:50:00', '2019-05-25 21:50:00');
INSERT INTO `think_word` VALUES ('99', '1', 'american', '1', '2019-05-25 21:50:00', '2019-05-25 21:50:00');
INSERT INTO `think_word` VALUES ('100', '1', 'member', '1', '2019-05-25 21:50:03', '2019-05-25 21:50:03');
