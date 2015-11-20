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

-- 导出 pmsonline 的数据库结构
CREATE DATABASE IF NOT EXISTS `pmsonline` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pmsonline`;


-- 导出  表 pmsonline.t_project 结构
CREATE TABLE IF NOT EXISTS `t_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '' COMMENT '名称',
  `creater_id` varchar(50) DEFAULT '' COMMENT '创建人',
  `creater_name` varchar(20) DEFAULT '' COMMENT '创建人',
  `description` varchar(2000) DEFAULT '' COMMENT '描述',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '时间',
  `start_date` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_date` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `uuid` varchar(50) DEFAULT '' COMMENT '编号',
  `type1` varchar(50) DEFAULT '' COMMENT '项目类型',
  `phase` varchar(50) DEFAULT '' COMMENT '阶段',
  `status` varchar(50) DEFAULT '' COMMENT '状态',
  `step` varchar(50) DEFAULT '' COMMENT '步骤',
  `case_uuid` varchar(50) DEFAULT '' COMMENT '关联',
  `object_type` varchar(50) DEFAULT '' COMMENT '对象类型',
  `security` varchar(50) DEFAULT '' COMMENT '权限',
  `org` varchar(50) DEFAULT '' COMMENT '组织',
  `tags` varchar(500) DEFAULT '' COMMENT '分类',
  `tenant_id` bigint(20) DEFAULT '0',
  `priority` int(11) DEFAULT '1' COMMENT '项目优先级',
  `phase_status` varchar(50) DEFAULT '' COMMENT '项目阶段状态',
  `code` varchar(50) DEFAULT '' COMMENT '项目编号',
  `project_level` varchar(50) DEFAULT '' COMMENT '项目级别',
  `product_line` varchar(50) DEFAULT '' COMMENT '归属产品线',
  `use_dept` varchar(50) DEFAULT '' COMMENT '归属业务部门',
  `want_online_time` datetime DEFAULT NULL COMMENT '业务期望上线时间',
  `plan_online_time` datetime DEFAULT NULL COMMENT '预计上线时间',
  `plan_start_time` datetime DEFAULT NULL COMMENT '计划开始时间',
  `plan_end_time` datetime DEFAULT NULL COMMENT '计划结束时间',
  `want_setup_time` datetime DEFAULT NULL COMMENT '预计立项时间',
  `total_workday` int(11) DEFAULT '0' COMMENT '项目预估总人天',
  `test_report` varchar(3000) DEFAULT NULL COMMENT '项目测试结论',
  `value_analyze` varchar(3000) DEFAULT '' COMMENT '业务价值分析',
  `problem_solution` varchar(3000) DEFAULT '' COMMENT '遗留问题及方案',
  `plan_workday` int(11) DEFAULT '0' COMMENT '计划公时',
  `risk` varchar(3000) DEFAULT '' COMMENT '风险',
  `plan` varchar(3000) DEFAULT '' COMMENT '下周计划',
  `done` varchar(3000) DEFAULT '' COMMENT '已经完成',
  `risk_status` varchar(30) DEFAULT '' COMMENT '预警状态',
  `deleted` varchar(30) DEFAULT '' COMMENT '删除',
  `privacy` varchar(30) DEFAULT '' COMMENT '隐私状态',
  `iwork_code` varchar(100) DEFAULT '' COMMENT '接口',
  `param1` varchar(50) DEFAULT '' COMMENT '参数1',
  `param2` varchar(50) DEFAULT '' COMMENT '参数2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='项目';

-- 正在导出表  pmsonline.t_project 的数据：~24 rows (大约)
DELETE FROM `t_project`;
/*!40000 ALTER TABLE `t_project` DISABLE KEYS */;
INSERT INTO `t_project` (`id`, `name`, `creater_id`, `creater_name`, `description`, `create_date`, `start_date`, `end_date`, `uuid`, `type1`, `phase`, `status`, `step`, `case_uuid`, `object_type`, `security`, `org`, `tags`, `tenant_id`, `priority`, `phase_status`, `code`, `project_level`, `product_line`, `use_dept`, `want_online_time`, `plan_online_time`, `plan_start_time`, `plan_end_time`, `want_setup_time`, `total_workday`, `test_report`, `value_analyze`, `problem_solution`, `plan_workday`, `risk`, `plan`, `done`, `risk_status`, `deleted`, `privacy`, `iwork_code`, `param1`, `param2`) VALUES
	(1, '张龙测试_产品', '201406241237574868672d', '张龙', NULL, '2015-08-25 15:30:13', NULL, NULL, '8819d84e238a4749a1c6439bff20432c', 'rearch', 'after', 'close', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 'close', 'P86', NULL, 'crm', '', '2015-08-13 00:00:00', '2015-08-29 00:00:00', NULL, NULL, '2015-08-26 00:00:00', 20, '{"result":"fail","desc":"非法请求"}', '哈哈', 'ok', 0, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '张龙,'),
	(2, '周报', '20140211151832537df7ba', '张岩', NULL, '2015-08-25 15:33:37', NULL, NULL, '700da04e229b4f50b80ddfd36064a157', 'normal', 'start', 'open', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P87', NULL, 'crm', '信息系统部企业系统研发部,', '2015-08-31 00:00:00', '2015-08-31 00:00:00', NULL, NULL, '2015-08-31 00:00:00', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'XXXT-5306', '李飞,', ''),
	(3, '张龙测试——产品2', '201406241237574868672d', '张龙', NULL, '2015-08-25 15:45:49', NULL, NULL, '12268596f6de46ecae483f5c972193da', NULL, 'start', 'open', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P88', NULL, 'crm', '', '2015-08-29 00:00:00', '2015-08-26 00:00:00', NULL, NULL, '2015-08-27 00:00:00', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
	(4, '张龙开发项目1', '201406241237574868672d', '张龙', NULL, '2015-08-25 16:37:38', NULL, NULL, 'cf00e559968b448788b8d667a2e21a0b', 'rearch', 'product', 'open', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P89', NULL, 'order', '信息系统部运营管理部,运营管理部,', '2015-08-26 00:00:00', '2015-08-26 00:00:00', NULL, NULL, '2015-08-25 00:00:00', 100, 'cesdddddddd', 'cessss', 'dddd', 0, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
	(5, '中国第一项目', '201406241237574868672d', '张龙', NULL, '2015-09-04 16:58:27', NULL, NULL, 'c550c8869c0a4edba45a1f9031b701de', NULL, 'start', 'open', NULL, '45873ab4-eb3f-4f65-ae3c-cbb8a437e802', NULL, NULL, NULL, NULL, 0, 0, '0', '2015-10202', NULL, '', '', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
	(6, '8-2日PMS测试', '201402251410301e74320b', '吴江', NULL, '2015-08-28 11:19:35', NULL, NULL, 'f7a3a705ee174526a9576dae1ac59a58', 'normal', 'after', 'open', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P91', NULL, 'hunda', '', '2015-08-31 00:00:00', '2015-08-27 00:00:00', NULL, NULL, '2015-08-05 00:00:00', 100, 'hidd很好啊<script>alert(\'hello world\')</script>', '很好啊<script>alert(\'hello world\')</script>', '不错\n真的很好啊<script>alert(\'hello world\')</script>', 0, NULL, NULL, NULL, NULL, NULL, NULL, '1111111111111', '', ''),
	(7, '吴江的最新测试2015-8-28', '201402251410301e74320b', '吴江', NULL, '2015-08-28 17:13:34', NULL, NULL, '0527167a408347a2b55f31a10f0d6231', 'normal', 'start', 'delete', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P92', NULL, 'order', '', '2015-08-31 00:00:00', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
	(8, '吴江的项目测试1111-122-22', '201402251410301e74320b', '吴江', NULL, '2015-08-28 17:23:58', NULL, NULL, 'b3155cf7d44846e9bb4619aa4817cb7a', 'normal', 'start', 'delete', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P93', NULL, 'order', '营销中心', '2015-08-31 00:00:00', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '田爽,', '吴江,'),
	(9, '项目管理文档', '201402251410301e74320b', '吴江', NULL, '2015-08-28 18:00:26', NULL, NULL, '8fdd0bca9b8a4324b8b8337b8c53d9e3', 'normal', 'start', 'open', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P94', NULL, 'order', '', '2015-08-27 00:00:00', '2015-08-05 00:00:00', NULL, NULL, NULL, 0, NULL, '啊啊啊', '大胆', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
	(10, 'pms8-31日测试', '201402251410301e74320b', '吴江', NULL, '2015-08-31 10:30:10', NULL, NULL, 'f49fba1395874bd688f0071392d43eeb', 'normal', 'close', 'open', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '1', 'P95', NULL, 'order', '人力资源部,信息系统部运营管理部,运营管理部,运营管理部,运营管理部,运营管理部,运营管理部,', '2015-08-27 00:00:00', '2015-09-02 00:00:00', NULL, NULL, '2015-08-18 00:00:00', 0, NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, '', '贺延警,贺延警,贺延警,贺延警,贺延警,贺延警,贺延警,', '吴江,吴江,吴江,吴江,吴江,吴江,吴江,'),
	(11, '策划四系统大 ', '201402251410301e74320b', '吴江', NULL, '2015-08-31 14:12:45', NULL, NULL, '9c8b473169fd4af786a35d1168d46f20', 'normal', 'tech', 'close', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P96', NULL, 'hunda', '人力资源部,信息系统部运营管理部,', '2015-08-31 00:00:00', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
	(12, '张测试项目名称项目名称项目名称项目名称项目名称项目名称项目名称项目名称项目名称', '201406241237574868672d', '张龙', NULL, '2015-08-31 15:15:16', NULL, NULL, '3bc8294876bb4c2998ebc9fd105f8dd4', 'normal', 'start', 'delete', NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, '0', 'P97', NULL, 'hunda', '房产事业群沈阳二手房,', '2015-08-31 00:00:00', '2015-08-31 00:00:00', NULL, NULL, '2015-08-26 00:00:00', 0, NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, '', '沈阳,', '张龙,'),
	(13, 'PMO test', '201506301524002941a9ac', '田爽', NULL, '2015-08-31 17:44:52', NULL, NULL, 'bd6919e5b85f4f0b80d9a63476b6367b', 'normal', 'after', 'close', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '1', 'P98', NULL, 'hunda', '信息系统部运营管理部,运营管理部,运营管理部,运营管理部,运营管理部,运营管理部,运营管理部,', '2015-09-01 00:00:00', '2015-09-02 00:00:00', NULL, NULL, '2015-07-29 00:00:00', 88, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1111122', '', ''),
	(14, '张岩123', '20140211151832537df7ba', '张岩', NULL, '2015-08-31 20:03:16', NULL, NULL, '70de5f6409a047318c7a6de8c6d34297', 'normal', 'start', 'open', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P99', NULL, 'hunda', '', '2015-09-10 00:00:00', '2015-09-11 00:00:00', NULL, NULL, '2015-08-31 00:00:00', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
	(15, '张岩456', '20140211151832537df7ba', '张岩', NULL, '2015-08-31 20:28:45', NULL, NULL, '59b0fd7e913940a888c87f1619d3c565', 'normal', 'start', 'open', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P100', NULL, 'crm', '信息系统部,', '2015-09-15 00:00:00', '2015-09-30 00:00:00', NULL, NULL, '2015-09-03 00:00:00', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '', 'zhangyan123,', 'zhangyan123,'),
	(16, '建个项目', '201406241237574868672d', '张龙', NULL, '2015-09-01 11:04:50', NULL, NULL, 'ea2533fa31f74e4bbd7870155241b4ec', 'normal', 'after', 'open', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P101', NULL, 'crm', '信息系统部交易产品组,', '2015-09-01 00:00:00', '2015-09-30 00:00:00', NULL, NULL, '2015-09-01 00:00:00', 15, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '666', '王博,', '张龙,'),
	(17, 'vfvf', '2015031714484939d6b57c', '杨帆', NULL, '2015-09-01 14:30:00', NULL, NULL, '669da0832d5f444db2531739a4cfc523', 'normal', 'after', 'close', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P102', NULL, 'crm', '信息系统部测试部,测试部,', '2015-09-09 00:00:00', '2015-09-02 00:00:00', NULL, NULL, '2015-09-03 00:00:00', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '', '张岩,', '杨帆,'),
	(18, '中国第一项目', '201406241237574868672d', '张龙', NULL, '2015-09-04 16:51:47', NULL, NULL, 'd9f8eb27db4b4759abc773fb5005e110', 'normal', 'start', 'delete', NULL, '8cf4f761-7ebf-4e03-aefb-6ce81490f77d', NULL, NULL, NULL, NULL, 0, 0, '0', '2015-10202', NULL, 'crm', '分类信息事业群', '2015-09-30 00:00:00', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, '', ''),
	(19, '上线前测试项目', '2011110113323800ceff7e', '王颖', NULL, '2015-09-02 10:58:20', NULL, NULL, '1e83776d9d2b4b78870780da04392634', 'normal', 'after', 'close', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P104', NULL, 'other', '人力资源部,信息系统部订单系统部,订单系统部,', '2015-09-02 00:00:00', '2015-09-02 00:00:00', NULL, NULL, '2015-08-05 00:00:00', 0, '', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, '', '吴江,', '王颖,'),
	(20, '再整一个', '2015031714484939d6b57c', '杨帆', NULL, '2015-09-02 14:43:36', NULL, NULL, '13cea039df21446a93173c429a1ec6e5', 'normal', 'start', 'open', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '1', 'P105', NULL, 'hunda', '信息系统部测试部,', '2015-09-02 00:00:00', '2015-09-02 00:00:00', NULL, NULL, '2015-09-03 00:00:00', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '', '张岩,', '杨帆,'),
	(21, '正儿八经的整一个', '201508261353085ec3ddda', 'aa', NULL, '2015-09-02 15:56:22', NULL, NULL, '110435758ea645ab93a31d9f03678b70', 'normal', 'product', 'delete', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '1', 'P106', NULL, 'pay', 'aaaabb1,', '2015-09-02 00:00:00', '2015-09-02 00:00:00', NULL, NULL, '2015-09-03 00:00:00', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '', 'bb,', 'aa,'),
	(22, '正儿八经的整一个', '2015082613540517e95d5b', 'bb', NULL, '2015-09-02 16:46:39', NULL, NULL, 'b46738cce24c4ea59c36f75646457b2b', 'normal', 'after', 'close', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P107', NULL, 'hunda', 'aaaa,', '2015-09-03 00:00:00', '2015-09-03 00:00:00', NULL, NULL, '2015-09-03 00:00:00', 2, '2222', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '88', 'aa,', 'bb,'),
	(23, '666', '201406241237574868672d', '张龙', NULL, '2015-09-02 18:21:27', NULL, NULL, 'bc211d5ca6bc48548ef5222629eb0ed2', 'normal', 'start', 'open', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '0', 'P108', NULL, 'data', '', '2015-09-30 00:00:00', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'zhangyan123,', '张龙,'),
	(24, '中国第一项目', '', '', '', '2015-09-04 17:09:36', NULL, NULL, '', '', '', '', '', '6e54b948-1bf6-4dbc-a483-55335e557f93', '', '', '', '', 0, 0, '', '2015-10202', '', '', '', NULL, NULL, NULL, NULL, NULL, 0, NULL, '', '', 0, '', '', '', '', '', '', '', '', '');
/*!40000 ALTER TABLE `t_project` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
