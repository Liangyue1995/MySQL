-- 仿 http://dict.cn/ 设计一个简单的在线电子词典数据库表结构，
-- 实现从英文查中文，从中文查英文功能
DROP DATABASE IF EXISTS db_dict;
CREATE DATABASE db_dict;
USE db_dict;

DROP TABLE IF EXISTS db_dict.English;
CREATE TABLE db_dict.English(
  ID INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  word VARCHAR(225)COMMENT '英文'
);
DROP TABLE IF EXISTS db_dict.Chinese;
CREATE TABLE db_dict. Chinese(
  ID INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  word VARCHAR(225)COMMENT '中文'
);
DROP  TABLE  IF EXISTS db_dict_English_Chinese;
CREATE TABLE db_dict_English_Chinese(
  EnglishId INT COMMENT '英文',
  ChineseId INT COMMENT '中文'
);