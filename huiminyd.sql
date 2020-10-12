/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : huiminyd

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-03-15 16:58:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1b209429fd2feada_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1b209429fd2feada_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_6facbf0b22f60d14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_2ad124de8ca805c8_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add goods', '7', 'add_goods');
INSERT INTO `auth_permission` VALUES ('20', 'Can change goods', '7', 'change_goods');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete goods', '7', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('22', 'Can add shop', '8', 'add_shop');
INSERT INTO `auth_permission` VALUES ('23', 'Can change shop', '8', 'change_shop');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete shop', '8', 'delete_shop');
INSERT INTO `auth_permission` VALUES ('25', 'Can add goods shop', '9', 'add_goodsshop');
INSERT INTO `auth_permission` VALUES ('26', 'Can change goods shop', '9', 'change_goodsshop');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete goods shop', '9', 'delete_goodsshop');
INSERT INTO `auth_permission` VALUES ('28', 'Can add goods record', '10', 'add_goodsrecord');
INSERT INTO `auth_permission` VALUES ('29', 'Can change goods record', '10', 'change_goodsrecord');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete goods record', '10', 'delete_goodsrecord');
INSERT INTO `auth_permission` VALUES ('31', 'Can add order', '11', 'add_order');
INSERT INTO `auth_permission` VALUES ('32', 'Can change order', '11', 'change_order');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete order', '11', 'delete_order');
INSERT INTO `auth_permission` VALUES ('34', 'Can add goods sell record', '12', 'add_goodssellrecord');
INSERT INTO `auth_permission` VALUES ('35', 'Can change goods sell record', '12', 'change_goodssellrecord');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete goods sell record', '12', 'delete_goodssellrecord');
INSERT INTO `auth_permission` VALUES ('37', 'Can add goods return record', '13', 'add_goodsreturnrecord');
INSERT INTO `auth_permission` VALUES ('38', 'Can change goods return record', '13', 'change_goodsreturnrecord');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete goods return record', '13', 'delete_goodsreturnrecord');
INSERT INTO `auth_permission` VALUES ('40', 'Can add inbound channel', '14', 'add_inboundchannel');
INSERT INTO `auth_permission` VALUES ('41', 'Can change inbound channel', '14', 'change_inboundchannel');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete inbound channel', '14', 'delete_inboundchannel');
INSERT INTO `auth_permission` VALUES ('43', 'Can add goods add record', '15', 'add_goodsaddrecord');
INSERT INTO `auth_permission` VALUES ('44', 'Can change goods add record', '15', 'change_goodsaddrecord');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete goods add record', '15', 'delete_goodsaddrecord');
INSERT INTO `auth_permission` VALUES ('46', 'Can add backup', '16', 'add_backup');
INSERT INTO `auth_permission` VALUES ('47', 'Can change backup', '16', 'change_backup');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete backup', '16', 'delete_backup');
INSERT INTO `auth_permission` VALUES ('49', 'Can add line item', '17', 'add_lineitem');
INSERT INTO `auth_permission` VALUES ('50', 'Can change line item', '17', 'change_lineitem');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete line item', '17', 'delete_lineitem');
INSERT INTO `auth_permission` VALUES ('52', 'Can add other cost', '18', 'add_othercost');
INSERT INTO `auth_permission` VALUES ('53', 'Can change other cost', '18', 'change_othercost');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete other cost', '18', 'delete_othercost');
INSERT INTO `auth_permission` VALUES ('55', 'Can add transfer shop', '19', 'add_transfershop');
INSERT INTO `auth_permission` VALUES ('56', 'Can change transfer shop', '19', 'change_transfershop');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete transfer shop', '19', 'delete_transfershop');
INSERT INTO `auth_permission` VALUES ('58', 'Can add transfer record', '20', 'add_transferrecord');
INSERT INTO `auth_permission` VALUES ('59', 'Can change transfer record', '20', 'change_transferrecord');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete transfer record', '20', 'delete_transferrecord');
INSERT INTO `auth_permission` VALUES ('61', 'Can add change count record', '21', 'add_changecountrecord');
INSERT INTO `auth_permission` VALUES ('62', 'Can change change count record', '21', 'change_changecountrecord');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete change count record', '21', 'delete_changecountrecord');
INSERT INTO `auth_permission` VALUES ('64', 'Can add refund record', '22', 'add_refundrecord');
INSERT INTO `auth_permission` VALUES ('65', 'Can change refund record', '22', 'change_refundrecord');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete refund record', '22', 'delete_refundrecord');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$20000$RUShucMBWyGj$NRyFAsm0sgPpWQ+uyGHDUbaPzE4zI4mRnSrOuKTRmk4=', '2020-03-08 15:26:15.675293', '1', 'wsq', '', '', '1719408836@qq.com', '1', '1', '2019-12-11 22:29:08.521705');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$20000$K8ixA9Eaj0xN$LZQKbCdJGy29ZJQOdq9N2bV2ejWfmzybnQD/xQAIuws=', '2020-03-08 15:25:54.510041', '0', 'wang', '', '', '', '1', '1', '2019-12-25 16:17:00.000000');
INSERT INTO `auth_user` VALUES ('4', 'pbkdf2_sha256$20000$s928sae2NjIq$HM64Xlbp60/gNcUuHcPLwxVnI9Nq8t2O/9KZCzDIbgU=', null, '0', '1', '', '', '', '0', '1', '2020-03-08 15:03:00.000000');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_22bb124f7c640e38_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_22bb124f7c640e38_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6310605df70dd85_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_5409233866301776_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_5409233866301776_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissio_user_id_1d1b9e19232e3d3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
INSERT INTO `auth_user_user_permissions` VALUES ('1', '4', '56');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_3a3f3284da533d54_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_379ba27230e7b487_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_3a3f3284da533d54_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_379ba27230e7b487_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2019-12-12 21:49:12.603411', '2', 'wang', '1', '', '4', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2019-12-19 14:55:16.046803', '2', '布洛芬', '3', '', '23', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2019-12-19 14:55:16.071748', '1', '脑白金', '3', '', '23', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2019-12-25 16:18:01.186679', '2', 'wang', '2', '已修改 is_staff，last_login 和 date_joined 。', '4', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2020-01-07 15:06:10.061320', '3', '王帅强', '1', '', '4', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2020-02-28 21:38:05.247118', '3', '王帅强', '3', '', '4', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2020-03-08 15:03:20.872776', '4', '1', '1', '', '4', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2020-03-08 15:07:11.712120', '4', '1', '2', '已修改 user_permissions 。', '4', '1');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_38511d662e6d9ceb_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('16', 'kucun', 'backup');
INSERT INTO `django_content_type` VALUES ('21', 'kucun', 'changecountrecord');
INSERT INTO `django_content_type` VALUES ('7', 'kucun', 'goods');
INSERT INTO `django_content_type` VALUES ('15', 'kucun', 'goodsaddrecord');
INSERT INTO `django_content_type` VALUES ('10', 'kucun', 'goodsrecord');
INSERT INTO `django_content_type` VALUES ('13', 'kucun', 'goodsreturnrecord');
INSERT INTO `django_content_type` VALUES ('12', 'kucun', 'goodssellrecord');
INSERT INTO `django_content_type` VALUES ('9', 'kucun', 'goodsshop');
INSERT INTO `django_content_type` VALUES ('14', 'kucun', 'inboundchannel');
INSERT INTO `django_content_type` VALUES ('17', 'kucun', 'lineitem');
INSERT INTO `django_content_type` VALUES ('11', 'kucun', 'order');
INSERT INTO `django_content_type` VALUES ('18', 'kucun', 'othercost');
INSERT INTO `django_content_type` VALUES ('22', 'kucun', 'refundrecord');
INSERT INTO `django_content_type` VALUES ('8', 'kucun', 'shop');
INSERT INTO `django_content_type` VALUES ('20', 'kucun', 'transferrecord');
INSERT INTO `django_content_type` VALUES ('19', 'kucun', 'transfershop');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('25', 'wsq', 'goodsaddrecord');
INSERT INTO `django_content_type` VALUES ('26', 'wsq', 'goodsrecord');
INSERT INTO `django_content_type` VALUES ('24', 'wsq', 'goodsreturnrecord');
INSERT INTO `django_content_type` VALUES ('27', 'wsq', 'goodsshop');
INSERT INTO `django_content_type` VALUES ('23', 'wsq', 'order');
INSERT INTO `django_content_type` VALUES ('29', 'wsq', 'transferrecord');
INSERT INTO `django_content_type` VALUES ('28', 'wsq', 'transfershop');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-12-11 22:28:18.333480');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2019-12-11 22:28:25.280839');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2019-12-11 22:28:26.993605');
INSERT INTO `django_migrations` VALUES ('4', 'contenttypes', '0002_remove_content_type_name', '2019-12-11 22:28:28.071775');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2019-12-11 22:28:28.879875');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2019-12-11 22:28:29.589540');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2019-12-11 22:28:29.671203');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2019-12-11 22:28:30.220194');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2019-12-11 22:28:30.270155');
INSERT INTO `django_migrations` VALUES ('10', 'sessions', '0001_initial', '2019-12-11 22:28:30.829865');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('2vs2au7m4i6e8rdw3g0h9npqchbbnrlc', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2020-01-04 13:21:25.976554');
INSERT INTO `django_session` VALUES ('660oq9fxtuielwf41viox7tkvtrx0484', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2019-12-31 08:46:27.481070');
INSERT INTO `django_session` VALUES ('b8i1zwkqdy9v9szizdqxmjv9thbhnqh9', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2020-01-01 13:51:29.250239');
INSERT INTO `django_session` VALUES ('dsmd1dlcr8smrex4uy81ne4tafy3kj30', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2020-01-02 13:53:39.621600');
INSERT INTO `django_session` VALUES ('dsudtoahaf2vn8n1hz70wazxtd39oej8', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2019-12-30 17:21:53.655484');
INSERT INTO `django_session` VALUES ('g8zg7uuyrll5dt9r3ko9co5oviouaqqb', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2019-12-28 20:41:57.788323');
INSERT INTO `django_session` VALUES ('h56s3hw58scw3l7wucwflgy3j5crrqh2', 'NDI1MjFlZWVjNjcxMjY0ZDI2YjQ4MDIzZWFkZWJjOTdkNDgyOTc0Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYjAxOWZmYTIxYzMyMzZiNmQxNGMyNGEwM2Y3MDBjYmY1ODJlNDNmIn0=', '2020-01-10 11:34:56.178531');
INSERT INTO `django_session` VALUES ('jlezq85jwhdvl1ru2uwx3iaiy258tb7z', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2020-03-22 15:26:15.745263');
INSERT INTO `django_session` VALUES ('jrlyg86hu0vg27ou0miywlxu1x0od44k', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2020-02-23 15:01:08.026940');
INSERT INTO `django_session` VALUES ('ljg4wmp0ueu76d76ertxmn7qxvrf2j1d', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2019-12-25 22:30:20.339778');
INSERT INTO `django_session` VALUES ('mf86brop1ot0qg4gatozfhl94tvvev0n', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2020-01-01 11:32:14.930584');
INSERT INTO `django_session` VALUES ('mvavsr4hqlmf6siss5ozkiinqu17s5cd', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2019-12-28 21:53:35.410009');
INSERT INTO `django_session` VALUES ('ofy2bbfmkdvo73hjr47bb9gpbczczmeg', 'NDI1MjFlZWVjNjcxMjY0ZDI2YjQ4MDIzZWFkZWJjOTdkNDgyOTc0Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYjAxOWZmYTIxYzMyMzZiNmQxNGMyNGEwM2Y3MDBjYmY1ODJlNDNmIn0=', '2020-03-22 15:25:54.534933');
INSERT INTO `django_session` VALUES ('qgqijd0p8bcdjeyo5pot9jhzida9flcs', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2019-12-27 20:45:08.190358');
INSERT INTO `django_session` VALUES ('qyr1upzgt5z7vwdxhajbezgl9vmdpauo', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2020-01-01 13:55:26.455356');
INSERT INTO `django_session` VALUES ('rz9mh3bb904okjsqbxrbwl864vk6vq10', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2020-01-06 08:58:43.376306');
INSERT INTO `django_session` VALUES ('tvdkrcjenhjsecsyfnvu6dvp3ohcw0ps', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2020-01-21 15:26:31.484977');
INSERT INTO `django_session` VALUES ('v3p52hwp61hwvtpsuikuiphsoiys113b', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2020-01-08 17:25:11.190588');
INSERT INTO `django_session` VALUES ('wv9k1dmz6443ul39olkqydet1el56pgl', 'ZGZlZTY4ZDhiZDY4ODI4MDE3YTRjZTY0MWE3YjhiZWIyMDE3YTZlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzI0NDcxNzhiYWI4YWY2OTM0ZTRkMDk0ODJlYzU5N2MxOTY2MjA5In0=', '2020-01-13 17:17:15.940375');

-- ----------------------------
-- Table structure for `wsq_changecountrecord`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_changecountrecord`;
CREATE TABLE `wsq_changecountrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `old_count` int(11) NOT NULL,
  `real_count` int(11) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_changecountrecord
-- ----------------------------
INSERT INTO `wsq_changecountrecord` VALUES ('1', '4', '50', '12', '1', '2019-12-13 20:06:56.154632');
INSERT INTO `wsq_changecountrecord` VALUES ('2', '6', '0', '15', '1', '2019-12-21 15:18:03.743142');
INSERT INTO `wsq_changecountrecord` VALUES ('3', '2', '1088', '1000', '1', '2019-12-21 15:35:50.585704');
INSERT INTO `wsq_changecountrecord` VALUES ('4', '13', '0', '15', '1', '2019-12-25 11:15:18.935527');
INSERT INTO `wsq_changecountrecord` VALUES ('5', '7', '96', '106', '1', '2020-01-07 15:03:29.267024');
INSERT INTO `wsq_changecountrecord` VALUES ('6', '11', '8', '100520', '1', '2020-01-07 15:03:57.339331');
INSERT INTO `wsq_changecountrecord` VALUES ('7', '11', '100520', '10520', '1', '2020-01-07 15:04:05.880420');
INSERT INTO `wsq_changecountrecord` VALUES ('8', '6', '15', '10521', '1', '2020-01-07 15:04:12.885632');

-- ----------------------------
-- Table structure for `wsq_goods`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_goods`;
CREATE TABLE `wsq_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(15) NOT NULL,
  `average_price` double NOT NULL,
  `last_price` double NOT NULL,
  `add_people_id` int(11) NOT NULL,
  `update_date` date NOT NULL,
  `recent_sell` date DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_goods
-- ----------------------------
INSERT INTO `wsq_goods` VALUES ('1', '吗丁啉', '28', '28', '1', '2019-12-11', null, '0');
INSERT INTO `wsq_goods` VALUES ('2', '牛黄解毒片', '10.65', '10', '1', '2019-12-11', null, '0');
INSERT INTO `wsq_goods` VALUES ('3', '布洛芬', '8', '8', '1', '2019-12-12', null, '0');
INSERT INTO `wsq_goods` VALUES ('4', '999感冒灵', '10', '10', '1', '2019-12-12', null, '1');
INSERT INTO `wsq_goods` VALUES ('5', '脑白金', '258', '258', '2', '2019-12-16', null, '0');
INSERT INTO `wsq_goods` VALUES ('6', '脑1号', '59', '58', '1', '2019-12-21', null, '0');
INSERT INTO `wsq_goods` VALUES ('7', '六位地黄丸', '10', '10', '1', '2020-02-09', null, '0');
INSERT INTO `wsq_goods` VALUES ('8', '脑2号', '18', '18', '1', '2019-12-23', null, '0');
INSERT INTO `wsq_goods` VALUES ('9', '脑3号', '18', '18', '1', '2019-12-23', null, '1');
INSERT INTO `wsq_goods` VALUES ('10', '脑4号', '18', '18', '1', '2019-12-23', null, '1');
INSERT INTO `wsq_goods` VALUES ('11', '感康', '10', '10', '1', '2019-12-23', null, '0');
INSERT INTO `wsq_goods` VALUES ('12', '江中牌健胃消食片', '5', '5', '1', '2019-12-23', null, '0');
INSERT INTO `wsq_goods` VALUES ('13', '葵花牌健胃消食片', '6', '6', '1', '2020-01-06', null, '0');
INSERT INTO `wsq_goods` VALUES ('14', '新盖中盖高钙片', '89', '89', '2', '2019-12-25', null, '0');
INSERT INTO `wsq_goods` VALUES ('15', '板蓝根', '10', '10', '1', '2020-01-07', null, '0');
INSERT INTO `wsq_goods` VALUES ('16', '安神补脑液', '56', '56', '1', '2020-01-07', null, '0');
INSERT INTO `wsq_goods` VALUES ('17', '双黄连口服液', '25', '25', '1', '2020-01-07', null, '0');
INSERT INTO `wsq_goods` VALUES ('18', '感冒胶囊', '5', '5', '1', '2020-01-07', null, '0');

-- ----------------------------
-- Table structure for `wsq_goodsaddrecord`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_goodsaddrecord`;
CREATE TABLE `wsq_goodsaddrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `price` double NOT NULL,
  `inbound_channel_id` int(11) NOT NULL,
  `remark` longtext,
  `updater_id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_goodsaddrecord
-- ----------------------------
INSERT INTO `wsq_goodsaddrecord` VALUES ('1', '1', '1', '10', '28', '1', '', '1', '2019-12-12 21:56:59.635795');
INSERT INTO `wsq_goodsaddrecord` VALUES ('2', '4', '1', '50', '10', '1', '', '1', '2019-12-12 22:23:31.089947');
INSERT INTO `wsq_goodsaddrecord` VALUES ('3', '2', '1', '1000', '10', '1', '', '1', '2019-12-12 22:27:35.689320');
INSERT INTO `wsq_goodsaddrecord` VALUES ('4', '3', '1', '2000', '8', '1', '', '1', '2019-12-13 19:37:39.369074');
INSERT INTO `wsq_goodsaddrecord` VALUES ('5', '1', '1', '12', '28', '1', '', '1', '2019-12-16 15:26:28.973773');
INSERT INTO `wsq_goodsaddrecord` VALUES ('6', '5', '1', '100', '258', '1', '', '1', '2019-12-17 08:48:39.529004');
INSERT INTO `wsq_goodsaddrecord` VALUES ('7', '1', '1', '12', '28', '1', '111', '1', '2019-12-21 13:58:33.650087');
INSERT INTO `wsq_goodsaddrecord` VALUES ('8', '12', '1', '120', '5', '1', '', '1', '2019-12-23 09:12:54.990138');
INSERT INTO `wsq_goodsaddrecord` VALUES ('9', '7', '1', '100', '10', '1', '', '1', '2019-12-23 09:20:17.284878');
INSERT INTO `wsq_goodsaddrecord` VALUES ('10', '7', '1', '0', '10', '1', '', '2', '2019-12-25 11:41:46.830069');
INSERT INTO `wsq_goodsaddrecord` VALUES ('11', '7', '1', '0', '10', '1', '', '2', '2019-12-25 11:41:54.124272');
INSERT INTO `wsq_goodsaddrecord` VALUES ('12', '8', '1', '1000', '18', '1', '', '1', '2019-12-25 17:23:15.587905');
INSERT INTO `wsq_goodsaddrecord` VALUES ('13', '8', '1', '20000', '18', '1', '', '1', '2019-12-26 17:13:48.079724');
INSERT INTO `wsq_goodsaddrecord` VALUES ('14', '14', '1', '10520', '89', '1', '', '1', '2019-12-26 17:13:57.770596');
INSERT INTO `wsq_goodsaddrecord` VALUES ('15', '11', '1', '10', '10', '1', '', '2', '2020-01-03 17:23:47.934746');
INSERT INTO `wsq_goodsaddrecord` VALUES ('16', '7', '1', '155', '10', '1', '', '1', '2020-01-07 15:11:21.054479');

-- ----------------------------
-- Table structure for `wsq_goodsrecord`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_goodsrecord`;
CREATE TABLE `wsq_goodsrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `change_num` int(11) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_goodsrecord
-- ----------------------------
INSERT INTO `wsq_goodsrecord` VALUES ('1', '1', '1', '10', '1', '2019-12-12 21:56:59.558567');
INSERT INTO `wsq_goodsrecord` VALUES ('2', '1', '1', '-1', '1', '2019-12-12 21:57:56.130715');
INSERT INTO `wsq_goodsrecord` VALUES ('3', '4', '1', '50', '1', '2019-12-12 22:23:31.023185');
INSERT INTO `wsq_goodsrecord` VALUES ('4', '2', '1', '1000', '1', '2019-12-12 22:27:35.556148');
INSERT INTO `wsq_goodsrecord` VALUES ('5', '3', '1', '-1', '1', '2019-12-12 22:49:30.895006');
INSERT INTO `wsq_goodsrecord` VALUES ('6', '3', '1', '2000', '1', '2019-12-13 19:37:39.270101');
INSERT INTO `wsq_goodsrecord` VALUES ('7', '1', '1', '-1', '1', '2019-12-13 20:23:02.596182');
INSERT INTO `wsq_goodsrecord` VALUES ('8', '1', '1', '-1', '1', '2019-12-13 20:51:08.699224');
INSERT INTO `wsq_goodsrecord` VALUES ('9', '1', '1', '12', '1', '2019-12-16 15:26:28.939605');
INSERT INTO `wsq_goodsrecord` VALUES ('10', '3', '1', '-10', '1', '2019-12-16 17:05:48.072181');
INSERT INTO `wsq_goodsrecord` VALUES ('11', '5', '1', '100', '1', '2019-12-17 08:48:39.490111');
INSERT INTO `wsq_goodsrecord` VALUES ('12', '3', '1', '-1', '1', '2019-12-17 08:50:34.457096');
INSERT INTO `wsq_goodsrecord` VALUES ('13', '3', '1', '-200', '1', '2019-12-17 09:14:42.567176');
INSERT INTO `wsq_goodsrecord` VALUES ('14', '1', '1', '-3', '1', '2019-12-18 14:21:42.331969');
INSERT INTO `wsq_goodsrecord` VALUES ('15', '1', '1', '-1', '1', '2019-12-19 10:07:22.111142');
INSERT INTO `wsq_goodsrecord` VALUES ('16', '1', '1', '-1', '1', '2019-12-19 10:07:22.863244');
INSERT INTO `wsq_goodsrecord` VALUES ('17', '1', '1', '-1', '1', '2019-12-19 10:07:23.018825');
INSERT INTO `wsq_goodsrecord` VALUES ('18', '1', '1', '-1', '1', '2019-12-19 10:24:56.801048');
INSERT INTO `wsq_goodsrecord` VALUES ('19', '1', '1', '1', '1', '2019-12-19 10:41:19.902794');
INSERT INTO `wsq_goodsrecord` VALUES ('20', '3', '1', '-1', '1', '2019-12-19 11:06:49.573297');
INSERT INTO `wsq_goodsrecord` VALUES ('21', '3', '1', '-1', '1', '2019-12-19 11:21:14.768348');
INSERT INTO `wsq_goodsrecord` VALUES ('22', '5', '1', '-2', '1', '2019-12-19 11:24:28.113508');
INSERT INTO `wsq_goodsrecord` VALUES ('23', '3', '1', '-1', '1', '2019-12-19 11:39:24.956016');
INSERT INTO `wsq_goodsrecord` VALUES ('24', '1', '1', '-1', '1', '2019-12-19 14:55:40.252667');
INSERT INTO `wsq_goodsrecord` VALUES ('25', '1', '1', '12', '1', '2019-12-21 13:58:33.577279');
INSERT INTO `wsq_goodsrecord` VALUES ('26', '12', '1', '120', '1', '2019-12-23 09:12:54.940632');
INSERT INTO `wsq_goodsrecord` VALUES ('27', '7', '1', '100', '1', '2019-12-23 09:20:17.234444');
INSERT INTO `wsq_goodsrecord` VALUES ('28', '7', '1', '0', '2', '2019-12-25 11:41:46.721839');
INSERT INTO `wsq_goodsrecord` VALUES ('29', '7', '1', '0', '2', '2019-12-25 11:41:54.009578');
INSERT INTO `wsq_goodsrecord` VALUES ('30', '8', '1', '1000', '1', '2019-12-25 17:23:15.538652');
INSERT INTO `wsq_goodsrecord` VALUES ('31', '7', '1', '-1', '1', '2019-12-26 17:12:46.739970');
INSERT INTO `wsq_goodsrecord` VALUES ('32', '3', '1', '-1000', '1', '2019-12-26 17:13:38.436580');
INSERT INTO `wsq_goodsrecord` VALUES ('33', '8', '1', '20000', '1', '2019-12-26 17:13:48.042758');
INSERT INTO `wsq_goodsrecord` VALUES ('34', '14', '1', '10520', '1', '2019-12-26 17:13:57.717710');
INSERT INTO `wsq_goodsrecord` VALUES ('35', '14', '1', '-3000', '1', '2019-12-26 17:14:30.266617');
INSERT INTO `wsq_goodsrecord` VALUES ('36', '14', '1', '3000', '1', '2019-12-26 17:16:55.642484');
INSERT INTO `wsq_goodsrecord` VALUES ('37', '7', '1', '-1', '1', '2019-12-30 18:00:12.863352');
INSERT INTO `wsq_goodsrecord` VALUES ('38', '7', '1', '-2', '1', '2019-12-31 08:39:38.721267');
INSERT INTO `wsq_goodsrecord` VALUES ('39', '14', '1', '-4', '1', '2019-12-31 08:40:04.841509');
INSERT INTO `wsq_goodsrecord` VALUES ('40', '12', '1', '-2', '1', '2019-12-31 08:40:22.933438');
INSERT INTO `wsq_goodsrecord` VALUES ('41', '14', '1', '-2', '1', '2019-12-31 08:44:54.200576');
INSERT INTO `wsq_goodsrecord` VALUES ('42', '11', '1', '-1', '1', '2019-12-31 09:05:36.794931');
INSERT INTO `wsq_goodsrecord` VALUES ('43', '11', '1', '-1', '1', '2019-12-31 09:05:57.581593');
INSERT INTO `wsq_goodsrecord` VALUES ('44', '11', '1', '10', '2', '2020-01-03 17:23:47.869901');
INSERT INTO `wsq_goodsrecord` VALUES ('45', '7', '1', '155', '1', '2020-01-07 15:11:21.011354');
INSERT INTO `wsq_goodsrecord` VALUES ('46', '12', '1', '-50', '1', '2020-01-07 15:27:45.347887');
INSERT INTO `wsq_goodsrecord` VALUES ('47', '8', '1', '-100', '1', '2020-01-07 15:28:39.368632');
INSERT INTO `wsq_goodsrecord` VALUES ('48', '7', '1', '-12', '1', '2020-02-09 14:10:17.208033');
INSERT INTO `wsq_goodsrecord` VALUES ('49', '8', '1', '-100', '1', '2020-02-09 14:12:53.131672');
INSERT INTO `wsq_goodsrecord` VALUES ('50', '5', '1', '-2', '1', '2020-03-08 15:27:17.844005');

-- ----------------------------
-- Table structure for `wsq_goodsreturnrecord`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_goodsreturnrecord`;
CREATE TABLE `wsq_goodsreturnrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sell_record_id` int(11) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_goodsreturnrecord
-- ----------------------------
INSERT INTO `wsq_goodsreturnrecord` VALUES ('1', '7', '1', '2019-12-19 10:41:20.308708');
INSERT INTO `wsq_goodsreturnrecord` VALUES ('2', '15', '1', '2019-12-26 17:16:55.687333');

-- ----------------------------
-- Table structure for `wsq_goodssellrecord`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_goodssellrecord`;
CREATE TABLE `wsq_goodssellrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `sell_num` int(11) NOT NULL,
  `average_price` double NOT NULL,
  `sell_price` double NOT NULL,
  `customer` varchar(10) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `remark` longtext,
  `order_id` int(11) DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_goodssellrecord
-- ----------------------------
INSERT INTO `wsq_goodssellrecord` VALUES ('1', '1', '1', '1', '28', '39', '王帅强', '15836177296', '新乡学院', 'd02', null, '0', '1', '2019-12-12 21:57:56.573927');
INSERT INTO `wsq_goodssellrecord` VALUES ('2', '3', '1', '1', '8', '10', '', '', '', '', null, '0', '1', '2019-12-12 22:49:31.008092');
INSERT INTO `wsq_goodssellrecord` VALUES ('3', '1', '1', '1', '28', '25', '', '', '', '', null, '0', '1', '2019-12-13 20:23:02.698739');
INSERT INTO `wsq_goodssellrecord` VALUES ('4', '1', '1', '1', '28', '32', '李健', '12345678', '金穗大道', 'wsq', null, '0', '1', '2019-12-13 20:51:09.153088');
INSERT INTO `wsq_goodssellrecord` VALUES ('5', '3', '1', '10', '8', '20', 'hq', '110', '新乡学院', '111', null, '0', '1', '2019-12-16 17:05:48.137065');
INSERT INTO `wsq_goodssellrecord` VALUES ('6', '3', '1', '1', '8', '15', '', '', '', '', null, '0', '1', '2019-12-17 08:50:34.501977');
INSERT INTO `wsq_goodssellrecord` VALUES ('7', '1', '1', '1', '28', '11', '1', '1', '1', '1', null, '1', '1', '2019-12-19 10:24:56.874851');
INSERT INTO `wsq_goodssellrecord` VALUES ('8', '3', '1', '1', '8', '10', '11', '11', '11', '11', null, '0', '1', '2019-12-19 11:06:49.632139');
INSERT INTO `wsq_goodssellrecord` VALUES ('9', '3', '1', '1', '8', '10', 'ws', '1111111', '金城', '00', null, '0', '1', '2019-12-19 11:21:14.821275');
INSERT INTO `wsq_goodssellrecord` VALUES ('10', '5', '1', '2', '258', '300', '李萌', '12580', '唐人街1025号', '微信转账', null, '0', '1', '2019-12-19 11:24:28.178742');
INSERT INTO `wsq_goodssellrecord` VALUES ('11', '3', '1', '1', '8', '10', '', '', '', '', null, '0', '1', '2019-12-19 11:39:25.033807');
INSERT INTO `wsq_goodssellrecord` VALUES ('12', '1', '1', '1', '28', '20', '', '', '', '', null, '0', '1', '2019-12-19 14:55:40.318605');
INSERT INTO `wsq_goodssellrecord` VALUES ('13', '7', '1', '1', '10', '15', '丽美', '123', '哇', '', null, '0', '1', '2019-12-26 17:12:46.807756');
INSERT INTO `wsq_goodssellrecord` VALUES ('14', '3', '1', '1000', '8', '12', '', '', '', '', null, '0', '1', '2019-12-26 17:13:38.488566');
INSERT INTO `wsq_goodssellrecord` VALUES ('15', '14', '1', '3000', '89', '99', '王', '158', '金水', '1226\n', null, '1', '1', '2019-12-26 17:14:30.310503');
INSERT INTO `wsq_goodssellrecord` VALUES ('16', '7', '1', '1', '10', '12', '', '', '', '', null, '0', '1', '2019-12-30 18:00:12.949448');
INSERT INTO `wsq_goodssellrecord` VALUES ('17', '7', '1', '2', '10', '12', '', '', '', '', null, '0', '1', '2019-12-31 08:39:38.772748');
INSERT INTO `wsq_goodssellrecord` VALUES ('18', '14', '1', '4', '89', '99', '', '', '', '', null, '0', '1', '2019-12-31 08:40:04.896323');
INSERT INTO `wsq_goodssellrecord` VALUES ('19', '12', '1', '2', '5', '10', '王', '123', '', '', null, '0', '1', '2019-12-31 08:40:22.970747');
INSERT INTO `wsq_goodssellrecord` VALUES ('20', '14', '1', '2', '89', '99', '', '', '', '', null, '0', '1', '2019-12-31 08:44:54.239475');
INSERT INTO `wsq_goodssellrecord` VALUES ('21', '11', '1', '1', '10', '15', '', '', '', '', null, '0', '1', '2019-12-31 09:05:36.845236');
INSERT INTO `wsq_goodssellrecord` VALUES ('22', '11', '1', '1', '10', '12', '', '', '', '', null, '0', '1', '2019-12-31 09:05:57.621853');
INSERT INTO `wsq_goodssellrecord` VALUES ('23', '12', '1', '50', '5', '15', '', '', '', '', null, '0', '1', '2020-01-07 15:27:45.434656');
INSERT INTO `wsq_goodssellrecord` VALUES ('24', '8', '1', '100', '18', '88', '栗子', '135', '难掩路', '111', null, '0', '1', '2020-01-07 15:28:39.406531');
INSERT INTO `wsq_goodssellrecord` VALUES ('25', '7', '1', '12', '10', '18', '', '', '', '', null, '0', '1', '2020-02-09 14:10:17.483889');
INSERT INTO `wsq_goodssellrecord` VALUES ('26', '8', '1', '100', '18', '25', '孙丽丽', '158', '', '', null, '0', '1', '2020-02-09 14:12:53.253569');
INSERT INTO `wsq_goodssellrecord` VALUES ('27', '5', '1', '2', '258', '99', '', '', '', '', null, '0', '1', '2020-03-08 15:27:18.313935');

-- ----------------------------
-- Table structure for `wsq_goodsshop`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_goodsshop`;
CREATE TABLE `wsq_goodsshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `remain` int(11) NOT NULL,
  `last_updater_id` int(11) NOT NULL,
  `last_update_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_goodsshop
-- ----------------------------
INSERT INTO `wsq_goodsshop` VALUES ('1', '1', '1', '124', '1', '2019-12-21 13:58:33.610364');
INSERT INTO `wsq_goodsshop` VALUES ('2', '2', '1', '1000', '1', '2019-12-21 15:35:50.667451');
INSERT INTO `wsq_goodsshop` VALUES ('3', '3', '1', '785', '1', '2019-12-26 17:13:38.471490');
INSERT INTO `wsq_goodsshop` VALUES ('4', '4', '1', '12', '1', '2019-12-13 20:06:56.545998');
INSERT INTO `wsq_goodsshop` VALUES ('5', '5', '1', '96', '2', '2020-03-08 15:27:18.284034');
INSERT INTO `wsq_goodsshop` VALUES ('6', '6', '1', '10521', '1', '2020-01-07 15:04:12.990352');
INSERT INTO `wsq_goodsshop` VALUES ('7', '7', '1', '249', '1', '2020-02-09 14:10:17.399173');
INSERT INTO `wsq_goodsshop` VALUES ('8', '8', '1', '20800', '1', '2020-02-09 14:12:53.213588');
INSERT INTO `wsq_goodsshop` VALUES ('9', '9', '1', '0', '1', '2019-12-23 08:42:57.970105');
INSERT INTO `wsq_goodsshop` VALUES ('10', '10', '1', '0', '1', '2019-12-23 08:48:01.968498');
INSERT INTO `wsq_goodsshop` VALUES ('11', '11', '1', '10520', '1', '2020-01-07 15:04:05.897629');
INSERT INTO `wsq_goodsshop` VALUES ('12', '12', '1', '68', '1', '2020-01-07 15:27:45.385790');
INSERT INTO `wsq_goodsshop` VALUES ('13', '13', '1', '15', '1', '2019-12-25 11:15:19.088184');
INSERT INTO `wsq_goodsshop` VALUES ('14', '14', '1', '10514', '2', '2019-12-31 08:44:54.221969');
INSERT INTO `wsq_goodsshop` VALUES ('15', '15', '1', '0', '1', '2020-01-07 15:38:51.134745');
INSERT INTO `wsq_goodsshop` VALUES ('16', '16', '1', '0', '1', '2020-01-07 15:39:17.664442');
INSERT INTO `wsq_goodsshop` VALUES ('17', '17', '1', '0', '1', '2020-01-07 15:39:46.627975');
INSERT INTO `wsq_goodsshop` VALUES ('18', '18', '1', '0', '1', '2020-01-07 15:40:12.297272');

-- ----------------------------
-- Table structure for `wsq_inboundchannel`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_inboundchannel`;
CREATE TABLE `wsq_inboundchannel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_inboundchannel
-- ----------------------------
INSERT INTO `wsq_inboundchannel` VALUES ('1', '农业路批发市场', '15836177296');

-- ----------------------------
-- Table structure for `wsq_order`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_order`;
CREATE TABLE `wsq_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `customer` varchar(10) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `remark` longtext,
  `all_price` double NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_order
-- ----------------------------
INSERT INTO `wsq_order` VALUES ('3', '20191219145540', '', '', '', '', '20', '1', '1', '2019-12-19 14:55:40.344893');
INSERT INTO `wsq_order` VALUES ('4', '20191226171246', '丽美', '123', '哇', '', '15', '0', '1', '2019-12-26 17:12:46.824711');
INSERT INTO `wsq_order` VALUES ('5', '20191226171338', '', '', '', '', '12', '0', '1', '2019-12-26 17:13:38.505770');
INSERT INTO `wsq_order` VALUES ('6', '20191226171430', '王', '158', '金水', '1226\n', '99', '1', '1', '2019-12-26 17:14:30.344409');
INSERT INTO `wsq_order` VALUES ('7', '20191230180012', '', '', '', '', '12', '0', '1', '2019-12-30 18:00:12.970352');
INSERT INTO `wsq_order` VALUES ('8', '20191231083938', '', '', '', '', '12', '0', '1', '2019-12-31 08:39:38.788705');
INSERT INTO `wsq_order` VALUES ('9', '20191231084004', '', '', '', '', '99', '0', '1', '2019-12-31 08:40:04.929697');
INSERT INTO `wsq_order` VALUES ('10', '20191231084022', '王', '123', '', '', '10', '0', '1', '2019-12-31 08:40:22.987465');
INSERT INTO `wsq_order` VALUES ('11', '20191231084454', '', '', '', '', '99', '0', '1', '2019-12-31 08:44:54.255341');
INSERT INTO `wsq_order` VALUES ('12', '20191231090536', '', '', '', '', '15', '0', '1', '2019-12-31 09:05:36.864730');
INSERT INTO `wsq_order` VALUES ('13', '20191231090557', '', '', '', '', '12', '1', '1', '2019-12-31 09:05:57.679700');
INSERT INTO `wsq_order` VALUES ('14', '20200107152745', '', '', '', '', '15', '0', '1', '2020-01-07 15:27:45.451610');
INSERT INTO `wsq_order` VALUES ('15', '20200107152839', '栗子', '135', '难掩路', '111', '88', '0', '1', '2020-01-07 15:28:39.423580');
INSERT INTO `wsq_order` VALUES ('16', '20200209141017', '', '', '', '', '18', '0', '1', '2020-02-09 14:10:17.558861');
INSERT INTO `wsq_order` VALUES ('17', '20200209141253', '孙丽丽', '158', '', '', '25', '0', '1', '2020-02-09 14:12:53.292321');
INSERT INTO `wsq_order` VALUES ('18', '20200308152718', '', '', '', '', '99', '0', '1', '2020-03-08 15:27:18.362796');

-- ----------------------------
-- Table structure for `wsq_othercost`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_othercost`;
CREATE TABLE `wsq_othercost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purpose` varchar(10) NOT NULL,
  `price` double NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_othercost
-- ----------------------------
INSERT INTO `wsq_othercost` VALUES ('1', '会员折扣', '20', '0', '1', '2019-12-18 14:23:34.080272');

-- ----------------------------
-- Table structure for `wsq_refundrecord`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_refundrecord`;
CREATE TABLE `wsq_refundrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_record_id` int(11) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_refundrecord
-- ----------------------------
INSERT INTO `wsq_refundrecord` VALUES ('1', '3', '1', '2019-12-13 20:24:00.773883');
INSERT INTO `wsq_refundrecord` VALUES ('2', '6', '1', '2019-12-17 08:51:06.759864');

-- ----------------------------
-- Table structure for `wsq_shop`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_shop`;
CREATE TABLE `wsq_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `principal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_shop
-- ----------------------------
INSERT INTO `wsq_shop` VALUES ('1', '惠民药店', '1');

-- ----------------------------
-- Table structure for `wsq_transferrecord`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_transferrecord`;
CREATE TABLE `wsq_transferrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_shop_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `remark` longtext NOT NULL,
  `updater_id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_transferrecord
-- ----------------------------
INSERT INTO `wsq_transferrecord` VALUES ('2', '3', '1', '3', '1', '1', '2019-12-18 14:21:42.391623');

-- ----------------------------
-- Table structure for `wsq_transfershop`
-- ----------------------------
DROP TABLE IF EXISTS `wsq_transfershop`;
CREATE TABLE `wsq_transfershop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wsq_transfershop
-- ----------------------------
INSERT INTO `wsq_transfershop` VALUES ('3', '1号仓', '18565232128');
