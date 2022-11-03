/*
 Navicat Premium Data Transfer

 Source Server         : 本地MySql数据库
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : erupt

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 03/11/2022 15:49:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for e_dict
-- ----------------------------
DROP TABLE IF EXISTS `e_dict`;
CREATE TABLE `e_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKf5wwh5osfukkeebw7h2yb4kmp`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_dict
-- ----------------------------

-- ----------------------------
-- Table structure for e_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `e_dict_item`;
CREATE TABLE `e_dict_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int NULL DEFAULT NULL COMMENT '显示顺序',
  `erupt_dict_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKl0kiq8otpn3fvtlvarebt8xkh`(`code` ASC, `erupt_dict_id` ASC) USING BTREE,
  INDEX `FKrrbi2dt94rjd8sjt830m3w0a`(`erupt_dict_id` ASC) USING BTREE,
  CONSTRAINT `FKrrbi2dt94rjd8sjt830m3w0a` FOREIGN KEY (`erupt_dict_id`) REFERENCES `e_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_dict_item
-- ----------------------------

-- ----------------------------
-- Table structure for e_generator_class
-- ----------------------------
DROP TABLE IF EXISTS `e_generator_class`;
CREATE TABLE `e_generator_class`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '实体类名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简介',
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '生成Erupt代码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_generator_class
-- ----------------------------
INSERT INTO `e_generator_class` VALUES (1, 'erupt', '2022-11-03 11:20:15', 'erupt', '2022-11-03 11:20:15', 'student', '学生列表', '学生列表管理', 'student_Man');

-- ----------------------------
-- Table structure for e_generator_field
-- ----------------------------
DROP TABLE IF EXISTS `e_generator_field`;
CREATE TABLE `e_generator_field`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段名',
  `is_show` bit(1) NULL DEFAULT NULL COMMENT '是否显示',
  `link_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联实体类',
  `not_null` bit(1) NULL DEFAULT NULL COMMENT '是否必填',
  `query` bit(1) NULL DEFAULT NULL COMMENT '查询项',
  `show_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示名称',
  `sort` int NULL DEFAULT NULL COMMENT '显示顺序',
  `sortable` bit(1) NULL DEFAULT NULL COMMENT '字段排序',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编辑类型',
  `class_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKslwo9qwwfbgif9mbbhg072s4i`(`class_id` ASC) USING BTREE,
  CONSTRAINT `FKslwo9qwwfbgif9mbbhg072s4i` FOREIGN KEY (`class_id`) REFERENCES `e_generator_class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Erupt字段信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_generator_field
-- ----------------------------
INSERT INTO `e_generator_field` VALUES (1, 'name', b'1', NULL, b'1', b'1', '姓名', 1, b'0', 'INPUT', 1);
INSERT INTO `e_generator_field` VALUES (2, 'zhuangtai', b'1', NULL, b'1', b'1', '状态', 2, b'0', 'BOOLEAN', 1);

-- ----------------------------
-- Table structure for e_job
-- ----------------------------
DROP TABLE IF EXISTS `e_job`;
CREATE TABLE `e_job`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编码',
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Cron表达式',
  `handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JOB处理类',
  `handler_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务参数',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `notify_emails` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败通知邮箱',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `status` bit(1) NULL DEFAULT NULL COMMENT '任务状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK1fu1amroa8n5mma3q9tey7bu9`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务维护' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_job
-- ----------------------------

-- ----------------------------
-- Table structure for e_job_log
-- ----------------------------
DROP TABLE IF EXISTS `e_job_log`;
CREATE TABLE `e_job_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `error_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '错误信息',
  `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务参数',
  `result_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行结果',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `status` bit(1) NULL DEFAULT NULL COMMENT '任务状态',
  `job_id` bigint NULL DEFAULT NULL COMMENT '任务名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKcpe22rpge2e4mmuva8l9dtmx0`(`job_id` ASC) USING BTREE,
  CONSTRAINT `FKcpe22rpge2e4mmuva8l9dtmx0` FOREIGN KEY (`job_id`) REFERENCES `e_job` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for e_job_mail
-- ----------------------------
DROP TABLE IF EXISTS `e_job_mail`;
CREATE TABLE `e_job_mail`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '抄送人',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `error_info` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `recipient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接收人',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '发送邮件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_job_mail
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_login_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_login_log`;
CREATE TABLE `e_upms_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器',
  `device_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备类型',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `login_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP来源',
  `system_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_login_log
-- ----------------------------
INSERT INTO `e_upms_login_log` VALUES (1, 'Chrome 10 106', 'Computer', '192.168.18.208', '2022-11-02 10:32:54', '0|0|0|内网IP|内网IP', 'Windows 10', 'z7GtnLtiyMLklm2x', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (2, 'Chrome 10 106', 'Computer', '192.168.18.208', '2022-11-02 10:41:43', '0|0|0|内网IP|内网IP', 'Windows 10', '6LmowWU1upeLM11U', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (3, 'Chrome 10 106', 'Computer', '192.168.18.208', '2022-11-02 17:11:27', '0|0|0|内网IP|内网IP', 'Windows 10', 'GIYuWHV8uSOMiGQj', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (4, 'Chrome 10 106', 'Computer', '192.168.18.208', '2022-11-03 09:34:42', '0|0|0|内网IP|内网IP', 'Windows 10', 'qkVVkXtvc7S1qr35', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (5, 'Chrome 10 106', 'Computer', '192.168.18.208', '2022-11-03 10:01:56', '0|0|0|内网IP|内网IP', 'Windows 10', 'clwbVg9IOympObqn', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (6, 'Chrome 10 106', 'Computer', '192.168.18.208', '2022-11-03 10:09:42', '0|0|0|内网IP|内网IP', 'Windows 10', 'KBn3Ucl1SQPwcdxH', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (7, 'Chrome 10 106', 'Computer', '192.168.18.208', '2022-11-03 10:12:27', '0|0|0|内网IP|内网IP', 'Windows 10', 'OWEZia6qtN9eHIXD', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (8, 'Chrome 10 106', 'Computer', '192.168.18.208', '2022-11-03 11:14:54', '0|0|0|内网IP|内网IP', 'Windows 10', 'qqMnPQwzQMUuCvF8', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (9, 'Chrome 10 106', 'Computer', '192.168.18.208', '2022-11-03 11:24:16', '0|0|0|内网IP|内网IP', 'Windows 10', 'uRITqOWteKumMN7v', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (10, 'Chrome 10 106', 'Computer', '192.168.18.208', '2022-11-03 14:05:03', '0|0|0|内网IP|内网IP', 'Windows 10', '0QXeg76GYqlHS5h0', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (11, 'Chrome 10 106', 'Computer', '192.168.18.208', '2022-11-03 14:15:05', '0|0|0|内网IP|内网IP', 'Windows 10', 'MtotRimvtpaQ8Afx', 'erupt');

-- ----------------------------
-- Table structure for e_upms_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_menu`;
CREATE TABLE `e_upms_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编码',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '自定义参数',
  `sort` int NULL DEFAULT NULL COMMENT '顺序',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单类型',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型值',
  `parent_menu_id` bigint NULL DEFAULT NULL COMMENT '上级菜单',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK95xpkppt33d2bka0g2d7rgwqt`(`code` ASC) USING BTREE,
  INDEX `FK5mkgea183mm02v7ic1pdwxy5s`(`parent_menu_id` ASC) USING BTREE,
  CONSTRAINT `FK5mkgea183mm02v7ic1pdwxy5s` FOREIGN KEY (`parent_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_menu
-- ----------------------------
INSERT INTO `e_upms_menu` VALUES (1, NULL, '2022-11-02 10:30:40', NULL, NULL, '$manager', 'fa fa-cogs', '系统管理', NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (2, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptMenu', '', '菜单管理', NULL, 0, 1, 'tree', 'EruptMenu', 1);
INSERT INTO `e_upms_menu` VALUES (3, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptMenu@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptMenu@ADD', 2);
INSERT INTO `e_upms_menu` VALUES (4, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptMenu@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptMenu@EDIT', 2);
INSERT INTO `e_upms_menu` VALUES (5, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptMenu@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptMenu@DELETE', 2);
INSERT INTO `e_upms_menu` VALUES (6, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptMenu@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptMenu@VIEW_DETAIL', 2);
INSERT INTO `e_upms_menu` VALUES (7, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptRole', '', '角色管理', NULL, 10, 1, 'table', 'EruptRole', 1);
INSERT INTO `e_upms_menu` VALUES (8, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptRole@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptRole@ADD', 7);
INSERT INTO `e_upms_menu` VALUES (9, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptRole@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptRole@EDIT', 7);
INSERT INTO `e_upms_menu` VALUES (10, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptRole@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptRole@DELETE', 7);
INSERT INTO `e_upms_menu` VALUES (11, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptRole@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptRole@VIEW_DETAIL', 7);
INSERT INTO `e_upms_menu` VALUES (12, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptOrg', '', '组织维护', NULL, 20, 1, 'tree', 'EruptOrg', 1);
INSERT INTO `e_upms_menu` VALUES (13, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptOrg@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptOrg@ADD', 12);
INSERT INTO `e_upms_menu` VALUES (14, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptOrg@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptOrg@EDIT', 12);
INSERT INTO `e_upms_menu` VALUES (15, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptOrg@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptOrg@DELETE', 12);
INSERT INTO `e_upms_menu` VALUES (16, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptOrg@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptOrg@VIEW_DETAIL', 12);
INSERT INTO `e_upms_menu` VALUES (17, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptPost', '', '岗位维护', NULL, 30, 1, 'tree', 'EruptPost', 1);
INSERT INTO `e_upms_menu` VALUES (18, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptPost@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptPost@ADD', 17);
INSERT INTO `e_upms_menu` VALUES (19, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptPost@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptPost@EDIT', 17);
INSERT INTO `e_upms_menu` VALUES (20, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptPost@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptPost@DELETE', 17);
INSERT INTO `e_upms_menu` VALUES (21, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptPost@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptPost@VIEW_DETAIL', 17);
INSERT INTO `e_upms_menu` VALUES (22, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptUser', '', '用户配置', NULL, 40, 1, 'table', 'EruptUser', 1);
INSERT INTO `e_upms_menu` VALUES (23, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptUser@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptUser@ADD', 22);
INSERT INTO `e_upms_menu` VALUES (24, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptUser@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptUser@EDIT', 22);
INSERT INTO `e_upms_menu` VALUES (25, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptUser@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptUser@DELETE', 22);
INSERT INTO `e_upms_menu` VALUES (26, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptUser@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptUser@VIEW_DETAIL', 22);
INSERT INTO `e_upms_menu` VALUES (27, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptDict', '', '数据字典', NULL, 50, 1, 'table', 'EruptDict', 1);
INSERT INTO `e_upms_menu` VALUES (28, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptDict@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptDict@ADD', 27);
INSERT INTO `e_upms_menu` VALUES (29, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptDict@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptDict@EDIT', 27);
INSERT INTO `e_upms_menu` VALUES (30, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptDict@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptDict@DELETE', 27);
INSERT INTO `e_upms_menu` VALUES (31, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptDict@EXPORT', NULL, '导出', NULL, 40, 1, 'button', 'EruptDict@EXPORT', 27);
INSERT INTO `e_upms_menu` VALUES (32, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptDict@VIEW_DETAIL', NULL, '详情', NULL, 50, 1, 'button', 'EruptDict@VIEW_DETAIL', 27);
INSERT INTO `e_upms_menu` VALUES (33, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptDictItem', '', '字典项', NULL, 60, 2, 'table', 'EruptDictItem', 1);
INSERT INTO `e_upms_menu` VALUES (34, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptDictItem@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptDictItem@ADD', 33);
INSERT INTO `e_upms_menu` VALUES (35, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptDictItem@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptDictItem@EDIT', 33);
INSERT INTO `e_upms_menu` VALUES (36, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptDictItem@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptDictItem@DELETE', 33);
INSERT INTO `e_upms_menu` VALUES (37, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptDictItem@EXPORT', NULL, '导出', NULL, 40, 1, 'button', 'EruptDictItem@EXPORT', 33);
INSERT INTO `e_upms_menu` VALUES (38, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptDictItem@VIEW_DETAIL', NULL, '详情', NULL, 50, 1, 'button', 'EruptDictItem@VIEW_DETAIL', 33);
INSERT INTO `e_upms_menu` VALUES (39, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptOnline', '', '在线用户', NULL, 65, 1, 'table', 'EruptOnline', 1);
INSERT INTO `e_upms_menu` VALUES (40, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptOnline@EXPORT', NULL, '导出', NULL, 10, 1, 'button', 'EruptOnline@EXPORT', 39);
INSERT INTO `e_upms_menu` VALUES (41, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptLoginLog', '', '登录日志', NULL, 70, 1, 'table', 'EruptLoginLog', 1);
INSERT INTO `e_upms_menu` VALUES (42, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptLoginLog@EXPORT', NULL, '导出', NULL, 10, 1, 'button', 'EruptLoginLog@EXPORT', 41);
INSERT INTO `e_upms_menu` VALUES (43, NULL, '2022-11-02 10:30:40', NULL, NULL, 'EruptOperateLog', '', '操作日志', NULL, 80, 1, 'table', 'EruptOperateLog', 1);
INSERT INTO `e_upms_menu` VALUES (44, NULL, '2022-11-03 10:01:42', NULL, NULL, '$generator', 'fa fa-code', '代码生成', NULL, 40, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (45, NULL, '2022-11-03 10:01:42', NULL, NULL, 'GeneratorClass', '', '生成Erupt代码', NULL, 0, 1, 'table', 'GeneratorClass', 44);
INSERT INTO `e_upms_menu` VALUES (46, NULL, '2022-11-03 10:01:42', NULL, NULL, 'GeneratorClass@ADD', NULL, '新增', NULL, 10, 1, 'button', 'GeneratorClass@ADD', 45);
INSERT INTO `e_upms_menu` VALUES (47, NULL, '2022-11-03 10:01:42', NULL, NULL, 'GeneratorClass@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'GeneratorClass@EDIT', 45);
INSERT INTO `e_upms_menu` VALUES (48, NULL, '2022-11-03 10:01:42', NULL, NULL, 'GeneratorClass@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'GeneratorClass@DELETE', 45);
INSERT INTO `e_upms_menu` VALUES (49, NULL, '2022-11-03 10:01:42', NULL, NULL, 'GeneratorClass@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'GeneratorClass@VIEW_DETAIL', 45);
INSERT INTO `e_upms_menu` VALUES (50, NULL, '2022-11-03 10:09:28', NULL, NULL, '$job', 'fa fa-cubes', '任务管理', NULL, 30, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (51, NULL, '2022-11-03 10:09:28', NULL, NULL, 'EruptJob', '', '任务维护', NULL, 0, 1, 'table', 'EruptJob', 50);
INSERT INTO `e_upms_menu` VALUES (52, NULL, '2022-11-03 10:09:28', NULL, NULL, 'EruptJob@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptJob@ADD', 51);
INSERT INTO `e_upms_menu` VALUES (53, NULL, '2022-11-03 10:09:28', NULL, NULL, 'EruptJob@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptJob@EDIT', 51);
INSERT INTO `e_upms_menu` VALUES (54, NULL, '2022-11-03 10:09:28', NULL, NULL, 'EruptJob@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptJob@DELETE', 51);
INSERT INTO `e_upms_menu` VALUES (55, NULL, '2022-11-03 10:09:28', NULL, NULL, 'EruptJob@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptJob@VIEW_DETAIL', 51);
INSERT INTO `e_upms_menu` VALUES (56, NULL, '2022-11-03 10:09:28', NULL, NULL, 'EruptJobLog', '', '任务日志', NULL, 10, 1, 'table', 'EruptJobLog', 50);
INSERT INTO `e_upms_menu` VALUES (57, NULL, '2022-11-03 10:09:28', NULL, NULL, 'EruptJobLog@DELETE', NULL, '删除', NULL, 10, 1, 'button', 'EruptJobLog@DELETE', 56);
INSERT INTO `e_upms_menu` VALUES (58, NULL, '2022-11-03 10:09:28', NULL, NULL, 'EruptJobLog@EXPORT', NULL, '导出', NULL, 20, 1, 'button', 'EruptJobLog@EXPORT', 56);
INSERT INTO `e_upms_menu` VALUES (59, NULL, '2022-11-03 10:09:28', NULL, NULL, 'EruptMail', '', '发送邮件', NULL, 20, 1, 'table', 'EruptMail', 50);
INSERT INTO `e_upms_menu` VALUES (60, NULL, '2022-11-03 10:09:28', NULL, NULL, 'EruptMail@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptMail@ADD', 59);
INSERT INTO `e_upms_menu` VALUES (61, NULL, '2022-11-03 10:09:28', NULL, NULL, 'EruptMail@DELETE', NULL, '删除', NULL, 20, 1, 'button', 'EruptMail@DELETE', 59);
INSERT INTO `e_upms_menu` VALUES (62, NULL, '2022-11-03 10:09:28', NULL, NULL, 'EruptMail@VIEW_DETAIL', NULL, '详情', NULL, 30, 1, 'button', 'EruptMail@VIEW_DETAIL', 59);
INSERT INTO `e_upms_menu` VALUES (63, NULL, '2022-11-03 10:11:54', NULL, NULL, 'monitor', 'fa fa-bullseye', '系统监控', NULL, 10, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (64, NULL, '2022-11-03 10:11:54', NULL, NULL, 'server.html', NULL, '服务监控', NULL, 10, 1, 'tpl', 'server.html', 63);
INSERT INTO `e_upms_menu` VALUES (65, NULL, '2022-11-03 10:11:54', NULL, NULL, 'redis.html', NULL, '缓存监控', NULL, 20, 1, 'tpl', 'redis.html', 63);
INSERT INTO `e_upms_menu` VALUES (66, 'erupt', '2022-11-03 14:09:58', 'erupt', '2022-11-03 14:09:58', 'LFvBs77T', 'fa fa-at', '学生管理', NULL, 90, 1, 'table', 'student', NULL);
INSERT INTO `e_upms_menu` VALUES (67, NULL, '2022-11-03 14:09:58', NULL, NULL, 'nw59Yb0y', NULL, '新增', NULL, 10, 1, 'button', 'student@ADD', 66);
INSERT INTO `e_upms_menu` VALUES (68, NULL, '2022-11-03 14:09:58', NULL, NULL, 'WdLUGswa', NULL, '修改', NULL, 20, 1, 'button', 'student@EDIT', 66);
INSERT INTO `e_upms_menu` VALUES (69, NULL, '2022-11-03 14:09:58', NULL, NULL, 'naoa8TBY', NULL, '删除', NULL, 30, 1, 'button', 'student@DELETE', 66);
INSERT INTO `e_upms_menu` VALUES (70, NULL, '2022-11-03 14:09:58', NULL, NULL, 'xlFU5JCO', NULL, '详情', NULL, 40, 1, 'button', 'student@VIEW_DETAIL', 66);

-- ----------------------------
-- Table structure for e_upms_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_operate_log`;
CREATE TABLE `e_upms_operate_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '功能名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '记录时间',
  `error_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '错误信息',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `operate_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP来源',
  `req_addr` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求地址',
  `req_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方法',
  `req_param` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求参数',
  `status` bit(1) NULL DEFAULT NULL COMMENT '是否成功',
  `total_time` bigint NULL DEFAULT NULL COMMENT '请求耗时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_operate_log
-- ----------------------------
INSERT INTO `e_upms_operate_log` VALUES (1, '新增 | 生成Erupt代码', '2022-11-03 11:20:15', NULL, '192.168.18.208', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"学生列表\",\"className\":\"student\",\"tableName\":\"student_Man\",\"remark\":\"学生列表管理\",\"fields\":[{\"fieldName\":\"name\",\"showName\":\"姓名\",\"sort\":1,\"type\":\"INPUT\",\"linkClass\":null,\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-375},{\"fieldName\":\"zhuangtai\",\"showName\":\"状态\",\"sort\":2,\"type\":\"BOOLEAN\",\"linkClass\":null,\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-355}]}', b'1', 39);
INSERT INTO `e_upms_operate_log` VALUES (2, '新增 | 菜单管理', '2022-11-03 14:08:12', NULL, '192.168.18.208', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"学生管理\",\"status\":\"1\",\"type\":\"table\",\"sort\":90}', b'1', 27);
INSERT INTO `e_upms_operate_log` VALUES (3, '新增 | 菜单管理', '2022-11-03 14:09:58', NULL, '192.168.18.208', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"学生管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"student\",\"sort\":90,\"icon\":\"fa fa-at\"}', b'1', 42);
INSERT INTO `e_upms_operate_log` VALUES (4, '新增 | 学生管理', '2022-11-03 14:15:28', NULL, '192.168.18.208', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/student', 'POST', '{\"name\":\"李进元\",\"zhuangtai\":true}', b'1', 33);

-- ----------------------------
-- Table structure for e_upms_org
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_org`;
CREATE TABLE `e_upms_org`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组织编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组织名称',
  `sort` int NULL DEFAULT NULL COMMENT '显示顺序',
  `parent_org_id` bigint NULL DEFAULT NULL COMMENT '上级组织',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKc2wj35ujq2m84uw59dx6wy3gj`(`code` ASC) USING BTREE,
  INDEX `FKtj7222kjnkt7pv9kfn9g8ck4h`(`parent_org_id` ASC) USING BTREE,
  CONSTRAINT `FKtj7222kjnkt7pv9kfn9g8ck4h` FOREIGN KEY (`parent_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组织维护' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_org
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_post
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_post`;
CREATE TABLE `e_upms_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '岗位编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `weight` int NULL DEFAULT NULL COMMENT '岗位权重',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKltq5h3n5cyyk5nxtjhg9lhidg`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位维护' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_post
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role`;
CREATE TABLE `e_upms_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `sort` int NULL DEFAULT NULL COMMENT '展示顺序',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `create_user_id` bigint NULL DEFAULT NULL,
  `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKjgxkp7mr4183tcwosrbqpsl3a`(`code` ASC) USING BTREE,
  INDEX `FKad39xpgtpmhq0fp5newnabv1g`(`create_user_id` ASC) USING BTREE,
  INDEX `FKbghup2p4f1x9eokeygyg8p658`(`update_user_id` ASC) USING BTREE,
  CONSTRAINT `FKad39xpgtpmhq0fp5newnabv1g` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKbghup2p4f1x9eokeygyg8p658` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_role
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role_menu`;
CREATE TABLE `e_upms_role_menu`  (
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FKr6bl403chgwjnb6jk0uqqd9x8`(`menu_id` ASC) USING BTREE,
  CONSTRAINT `FKgsdnakqsme4htxkiapwmf6tbi` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKr6bl403chgwjnb6jk0uqqd9x8` FOREIGN KEY (`menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_user
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user`;
CREATE TABLE `e_upms_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `is_admin` bit(1) NULL DEFAULT NULL COMMENT '超管用户',
  `status` bit(1) NULL DEFAULT NULL COMMENT '账户状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `is_md5` bit(1) NULL DEFAULT NULL COMMENT 'md5加密',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `reset_pwd_time` datetime NULL DEFAULT NULL COMMENT '重置密码时间',
  `white_ip` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ip白名单',
  `erupt_org_id` bigint NULL DEFAULT NULL COMMENT '所属组织',
  `erupt_post_id` bigint NULL DEFAULT NULL COMMENT '岗位',
  `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint NULL DEFAULT NULL,
  `erupt_menu_id` bigint NULL DEFAULT NULL COMMENT '首页菜单',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK812t22yn0295dkkvx5gjgahax`(`account` ASC) USING BTREE,
  INDEX `FK1re8jv3614mkk2wfxscvgvmnm`(`erupt_org_id` ASC) USING BTREE,
  INDEX `FK53cice19aydjcuykpv847ocdv`(`erupt_post_id` ASC) USING BTREE,
  INDEX `FKdvwfw4x66ahh1tavd69cnx4i0`(`create_user_id` ASC) USING BTREE,
  INDEX `FKct3f9stm4eti10401f7rbh5ey`(`update_user_id` ASC) USING BTREE,
  INDEX `FKga0jd7sahnn1tv14mq4dy5kba`(`erupt_menu_id` ASC) USING BTREE,
  CONSTRAINT `FK1re8jv3614mkk2wfxscvgvmnm` FOREIGN KEY (`erupt_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK53cice19aydjcuykpv847ocdv` FOREIGN KEY (`erupt_post_id`) REFERENCES `e_upms_post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKct3f9stm4eti10401f7rbh5ey` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdvwfw4x66ahh1tavd69cnx4i0` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKga0jd7sahnn1tv14mq4dy5kba` FOREIGN KEY (`erupt_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_user
-- ----------------------------
INSERT INTO `e_upms_user` VALUES (1, 'erupt', 'erupt', b'1', b'1', '2022-11-02 10:30:40', NULL, NULL, b'1', '10e894e7d2da72e12eda8e808ad38c8e', NULL, NULL, '2022-11-02 10:34:55', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for e_upms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user_role`;
CREATE TABLE `e_upms_user_role`  (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `FKes2ylim5w3ej690ss84sb956x`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK3h4lekfh26f5f8b7by3ejges6` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKes2ylim5w3ej690ss84sb956x` FOREIGN KEY (`user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for student_man
-- ----------------------------
DROP TABLE IF EXISTS `student_man`;
CREATE TABLE `student_man`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `zhuangtai` bit(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_man
-- ----------------------------
INSERT INTO `student_man` VALUES (1, '李进元', b'1');

SET FOREIGN_KEY_CHECKS = 1;
