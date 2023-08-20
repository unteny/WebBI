/*
 Navicat Premium Data Transfer

 Source Server         : 腾讯云
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : 101.43.139.84:3306
 Source Schema         : test4

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 20/08/2023 18:36:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for com_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `com_dictionary`;
CREATE TABLE `com_dictionary`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of com_dictionary
-- ----------------------------
INSERT INTO `com_dictionary` VALUES (1, 'imgpath', 'imgpath', '/www/image', 'core', NULL, '1');
INSERT INTO `com_dictionary` VALUES (2, 'imgurl', 'imgurl', '127.0.0.1:19888/', 'core', NULL, '1');

-- ----------------------------
-- Table structure for datasetting
-- ----------------------------
DROP TABLE IF EXISTS `datasetting`;
CREATE TABLE `datasetting`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `conname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `constr` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pwd` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ini_size` int NOT NULL,
  `max_active` int NOT NULL,
  `min_idle` int NOT NULL,
  `max_wait` int NOT NULL,
  `istest` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `test_sql` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'SELECT 1 FROM DUAL',
  PRIMARY KEY (`id`, `conname`, `constr`) USING BTREE,
  UNIQUE INDEX `index-id`(`id` ASC) USING BTREE,
  UNIQUE INDEX `index-name`(`conname` ASC) USING BTREE,
  UNIQUE INDEX `index-constr`(`constr` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of datasetting
-- ----------------------------
INSERT INTO `datasetting` VALUES (34, '和田项目', 'jdbc:oracle:thin:@172.17.9.253/hisdb', 'htut', 'wweyy6868302', 'Oracle', 1, 10, 1, 500, '1', 'SELECT 1 FROM DUAL');
INSERT INTO `datasetting` VALUES (35, '张承宇本地', 'jdbc:mysql://127.0.0.1:3306/', 'root', 'zcy2013.', 'MySQL', 1, 10, 1, 500, '1', 'SELECT 1 FROM DUAL');
INSERT INTO `datasetting` VALUES (37, '和田内网', 'jdbc:oracle:thin:@172.17.1.72/hisdb', 'htut', 'wweyy6868302', 'Oracle', 1, 10, 1, 500, '1', 'SELECT 1 FROM DUAL');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `DEPTNO` int NOT NULL AUTO_INCREMENT,
  `DNAME` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `LOC` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`DEPTNO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO `dept` VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO `dept` VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO `dept` VALUES (40, 'OPERATIONS', 'BOSTON');
INSERT INTO `dept` VALUES (41, '研发部3', '北京33');
INSERT INTO `dept` VALUES (42, '研发部', '北京');
INSERT INTO `dept` VALUES (43, '研发部', '北京');
INSERT INTO `dept` VALUES (44, '研发部', '北京');
INSERT INTO `dept` VALUES (45, '研发部', '北京');
INSERT INTO `dept` VALUES (46, '研发部', '北京');
INSERT INTO `dept` VALUES (47, '研发部', '北京');
INSERT INTO `dept` VALUES (48, '研发部', '北京');
INSERT INTO `dept` VALUES (49, '研发部', '北京');
INSERT INTO `dept` VALUES (50, '研发部', '北京');
INSERT INTO `dept` VALUES (51, '研发部', '北京');
INSERT INTO `dept` VALUES (52, '研发部', '北京');
INSERT INTO `dept` VALUES (53, '研发部', '北京');
INSERT INTO `dept` VALUES (54, '研发部', '北京');
INSERT INTO `dept` VALUES (55, '研发部', '北京');
INSERT INTO `dept` VALUES (59, '人事部', '北京');

-- ----------------------------
-- Table structure for img_info
-- ----------------------------
DROP TABLE IF EXISTS `img_info`;
CREATE TABLE `img_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cart` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of img_info
-- ----------------------------
INSERT INTO `img_info` VALUES (1, 'test.png', '测试类别', '测试');
INSERT INTO `img_info` VALUES (2, 'test2.png', '测试类别2', '测试2');
INSERT INTO `img_info` VALUES (4, 'upload.png', '测试类别', 'upload');
INSERT INTO `img_info` VALUES (5, 'sss.png', '测试类别', 'sss');
INSERT INTO `img_info` VALUES (6, 'car.glb', '3D模型', '汽车模型');
INSERT INTO `img_info` VALUES (7, 'test.mp4', '视频', '测试视频');
INSERT INTO `img_info` VALUES (8, 'add.png', '未分类', 'add.png');
INSERT INTO `img_info` VALUES (9, 'bg.gif', '未分类', 'bg.gif');
INSERT INTO `img_info` VALUES (10, 'htyy.jfif', '未分类', 'htyy.jfif');
INSERT INTO `img_info` VALUES (11, '微信图片_20230608195643.png', '未分类', 'cs');
INSERT INTO `img_info` VALUES (26, '7257aa9d-7582-4d54-9037-d3ba8b0b8e15.jpg', '未分类', '蹭蹭.jpg');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `fid` int NULL DEFAULT 0,
  `order` int NULL DEFAULT 0,
  `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '首页', '/', 0, 1, 'index', 'House');
INSERT INTO `menu` VALUES (2, '页面详情', '/showview', 0, 2, 'index', 'EditPen');
INSERT INTO `menu` VALUES (3, '静态资源', '/imageview', 0, 3, 'index', 'Wallet');
INSERT INTO `menu` VALUES (4, '数据源', '/datasetting', 0, 4, 'index', 'Coin');
INSERT INTO `menu` VALUES (5, '数据集', '/databank', 0, 5, 'index', 'Wallet');
INSERT INTO `menu` VALUES (6, '首页', '/', 0, 2, 'edit', 'House');
INSERT INTO `menu` VALUES (7, '页面详情', '/showview', 0, 1, 'edit', 'EditPen');
INSERT INTO `menu` VALUES (8, '静态资源', '/imageview', 0, 3, 'edit', 'Wallet');
INSERT INTO `menu` VALUES (9, '数据源', '/datasetting', 0, 4, 'edit', 'Coin');
INSERT INTO `menu` VALUES (10, '数据集', '/databank', 0, 5, 'edit', 'Wallet');
INSERT INTO `menu` VALUES (11, '首页', '/', 0, 2, 'imageview', 'House');
INSERT INTO `menu` VALUES (12, '页面详情', '/showview', 0, 2, 'imageview', 'EditPen');
INSERT INTO `menu` VALUES (13, '静态资源', '/imageview', 0, 1, 'imageview', 'Wallet');
INSERT INTO `menu` VALUES (14, '数据源', '/datasetting', 0, 2, 'imageview', 'Coin');
INSERT INTO `menu` VALUES (15, '数据集', '/databank', 0, 5, 'imageview', 'Wallet');
INSERT INTO `menu` VALUES (16, '首页', '/', 0, 2, 'datasetting', 'House');
INSERT INTO `menu` VALUES (17, '页面详情', '/showview', 0, 2, 'datasetting', 'EditPen');
INSERT INTO `menu` VALUES (18, '静态资源', '/imageview', 0, 2, 'datasetting', 'Wallet');
INSERT INTO `menu` VALUES (19, '数据源', '/datasetting', 0, 1, 'datasetting', 'Coin');
INSERT INTO `menu` VALUES (20, '数据集', '/databank', 0, 5, 'datasetting', 'Wallet');

-- ----------------------------
-- Table structure for need_task
-- ----------------------------
DROP TABLE IF EXISTS `need_task`;
CREATE TABLE `need_task`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `type` enum('需求','bug') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT '已关闭',
  `ischange` enum('是','否') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT '否',
  `create_time` datetime NULL DEFAULT NULL,
  `release_time` datetime NULL DEFAULT NULL,
  `confirm_time` datetime NULL DEFAULT NULL,
  `complete_time` datetime NULL DEFAULT NULL,
  `change_time` datetime NULL DEFAULT NULL,
  `change_times` int NULL DEFAULT 0,
  `estimated_workload` int NULL DEFAULT NULL,
  `project_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of need_task
-- ----------------------------
INSERT INTO `need_task` VALUES (1, '需求1', '需求', '已关闭', '否', '2023-08-01 10:00:00', '2023-08-10 15:00:00', '2023-08-12 09:00:00', '2023-08-15 14:30:00', NULL, 0, 20, 'Project A');
INSERT INTO `need_task` VALUES (2, 'Bug1', 'bug', '已关闭', '否', '2023-08-02 08:30:00', NULL, NULL, NULL, NULL, 0, NULL, 'Project B');
INSERT INTO `need_task` VALUES (3, '需求2', '需求', '已关闭', '否', '2023-08-05 14:00:00', '2023-08-20 12:00:00', '2023-08-22 10:00:00', NULL, NULL, 0, 15, 'Project A');
INSERT INTO `need_task` VALUES (4, 'Bug2', 'bug', '已关闭', '否', '2023-08-07 11:30:00', NULL, NULL, NULL, NULL, 0, NULL, 'Project C');
INSERT INTO `need_task` VALUES (5, 'Bug3', 'bug', '已关闭', '否', '2023-08-17 10:00:00', '2023-08-20 15:00:00', NULL, '2023-08-25 14:30:00', NULL, 0, 8, 'Project A');
INSERT INTO `need_task` VALUES (6, '需求3', '需求', '已关闭', '是', '2023-08-18 09:30:00', NULL, '2023-08-20 10:00:00', '2023-08-23 11:45:00', '2023-08-23 10:30:00', 2, 12, 'Project A');
INSERT INTO `need_task` VALUES (7, 'Bug4', 'bug', '已关闭', '否', '2023-08-17 10:30:00', '2023-08-22 16:00:00', NULL, '2023-08-27 10:15:00', NULL, 0, 6, 'Project B');
INSERT INTO `need_task` VALUES (8, '需求4', '需求', '已关闭', '是', '2023-08-19 11:15:00', NULL, '2023-08-23 12:30:00', '2023-08-25 14:20:00', '2023-08-24 09:45:00', 3, 10, 'Project B');
INSERT INTO `need_task` VALUES (9, 'Bug5', 'bug', '已关闭', '否', '2023-08-18 14:00:00', '2023-08-23 18:00:00', NULL, '2023-08-28 12:45:00', NULL, 0, 7, 'Project C');
INSERT INTO `need_task` VALUES (10, '需求5', '需求', '已关闭', '是', '2023-08-20 10:45:00', NULL, '2023-08-25 09:30:00', '2023-08-26 15:10:00', '2023-08-24 14:30:00', 1, 15, 'Project C');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '*', NULL, 1);
INSERT INTO `permission` VALUES (2, 'see', NULL, 1);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `author` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` blob NULL,
  `cart` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (3, '测试名', 'zcy', '2023-08-17 00:32:24', 0x626A35583943345A657248342B6B6348704E4D58315043646647614476667436677150757A37636D746C697A6D466D4C6351666C727A6B68354152737449677A746A45797953527532542F56737853324E4A6E34665774315A33324168786A4C53456E4E6A6671693544384E425158623970783942716B52675A5A357953516631313976516C7753497736416A3233614F422B6D554F506A6F4E4A72684439514A695439316D51316E68447471665465395058324D6372317746454574505931667674362F764A4F365A5144666D766A336A4E3841716B6F4E387A385051487348306147464D54716454436A426D43572F66416F6946576F46454258657978626446465336536B364F6F466F716A51706341766E316D6E436B6E47342B566745527879346C6D5662776E484774466875354F49764D662F534447364E4B634B7A, NULL);
INSERT INTO `post` VALUES (5, '大屏思路', NULL, '2023-08-17 00:58:40', NULL, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'super-admin', NULL, 1);
INSERT INTO `role` VALUES (2, 'admin', NULL, 1);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1, 1, 1);

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage`  (
  `PartID` int NOT NULL,
  `PartName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `PartFactory` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `PartModel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `PartParameters` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `PartUnit` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `PartAmount` int NULL DEFAULT NULL,
  `PartUnitPrice` float NULL DEFAULT NULL,
  `PartCreatTime` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES (2, '西门子1200PLC', '西门子', '6ES7215-1AG40-0XB0', 'CPU 1215C DC/DC/DC', '套', 1, 3431.73, '2023-02-09 13:05:38');
INSERT INTO `storage` VALUES (3, '西门子S7-1200的IO模块', '西门子', '6ES7223-1BH32-0XB0', 'DI 8/DQ 8x24VDC_1', '套', 1, 1012.64, '2023-02-09 13:09:27');
INSERT INTO `storage` VALUES (4, '触摸屏', '威纶通', 'TK8071IP', '7寸触摸屏', '套', 1, 716.725, '2023-02-09 13:10:50');
INSERT INTO `storage` VALUES (5, '三色灯', 'ONN/欧恩', 'M4-3CBCT-RYG-60', 'ONN/欧恩 杆盘式三色灯 M4-3CBCT-RYG-60(一体灯板) 红色闪光带蜂鸣 1个', '个', 1, 111.76, '2023-02-09 13:11:28');
INSERT INTO `storage` VALUES (6, '开关电源', 'MW/明纬', 'LRS-150-36', 'MW/明纬 开关电源 LRS-150-36 1个', '块', 1, 77.89, '2023-02-09 13:12:57');
INSERT INTO `storage` VALUES (7, '接触器', '施耐德', 'LC1-N40M5N', 'SCHNEIDER/施耐德电气 交流接触器 LC1-N40M5N 1个', '个', 3, 106.247, '2023-02-09 13:13:54');
INSERT INTO `storage` VALUES (8, '24V直流继电器座', '施耐德', 'RXZE1M4C ', 'SCHNEIDER/施耐德电气 继电器底座 RXZE1M4C 1个', '套', 20, 8.4867, '2023-02-09 13:14:40');
INSERT INTO `storage` VALUES (9, '急停按钮', '天逸', 'LA42JT-01/R', 'TAYEE/天逸 急停按钮 LA42JT-01/R 1个', '套', 2, 26.61, '2023-02-09 13:15:12');
INSERT INTO `storage` VALUES (10, '带灯按钮', '施耐德', 'XB2BW33M1C', 'SCHNEIDER/施耐德电气 金属按钮 XB2-BW33M1C ZB2BWM31C+ZB2BW33C', '个', 5, 26.69, '2023-02-09 13:15:51');
INSERT INTO `storage` VALUES (11, '端子', '菲尼克斯', 'UK 2,5 B', 'PHOENIX CONTACT/菲尼克斯 UK系列直通式接线端子 UK 2,5 B 1个', '盒', 1, 1.566, '2023-02-09 13:16:29');
INSERT INTO `storage` VALUES (12, '对射光电', '欧姆龙', 'E3Z-T66 ', 'OMRON/欧姆龙 对射型光电开关 E3Z-T66 BY OMC 1个', '组', 1, 252.743, '2023-02-09 13:17:03');
INSERT INTO `storage` VALUES (13, '气管', '', '', '外径8mm', '卷', 1, 200, '2023-02-09 13:17:37');
INSERT INTO `storage` VALUES (14, '气管接头', '', '', '三通接头8mm', '个', 20, 3, '2023-02-09 13:17:59');
INSERT INTO `storage` VALUES (15, '气管接头', '', '', '气管接头_PC8-M6', '个', 20, 1.5, '2023-02-09 13:18:21');
INSERT INTO `storage` VALUES (16, '气管接头', '', '', '气管接头_PC8-M8', '个', 20, 1.5, '2023-02-09 13:18:34');
INSERT INTO `storage` VALUES (17, '气管接头', '', '', '气管接头_PC6-M6', '个', 20, 1.5, '2023-02-09 13:18:43');
INSERT INTO `storage` VALUES (18, '气管接头', '', '', '气管接头_PC6-M8', '个', 20, 1.5, '2023-02-09 13:18:51');
INSERT INTO `storage` VALUES (19, '变径接头', '', '', '变径接头_m8-m6', '个', 20, 1, '2023-02-09 13:19:09');
INSERT INTO `storage` VALUES (20, '变径接头', '', '', '变径接头_m10-m8', '个', 20, 1.2, '2023-02-09 13:19:21');
INSERT INTO `storage` VALUES (21, '变径接头_m12-m10', '', '', '变径接头_m10-m8', '个', 20, 1.5, '2023-02-09 13:19:32');
INSERT INTO `storage` VALUES (22, '气管', '', '', '直径6mm', '卷', 1, 136, '2023-02-09 13:19:59');
INSERT INTO `storage` VALUES (23, '气管', '', '', '直径10mm', '卷', 1, 140, '2023-02-09 13:20:11');
INSERT INTO `storage` VALUES (24, '气管', '', '', '直径12mm', '卷', 1, 180, '2023-02-09 13:20:22');
INSERT INTO `storage` VALUES (25, '内六角扳手', '', '', '5*15内六角', '套', 20, 0.75, '2023-02-09 13:20:51');
INSERT INTO `storage` VALUES (26, '内六角扳手', '', '', '6*20内六角', '套', 20, 0.75, '2023-02-09 13:21:03');
INSERT INTO `storage` VALUES (27, '内六角扳手', '', '', '8*15内六角', '套', 20, 0.75, '2023-02-09 13:21:08');
INSERT INTO `storage` VALUES (28, '弹垫', '', '', '直径20mm平垫弹垫', '套', 10, 1, '2023-02-09 13:21:32');
INSERT INTO `storage` VALUES (29, '扳手', '', '', '一套内六角扳手', '套', 1, 38, '2023-02-09 13:22:24');
INSERT INTO `storage` VALUES (30, '扳手', '', '', '活动扳手200*24', '把', 1, 30, '2023-02-09 13:22:44');
INSERT INTO `storage` VALUES (31, '电池', '', '', '万用表电池', '个', 2, 5, '2023-02-09 13:23:05');
INSERT INTO `storage` VALUES (32, '线缆', '', '', '4*0.5', '卷', 1, 270, '2023-02-09 13:23:33');
INSERT INTO `storage` VALUES (33, '线缆', '', '', '5*0.75', '卷', 1, 360, '2023-02-09 13:23:46');
INSERT INTO `storage` VALUES (34, '线缆', '', '', '2*1.5', '卷', 1, 330, '2023-02-09 13:23:58');
INSERT INTO `storage` VALUES (35, '端子', '', '', 'ST系列接线端子_额定电流17.5A', '包', 1, 45, '2023-02-09 13:24:18');
INSERT INTO `storage` VALUES (36, '配线槽', '', '', '宽度：60，高度：60，颜色：灰色', '根', 1, 28, '2023-02-09 13:24:38');
INSERT INTO `storage` VALUES (37, '配线槽', '', '', '宽度：80，高度：60，颜色：灰色', '根', 1, 38, '2023-02-09 13:24:52');
INSERT INTO `storage` VALUES (38, '针型端子', '', '', '冷压端子，管型端子带绝缘箍', '包', 3, 18, '2023-02-09 13:25:13');
INSERT INTO `storage` VALUES (39, '压线钳', '', '', '棘轮压线钳', '把', 1, 77, '2023-02-09 13:25:34');
INSERT INTO `storage` VALUES (40, '剥线钳', '', '', '鹰嘴万用剥线钳', '把', 1, 150, '2023-02-09 13:25:54');
INSERT INTO `storage` VALUES (41, '导轨', '', '', 'DIN导轨，铝合金，标准型', '米', 20, 6, '2023-02-09 13:26:16');
INSERT INTO `storage` VALUES (42, '扎带', '', '', '2.5*100', '包', 1, 5, '2023-02-09 13:26:36');
INSERT INTO `storage` VALUES (43, '扎带', '', '', '2.5*200', '包', 1, 8, '2023-02-09 13:26:48');
INSERT INTO `storage` VALUES (44, '手枪钻', '博世', '', '', '把', 1, 330, '2023-02-09 13:27:11');
INSERT INTO `storage` VALUES (45, '钻头', '博世', '', '钻头套装', '套', 1, 83, '2023-02-09 13:27:28');
INSERT INTO `storage` VALUES (46, '扩孔器', '博世', '', '套装', '套', 1, 28, '2023-02-09 13:27:44');
INSERT INTO `storage` VALUES (47, '丝锥', '博世', '', '手动丝锥套装', '套', 5, 8, '2023-02-09 13:28:00');
INSERT INTO `storage` VALUES (49, '断路器', '施耐德', 'A9F18432', '\"额定电流(A)：32 ', '套', 1, 154.32, '2023-02-12 15:50:38');
INSERT INTO `storage` VALUES (50, '断路器', '施耐德', 'A9F18101', '\"额定电流(A)：1 ', '套', 2, 52.48, '2023-02-12 15:51:52');
INSERT INTO `storage` VALUES (51, '分线端子台', '米思米', 'MWS-COM-TB15', '通用型1对15公共端子台 ', '套', 12, 49.04, '2023-02-12 15:52:46');
INSERT INTO `storage` VALUES (52, '工控机', 'Dell', 'SE2422H', '\"显示类型：LED背光液晶显示器 / TFT 主动矩阵 ', '套', 1, 849, '2023-02-12 15:53:25');
INSERT INTO `storage` VALUES (53, 'test', 'test', 'test', 'test', 'test', 0, 0, '2023-02-12 17:08:16');
INSERT INTO `storage` VALUES (54, '11', '11', '11', 'System.Windows.Documents.FlowDocument', '11', 1, 1, '2023-02-12 18:19:57');
INSERT INTO `storage` VALUES (55, '22', '22', '22', '22\r\n', '22', 22, 22, '2023-02-12 18:26:00');
INSERT INTO `storage` VALUES (55, '22', '22', '22', '22\r\n', '22', 22, 22, '2023-02-12 18:26:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'zcy2013.', NULL, 1);
INSERT INTO `user` VALUES (2, 'benbi', 'zcy2013.', NULL, 1);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------

-- ----------------------------
-- Table structure for view_data
-- ----------------------------
DROP TABLE IF EXISTS `view_data`;
CREATE TABLE `view_data`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '报表id',
  `viewname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '报表名',
  `frefid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `refid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT 'ref属性',
  `settings` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT '' COMMENT '设置',
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT '' COMMENT '控件类型',
  `data` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '值',
  `style` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT 'height: 100px;width: 100px;' COMMENT '控件样式',
  `datatype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT '' COMMENT '数据类型',
  `db` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT '' COMMENT '数据库',
  `fulldata` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 754 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of view_data
-- ----------------------------
INSERT INTO `view_data` VALUES (446, 'test1', 'f模型', '模型', 'AMDukp+HnGg=', 'ModelComponent', 'q8tg1jNiI5h9x0rRjZgBguIsEI1s7Qoo/MHMsUXE64kfBLqfuUKwyw==', 'height: 100px;width: 100px;z-index: 3;', 'str', '', '');
INSERT INTO `view_data` VALUES (585, 'test2', 'fchart', 'chart', 't20O9qmKLLxLONG27YJhjoFDeCxfmshlqaPiJQEutVMwmKi8FtMhyNM/yngGhW01ucppXM1RiW1zBwm/TDmaIX8rMCbQdYSZB/73/kD0ceBM58b8lL8Y2oiAH/aJJFOwbrsA+YKTdYKYyFSpyHuFCLOSVi2QiH2sgrqPGRnKQ/sOh1RVNueNJQUqbW8Cja5R', 'ChartComponent', 'svgPz6QnZ4viw1/GsmBDEvmo6FGDShmQpmfQbEO3PbiYSD1KpmOhuTJv6qXGJd2jqc5JmknkEeT+o8twRDCNmuwLGSr+cN+gCQE5ySBEgaUcicAxifqwCeuBuChpUfNsgPyRbAIUg9owvTrY8wjkF5RRfA9IJTKcVurMpBJ25RqrNGdGiPsvZuj9wuVIgKdK0xNzCcM1nE4gKULtF+331ymFl2avnwfb/FJ9/m9OI6VqaZsMFAU6Ggt0TKMt3wIcp7isJkzIX8KMoQwJX6/vgV5Jod/5Bs8MpasHM7LZdswPJ0p/p+FjFPgYgMbOSalr8LxWtVzEppC8UAtjYdaEvFjNTdWEL91fiE4OqSqnRt9J52fQwRS/3lfs4T9mM6d3GkrHi06RZmp/HmTWTkHv+0DDRtxldnZrGKEONH6C5nvuspAfuNxnyNRHO/ZhWCZYRu2idlaVtXpz7dWnNBITKkgVY8yeqY23PWgy+mj+tEA3xKCHCXHuTVcH0hBJno79w+3nxtnI8YqZT5e+8LcmtoDqA2KlyQfkhuB7Wat0E3oJ0GssQ6gFSigynADnknF9Uf3nbxB9cob3zvgjH4mLTUpvPVviWGHEwQmvopLcvwt8NJXfEnm/QUjoWOfo95tnVpfhnqzZwtyuzpgloo2N6fWgBXq22M7X25fq0mNP82reE97RL+/CGd1/bWTUn59pjxfihUgpxzKVJ212GnEwmLTbCNtA/nQ0+Uus1w3+QTfo0JVkrhvZOA==', 'width: 22%; height: 30%; position: absolute; left: 41px; top: 82px; z-index: 3;', 'sql', '和田内网', '');
INSERT INTO `view_data` VALUES (586, 'test2', 'ft1', 't1', 'AMDukp+HnGg=', 'StringComponent', 'tUVVNpyVqFj95V1fo2xexqkWASrZ+3pl', 'height: 3%; width: 5%; position:  absolute; left: 33px; top: 20px; font-size: 16px; z-index=3;color:black;', 'str', ' ', '');
INSERT INTO `view_data` VALUES (591, 'tools', '文本', 'text', 'AMDukp+HnGg=', 'StringComponent', '0+mGYD0gVAxK0loOfM7LU3n4kXxovapcZBOkcJzSBAuwwc9eXrVoFyCz0XJIblGunmiZQfT1g9gE475U7k4vK2zXXnMf/VpOKd/aR1YHG7g=', 'width: 25%; height: 25%; position: absolute; left: 527px; top: 24px;font-size:24px;', 'str', '', '');
INSERT INTO `view_data` VALUES (715, '四级电子病历数据质量', 'f题目', '题目', 'AMDukp+HnGg=', 'StringComponent', '0+mGYD0gVAxK0loOfM7LU3n4kXxovapcZBOkcJzSBAuwwc9eXrVoFyCz0XJIblGunmiZQfT1g9gE475U7k4vK2zXXnMf/VpOKd/aR1YHG7g=', 'width: 31%; height: 5%; position: absolute; left:35%; top: 10px; font-size: 24px; ', 'str', '', '');
INSERT INTO `view_data` VALUES (716, '四级电子病历数据质量', 'f2.1.3', '2.1.3', 'AMDukp+HnGg=', 'StringComponent', 'EHJvFxApzOm17hdZmBI9AWbQGlIv2XWZVhCBMWxvkDg=', 'width: 15%; height: 5%; position: absolute; left: 19px; top: 54px; font-size: 18px; ', 'str', '', '');
INSERT INTO `view_data` VALUES (717, '四级电子病历数据质量', 'f入院方式', '入院方式', 'AMDukp+HnGg=', 'StringComponent', 'aKJiIQoSf1ckqJqx7KDIWA==', 'width: 5%; height: 5%; position: absolute; left: 66px; top: 93px; font-size: 16px; ', 'str', '', '');
INSERT INTO `view_data` VALUES (718, '四级电子病历数据质量', 'f护理级别', '护理级别', 'AMDukp+HnGg=', 'StringComponent', '8BKdEU8h7cJDXNu0Dq9FRg==', 'width: 5%; height: 5%; position: absolute; left: 66px; font-size: 16px; top: 159px; ', 'str', '', '');
INSERT INTO `view_data` VALUES (719, '四级电子病历数据质量', 'f菜单', '菜单', 'AMDukp+HnGg=', 'StringComponent', 'JjQPNj6GkJC1cTTeVHNmvRz5UZDn5baXzBa3uwqklm7bXp0cls7SFTk7UmcRPltOjf31r9UhYp0=', 'width: 25%; height: 25%; position: absolute; left: 380px; top: 257px; font-size: 24px; ', 'str', '', '');
INSERT INTO `view_data` VALUES (720, '四级电子病历数据质量', 'f文本', 'text', 'AMDukp+HnGg=', 'TableComponent', 'KFvWnLg4daE=', 'width: 25%; height: 25%; position: absolute; left: 527px; top: 24px;font-size:24px;', 'str', '张承宇本地', '');
INSERT INTO `view_data` VALUES (737, 'test', 'fchart', 'chart', 't20O9qmKLLxLONG27YJhjoFDeCxfmshlqaPiJQEutVMwmKi8FtMhyNM/yngGhW01ucppXM1RiW1zBwm/TDmaIX8rMCbQdYSZB/73/kD0ceBM58b8lL8Y2oiAH/aJJFOwbrsA+YKTdYKYyFSpyHuFCLOSVi2QiH2sgrqPGRnKQ/sOh1RVNueNJQUqbW8Cja5R', 'ChartComponent', 'svgPz6QnZ4viw1/GsmBDEvmo6FGDShmQpmfQbEO3PbiYSD1KpmOhuTJv6qXGJd2jqc5JmknkEeT+o8twRDCNmuwLGSr+cN+gCQE5ySBEgaUcicAxifqwCeuBuChpUfNsgPyRbAIUg9owvTrY8wjkF5RRfA9IJTKcVurMpBJ25RqrNGdGiPsvZuj9wuVIgKdK0xNzCcM1nE4gKULtF+331ymFl2avnwfb/FJ9/m9OI6VqaZsMFAU6Ggt0TKMt3wIcp7isJkzIX8KMoQwJX6/vgV5Jod/5Bs8MpasHM7LZdswPJ0p/p+FjFPgYgMbOSalr8LxWtVzEppC8UAtjYdaEvFjNTdWEL91fiE4OqSqnRt9J52fQwRS/3lfs4T9mM6d3GkrHi06RZmp/HmTWTkHv+0DDRtxldnZrGKEONH6C5nvuspAfuNxnyNRHO/ZhWCZYRu2idlaVtXpz7dWnNBITKkgVY8yeqY23PWgy+mj+tEA3xKCHCXHuTVcH0hBJno79w+3nxtnI8YqZT5e+8LcmtoDqA2KlyQfkhuB7Wat0E3oJ0GssQ6gFSigynADnknF9Uf3nbxB9cob3zvgjH4mLTUpvPVviWGHEwQmvopLcvwt8NJXfEnm/QUjoWOfo95tnVpfhnqzZwtyuzpgloo2N6fWgBXq22M7X25fq0mNP82reE97RL+/CGd1/bWTUn59pjxfihUgpxzKVJ212GnEwmLTbCNtA/nQ0+Uus1w3+QTfo0JVkrhvZOA==', 'width: 22%; height: 30%; position: absolute; left: 41px; top: 82px; z-index: 3;', 'sql', '和田内网', '');
INSERT INTO `view_data` VALUES (738, 'test', 'fimg1', 'img1', 'AMDukp+HnGg=', 'ImageComponent', 'q8tg1jNiI5h9x0rRjZgBguIsEI1s7QooftVFVisSQjVQu/yCAIQy9g==', 'height: 99%; width: 99%; position: absolute;z-index:-99;overflow:hidden;  ', 'str', ' ', '');
INSERT INTO `view_data` VALUES (739, 'test', 'ft1', 't1', 'AMDukp+HnGg=', 'StringComponent', 'tUVVNpyVqFj95V1fo2xexqkWASrZ+3pl', 'height: 3%; width: 5%; position:  absolute; left: 33px; top: 20px; font-size: 16px; z-index=3;color:rgba(255, 255, 255, 1);', 'str', ' ', '');
INSERT INTO `view_data` VALUES (740, 'test', 'f今日入院人数', '今日入院人数', 'AMDukp+HnGg=', 'StringComponent', 'NFyI9Y4wbN0ZYXGQ5bdx00taXk/DRGA70Fz6XrG7tV3rwjdQfzU6ok3Cpdq6COMYsThh/CZiZOVAUK6KDgPX9ztljpJz+LOgnlOr/pJJns1A8ipbBY4KTpIIvaRIdEtl8N58Y7+9hAwsjoOkiZE7Lz5P9hKU4ZMKwOP3jdto5/gxqHmIG0dGJuxzY5I0YmO/9BBOiqZpfz2MY2cVLU0Js+z3OnGJFAGNk0J1fuh5MeFfzZaqC0w8lZk+nrEN5DlrZfwEsTjwzELlpWGM91oJL9LgbYUkKLogULO+KTbtvVxW7J9M+tG/rkCWzxKUz9ya6gQRZupAtOVJ/KiJLREP150ofDu4vLHgr/CzNqycjnS6z1KV7hfl9A==', 'height: 3%; width: 7%; position: absolute; left: 137px; top: 20px; font-size: 16px; z-index:3;color:rgba(255, 255, 255, 1);', 'sql', '和田内网', '');
INSERT INTO `view_data` VALUES (741, 'test', 'f医院图片', '医院图片', 'AMDukp+HnGg=', 'ImageComponent', 'q8tg1jNiI5h9x0rRjZgBghhWqtdT9fHlEZbfDx74/+WMXx5BzNutoQ==', 'height: 25%; width: 25%; position: absolute; left: 1151px; top: 16px; z-index: 3;', 'str', ' ', '');
INSERT INTO `view_data` VALUES (742, 'test', 'f住院前十', '住院前十', '8lAlDGKgu3FvozEPu2XXRR+lKLH5buSr6sXNr7vpRkU9/rocydllNqvWV4MYQQWS8D+ZOaUCnFGq1yiyOTkU8tHtK3Ne8WBecZ9+0hasOBt5aRMj7DVJteIEeZ2Cj2FaQoCSTl+gs19iBN14wgktkGTRqidWoa/87cUClzgVR3yo0Ydrch/zMwKzpiFCN9E3gwPkcFeKDF32mfx7xWtx8qWsVvwmHGxfmZxQ5qmheGNK+3CY6a+Ur1ZlQwyrPWVS3JmZn8MPMOzEmaK4DMpP1lMPrD2GPC8I+x79U/ygYIE2BZolc3UuAWvPJ/pDLaG3br/1KBLn/Yg=', 'ChartComponent', 'ezl3a1+UshmquatWVp1X/+0i1rdBHABg/C2axnXgjk+j+Bn6aheVp/1BTOaM2ALHo2guBH9dMb4fBhk9jrAW0eJhlzokFPCuOV0c2h0Je4TNPcdLMzfMMoS0+eG7GK3RKMtW+du5A82GTYS2UtEJLDXfO8g7wnxmrc7rLxQUhv7jlgP+DYayHlchOqH8+YJJOq/vH44JkvC5LGSpF5F8E7KE+w29VW6I+Ga7Df9hA0y5qjGdTM9e8hG3nswtmedavwCNqL/aTeUbtm0V98J5Rljl36wPoVaanzG8oVQnpAr2r1stYd2aJzC1OFHNwCgkK51zXWdjkwWYq8CA6aYKk2hjOeAYIOQ5KjVo5xKBzKje6rrOj1c6TP81oT30GdmuoMAJi3f5204/oViqdmcM7imVAvX9DuoJIALxEggqkrHNPDDNAaWG7UkNGSi2ByUj/caaBi86kiuVrtka/dfFS0CLAVOLI4k27gBHtH3W4gOr+A0+Zn/n0jvLfCtPTQfD', 'width: 22%; height: 25%; position: absolute; left: 38px; top: 365px; z-index: 3;', 'sql', '和田内网', '');
INSERT INTO `view_data` VALUES (743, 'test', 'f测试模型', '测试模型', 'AMDukp+HnGg=', 'ModelComponent', 'q8tg1jNiI5h9x0rRjZgBghhWqtdT9fHlal/CGQJM+UwbBHwLdMNfJQ==', 'height: 25%; width: 25%;  position: absolute; left: 684px; top: 346px;z-index:-1;', 'str', ' ', '');
INSERT INTO `view_data` VALUES (744, 'test', 'fnew', 'new', '8lAlDGKgu3FvozEPu2XXRVq44AGLMQMyllz3zFH0jUgj6gz60dEk2HNxyspGdfGiNJaNhZ1oUS9rFxUUeoJOIOO9ygsy3+oljf9D/l0io2NAt/U9D/JyLR89QZLbRX3/tpdW6aRjUYYTe0mrxPh++813GcBsIa37NDfpDKumAPsJ5q5t+ZMwrf9yLFJWJzlqCrw0rj2cDQGtxhpzq0Rf6wprHhrBdKgm2hKz2+ArZOtHsHaM5BsV69j08EWm/CCMDLJ/W/sgnO0os0EvBwaAWnbRE6RnUVrcfXtOdkLxkjUwEC4OCGAdgcIQzxS18iZ8AjXzAqIFcmQ=', 'ChartComponent', '3GsSZNGwPTg6fm8Lgua2msSesRW8Ftk+HhqyFfnxtDWUQ2O1c2vQpDZZc07Rb2ppYcdonZmUFrtJQdTjmJIAbFgnLYixrIiWpGVK/T2gw2sznOPqyUlMksGv2vsGknnThMqiVj2owRuHszZyJzxPS2yz8Neu/uEP05PDNkCMqTdVTcuf5ABL4Op0ehRemV1cLtmkboM2JqJ7qP3RIOOVolWPCNl7kvWpECxMgbQscNyJQiXLFj+Cx5tZS2tiy1fqMYv8oRTV0FcF5bun734ROuVXuQZjHUSdN/VEN/LA+pnfMit6bC4CElXvaxSOdqXFYQa1jvMQoEY2ZKpprPvVfvFYgSJBilM0', 'width: 22%; height: 25%; position: absolute; left: 38px; top: 598px;', 'sql', '和田内网', '');
INSERT INTO `view_data` VALUES (752, '测试页面', 'f标题', '标题', 'AMDukp+HnGg=', 'StringComponent', '0+mGYD0gVAxK0loOfM7LU3n4kXxovapcZBOkcJzSBAuwwc9eXrVoFyCz0XJIblGunmiZQfT1g9gE475U7k4vK2zXXnMf/VpOKd/aR1YHG7g=', 'width: 25%; height: 25%; position: absolute; left: 663px; top: 17px; font-size: 24px;', 'str', '', '');

-- ----------------------------
-- Table structure for view_info
-- ----------------------------
DROP TABLE IF EXISTS `view_info`;
CREATE TABLE `view_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `viewname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `cart` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `auth` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `viewname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of view_info
-- ----------------------------
INSERT INTO `view_info` VALUES (1, 'test1', '测试', '测试', NULL, '2023-08-15 19:54:42', NULL);
INSERT INTO `view_info` VALUES (2, 'test', '测试', '测试', NULL, '2023-08-15 19:54:59', NULL);
INSERT INTO `view_info` VALUES (3, '测试页面', '测试', '测试', NULL, '2023-08-15 19:55:12', NULL);
INSERT INTO `view_info` VALUES (4, '四级电子病历数据质量', '测试', '测试', NULL, '2023-08-15 19:55:34', NULL);

SET FOREIGN_KEY_CHECKS = 1;
