/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50171
Source Host           : localhost:3306
Source Database       : linshi

Target Server Type    : MYSQL
Target Server Version : 50171
File Encoding         : 65001

Date: 2017-10-01 00:31:57
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `yl_admin`
-- ----------------------------
DROP TABLE IF EXISTS `yl_admin`;
CREATE TABLE `yl_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL,
  `add_time` int(11) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`password`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='管理员帐号表';

-- ----------------------------
-- Records of yl_admin
-- ----------------------------
INSERT INTO `yl_admin` VALUES ('2', 'admin', 'd0364eb0d22c59b02bc6c5466064a355', '1458801772', '1506789054', '1', '1');

-- ----------------------------
-- Table structure for `yl_adv`
-- ----------------------------
DROP TABLE IF EXISTS `yl_adv`;
CREATE TABLE `yl_adv` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告ID',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '广告名称',
  `content` text COLLATE utf8_bin NOT NULL COMMENT '广告内容（JS代码）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='广告表';

-- ----------------------------
-- Records of yl_adv
-- ----------------------------
INSERT INTO `yl_adv` VALUES ('1', 'pc_duilian', 0x266C743B7363726970742667743B2F2FE794B5E88491E7ABAFE5AFB9E88194E5B9BFE5918AE4BBA3E7A081266C743B2F7363726970742667743B);
INSERT INTO `yl_adv` VALUES ('2', 'pc_fumeiti', 0x266C743B7363726970742667743B2F2FE794B5E88491E7ABAFE5AF8CE5AA92E4BD93E5B9BFE5918AE4BBA3E7A081266C743B2F7363726970742667743B);
INSERT INTO `yl_adv` VALUES ('3', 'm_chaping', 0x266C743B7363726970742667743B2F2FE6898BE69CBAE7ABAFE68F92E5B18F266C743B2F7363726970742667743B);
INSERT INTO `yl_adv` VALUES ('4', 'm_top', 0x266C743B7363726970742667743B2F2FE6898BE69CBAE7ABAFE9A1B6E983A8E6A8AAE69DA1266C743B2F7363726970742667743B);
INSERT INTO `yl_adv` VALUES ('5', 'm_bottom', 0x266C743B7363726970742667743B2F2FE6898BE69CBAE7ABAFE5BA95E983A8E6A8AAE69DA1266C743B2F7363726970742667743B);

-- ----------------------------
-- Table structure for `yl_article`
-- ----------------------------
DROP TABLE IF EXISTS `yl_article`;
CREATE TABLE `yl_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `img` varchar(255) COLLATE utf8_bin NOT NULL,
  `abst` varchar(255) COLLATE utf8_bin NOT NULL,
  `info` mediumtext COLLATE utf8_bin NOT NULL,
  `created_time` int(11) NOT NULL DEFAULT '0',
  `list_sort` tinyint(4) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-待审核 1-已审核',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_focus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是焦点',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是热点',
  `is_commend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `seo_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `seo_keys` varchar(255) COLLATE utf8_bin NOT NULL,
  `seo_desc` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `add_time` (`created_time`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章';

-- ----------------------------
-- Records of yl_article
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_articlecate`
-- ----------------------------
DROP TABLE IF EXISTS `yl_articlecate`;
CREATE TABLE `yl_articlecate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `alias` varchar(50) COLLATE utf8_bin NOT NULL,
  `pid` int(11) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `article_nums` int(11) unsigned NOT NULL,
  `list_sort` smallint(4) unsigned NOT NULL,
  `seo_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `seo_keys` varchar(255) COLLATE utf8_bin NOT NULL,
  `seo_desc` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章分类';

-- ----------------------------
-- Records of yl_articlecate
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_comments`
-- ----------------------------
DROP TABLE IF EXISTS `yl_comments`;
CREATE TABLE `yl_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `article_id` int(11) NOT NULL COMMENT '评论文章ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '昵称',
  `email` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '邮箱',
  `content` text COLLATE utf8_bin NOT NULL COMMENT '评论内容',
  `created_time` int(11) NOT NULL COMMENT '评论时间',
  `comment_id` int(11) NOT NULL COMMENT '回复评论ID',
  `status` tinyint(1) NOT NULL COMMENT '状态（0：未显示，1：正常）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评论表';

-- ----------------------------
-- Records of yl_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `yl_feedback`;
CREATE TABLE `yl_feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contact` varchar(50) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '提交时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已处理 0:未处理，1：已处理',
  PRIMARY KEY (`id`),
  KEY `contact` (`contact`),
  KEY `created_time` (`created_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='反馈信息';

-- ----------------------------
-- Records of yl_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_flink`
-- ----------------------------
DROP TABLE IF EXISTS `yl_flink`;
CREATE TABLE `yl_flink` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) NOT NULL DEFAULT '1',
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `ordid` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of yl_flink
-- ----------------------------
INSERT INTO `yl_flink` VALUES ('1', '1', '', '搞笑笔记网', 'http://www.gaoxiaobiji.com', '0', '0');

-- ----------------------------
-- Table structure for `yl_flink_cate`
-- ----------------------------
DROP TABLE IF EXISTS `yl_flink_cate`;
CREATE TABLE `yl_flink_cate` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='友情链接分类';

-- ----------------------------
-- Records of yl_flink_cate
-- ----------------------------
INSERT INTO `yl_flink_cate` VALUES ('1', '友情链接');
INSERT INTO `yl_flink_cate` VALUES ('2', '合作伙伴');

-- ----------------------------
-- Table structure for `yl_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `yl_guestbook`;
CREATE TABLE `yl_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言表ID',
  `nickname` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '昵称',
  `email` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '邮件',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `content` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '留言内容',
  `created_time` int(11) NOT NULL COMMENT '留言时间（时间戳）',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：未处理，1：已处理）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='留言表';

-- ----------------------------
-- Records of yl_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_level`
-- ----------------------------
DROP TABLE IF EXISTS `yl_level`;
CREATE TABLE `yl_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `send_num` int(11) NOT NULL,
  `award` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='等级固话表';

-- ----------------------------
-- Records of yl_level
-- ----------------------------
INSERT INTO `yl_level` VALUES ('1', '1', '1', '3', '30');
INSERT INTO `yl_level` VALUES ('2', '2', '45', '3', '30');
INSERT INTO `yl_level` VALUES ('3', '3', '95', '3', '30');
INSERT INTO `yl_level` VALUES ('4', '4', '150', '3', '30');
INSERT INTO `yl_level` VALUES ('5', '5', '210', '3', '30');
INSERT INTO `yl_level` VALUES ('6', '6', '275', '3', '30');
INSERT INTO `yl_level` VALUES ('7', '7', '345', '3', '30');
INSERT INTO `yl_level` VALUES ('8', '8', '420', '3', '30');
INSERT INTO `yl_level` VALUES ('9', '9', '500', '3', '30');
INSERT INTO `yl_level` VALUES ('10', '10', '590', '5', '50');
INSERT INTO `yl_level` VALUES ('11', '11', '690', '5', '50');
INSERT INTO `yl_level` VALUES ('12', '12', '800', '5', '50');
INSERT INTO `yl_level` VALUES ('13', '13', '920', '5', '50');
INSERT INTO `yl_level` VALUES ('14', '14', '1050', '5', '50');
INSERT INTO `yl_level` VALUES ('15', '15', '1190', '5', '50');
INSERT INTO `yl_level` VALUES ('16', '16', '1340', '5', '50');
INSERT INTO `yl_level` VALUES ('17', '17', '1500', '5', '50');
INSERT INTO `yl_level` VALUES ('18', '18', '1670', '5', '50');
INSERT INTO `yl_level` VALUES ('19', '19', '1850', '5', '50');
INSERT INTO `yl_level` VALUES ('20', '20', '2045', '5', '80');
INSERT INTO `yl_level` VALUES ('21', '21', '2255', '5', '80');
INSERT INTO `yl_level` VALUES ('22', '22', '2480', '5', '80');
INSERT INTO `yl_level` VALUES ('23', '23', '2720', '5', '80');
INSERT INTO `yl_level` VALUES ('24', '24', '2975', '5', '80');
INSERT INTO `yl_level` VALUES ('25', '25', '3250', '5', '80');
INSERT INTO `yl_level` VALUES ('26', '26', '3545', '5', '80');
INSERT INTO `yl_level` VALUES ('27', '27', '3860', '5', '80');
INSERT INTO `yl_level` VALUES ('28', '28', '4200', '5', '80');
INSERT INTO `yl_level` VALUES ('29', '29', '4565', '5', '80');
INSERT INTO `yl_level` VALUES ('30', '30', '4955', '10', '120');
INSERT INTO `yl_level` VALUES ('31', '31', '5375', '10', '120');
INSERT INTO `yl_level` VALUES ('32', '32', '5825', '10', '120');
INSERT INTO `yl_level` VALUES ('33', '33', '6305', '10', '120');
INSERT INTO `yl_level` VALUES ('34', '34', '6815', '10', '120');
INSERT INTO `yl_level` VALUES ('35', '35', '7365', '10', '120');
INSERT INTO `yl_level` VALUES ('36', '36', '7955', '10', '120');
INSERT INTO `yl_level` VALUES ('37', '37', '8590', '10', '120');
INSERT INTO `yl_level` VALUES ('38', '38', '9270', '10', '120');
INSERT INTO `yl_level` VALUES ('39', '39', '10005', '10', '120');
INSERT INTO `yl_level` VALUES ('40', '40', '10800', '10', '180');
INSERT INTO `yl_level` VALUES ('41', '41', '11645', '10', '180');
INSERT INTO `yl_level` VALUES ('42', '42', '12545', '10', '180');
INSERT INTO `yl_level` VALUES ('43', '43', '13505', '10', '180');
INSERT INTO `yl_level` VALUES ('44', '44', '14525', '10', '180');
INSERT INTO `yl_level` VALUES ('45', '45', '15605', '10', '180');
INSERT INTO `yl_level` VALUES ('46', '46', '16755', '10', '180');
INSERT INTO `yl_level` VALUES ('47', '47', '17980', '10', '180');
INSERT INTO `yl_level` VALUES ('48', '48', '19290', '10', '180');
INSERT INTO `yl_level` VALUES ('49', '49', '20690', '10', '180');
INSERT INTO `yl_level` VALUES ('50', '50', '22190', '10', '260');
INSERT INTO `yl_level` VALUES ('51', '51', '23810', '10', '260');
INSERT INTO `yl_level` VALUES ('52', '52', '25560', '10', '260');
INSERT INTO `yl_level` VALUES ('53', '53', '27450', '10', '260');
INSERT INTO `yl_level` VALUES ('54', '54', '29500', '10', '260');
INSERT INTO `yl_level` VALUES ('55', '55', '31710', '10', '260');
INSERT INTO `yl_level` VALUES ('56', '56', '34080', '10', '260');
INSERT INTO `yl_level` VALUES ('57', '57', '36610', '10', '260');
INSERT INTO `yl_level` VALUES ('58', '58', '39310', '10', '260');
INSERT INTO `yl_level` VALUES ('59', '59', '42180', '10', '260');
INSERT INTO `yl_level` VALUES ('60', '60', '45220', '10', '360');
INSERT INTO `yl_level` VALUES ('61', '61', '48440', '10', '360');
INSERT INTO `yl_level` VALUES ('62', '62', '51840', '10', '360');
INSERT INTO `yl_level` VALUES ('63', '63', '55420', '10', '360');
INSERT INTO `yl_level` VALUES ('64', '64', '59180', '10', '360');
INSERT INTO `yl_level` VALUES ('65', '65', '63120', '10', '360');
INSERT INTO `yl_level` VALUES ('66', '66', '67240', '10', '360');
INSERT INTO `yl_level` VALUES ('67', '67', '71540', '10', '360');
INSERT INTO `yl_level` VALUES ('68', '68', '76030', '10', '360');
INSERT INTO `yl_level` VALUES ('69', '69', '80710', '10', '360');
INSERT INTO `yl_level` VALUES ('70', '70', '85580', '10', '480');
INSERT INTO `yl_level` VALUES ('71', '71', '90640', '10', '480');
INSERT INTO `yl_level` VALUES ('72', '72', '95890', '10', '480');
INSERT INTO `yl_level` VALUES ('73', '73', '101340', '10', '480');
INSERT INTO `yl_level` VALUES ('74', '74', '106990', '10', '480');
INSERT INTO `yl_level` VALUES ('75', '75', '112840', '10', '480');
INSERT INTO `yl_level` VALUES ('76', '76', '118890', '10', '480');
INSERT INTO `yl_level` VALUES ('77', '77', '125150', '10', '480');
INSERT INTO `yl_level` VALUES ('78', '78', '131620', '10', '480');
INSERT INTO `yl_level` VALUES ('79', '79', '138300', '10', '480');
INSERT INTO `yl_level` VALUES ('80', '80', '145200', '15', '640');
INSERT INTO `yl_level` VALUES ('81', '81', '152320', '15', '640');
INSERT INTO `yl_level` VALUES ('82', '82', '159660', '15', '640');
INSERT INTO `yl_level` VALUES ('83', '83', '167220', '15', '640');
INSERT INTO `yl_level` VALUES ('84', '84', '175010', '15', '640');
INSERT INTO `yl_level` VALUES ('85', '85', '183030', '15', '640');
INSERT INTO `yl_level` VALUES ('86', '86', '191280', '15', '640');
INSERT INTO `yl_level` VALUES ('87', '87', '199760', '15', '640');
INSERT INTO `yl_level` VALUES ('88', '88', '208470', '15', '640');
INSERT INTO `yl_level` VALUES ('89', '89', '217420', '15', '640');
INSERT INTO `yl_level` VALUES ('90', '90', '226620', '15', '1000');
INSERT INTO `yl_level` VALUES ('91', '91', '236120', '15', '1000');
INSERT INTO `yl_level` VALUES ('92', '92', '245920', '15', '1000');
INSERT INTO `yl_level` VALUES ('93', '93', '256920', '15', '1000');
INSERT INTO `yl_level` VALUES ('94', '94', '269520', '15', '1000');
INSERT INTO `yl_level` VALUES ('95', '95', '284720', '15', '1000');
INSERT INTO `yl_level` VALUES ('96', '96', '304120', '15', '1000');
INSERT INTO `yl_level` VALUES ('97', '97', '332120', '15', '1000');
INSERT INTO `yl_level` VALUES ('98', '98', '371320', '15', '1000');
INSERT INTO `yl_level` VALUES ('99', '99', '422320', '15', '1000');

-- ----------------------------
-- Table structure for `yl_nav`
-- ----------------------------
DROP TABLE IF EXISTS `yl_nav`;
CREATE TABLE `yl_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `alias` varchar(50) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `list_sort` smallint(4) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '导航位置1-顶部 2-底部',
  `target` varchar(10) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `is_show` (`status`),
  KEY `type` (`type`),
  KEY `sort_order` (`list_sort`),
  KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='前台导航表';

-- ----------------------------
-- Records of yl_nav
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_nav_copy`
-- ----------------------------
DROP TABLE IF EXISTS `yl_nav_copy`;
CREATE TABLE `yl_nav_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `alias` varchar(50) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `list_sort` smallint(4) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '导航位置1-顶部 2-底部',
  `target` varchar(10) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `is_show` (`status`),
  KEY `type` (`type`),
  KEY `sort_order` (`list_sort`),
  KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='前台导航表';

-- ----------------------------
-- Records of yl_nav_copy
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_role`
-- ----------------------------
DROP TABLE IF EXISTS `yl_role`;
CREATE TABLE `yl_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `node_ids` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `created_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色权限';

-- ----------------------------
-- Records of yl_role
-- ----------------------------
INSERT INTO `yl_role` VALUES ('1', '超级管理员', null, '所有权限开放', '100,101,1011,1012,1013,1014,1015,1016,102,1024,1025,103,1026,1027,1028,104,1029,1030,200,201,202,2011,2012,2013,203,2011,2012,2013,2013,204,205,300,301,302,303,400,401,402,403,404,405,407,500,501,502,503,600,601', '1458027725');
INSERT INTO `yl_role` VALUES ('2', '普通管理员', null, '限定模块', '100,101,1011,1012,1013,1014,1015,1016,102,1024,1025,103,1026,1027,1028,104,1029,1030,200,201,202,2011,2012,2013,203,2011,2012,2013,2013,204,205,300,301,302,303,400,401,402,403,404,405,407,500,501,502,503,600,601', '1462612334');

-- ----------------------------
-- Table structure for `yl_senstive`
-- ----------------------------
DROP TABLE IF EXISTS `yl_senstive`;
CREATE TABLE `yl_senstive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senstive_word` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '敏感词',
  `replace_word` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '替换词',
  `level` tinyint(1) NOT NULL COMMENT '等级',
  `created_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='敏感词表';

-- ----------------------------
-- Records of yl_senstive
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_seo`
-- ----------------------------
DROP TABLE IF EXISTS `yl_seo`;
CREATE TABLE `yl_seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `keywords` varchar(500) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='关键字';

-- ----------------------------
-- Records of yl_seo
-- ----------------------------
INSERT INTO `yl_seo` VALUES ('1', '最新笑话', 'index', '笑话大全_恶搞囧事', '笑话,gif动态图片,搞笑段子,糗事百科,恶搞图片', '搞笑笔记笑话网，与千万囧徒一起分享最新最热的爆笑笑话、搞笑图片、gif动态图、冷笑话、糗事笑话、成人笑话、经典笑话、内涵段子、囧事等笑话大全。');
INSERT INTO `yl_seo` VALUES ('2', '热门笑话', 'hotjoke', '热门文字笑话_经典文字笑话_最受欢迎的文字笑话', '热门文字笑话,经典文字笑话,最受欢迎的文字笑话', '搞笑笔记文字笑话频道提供最新、最全的文字笑话、经典文字笑话，并按搞笑笔记好评展现，快乐每一天！');
INSERT INTO `yl_seo` VALUES ('3', '笑点', 'tags', '笑点_笑点集合_搞笑标签', '笑点,笑点集合,搞笑标签', '笑点是指一个笑话之所以好笑的关键；这里列出了搞笑笔记的所有笑点，方便网友快速找到感兴趣的笑话！');
INSERT INTO `yl_seo` VALUES ('4', '神回复', 'godreply', '神回复_搞笑笔记神回复_神回复笑话', '神回复,搞笑笔记神回复,神回复笑话', '搞笑笔记文字笑话频道提供最新、最全的文字笑话、经典文字笑话，并按搞笑笔记好评展现，快乐每一天！');
INSERT INTO `yl_seo` VALUES ('5', '积分商城', 'shop', '积分商城', '积分商城', '积分商城');
INSERT INTO `yl_seo` VALUES ('6', '文字', 'text', '最新段子_搞笑段子_幽默段子', '最新段子,搞笑段子,幽默段子', '搞笑笔记网提供2016年最新段子,搞笑段子,幽默段子等搞笑全集。');
INSERT INTO `yl_seo` VALUES ('7', '趣图', 'pic', '最新趣图_内涵图_搞笑图片', '最新趣图,内涵图,搞笑图片', '搞笑笔记网提供2016年最新趣图,内涵图,搞笑图片等幽默全集。');
INSERT INTO `yl_seo` VALUES ('8', '动图', 'gif', '最新搞笑GIF_爆笑GIF_幽默动图', '最新搞笑GIF,爆笑GIF,幽默动图', '搞笑笔记网提供2016年最新搞笑GIF,爆笑GIF,幽默动图等搞笑全集。');
INSERT INTO `yl_seo` VALUES ('9', '8小时热门', 'hot', '8小时热门', '8小时热门', '8小时热门');
INSERT INTO `yl_seo` VALUES ('10', '7天热门', 'week', '7天热门', '7天热门', '7天热门');
INSERT INTO `yl_seo` VALUES ('11', '30天热门', 'month', '30天热门', '30天热门', '30天热门');
INSERT INTO `yl_seo` VALUES ('12', '视频', 'video', '最新搞笑视频_幽默视频_爆笑视频', '最新搞笑视频,幽默视频,爆笑视频', '搞笑笔记网提供2016年最新搞笑视频,幽默视频,爆笑视频等搞笑全集。');
INSERT INTO `yl_seo` VALUES ('13', '小说', 'xiaoshuo', '小说', '小说', '小说');

-- ----------------------------
-- Table structure for `yl_setting`
-- ----------------------------
DROP TABLE IF EXISTS `yl_setting`;
CREATE TABLE `yl_setting` (
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '表单字段名称',
  `data` text COLLATE utf8_bin COMMENT '表单字段数据',
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='常规设置表';

-- ----------------------------
-- Records of yl_setting
-- ----------------------------
INSERT INTO `yl_setting` VALUES ('site_status', 0x30);
INSERT INTO `yl_setting` VALUES ('site_colse_desc', 0xE7BD91E7AB99E7BBB4E68AA4E4B8ADEFBC8CE8AFB7E7A88DE5908EE8AEBFE997AEEFBC81);
INSERT INTO `yl_setting` VALUES ('site_name', 0xE6909EE7AC91E7AC94E8AEB0E7BD91);
INSERT INTO `yl_setting` VALUES ('site_icp', 0xE79A96494350E5A4873133303133313931E58FB7);
INSERT INTO `yl_setting` VALUES ('site_domain', 0x687474703A2F2F7777772E67616F7869616F62696A692E636F6D);
INSERT INTO `yl_setting` VALUES ('site_email', 0x61646D696E4071712E636F6D);
INSERT INTO `yl_setting` VALUES ('site_keyword', 0xE7BD91E7AB99E585B3E994AEE5AD97E7BD91E7AB99E585B3E994AEE5AD97);
INSERT INTO `yl_setting` VALUES ('site_desc', 0xE7BD91E7AB99E68F8FE8BFB0);
INSERT INTO `yl_setting` VALUES ('site_tongji_code', 0x266C743B736372697074207372633D2671756F743B687474703A2F2F73342E636E7A7A2E636F6D2F737461742E7068703F69643D3132353633373430303826616D703B7765625F69643D313235363337343030382671756F743B206C616E67756167653D2671756F743B4A6176615363726970742671756F743B2667743B266C743B2F7363726970742667743B);
INSERT INTO `yl_setting` VALUES ('site_copyright', 0x436F7079726967687420323031352D32303136207869616A696F6E672E636F6D20E78988E69D83E68980E69C89);
INSERT INTO `yl_setting` VALUES ('url_model', 0x32);
INSERT INTO `yl_setting` VALUES ('url_houzhui', 0x68746D6C);
INSERT INTO `yl_setting` VALUES ('attach_pic_type', 0x6A70672C706E672C676966);
INSERT INTO `yl_setting` VALUES ('attach_video_type', 0x7377662C6D70672C666C762C6D70342C4D4F56);
INSERT INTO `yl_setting` VALUES ('attach_file_type', 0x7A69702C7261722C646F632C786C732C706466);
INSERT INTO `yl_setting` VALUES ('attach_limit_size', 0x32303438303030303030);
INSERT INTO `yl_setting` VALUES ('attach_save_type', 0x64);
INSERT INTO `yl_setting` VALUES ('attach_filename_type', 0x592F64);
INSERT INTO `yl_setting` VALUES ('attach_full_url', 0x687474703A2F2F7777772E67616F7869616F62696A692E636F6D2F);
INSERT INTO `yl_setting` VALUES ('file_save_type', 0x31);
INSERT INTO `yl_setting` VALUES ('qiniu_access_key', 0x7A4D44575847704B477548554433526E564568354C512D4B45303067374B6E395671733932395970);
INSERT INTO `yl_setting` VALUES ('qiniu_secret_key', 0x54724C6E574D38752D76794354303851336449376D316B676F792D2D5253514D3144567950504665);
INSERT INTO `yl_setting` VALUES ('qiniu_domain', 0x687474703A2F2F7777772E67616F7869616F62696A692E636F6D2F);
INSERT INTO `yl_setting` VALUES ('qiniu_name', 0x7469616E7469616E6C65);
INSERT INTO `yl_setting` VALUES ('mail_send_address', 0x35303034323734384071712E636F6D);
INSERT INTO `yl_setting` VALUES ('mail_model', 0x31);
INSERT INTO `yl_setting` VALUES ('mail_smtp', 0x736D74702E71712E636F6D);
INSERT INTO `yl_setting` VALUES ('mail_smtp_port', 0x3235);
INSERT INTO `yl_setting` VALUES ('mail_smtp_address', 0x35303034323734384071712E636F6D);
INSERT INTO `yl_setting` VALUES ('mail_smtp_password', 0x7277787870756D62767A);
INSERT INTO `yl_setting` VALUES ('sms_url', 0x617069);
INSERT INTO `yl_setting` VALUES ('sms_account', 0x6C796A);
INSERT INTO `yl_setting` VALUES ('sms_password', 0x313233343536);
INSERT INTO `yl_setting` VALUES ('qq_app_key', 0x616161);
INSERT INTO `yl_setting` VALUES ('qq_app_secret', 0x616161);
INSERT INTO `yl_setting` VALUES ('sina_app_key', 0x636363);
INSERT INTO `yl_setting` VALUES ('sina_app_secret', 0x636363);
INSERT INTO `yl_setting` VALUES ('water_status', 0x30);
INSERT INTO `yl_setting` VALUES ('water_type', 0x31);
INSERT INTO `yl_setting` VALUES ('water_font', 0x7969636D737373737373);
INSERT INTO `yl_setting` VALUES ('water_font_color', 0x23303030303030);
INSERT INTO `yl_setting` VALUES ('water_font_type', '');
INSERT INTO `yl_setting` VALUES ('water_font_size', 0x3132);
INSERT INTO `yl_setting` VALUES ('water_font_weight', 0x30);
INSERT INTO `yl_setting` VALUES ('water_img', 0x2F55706C6F6164732F77617465722F32303136303632312F353736393039623434643237642E706E67);
INSERT INTO `yl_setting` VALUES ('water_width', 0x313030);
INSERT INTO `yl_setting` VALUES ('water_height', 0x3230);
INSERT INTO `yl_setting` VALUES ('water_bg', 0x23303030303030);
INSERT INTO `yl_setting` VALUES ('water_quality', 0x313030);
INSERT INTO `yl_setting` VALUES ('water_pos', 0x39);
INSERT INTO `yl_setting` VALUES ('water_alpha', 0x3830);
INSERT INTO `yl_setting` VALUES ('alipay_account', 0x6872686D4065796F752E636F6D);
INSERT INTO `yl_setting` VALUES ('alipay_pid', 0x706964);
INSERT INTO `yl_setting` VALUES ('alipay_key', 0x6B6579);
INSERT INTO `yl_setting` VALUES ('bank_account', 0x6161);
INSERT INTO `yl_setting` VALUES ('bank_pid', 0x6161);
INSERT INTO `yl_setting` VALUES ('bank_key', 0x6161);
INSERT INTO `yl_setting` VALUES ('site_appkey', 0x4E316D36763476422D);
INSERT INTO `yl_setting` VALUES ('site_caiji', 0x7969636D73);
INSERT INTO `yl_setting` VALUES ('site_murl', 0x687474703A2F2F6D2E67616F7869616F62696A692E636F6D);
INSERT INTO `yl_setting` VALUES ('site_userid', 0x33352C3235);
INSERT INTO `yl_setting` VALUES ('qiniu_imgstyle', 0x2F7735);
INSERT INTO `yl_setting` VALUES ('water_font_path', 0x2E2F5075626C69632F666F6E742F73696D73756E2E747463);
INSERT INTO `yl_setting` VALUES ('water_font_pos', 0x31);
INSERT INTO `yl_setting` VALUES ('site_logo', 0x2F55706C6F6164732F6C6F676F2F32303136303731392F353738643866383839303134342E706E67);
INSERT INTO `yl_setting` VALUES ('mail_fromname', 0x7969636D73);
INSERT INTO `yl_setting` VALUES ('mqq_app_key', 0x626262);
INSERT INTO `yl_setting` VALUES ('mqq_app_secret', 0x626262);
INSERT INTO `yl_setting` VALUES ('msina_app_key', 0x6464);
INSERT INTO `yl_setting` VALUES ('msina_app_secret', 0x6464);
INSERT INTO `yl_setting` VALUES ('qq_code', 0x266C743B6D6574612070726F70657274793D2671756F743B71633A61646D696E732671756F743B20636F6E74656E743D2671756F743B3534343430303337373736363331363337352671756F743B202F2667743B);
INSERT INTO `yl_setting` VALUES ('mqq_code', 0x266C743B6D6574612070726F70657274793D2671756F743B71633A61646D696E732671756F743B20636F6E74656E743D2671756F743B3534343430303337373736363331363337352671756F743B202F2667743B);
INSERT INTO `yl_setting` VALUES ('sina_code', 0x266C743B6D6574612070726F70657274793D2671756F743B71633A61646D696E732671756F743B20636F6E74656E743D2671756F743B3534343430303337373736363331363337352671756F743B202F2667743B);
INSERT INTO `yl_setting` VALUES ('msina_code', 0x266C743B6D6574612070726F70657274793D2671756F743B71633A61646D696E732671756F743B20636F6E74656E743D2671756F743B3534343430303337373736363331363337352671756F743B202F2667743B);
INSERT INTO `yl_setting` VALUES ('site_qrcode', 0x2F55706C6F6164732F696D6167652F32303136303732392F353739623136323333346534612E706E67);

-- ----------------------------
-- Table structure for `yl_shop_cate`
-- ----------------------------
DROP TABLE IF EXISTS `yl_shop_cate`;
CREATE TABLE `yl_shop_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商城分类表';

-- ----------------------------
-- Records of yl_shop_cate
-- ----------------------------
INSERT INTO `yl_shop_cate` VALUES ('1', '虚拟', '1');
INSERT INTO `yl_shop_cate` VALUES ('2', '实物', '2');

-- ----------------------------
-- Table structure for `yl_shop_gift`
-- ----------------------------
DROP TABLE IF EXISTS `yl_shop_gift`;
CREATE TABLE `yl_shop_gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `image` varchar(150) NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `cate_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sell_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='商城商品表';

-- ----------------------------
-- Records of yl_shop_gift
-- ----------------------------
INSERT INTO `yl_shop_gift` VALUES ('22', '小米WiFi放大器', '/Uploads/gift/55fbe1958fb87.jpg', '39000', '<img src=\"/Uploads/image/20150919/20150919113416_46184.jpg\" width=\"650\" height=\"388\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113417_97279.jpg\" width=\"650\" height=\"281\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113418_18641.jpg\" width=\"650\" height=\"441\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113419_46601.jpg\" width=\"650\" height=\"366\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113420_53224.jpg\" width=\"650\" height=\"291\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113421_12575.jpg\" width=\"650\" height=\"304\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113423_91114.jpg\" width=\"650\" height=\"610\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113424_16992.jpg\" width=\"650\" height=\"593\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113425_63003.jpg\" width=\"650\" height=\"520\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113426_54991.jpg\" width=\"650\" height=\"245\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('23', '小米智能插座', '/Uploads/gift/55fbe1284995c.jpg', '59000', '<img src=\"/Uploads/image/20150919/20150919113026_21225.jpg\" width=\"650\" height=\"427\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113027_91754.jpg\" width=\"650\" height=\"650\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113028_21264.jpg\" width=\"650\" height=\"745\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113029_47816.jpg\" width=\"650\" height=\"579\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113031_40432.jpg\" width=\"650\" height=\"588\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113032_61194.jpg\" width=\"650\" height=\"541\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113034_50634.jpg\" width=\"650\" height=\"504\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113034_23552.jpg\" width=\"650\" height=\"627\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919113035_89617.jpg\" width=\"650\" height=\"469\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('24', '小米移动电源16000mAh', '/Uploads/gift/55fbe0d737995.jpg', '129000', '&lt;p&gt;&lt;img src=&quot;/Uploads/image/20150919/20150919112431_72338.jpg&quot; alt=&quot;&quot; height=&quot;452&quot; width=&quot;650&quot;/&gt;&lt;img src=&quot;/Uploads/image/20150919/20150919112437_50490.jpg&quot; alt=&quot;&quot; height=&quot;450&quot; width=&quot;650&quot;/&gt;&lt;img src=&quot;/Uploads/image/20150919/20150919112439_75556.jpg&quot; alt=&quot;&quot; height=&quot;367&quot; width=&quot;650&quot;/&gt;&lt;img src=&quot;/Uploads/image/20150919/20150919112442_52298.jpg&quot; alt=&quot;&quot; height=&quot;289&quot; width=&quot;650&quot;/&gt;&lt;img src=&quot;/Uploads/image/20150919/20150919112444_21541.jpg&quot; alt=&quot;&quot; height=&quot;465&quot; width=&quot;650&quot;/&gt;&lt;img src=&quot;/Uploads/image/20150919/20150919112445_77227.jpg&quot; alt=&quot;&quot; height=&quot;549&quot; width=&quot;650&quot;/&gt;&lt;img src=&quot;/Uploads/image/20150919/20150919112447_54429.jpg&quot; alt=&quot;&quot; height=&quot;547&quot; width=&quot;650&quot;/&gt;&lt;/p&gt;', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('6', '手机话费充值30元', '/Uploads/gift/55fbe454eb205.jpg', '30000', '手机话费充值30元', '1', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('7', '手机话费充值50元', '/Uploads/gift/55fbe44cd0f8c.jpg', '50000', '手机话费充值50元&nbsp;', '1', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('8', '苹果MacBook Pro MF840CH', '/Uploads/gift/55fbe41337ba0.jpg', '9988000', '<img src=\"/Uploads/image/20150919/20150919150050_82276.jpg\" width=\"650\" height=\"861\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('9', '佳能（Canon）EOS700D', '/Uploads/gift/55fbe35831581.jpg', '5100000', '<img src=\"/Uploads/image/20150919/20150919145929_90251.jpg\" width=\"650\" height=\"230\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919145932_24586.png\" width=\"650\" height=\"772\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('10', '微软surface pro3笔记本', '/Uploads/gift/55fbe3fc22e0b.jpg', '6888000', '<img src=\"/Uploads/image/20150919/20150919145251_25464.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145252_52106.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145252_41293.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145253_30554.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145254_87754.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145255_20050.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145256_56357.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145256_58401.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145257_67578.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145258_71541.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145258_85144.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145259_82201.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145300_45701.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145300_17982.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145301_25624.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145302_70279.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145304_92170.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145304_20898.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145306_58281.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145306_96865.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145328_60272.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145330_64729.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145331_35898.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145331_28275.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145333_18879.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145334_42004.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145334_76614.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145335_73218.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145336_92524.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145336_47150.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145337_94054.jpg\" alt=\"\" width=\"650\" /> <img src=\"/Uploads/image/20150919/20150919145337_31037.jpg\" alt=\"\" width=\"650\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('11', '苹果iPhone6 Plus 16G', '/Uploads/gift/55fbe3a9b906d.jpg', '5288000', '<img src=\"/Uploads/image/20150919/20150919144513_31202.jpg\" width=\"650\" height=\"362\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919144515_49086.jpg\" width=\"650\" height=\"476\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919144516_61351.jpg\" width=\"650\" height=\"233\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919144517_47459.jpg\" width=\"650\" height=\"214\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919144518_13889.jpg\" width=\"650\" height=\"427\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919144520_20335.jpg\" width=\"650\" height=\"435\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919144522_74110.jpg\" width=\"650\" height=\"418\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919144526_11059.jpg\" width=\"650\" height=\"506\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919144527_96958.jpg\" width=\"650\" height=\"213\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919144529_71634.jpg\" width=\"650\" height=\"430\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919144531_10842.jpg\" width=\"650\" height=\"385\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919144534_50694.jpg\" width=\"650\" height=\"335\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('12', '苹果iPhone6 16G', '/Uploads/gift/55fbe38ca8999.jpg', '4488000', '<img src=\"/Uploads/image/20150919/20150919144239_27977.jpg\" width=\"650\" height=\"936\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('13', '小米Note 顶配版', '/Uploads/gift/55fbe47f30dcd.jpg', '2999000', '<img src=\"/Uploads/image/20150919/20150919143927_59439.jpg\" width=\"650\" height=\"5396\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143932_74563.jpg\" width=\"650\" height=\"1049\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143934_21065.jpg\" width=\"650\" height=\"3967\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143938_18328.jpg\" width=\"650\" height=\"1420\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143942_76972.jpg\" width=\"650\" height=\"3421\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143945_54491.jpg\" width=\"650\" height=\"908\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143949_59921.jpg\" width=\"650\" height=\"4656\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('14', '小米手机4 ', '/Uploads/gift/55fbe4a5a8371.jpg', '1499000', '<img src=\"/Uploads/image/20150919/20150919143125_39895.jpg\" width=\"650\" height=\"952\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143210_53764.jpg\" width=\"650\" height=\"1006\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143235_78410.jpg\" width=\"650\" height=\"1003\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143240_86355.jpg\" width=\"650\" height=\"1620\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143244_63861.jpg\" width=\"650\" height=\"1620\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143245_67962.jpg\" width=\"650\" height=\"970\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143246_39938.jpg\" width=\"650\" height=\"398\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143246_28172.jpg\" width=\"650\" height=\"973\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143247_73829.jpg\" width=\"650\" height=\"941\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143248_21458.jpg\" width=\"650\" height=\"1037\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143250_36008.jpg\" width=\"650\" height=\"975\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143252_20082.jpg\" width=\"650\" height=\"859\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143253_77023.jpg\" width=\"650\" height=\"1296\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143254_94453.jpg\" width=\"650\" height=\"1321\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143255_23239.jpg\" width=\"650\" height=\"1129\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143256_41089.jpg\" width=\"650\" height=\"1137\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919143257_65696.jpg\" width=\"650\" height=\"998\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('16', '小米手环', '/Uploads/gift/55fbe145e0f61.jpg', '69000', '<img src=\"/Uploads/image/20150919/20150919121409_19051.jpg\" width=\"650\" height=\"829\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121410_33185.jpg\" width=\"650\" height=\"1114\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121413_23735.jpg\" width=\"650\" height=\"1040\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121420_47326.jpg\" width=\"650\" height=\"1156\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121424_23132.jpg\" width=\"650\" height=\"1022\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121426_35713.jpg\" width=\"650\" height=\"1156\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121427_58786.jpg\" width=\"650\" height=\"1156\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121428_28065.jpg\" width=\"650\" height=\"674\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121429_66714.jpg\" width=\"650\" height=\"623\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121430_78706.png\" width=\"650\" height=\"643\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121431_28256.jpg\" width=\"650\" height=\"758\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('17', '小钢炮蓝牙音箱', '/Uploads/gift/55fbe2fa97481.jpg', '99000', '<img src=\"/Uploads/image/20150919/20150919121125_44146.jpg\" width=\"650\" height=\"427\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121127_69328.jpg\" width=\"650\" height=\"347\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121133_97259.jpg\" width=\"650\" height=\"494\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121134_28332.jpg\" width=\"650\" height=\"518\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121137_48580.jpg\" width=\"650\" height=\"522\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121141_68989.jpg\" width=\"650\" height=\"519\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121143_27383.jpg\" width=\"650\" height=\"523\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121144_48918.jpg\" width=\"650\" height=\"520\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919121145_54502.jpg\" width=\"650\" height=\"425\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('18', '小米盒子', '/Uploads/gift/55fbe15a2db2d.jpg', '229000', '<img src=\"/Uploads/image/20150919/20150919120654_34755.jpg\" width=\"650\" height=\"539\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120655_86203.jpg\" width=\"650\" height=\"859\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120657_85045.jpg\" width=\"650\" height=\"757\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120701_41719.jpg\" width=\"650\" height=\"1152\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120704_81326.jpg\" width=\"650\" height=\"968\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120705_18796.jpg\" width=\"650\" height=\"788\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120706_12149.jpg\" width=\"650\" height=\"704\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120709_58687.jpg\" width=\"650\" height=\"807\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120711_52388.jpg\" width=\"650\" height=\"1080\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120714_22616.jpg\" width=\"650\" height=\"890\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120715_17394.jpg\" width=\"650\" height=\"677\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120715_80623.jpg\" width=\"650\" height=\"707\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120717_72915.jpg\" width=\"650\" height=\"1157\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120718_57763.jpg\" width=\"650\" height=\"729\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120719_33696.jpg\" width=\"650\" height=\"762\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120720_79982.png\" width=\"650\" height=\"506\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120722_51050.png\" width=\"650\" height=\"973\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120723_24567.png\" width=\"650\" height=\"531\" alt=\"\" />小米盒子', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('19', '小米移动电源10000mAh', '/Uploads/gift/55fbe1104254d.jpg', '69000', '<img src=\"/Uploads/image/20150919/20150919120238_14242.jpg\" width=\"650\" height=\"716\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120239_75528.jpg\" width=\"650\" height=\"534\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120240_64780.jpg\" width=\"650\" height=\"538\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120242_34099.jpg\" width=\"650\" height=\"866\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120243_18899.jpg\" width=\"650\" height=\"648\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120244_92655.jpg\" width=\"650\" height=\"410\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120245_20633.jpg\" width=\"650\" height=\"771\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919120246_39807.jpg\" width=\"650\" height=\"691\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('20', '红米Note ', '/Uploads/gift/55fbe4c35b112.jpg', '699000', '<img src=\"/Uploads/image/20150919/20150919115855_22450.jpg\" width=\"650\" height=\"414\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919115856_90941.jpg\" width=\"650\" height=\"450\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919115857_13576.jpg\" width=\"650\" height=\"499\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919115900_98615.jpg\" width=\"650\" height=\"426\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919115901_95879.jpg\" width=\"650\" height=\"495\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919115902_36556.jpg\" width=\"650\" height=\"521\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919115903_89212.jpg\" width=\"650\" height=\"513\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919115905_89497.jpg\" width=\"650\" height=\"492\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919115906_99675.jpg\" width=\"650\" height=\"425\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919115907_52526.jpg\" width=\"650\" height=\"505\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919115908_85991.jpg\" width=\"650\" height=\"583\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('21', '小米平板 16GB', '/Uploads/gift/55fbe4d5d28b8.jpg', '999000', '<img src=\"/Uploads/image/20150919/20150919114450_14534.jpg\" width=\"650\" height=\"1081\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114452_46850.jpg\" width=\"650\" height=\"1184\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114457_83669.jpg\" width=\"650\" height=\"1370\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114505_90938.jpg\" width=\"650\" height=\"783\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114509_93526.jpg\" width=\"650\" height=\"1460\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114534_78030.jpg\" width=\"650\" height=\"1093\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114548_32561.jpg\" width=\"650\" height=\"1075\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114550_77354.jpg\" width=\"650\" height=\"672\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114551_82023.jpg\" width=\"650\" height=\"696\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114553_25787.jpg\" width=\"650\" height=\"828\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114555_27237.jpg\" width=\"650\" height=\"573\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114559_11042.jpg\" width=\"650\" height=\"1150\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114602_95965.jpg\" width=\"650\" height=\"801\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114605_34035.jpg\" width=\"650\" height=\"1498\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114608_50448.jpg\" width=\"650\" height=\"891\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114609_51738.jpg\" width=\"650\" height=\"505\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114610_25247.jpg\" width=\"650\" height=\"866\" alt=\"\" /><img src=\"/Uploads/image/20150919/20150919114611_75800.jpg\" width=\"650\" height=\"395\" alt=\"\" />', '2', '1', '0');
INSERT INTO `yl_shop_gift` VALUES ('27', '三星手机', '/Uploads/shop/20160719/578d91790e12c.jpg', '2147483647', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/20160719/578d91dc6b236.jpg&quot; style=&quot;&quot; title=&quot;1.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/20160719/578d91dca797e.jpg&quot; style=&quot;&quot; title=&quot;2.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/20160719/578d91dd95c9c.jpg&quot; style=&quot;&quot; title=&quot;3.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/20160719/578d91ddc97a2.jpg&quot; style=&quot;&quot; title=&quot;5.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/20160719/578d91de09049.jpg&quot; style=&quot;&quot; title=&quot;4.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/20160719/578d91de5a2aa.jpg&quot; style=&quot;&quot; title=&quot;61EE.tmp.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2', '1', '0');

-- ----------------------------
-- Table structure for `yl_singlepage`
-- ----------------------------
DROP TABLE IF EXISTS `yl_singlepage`;
CREATE TABLE `yl_singlepage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `tpl` varchar(20) COLLATE utf8_bin NOT NULL,
  `url` varchar(100) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='单页面表';

-- ----------------------------
-- Records of yl_singlepage
-- ----------------------------
INSERT INTO `yl_singlepage` VALUES ('1', '关于我们', 'about.html', '/singlepage/about.html', 0x266C743B702667743B66736466266C743B2F702667743B, '1');
INSERT INTO `yl_singlepage` VALUES ('2', '联系我们', 'about.html', '/singlepage/contact.html', 0x266C743B702667743BE88194E7B3BBE68891E4BBAC266C743B696D67207372633D2671756F743B687474703A2F2F3132302E32372E3136322E34392F55706C6F6164732F75656469746F722F32303136303531372F353733616462373232626531322E706E672671756F743B207469746C653D2671756F743B7869616A696F6E672E6A70672E706E672671756F743B20616C743D2671756F743B7869616A696F6E672E6A70672E706E672671756F743B2F2667743B266C743B2F702667743B, '1');

-- ----------------------------
-- Table structure for `yl_slide`
-- ----------------------------
DROP TABLE IF EXISTS `yl_slide`;
CREATE TABLE `yl_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '幻灯片ID',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片分类ID',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `image` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '图片',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接地址',
  `text` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '展示文字',
  `description` text COLLATE utf8_bin COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：关闭，1：正常）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='幻灯片表';

-- ----------------------------
-- Records of yl_slide
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_slidecate`
-- ----------------------------
DROP TABLE IF EXISTS `yl_slidecate`;
CREATE TABLE `yl_slidecate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '幻灯片分类ID',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `remark` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '分类备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：关闭，1：正常）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of yl_slidecate
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_tag`
-- ----------------------------
DROP TABLE IF EXISTS `yl_tag`;
CREATE TABLE `yl_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `view` int(11) NOT NULL,
  `list_sort` smallint(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yl_tag
-- ----------------------------
INSERT INTO `yl_tag` VALUES ('1', '好看', '10', '1', '0');

-- ----------------------------
-- Table structure for `yl_tags`
-- ----------------------------
DROP TABLE IF EXISTS `yl_tags`;
CREATE TABLE `yl_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image` varchar(150) DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `seo_title` varchar(200) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
-- Records of yl_tags
-- ----------------------------
INSERT INTO `yl_tags` VALUES ('1', '动态图', '/Uploads/tags/5603a8c44b434.gif', '搞笑笔记网的动态图集结了最让人喷饭的搞笑动态图片，搞笑gif图，汇聚全网搞笑视频，奇葩恶搞、二货傻缺、萌宝萌宠，生活中到处都充满了欢乐，分享生活笑点，传递快乐梦想。我们的目的就是要让你快乐，笑不死，也要让你的笑声飞一会！', '0', '1', '动态图', '动态图', '搞笑笔记网的动态图集结了最让人喷饭的搞笑动态图片，搞笑gif图，汇聚全网搞笑视频，奇葩恶搞、二货傻缺、萌宝萌宠，生活中到处都充满了欢乐，分享生活笑点，传递快乐梦想。我们的目的就是要让你快乐，笑不死，也要让你的笑声飞一会！');
INSERT INTO `yl_tags` VALUES ('2', '女汉子', 'http://i2.mhimg.com/kl688file/2014-3/2014030316193659288.jpg', '女汉子不会撒娇，性格大大咧咧。女汉子适用于有以下性格特点的女生：天太热时，在家会“裸奔”；吃苹果不削皮，洗了直接啃，薯片吃到最后，直接倒嘴里；女汉子对小清新不感兴趣，与其做那些事情浪费时间，还不如在家抠脚！', '1', '999', '女汉子', '女汉子', '女汉子不会撒娇，性格大大咧咧。女汉子适用于有以下性格特点的女生：天太热时，在家会“裸奔”；吃苹果不削皮，洗了直接啃，薯片吃到最后，直接倒嘴里；女汉子对小清新不感兴趣，与其做那些事情浪费时间，还不如在家抠脚！');
INSERT INTO `yl_tags` VALUES ('4', '内涵段子', '/Uploads/tags/55fbe004d8290.jpg', '专注内涵本质，分享最真实最内涵的幽默段子，最有亮点的内涵趣图，屌丝最爱的美女福利，善于发现、打造最为经典的幽默平台，各种内涵，只有你懂得！', '1', '14', '内涵段子', '内涵段子', '专注内涵本质，分享最真实最内涵的幽默段子，最有亮点的内涵趣图，屌丝最爱的美女福利，善于发现、打造最为经典的幽默平台，各种内涵，只有你懂得！');
INSERT INTO `yl_tags` VALUES ('5', '内涵图片', '/Uploads/tags/5604c0504496a.jpg', '专注内涵本质，分享最真实最内涵的内涵图片，最有亮点的内涵趣图，屌丝最爱的美女福利，善于发现、打造最为经典的幽默平台，各种内涵，只有你懂得！', '1', '999', '内涵图片', '内涵图片', '专注内涵本质，分享最真实最内涵的内涵图片，最有亮点的内涵趣图，屌丝最爱的美女福利，善于发现、打造最为经典的幽默平台，各种内涵，只有你懂得！');
INSERT INTO `yl_tags` VALUES ('6', '经典笑话', '/Uploads/tags/5604c19a34dc7.jpg', '最新经典笑话段子让你笑到吐血', '1', '999', '经典笑话', '经典笑话', '最新经典笑话段子让你笑到吐血');
INSERT INTO `yl_tags` VALUES ('7', '爆笑图片', '/Uploads/tags/55fbdfe68ed27.jpg', '爆笑讲究的是从骨子里散发出来的一种幽默，这可是幽默的最高境界。意想不到的爆笑图片，妙语连珠的爆笑对话，还有百看不厌的爆笑动态图，爆笑绝对是开心和幽默的完美结晶。想在最适当的时机用最机智的言语达到幽默，却意义深远的效果，看“爆笑”精品笑话大全。', '1', '11', '爆笑图片', '爆笑图片', '爆笑讲究的是从骨子里散发出来的一种幽默，这可是幽默的最高境界。意想不到的爆笑图片，妙语连珠的爆笑对话，还有百看不厌的爆笑动态图，爆笑绝对是开心和幽默的完美结晶。想在最适当的时机用最机智的言语达到幽默，却意义深远的效果，看“爆笑”精品笑话大全。');
INSERT INTO `yl_tags` VALUES ('8', '夫妻笑话', '/Uploads/tags/5604c26e10f33.jpg', '十年修的同船渡，百年修的共枕眠！夫妻在生活中也发生很多有趣的事，逗乐你的神经！', '1', '999', '夫妻笑话', '夫妻笑话', '十年修的同船渡，百年修的共枕眠！夫妻在生活中也发生很多有趣的事，逗乐你的神经！');
INSERT INTO `yl_tags` VALUES ('9', '冷笑话图片', '/Uploads/tags/55fbe027738d0.jpg', '没有冷，只有更冷，在搞笑笔记网，爱讲冷笑话的朋友可以从这里挑出很多爆笑冷笑话。慢慢的你就会发现，你变成了一个冷笑话达人。灵活运用这些冷笑话去把身边的朋友冻住吧！', '1', '17', '冷笑话图片', '冷笑话图片', '没有冷，只有更冷，在搞笑笔记网，爱讲冷笑话的朋友可以从这里挑出很多爆笑冷笑话。慢慢的你就会发现，你变成了一个冷笑话达人。灵活运用这些冷笑话去把身边的朋友冻住吧！');
INSERT INTO `yl_tags` VALUES ('10', '欢乐自拍 ', '/Uploads/tags/55fbe018218b3.jpg', '自拍的那个永远不是焦点，抢镜的永远是亮点。他们是拿绳命在抢镜啊！高手的拍照姿势总是那么销魂。拍照的角度很重要，错位拍照可以毫无违和感也可以让人感觉很邪恶呢。', '1', '16', '欢乐自拍 ', '欢乐自拍 ', '自拍的那个永远不是焦点，抢镜的永远是亮点。他们是拿绳命在抢镜啊！高手的拍照姿势总是那么销魂。拍照的角度很重要，错位拍照可以毫无违和感也可以让人感觉很邪恶呢。');
INSERT INTO `yl_tags` VALUES ('11', '福利', '/Uploads/tags/55fbe05b2f50c.jpg', '福利是啥？美女？帅哥？搞笑笔记每周发福利满足你的各种愿望。小编精心收藏多年的精品福利等待和你分享。丰胸、长腿、性感、萌爆，只要光临搞笑笔记，各种诱惑各种销魂让你分分钟把持不住', '1', '20', '福利', '福利', '福利是啥？美女？帅哥？搞笑笔记每周发福利满足你的各种愿望。小编精心收藏多年的精品福利等待和你分享。丰胸、长腿、性感、萌爆，只要光临搞笑笔记，各种诱惑各种销魂让你分分钟把持不住');
INSERT INTO `yl_tags` VALUES ('12', '穿帮', '/Uploads/tags/5604bf9cb19a0.jpg', '穿帮就是“露馅了、暴露了”的意思。穿帮镜头指在影视剧拍摄中的错误。在火眼金睛的网友眼里，没有不穿帮的影视剧。搞笑的穿帮镜头总给人一种强烈的穿越感。', '1', '999', '穿帮', '穿帮', '穿帮就是“露馅了、暴露了”的意思。穿帮镜头指在影视剧拍摄中的错误。在火眼金睛的网友眼里，没有不穿帮的影视剧。搞笑的穿帮镜头总给人一种强烈的穿越感。');
INSERT INTO `yl_tags` VALUES ('13', '爆笑笑话', '/Uploads/tags/5604e73066668.jpg', '逗B最爆笑,笑商特别高，小编每天被这些爆笑笑话笑到胃抽筋，不信，你来看看？？', '1', '1999', '爆笑笑话', '爆笑笑话', '逗B最爆笑,笑商特别高，小编每天被这些爆笑笑话笑到胃抽筋，不信，你来看看？？');
INSERT INTO `yl_tags` VALUES ('14', '笑话故事', '/Uploads/tags/5604e8a138909.jpg', '搞笑笔记网有大量的笑话故事,故事会笑话,歇后语笑话，每天让你笑不停！', '1', '1999', '笑话故事', '笑话故事', '搞笑笔记网有大量的笑话故事,故事会笑话,歇后语笑话，每天让你笑不停！');
INSERT INTO `yl_tags` VALUES ('15', '成人笑话', '/Uploads/tags/561b4a3cd23bc.jpg', '搞笑幽默、有内涵的成人笑话，给你带来无限欢乐', '1', '999', '成人笑话', '成人笑话', '搞笑幽默、有内涵的成人笑话，给你带来无限欢乐');
INSERT INTO `yl_tags` VALUES ('16', '无厘头', '/Uploads/tags/5604bd46e3edf.jpg', '无厘头的表现形式即是特殊的夸张，语言、表演、动作往往很夸张恶搞，以达到搞笑或讽刺目的的方式。就让小编来带你体验无厘头吧！', '1', '999', '无厘头', '无厘头', '无厘头的表现形式即是特殊的夸张，语言、表演、动作往往很夸张恶搞，以达到搞笑或讽刺目的的方式。就让小编来带你体验无厘头吧！');
INSERT INTO `yl_tags` VALUES ('17', '雷人恶搞', '/Uploads/tags/55fbdfbeb7e6a.jpg', '俗话说高手在民间，总会有人做些雷人恶搞来亮瞎你眼！明明是很简单优雅的事，却往往变成了恶搞的一幕，无不感叹人们地方逗比智商！', '1', '7', '雷人恶搞', '雷人恶搞', '俗话说高手在民间，总会有人做些雷人恶搞来亮瞎你眼！明明是很简单优雅的事，却往往变成了恶搞的一幕，无不感叹人们地方逗比智商！');
INSERT INTO `yl_tags` VALUES ('18', '爱情', '/Uploads/tags/55fbe038b40a6.jpg', '何为爱情，这是被许多人所提到过的。古时已有“问世间情为何物，直教人生死相许”的爱情名言。如果说古人对待爱情是羞涩的，如今的人们却用着各种奇葩的方式大秀自己的爱情。这让屌丝们情何以堪，纷纷拿起自己的右手反击，并诅咒他们的爱情早日结束。', '1', '18', '爱情', '爱情', '何为爱情，这是被许多人所提到过的。古时已有“问世间情为何物，直教人生死相许”的爱情名言。如果说古人对待爱情是羞涩的，如今的人们却用着各种奇葩的方式大秀自己的爱情。这让屌丝们情何以堪，纷纷拿起自己的右手反击，并诅咒他们的爱情早日结束。');
INSERT INTO `yl_tags` VALUES ('19', '随手拍', '/Uploads/tags/5604e4acde145.jpg', '生活处处有精彩，别人一个动作、一个表情都能让你捧腹大笑，随手拍，记录下欢乐的瞬间，尽在搞笑笔记网！', '1', '999', '随手拍', '随手拍', '生活处处有精彩，别人一个动作、一个表情都能让你捧腹大笑，随手拍，记录下欢乐的瞬间，尽在搞笑笔记网！');
INSERT INTO `yl_tags` VALUES ('20', '漫画', '/Uploads/tags/55fbe0417c50b.jpg', '我们精心汇集全国各地、各种类型的动漫，收集最新、最搞笑的真人动漫、卡通动漫、四格漫画、黑白线条动漫、经典动漫动态图应有尽有！', '1', '19', '漫画', '漫画', '我们精心汇集全国各地、各种类型的动漫，收集最新、最搞笑的真人动漫、卡通动漫、四格漫画、黑白线条动漫、经典动漫动态图应有尽有！');
INSERT INTO `yl_tags` VALUES ('21', '猫咪', '/Uploads/tags/5604a2cb92bf1.jpg', '所谓猫咪，一整个种族都是神经病的物种！爱睡觉、爱干净、天性懒散、傲娇抖M属性！猫奴们的游乐场，集各种猫咪搞笑卖萌之大成！各种被蓝星人欺负or欺负蓝星人的猫咪，萌并神经着，保证你萌cry笑抽！', '1', '22', '猫咪', '猫咪', '所谓猫咪，一整个种族都是神经病的物种！爱睡觉、爱干净、天性懒散、傲娇抖M属性！猫奴们的游乐场，集各种猫咪搞笑卖萌之大成！各种被蓝星人欺负or欺负蓝星人的猫咪，萌并神经着，保证你萌cry笑抽！');
INSERT INTO `yl_tags` VALUES ('22', '狗狗', '/Uploads/tags/55fbe072e749f.jpg', '可爱的狗狗永远含蓄而充满机智，思绪走的比主人快，卖萌比天敌猫咪巧，让你随着你狗狗的恶搞而发出会心的一笑。汪星人的幽默真是天生的，头脑灵活度、思想多元化，无论什么情况都会使你觉得：狗狗是个不可或缺的幽默伙伴。每天来看又呆又萌的狗狗图片，绝对保证好心情！', '1', '21', '狗狗', '狗狗', '可爱的狗狗永远含蓄而充满机智，思绪走的比主人快，卖萌比天敌猫咪巧，让你随着你狗狗的恶搞而发出会心的一笑。汪星人的幽默真是天生的，头脑灵活度、思想多元化，无论什么情况都会使你觉得：狗狗是个不可或缺的幽默伙伴。每天来看又呆又萌的狗狗图片，绝对保证好心情！');
INSERT INTO `yl_tags` VALUES ('23', '动物', '/Uploads/tags/55fbdfcc5359e.jpg', '不要小看动物们，它们的逗比搞笑潜力不亚于人类。他们憨态可掬的外表，时常能够博得人们的会心一笑。动物总动员，动物世界是如此精彩，一张张搞笑动物图片真会让你笑破肚皮……', '1', '8', '动物', '动物', '不要小看动物们，它们的逗比搞笑潜力不亚于人类。他们憨态可掬的外表，时常能够博得人们的会心一笑。动物总动员，动物世界是如此精彩，一张张搞笑动物图片真会让你笑破肚皮……');
INSERT INTO `yl_tags` VALUES ('24', '趣事', '/Uploads/tags/55fbdf878f36a.jpg', '生活趣事，无处不在，鼠标轻轻一点，一切都在搞笑笔记网。我们每天发布各种生活趣事、校园趣事、家庭趣事、奇闻趣事等，记录下我们生活中的精彩瞬间！', '1', '2', '趣事', '趣事', '生活趣事，无处不在，鼠标轻轻一点，一切都在搞笑笔记网。我们每天发布各种生活趣事、校园趣事、家庭趣事、奇闻趣事等，记录下我们生活中的精彩瞬间！');
INSERT INTO `yl_tags` VALUES ('25', '糗事', '/Uploads/tags/55fbdf9398426.jpg', '汇集天下最爆笑的糗事百态，最尴尬的糗事曝光，最真实的出糗瞬间。无国界搞笑糗事，语出惊人，欲哭无泪、惊天地泣鬼神窘态之化境，笑掉你的大牙！', '1', '3', '糗事', '糗事', '汇集天下最爆笑的糗事百态，最尴尬的糗事曝光，最真实的出糗瞬间。无国界搞笑糗事，语出惊人，欲哭无泪、惊天地泣鬼神窘态之化境，笑掉你的大牙！');
INSERT INTO `yl_tags` VALUES ('26', '儿童', '/Uploads/tags/55fbdf9e63660.jpg', '谁家萌娃初长成！每个儿童都是天生的笑才，他们的搞笑天分让你苦笑不得，给家人朋友带来无限的欢乐！', '1', '4', '儿童', '儿童', '谁家萌娃初长成！每个儿童都是天生的笑才，他们的搞笑天分让你苦笑不得，给家人朋友带来无限的欢乐！');
INSERT INTO `yl_tags` VALUES ('27', '男女', '/Uploads/tags/55fbdfadca38d.jpg', '俗话说，不是一家人，不进一家门！男女之间的幽默早已超出了笑话的境界，不然在世间寻寻觅觅，最终怎么会遇到TA？在冥冥之中，男女姻缘天已注定。恩恩爱爱度过一生，嘻嘻哈哈相伴到老。用幽默和笑话去调剂男女生活，你的一生会更美好！', '1', '5', '男女', '男女', '俗话说，不是一家人，不进一家门！男女之间的幽默早已超出了笑话的境界，不然在世间寻寻觅觅，最终怎么会遇到TA？在冥冥之中，男女姻缘天已注定。恩恩爱爱度过一生，嘻嘻哈哈相伴到老。用幽默和笑话去调剂男女生活，你的一生会更美好！');
INSERT INTO `yl_tags` VALUES ('28', '美女', '/Uploads/tags/55fbdfb587393.jpg', '你以为美女们都是女神？当心，美女也会秒变逗比，雷人的、恶搞的、无节操的、囧事一箩筐...无聊闲暇时看看各国美女们，笑傻你的神经！', '1', '6', '美女', '美女', '你以为美女们都是女神？当心，美女也会秒变逗比，雷人的、恶搞的、无节操的、囧事一箩筐...无聊闲暇时看看各国美女们，笑傻你的神经！');
INSERT INTO `yl_tags` VALUES ('29', '碉堡了', '/Uploads/tags/55fbdfd45f881.jpg', '碉堡的牛人，碉堡的创意，碉堡的小伙伴，你们这么屌，你们家里人知道么？汇集全国各地的碉堡，亮瞎你的眼！', '1', '9', '碉堡了', '碉堡了', '碉堡的牛人，碉堡的创意，碉堡的小伙伴，你们这么屌，你们家里人知道么？汇集全国各地的碉堡，亮瞎你的眼！');
INSERT INTO `yl_tags` VALUES ('30', '熊孩子', '/Uploads/tags/55fbdfe0216a3.jpg', '当孩子们有思想的时候，就会做出一些不可理喻的带有破坏性的事情，他们会搞破坏、不守规矩、扰乱你的生活节奏，气死人不偿命，让你欲哭无泪！', '1', '10', '熊孩子', '熊孩子', '当孩子们有思想的时候，就会做出一些不可理喻的带有破坏性的事情，他们会搞破坏、不守规矩、扰乱你的生活节奏，气死人不偿命，让你欲哭无泪！');
INSERT INTO `yl_tags` VALUES ('31', '逗比', '/Uploads/tags/55fbdfefd5ccd.jpg', '欢乐青年逗比多，无论男女老幼、人类动物，逗比神经质引人捧腹大笑！', '1', '12', '逗比', '逗比', '欢乐青年逗比多，无论男女老幼、人类动物，逗比神经质引人捧腹大笑！');
INSERT INTO `yl_tags` VALUES ('32', '牛人', '/Uploads/tags/55fbe0aeafd31.jpg', '牛人的境界你永远不懂！你或许佩服过牛人们最具挑战力的玩命自拍；你或许赞叹于牛人们精彩绝伦的水果雕刻；你或许惊诧于牛人们的绝世武功......但和搞笑笔记网里的牛人相比，他们暴弱了！看过这一张张牛气冲天的照片，你和小伙伴们真会惊呆了！', '1', '13', '牛人', '牛人', '牛人的境界你永远不懂！你或许佩服过牛人们最具挑战力的玩命自拍；你或许赞叹于牛人们精彩绝伦的水果雕刻；你或许惊诧于牛人们的绝世武功......但和搞笑笔记网里的牛人相比，他们暴弱了！看过这一张张牛气冲天的照片，你和小伙伴们真会惊呆了！');
INSERT INTO `yl_tags` VALUES ('33', '奇葩', '/Uploads/tags/55fbe00eccf0d.jpg', '奇葩的人，奇葩的事，奇葩头像，奇葩图片，奇葩年终奖，奇葩睡姿，在搞笑笔记网你可以看到生活中真是到处都是奇葩。', '1', '15', '奇葩', '奇葩', '奇葩的人，奇葩的事，奇葩头像，奇葩图片，奇葩年终奖，奇葩睡姿，在搞笑笔记网你可以看到生活中真是到处都是奇葩。');
INSERT INTO `yl_tags` VALUES ('34', '冷笑话段子', '/Uploads/tags/5604e6808dace.jpg', '没有冷，只有更冷，在搞笑笔记网，爱讲冷笑话的朋友可以从这里挑出很多爆笑冷笑话。慢慢的你就会发现，你变成了一个冷笑话达人。灵活运用这些冷笑话去把身边的朋友冻住吧！', '1', '999', '冷笑话段子', '冷笑话段子', '没有冷，只有更冷，在搞笑笔记网，爱讲冷笑话的朋友可以从这里挑出很多爆笑冷笑话。慢慢的你就会发现，你变成了一个冷笑话达人。灵活运用这些冷笑话去把身边的朋友冻住吧！');
INSERT INTO `yl_tags` VALUES ('35', '求PS', '/Uploads/tags/5604a394b9662.jpg', 'ps的技术多么的强大，很多PS后的图片都是毫无违和感，让你真假难辨，自从网络神人们用PS恶搞图片之后，便一发不可收拾。PS恶搞美女，恶搞明星，恶搞影视剧，恶搞雕像等等。', '1', '99', '求PS', '求PS', 'ps的技术多么的强大，很多PS后的图片都是毫无违和感，让你真假难辨，自从网络神人们用PS恶搞图片之后，便一发不可收拾。PS恶搞美女，恶搞明星，恶搞影视剧，恶搞雕像等等。');
INSERT INTO `yl_tags` VALUES ('36', '好基友', '/Uploads/tags/5604a31eddd88.jpg', '基友一般是指男同性恋之间的关系，基=GAY，“基”取“Gay”的第一个字母“G”的谐音。从搅基、搞基发展而来，即互为基友；基友还用于指好兄弟、哥们、死党、战友、竞技游戏上的队友、网友。基友也用于特别好的暧昧的朋友。可是，你让搞基金买卖的朋友情何以堪！', '1', '99', '好基友', '好基友', '基友一般是指男同性恋之间的关系，基=GAY，“基”取“Gay”的第一个字母“G”的谐音。从搅基、搞基发展而来，即互为基友；基友还用于指好兄弟、哥们、死党、战友、竞技游戏上的队友、网友。基友也用于特别好的暧昧的朋友。可是，你让搞基金买卖的朋友情何以堪！');
INSERT INTO `yl_tags` VALUES ('37', '明星', '/Uploads/tags/5604a501056e3.jpg', '明显，舞台上永远的光鲜亮丽！实际上明显也有范二傻缺、出糗的时候！来搞笑笔记，你会发现明星们不一样的逗比一面！', '1', '99', '明星', '明星', '明星');
INSERT INTO `yl_tags` VALUES ('38', '萌呆了', '/Uploads/tags/561b48ee323ab.jpeg', '今天出来没吃药，感觉整个人都萌呆了。我自横刀向天笑，感觉自己萌呆了；商女不知亡国恨，感觉自己萌呆了……', '1', '99', '萌呆了', '萌呆了', '今天出来没吃药，感觉整个人都萌呆了。我自横刀向天笑，感觉自己萌呆了；商女不知亡国恨，感觉自己萌呆了……');
INSERT INTO `yl_tags` VALUES ('39', '大湿兄与小湿妹', '/Uploads/tags/561b491a248e1.jpg', '大湿兄与小湿妹，欢乐逗比多！', '1', '99', '大湿兄与小湿妹', '大湿兄与小湿妹', '大湿兄与小湿妹，欢乐逗比多！');
INSERT INTO `yl_tags` VALUES ('40', '神技能', '/Uploads/tags/562f1f4ab60c4.jpg', '指表现在艺术、工艺、体育等方面的巧妙的技能，如“绘画技巧”；或者指技巧性的运动。如“技巧比赛”。收集整理日常生活中的一些技巧，看者受溢！', '1', '99', '神技能', '神技能', '指表现在艺术、工艺、体育等方面的巧妙的技能，如“绘画技巧”；或者指技巧性的运动。如“技巧比赛”。收集整理日常生活中的一些技巧，看者受溢！');
INSERT INTO `yl_tags` VALUES ('41', '科技', '/Uploads/tags/562f1f72731f7.jpg', '社会上习惯于把科学和技术联在一起，统称为“科技”。实际二者既有密切联系，又有重要区别。科学解决理论问题，技术解决实际问题。', '1', '99', '科技', '科技', '社会上习惯于把科学和技术联在一起，统称为“科技”。实际二者既有密切联系，又有重要区别。科学解决理论问题，技术解决实际问题。');
INSERT INTO `yl_tags` VALUES ('42', '二货', '/Uploads/tags/562f1f9788b20.jpg', '二货是辱骂别人骂别人傻的意思。在很多地方“2”就是傻的意思。说别人“2”就是骂别人傻。“2货”也就是说别人是“傻货”，是辱骂别人的话。二货不单纯是骂人，也是一个很恰当的形容词，形容智商较低，总做傻事的一类人。', '1', '99', '二货', '二货', '二货是辱骂别人骂别人傻的意思。在很多地方“2”就是傻的意思。说别人“2”就是骂别人傻。“2货”也就是说别人是“傻货”，是辱骂别人的话。二货不单纯是骂人，也是一个很恰当的形容词，形容智商较低，总做傻事的一类人。');

-- ----------------------------
-- Table structure for `yl_tpl`
-- ----------------------------
DROP TABLE IF EXISTS `yl_tpl`;
CREATE TABLE `yl_tpl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `key` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标识',
  `status` tinyint(1) NOT NULL COMMENT '状态（0：关闭，1：正常）',
  `created_time` int(11) NOT NULL COMMENT '创建时间',
  `type` tinyint(1) NOT NULL COMMENT '类型 1：邮件 2：短信',
  `content` text COLLATE utf8_bin NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统模板表';

-- ----------------------------
-- Records of yl_tpl
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_url`
-- ----------------------------
DROP TABLE IF EXISTS `yl_url`;
CREATE TABLE `yl_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_url` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '原始URL',
  `target_url` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '替换URL',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：关闭，1：正常）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='URL重写表';

-- ----------------------------
-- Records of yl_url
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_user`
-- ----------------------------
DROP TABLE IF EXISTS `yl_user`;
CREATE TABLE `yl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `qq` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(200) NOT NULL,
  `audit_num` int(11) NOT NULL DEFAULT '0',
  `audit_suc_num` int(11) NOT NULL DEFAULT '0',
  `audit_pro` int(11) NOT NULL DEFAULT '0',
  `send_num` int(11) NOT NULL DEFAULT '0',
  `register_ip` varchar(50) NOT NULL,
  `last_login_ip` varchar(50) NOT NULL,
  `last_login_time` int(11) DEFAULT '0',
  `created_time` int(11) NOT NULL DEFAULT '0',
  `online_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `openid` varchar(100) DEFAULT NULL,
  `sign_time` int(11) NOT NULL DEFAULT '0',
  `follows` int(11) DEFAULT '0',
  `fans` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of yl_user
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_user_audit`
-- ----------------------------
DROP TABLE IF EXISTS `yl_user_audit`;
CREATE TABLE `yl_user_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joke_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `created_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户审稿表';

-- ----------------------------
-- Records of yl_user_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_user_fans`
-- ----------------------------
DROP TABLE IF EXISTS `yl_user_fans`;
CREATE TABLE `yl_user_fans` (
  `uid` int(11) NOT NULL,
  `follow_uids` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yl_user_fans
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_user_gift`
-- ----------------------------
DROP TABLE IF EXISTS `yl_user_gift`;
CREATE TABLE `yl_user_gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) NOT NULL,
  `gift_id` int(11) NOT NULL DEFAULT '0',
  `gift_info` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户兑换商品表';

-- ----------------------------
-- Records of yl_user_gift
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_user_joke`
-- ----------------------------
DROP TABLE IF EXISTS `yl_user_joke`;
CREATE TABLE `yl_user_joke` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `content` text NOT NULL,
  `is_package` tinyint(1) NOT NULL DEFAULT '0',
  `package_fee` int(11) NOT NULL DEFAULT '0',
  `package_user_id` int(11) NOT NULL DEFAULT '0',
  `created_time` int(11) NOT NULL DEFAULT '0',
  `audit_time` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `audit_num` int(11) NOT NULL DEFAULT '0',
  `good_num` int(11) NOT NULL DEFAULT '0',
  `bad_num` int(11) NOT NULL DEFAULT '0',
  `review_num` int(11) NOT NULL DEFAULT '0',
  `share_num` int(11) NOT NULL DEFAULT '0',
  `award_num` int(11) NOT NULL DEFAULT '0',
  `tags_id` varchar(200) DEFAULT NULL,
  `god_reply` tinyint(1) NOT NULL DEFAULT '0',
  `reason` varchar(200) DEFAULT NULL,
  `commend` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户发布笑话表';

-- ----------------------------
-- Records of yl_user_joke
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_user_msg`
-- ----------------------------
DROP TABLE IF EXISTS `yl_user_msg`;
CREATE TABLE `yl_user_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `content` varchar(500) COLLATE utf8_bin NOT NULL,
  `created_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yl_user_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_user_openid`
-- ----------------------------
DROP TABLE IF EXISTS `yl_user_openid`;
CREATE TABLE `yl_user_openid` (
  `type` varchar(10) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方登陆';

-- ----------------------------
-- Records of yl_user_openid
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_user_record`
-- ----------------------------
DROP TABLE IF EXISTS `yl_user_record`;
CREATE TABLE `yl_user_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joke_id` int(11) NOT NULL DEFAULT '0',
  `user_id` varchar(100) NOT NULL DEFAULT '0',
  `type` enum('','good','bad') NOT NULL,
  `package` tinyint(1) NOT NULL DEFAULT '0',
  `award` tinyint(1) NOT NULL DEFAULT '0',
  `created_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户笑话操作记录';

-- ----------------------------
-- Records of yl_user_record
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_user_review`
-- ----------------------------
DROP TABLE IF EXISTS `yl_user_review`;
CREATE TABLE `yl_user_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joke_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `content` varchar(200) NOT NULL,
  `good_num` int(11) NOT NULL DEFAULT '0',
  `at_user_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户评论表';

-- ----------------------------
-- Records of yl_user_review
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_user_review_record`
-- ----------------------------
DROP TABLE IF EXISTS `yl_user_review_record`;
CREATE TABLE `yl_user_review_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL DEFAULT '0',
  `review_id` int(11) NOT NULL DEFAULT '0',
  `created_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户评论点赞表';

-- ----------------------------
-- Records of yl_user_review_record
-- ----------------------------

-- ----------------------------
-- Table structure for `yl_user_trace`
-- ----------------------------
DROP TABLE IF EXISTS `yl_user_trace`;
CREATE TABLE `yl_user_trace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `award_user_id` int(11) NOT NULL DEFAULT '0',
  `created_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户动态信息存储表';

-- ----------------------------
-- Records of yl_user_trace
-- ----------------------------
