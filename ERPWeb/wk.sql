-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-08-11 10:21:35
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wk`
--

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_action_log`
--

CREATE TABLE `5kcrm_action_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `action_name` varchar(100) NOT NULL,
  `param_name` varchar(100) DEFAULT NULL,
  `action_id` int(10) NOT NULL,
  `content` varchar(500) NOT NULL,
  `create_time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='操作日志表';

--
-- 转存表中的数据 `5kcrm_action_log`
--

INSERT INTO `5kcrm_action_log` (`log_id`, `role_id`, `module_name`, `action_name`, `param_name`, `action_id`, `content`, `create_time`) VALUES
(1, 1, 'leads', 'add', NULL, 1, '管理员admin在2018-07-08 11:35:35添加了id为1的线索。', 1531020935),
(2, 1, 'user', 'add', NULL, 2, '管理员admin在2018-08-11 11:32:48添加了id为2的员工。', 1533958368),
(3, 1, 'user', 'add', NULL, 3, '管理员admin在2018-08-11 11:33:13添加了id为3的员工。', 1533958393),
(4, 1, 'user', 'add', NULL, 4, '管理员admin在2018-08-11 11:33:30添加了id为4的员工。', 1533958410),
(5, 1, 'user', 'edit', NULL, 3, '管理员admin在2018-08-11 11:34:41修改了id为3的员工。', 1533958481),
(6, 1, 'user', 'edit', NULL, 3, '管理员admin在2018-08-11 11:36:12修改了id为3的员工。', 1533958572);

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_announcement`
--

CREATE TABLE `5kcrm_announcement` (
  `announcement_id` int(10) NOT NULL COMMENT '文章id',
  `order_id` int(10) NOT NULL COMMENT '排序',
  `role_id` int(10) NOT NULL COMMENT '发表人岗位',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(10) NOT NULL COMMENT '发表时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `color` varchar(50) NOT NULL,
  `department` varchar(100) NOT NULL COMMENT '通知部门id',
  `status` int(1) NOT NULL COMMENT '是否发布1发布2停用',
  `isshow` int(1) NOT NULL DEFAULT '0' COMMENT '是否公开1是0否'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='存放知识文章信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_business`
--

