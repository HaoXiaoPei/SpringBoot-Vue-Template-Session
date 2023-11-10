/*
 Navicat Premium Data Transfer

 Source Server         : 本地MySQL
 Source Server Type    : MySQL
 Source Server Version : 50741
 Source Host           : localhost:3306
 Source Schema         : study

 Target Server Type    : MySQL
 Target Server Version : 50741
 File Encoding         : 65001

 Date: 14/10/2023 16:39:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for db_account
-- ----------------------------
DROP TABLE IF EXISTS `db_account`;
CREATE TABLE `db_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_name`(`username`) USING BTREE,
  UNIQUE INDEX `unique_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_account
-- ----------------------------
INSERT INTO `db_account` VALUES (1, NULL, 'admin', '$2a$10$IaBcrWQugdM8TzZV10GCA.DMBTy.kLLXNsAMTl2UMFlGBNYq3TLAW');
INSERT INTO `db_account` VALUES (6, '3229682331@qq.com', 'user', '$2a$10$4rJPrTdd8vvOKSqgILtTcOQrh2JE5rE4pQ6w/tPzlpRW8.BpxTJmq');

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins`  (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `series` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_used` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`series`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------

-- ----------------------------
-- View structure for test
-- ----------------------------
DROP VIEW IF EXISTS `test`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `test` AS select `s`.`sid` AS `sid`,`s`.`name` AS `name`,`s`.`sex` AS `sex`,`t`.`tid` AS `tid` from (`student` `s` left join `teach` `t` on((`s`.`sid` = `t`.`sid`)));

-- ----------------------------
-- View structure for test2
-- ----------------------------
DROP VIEW IF EXISTS `test2`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `test2` AS select `e`.`sid` AS `sid`,`e`.`name` AS `s_name`,`e`.`sex` AS `s_sex`,`t`.`name` AS `t_name` from (`test` `e` left join `teacher` `t` on((`e`.`tid` = `t`.`tid`)));

-- ----------------------------
-- Function structure for test
-- ----------------------------
DROP FUNCTION IF EXISTS `test`;
delimiter ;;
CREATE FUNCTION `test`(i INT)
 RETURNS int(11)
BEGIN
DECLARE a int  DEFAULT(20);
RETURN i * i * a;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
