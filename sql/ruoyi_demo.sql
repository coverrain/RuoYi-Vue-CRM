/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : ruoyi_demo

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 01/05/2025 14:34:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_management
-- ----------------------------
DROP TABLE IF EXISTS `account_management`;
CREATE TABLE `account_management`  (
  `account_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '账号 ID',
  `login_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `user_status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'active' COMMENT '用户状态',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`account_id`) USING BTREE,
  UNIQUE INDEX `login_account`(`login_account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '账号管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_management
-- ----------------------------

-- ----------------------------
-- Table structure for customer_management
-- ----------------------------
DROP TABLE IF EXISTS `customer_management`;
CREATE TABLE `customer_management`  (
  `customer_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '客户 ID',
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客户姓名',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `wechat_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信号',
  `xiaohongshu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小红书 ID',
  `douyin_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '抖音 ID',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  `promotion_account_id` int(0) NULL DEFAULT NULL COMMENT '推广人员账号 ID',
  `customer_service_account_id` int(0) NULL DEFAULT NULL COMMENT '客服人员账号 ID',
  `salesperson_account_id` int(0) NULL DEFAULT NULL COMMENT '销售人员账号 ID',
  `dispatch_organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '派单机构',
  `last_dispatch_time` datetime(0) NULL DEFAULT NULL COMMENT '最近派单时间',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所在地',
  `consulting_project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '咨询项目',
  `consulting_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '咨询详情',
  `customer_intention` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户意愿',
  `recorder_account_id` int(0) NULL DEFAULT NULL COMMENT '录单人账号 ID',
  `record_time` datetime(0) NULL DEFAULT NULL COMMENT '录单时间',
  `channel_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道来源',
  `boost_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否助推 ',
  `service_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客服添加',
  `sale_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '销售添加',
  PRIMARY KEY (`customer_id`) USING BTREE,
  INDEX `promotion_account_id`(`promotion_account_id`) USING BTREE,
  INDEX `customer_service_account_id`(`customer_service_account_id`) USING BTREE,
  INDEX `salesperson_account_id`(`salesperson_account_id`) USING BTREE,
  INDEX `recorder_account_id`(`recorder_account_id`) USING BTREE,
  CONSTRAINT `customer_management_ibfk_1` FOREIGN KEY (`promotion_account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customer_management_ibfk_2` FOREIGN KEY (`customer_service_account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customer_management_ibfk_3` FOREIGN KEY (`salesperson_account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customer_management_ibfk_4` FOREIGN KEY (`recorder_account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '客户管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_management
-- ----------------------------
INSERT INTO `customer_management` VALUES (1, '尹科科', '17830794096', 'ykw17830794096', 'xadas123', 'xadas123', NULL, NULL, NULL, NULL, '1', '2025-04-03 00:00:00', '重庆', NULL, '很及时啊就是大家阿珂基督教312', '1', NULL, '2025-04-22 00:00:00', NULL, '是', '1', '0');
INSERT INTO `customer_management` VALUES (2, '快快快', '1312412414', '321312414dd', '3123124124', '231312412', NULL, NULL, NULL, NULL, '2', NULL, '山东', NULL, NULL, '1', NULL, '2025-04-08 00:00:00', NULL, '是', '1', '1');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dept_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dept_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dept_manager` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dept_code`(`dept_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (2, '技术部', 'TECH001', '010-12345678', '张三');
INSERT INTO `department` VALUES (3, '市场部', 'MARK001', '010-87654321', '李四');
INSERT INTO `department` VALUES (4, '财务部', 'FIN001', '010-56781234', '王五');

-- ----------------------------
-- Table structure for employee_management
-- ----------------------------
DROP TABLE IF EXISTS `employee_management`;
CREATE TABLE `employee_management`  (
  `employee_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '员工 ID',
  `account_id` int(0) NOT NULL COMMENT '关联的账号 ID',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`employee_id`) USING BTREE,
  UNIQUE INDEX `account_id`(`account_id`) USING BTREE,
  CONSTRAINT `employee_management_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '员工管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_management
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'department', 'department', NULL, NULL, 'Department', 'crud', 'element-ui', 'com.ruoyi.staff', 'staff', 'department', '部门', 'ruoyi', '0', '/', '{\"parentMenuId\":1}', 'admin', '2025-04-24 15:07:06', '', '2025-04-24 17:30:07', NULL);
INSERT INTO `gen_table` VALUES (3, 'employee_management', '员工管理表', NULL, NULL, 'EmployeeManagement', 'crud', '', 'com.ruoyi.system', 'system', 'management', '员工管理', 'ruoyi', '0', '/', NULL, 'admin', '2025-04-27 10:27:51', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'internal_duplicate_check', '内部查重表', NULL, NULL, 'InternalDuplicateCheck', 'crud', 'element-ui', 'com.ruoyi.check', 'check', 'check', '内部查重', 'ruoyi', '0', '/', '{\"parentMenuId\":0}', 'admin', '2025-04-27 10:28:28', '', '2025-04-28 15:08:01', NULL);
INSERT INTO `gen_table` VALUES (5, 'customer_management', '客户管理表', NULL, NULL, 'CustomerManagement', 'crud', 'element-ui', 'com.ruoyi.customer', 'customer', 'customerManagement', '客户管理', 'ruoyi', '0', '/', '{\"parentMenuId\":1}', 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30', NULL);
INSERT INTO `gen_table` VALUES (6, 'account_management', '账号管理表', NULL, NULL, 'AccountManagement', 'crud', 'element-ui', 'com.ruoyi.account', 'account', 'accountManagement', '账号管理', 'ruoyi', '0', '/', '{}', 'admin', '2025-04-30 11:29:41', '', '2025-04-30 11:31:51', NULL);
INSERT INTO `gen_table` VALUES (10, 'transaction_statistics', '成交统计表', NULL, NULL, 'TransactionStatistics', 'crud', 'element-ui', 'com.ruoyi.statistics', 'statistics', 'statistics', '成交统计', 'ruoyi', '0', '/', '{\"parentMenuId\":0}', 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59', NULL);
INSERT INTO `gen_table` VALUES (11, 'performance_statistics_by_promoter', '业绩统计（按推广人）表', NULL, NULL, 'PerformanceStatisticsByPromoter', 'crud', 'element-ui', 'com.ruoyi.promoter', 'promoter', 'promoter', '业绩统计（按推广人）', 'ruoyi', '0', '/', '{\"parentMenuId\":0}', 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48', NULL);
INSERT INTO `gen_table` VALUES (12, 'promotion_order_entry', '推广录单表', NULL, NULL, 'PromotionOrderEntry', 'crud', '', 'com.ruoyi.system', 'system', 'entry', '推广录单', 'ruoyi', '0', '/', NULL, 'admin', '2025-05-01 12:13:56', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(0) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-24 15:07:06', '', '2025-04-24 17:30:07');
INSERT INTO `gen_table_column` VALUES (2, 1, 'dept_name', '', 'varchar(100)', 'String', 'deptName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-04-24 15:07:06', '', '2025-04-24 17:30:07');
INSERT INTO `gen_table_column` VALUES (3, 1, 'dept_code', '', 'varchar(50)', 'String', 'deptCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-04-24 15:07:06', '', '2025-04-24 17:30:07');
INSERT INTO `gen_table_column` VALUES (4, 1, 'dept_phone', '', 'varchar(20)', 'String', 'deptPhone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-24 15:07:06', '', '2025-04-24 17:30:07');
INSERT INTO `gen_table_column` VALUES (5, 1, 'dept_manager', '', 'varchar(100)', 'String', 'deptManager', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-24 15:07:06', '', '2025-04-24 17:30:07');
INSERT INTO `gen_table_column` VALUES (25, 3, 'employee_id', '员工 ID', 'int', 'Long', 'employeeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-27 10:27:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, 3, 'account_id', '关联的账号 ID', 'int', 'Long', 'accountId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-27 10:27:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, 3, 'role', '角色', 'varchar(50)', 'String', 'role', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-04-27 10:27:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, 3, 'department', '部门', 'varchar(255)', 'String', 'department', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-27 10:27:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, 4, 'check_id', '查重记录 ID', 'int', 'Long', 'checkId', '1', '1', '0', '1', NULL, '1', '1', 'EQ', 'input', '', 1, 'admin', '2025-04-27 10:28:28', '', '2025-04-28 15:08:01');
INSERT INTO `gen_table_column` VALUES (30, 4, 'phone_number', '手机号', 'varchar(20)', 'String', 'phoneNumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-27 10:28:28', '', '2025-04-28 15:08:01');
INSERT INTO `gen_table_column` VALUES (31, 4, 'wechat_id', '微信号', 'varchar(255)', 'String', 'wechatId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-04-27 10:28:28', '', '2025-04-28 15:08:01');
INSERT INTO `gen_table_column` VALUES (32, 4, 'douyin_id', '抖音 ID', 'varchar(255)', 'String', 'douyinId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-27 10:28:28', '', '2025-04-28 15:08:01');
INSERT INTO `gen_table_column` VALUES (33, 4, 'organization_name', '机构名称', 'varchar(255)', 'String', 'organizationName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2025-04-27 10:28:28', '', '2025-04-28 15:08:01');
INSERT INTO `gen_table_column` VALUES (34, 4, 'credit_code', '统一社会信用代码', 'varchar(255)', 'String', 'creditCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-27 10:28:28', '', '2025-04-28 15:08:01');
INSERT INTO `gen_table_column` VALUES (35, 4, 'check_time', '查重时间', 'datetime', 'Date', 'checkTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2025-04-27 10:28:28', '', '2025-04-28 15:08:01');
INSERT INTO `gen_table_column` VALUES (36, 4, 'customer_id', '关联的客户 ID', 'int', 'Long', 'customerId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-04-27 10:28:28', '', '2025-04-28 15:08:01');
INSERT INTO `gen_table_column` VALUES (37, 5, 'customer_id', '客户 ID', 'int', 'Long', 'customerId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (38, 5, 'customer_name', '客户姓名', 'varchar(255)', 'String', 'customerName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (39, 5, 'phone_number', '手机号', 'varchar(20)', 'String', 'phoneNumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (40, 5, 'wechat_id', '微信号', 'varchar(255)', 'String', 'wechatId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (41, 5, 'xiaohongshu_id', '小红书 ID', 'varchar(255)', 'String', 'xiaohongshuId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (42, 5, 'douyin_id', '抖音 ID', 'varchar(255)', 'String', 'douyinId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (43, 5, 'type', '类型', 'varchar(50)', 'String', 'type', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (44, 5, 'promotion_account_id', '推广人员账号 ID', 'int', 'Long', 'promotionAccountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (45, 5, 'customer_service_account_id', '客服人员账号 ID', 'int', 'Long', 'customerServiceAccountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (46, 5, 'salesperson_account_id', '销售人员账号 ID', 'int', 'Long', 'salespersonAccountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (47, 5, 'dispatch_organization', '派单机构', 'varchar(255)', 'String', 'dispatchOrganization', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'order_institution_group', 11, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (48, 5, 'last_dispatch_time', '最近派单时间', 'datetime', 'Date', 'lastDispatchTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (49, 5, 'location', '所在地', 'varchar(255)', 'String', 'location', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (50, 5, 'consulting_project', '咨询项目', 'varchar(255)', 'String', 'consultingProject', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'consulting_project_type', 14, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (51, 5, 'consulting_details', '咨询详情', 'text', 'String', 'consultingDetails', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 15, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (52, 5, 'customer_intention', '客户意愿', 'varchar(255)', 'String', 'customerIntention', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'customer_intention_type', 16, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (53, 5, 'recorder_account_id', '录单人账号 ID', 'int', 'Long', 'recorderAccountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (54, 5, 'record_time', '录单时间', 'datetime', 'Date', 'recordTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 18, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (55, 5, 'channel_source', '渠道来源', 'varchar(255)', 'String', 'channelSource', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'channel_source', 19, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (56, 5, 'boost_status', '是否助推 ', 'char(1)', 'String', 'boostStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 20, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (57, 5, 'service_status', '客服添加', 'char(1)', 'String', 'serviceStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 21, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (58, 5, 'sale_status', '销售添加', 'char(1)', 'String', 'saleStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 22, 'admin', '2025-04-27 10:54:20', '', '2025-04-27 11:21:30');
INSERT INTO `gen_table_column` VALUES (59, 6, 'account_id', '账号 ID', 'int', 'Long', 'accountId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-30 11:29:42', '', '2025-04-30 11:31:51');
INSERT INTO `gen_table_column` VALUES (60, 6, 'login_account', '登录账号', 'varchar(255)', 'String', 'loginAccount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-30 11:29:42', '', '2025-04-30 11:31:51');
INSERT INTO `gen_table_column` VALUES (61, 6, 'user_name', '用户名', 'varchar(255)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-04-30 11:29:42', '', '2025-04-30 11:31:51');
INSERT INTO `gen_table_column` VALUES (62, 6, 'phone_number', '手机号码', 'varchar(20)', 'String', 'phoneNumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-30 11:29:42', '', '2025-04-30 11:31:51');
INSERT INTO `gen_table_column` VALUES (63, 6, 'user_status', '用户状态', 'enum(\'active\',\'inactive\')', 'String', 'userStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2025-04-30 11:29:42', '', '2025-04-30 11:31:51');
INSERT INTO `gen_table_column` VALUES (64, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2025-04-30 11:29:42', '', '2025-04-30 11:31:51');
INSERT INTO `gen_table_column` VALUES (65, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-04-30 11:29:42', '', '2025-04-30 11:31:51');
INSERT INTO `gen_table_column` VALUES (119, 10, 'statistics_id', '统计记录 ID', 'int', 'Long', 'statisticsId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (120, 10, 'name', '姓名', 'varchar(255)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (121, 10, 'phone_number', '手机号', 'varchar(20)', 'String', 'phoneNumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (122, 10, 'xiaohongshu_id', '小红书 ID', 'varchar(255)', 'String', 'xiaohongshuId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (123, 10, 'wechat', '微信', 'varchar(255)', 'String', 'wechat', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (124, 10, 'order_entry_time', '录单时间', 'datetime', 'Date', 'orderEntryTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (125, 10, 'transaction_status', '成交状态', 'varchar(50)', 'String', 'transactionStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'transaction_status', 7, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (126, 10, 'transaction_date', '成交日期', 'datetime', 'Date', 'transactionDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (127, 10, 'transaction_organization', '成交机构', 'varchar(255)', 'String', 'transactionOrganization', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', 'order_institution_group', 9, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (128, 10, 'transaction_project', '成交项目', 'varchar(255)', 'String', 'transactionProject', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', 'consulting_project_type', 10, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (129, 10, 'transaction_amount', '成交金额', 'decimal(10,2)', 'BigDecimal', 'transactionAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (130, 10, 'rebate_ratio', '返点比例', 'decimal(5,2)', 'BigDecimal', 'rebateRatio', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (131, 10, 'rebate_amount', '返点金额', 'decimal(10,2)', 'BigDecimal', 'rebateAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (132, 10, 'balance', '尾款', 'decimal(10,2)', 'BigDecimal', 'balance', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (133, 10, 'paid_amount', '已补缴', 'decimal(10,2)', 'BigDecimal', 'paidAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (134, 10, 'to_be_paid_amount', '待补缴', 'decimal(10,2)', 'BigDecimal', 'toBePaidAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (135, 10, 'type', '类型', 'varchar(50)', 'String', 'type', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 17, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (136, 10, 'customer_service_account_id', '客服账号 ID', 'int', 'Long', 'customerServiceAccountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (137, 10, 'channel_source', '渠道来源', 'varchar(255)', 'String', 'channelSource', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', 'channel_source', 19, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (138, 10, 'promotion_account_id', '推广人账号 ID', 'int', 'Long', 'promotionAccountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (139, 10, 'salesperson_account_id', '销售人员账号 ID', 'int', 'Long', 'salespersonAccountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (140, 10, 'recorder_account_id', '录单人账号 ID', 'int', 'Long', 'recorderAccountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (141, 10, 'customer_id', '关联的客户 ID', 'int', 'Long', 'customerId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2025-05-01 12:10:55', '', '2025-05-01 13:24:59');
INSERT INTO `gen_table_column` VALUES (142, 11, 'performance_id', '业绩统计记录 ID', 'int', 'Long', 'performanceId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48');
INSERT INTO `gen_table_column` VALUES (143, 11, 'promoter_account_id', '推广人账号 ID', 'int', 'Long', 'promoterAccountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48');
INSERT INTO `gen_table_column` VALUES (145, 11, 'lead_quantity', '线索量', 'int', 'Long', 'leadQuantity', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48');
INSERT INTO `gen_table_column` VALUES (146, 11, 'duplicate_order_quantity', '重单量', 'int', 'Long', 'duplicateOrderQuantity', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48');
INSERT INTO `gen_table_column` VALUES (147, 11, 'duplicate_order_rate', '重单率', 'decimal(5,2)', 'BigDecimal', 'duplicateOrderRate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48');
INSERT INTO `gen_table_column` VALUES (148, 11, 'addition_quantity', '添加量', 'int', 'Long', 'additionQuantity', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48');
INSERT INTO `gen_table_column` VALUES (149, 11, 'addition_rate', '添加率', 'decimal(5,2)', 'BigDecimal', 'additionRate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48');
INSERT INTO `gen_table_column` VALUES (150, 11, 'transaction_quantity', '成交量', 'int', 'Long', 'transactionQuantity', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48');
INSERT INTO `gen_table_column` VALUES (151, 11, 'transaction_rate', '成交率', 'decimal(5,2)', 'BigDecimal', 'transactionRate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48');
INSERT INTO `gen_table_column` VALUES (152, 11, 'transaction_amount', '成交金额', 'decimal(10,2)', 'BigDecimal', 'transactionAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48');
INSERT INTO `gen_table_column` VALUES (153, 11, 'rebate_amount', '返款金额', 'decimal(10,2)', 'BigDecimal', 'rebateAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48');
INSERT INTO `gen_table_column` VALUES (154, 11, 'statistical_time_period', '统计时间段', 'varchar(50)', 'String', 'statisticalTimePeriod', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-05-01 12:13:56', '', '2025-05-01 13:25:48');
INSERT INTO `gen_table_column` VALUES (155, 12, 'order_id', '订单 ID', 'int', 'Long', 'orderId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (156, 12, 'wechat', '微信', 'varchar(255)', 'String', 'wechat', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (157, 12, 'douyin_id', '抖音 ID', 'varchar(255)', 'String', 'douyinId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (158, 12, 'xiaohongshu_ip', '小红书 IP', 'varchar(20)', 'String', 'xiaohongshuIp', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (159, 12, 'xiaohongshu_id', '小红书 ID', 'varchar(255)', 'String', 'xiaohongshuId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (160, 12, 'channel', '渠道', 'varchar(50)', 'String', 'channel', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (161, 12, 'type', '类型', 'varchar(50)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (162, 12, 'promotion_account_id', '推广人账号 ID', 'int', 'Long', 'promotionAccountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (163, 12, 'recorder_account_id', '录单人账号 ID', 'int', 'Long', 'recorderAccountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (164, 12, 'customer_service_account_id', '客服账号 ID', 'int', 'Long', 'customerServiceAccountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (165, 12, 'consulting_project', '咨询项目', 'varchar(255)', 'String', 'consultingProject', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (166, 12, 'consulting_area', '咨询地区', 'varchar(255)', 'String', 'consultingArea', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (167, 12, 'customer_intention', '客户意向', 'varchar(255)', 'String', 'customerIntention', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (168, 12, 'consulting_details', '咨询详情', 'text', 'String', 'consultingDetails', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 14, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (169, 12, 'wechat_qr_code', '微信二维码', 'text', 'String', 'wechatQrCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 15, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (170, 12, 'entry_time', '录入时间', 'datetime', 'Date', 'entryTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (171, 12, 'customer_id', '关联的客户 ID', 'int', 'Long', 'customerId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2025-05-01 12:13:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (172, 11, 'department_id', '部门ID', 'int', 'Long', 'departmentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2025-05-01 12:46:40', '', '2025-05-01 13:25:48');

-- ----------------------------
-- Table structure for internal_duplicate_check
-- ----------------------------
DROP TABLE IF EXISTS `internal_duplicate_check`;
CREATE TABLE `internal_duplicate_check`  (
  `check_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '查重记录 ID',
  `check_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '查重时间',
  `customer_id` int(0) NULL DEFAULT NULL COMMENT '关联的客户 ID',
  PRIMARY KEY (`check_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `internal_duplicate_check_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_management` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '内部查重表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of internal_duplicate_check
-- ----------------------------
INSERT INTO `internal_duplicate_check` VALUES (1, '2025-04-29 00:00:00', 1);

-- ----------------------------
-- Table structure for performance_statistics_by_promoter
-- ----------------------------
DROP TABLE IF EXISTS `performance_statistics_by_promoter`;
CREATE TABLE `performance_statistics_by_promoter`  (
  `performance_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '业绩统计记录 ID',
  `promoter_account_id` int(0) NULL DEFAULT NULL COMMENT '推广人账号 ID',
  `department_id` int(0) NULL DEFAULT NULL COMMENT '部门ID',
  `lead_quantity` int(0) NULL DEFAULT NULL COMMENT '线索量',
  `duplicate_order_quantity` int(0) NULL DEFAULT NULL COMMENT '重单量',
  `duplicate_order_rate` decimal(5, 2) NULL DEFAULT NULL COMMENT '重单率',
  `addition_quantity` int(0) NULL DEFAULT NULL COMMENT '添加量',
  `addition_rate` decimal(5, 2) NULL DEFAULT NULL COMMENT '添加率',
  `transaction_quantity` int(0) NULL DEFAULT NULL COMMENT '成交量',
  `transaction_rate` decimal(5, 2) NULL DEFAULT NULL COMMENT '成交率',
  `transaction_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '成交金额',
  `rebate_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '返款金额',
  `statistical_time_period` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '统计时间段',
  PRIMARY KEY (`performance_id`) USING BTREE,
  INDEX `promoter_account_id`(`promoter_account_id`) USING BTREE,
  CONSTRAINT `performance_statistics_by_promoter_ibfk_1` FOREIGN KEY (`promoter_account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业绩统计（按推广人）表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of performance_statistics_by_promoter
-- ----------------------------
INSERT INTO `performance_statistics_by_promoter` VALUES (1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for promotion_order_entry
-- ----------------------------
DROP TABLE IF EXISTS `promotion_order_entry`;
CREATE TABLE `promotion_order_entry`  (
  `order_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单 ID',
  `wechat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信',
  `douyin_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '抖音 ID',
  `xiaohongshu_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小红书 IP',
  `xiaohongshu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小红书 ID',
  `channel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型',
  `promotion_account_id` int(0) NULL DEFAULT NULL COMMENT '推广人账号 ID',
  `recorder_account_id` int(0) NULL DEFAULT NULL COMMENT '录单人账号 ID',
  `customer_service_account_id` int(0) NULL DEFAULT NULL COMMENT '客服账号 ID',
  `consulting_project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '咨询项目',
  `consulting_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '咨询地区',
  `customer_intention` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户意向',
  `consulting_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '咨询详情',
  `wechat_qr_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '微信二维码',
  `entry_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '录入时间',
  `customer_id` int(0) NULL DEFAULT NULL COMMENT '关联的客户 ID',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `promotion_account_id`(`promotion_account_id`) USING BTREE,
  INDEX `recorder_account_id`(`recorder_account_id`) USING BTREE,
  INDEX `customer_service_account_id`(`customer_service_account_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `promotion_order_entry_ibfk_1` FOREIGN KEY (`promotion_account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `promotion_order_entry_ibfk_2` FOREIGN KEY (`recorder_account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `promotion_order_entry_ibfk_3` FOREIGN KEY (`customer_service_account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `promotion_order_entry_ibfk_4` FOREIGN KEY (`customer_id`) REFERENCES `customer_management` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '推广录单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion_order_entry
-- ----------------------------

-- ----------------------------
-- Table structure for public_sea_data
-- ----------------------------
DROP TABLE IF EXISTS `public_sea_data`;
CREATE TABLE `public_sea_data`  (
  `sea_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公海记录 ID',
  `customer_id` int(0) NULL DEFAULT NULL COMMENT '关联的客户 ID',
  `entry_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '进入公海时间',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源（如从哪个模块进入公海）',
  PRIMARY KEY (`sea_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `public_sea_data_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_management` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公海数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of public_sea_data
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-04-08 20:23:21', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-04-08 20:23:21', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-04-08 20:23:21', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-04-08 20:23:21', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-04-08 20:23:21', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-04-08 20:23:21', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-08 20:23:18', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-08 20:23:18', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-08 20:23:18', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-08 20:23:18', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-08 20:23:18', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-08 20:23:18', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-08 20:23:18', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-08 20:23:18', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-08 20:23:18', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-08 20:23:18', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', 'default', 'Y', '0', 'admin', '2025-04-08 20:23:21', 'admin', '2025-04-27 10:19:43', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', '是', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-04-08 20:23:21', 'admin', '2025-04-27 14:25:38', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', '否', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-04-08 20:23:21', 'admin', '2025-04-27 14:25:43', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 4, '雌', '3', 'sys_user_sex', NULL, 'default', 'N', '0', 'admin', '2025-04-27 10:06:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '新东方机构1', '1', 'order_institution_group', NULL, 'default', 'N', '0', 'admin', '2025-04-27 11:10:11', 'admin', '2025-04-27 11:10:45', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 2, '黑马IT教育', '2', 'order_institution_group', NULL, 'default', 'N', '0', 'admin', '2025-04-27 11:10:35', 'admin', '2025-04-27 11:10:50', NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, '考公', '1', 'consulting_project_type', NULL, 'default', 'N', '0', 'admin', '2025-04-27 11:11:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 2, '考研', '2', 'consulting_project_type', NULL, 'default', 'N', '0', 'admin', '2025-04-27 11:12:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 3, '事业编', '3', 'consulting_project_type', NULL, 'default', 'N', '0', 'admin', '2025-04-27 11:12:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 1, '初步考虑', '1', 'customer_intention_type', NULL, 'default', 'N', '0', 'admin', '2025-04-27 11:12:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 2, '进一步考虑', '2', 'customer_intention_type', NULL, 'default', 'N', '0', 'admin', '2025-04-27 11:13:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 3, '下决定', '3', 'customer_intention_type', NULL, 'default', 'N', '0', 'admin', '2025-04-27 11:13:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 1, '已添加', '1', 'add_status', NULL, 'success', 'N', '0', 'admin', '2025-04-27 14:41:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 2, '未添加', '0', 'add_status', NULL, 'warning', 'N', '0', 'admin', '2025-04-27 14:41:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 1, '已成交', '0', 'transaction_status', NULL, 'success', 'N', '0', 'admin', '2025-05-01 12:19:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 2, '未成交', '1', 'transaction_status', NULL, 'danger', 'N', '0', 'admin', '2025-05-01 12:19:37', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-04-08 20:23:21', 'admin', '2025-04-27 09:49:18', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-04-08 20:23:21', 'admin', '2025-04-27 09:51:22', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-04-08 20:23:21', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '派单机构分组', 'order_institution_group', '0', 'admin', '2025-04-27 11:01:13', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '渠道来源', 'channel_source', '0', 'admin', '2025-04-27 11:02:54', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '所在地', 'address', '0', 'admin', '2025-04-27 11:03:21', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '咨询项目类型', 'consulting_project_type', '0', 'admin', '2025-04-27 11:04:25', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '客户意愿类型', 'customer_intention_type', '0', 'admin', '2025-04-27 11:05:12', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '添加状态', 'add_status', '0', 'admin', '2025-04-27 14:40:49', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '成交状态', 'transaction_status', '0', 'admin', '2025-05-01 12:18:43', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-04-08 20:23:21', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-04-08 20:23:21', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-04-08 20:23:21', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-04-09 02:12:03');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-04-09 08:34:59');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-04-09 08:35:04');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-04-09 08:36:26');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-04-21 14:04:18');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-04-21 15:51:45');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-04-21 16:11:45');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-04-21 16:11:53');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-04-21 16:13:06');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-04-21 16:13:16');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-04-21 16:14:12');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-04-21 16:16:03');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-04-21 16:39:09');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2025-04-21 16:45:23');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 14:52:32');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-24 15:42:31');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 15:42:38');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-24 15:47:27');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 15:47:33');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-24 15:56:23');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 15:56:29');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-24 16:07:09');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 16:07:41');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 17:26:35');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 18:28:38');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-25 15:24:03');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 15:24:13');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 16:09:16');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-26 00:50:21');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 09:09:05');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-27 11:31:40');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 11:31:46');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 12:21:54');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 14:07:12');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 15:53:18');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-27 16:16:12');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:16:53');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-27 16:43:24');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:43:35');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 22:48:50');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-28 09:28:25');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 09:28:29');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-28 10:50:45');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 10:50:50');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 14:46:23');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 16:33:34');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 17:09:30');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 00:05:36');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 16:03:57');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 23:29:06');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-30 08:49:13');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-30 10:03:53');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-30 10:33:00');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-30 10:33:11');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-30 14:39:24');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-30 14:43:35');
INSERT INTO `sys_logininfor` VALUES (156, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-30 14:43:47');
INSERT INTO `sys_logininfor` VALUES (157, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-30 14:44:25');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-30 14:44:29');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-01 01:17:34');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-01 11:52:46');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-01 13:22:47');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-01 14:23:05');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-01 14:23:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2032 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-04-08 20:23:18', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2025-04-08 20:23:18', 'admin', '2025-05-01 12:38:13', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-04-08 20:23:18', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2025-04-08 20:23:18', 'admin', '2025-05-01 12:37:51', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-04-08 20:23:18', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-04-08 20:23:18', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-04-08 20:23:18', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-04-08 20:23:18', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-04-08 20:23:18', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-04-08 20:23:18', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-04-08 20:23:18', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-04-08 20:23:18', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-04-08 20:23:18', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-04-08 20:23:18', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-04-08 20:23:18', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-04-08 20:23:18', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-04-08 20:23:18', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-04-08 20:23:18', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-04-08 20:23:18', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-04-08 20:23:18', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-04-08 20:23:18', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-04-08 20:23:18', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-04-08 20:23:18', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-04-08 20:23:18', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-04-08 20:23:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-04-08 20:23:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-04-08 20:23:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-04-08 20:23:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-04-08 20:23:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-04-08 20:23:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-04-08 20:23:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '部门', 1, 5, 'department', 'staff/department/index', NULL, '', 1, 0, 'C', '0', '0', 'staff:department:list', 'peoples', 'admin', '2025-04-24 17:35:44', 'admin', '2025-05-01 12:37:09', '部门菜单');
INSERT INTO `sys_menu` VALUES (2014, '部门查询', 2013, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'staff:department:query', '#', 'admin', '2025-04-24 17:35:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '部门新增', 2013, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'staff:department:add', '#', 'admin', '2025-04-24 17:35:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '部门修改', 2013, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'staff:department:edit', '#', 'admin', '2025-04-24 17:35:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '部门删除', 2013, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'staff:department:remove', '#', 'admin', '2025-04-24 17:35:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '部门导出', 2013, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'staff:department:export', '#', 'admin', '2025-04-24 17:35:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '客户管理', 0, 1, 'customerManagement', 'customer/customerManagement/index', NULL, '', 1, 0, 'C', '0', '0', 'customer:customerManagement:list', 'wechat', 'admin', '2025-04-27 11:37:08', 'admin', '2025-04-27 15:54:10', '客户管理菜单');
INSERT INTO `sys_menu` VALUES (2020, '客户管理查询', 2019, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'customer:customerManagement:query', '#', 'admin', '2025-04-27 11:37:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '客户管理新增', 2019, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'customer:customerManagement:add', '#', 'admin', '2025-04-27 11:37:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '客户管理修改', 2019, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'customer:customerManagement:edit', '#', 'admin', '2025-04-27 11:37:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '客户管理删除', 2019, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'customer:customerManagement:remove', '#', 'admin', '2025-04-27 11:37:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '客户管理导出', 2019, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'customer:customerManagement:export', '#', 'admin', '2025-04-27 11:37:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '推广录入', 0, 1, 'promoteManagement', 'promotion/promoteManagement/index', NULL, '', 1, 0, 'C', '0', '0', 'promotion:promoteManagement:list', 'edit', 'admin', '2025-04-27 16:01:20', 'admin', '2025-04-27 16:09:35', '');
INSERT INTO `sys_menu` VALUES (2026, '内部查重', 0, 1, 'check', 'check/check/index', NULL, '', 1, 0, 'C', '0', '0', 'check:check:list', 'dict', 'admin', '2025-04-28 15:51:12', 'admin', '2025-04-28 15:53:38', '内部查重菜单');
INSERT INTO `sys_menu` VALUES (2027, '内部查重查询', 2026, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'check:check:query', '#', 'admin', '2025-04-28 15:51:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '内部查重新增', 2026, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'check:check:add', '#', 'admin', '2025-04-28 15:51:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '内部查重修改', 2026, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'check:check:edit', '#', 'admin', '2025-04-28 15:51:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '内部查重删除', 2026, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'check:check:remove', '#', 'admin', '2025-04-28 15:51:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '内部查重导出', 2026, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'check:check:export', '#', 'admin', '2025-04-28 15:51:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '数据分析', 0, 5, 'dataAnalysis', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'chart', 'admin', '2025-05-01 12:25:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '业绩统计', 2032, 2, 'performanceMetrics', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2025-05-01 12:35:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '按推广人', 2034, 1, 'promoter', 'promoter/promoter/index', NULL, '', 1, 0, 'C', '0', '0', 'promoter:promoter:list', 'education', 'admin', '2025-05-01 14:11:22', 'admin', '2025-05-01 14:25:12', '业绩统计（按推广人）菜单');
INSERT INTO `sys_menu` VALUES (2037, '业绩统计（按推广人）查询', 2036, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'promoter:promoter:query', '#', 'admin', '2025-05-01 14:11:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '业绩统计（按推广人）新增', 2036, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'promoter:promoter:add', '#', 'admin', '2025-05-01 14:11:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '业绩统计（按推广人）修改', 2036, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'promoter:promoter:edit', '#', 'admin', '2025-05-01 14:11:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '业绩统计（按推广人）删除', 2036, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'promoter:promoter:remove', '#', 'admin', '2025-05-01 14:11:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '业绩统计（按推广人）导出', 2036, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'promoter:promoter:export', '#', 'admin', '2025-05-01 14:11:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '成交统计', 2032, 1, 'statistics', 'statistics/statistics/index', NULL, '', 1, 0, 'C', '0', '0', 'statistics:statistics:list', 'date', 'admin', '2025-05-01 14:30:34', 'admin', '2025-05-01 14:33:14', '成交统计菜单');
INSERT INTO `sys_menu` VALUES (2043, '成交统计查询', 2042, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'statistics:statistics:query', '#', 'admin', '2025-05-01 14:30:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '成交统计新增', 2042, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'statistics:statistics:add', '#', 'admin', '2025-05-01 14:30:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '成交统计修改', 2042, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'statistics:statistics:edit', '#', 'admin', '2025-05-01 14:30:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '成交统计删除', 2042, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'statistics:statistics:remove', '#', 'admin', '2025-05-01 14:30:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '成交统计导出', 2042, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'statistics:statistics:export', '#', 'admin', '2025-05-01 14:30:34', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-04-08 20:23:21', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-04-08 20:23:21', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(0) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 224 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"信息管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"staff\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 14:58:38', 32);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"department\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 15:07:06', 105);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"Department\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"部门id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptName\",\"columnComment\":\"部门名称\",\"columnId\":2,\"columnName\":\"dept_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptCode\",\"columnComment\":\"部门编码\",\"columnId\":3,\"columnName\":\"dept_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptPhone\",\"columnComment\":\"部门联系电话\",\"columnId\":4,\"columnName\":\"dept_phone\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 15:10:24', 40);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"department\"}', NULL, 0, NULL, '2025-04-24 15:10:38', 387);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"staff/department/index\",\"createTime\":\"2025-04-24 15:34:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"部门\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"department\",\"perms\":\"staff:department:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 15:38:21', 33);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"staff/department/index\",\"createTime\":\"2025-04-24 15:34:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"部门\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"department\",\"perms\":\"staff:department:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 15:51:39', 36);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"staff/department/index\",\"createTime\":\"2025-04-24 15:34:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"部门\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"department\",\"perms\":\"staff:department:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 15:53:40', 9);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"Department\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"部门id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-24 15:10:24\",\"usableColumn\":false},{\"capJavaField\":\"DeptName\",\"columnComment\":\"部门名称\",\"columnId\":2,\"columnName\":\"dept_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-24 15:10:24\",\"usableColumn\":false},{\"capJavaField\":\"DeptCode\",\"columnComment\":\"部门编码\",\"columnId\":3,\"columnName\":\"dept_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-24 15:10:24\",\"usableColumn\":false},{\"capJavaField\":\"DeptPhone\",\"columnComment\":\"部门联系电话\",\"columnId\":4,\"columnName\":\"dept_phone\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 16:00:14', 52);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"Department\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"部门id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-24 16:00:14\",\"usableColumn\":false},{\"capJavaField\":\"DeptName\",\"columnComment\":\"部门名称\",\"columnId\":2,\"columnName\":\"dept_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-24 16:00:14\",\"usableColumn\":false},{\"capJavaField\":\"DeptCode\",\"columnComment\":\"部门编码\",\"columnId\":3,\"columnName\":\"dept_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-24 16:00:14\",\"usableColumn\":false},{\"capJavaField\":\"DeptPhone\",\"columnComment\":\"部门联系电话\",\"columnId\":4,\"columnName\":\"dept_phone\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 16:00:42', 31);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"department\"}', NULL, 0, NULL, '2025-04-24 16:00:44', 63);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2001', '127.0.0.1', '内网IP', '2001', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-24 16:30:41', 16);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2006', '127.0.0.1', '内网IP', '2006', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 16:30:51', 41);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2005', '127.0.0.1', '内网IP', '2005', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 16:30:54', 12);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2004', '127.0.0.1', '内网IP', '2004', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 16:30:57', 13);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2003', '127.0.0.1', '内网IP', '2003', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 16:30:59', 13);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 16:31:02', 12);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2001', '127.0.0.1', '内网IP', '2001', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 16:31:05', 16);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2007', '127.0.0.1', '内网IP', '2007', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-24 17:26:55', 21);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2008', '127.0.0.1', '内网IP', '2008', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:26:59', 20);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2010', '127.0.0.1', '内网IP', '2010', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:27:02', 19);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2009', '127.0.0.1', '内网IP', '2009', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:27:04', 15);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2011', '127.0.0.1', '内网IP', '2011', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:27:06', 12);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2012', '127.0.0.1', '内网IP', '2012', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:27:08', 14);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2007', '127.0.0.1', '内网IP', '2007', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:27:12', 10);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"Department\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"部门id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-24 16:00:42\",\"usableColumn\":false},{\"capJavaField\":\"DeptName\",\"columnComment\":\"部门名称\",\"columnId\":2,\"columnName\":\"dept_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-24 16:00:42\",\"usableColumn\":false},{\"capJavaField\":\"DeptCode\",\"columnComment\":\"部门编码\",\"columnId\":3,\"columnName\":\"dept_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-24 16:00:42\",\"usableColumn\":false},{\"capJavaField\":\"DeptPhone\",\"columnComment\":\"部门联系电话\",\"columnId\":4,\"columnName\":\"dept_phone\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:29:01', 86);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/department', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:29:43', 65);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"Department\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-24 17:29:43\",\"usableColumn\":false},{\"capJavaField\":\"DeptName\",\"columnComment\":\"\",\"columnId\":2,\"columnName\":\"dept_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-24 17:29:43\",\"usableColumn\":false},{\"capJavaField\":\"DeptCode\",\"columnComment\":\"\",\"columnId\":3,\"columnName\":\"dept_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-24 17:29:43\",\"usableColumn\":false},{\"capJavaField\":\"DeptPhone\",\"columnComment\":\"\",\"columnId\":4,\"columnName\":\"dept_phone\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-24 15:07:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIn', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:30:07', 28);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"department\"}', NULL, 0, NULL, '2025-04-24 17:30:10', 484);
INSERT INTO `sys_oper_log` VALUES (128, '部门', 1, 'com.ruoyi.staff.controller.DepartmentController.add()', 'POST', 1, 'admin', '研发部门', '/staff/department', '127.0.0.1', '内网IP', '{\"deptCode\":\"123123\",\"deptManager\":\"尹科\",\"deptName\":\"王者农药\",\"deptPhone\":\"3213123123\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:40:03', 222);
INSERT INTO `sys_oper_log` VALUES (129, '部门', 2, 'com.ruoyi.staff.controller.DepartmentController.edit()', 'PUT', 1, 'admin', '研发部门', '/staff/department', '127.0.0.1', '内网IP', '{\"deptCode\":\"123123\",\"deptManager\":\"尹科伟\",\"deptName\":\"王者农药\",\"deptPhone\":\"3213123123\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:40:10', 11);
INSERT INTO `sys_oper_log` VALUES (130, '部门', 3, 'com.ruoyi.staff.controller.DepartmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/staff/department/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:53:33', 13);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"staff/department/index\",\"createTime\":\"2025-04-24 17:35:44\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"部门\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"department\",\"perms\":\"staff:department:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-24 17:54:18', 30);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"customer_management\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 09:20:32', 212);
INSERT INTO `sys_oper_log` VALUES (133, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:21\",\"dictId\":1,\"dictName\":\"用户性别\",\"dictType\":\"sys_user_sex\",\"params\":{},\"remark\":\"用户性别列表\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 09:41:45', 43);
INSERT INTO `sys_oper_log` VALUES (134, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-04-08 20:23:18\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 09:41:57', 36);
INSERT INTO `sys_oper_log` VALUES (135, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-04-08 20:23:18\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 09:42:02', 19);
INSERT INTO `sys_oper_log` VALUES (136, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:21\",\"dictId\":1,\"dictName\":\"用户性别\",\"dictType\":\"sys_user_sex\",\"params\":{},\"remark\":\"用户性别列表\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 09:49:19', 23);
INSERT INTO `sys_oper_log` VALUES (137, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:18\",\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postId\":1,\"postName\":\"董事长\",\"postSort\":1,\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 09:50:45', 18);
INSERT INTO `sys_oper_log` VALUES (138, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:18\",\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postId\":1,\"postName\":\"董事长\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 09:50:48', 10);
INSERT INTO `sys_oper_log` VALUES (139, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:21\",\"dictId\":4,\"dictName\":\"任务状态\",\"dictType\":\"sys_job_status\",\"params\":{},\"remark\":\"任务状态列表\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 09:51:03', 15);
INSERT INTO `sys_oper_log` VALUES (140, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:21\",\"dictId\":4,\"dictName\":\"任务状态\",\"dictType\":\"sys_job_status\",\"params\":{},\"remark\":\"任务状态列表\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 09:51:22', 19);
INSERT INTO `sys_oper_log` VALUES (141, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"雌\",\"dictSort\":4,\"dictType\":\"sys_user_sex\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 10:06:21', 19);
INSERT INTO `sys_oper_log` VALUES (142, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-04-08 20:23:18\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 10:06:45', 21);
INSERT INTO `sys_oper_log` VALUES (143, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-04-08 20:23:18\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 10:06:49', 22);
INSERT INTO `sys_oper_log` VALUES (144, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:21\",\"cssClass\":\"\",\"default\":true,\"dictCode\":1,\"dictLabel\":\"男\",\"dictSort\":1,\"dictType\":\"sys_user_sex\",\"dictValue\":\"0\",\"isDefault\":\"Y\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"性别男\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 10:18:49', 10);
INSERT INTO `sys_oper_log` VALUES (145, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-04-08 20:23:18\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 10:19:03', 20);
INSERT INTO `sys_oper_log` VALUES (146, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-04-08 20:23:18\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 10:19:13', 20);
INSERT INTO `sys_oper_log` VALUES (147, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-04-08 20:23:18\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 10:19:23', 22);
INSERT INTO `sys_oper_log` VALUES (148, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:21\",\"cssClass\":\"\",\"default\":true,\"dictCode\":1,\"dictLabel\":\"男\",\"dictSort\":1,\"dictType\":\"sys_user_sex\",\"dictValue\":\"0\",\"isDefault\":\"Y\",\"listClass\":\"default\",\"params\":{},\"remark\":\"性别男\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 10:19:43', 8);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"employee_management\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 10:27:51', 25);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"internal_duplicate_check\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 10:28:28', 31);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 10:54:00', 13);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"customer_management\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 10:54:20', 68);
INSERT INTO `sys_oper_log` VALUES (153, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"派单机构分组\",\"dictType\":\"order_institution_group\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:01:13', 11);
INSERT INTO `sys_oper_log` VALUES (154, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"渠道来源\",\"dictType\":\"channel_source\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:02:54', 9);
INSERT INTO `sys_oper_log` VALUES (155, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"所在地\",\"dictType\":\"address\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:03:21', 6);
INSERT INTO `sys_oper_log` VALUES (156, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"咨询项目类型\",\"dictType\":\"consulting_project_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:04:25', 6);
INSERT INTO `sys_oper_log` VALUES (157, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"客户意愿类型\",\"dictType\":\"customer_intention_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:05:12', 7);
INSERT INTO `sys_oper_log` VALUES (158, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"新东方机构1\",\"dictSort\":0,\"dictType\":\"order_institution_group\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:10:11', 12);
INSERT INTO `sys_oper_log` VALUES (159, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"黑马IT教育\",\"dictSort\":1,\"dictType\":\"order_institution_group\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:10:35', 14);
INSERT INTO `sys_oper_log` VALUES (160, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-27 11:10:11\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"新东方机构1\",\"dictSort\":1,\"dictType\":\"order_institution_group\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:10:45', 10);
INSERT INTO `sys_oper_log` VALUES (161, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-27 11:10:35\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"黑马IT教育\",\"dictSort\":2,\"dictType\":\"order_institution_group\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:10:50', 9);
INSERT INTO `sys_oper_log` VALUES (162, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"考公\",\"dictSort\":1,\"dictType\":\"consulting_project_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:11:57', 7);
INSERT INTO `sys_oper_log` VALUES (163, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"考研\",\"dictSort\":2,\"dictType\":\"consulting_project_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:12:09', 8);
INSERT INTO `sys_oper_log` VALUES (164, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"事业编\",\"dictSort\":3,\"dictType\":\"consulting_project_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:12:22', 6);
INSERT INTO `sys_oper_log` VALUES (165, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"初步考虑\",\"dictSort\":1,\"dictType\":\"customer_intention_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:12:48', 8);
INSERT INTO `sys_oper_log` VALUES (166, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"进一步考虑\",\"dictSort\":2,\"dictType\":\"customer_intention_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:13:06', 8);
INSERT INTO `sys_oper_log` VALUES (167, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"下决定\",\"dictSort\":3,\"dictType\":\"customer_intention_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:13:24', 7);
INSERT INTO `sys_oper_log` VALUES (168, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"customerManagement\",\"className\":\"CustomerManagement\",\"columns\":[{\"capJavaField\":\"CustomerId\",\"columnComment\":\"客户 ID\",\"columnId\":37,\"columnName\":\"customer_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:54:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CustomerName\",\"columnComment\":\"客户姓名\",\"columnId\":38,\"columnName\":\"customer_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:54:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"customerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"手机号\",\"columnId\":39,\"columnName\":\"phone_number\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:54:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WechatId\",\"columnComment\":\"微信号\",\"columnId\":40,\"columnName\":\"wechat_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:54:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:21:31', 112);
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"customer_management\"}', NULL, 0, NULL, '2025-04-27 11:21:45', 555);
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"customer/customerManagement/index\",\"createTime\":\"2025-04-27 11:37:08\",\"icon\":\"wechat\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"customerManagement\",\"perms\":\"customer:customerManagement:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:37:41', 29);
INSERT INTO `sys_oper_log` VALUES (171, '客户管理', 1, 'com.ruoyi.customer.controller.CustomerManagementController.add()', 'POST', 1, 'admin', '研发部门', '/customer/customerManagement', '127.0.0.1', '内网IP', '{\"customerId\":1,\"customerName\":\"尹科科\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 11:38:17', 23);
INSERT INTO `sys_oper_log` VALUES (172, '客户管理', 2, 'com.ruoyi.customer.controller.CustomerManagementController.edit()', 'PUT', 1, 'admin', '研发部门', '/customer/customerManagement', '127.0.0.1', '内网IP', '{\"boostStatus\":\"0\",\"customerId\":1,\"customerName\":\"尹科科\",\"params\":{},\"saleStatus\":\"0\",\"serviceStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:07:49', 9);
INSERT INTO `sys_oper_log` VALUES (173, '客户管理', 2, 'com.ruoyi.customer.controller.CustomerManagementController.edit()', 'PUT', 1, 'admin', '研发部门', '/customer/customerManagement', '127.0.0.1', '内网IP', '{\"boostStatus\":\"0\",\"customerId\":1,\"customerName\":\"尹科科\",\"params\":{},\"saleStatus\":\"0\",\"serviceStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:08:30', 4);
INSERT INTO `sys_oper_log` VALUES (174, '客户管理', 2, 'com.ruoyi.customer.controller.CustomerManagementController.edit()', 'PUT', 1, 'admin', '研发部门', '/customer/customerManagement', '127.0.0.1', '内网IP', '{\"boostStatus\":\"Y\",\"customerId\":1,\"customerName\":\"尹科科\",\"params\":{},\"saleStatus\":\"0\",\"serviceStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:22:49', 6);
INSERT INTO `sys_oper_log` VALUES (175, '客户管理', 2, 'com.ruoyi.customer.controller.CustomerManagementController.edit()', 'PUT', 1, 'admin', '研发部门', '/customer/customerManagement', '127.0.0.1', '内网IP', '{\"boostStatus\":\"N\",\"customerId\":1,\"customerName\":\"尹科科\",\"params\":{},\"saleStatus\":\"0\",\"serviceStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:24:39', 4);
INSERT INTO `sys_oper_log` VALUES (176, '客户管理', 2, 'com.ruoyi.customer.controller.CustomerManagementController.edit()', 'PUT', 1, 'admin', '研发部门', '/customer/customerManagement', '127.0.0.1', '内网IP', '{\"boostStatus\":\"Y\",\"customerId\":1,\"customerName\":\"尹科科\",\"params\":{},\"saleStatus\":\"0\",\"serviceStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:24:45', 10);
INSERT INTO `sys_oper_log` VALUES (177, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:21\",\"cssClass\":\"\",\"default\":true,\"dictCode\":12,\"dictLabel\":\"是\",\"dictSort\":1,\"dictType\":\"sys_yes_no\",\"dictValue\":\"是\",\"isDefault\":\"Y\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"系统默认是\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:25:38', 11);
INSERT INTO `sys_oper_log` VALUES (178, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-08 20:23:21\",\"cssClass\":\"\",\"default\":false,\"dictCode\":13,\"dictLabel\":\"否\",\"dictSort\":2,\"dictType\":\"sys_yes_no\",\"dictValue\":\"否\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"remark\":\"系统默认否\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:25:43', 13);
INSERT INTO `sys_oper_log` VALUES (179, '客户管理', 2, 'com.ruoyi.customer.controller.CustomerManagementController.edit()', 'PUT', 1, 'admin', '研发部门', '/customer/customerManagement', '127.0.0.1', '内网IP', '{\"boostStatus\":\"是\",\"customerId\":1,\"customerName\":\"尹科科\",\"params\":{},\"saleStatus\":\"0\",\"serviceStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:26:01', 5);
INSERT INTO `sys_oper_log` VALUES (180, '客户管理', 2, 'com.ruoyi.customer.controller.CustomerManagementController.edit()', 'PUT', 1, 'admin', '研发部门', '/customer/customerManagement', '127.0.0.1', '内网IP', '{\"boostStatus\":\"是\",\"customerId\":1,\"customerName\":\"尹科科\",\"douyinId\":\"xadas123\",\"params\":{},\"phoneNumber\":\"17830794096\",\"saleStatus\":\"0\",\"serviceStatus\":\"1\",\"wechatId\":\"ykw17830794096\",\"xiaohongshuId\":\"xadas123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:27:39', 4);
INSERT INTO `sys_oper_log` VALUES (181, '客户管理', 2, 'com.ruoyi.customer.controller.CustomerManagementController.edit()', 'PUT', 1, 'admin', '研发部门', '/customer/customerManagement', '127.0.0.1', '内网IP', '{\"boostStatus\":\"是\",\"customerId\":1,\"customerName\":\"尹科科\",\"douyinId\":\"xadas123\",\"lastDispatchTime\":\"2025-04-03\",\"params\":{},\"phoneNumber\":\"17830794096\",\"recordTime\":\"2025-04-22\",\"saleStatus\":\"0\",\"serviceStatus\":\"1\",\"wechatId\":\"ykw17830794096\",\"xiaohongshuId\":\"xadas123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:31:49', 9);
INSERT INTO `sys_oper_log` VALUES (182, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"添加状态\",\"dictType\":\"add_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:40:49', 20);
INSERT INTO `sys_oper_log` VALUES (183, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已添加\",\"dictSort\":1,\"dictType\":\"add_status\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:41:21', 10);
INSERT INTO `sys_oper_log` VALUES (184, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未添加\",\"dictSort\":2,\"dictType\":\"add_status\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 14:41:44', 11);
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"staff/department/index\",\"createTime\":\"2025-04-24 17:35:44\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"部门\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"department\",\"perms\":\"staff:department:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 15:53:40', 23);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"customer/customerManagement/index\",\"createTime\":\"2025-04-27 11:37:08\",\"icon\":\"wechat\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"customerManagement\",\"perms\":\"customer:customerManagement:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 15:54:10', 11);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"staff/department/index\",\"createTime\":\"2025-04-24 17:35:44\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"部门\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"department\",\"perms\":\"staff:department:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 15:54:58', 12);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"promotion/Promote\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"推广录入\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"promotion/Promote\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:01:20', 21);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"promotion/Promote\",\"createTime\":\"2025-04-27 16:01:20\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"推广录入\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"promotion/promote\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:03:39', 8);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"promotion/Promote\",\"createTime\":\"2025-04-27 16:01:20\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"推广录入\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"promotion/promoteManagement\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:04:09', 14);
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"promotion/promoteManagement/index\",\"createTime\":\"2025-04-27 16:01:20\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"推广录入\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"promoteManagement\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:05:05', 10);
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"promotion/promoteManagement/index\",\"createTime\":\"2025-04-27 16:01:20\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"推广录入\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"promoteManagement\",\"perms\":\"promotion:promoteManagement:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:06:45', 6);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"promotion/promoteManagement/index\",\"createTime\":\"2025-04-27 16:01:20\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"推广录入\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"promoteManagement\",\"perms\":\"promotion:promoteManagement:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:08:26', 6);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"promotion/promoteManagement/index\",\"createTime\":\"2025-04-27 16:01:20\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"推广录入\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"promoteManagement\",\"perms\":\"promotion:promoteManagement:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:09:35', 8);
INSERT INTO `sys_oper_log` VALUES (195, '客户管理', 1, 'com.ruoyi.customer.controller.CustomerManagementController.add()', 'POST', 1, 'admin', '研发部门', '/customer/customerManagement', '127.0.0.1', '内网IP', '{\"customerId\":2,\"customerName\":\"快快快\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 11:02:07', 58);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"check\",\"className\":\"InternalDuplicateCheck\",\"columns\":[{\"capJavaField\":\"CheckId\",\"columnComment\":\"查重记录 ID\",\"columnId\":29,\"columnName\":\"check_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:28:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"checkId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"手机号\",\"columnId\":30,\"columnName\":\"phone_number\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:28:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WechatId\",\"columnComment\":\"微信号\",\"columnId\":31,\"columnName\":\"wechat_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:28:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"wechatId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DouyinId\",\"columnComment\":\"抖音 ID\",\"columnId\":32,\"columnName\":\"douyin_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:28:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 11:30:23', 127);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"internal_duplicate_check\"}', NULL, 0, NULL, '2025-04-28 11:31:41', 106);
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"internal_duplicate_check\"}', NULL, 0, NULL, '2025-04-28 14:46:58', 121);
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"check\",\"className\":\"InternalDuplicateCheck\",\"columns\":[{\"capJavaField\":\"CheckId\",\"columnComment\":\"查重记录 ID\",\"columnId\":29,\"columnName\":\"check_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:28:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"checkId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-04-28 11:30:23\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"手机号\",\"columnId\":30,\"columnName\":\"phone_number\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:28:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-04-28 11:30:23\",\"usableColumn\":false},{\"capJavaField\":\"WechatId\",\"columnComment\":\"微信号\",\"columnId\":31,\"columnName\":\"wechat_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:28:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"wechatId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-04-28 11:30:23\",\"usableColumn\":false},{\"capJavaField\":\"DouyinId\",\"columnComment\":\"抖音 ID\",\"columnId\":32,\"columnName\":\"douyin_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:28:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 14:50:01', 62);
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"check\",\"className\":\"InternalDuplicateCheck\",\"columns\":[{\"capJavaField\":\"CheckId\",\"columnComment\":\"查重记录 ID\",\"columnId\":29,\"columnName\":\"check_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:28:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"checkId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-04-28 14:50:01\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"手机号\",\"columnId\":30,\"columnName\":\"phone_number\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:28:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-04-28 14:50:01\",\"usableColumn\":false},{\"capJavaField\":\"WechatId\",\"columnComment\":\"微信号\",\"columnId\":31,\"columnName\":\"wechat_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:28:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"wechatId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-04-28 14:50:01\",\"usableColumn\":false},{\"capJavaField\":\"DouyinId\",\"columnComment\":\"抖音 ID\",\"columnId\":32,\"columnName\":\"douyin_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-27 10:28:28\",\"dictType\":\"\",\"ed', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 15:08:01', 27);
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"internal_duplicate_check\"}', NULL, 0, NULL, '2025-04-28 15:08:13', 73);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"check/check/index\",\"createTime\":\"2025-04-28 15:51:12\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"内部查重\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"check\",\"perms\":\"check:check:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 15:53:38', 50);
INSERT INTO `sys_oper_log` VALUES (203, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-08 20:23:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-28 17:10:51', 81);
INSERT INTO `sys_oper_log` VALUES (204, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2025,2026,2027,2028,2029,2030,2031,2013,2014,2015,2016,2017,2018],\"params\":{},\"roleKey\":\"common\",\"roleName\":\"推广员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"新增角色\'推广员\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2025-04-28 17:11:22', 12);
INSERT INTO `sys_oper_log` VALUES (205, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2025,2026,2027,2028,2029,2030,2031,2013,2014,2015,2016,2017,2018],\"params\":{},\"roleKey\":\"common\",\"roleName\":\"推广员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"新增角色\'推广员\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2025-04-28 17:11:27', 11);
INSERT INTO `sys_oper_log` VALUES (206, '内部查重', 2, 'com.ruoyi.check.controller.InternalDuplicateCheckController.edit()', 'PUT', 1, 'admin', '研发部门', '/check/check', '127.0.0.1', '内网IP', '{\"checkId\":1,\"checkTime\":\"2025-04-28\",\"customerId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:05:10', 75);
INSERT INTO `sys_oper_log` VALUES (207, '内部查重', 2, 'com.ruoyi.check.controller.InternalDuplicateCheckController.edit()', 'PUT', 1, 'admin', '研发部门', '/check/check', '127.0.0.1', '内网IP', '{\"checkId\":1,\"checkTime\":\"2025-04-29\",\"customerId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:10:51', 22);
INSERT INTO `sys_oper_log` VALUES (208, '内部查重', 2, 'com.ruoyi.check.controller.InternalDuplicateCheckController.edit()', 'PUT', 1, 'admin', '研发部门', '/check/check', '127.0.0.1', '内网IP', '{\"checkId\":1,\"checkTime\":\"2025-04-29\",\"customerId\":1,\"douyinId\":\"2312321312\",\"params\":{},\"wechatId\":\"w2e12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 10:14:25', 14);
INSERT INTO `sys_oper_log` VALUES (209, '客户管理', 2, 'com.ruoyi.customer.controller.CustomerManagementController.edit()', 'PUT', 1, 'admin', '研发部门', '/customer/customerManagement', '127.0.0.1', '内网IP', '{\"boostStatus\":\"是\",\"consultingDetails\":\"很及时啊就是大家阿珂基督教312\",\"customerId\":1,\"customerIntention\":\"1\",\"customerName\":\"尹科科\",\"dispatchOrganization\":\"1\",\"douyinId\":\"xadas123\",\"lastDispatchTime\":\"2025-04-03\",\"location\":\"重庆\",\"params\":{},\"phoneNumber\":\"17830794096\",\"recordTime\":\"2025-04-22\",\"saleStatus\":\"0\",\"serviceStatus\":\"1\",\"wechatId\":\"ykw17830794096\",\"xiaohongshuId\":\"xadas123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 11:22:49', 55);
INSERT INTO `sys_oper_log` VALUES (210, '客户管理', 2, 'com.ruoyi.customer.controller.CustomerManagementController.edit()', 'PUT', 1, 'admin', '研发部门', '/customer/customerManagement', '127.0.0.1', '内网IP', '{\"boostStatus\":\"是\",\"customerId\":2,\"customerIntention\":\"1\",\"customerName\":\"快快快\",\"dispatchOrganization\":\"2\",\"douyinId\":\"231312412\",\"location\":\"山东\",\"params\":{},\"phoneNumber\":\"1312412414\",\"recordTime\":\"2025-04-08\",\"saleStatus\":\"1\",\"serviceStatus\":\"1\",\"wechatId\":\"321312414dd\",\"xiaohongshuId\":\"3123124124\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 11:28:59', 7);
INSERT INTO `sys_oper_log` VALUES (211, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"account_management\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 11:29:42', 120);
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"accountManagement\",\"className\":\"AccountManagement\",\"columns\":[{\"capJavaField\":\"AccountId\",\"columnComment\":\"账号 ID\",\"columnId\":59,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 11:29:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"accountId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LoginAccount\",\"columnComment\":\"登录账号\",\"columnId\":60,\"columnName\":\"login_account\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 11:29:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"loginAccount\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户名\",\"columnId\":61,\"columnName\":\"user_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 11:29:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"手机号码\",\"columnId\":62,\"columnName\":\"phone_number\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 11:29:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isL', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 11:31:51', 70);
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"account_management\"}', NULL, 0, NULL, '2025-04-30 11:34:06', 523);
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"performance_statistics_by_promoter,promotion_order_entry,transaction_statistics\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 14:40:02', 229);
INSERT INTO `sys_oper_log` VALUES (215, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2019,2020,2021,2022,2023,2024,2026,2027,2028,2029,2030,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"promoter\",\"roleName\":\"推广员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 15:06:48', 85);
INSERT INTO `sys_oper_log` VALUES (216, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":101,\"roleKey\":\"customerSupport\",\"roleName\":\"客服\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 15:08:10', 11);
INSERT INTO `sys_oper_log` VALUES (217, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":102,\"roleKey\":\"salesman\",\"roleName\":\"销售员\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-30 15:08:38', 20);
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"entry\",\"className\":\"PromotionOrderEntry\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单 ID\",\"columnId\":79,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Wechat\",\"columnComment\":\"微信\",\"columnId\":80,\"columnName\":\"wechat\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"wechat\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DouyinId\",\"columnComment\":\"抖音 ID\",\"columnId\":81,\"columnName\":\"douyin_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"douyinId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"XiaohongshuIp\",\"columnComment\":\"小红书 IP\",\"columnId\":82,\"columnName\":\"xiaohongshu_ip\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 11:56:21', 158);
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"entry\",\"className\":\"PromotionOrderEntry\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单 ID\",\"columnId\":79,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 11:56:20\",\"usableColumn\":false},{\"capJavaField\":\"Wechat\",\"columnComment\":\"微信\",\"columnId\":80,\"columnName\":\"wechat\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"wechat\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 11:56:20\",\"usableColumn\":false},{\"capJavaField\":\"DouyinId\",\"columnComment\":\"抖音 ID\",\"columnId\":81,\"columnName\":\"douyin_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"douyinId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 11:56:20\",\"usableColumn\":false},{\"capJavaField\":\"XiaohongshuIp\",\"columnComment\":\"小红书 IP\",\"columnId\":82,\"columnName\":\"xiaohongshu_ip\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"incre', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 11:56:57', 65);
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"promotion_order_entry\"}', NULL, 0, NULL, '2025-05-01 11:57:18', 392);
INSERT INTO `sys_oper_log` VALUES (221, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"statistics\",\"className\":\"TransactionStatistics\",\"columns\":[{\"capJavaField\":\"StatisticsId\",\"columnComment\":\"统计记录 ID\",\"columnId\":96,\"columnName\":\"statistics_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"statisticsId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":97,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"手机号\",\"columnId\":98,\"columnName\":\"phone_number\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"XiaohongshuId\",\"columnComment\":\"小红书 ID\",\"columnId\":99,\"columnName\":\"xiaohongshu_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isLis', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 11:58:50', 75);
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"promoter\",\"className\":\"PerformanceStatisticsByPromoter\",\"columns\":[{\"capJavaField\":\"PerformanceId\",\"columnComment\":\"业绩统计记录 ID\",\"columnId\":66,\"columnName\":\"performance_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"performanceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PromoterAccountId\",\"columnComment\":\"推广人账号 ID\",\"columnId\":67,\"columnName\":\"promoter_account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"promoterAccountId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentName\",\"columnComment\":\"部门名称\",\"columnId\":68,\"columnName\":\"department_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"departmentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LeadQuantity\",\"columnComment\":\"线索量\",\"columnId\":69,\"columnName\":\"lead_quantity\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:00:28', 42);
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"promoter\",\"className\":\"PerformanceStatisticsByPromoter\",\"columns\":[{\"capJavaField\":\"PerformanceId\",\"columnComment\":\"业绩统计记录 ID\",\"columnId\":66,\"columnName\":\"performance_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"performanceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:00:28\",\"usableColumn\":false},{\"capJavaField\":\"PromoterAccountId\",\"columnComment\":\"推广人账号 ID\",\"columnId\":67,\"columnName\":\"promoter_account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"promoterAccountId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:00:28\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentName\",\"columnComment\":\"部门名称\",\"columnId\":68,\"columnName\":\"department_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-30 14:40:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"departmentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:00:28\",\"usableColumn\":false},{\"capJavaField\":\"LeadQuantity\",\"columnComment\":\"线索量\",\"columnId\":69,\"columnName\":\"lead_quantity\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:00:56', 46);
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:10:36', 24);
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/8', '127.0.0.1', '内网IP', '[8]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:10:40', 7);
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/7', '127.0.0.1', '内网IP', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:10:43', 8);
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"transaction_statistics\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:10:55', 114);
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"performance_statistics_by_promoter,promotion_order_entry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:13:56', 120);
INSERT INTO `sys_oper_log` VALUES (229, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"statistics\",\"className\":\"TransactionStatistics\",\"columns\":[{\"capJavaField\":\"StatisticsId\",\"columnComment\":\"统计记录 ID\",\"columnId\":119,\"columnName\":\"statistics_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:10:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"statisticsId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":120,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:10:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"手机号\",\"columnId\":121,\"columnName\":\"phone_number\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:10:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"XiaohongshuId\",\"columnComment\":\"小红书 ID\",\"columnId\":122,\"columnName\":\"xiaohongshu_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:10:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:17:06', 55);
INSERT INTO `sys_oper_log` VALUES (230, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"成交状态\",\"dictType\":\"transaction_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:18:43', 13);
INSERT INTO `sys_oper_log` VALUES (231, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已成交\",\"dictSort\":1,\"dictType\":\"transaction_status\",\"dictValue\":\"0\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:19:14', 11);
INSERT INTO `sys_oper_log` VALUES (232, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未成交\",\"dictSort\":2,\"dictType\":\"transaction_status\",\"dictValue\":\"1\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:19:37', 7);
INSERT INTO `sys_oper_log` VALUES (233, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"statistics\",\"className\":\"TransactionStatistics\",\"columns\":[{\"capJavaField\":\"StatisticsId\",\"columnComment\":\"统计记录 ID\",\"columnId\":119,\"columnName\":\"statistics_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:10:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"statisticsId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:17:06\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":120,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:10:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:17:06\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"手机号\",\"columnId\":121,\"columnName\":\"phone_number\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:10:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:17:06\",\"usableColumn\":false},{\"capJavaField\":\"XiaohongshuId\",\"columnComment\":\"小红书 ID\",\"columnId\":122,\"columnName\":\"xiaohongshu_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:10:55\",\"dictType\":\"\",\"ed', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:20:07', 58);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"数据分析\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"dataAnalysis\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:25:53', 18);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成交统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2032,\"path\":\"dataAnalysis/transactionAnalysis\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:30:14', 7);
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"业绩统计\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":2032,\"path\":\"performanceMetrics\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:35:31', 15);
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"按推广人\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2034,\"path\":\"performanceMetrics/promoter\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:36:29', 17);
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"staff/department/index\",\"createTime\":\"2025-04-24 17:35:44\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"部门\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"department\",\"perms\":\"staff:department:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:37:09', 18);
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2000', '127.0.0.1', '内网IP', '2000', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:37:23', 27);
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-05-01 12:37:27', 3);
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-05-01 12:37:34', 4);
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-08 20:23:18\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:37:51', 13);
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-08 20:23:18\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:38:13', 13);
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/performance_statistics_by_promoter', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:46:40', 51);
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"promoter\",\"className\":\"PerformanceStatisticsByPromoter\",\"columns\":[{\"capJavaField\":\"PerformanceId\",\"columnComment\":\"业绩统计记录 ID\",\"columnId\":142,\"columnName\":\"performance_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:13:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"performanceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:46:40\",\"usableColumn\":false},{\"capJavaField\":\"PromoterAccountId\",\"columnComment\":\"推广人账号 ID\",\"columnId\":143,\"columnName\":\"promoter_account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:13:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"promoterAccountId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:46:40\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentId\",\"columnComment\":\"部门ID\",\"columnId\":172,\"columnName\":\"department_id\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2025-05-01 12:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"departmentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LeadQuantity\",\"columnComment\":\"线索量\",\"columnId\":145,\"columnName\":\"lead_quantity\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:13:56\",\"dictType\":\"\",\"edit\":true,\"htm', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 12:47:25', 37);
INSERT INTO `sys_oper_log` VALUES (246, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"statistics\",\"className\":\"TransactionStatistics\",\"columns\":[{\"capJavaField\":\"StatisticsId\",\"columnComment\":\"统计记录 ID\",\"columnId\":119,\"columnName\":\"statistics_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:10:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"statisticsId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:20:07\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":120,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:10:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:20:07\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"手机号\",\"columnId\":121,\"columnName\":\"phone_number\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:10:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:20:07\",\"usableColumn\":false},{\"capJavaField\":\"XiaohongshuId\",\"columnComment\":\"小红书 ID\",\"columnId\":122,\"columnName\":\"xiaohongshu_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:10:55\",\"dictType\":\"\",\"ed', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 13:24:59', 35);
INSERT INTO `sys_oper_log` VALUES (247, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"transaction_statistics\"}', NULL, 0, NULL, '2025-05-01 13:25:04', 89);
INSERT INTO `sys_oper_log` VALUES (248, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"promoter\",\"className\":\"PerformanceStatisticsByPromoter\",\"columns\":[{\"capJavaField\":\"PerformanceId\",\"columnComment\":\"业绩统计记录 ID\",\"columnId\":142,\"columnName\":\"performance_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:13:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"performanceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:47:25\",\"usableColumn\":false},{\"capJavaField\":\"PromoterAccountId\",\"columnComment\":\"推广人账号 ID\",\"columnId\":143,\"columnName\":\"promoter_account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:13:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"promoterAccountId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:47:25\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentId\",\"columnComment\":\"部门ID\",\"columnId\":172,\"columnName\":\"department_id\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2025-05-01 12:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"departmentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-05-01 12:47:25\",\"usableColumn\":false},{\"capJavaField\":\"LeadQuantity\",\"columnComment\":\"线索量\",\"columnId\":145,\"columnName\":\"lead_quantity\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-05-01 12:13', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 13:25:48', 33);
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"performance_statistics_by_promoter\"}', NULL, 0, NULL, '2025-05-01 13:26:12', 69);
INSERT INTO `sys_oper_log` VALUES (250, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"promoter/promoter\",\"createTime\":\"2025-05-01 12:36:29\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2035,\"menuName\":\"按推广人\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2034,\"path\":\"performanceMetrics/promoter\",\"perms\":\"promoter:promoter:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 14:09:37', 20);
INSERT INTO `sys_oper_log` VALUES (251, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"promoter/promoter/index\",\"createTime\":\"2025-05-01 12:36:29\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2035,\"menuName\":\"按推广人\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2034,\"path\":\"performanceMetrics\",\"perms\":\"promoter:promoter:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 14:10:35', 13);
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2036', '127.0.0.1', '内网IP', '2036', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-05-01 14:12:55', 18);
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2035', '127.0.0.1', '内网IP', '2035', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 14:24:39', 21);
INSERT INTO `sys_oper_log` VALUES (254, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"promoter/promoter/index\",\"createTime\":\"2025-05-01 14:11:22\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"按推广人\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2034,\"path\":\"promoter\",\"perms\":\"promoter:promoter:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 14:25:12', 26);
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"statistics/statistics/index\",\"createTime\":\"2025-05-01 12:30:14\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"成交统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2032,\"path\":\"statistics\",\"perms\":\"statistics:statistics:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 14:29:48', 24);
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2033', '127.0.0.1', '内网IP', '2033', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 14:32:42', 33);
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"statistics/statistics/index\",\"createTime\":\"2025-05-01 14:30:34\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"成交统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2032,\"path\":\"statistics\",\"perms\":\"statistics:statistics:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-01 14:33:14', 34);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-04-08 20:23:18', 'admin', '2025-04-27 09:50:48', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-04-08 20:23:18', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-04-08 20:23:18', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-04-08 20:23:18', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-04-08 20:23:18', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-04-08 20:23:18', 'admin', '2025-04-28 17:10:51', '普通角色');
INSERT INTO `sys_role` VALUES (100, '推广员', 'promoter', 3, '1', 1, 1, '0', '0', 'admin', '2025-04-30 15:06:48', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (101, '客服', 'customerSupport', 4, '1', 1, 1, '0', '0', 'admin', '2025-04-30 15:08:10', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (102, '销售员', 'salesman', 5, '1', 1, 1, '0', '0', 'admin', '2025-04-30 15:08:38', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-05-01 14:23:10', 'admin', '2025-04-08 20:23:18', '', '2025-05-01 14:23:10', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-04-30 14:43:48', 'admin', '2025-04-08 20:23:18', 'admin', '2025-04-30 14:43:47', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for transaction_statistics
-- ----------------------------
DROP TABLE IF EXISTS `transaction_statistics`;
CREATE TABLE `transaction_statistics`  (
  `statistics_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '统计记录 ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `xiaohongshu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小红书 ID',
  `wechat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信',
  `order_entry_time` datetime(0) NULL DEFAULT NULL COMMENT '录单时间',
  `transaction_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '成交状态',
  `transaction_date` datetime(0) NULL DEFAULT NULL COMMENT '成交日期',
  `transaction_organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '成交机构',
  `transaction_project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '成交项目',
  `transaction_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '成交金额',
  `rebate_ratio` decimal(5, 2) NULL DEFAULT NULL COMMENT '返点比例',
  `rebate_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '返点金额',
  `balance` decimal(10, 2) NULL DEFAULT NULL COMMENT '尾款',
  `paid_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '已补缴',
  `to_be_paid_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '待补缴',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  `customer_service_account_id` int(0) NULL DEFAULT NULL COMMENT '客服账号 ID',
  `channel_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '渠道来源',
  `promotion_account_id` int(0) NULL DEFAULT NULL COMMENT '推广人账号 ID',
  `salesperson_account_id` int(0) NULL DEFAULT NULL COMMENT '销售人员账号 ID',
  `recorder_account_id` int(0) NULL DEFAULT NULL COMMENT '录单人账号 ID',
  `customer_id` int(0) NULL DEFAULT NULL COMMENT '关联的客户 ID',
  PRIMARY KEY (`statistics_id`) USING BTREE,
  INDEX `customer_service_account_id`(`customer_service_account_id`) USING BTREE,
  INDEX `promotion_account_id`(`promotion_account_id`) USING BTREE,
  INDEX `salesperson_account_id`(`salesperson_account_id`) USING BTREE,
  INDEX `recorder_account_id`(`recorder_account_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `transaction_statistics_ibfk_1` FOREIGN KEY (`customer_service_account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaction_statistics_ibfk_2` FOREIGN KEY (`promotion_account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaction_statistics_ibfk_3` FOREIGN KEY (`salesperson_account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaction_statistics_ibfk_4` FOREIGN KEY (`recorder_account_id`) REFERENCES `account_management` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaction_statistics_ibfk_5` FOREIGN KEY (`customer_id`) REFERENCES `customer_management` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '成交统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaction_statistics
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
