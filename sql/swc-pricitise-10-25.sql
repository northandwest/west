-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.1.22-rc-community - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 food_order 的数据库结构
CREATE DATABASE IF NOT EXISTS `food_order` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `food_order`;


-- 导出  表 food_order.activity 结构
CREATE TABLE IF NOT EXISTS `activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `num_limit` int(11) DEFAULT '0' COMMENT '人数限制',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建',
  `place_name` varchar(100) DEFAULT '' COMMENT '活动场所',
  `place_id` int(11) DEFAULT '0' COMMENT '场所',
  `address` varchar(100) DEFAULT '' COMMENT '地址',
  `contract_name` varchar(20) DEFAULT '' COMMENT '联系人',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `creater_id` bigint(20) DEFAULT '0' COMMENT '创建人',
  `creater` varchar(20) DEFAULT '' COMMENT '创建人',
  `memo` varchar(200) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=gbk COMMENT='活动';

-- 正在导出表  food_order.activity 的数据：~9 rows (大约)
DELETE FROM `activity`;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` (`id`, `title`, `num_limit`, `start_time`, `create_time`, `place_name`, `place_id`, `address`, `contract_name`, `status`, `creater_id`, `creater`, `memo`) VALUES
	(19, '2015-10-25 20:13:31-半亩园', 0, NULL, '2015-10-25 20:13:31', '半亩园', 0, '', '', 0, 0, '', ''),
	(20, '2015-10-25 20:42:42-半亩园', 0, NULL, '2015-10-25 20:42:42', '半亩园', 0, '', '', 0, 0, '', '');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;


-- 导出  表 food_order.activity_order 结构
CREATE TABLE IF NOT EXISTS `activity_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) DEFAULT '0' COMMENT '活动',
  `user_id` bigint(20) DEFAULT '0' COMMENT '用户',
  `user_name` varchar(20) DEFAULT '' COMMENT '用户名',
  `tel` varchar(20) DEFAULT '' COMMENT '电话',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `nums` int(11) DEFAULT '0' COMMENT '数量',
  `master_id` int(11) DEFAULT '0' COMMENT '发起人',
  `create_time` datetime DEFAULT NULL COMMENT '时间',
  `content` varchar(500) DEFAULT '' COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk COMMENT='订单';

-- 正在导出表  food_order.activity_order 的数据：~1 rows (大约)
DELETE FROM `activity_order`;
/*!40000 ALTER TABLE `activity_order` DISABLE KEYS */;
INSERT INTO `activity_order` (`id`, `activity_id`, `user_id`, `user_name`, `tel`, `status`, `nums`, `master_id`, `create_time`, `content`) VALUES
	(1, 1, 4, '吴江', '', 0, 0, 0, '2015-10-25 08:59:37', '牛肉盖饭*1 可乐*2'),
	(2, 1, 5, '叶峰', '', 0, 0, 0, '2015-10-25 18:12:27', '牛肉盖饭*1 可乐*2');
/*!40000 ALTER TABLE `activity_order` ENABLE KEYS */;


-- 导出  表 food_order.activity_order_detail 结构
CREATE TABLE IF NOT EXISTS `activity_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) DEFAULT '0' COMMENT '活动',
  `order_id` bigint(20) DEFAULT '0' COMMENT '订单',
  `user_id` bigint(20) DEFAULT '0' COMMENT '用户',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户名称',
  `nums` int(11) DEFAULT '0' COMMENT '数量',
  `price` double DEFAULT '0' COMMENT '价格',
  `product_id` bigint(20) DEFAULT '0' COMMENT '商品编号',
  `product` varchar(50) DEFAULT '' COMMENT '商品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT COMMENT='订单';

-- 正在导出表  food_order.activity_order_detail 的数据：~1 rows (大约)
DELETE FROM `activity_order_detail`;
/*!40000 ALTER TABLE `activity_order_detail` DISABLE KEYS */;
INSERT INTO `activity_order_detail` (`id`, `activity_id`, `order_id`, `user_id`, `user_name`, `nums`, `price`, `product_id`, `product`) VALUES
	(1, 1, 0, 4, '', 1, 0, 0, '牛肉盖饭'),
	(2, 1, 0, 4, '', 2, 0, 0, '可乐'),
	(3, 1, 0, 5, '', 3, 0, 0, '可乐'),
	(4, 20, 0, 4, '', 1, 0, 0, '牛肉粉'),
	(5, 20, 0, 4, '', 2, 0, 0, '可乐');
/*!40000 ALTER TABLE `activity_order_detail` ENABLE KEYS */;


-- 导出  表 food_order.product 结构
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `typex` varchar(50) NOT NULL DEFAULT '' COMMENT '类型',
  `price` double NOT NULL DEFAULT '0' COMMENT '价格',
  `buy_count` int(11) NOT NULL DEFAULT '0' COMMENT '购买次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

-- 正在导出表  food_order.product 的数据：~0 rows (大约)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


-- 导出  表 food_order.shop 结构
CREATE TABLE IF NOT EXISTS `shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `contract_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系方式',
  `tel` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  ` create_time` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家';

-- 正在导出表  food_order.shop 的数据：0 rows
DELETE FROM `shop`;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;


-- 导出  表 food_order.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `real_name` varchar(20) DEFAULT '' COMMENT '真实姓名',
  `user_name` varchar(20) DEFAULT '' COMMENT '用户名',
  `email` varchar(50) DEFAULT '' COMMENT 'email',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机',
  `sex` varchar(6) DEFAULT '' COMMENT '性别',
  `city_id` int(11) DEFAULT '0' COMMENT '城市',
  `area_id` int(11) DEFAULT '0' COMMENT '的确',
  `reg_date` datetime DEFAULT NULL COMMENT '注册日期',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登陆时间',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员';

-- 正在导出表  food_order.users 的数据：~1 rows (大约)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `real_name`, `user_name`, `email`, `password`, `mobile`, `sex`, `city_id`, `area_id`, `reg_date`, `last_login_time`, `status`) VALUES
	(4, '吴江', 'xljwujiang', '', '', '', '', 0, 0, NULL, NULL, 0),
	(5, '叶峰', 'yefeng', '', '', '', '', 0, 0, NULL, NULL, 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
