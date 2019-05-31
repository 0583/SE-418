/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : illumi_database

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 30/05/2019 10:44:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hastag
-- ----------------------------
DROP TABLE IF EXISTS `hastag`;
CREATE TABLE `hastag`  (
  `imageid` int(10) UNSIGNED NOT NULL,
  `tagid` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`imageid`, `tagid`) USING BTREE,
  INDEX `hastag_ibfk_2`(`tagid`) USING BTREE,
  CONSTRAINT `hastag_ibfk_1` FOREIGN KEY (`imageid`) REFERENCES `image` (`imageid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `hastag_ibfk_2` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `imageid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `imagecontent` longblob NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`imageid`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tagid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tagname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`tagid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
    `username` VARCHAR(255)CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI NOT NULL,
    `password` VARCHAR(32)CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI NULL DEFAULT NULL,
    PRIMARY KEY (`username`) USING BTREE
)  ENGINE=INNODB CHARACTER SET=UTF8 COLLATE = UTF8_GENERAL_CI ROW_FORMAT=DYNAMIC;


-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
    `colorname` VARCHAR(127)CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI NOT NULL,
    `coloralias` VARCHAR(127)CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI NULL DEFAULT NULL,
    `r` int(3) UNSIGNED NOT NULL,
    `g` int(3) UNSIGNED NOT NULL,
    `b` int(3) UNSIGNED NOT NULL,
    `c` int(3) UNSIGNED NOT NULL,
    `m` int(3) UNSIGNED NOT NULL,
    `y` int(3) UNSIGNED NOT NULL,
    `k` int(3) UNSIGNED NOT NULL,
    PRIMARY KEY (`colorname`) USING BTREE
)  ENGINE=INNODB CHARACTER SET=UTF8 COLLATE = UTF8_GENERAL_CI ROW_FORMAT=DYNAMIC;


SET FOREIGN_KEY_CHECKS = 1;
