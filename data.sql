/*
 Navicat Premium Data Transfer

 Source Server         : wsl-docker-mysql8
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : go-service-api

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 16/03/2024 15:57:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for depts
-- ----------------------------
DROP TABLE IF EXISTS `depts`;
CREATE TABLE `depts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `parent_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '上级部门ID',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门名称',
  `status` bigint NULL DEFAULT NULL COMMENT '部门状态',
  `order_no` bigint NULL DEFAULT NULL COMMENT '部门排序',
  `leader` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `meta` json NULL COMMENT '部门信息',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` bigint NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_depts_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of depts
-- ----------------------------
INSERT INTO `depts` VALUES (1, '2024-03-16 01:57:03.705', '2024-03-16 01:57:46.055', NULL, 0, '商务部', 0, 0, '', '', '', '', 'null', '外交', 0);
INSERT INTO `depts` VALUES (2, '2024-03-16 01:57:12.282', '2024-03-16 01:57:12.282', NULL, 0, '客服部', 0, 0, '', '', '', '', NULL, '', 0);
INSERT INTO `depts` VALUES (3, '2024-03-16 02:30:14.767', '2024-03-16 02:30:14.767', NULL, 0, '销售部', 0, NULL, '', '', '', '', NULL, '', 0);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父菜单ID',
  `path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路由path',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `component` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应前端文件路径',
  `redirect` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向路径',
  `meta` json NULL COMMENT '附加属性',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  INDEX `idx_menus_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, '2024-03-16 11:09:44.770', '2024-03-16 15:26:31.352', NULL, 0, '/dashboard', 'Dashboard', 'LAYOUT', '', '{\"icon\": \"\", \"sort\": 0, \"title\": \"仪表盘\", \"expand\": false, \"hidden\": false, \"single\": false, \"orderNo\": 0, \"frameSrc\": \"\", \"keeplive\": true, \"frameBlank\": false, \"hiddenBreadcrumb\": false}');
INSERT INTO `menus` VALUES (2, '2024-03-16 11:30:33.489', '2024-03-16 11:34:18.068', NULL, 1, 'workbench', 'Workbench', '/src/views/dashboard/workbench/index.vue', '', '{\"icon\": \"\", \"sort\": 0, \"title\": \"工作台\", \"expand\": false, \"hidden\": false, \"single\": false, \"orderNo\": 0, \"frameSrc\": \"\", \"keeplive\": true, \"frameBlank\": false, \"hiddenBreadcrumb\": false}');
INSERT INTO `menus` VALUES (3, '2024-03-16 11:33:53.315', '2024-03-16 11:33:53.315', NULL, 1, 'analysis', 'Analysis', '/src/views/dashboard/analysis/index.vue', '', '{\"icon\": \"\", \"sort\": 0, \"title\": \"分析页\", \"expand\": false, \"hidden\": false, \"single\": false, \"orderNo\": 0, \"frameSrc\": \"\", \"keeplive\": true, \"frameBlank\": false, \"hiddenBreadcrumb\": false}');
INSERT INTO `menus` VALUES (4, '2023-11-28 15:39:49.219', '2024-03-16 15:21:01.879', NULL, 0, '/admin', 'Admin', 'LAYOUT', '', '{\"icon\": \"user-circle\", \"sort\": 10, \"title\": \"系统管理\", \"expand\": false, \"hidden\": false, \"single\": false, \"orderNo\": 0, \"frameSrc\": \"\", \"keeplive\": true, \"frameBlank\": false, \"hiddenBreadcrumb\": false}');
INSERT INTO `menus` VALUES (5, '2023-11-30 21:28:13.872', '2023-11-30 21:28:13.872', NULL, 4, 'user', 'UserAdmin', '/src/views/admin/user/index.vue', '', '{\"icon\": \"\", \"title\": \"用户管理\", \"expand\": false, \"hidden\": false, \"single\": false, \"orderNo\": 0, \"frameSrc\": \"\", \"keeplive\": true, \"frameBlank\": false, \"hiddenBreadcrumb\": false}');
INSERT INTO `menus` VALUES (6, '2023-12-01 00:48:52.190', '2023-12-01 00:48:52.190', NULL, 4, 'menu', 'MenuAdmin', '/src/views/admin/menu/index.vue', '', '{\"icon\": \"\", \"title\": \"菜单管理\", \"expand\": false, \"hidden\": false, \"single\": false, \"orderNo\": 0, \"frameSrc\": \"\", \"keeplive\": true, \"frameBlank\": false, \"hiddenBreadcrumb\": false}');
INSERT INTO `menus` VALUES (7, '2023-12-03 17:31:23.811', '2024-03-16 00:29:42.851', NULL, 4, 'role', 'RoleAdmin', '/src/views/admin/role/index.vue', '', '{\"icon\": \"\", \"sort\": 0, \"title\": \"角色管理\", \"expand\": false, \"hidden\": false, \"single\": false, \"orderNo\": 0, \"frameSrc\": \"\", \"keeplive\": true, \"frameBlank\": false, \"hiddenBreadcrumb\": false}');
INSERT INTO `menus` VALUES (8, '2024-03-16 01:44:44.238', '2024-03-16 01:44:44.238', NULL, 4, 'dept', 'DeptAdmin', '/src/views/admin/dept/index.vue', '', '{\"icon\": \"\", \"sort\": 0, \"title\": \"部门管理\", \"expand\": false, \"hidden\": false, \"single\": false, \"orderNo\": 0, \"frameSrc\": \"\", \"keeplive\": true, \"frameBlank\": false, \"hiddenBreadcrumb\": false}');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `role_id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `fk_role_menu_menu`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `parent_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '父角色ID',
  `status` bigint NULL DEFAULT NULL COMMENT '角色状态',
  `order_no` bigint NULL DEFAULT NULL COMMENT '排序',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_roles_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 889 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (666, '2024-03-16 00:10:09.761', '2024-03-16 00:11:27.335', NULL, '普通用户', '', 0, 0, 0, '1');
INSERT INTO `roles` VALUES (888, '2024-03-15 17:10:46.350', '2024-03-15 17:29:17.103', NULL, '管理员', '', 0, 1, 0, '很高的权限');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL COMMENT '用户状态',
  `uid` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户唯一标识',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户登录名',
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户登录密码',
  `location` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户位置',
  `nick_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `phone` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户手机号码',
  `role_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '用户角色ID',
  `meta` json NULL COMMENT '用户个人信息',
  `version` bigint NULL DEFAULT NULL COMMENT '乐观锁',
  `dept_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '用户部门ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_users_uid`(`uid` ASC) USING BTREE,
  UNIQUE INDEX `idx_users_username`(`username` ASC) USING BTREE,
  INDEX `idx_users_deleted_at`(`deleted_at` ASC) USING BTREE,
  INDEX `fk_users_dept`(`dept_id` ASC) USING BTREE,
  INDEX `fk_users_role`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '2024-01-30 19:01:48.256', '2024-03-16 02:32:21.541', NULL, 0, 'ba1c8d49-7e52-4191-b936-74e449a41520', 'wsllb', '$2a$10$xtsAL1OyS.WH/NJeS9Y/9ezYL1oBKXrEnuBMs096Bc8Hv4qABVroC', '', '李老板', 'https://oss-1251607222.cos.ap-guangzhou.myqcloud.com/avatar/a76cfe062fe9887820bb5072320e76d7.png', '', '88888888', 666, 'null', 0, 8);
INSERT INTO `users` VALUES (2, '2024-01-30 22:12:55.962', '2024-03-16 02:29:21.058', NULL, 0, '2bda84ac-0281-47bd-9183-bd024876aefc', 'wsllb8', '$2a$10$kH8LFf79NZidvJTt1qJMx.e6bxr6kuJM.T6wOC.nqM2h/NwInjWiW', '', '测试', 'https://oss-1251607222.cos.ap-guangzhou.myqcloud.com/avatar/8bf99ea0bb662dad63cf074a0479ff21.png', '', '88888888', 666, 'null', 0, 1);
INSERT INTO `users` VALUES (4, '2024-03-16 02:00:40.477', '2024-03-16 02:29:26.686', NULL, 0, 'c7b24f11-b846-4fa1-b592-87fdc65bfbfe', 'xiayu', '$2a$10$s4.MTYFZIi6ngjVaTQYeDeasqJJiG2hP/CfMKaoGRes0GK7Pz/eQ.', '', '测试1', '', '', '13106381942', 666, 'null', 0, 1);

SET FOREIGN_KEY_CHECKS = 1;