CREATE TABLE `5kcrm_business` (
  `business_id` int(10) NOT NULL COMMENT '商机id',
  `name` varchar(255) NOT NULL DEFAULT '',
  `origin` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(200) NOT NULL,
  `estimate_price` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者岗位',
  `owner_role_id` int(10) NOT NULL COMMENT '所有者岗位',
  `gain_rate` int(3) NOT NULL COMMENT '赢单率(百分比)',
  `total_amount` int(10) NOT NULL COMMENT '产品总数',
  `subtotal_val` float(9,2) NOT NULL COMMENT '小计和',
  `discount_price` float(9,2) NOT NULL COMMENT '其他费用',
  `sales_price` float(9,2) NOT NULL COMMENT '成交价',
  `due_date` int(10) NOT NULL COMMENT '预计成交日期',
  `create_time` int(10) NOT NULL COMMENT '商机创建时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间',
  `update_role_id` int(10) NOT NULL,
  `status_id` int(10) NOT NULL COMMENT '商机状态id',
  `total_price` float(10,2) NOT NULL COMMENT '商机金额',
  `nextstep` varchar(100) NOT NULL COMMENT '下一步',
  `nextstep_time` int(10) NOT NULL,
  `is_deleted` int(1) NOT NULL COMMENT '是否删除',
  `delete_role_id` int(10) NOT NULL,
  `delete_time` int(10) NOT NULL COMMENT '删除时间',
  `contacts_id` int(10) NOT NULL COMMENT '商机联系人',
  `contract_address` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放商机相关信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_business_data`
--

CREATE TABLE `5kcrm_business_data` (
  `business_id` int(10) NOT NULL COMMENT '主键',
  `description` text NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商机数据表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_business_status`
--

CREATE TABLE `5kcrm_business_status` (
  `status_id` int(10) NOT NULL COMMENT '商机状态',
  `name` varchar(20) DEFAULT NULL COMMENT '商机状态名',
  `order_id` int(10) DEFAULT NULL COMMENT '顺序号',
  `is_end` int(1) NOT NULL,
  `description` varchar(200) DEFAULT NULL COMMENT '商机状态描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放商机状态信息';

--
-- 转存表中的数据 `5kcrm_business_status`
--

INSERT INTO `5kcrm_business_status` (`status_id`, `name`, `order_id`, `is_end`, `description`) VALUES
(1, '深度沟通', 3, 0, '已经约见，并且报价'),
(2, '初步沟通', 2, 0, '已进行初步沟通网站建设事宜，可能约见'),
(3, '意向客户', 1, 0, '通过沟通近期有做网站的需求'),
(5, '签订合同', 5, 0, '签订合同'),
(6, '设计制作', 6, 0, '制作中'),
(7, '制作完成', 7, 0, '制作完成待收款'),
(99, '项目失败', 99, 1, '项目失败'),
(100, '项目成功', 100, 1, '项目成功');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_business_status_flow`
--

CREATE TABLE `5kcrm_business_status_flow` (
  `flow_id` int(10) NOT NULL COMMENT '状态流id',
  `name` varchar(50) NOT NULL COMMENT '状态流名字',
  `data` text NOT NULL COMMENT '状态流数据',
  `in_use` int(1) NOT NULL COMMENT '是否在用',
  `description` varchar(200) NOT NULL COMMENT '状态流描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_comment`
--

CREATE TABLE `5kcrm_comment` (
  `comment_id` int(10) NOT NULL COMMENT '评论id',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `creator_role_id` int(10) NOT NULL COMMENT '评论人',
  `to_role_id` int(10) NOT NULL COMMENT '被评论人',
  `module` varchar(50) NOT NULL COMMENT '模块',
  `module_id` int(10) NOT NULL COMMENT '模块id',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_config`
--

CREATE TABLE `5kcrm_config` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `value` text NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `5kcrm_config`
--

INSERT INTO `5kcrm_config` (`id`, `name`, `value`, `description`) VALUES
(1, 'defaultinfo', 'a:8:{s:4:"name";s:9:"悟空CRM";s:11:"description";s:39:"开源免费的客户关系管理系统";s:5:"state";s:9:"河南省";s:4:"city";s:9:"郑州市";s:15:"allow_file_type";s:40:"pdf,doc,jpg,png,gif,txt,doc,xls,zip,docx";s:19:"contract_alert_time";i:30;s:10:"task_model";s:1:"2";s:4:"logo";N;}', ''),
(2, 'customer_outdays', '30', '客户设置放入客户吃天数'),
(3, 'customer_limit_condition', 'day', '客户池领取条件限制 day：今日 week： 本周 month：本月'),
(4, 'customer_limit_counts', '10', '客户池领取次数限制'),
(5, 'leads_outdays', '30', '线索超出天数放入客户池');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_contacts`
--

CREATE TABLE `5kcrm_contacts` (
  `contacts_id` int(10) NOT NULL COMMENT '联系人id',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者岗位id',
  `name` varchar(50) NOT NULL COMMENT '联系人姓名',
  `post` varchar(20) NOT NULL COMMENT '客户联系人岗位',
  `department` varchar(20) NOT NULL COMMENT '客户联系人部门',
  `sex` int(1) NOT NULL COMMENT '联系人性别',
  `saltname` varchar(20) NOT NULL COMMENT '称呼',
  `telephone` varchar(20) NOT NULL COMMENT '联系人电话',
  `email` varchar(50) NOT NULL COMMENT '联系人邮箱',
  `qq_no` varchar(50) NOT NULL COMMENT 'qq',
  `address` varchar(50) NOT NULL COMMENT '联系地址',
  `zip_code` varchar(20) NOT NULL COMMENT '邮编',
  `description` varchar(100) NOT NULL COMMENT '联系人信息备注',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '信息更新时间',
  `is_deleted` int(1) NOT NULL COMMENT '是否被删除',
  `delete_role_id` int(10) NOT NULL,
  `delete_time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放客户联系人对应关系信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_contract`
--

CREATE TABLE `5kcrm_contract` (
  `contract_id` int(10) NOT NULL COMMENT 'id',
  `number` varchar(50) NOT NULL COMMENT '编号',
  `business_id` int(10) NOT NULL COMMENT '商机',
  `price` decimal(10,2) NOT NULL COMMENT '总价',
  `due_time` int(10) NOT NULL COMMENT '签约日期',
  `owner_role_id` int(10) NOT NULL COMMENT '负责人',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者',
  `content` text NOT NULL COMMENT '合同内容',
  `description` varchar(500) NOT NULL COMMENT '描述',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `start_date` int(10) NOT NULL COMMENT '生效时间',
  `end_date` int(10) NOT NULL COMMENT '到期时间',
  `status` varchar(20) NOT NULL COMMENT '合同状态',
  `is_deleted` int(1) NOT NULL COMMENT '是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='合同表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_control`
--

CREATE TABLE `5kcrm_control` (
  `control_id` int(10) NOT NULL COMMENT '操作id',
  `module_id` int(10) NOT NULL COMMENT '模块id',
  `name` varchar(20) NOT NULL COMMENT '操作名',
  `m` varchar(20) NOT NULL COMMENT '对应Action',
  `a` varchar(20) NOT NULL COMMENT '行为',
  `parameter` varchar(50) NOT NULL COMMENT '参数',
  `description` varchar(200) NOT NULL COMMENT '操作描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放操作信息';

--
-- 转存表中的数据 `5kcrm_control`
--

INSERT INTO `5kcrm_control` (`control_id`, `module_id`, `name`, `m`, `a`, `parameter`, `description`) VALUES
(1, 1, 'crm面板操作', 'index', 'index', '', 'CRM系统面板'),
(2, 7, '修改个人信息', 'User', 'edit', '', '是的法士大夫地方'),
(4, 7, '添加用户', 'User', 'add', '', ''),
(78, 7, '删除员工', 'User', 'delete', '', ''),
(6, 7, '添加部门', 'User', 'department_add', '', ''),
(7, 7, '修改部门', 'User', 'department_edit', '', ''),
(8, 7, '删除部门', 'User', 'department_delete', '', ''),
(9, 7, '添加岗位', 'User', 'role_add', '', ''),
(10, 7, '修改岗位', 'User', 'role_edit', '', ''),
(11, 7, '删除岗位', 'User', 'role_delete', '', ''),
(12, 2, '添加商机', 'Business', 'add', '', ''),
(34, 2, '完整商机信息', 'Business', 'view', '', ''),
(13, 2, '修改商机', 'Business', 'edit', '', ''),
(14, 2, '删除商机', 'Business', 'delete', '', ''),
(15, 2, '添加商机日志', 'Business', 'addLogging', '', ''),
(16, 2, '修改商机日志', 'Business', 'eidtLogging', '', ''),
(17, 2, '删除商机日志', 'Business', 'deleteLogging', '', ''),
(18, 1, '用户登录', 'User', 'login', '', ''),
(19, 1, '用户注册', 'User', 'register', '', ''),
(20, 1, '退出', 'User', 'logout', '', ''),
(21, 7, '查看部门信息', 'User', 'department', '', ''),
(22, 1, '找回密码', 'User', 'lostPW', '', ''),
(23, 1, '重置密码', 'User', 'lostpw_reset', '', ''),
(24, 7, '查看员工信息', 'User', 'index', '', ''),
(25, 7, '查看岗位信息', 'User', 'role', '', ''),
(26, 7, '岗位分配', 'User', 'user_role_relation', '', ''),
(27, 7, '员工资料修改', 'User', 'editUsers', '', ''),
(28, 1, '查看我的日志', 'User', 'mylog', '', ''),
(60, 6, '岗位授权', 'Permission', 'authorize', '', ''),
(30, 7, '个人日志详情', 'User', 'mylog_view', '', ''),
(31, 7, '删除个人日志', 'User', 'mylog_delete', '', ''),
(32, 2, '查看商机信息', 'Business', 'index', '', ''),
(33, 2, '查看商机日志', 'Business', 'logging', '', ''),
(35, 3, '产品列表', 'product', 'index', '', ''),
(36, 3, '添加产品', 'Product', 'add', '', ''),
(37, 3, '修改产品信息', 'product', 'edit', '', ''),
(38, 3, '删除产品', 'Product', 'delete', '', ''),
(39, 3, '查看产品分类信息', 'Product', 'category', '', ''),
(40, 3, '添加产品分类', 'Product', 'category_add', '', ''),
(41, 3, '删除产品分类', 'Product', 'deleteCategory', '', ''),
(42, 3, '修改产品分类', 'Product', 'editcategory', '', ''),
(43, 3, '产品销量统计', 'Product', 'count', '', ''),
(44, 5, '查看客户信息', 'Customer', 'customerView', '', ''),
(45, 5, '添加客户', 'Customer', 'add', '', ''),
(46, 5, '修改客户信息', 'Customer', 'edit', '', ''),
(47, 5, '删除客户', 'Customer', 'delete', '', ''),
(48, 5, '添加客户联系人', 'Contacts', 'add', '', ''),
(49, 5, '查看客户联系人', 'Contacts', 'view', '', ''),
(50, 5, '删除客户联系人', 'Contacts', 'delete', '', ''),
(51, 5, '修改客户联系人', 'Contacts', 'edit', '', ''),
(52, 6, '查看操作模块', 'Permission', 'module', '', ''),
(53, 6, '修改操作模块', 'Permission', 'module_edit', '', ''),
(54, 6, '添加操作模块信息', 'Permission', 'module_add', '', ''),
(55, 6, '删除操作模块', 'Permission', 'module_delete', '', ''),
(56, 6, '查看操作信息', 'Permission', 'index', '', ''),
(57, 6, '修改操作', 'Permission', 'control_edit', '', ''),
(58, 6, '删除模块', 'Permission', 'control_delete', '', ''),
(59, 6, '添加操作', 'Permission', 'control_add', '', ''),
(61, 9, 'smtp设置', 'Config', 'smtpConfig', '', ''),
(62, 9, '删除状态', 'Config', 'deleteStatus', '', ''),
(63, 9, '修改状态', 'Config', 'editStatus', '', ''),
(64, 9, '添加状态', 'Config', 'addStatus', '', ''),
(65, 9, '查看状态', 'Config', 'statusList', '', ''),
(66, 9, '查看状态流', 'Config', 'flowList', '', ''),
(67, 9, '添加状态流', 'Config', 'addStatusflow', '', ''),
(68, 9, '删除状态流', 'Config', 'deleteStatusFlow', '', ''),
(69, 9, '修改状态流信息', 'Config', 'editStatusFlow', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_control_module`
--

CREATE TABLE `5kcrm_control_module` (
  `module_id` int(10) NOT NULL COMMENT '操作模块id',
  `name` varchar(20) NOT NULL COMMENT '操作模块名',
  `description` varchar(50) NOT NULL COMMENT '操作模块描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='存放操作模块信息';

--
-- 转存表中的数据 `5kcrm_control_module`
--

INSERT INTO `5kcrm_control_module` (`module_id`, `name`, `description`) VALUES
(2, '商机模块', '关于一切商机操作的模块'),
(3, '产品模块', '关于产品操作的模块'),
(5, '客户模块', '客户的管理'),
(6, '权限模块', '用户的权限管理'),
(7, '员工管理模块', '是的范德萨发的说法'),
(9, '系统设置', '');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_customer`
--

CREATE TABLE `5kcrm_customer` (
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `owner_role_id` int(10) NOT NULL COMMENT '所有者岗位',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `contacts_id` int(10) NOT NULL DEFAULT '0' COMMENT '首要联系人',
  `name` varchar(333) NOT NULL DEFAULT '',
  `origin` varchar(150) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL COMMENT '客户联系地址',
  `zip_code` varchar(20) NOT NULL COMMENT '邮编',
  `industry` varchar(150) NOT NULL DEFAULT '',
  `annual_revenue` varchar(20) NOT NULL COMMENT '年营业额',
  `ownership` varchar(150) NOT NULL DEFAULT '',
  `rating` varchar(150) NOT NULL DEFAULT '',
  `create_time` int(10) NOT NULL COMMENT '建立时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `is_deleted` int(1) NOT NULL COMMENT '是否删除',
  `is_locked` int(1) NOT NULL COMMENT '是否锁定',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放客户的相关信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_customer_attribute`
--

CREATE TABLE `5kcrm_customer_attribute` (
  `id` int(10) NOT NULL COMMENT '分组信息主键id',
  `group_id` int(10) NOT NULL COMMENT '客户属性组id',
  `name` int(10) NOT NULL COMMENT '属性组名称',
  `description` varchar(100) NOT NULL COMMENT '属性描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户属性信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_customer_attribute_group`
--

CREATE TABLE `5kcrm_customer_attribute_group` (
  `id` int(10) NOT NULL COMMENT '客户属性组id',
  `name` varchar(20) NOT NULL COMMENT '属性组名称',
  `description` varchar(100) DEFAULT NULL COMMENT '属性组描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放客户属性组信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_customer_attribute_relation`
--

CREATE TABLE `5kcrm_customer_attribute_relation` (
  `id` int(10) NOT NULL COMMENT '客户属性关系id',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `attribute_id` int(10) NOT NULL COMMENT '客户对应属性id',
  `description` varchar(100) DEFAULT NULL COMMENT '客户属性关系备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放客户和属性的关系';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_customer_cares`
--

CREATE TABLE `5kcrm_customer_cares` (
  `care_id` int(10) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `care_time` int(10) NOT NULL,
  `contacts_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `owner_role_id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `create_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL,
  `creator_role_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户关怀信息表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_customer_data`
--

CREATE TABLE `5kcrm_customer_data` (
  `customer_id` int(10) UNSIGNED NOT NULL COMMENT '客户id',
  `no_of_employees` varchar(150) NOT NULL DEFAULT '',
  `description` text NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户附表信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_customer_focus`
--

CREATE TABLE `5kcrm_customer_focus` (
  `focus_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `focus_time` int(10) NOT NULL COMMENT '关注时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_customer_record`
--

CREATE TABLE `5kcrm_customer_record` (
  `id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL COMMENT '客户',
  `user_id` int(10) NOT NULL COMMENT '用户',
  `start_time` int(10) NOT NULL COMMENT '时间',
  `type` int(10) NOT NULL COMMENT '1：领取 2：分配'
) ENGINE=MyISAM DEFAULT CHARSET=ascii COMMENT='客户记录表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_customer_share`
--

CREATE TABLE `5kcrm_customer_share` (
  `share_id` int(10) NOT NULL,
  `share_role_id` int(10) NOT NULL COMMENT '分享人ID',
  `by_sharing_id` varchar(150) NOT NULL COMMENT '被分享人ID',
  `customer_id` int(10) NOT NULL COMMENT '客户ID',
  `share_time` int(10) NOT NULL COMMENT '分享时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_email_template`
--

CREATE TABLE `5kcrm_email_template` (
  `template_id` int(10) NOT NULL COMMENT '主键',
  `subject` varchar(200) NOT NULL COMMENT '主题',
  `title` varchar(100) NOT NULL,
  `content` varchar(500) NOT NULL COMMENT '内容',
  `order_id` int(4) NOT NULL COMMENT '顺序id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短信模板';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_event`
--

CREATE TABLE `5kcrm_event` (
  `event_id` int(10) NOT NULL COMMENT '活动id',
  `owner_role_id` int(10) NOT NULL COMMENT '所有人岗位',
  `subject` varchar(50) NOT NULL COMMENT '主题',
  `start_date` int(10) NOT NULL COMMENT '开始时间',
  `end_date` int(10) NOT NULL COMMENT '结束时间',
  `venue` varchar(100) NOT NULL COMMENT '活动地点',
  `contacts_id` int(10) NOT NULL COMMENT '联系人id',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `create_date` int(10) NOT NULL COMMENT '创建时间',
  `update_date` int(10) NOT NULL COMMENT '修改时间',
  `business_id` int(10) NOT NULL COMMENT '商机id',
  `leads_id` int(10) NOT NULL COMMENT '线索id',
  `send_email` int(1) NOT NULL COMMENT '发送通知邮件1不发送0',
  `recurring` int(1) NOT NULL COMMENT '重复1 不重复0',
  `description` text NOT NULL COMMENT '描述',
  `isclose` int(1) NOT NULL COMMENT '是否关闭1开启0关闭',
  `is_deleted` int(1) NOT NULL COMMENT '是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动信息表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_fields`
--

CREATE TABLE `5kcrm_fields` (
  `field_id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `model` varchar(20) NOT NULL COMMENT '对应模块小写，如business',
  `is_main` int(1) NOT NULL COMMENT '是否是主表字段1是0否',
  `field` varchar(50) NOT NULL COMMENT '数据库字段名',
  `name` varchar(100) NOT NULL COMMENT '显示标识',
  `form_type` varchar(20) NOT NULL COMMENT '数据类型 text 单行文本 textarea 多行文本 editor 编辑器 box 选项 datetime 日期 number 数字 user员工email邮箱phone手机号mobile电话phone',
  `default_value` varchar(100) NOT NULL COMMENT '默认值',
  `color` varchar(20) NOT NULL COMMENT '颜色',
  `max_length` int(4) NOT NULL COMMENT '字段长度',
  `is_unique` int(1) NOT NULL COMMENT '是否唯一1是0否',
  `is_null` int(1) NOT NULL COMMENT '是否允许为空',
  `is_validate` int(1) NOT NULL COMMENT '是否验证',
  `in_index` int(1) NOT NULL COMMENT '是否列表页显示1是0否',
  `in_add` int(1) NOT NULL DEFAULT '1' COMMENT '是否添加时显示1是0否',
  `input_tips` varchar(500) NOT NULL COMMENT '输入提示',
  `setting` text NOT NULL COMMENT '设置',
  `order_id` int(5) NOT NULL COMMENT '同一模块内的顺序id',
  `operating` int(1) NOT NULL COMMENT '0改删、1改、2无、3删'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='字段表';

--
-- 转存表中的数据 `5kcrm_fields`
--

INSERT INTO `5kcrm_fields` (`field_id`, `model`, `is_main`, `field`, `name`, `form_type`, `default_value`, `color`, `max_length`, `is_unique`, `is_null`, `is_validate`, `in_index`, `in_add`, `input_tips`, `setting`, `order_id`, `operating`) VALUES
(1, '', 1, 'owner_role_id', '负责人', 'user', '', '', 10, 0, 0, 0, 1, 1, '', '', 0, 2),
(2, '', 1, 'creator_role_id', '创建人', 'user', '', '', 10, 0, 0, 0, 1, 1, '', '', 0, 2),
(3, '', 1, 'delete_role_id', '删除人', 'user', '', '', 10, 0, 0, 0, 1, 1, '', '', 0, 2),
(4, '', 1, 'is_deleted', '是否删除', 'deleted', '', '', 1, 0, 0, 0, 1, 1, '', '', 0, 2),
(5, '', 1, 'create_time', '创建时间', 'datetime', '', '', 10, 0, 0, 0, 1, 1, '', '', 0, 2),
(6, '', 1, 'update_time', '更新时间', 'datetime', '', '', 10, 0, 0, 0, 1, 1, '', '', 0, 2),
(7, '', 1, 'delete_time', '删除时间', 'datetime', '', '', 10, 0, 0, 0, 1, 1, '', '', 0, 2),
(8, 'customer', 1, 'name', '客户名称', 'text', '', '5521FF', 333, 1, 1, 1, 1, 1, '', '', 0, 1),
(9, 'customer', 1, 'origin', '客户信息来源', 'box', '', '333333', 150, 0, 0, 0, 0, 1, '', 'array(''type''=>''select'',''data''=>array(1=>''电话营销'',2=>''网络营销''))', 6, 1),
(10, 'customer', 1, 'address', '客户联系地址', 'address', '', '', 500, 0, 0, 0, 1, 1, '', '', 18, 0),
(11, 'customer', 1, 'zip_code', '邮编', 'text', '', '', 150, 0, 0, 0, 0, 1, '', '', 12, 0),
(12, 'customer', 1, 'industry', '客户行业', 'box', '', '050505', 150, 0, 0, 0, 1, 1, '', 'array(''type''=>''select'',''data''=>array(1=>''教育/培训'',2=>''电子商务'',3=>''对外贸易''))', 5, 1),
(13, 'customer', 1, 'annual_revenue', '年营业额', 'box', '', '', 150, 0, 0, 0, 0, 1, '', 'array(''type''=>''select'',''data''=>array(1=>''1-10万'',2=>''10-20万'',3=>''20-50万''))', 14, 1),
(14, 'customer', 1, 'ownership', '公司性质', 'box', '', '000000', 150, 0, 0, 0, 0, 1, '', 'array(''type''=>''radio'',''data''=>array(1=>''合资'',2=>''国企'',3=>''民营''))', 7, 0),
(15, 'customer', 1, 'rating', '评分', 'box', '', 'A3A3A3', 150, 0, 0, 1, 1, 1, '', 'array(''type''=>''radio'',''data''=>array(1=>''一星'',2=>''二星'',3=>''三星''))', 15, 0),
(16, 'business', 1, 'origin', '商机来源', 'box', '', '1BA69C', 0, 0, 0, 1, 1, 1, '', 'array(''type''=>''select'',''data''=>array(1=>''电话营销'',2=>''网络营销''))', 11, 1),
(17, 'business', 1, 'type', '商机类型', 'box', '', '', 0, 0, 0, 0, 0, 1, '', 'array(''type''=>''select'', ''data''=>array(1=>''新业务'',2=>''现有业务''))', 9, 0),
(18, 'business', 1, 'gain_rate', '赢单率', 'number', '', '', 0, 0, 0, 0, 0, 1, '%', '', 12, 0),
(19, 'business', 1, 'estimate_price', '预计成交价', 'floatnumber', '', '333333', 0, 0, 1, 1, 0, 1, '单位：元', '', 13, 0),
(20, 'product', 1, 'category_id', '产品类别', 'p_box', '', '', 0, 0, 0, 0, 0, 1, '', '', 2, 2),
(21, 'business', 1, 'status_id', '状态', 'b_box', '', '', 0, 0, 0, 0, 0, 1, '', '', 10, 2),
(22, 'product', 1, 'name', ' 产品名称', 'text', '', '021012', 200, 1, 1, 0, 1, 1, '', '', 0, 1),
(23, 'product', 1, 'cost_price', '成本价', 'floatnumber', '', '1F1F1F', 10, 0, 0, 0, 0, 1, '', '', 8, 0),
(24, 'product', 1, 'suggested_price', '建议售价', 'floatnumber', '', '', 0, 0, 0, 0, 0, 1, '', '', 9, 0),
(25, 'product', 1, 'development_team', '开发团队', 'text', '', '333333', 0, 0, 1, 1, 0, 1, '', '', 6, 0),
(26, 'product', 1, 'development_time', '研发时间', 'datetime', '', '333333', 0, 0, 1, 0, 0, 1, '', '', 3, 0),
(27, 'product', 1, 'link', '详情链接', 'text', 'http://', '6E6E6E', 200, 0, 0, 0, 1, 1, '', '', 5, 0),
(28, 'business', 1, 'name', '商机名', 'text', '', '090D08', 0, 1, 1, 1, 1, 1, '', '', 2, 1),
(29, 'business', 1, 'nextstep', '下次联系内容', 'text', '', '', 0, 0, 0, 0, 1, 1, '', '', 15, 2),
(30, 'business', 1, 'nextstep_time', '下次联系时间', 'datetime', '', '', 0, 0, 0, 1, 1, 1, '', '', 14, 2),
(31, 'business', 1, 'customer_id', '客户', 'customer', '', '', 0, 0, 0, 1, 1, 1, '', '', 0, 2),
(32, 'business', 1, 'contacts_id', '联系人', 'contacts', '', '', 0, 0, 0, 0, 0, 1, '', '', 3, 2),
(33, 'business', 1, 'contract_address', '合同签订地址', 'address', '', '333333', 0, 0, 0, 1, 0, 1, '', '', 4, 0),
(34, 'leads', 1, 'nextstep_time', '下次联系时间', 'datetime', '', '', 0, 0, 0, 0, 1, 1, '', '', 8, 2),
(35, 'leads', 1, 'nextstep', '下次联系内容', 'text', '', '', 0, 0, 0, 0, 1, 1, '', '', 9, 2),
(36, 'leads', 1, 'contacts_name', '联系人姓名', 'text', '', '333333', 0, 0, 1, 1, 1, 1, '', '', 1, 1),
(37, 'leads', 1, 'saltname', '尊称', 'box', '', '333333', 0, 0, 0, 0, 1, 1, '', 'array(''type''=>''select'',''data''=>array(1=>''女士'',2=>''先生''))', 4, 1),
(38, 'leads', 1, 'mobile', '手机', 'mobile', '', '333333', 0, 0, 0, 1, 1, 1, '', '', 5, 1),
(39, 'leads', 1, 'email', '邮箱', 'email', '', '', 0, 0, 0, 1, 0, 1, '', '', 6, 1),
(40, 'leads', 1, 'position', '职位', 'text', '', '', 0, 0, 0, 0, 0, 1, '', '', 2, 1),
(41, 'leads', 1, 'address', '地址', 'address', '', '333333', 0, 0, 0, 0, 0, 1, '', '', 7, 0),
(42, 'customer', 0, 'no_of_employees', '员工数', 'box', '', '0A0A0A', 150, 0, 0, 0, 0, 1, '', 'array(''type''=>''select'',''data''=>array(1=>''5--20人'',2=>''20-50人'',3=>''50人以上''))', 13, 1),
(43, 'customer', 0, 'description', '备注', 'textarea', '', '', 0, 0, 0, 0, 0, 1, '', '', 19, 1),
(44, 'leads', 0, 'description', '备注', 'textarea', '', '', 0, 0, 0, 0, 0, 1, '', '', 19, 1),
(45, 'product', 0, 'description', '备注', 'textarea', '', '', 0, 0, 0, 0, 0, 1, '', '', 19, 1),
(46, 'business', 0, 'description', '备注', 'textarea', '', '', 0, 0, 0, 0, 0, 1, '', '', 19, 1),
(47, 'leads', 1, 'name', '公司名', 'text', '', '05330E', 0, 0, 1, 0, 1, 1, '', '', 0, 1),
(48, 'leads', 1, 'source', '来源', 'box', '', '333333', 0, 0, 1, 0, 0, 1, '', 'array(''type''=>''select'',''data''=>array(1=>''网络营销'',2=>''公开媒体'',3=>''合作伙伴'',4=>''员工介绍'',5=>''广告'',6=>''推销电话'',7=>''其他''))', 0, 1),
(49, 'business', 1, 'total_price', '商机金额', 'floatnumber', '', '333333', 0, 0, 1, 0, 0, 1, '', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_file`
--

CREATE TABLE `5kcrm_file` (
  `file_id` int(10) NOT NULL COMMENT '附件主键',
  `name` varchar(50) NOT NULL COMMENT '附件名',
  `role_id` int(10) NOT NULL COMMENT '创建者岗位',
  `size` int(10) NOT NULL COMMENT '文件大小字节',
  `create_date` int(10) NOT NULL COMMENT '创建时间',
  `file_path` varchar(200) NOT NULL COMMENT '文件路径'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_finance`
--

CREATE TABLE `5kcrm_finance` (
  `finance_id` int(10) NOT NULL COMMENT '财务id',
  `name` varchar(50) NOT NULL COMMENT '财务活动名',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `check_role_id` int(10) NOT NULL COMMENT '审核人id',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `check_time` int(10) NOT NULL COMMENT '审核时间',
  `check_result` int(1) NOT NULL COMMENT '0未审核，1审核通过，-1审核未通过，2等到处理',
  `money` float(10,2) NOT NULL COMMENT '实际金额',
  `plan_money` float(10,2) NOT NULL COMMENT '应收（付）金额',
  `income_or_expenses` int(1) NOT NULL COMMENT '收入1还是支出-1',
  `description` varchar(100) NOT NULL COMMENT '财务活动描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='财务表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_knowledge`
--

CREATE TABLE `5kcrm_knowledge` (
  `knowledge_id` int(10) NOT NULL COMMENT '文章id',
  `category_id` int(10) NOT NULL COMMENT '文章类别',
  `role_id` int(10) NOT NULL COMMENT '发表人岗位',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(10) NOT NULL COMMENT '发表时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `hits` int(10) NOT NULL COMMENT '点击次数',
  `color` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='存放知识文章信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_knowledge_category`
--

CREATE TABLE `5kcrm_knowledge_category` (
  `category_id` int(11) NOT NULL COMMENT '文章类别id',
  `parent_id` int(11) NOT NULL COMMENT '父类别id',
  `name` varchar(30) NOT NULL COMMENT '类别名称',
  `description` varchar(100) NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='知识文章分类信息表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_leads`
--

CREATE TABLE `5kcrm_leads` (
  `leads_id` int(10) NOT NULL COMMENT '线索主键',
  `owner_role_id` int(10) NOT NULL COMMENT '拥有者岗位',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者岗位',
  `name` varchar(255) NOT NULL,
  `position` varchar(20) NOT NULL COMMENT '职位',
  `contacts_name` varchar(255) NOT NULL,
  `saltname` varchar(255) NOT NULL DEFAULT '',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL COMMENT '电子邮箱',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间',
  `is_deleted` int(1) NOT NULL COMMENT '是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人的岗位id',
  `delete_time` int(10) NOT NULL,
  `is_transformed` int(1) NOT NULL COMMENT '是否转换',
  `transform_role_id` int(10) NOT NULL COMMENT '转换者',
  `contacts_id` int(10) NOT NULL COMMENT '转换成联系人',
  `customer_id` int(10) NOT NULL COMMENT '转换成的客户',
  `business_id` int(10) NOT NULL COMMENT '转换成的商机',
  `nextstep` varchar(50) NOT NULL COMMENT '下一次联系',
  `nextstep_time` int(10) NOT NULL COMMENT '联系时间',
  `have_time` int(10) NOT NULL COMMENT '最后一次领取时间',
  `address` varchar(500) NOT NULL,
  `source` varchar(500) NOT NULL COMMENT '线索来源'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='线索表';

--
-- 转存表中的数据 `5kcrm_leads`
--

INSERT INTO `5kcrm_leads` (`leads_id`, `owner_role_id`, `creator_role_id`, `name`, `position`, `contacts_name`, `saltname`, `mobile`, `email`, `create_time`, `update_time`, `is_deleted`, `delete_role_id`, `delete_time`, `is_transformed`, `transform_role_id`, `contacts_id`, `customer_id`, `business_id`, `nextstep`, `nextstep_time`, `have_time`, `address`, `source`) VALUES
(1, 1, 1, '茂源电子', '总经理', '张三', '先生', '13800138000', 'hhh@126.com', 1531020935, 1531020935, 0, 0, 0, 0, 0, 0, 0, 0, '报价', 1531366500, 1531020935, '广东省\n深圳市\n罗湖区\nddd', '网络营销');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_leads_data`
--

CREATE TABLE `5kcrm_leads_data` (
  `leads_id` int(10) NOT NULL,
  `description` text NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `5kcrm_leads_data`
--

INSERT INTO `5kcrm_leads_data` (`leads_id`, `description`) VALUES
(1, '准备好报价材料');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_leads_record`
--

CREATE TABLE `5kcrm_leads_record` (
  `id` int(10) NOT NULL,
  `leads_id` int(10) NOT NULL,
  `owner_role_id` int(10) NOT NULL,
  `start_time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_log`
--

CREATE TABLE `5kcrm_log` (
  `log_id` int(10) NOT NULL COMMENT '日志id',
  `role_id` int(11) NOT NULL COMMENT '创建者岗位',
  `category_id` int(10) NOT NULL,
  `create_date` int(10) NOT NULL COMMENT '创建时间',
  `update_date` int(10) NOT NULL COMMENT '更新时间',
  `subject` varchar(200) NOT NULL COMMENT '主题',
  `content` text NOT NULL COMMENT '内容',
  `comment_id` int(10) NOT NULL COMMENT '评论id',
  `about_roles` varchar(200) NOT NULL COMMENT '新增相关人',
  `about_roles_name` varchar(500) NOT NULL COMMENT '新增相关人姓名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日志表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_login_history`
--

CREATE TABLE `5kcrm_login_history` (
  `login_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `login_time` int(11) NOT NULL COMMENT '登录时间',
  `login_ip` varchar(50) NOT NULL COMMENT '登录ip',
  `login_status` char(1) NOT NULL COMMENT '登录 1成功   2 失败'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户登录历史表';

--
-- 转存表中的数据 `5kcrm_login_history`
--

INSERT INTO `5kcrm_login_history` (`login_id`, `user_id`, `login_time`, `login_ip`, `login_status`) VALUES
(1, 1, 1531020149, '0.0.0.0', '1'),
(2, 1, 1533957964, '0.0.0.0', '1');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_log_category`
--

CREATE TABLE `5kcrm_log_category` (
  `category_id` int(10) NOT NULL COMMENT '分类id',
  `name` varchar(200) NOT NULL COMMENT '分类名',
  `order_id` int(10) NOT NULL COMMENT '顺序id',
  `description` varchar(500) NOT NULL COMMENT '描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日志类型表';

--
-- 转存表中的数据 `5kcrm_log_category`
--

INSERT INTO `5kcrm_log_category` (`category_id`, `name`, `order_id`, `description`) VALUES
(2, '月报', 3, '每月工作总结'),
(3, '周报', 2, '每周工作总结'),
(4, '日报', 1, '每日工作总结');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_message`
--

CREATE TABLE `5kcrm_message` (
  `message_id` int(11) UNSIGNED NOT NULL,
  `to_role_id` int(11) UNSIGNED NOT NULL,
  `from_role_id` int(11) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `read_time` int(11) UNSIGNED NOT NULL,
  `send_time` int(11) UNSIGNED NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_navigation`
--

CREATE TABLE `5kcrm_navigation` (
  `id` int(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `url` varchar(200) NOT NULL,
  `postion` varchar(10) NOT NULL COMMENT '位置',
  `listorder` int(11) NOT NULL COMMENT '排序',
  `module` varchar(20) NOT NULL COMMENT '模块'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航菜单';

--
-- 转存表中的数据 `5kcrm_navigation`
--

INSERT INTO `5kcrm_navigation` (`id`, `title`, `url`, `postion`, `listorder`, `module`) VALUES
(1, '线索', '/wk/index.php?m=leads', 'top', 0, 'Leads'),
(2, '客户', '/wk/index.php?m=customer', 'top', 1, 'Customer'),
(3, '商机', '/wk/index.php?m=business', 'top', 2, 'Business'),
(4, '产品', '/wk/index.php?m=product', 'top', 3, 'Product'),
(5, '任务', '/wk/index.php?m=task', 'top', 4, 'Task'),
(6, '日程', '/wk/index.php?m=event', 'top', 5, 'Event'),
(7, '合同', '/wk/index.php?m=contract', 'top', 6, 'Contract'),
(8, '财务', '/wk/index.php?m=finance', 'top', 7, 'Finance'),
(9, '日志', '/wk/index.php?m=log', 'more', 0, ''),
(10, '知识', '/wk/index.php?m=knowledge', 'more', 1, 'Knowledge'),
(11, '营销', '/wk/index.php?m=setting&a=sendsms', 'more', 2, ''),
(12, '站内信', '/wk/index.php?m=message', 'more', 3, ''),
(13, '我的面板', '/wk/', 'user', 0, ''),
(14, '个人资料', '/wk/index.php?m=user&a=edit', 'user', 1, ''),
(15, '组织架构', '/wk/index.php?m=user', 'user', 2, ''),
(16, '权限分配', '/wk/index.php?m=user&a=role', 'user', 3, 'Role'),
(17, '公告管理', '/wk/index.php?m=announcement', 'user', 4, 'announcement'),
(18, '操作日志', '/wk/index.php?m=action_log', 'user', 5, ''),
(19, '系统设置', '/wk/index.php?m=setting', 'user', 6, 'Setting');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_note`
--

CREATE TABLE `5kcrm_note` (
  `note_id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  `content` varchar(1000) NOT NULL COMMENT '内容',
  `update_time` int(10) NOT NULL COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='便笺表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_payables`
--

CREATE TABLE `5kcrm_payables` (
  `payables_id` int(10) UNSIGNED NOT NULL COMMENT '应付款id',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `contract_id` int(10) DEFAULT NULL COMMENT '合同id',
  `name` varchar(500) NOT NULL COMMENT '应付款名',
  `price` decimal(10,2) NOT NULL COMMENT '应付金额',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `owner_role_id` int(10) NOT NULL,
  `description` text NOT NULL COMMENT '描述',
  `pay_time` int(10) NOT NULL COMMENT '付款时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `status` int(2) NOT NULL COMMENT '状态0未收1部分收2已收',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `is_deleted` int(1) NOT NULL DEFAULT '0' COMMENT ' 是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应付款表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_paymentorder`
--

CREATE TABLE `5kcrm_paymentorder` (
  `paymentorder_id` int(10) NOT NULL COMMENT '付款单id',
  `name` varchar(500) NOT NULL COMMENT '付款单主题',
  `money` decimal(10,2) NOT NULL COMMENT '付款金额',
  `payables_id` int(10) NOT NULL COMMENT '应付款id',
  `description` text NOT NULL COMMENT '描述',
  `pay_time` int(10) NOT NULL COMMENT '付款时间',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `owner_role_id` int(10) NOT NULL COMMENT '负责人',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(10) NOT NULL COMMENT '审核时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `is_deleted` int(1) NOT NULL DEFAULT '0' COMMENT ' 是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='付款单';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_permission`
--

CREATE TABLE `5kcrm_permission` (
  `permission_id` int(10) NOT NULL COMMENT '权限id',
  `role_id` int(10) NOT NULL COMMENT '岗位id',
  `position_id` int(10) NOT NULL COMMENT '岗位组id',
  `url` varchar(50) NOT NULL COMMENT '对应模块操作',
  `description` varchar(200) NOT NULL COMMENT '权限备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表用来存放权限信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_position`
--

CREATE TABLE `5kcrm_position` (
  `position_id` int(10) NOT NULL COMMENT '岗位id',
  `parent_id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `department_id` int(10) NOT NULL,
  `description` varchar(200) NOT NULL COMMENT '描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='岗位表控制权限';

--
-- 转存表中的数据 `5kcrm_position`
--

INSERT INTO `5kcrm_position` (`position_id`, `parent_id`, `name`, `department_id`, `description`) VALUES
(1, 0, 'CEO', 1, ''),
(2, 5, '.NET开发工程师', 2, ''),
(3, 6, 'JAVA研发工程师', 2, ''),
(4, 1, '技术总监', 2, ''),
(5, 4, '.NET技术组长', 2, ''),
(6, 4, 'JAVA技术组长', 2, '');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_praise`
--

CREATE TABLE `5kcrm_praise` (
  `praise_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL COMMENT '日志id',
  `role_id` int(10) NOT NULL COMMENT '赞的人role_id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_product`
--

CREATE TABLE `5kcrm_product` (
  `product_id` int(10) NOT NULL COMMENT '产品id',
  `category_id` int(11) NOT NULL COMMENT '产品类别的id',
  `name` varchar(200) NOT NULL DEFAULT '',
  `creator_role_id` int(10) NOT NULL COMMENT '产品信息添加者',
  `cost_price` float(10,2) NOT NULL DEFAULT '0.00',
  `suggested_price` float(10,2) NOT NULL COMMENT '建议售价',
  `development_team` varchar(255) NOT NULL DEFAULT '',
  `development_time` int(10) NOT NULL,
  `link` varchar(200) NOT NULL DEFAULT '',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_product_attribute`
--

CREATE TABLE `5kcrm_product_attribute` (
  `id` int(10) NOT NULL COMMENT '产品属性id',
  `group_id` int(10) NOT NULL COMMENT '产品id',
  `name` varchar(20) NOT NULL COMMENT '属性名',
  `description` varchar(50) DEFAULT NULL COMMENT '产品属性备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放产品属性信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_product_attribute_group`
--

CREATE TABLE `5kcrm_product_attribute_group` (
  `group_id` int(11) NOT NULL COMMENT '产品属性组id',
  `name` varchar(20) NOT NULL COMMENT '产品属性组名称',
  `description` varchar(100) DEFAULT NULL COMMENT '产品属性组备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放产品属性组相关信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_product_attribute_relation`
--

CREATE TABLE `5kcrm_product_attribute_relation` (
  `id` int(10) NOT NULL COMMENT '产品属性关系id',
  `product_id` int(10) NOT NULL COMMENT '产品id',
  `attribute_id` int(10) NOT NULL COMMENT '产品属性id',
  `description` varchar(100) DEFAULT NULL COMMENT '产品属性关系描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放产品属性关系的相关信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_product_category`
--

CREATE TABLE `5kcrm_product_category` (
  `category_id` int(11) NOT NULL COMMENT '产品类别id',
  `parent_id` int(11) NOT NULL COMMENT '父类别id',
  `name` varchar(30) NOT NULL COMMENT '类别名称',
  `description` varchar(100) NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `5kcrm_product_category`
--

INSERT INTO `5kcrm_product_category` (`category_id`, `parent_id`, `name`, `description`) VALUES
(1, 0, '默认', '');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_product_data`
--

CREATE TABLE `5kcrm_product_data` (
  `product_id` int(10) NOT NULL COMMENT '主键',
  `description` text NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品信息附表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_product_images`
--

CREATE TABLE `5kcrm_product_images` (
  `images_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL COMMENT '关联产品id',
  `is_main` int(1) NOT NULL COMMENT '0：副图  1：主图',
  `name` varchar(500) NOT NULL COMMENT '源文件名',
  `save_name` varchar(500) NOT NULL COMMENT '保存至服务器的文件名',
  `size` varchar(500) NOT NULL COMMENT 'KB',
  `path` varchar(500) NOT NULL COMMENT '路径',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `listorder` int(10) NOT NULL COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品图库';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_receivables`
--

CREATE TABLE `5kcrm_receivables` (
  `receivables_id` int(10) UNSIGNED NOT NULL COMMENT '应收款id',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `contract_id` int(10) DEFAULT NULL COMMENT '合同id',
  `name` varchar(500) NOT NULL COMMENT '应收款名',
  `price` decimal(10,2) NOT NULL COMMENT '应收金额',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `owner_role_id` int(10) NOT NULL,
  `description` text NOT NULL COMMENT '描述',
  `pay_time` int(10) NOT NULL COMMENT '收款时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `status` int(2) NOT NULL COMMENT '状态0未收1部分收2已收',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `is_deleted` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应收款表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_receivingorder`
--

CREATE TABLE `5kcrm_receivingorder` (
  `receivingorder_id` int(10) NOT NULL COMMENT '收款单id',
  `name` varchar(500) NOT NULL COMMENT '收款单主题',
  `money` decimal(10,2) NOT NULL COMMENT '收款金额',
  `receivables_id` int(10) NOT NULL COMMENT '应收款id',
  `description` text NOT NULL COMMENT '描述',
  `pay_time` int(10) NOT NULL COMMENT '付款时间',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `owner_role_id` int(10) NOT NULL COMMENT '负责人',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(10) NOT NULL COMMENT '审核时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `is_deleted` int(1) NOT NULL DEFAULT '0' COMMENT ' 是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收款单';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_role`
--

CREATE TABLE `5kcrm_role` (
  `role_id` int(10) NOT NULL COMMENT '岗位id',
  `position_id` int(10) NOT NULL COMMENT '岗位组名',
  `user_id` int(10) NOT NULL COMMENT '员工id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放用户岗位信息';

--
-- 转存表中的数据 `5kcrm_role`
--

INSERT INTO `5kcrm_role` (`role_id`, `position_id`, `user_id`) VALUES
(1, 1, 1),
(2, 4, 2),
(3, 5, 3),
(4, 2, 4);

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_role_department`
--

CREATE TABLE `5kcrm_role_department` (
  `department_id` int(10) NOT NULL COMMENT '部门id',
  `parent_id` int(10) NOT NULL COMMENT '父类部门id',
  `name` varchar(50) NOT NULL COMMENT '部门名',
  `description` varchar(200) NOT NULL COMMENT '部门描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放部门信息';

--
-- 转存表中的数据 `5kcrm_role_department`
--

INSERT INTO `5kcrm_role_department` (`department_id`, `parent_id`, `name`, `description`) VALUES
(1, 0, '办公室', '公司文档管理、财务管理'),
(2, 0, '研发部', '');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_business_contract`
--

CREATE TABLE `5kcrm_r_business_contract` (
  `id` int(10) NOT NULL,
  `business_id` int(10) NOT NULL COMMENT '商机id',
  `contract_id` int(10) NOT NULL COMMENT '合同id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商机合同关系表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_business_customer`
--

CREATE TABLE `5kcrm_r_business_customer` (
  `id` int(10) NOT NULL,
  `business_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_business_event`
--

CREATE TABLE `5kcrm_r_business_event` (
  `id` int(10) NOT NULL,
  `business_id` int(10) NOT NULL,
  `event_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_business_file`
--

CREATE TABLE `5kcrm_r_business_file` (
  `id` int(10) NOT NULL,
  `business_id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_business_log`
--

CREATE TABLE `5kcrm_r_business_log` (
  `id` int(10) NOT NULL,
  `business_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商机和日志id对应关系表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_business_product`
--

CREATE TABLE `5kcrm_r_business_product` (
  `id` int(10) NOT NULL,
  `business_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `sales_price` float(10,2) NOT NULL COMMENT '成交价',
  `estimate_price` float(10,2) NOT NULL COMMENT '报价',
  `amount` int(10) NOT NULL COMMENT '产品交易数量',
  `discount_rate` int(3) NOT NULL COMMENT '折扣率',
  `tax_rate` int(3) NOT NULL COMMENT '税率',
  `unit_price` float(9,2) NOT NULL COMMENT '单价',
  `subtotal` float(9,2) NOT NULL COMMENT '小计',
  `description` varchar(200) NOT NULL COMMENT '产品交易备注',
  `subtotal_val` float(9,2) NOT NULL COMMENT '小计和',
  `discount_price` float(9,2) NOT NULL COMMENT '其他费用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_business_status`
--

CREATE TABLE `5kcrm_r_business_status` (
  `id` int(10) NOT NULL COMMENT '关系主键',
  `business_id` int(10) NOT NULL COMMENT '商机id',
  `gain_rate` int(3) NOT NULL,
  `status_id` int(10) NOT NULL COMMENT '状态id',
  `description` text NOT NULL COMMENT '阶段描述',
  `due_date` int(10) NOT NULL COMMENT '预计成交日期',
  `owner_role_id` int(10) NOT NULL COMMENT '负责人id',
  `update_time` int(10) NOT NULL COMMENT '推进时间',
  `update_role_id` int(10) NOT NULL COMMENT '推进人',
  `total_price` float(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商机状态阶段表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_business_task`
--

CREATE TABLE `5kcrm_r_business_task` (
  `id` int(10) NOT NULL,
  `business_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_contacts_customer`
--

CREATE TABLE `5kcrm_r_contacts_customer` (
  `id` int(10) NOT NULL,
  `contacts_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_contacts_event`
--

CREATE TABLE `5kcrm_r_contacts_event` (
  `id` int(10) NOT NULL,
  `contacts_id` int(10) NOT NULL,
  `event_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_contacts_file`
--

CREATE TABLE `5kcrm_r_contacts_file` (
  `id` int(10) NOT NULL,
  `contacts_id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_contacts_log`
--

CREATE TABLE `5kcrm_r_contacts_log` (
  `id` int(10) NOT NULL,
  `contacts_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_contacts_task`
--

CREATE TABLE `5kcrm_r_contacts_task` (
  `id` int(10) NOT NULL,
  `contacts_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='联系人任务关系表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_contract_file`
--

CREATE TABLE `5kcrm_r_contract_file` (
  `id` int(10) NOT NULL,
  `contract_id` int(10) NOT NULL COMMENT '合同id',
  `file_id` int(10) NOT NULL COMMENT '文件id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='合同文件关系表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_contract_product`
--

CREATE TABLE `5kcrm_r_contract_product` (
  `id` int(10) NOT NULL,
  `contract_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `sales_price` float(10,2) NOT NULL,
  `estimate_price` float(10,2) NOT NULL,
  `amount` int(10) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_customer_event`
--

CREATE TABLE `5kcrm_r_customer_event` (
  `id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `event_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_customer_file`
--

CREATE TABLE `5kcrm_r_customer_file` (
  `id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_customer_log`
--

CREATE TABLE `5kcrm_r_customer_log` (
  `id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_customer_task`
--

CREATE TABLE `5kcrm_r_customer_task` (
  `id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户任务关系表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_event_file`
--

CREATE TABLE `5kcrm_r_event_file` (
  `id` int(10) NOT NULL,
  `event_id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_event_leads`
--

CREATE TABLE `5kcrm_r_event_leads` (
  `id` int(10) NOT NULL,
  `event_id` int(10) NOT NULL,
  `leads_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_event_log`
--

CREATE TABLE `5kcrm_r_event_log` (
  `id` int(10) NOT NULL,
  `event_id` int(10) DEFAULT NULL,
  `log_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动和日志id对应表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_event_product`
--

CREATE TABLE `5kcrm_r_event_product` (
  `id` int(10) NOT NULL,
  `event_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_file_finance`
--

CREATE TABLE `5kcrm_r_file_finance` (
  `id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL,
  `finance_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_file_leads`
--

CREATE TABLE `5kcrm_r_file_leads` (
  `id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL,
  `leads_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件和日志对应关系';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_file_log`
--

CREATE TABLE `5kcrm_r_file_log` (
  `id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件和日志对应关系表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_file_product`
--

CREATE TABLE `5kcrm_r_file_product` (
  `id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_file_task`
--

CREATE TABLE `5kcrm_r_file_task` (
  `id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_file_user`
--

CREATE TABLE `5kcrm_r_file_user` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='员工对应文件资料表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_finance_log`
--

CREATE TABLE `5kcrm_r_finance_log` (
  `id` int(10) NOT NULL,
  `finance_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_leads_log`
--

CREATE TABLE `5kcrm_r_leads_log` (
  `id` int(10) NOT NULL,
  `leads_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_leads_task`
--

CREATE TABLE `5kcrm_r_leads_task` (
  `id` int(10) NOT NULL,
  `leads_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_log_product`
--

CREATE TABLE `5kcrm_r_log_product` (
  `id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_log_task`
--

CREATE TABLE `5kcrm_r_log_task` (
  `id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务和日志id对应表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_log_user`
--

CREATE TABLE `5kcrm_r_log_user` (
  `id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='员工备注信息表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_r_product_task`
--

CREATE TABLE `5kcrm_r_product_task` (
  `id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_sign`
--

CREATE TABLE `5kcrm_sign` (
  `sign_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  `x` float(10,6) NOT NULL COMMENT 'x坐标',
  `y` float(10,6) NOT NULL COMMENT 'y坐标',
  `title` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `log` varchar(100) NOT NULL,
  `create_time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_sign_img`
--

CREATE TABLE `5kcrm_sign_img` (
  `img_id` int(10) NOT NULL,
  `sign_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '图片上传时名字',
  `save_name` varchar(100) NOT NULL COMMENT '图片保存名',
  `path` varchar(200) NOT NULL,
  `create_time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_sms_record`
--

CREATE TABLE `5kcrm_sms_record` (
  `sms_record_id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL COMMENT '发件人',
  `telephone` varchar(800) NOT NULL COMMENT '发送手机号码',
  `content` text NOT NULL COMMENT '发送的内容',
  `sendtime` int(10) NOT NULL COMMENT '发送时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发送短息记录表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_sms_template`
--

CREATE TABLE `5kcrm_sms_template` (
  `template_id` int(10) NOT NULL COMMENT '主键',
  `subject` varchar(200) NOT NULL COMMENT '主题',
  `content` varchar(500) NOT NULL COMMENT '内容',
  `order_id` int(4) NOT NULL COMMENT '顺序id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短信模板';

--
-- 转存表中的数据 `5kcrm_sms_template`
--

INSERT INTO `5kcrm_sms_template` (`template_id`, `subject`, `content`, `order_id`) VALUES
(1, '默认模板', '有一个特别的日子，鲜花都为你展现；有一个特殊的日期，阳光都为你温暖；有一个美好的时刻，百灵都为你欢颜；有一个难忘的今天，亲朋都为你祝愿；那就是今天是你的生日，祝你幸福安康顺意连年！', 1);

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_task`
--

CREATE TABLE `5kcrm_task` (
  `task_id` int(10) NOT NULL COMMENT '任务id',
  `owner_role_id` varchar(200) NOT NULL COMMENT '任务所有者岗位',
  `about_roles` varchar(200) NOT NULL COMMENT '任务相关人',
  `subject` varchar(100) NOT NULL COMMENT '任务主题',
  `due_date` int(10) NOT NULL COMMENT '任务结束时间',
  `status` varchar(20) NOT NULL COMMENT '任务状态',
  `priority` varchar(10) NOT NULL COMMENT '优先级',
  `send_email` varchar(50) NOT NULL COMMENT '是否发送通知邮件  1发送0不发送',
  `description` text NOT NULL COMMENT '描述',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者岗位',
  `create_date` int(10) NOT NULL COMMENT '创建时间',
  `update_date` int(10) NOT NULL COMMENT '修改时间',
  `isclose` int(1) NOT NULL COMMENT '是否关闭',
  `is_deleted` int(1) NOT NULL COMMENT '是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务信息表';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_user`
--

CREATE TABLE `5kcrm_user` (
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `role_id` int(10) NOT NULL COMMENT '当前使用岗位',
  `category_id` int(11) NOT NULL COMMENT '用户类别',
  `status` int(1) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `img` varchar(100) NOT NULL COMMENT '头像',
  `password` varchar(32) NOT NULL COMMENT '用户密码',
  `salt` varchar(4) NOT NULL COMMENT '安全符',
  `sex` int(1) NOT NULL COMMENT '用户性别1男2女',
  `email` varchar(30) NOT NULL COMMENT '用户邮箱',
  `telephone` varchar(20) NOT NULL COMMENT '用户的电话',
  `address` varchar(100) NOT NULL COMMENT '用户的联系地址',
  `navigation` varchar(1000) NOT NULL COMMENT '用户自定义导航菜单',
  `simple_menu` varchar(1000) NOT NULL COMMENT '自定义快捷添加菜单',
  `dashboard` text NOT NULL COMMENT '个人面板',
  `reg_ip` varchar(15) NOT NULL COMMENT '注册时的ip',
  `reg_time` int(10) NOT NULL COMMENT '用户的注册时间',
  `last_login_time` int(10) NOT NULL COMMENT '用户最后一次登录的时间',
  `lostpw_time` int(10) NOT NULL COMMENT '用户申请找回密码的时间',
  `weixinid` varchar(150) NOT NULL,
  `last_read_time` varchar(500) NOT NULL COMMENT '商机等最后阅读时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表用来存放用户的相关基本信息';

--
-- 转存表中的数据 `5kcrm_user`
--

INSERT INTO `5kcrm_user` (`user_id`, `role_id`, `category_id`, `status`, `name`, `img`, `password`, `salt`, `sex`, `email`, `telephone`, `address`, `navigation`, `simple_menu`, `dashboard`, `reg_ip`, `reg_time`, `last_login_time`, `lostpw_time`, `weixinid`, `last_read_time`) VALUES
(1, 1, 1, 1, 'admin', '', 'f68e795e4777a9549ddec09987596132', '71be', 0, '', '', '', '', '', '', '0.0.0.0', 1531020135, 0, 0, '', '{"task":1533958001,"event":1533958003,"contract":1533958004}'),
(2, 2, 2, 1, '张三', '', '94979d8b1ba78c8080a84be0c1d5e320', 'd8a1', 0, '', '', '', 'a:3:{s:3:"top";a:8:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";i:5;s:1:"6";i:6;s:1:"7";i:7;s:1:"8";}s:4:"user";a:7:{i:0;s:2:"13";i:1;s:2:"14";i:2;s:2:"15";i:3;s:2:"16";i:4;s:2:"17";i:5;s:2:"18";i:6;s:2:"19";}s:4:"more";a:4:{i:0;s:1:"9";i:1;s:2:"10";i:2;s:2:"11";i:3;s:2:"12";}}', '', '', '0.0.0.0', 1533958368, 0, 0, '', ''),
(3, 3, 2, 1, '李四', '', 'da7a323790401b138be9cf778227c323', '5cc6', 0, 'aaa@126.com', '13800138000', '', 'a:3:{s:3:"top";a:8:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";i:5;s:1:"6";i:6;s:1:"7";i:7;s:1:"8";}s:4:"user";a:7:{i:0;s:2:"13";i:1;s:2:"14";i:2;s:2:"15";i:3;s:2:"16";i:4;s:2:"17";i:5;s:2:"18";i:6;s:2:"19";}s:4:"more";a:4:{i:0;s:1:"9";i:1;s:2:"10";i:2;s:2:"11";i:3;s:2:"12";}}', '', '', '0.0.0.0', 1533958393, 0, 0, '', ''),
(4, 4, 2, 1, '王五', '', '2f6555affef7e878efc99bbaa640467e', 'b243', 0, '', '', '', 'a:3:{s:3:"top";a:8:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";i:5;s:1:"6";i:6;s:1:"7";i:7;s:1:"8";}s:4:"user";a:7:{i:0;s:2:"13";i:1;s:2:"14";i:2;s:2:"15";i:3;s:2:"16";i:4;s:2:"17";i:5;s:2:"18";i:6;s:2:"19";}s:4:"more";a:4:{i:0;s:1:"9";i:1;s:2:"10";i:2;s:2:"11";i:3;s:2:"12";}}', '', '', '0.0.0.0', 1533958410, 0, 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_user_attribute`
--

CREATE TABLE `5kcrm_user_attribute` (
  `id` int(10) NOT NULL COMMENT '属性id',
  `group_id` int(10) NOT NULL COMMENT '用户的属性组id',
  `name` varchar(50) NOT NULL COMMENT '属性名',
  `description` varchar(100) DEFAULT NULL COMMENT '属性注释'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表用来存放用户的分类属性';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_user_attribute_group`
--

CREATE TABLE `5kcrm_user_attribute_group` (
  `id` int(10) NOT NULL COMMENT '属性组id',
  `name` varchar(20) NOT NULL COMMENT '属性组名',
  `description` varchar(100) DEFAULT NULL COMMENT '属性组描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表用来存放用户属性组信息';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_user_attribute_relation`
--

CREATE TABLE `5kcrm_user_attribute_relation` (
  `id` int(10) NOT NULL COMMENT '主键id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `attribute_id` int(10) NOT NULL COMMENT '关系id',
  `description` varchar(100) DEFAULT NULL COMMENT '用户属性关系注释'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放用户和属性对应关系';

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_user_category`
--

CREATE TABLE `5kcrm_user_category` (
  `category_id` int(11) NOT NULL COMMENT '类别id',
  `name` varchar(20) NOT NULL COMMENT '类别的名字',
  `description` varchar(100) NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放用户类别信息';

--
-- 转存表中的数据 `5kcrm_user_category`
--

INSERT INTO `5kcrm_user_category` (`category_id`, `name`, `description`) VALUES
(1, '管理员', ''),
(2, '员工', '');

-- --------------------------------------------------------

--
-- 表的结构 `5kcrm_user_smtp`
--

CREATE TABLE `5kcrm_user_smtp` (
  `smtp_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '发件箱名称',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `settinginfo` text NOT NULL COMMENT 'smtp设置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='smtp设置表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `5kcrm_action_log`
--
ALTER TABLE `5kcrm_action_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `5kcrm_announcement`
--
ALTER TABLE `5kcrm_announcement`
  ADD PRIMARY KEY (`announcement_id`);

--
-- Indexes for table `5kcrm_business`
--
ALTER TABLE `5kcrm_business`
  ADD PRIMARY KEY (`business_id`);

--
-- Indexes for table `5kcrm_business_data`
--
ALTER TABLE `5kcrm_business_data`
  ADD PRIMARY KEY (`business_id`);

--
-- Indexes for table `5kcrm_business_status`
--
ALTER TABLE `5kcrm_business_status`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`);

--
-- Indexes for table `5kcrm_business_status_flow`
--
ALTER TABLE `5kcrm_business_status_flow`
  ADD PRIMARY KEY (`flow_id`);

--
-- Indexes for table `5kcrm_comment`
--
ALTER TABLE `5kcrm_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `5kcrm_config`
--
ALTER TABLE `5kcrm_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_contacts`
--
ALTER TABLE `5kcrm_contacts`
  ADD PRIMARY KEY (`contacts_id`);

--
-- Indexes for table `5kcrm_contract`
--
ALTER TABLE `5kcrm_contract`
  ADD PRIMARY KEY (`contract_id`);

--
-- Indexes for table `5kcrm_control`
--
ALTER TABLE `5kcrm_control`
  ADD PRIMARY KEY (`control_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `5kcrm_control_module`
--
ALTER TABLE `5kcrm_control_module`
  ADD PRIMARY KEY (`module_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `5kcrm_customer`
--
ALTER TABLE `5kcrm_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `5kcrm_customer_attribute`
--
ALTER TABLE `5kcrm_customer_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_customer_attribute_group`
--
ALTER TABLE `5kcrm_customer_attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_customer_attribute_relation`
--
ALTER TABLE `5kcrm_customer_attribute_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_customer_cares`
--
ALTER TABLE `5kcrm_customer_cares`
  ADD PRIMARY KEY (`care_id`);

--
-- Indexes for table `5kcrm_customer_data`
--
ALTER TABLE `5kcrm_customer_data`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- Indexes for table `5kcrm_customer_focus`
--
ALTER TABLE `5kcrm_customer_focus`
  ADD PRIMARY KEY (`focus_id`);

--
-- Indexes for table `5kcrm_customer_record`
--
ALTER TABLE `5kcrm_customer_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_customer_share`
--
ALTER TABLE `5kcrm_customer_share`
  ADD PRIMARY KEY (`share_id`);

--
-- Indexes for table `5kcrm_email_template`
--
ALTER TABLE `5kcrm_email_template`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `5kcrm_event`
--
ALTER TABLE `5kcrm_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `5kcrm_fields`
--
ALTER TABLE `5kcrm_fields`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `5kcrm_file`
--
ALTER TABLE `5kcrm_file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `5kcrm_finance`
--
ALTER TABLE `5kcrm_finance`
  ADD PRIMARY KEY (`finance_id`);

--
-- Indexes for table `5kcrm_knowledge`
--
ALTER TABLE `5kcrm_knowledge`
  ADD PRIMARY KEY (`knowledge_id`);

--
-- Indexes for table `5kcrm_knowledge_category`
--
ALTER TABLE `5kcrm_knowledge_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `5kcrm_leads`
--
ALTER TABLE `5kcrm_leads`
  ADD PRIMARY KEY (`leads_id`);

--
-- Indexes for table `5kcrm_leads_data`
--
ALTER TABLE `5kcrm_leads_data`
  ADD PRIMARY KEY (`leads_id`);

--
-- Indexes for table `5kcrm_leads_record`
--
ALTER TABLE `5kcrm_leads_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_log`
--
ALTER TABLE `5kcrm_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `5kcrm_login_history`
--
ALTER TABLE `5kcrm_login_history`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `5kcrm_log_category`
--
ALTER TABLE `5kcrm_log_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `5kcrm_message`
--
ALTER TABLE `5kcrm_message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `to_role_id` (`to_role_id`,`from_role_id`,`read_time`);

--
-- Indexes for table `5kcrm_navigation`
--
ALTER TABLE `5kcrm_navigation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_note`
--
ALTER TABLE `5kcrm_note`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `5kcrm_payables`
--
ALTER TABLE `5kcrm_payables`
  ADD PRIMARY KEY (`payables_id`);

--
-- Indexes for table `5kcrm_paymentorder`
--
ALTER TABLE `5kcrm_paymentorder`
  ADD PRIMARY KEY (`paymentorder_id`);

--
-- Indexes for table `5kcrm_permission`
--
ALTER TABLE `5kcrm_permission`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `5kcrm_position`
--
ALTER TABLE `5kcrm_position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `5kcrm_praise`
--
ALTER TABLE `5kcrm_praise`
  ADD PRIMARY KEY (`praise_id`);

--
-- Indexes for table `5kcrm_product`
--
ALTER TABLE `5kcrm_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `5kcrm_product_attribute`
--
ALTER TABLE `5kcrm_product_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_product_attribute_group`
--
ALTER TABLE `5kcrm_product_attribute_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `5kcrm_product_attribute_relation`
--
ALTER TABLE `5kcrm_product_attribute_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_product_category`
--
ALTER TABLE `5kcrm_product_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `5kcrm_product_data`
--
ALTER TABLE `5kcrm_product_data`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `5kcrm_product_images`
--
ALTER TABLE `5kcrm_product_images`
  ADD PRIMARY KEY (`images_id`);

--
-- Indexes for table `5kcrm_receivables`
--
ALTER TABLE `5kcrm_receivables`
  ADD PRIMARY KEY (`receivables_id`);

--
-- Indexes for table `5kcrm_receivingorder`
--
ALTER TABLE `5kcrm_receivingorder`
  ADD PRIMARY KEY (`receivingorder_id`);

--
-- Indexes for table `5kcrm_role`
--
ALTER TABLE `5kcrm_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `5kcrm_role_department`
--
ALTER TABLE `5kcrm_role_department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `5kcrm_r_business_customer`
--
ALTER TABLE `5kcrm_r_business_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_business_event`
--
ALTER TABLE `5kcrm_r_business_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_business_file`
--
ALTER TABLE `5kcrm_r_business_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_business_log`
--
ALTER TABLE `5kcrm_r_business_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_business_product`
--
ALTER TABLE `5kcrm_r_business_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_business_status`
--
ALTER TABLE `5kcrm_r_business_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_business_task`
--
ALTER TABLE `5kcrm_r_business_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_contacts_customer`
--
ALTER TABLE `5kcrm_r_contacts_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_contacts_event`
--
ALTER TABLE `5kcrm_r_contacts_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_contacts_file`
--
ALTER TABLE `5kcrm_r_contacts_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_contacts_log`
--
ALTER TABLE `5kcrm_r_contacts_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_contract_file`
--
ALTER TABLE `5kcrm_r_contract_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_contract_product`
--
ALTER TABLE `5kcrm_r_contract_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_customer_event`
--
ALTER TABLE `5kcrm_r_customer_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_customer_file`
--
ALTER TABLE `5kcrm_r_customer_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_customer_log`
--
ALTER TABLE `5kcrm_r_customer_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_event_file`
--
ALTER TABLE `5kcrm_r_event_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_event_leads`
--
ALTER TABLE `5kcrm_r_event_leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_event_log`
--
ALTER TABLE `5kcrm_r_event_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_event_product`
--
ALTER TABLE `5kcrm_r_event_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_file_finance`
--
ALTER TABLE `5kcrm_r_file_finance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_file_leads`
--
ALTER TABLE `5kcrm_r_file_leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_file_log`
--
ALTER TABLE `5kcrm_r_file_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_file_product`
--
ALTER TABLE `5kcrm_r_file_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_file_task`
--
ALTER TABLE `5kcrm_r_file_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_file_user`
--
ALTER TABLE `5kcrm_r_file_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_finance_log`
--
ALTER TABLE `5kcrm_r_finance_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_leads_log`
--
ALTER TABLE `5kcrm_r_leads_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_leads_task`
--
ALTER TABLE `5kcrm_r_leads_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_log_product`
--
ALTER TABLE `5kcrm_r_log_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_log_task`
--
ALTER TABLE `5kcrm_r_log_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_log_user`
--
ALTER TABLE `5kcrm_r_log_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_r_product_task`
--
ALTER TABLE `5kcrm_r_product_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_sign`
--
ALTER TABLE `5kcrm_sign`
  ADD PRIMARY KEY (`sign_id`);

--
-- Indexes for table `5kcrm_sign_img`
--
ALTER TABLE `5kcrm_sign_img`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `5kcrm_sms_record`
--
ALTER TABLE `5kcrm_sms_record`
  ADD PRIMARY KEY (`sms_record_id`);

--
-- Indexes for table `5kcrm_sms_template`
--
ALTER TABLE `5kcrm_sms_template`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `5kcrm_task`
--
ALTER TABLE `5kcrm_task`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `5kcrm_user`
--
ALTER TABLE `5kcrm_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `5kcrm_user_attribute`
--
ALTER TABLE `5kcrm_user_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_user_attribute_group`
--
ALTER TABLE `5kcrm_user_attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_user_attribute_relation`
--
ALTER TABLE `5kcrm_user_attribute_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `5kcrm_user_category`
--
ALTER TABLE `5kcrm_user_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `5kcrm_user_smtp`
--
ALTER TABLE `5kcrm_user_smtp`
  ADD PRIMARY KEY (`smtp_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `5kcrm_action_log`
--
ALTER TABLE `5kcrm_action_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `5kcrm_announcement`
--
ALTER TABLE `5kcrm_announcement`
  MODIFY `announcement_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章id';
--
-- 使用表AUTO_INCREMENT `5kcrm_business`
--
ALTER TABLE `5kcrm_business`
  MODIFY `business_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商机id';
--
-- 使用表AUTO_INCREMENT `5kcrm_business_status`
--
ALTER TABLE `5kcrm_business_status`
  MODIFY `status_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商机状态', AUTO_INCREMENT=101;
--
-- 使用表AUTO_INCREMENT `5kcrm_business_status_flow`
--
ALTER TABLE `5kcrm_business_status_flow`
  MODIFY `flow_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '状态流id';
--
-- 使用表AUTO_INCREMENT `5kcrm_comment`
--
ALTER TABLE `5kcrm_comment`
  MODIFY `comment_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '评论id';
--
-- 使用表AUTO_INCREMENT `5kcrm_config`
--
ALTER TABLE `5kcrm_config`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `5kcrm_contacts`
--
ALTER TABLE `5kcrm_contacts`
  MODIFY `contacts_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '联系人id';
--
-- 使用表AUTO_INCREMENT `5kcrm_contract`
--
ALTER TABLE `5kcrm_contract`
  MODIFY `contract_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- 使用表AUTO_INCREMENT `5kcrm_control`
--
ALTER TABLE `5kcrm_control`
  MODIFY `control_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '操作id', AUTO_INCREMENT=79;
--
-- 使用表AUTO_INCREMENT `5kcrm_control_module`
--
ALTER TABLE `5kcrm_control_module`
  MODIFY `module_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '操作模块id', AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `5kcrm_customer`
--
ALTER TABLE `5kcrm_customer`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '客户id';
--
-- 使用表AUTO_INCREMENT `5kcrm_customer_attribute`
--
ALTER TABLE `5kcrm_customer_attribute`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分组信息主键id';
--
-- 使用表AUTO_INCREMENT `5kcrm_customer_attribute_group`
--
ALTER TABLE `5kcrm_customer_attribute_group`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '客户属性组id';
--
-- 使用表AUTO_INCREMENT `5kcrm_customer_attribute_relation`
--
ALTER TABLE `5kcrm_customer_attribute_relation`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '客户属性关系id';
--
-- 使用表AUTO_INCREMENT `5kcrm_customer_cares`
--
ALTER TABLE `5kcrm_customer_cares`
  MODIFY `care_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_customer_focus`
--
ALTER TABLE `5kcrm_customer_focus`
  MODIFY `focus_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_customer_record`
--
ALTER TABLE `5kcrm_customer_record`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_customer_share`
--
ALTER TABLE `5kcrm_customer_share`
  MODIFY `share_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_email_template`
--
ALTER TABLE `5kcrm_email_template`
  MODIFY `template_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- 使用表AUTO_INCREMENT `5kcrm_event`
--
ALTER TABLE `5kcrm_event`
  MODIFY `event_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '活动id';
--
-- 使用表AUTO_INCREMENT `5kcrm_fields`
--
ALTER TABLE `5kcrm_fields`
  MODIFY `field_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=50;
--
-- 使用表AUTO_INCREMENT `5kcrm_file`
--
ALTER TABLE `5kcrm_file`
  MODIFY `file_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '附件主键';
--
-- 使用表AUTO_INCREMENT `5kcrm_finance`
--
ALTER TABLE `5kcrm_finance`
  MODIFY `finance_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '财务id';
--
-- 使用表AUTO_INCREMENT `5kcrm_knowledge`
--
ALTER TABLE `5kcrm_knowledge`
  MODIFY `knowledge_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章id';
--
-- 使用表AUTO_INCREMENT `5kcrm_knowledge_category`
--
ALTER TABLE `5kcrm_knowledge_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章类别id';
--
-- 使用表AUTO_INCREMENT `5kcrm_leads`
--
ALTER TABLE `5kcrm_leads`
  MODIFY `leads_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '线索主键', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `5kcrm_leads_data`
--
ALTER TABLE `5kcrm_leads_data`
  MODIFY `leads_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `5kcrm_leads_record`
--
ALTER TABLE `5kcrm_leads_record`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_log`
--
ALTER TABLE `5kcrm_log`
  MODIFY `log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '日志id';
--
-- 使用表AUTO_INCREMENT `5kcrm_login_history`
--
ALTER TABLE `5kcrm_login_history`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `5kcrm_log_category`
--
ALTER TABLE `5kcrm_log_category`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `5kcrm_message`
--
ALTER TABLE `5kcrm_message`
  MODIFY `message_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_navigation`
--
ALTER TABLE `5kcrm_navigation`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `5kcrm_note`
--
ALTER TABLE `5kcrm_note`
  MODIFY `note_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_payables`
--
ALTER TABLE `5kcrm_payables`
  MODIFY `payables_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应付款id';
--
-- 使用表AUTO_INCREMENT `5kcrm_paymentorder`
--
ALTER TABLE `5kcrm_paymentorder`
  MODIFY `paymentorder_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '付款单id';
--
-- 使用表AUTO_INCREMENT `5kcrm_permission`
--
ALTER TABLE `5kcrm_permission`
  MODIFY `permission_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '权限id';
--
-- 使用表AUTO_INCREMENT `5kcrm_position`
--
ALTER TABLE `5kcrm_position`
  MODIFY `position_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '岗位id', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `5kcrm_praise`
--
ALTER TABLE `5kcrm_praise`
  MODIFY `praise_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_product`
--
ALTER TABLE `5kcrm_product`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '产品id';
--
-- 使用表AUTO_INCREMENT `5kcrm_product_attribute`
--
ALTER TABLE `5kcrm_product_attribute`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '产品属性id';
--
-- 使用表AUTO_INCREMENT `5kcrm_product_attribute_group`
--
ALTER TABLE `5kcrm_product_attribute_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品属性组id';
--
-- 使用表AUTO_INCREMENT `5kcrm_product_attribute_relation`
--
ALTER TABLE `5kcrm_product_attribute_relation`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '产品属性关系id';
--
-- 使用表AUTO_INCREMENT `5kcrm_product_category`
--
ALTER TABLE `5kcrm_product_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品类别id', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `5kcrm_product_images`
--
ALTER TABLE `5kcrm_product_images`
  MODIFY `images_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_receivables`
--
ALTER TABLE `5kcrm_receivables`
  MODIFY `receivables_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应收款id';
--
-- 使用表AUTO_INCREMENT `5kcrm_receivingorder`
--
ALTER TABLE `5kcrm_receivingorder`
  MODIFY `receivingorder_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '收款单id';
--
-- 使用表AUTO_INCREMENT `5kcrm_role`
--
ALTER TABLE `5kcrm_role`
  MODIFY `role_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '岗位id', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `5kcrm_role_department`
--
ALTER TABLE `5kcrm_role_department`
  MODIFY `department_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '部门id', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_business_customer`
--
ALTER TABLE `5kcrm_r_business_customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_business_event`
--
ALTER TABLE `5kcrm_r_business_event`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_business_file`
--
ALTER TABLE `5kcrm_r_business_file`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_business_log`
--
ALTER TABLE `5kcrm_r_business_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_business_product`
--
ALTER TABLE `5kcrm_r_business_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_business_status`
--
ALTER TABLE `5kcrm_r_business_status`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '关系主键';
--
-- 使用表AUTO_INCREMENT `5kcrm_r_business_task`
--
ALTER TABLE `5kcrm_r_business_task`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_contacts_customer`
--
ALTER TABLE `5kcrm_r_contacts_customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_contacts_event`
--
ALTER TABLE `5kcrm_r_contacts_event`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_contacts_file`
--
ALTER TABLE `5kcrm_r_contacts_file`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_contacts_log`
--
ALTER TABLE `5kcrm_r_contacts_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_contract_file`
--
ALTER TABLE `5kcrm_r_contract_file`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_contract_product`
--
ALTER TABLE `5kcrm_r_contract_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_customer_event`
--
ALTER TABLE `5kcrm_r_customer_event`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_customer_file`
--
ALTER TABLE `5kcrm_r_customer_file`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_customer_log`
--
ALTER TABLE `5kcrm_r_customer_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_event_file`
--
ALTER TABLE `5kcrm_r_event_file`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_event_leads`
--
ALTER TABLE `5kcrm_r_event_leads`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_event_log`
--
ALTER TABLE `5kcrm_r_event_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_event_product`
--
ALTER TABLE `5kcrm_r_event_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_file_finance`
--
ALTER TABLE `5kcrm_r_file_finance`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_file_leads`
--
ALTER TABLE `5kcrm_r_file_leads`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_file_log`
--
ALTER TABLE `5kcrm_r_file_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_file_product`
--
ALTER TABLE `5kcrm_r_file_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_file_task`
--
ALTER TABLE `5kcrm_r_file_task`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_file_user`
--
ALTER TABLE `5kcrm_r_file_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_finance_log`
--
ALTER TABLE `5kcrm_r_finance_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_leads_log`
--
ALTER TABLE `5kcrm_r_leads_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_leads_task`
--
ALTER TABLE `5kcrm_r_leads_task`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_log_product`
--
ALTER TABLE `5kcrm_r_log_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_log_task`
--
ALTER TABLE `5kcrm_r_log_task`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_log_user`
--
ALTER TABLE `5kcrm_r_log_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_r_product_task`
--
ALTER TABLE `5kcrm_r_product_task`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_sign`
--
ALTER TABLE `5kcrm_sign`
  MODIFY `sign_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_sign_img`
--
ALTER TABLE `5kcrm_sign_img`
  MODIFY `img_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_sms_record`
--
ALTER TABLE `5kcrm_sms_record`
  MODIFY `sms_record_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `5kcrm_sms_template`
--
ALTER TABLE `5kcrm_sms_template`
  MODIFY `template_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `5kcrm_task`
--
ALTER TABLE `5kcrm_task`
  MODIFY `task_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '任务id';
--
-- 使用表AUTO_INCREMENT `5kcrm_user`
--
ALTER TABLE `5kcrm_user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `5kcrm_user_attribute`
--
ALTER TABLE `5kcrm_user_attribute`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '属性id';
--
-- 使用表AUTO_INCREMENT `5kcrm_user_attribute_group`
--
ALTER TABLE `5kcrm_user_attribute_group`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '属性组id';
--
-- 使用表AUTO_INCREMENT `5kcrm_user_attribute_relation`
--
ALTER TABLE `5kcrm_user_attribute_relation`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id';
--
-- 使用表AUTO_INCREMENT `5kcrm_user_category`
--
ALTER TABLE `5kcrm_user_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别id', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `5kcrm_user_smtp`
--
ALTER TABLE `5kcrm_user_smtp`
  MODIFY `smtp_id` int(10) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
