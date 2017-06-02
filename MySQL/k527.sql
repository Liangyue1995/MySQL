DROP DATABASE IF EXISTS db_user;
CREATE DATABASE db_user;
-- -------用户注册-----
DROP TABLE IF EXISTS db_user.register;
CREATE TABLE db_user.register(
  ID INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  EMAIL VARCHAR(225) UNIQUE COMMENT '邮箱',
  ACCOUNT VARCHAR(225)  COMMENT '账号',
  PASSWORD VARCHAR(225) COMMENT '密码'
);
INSERT INTO db_user.register VALUES (
    NULL ,'lala@163.com ','lala','12345678'
);
INSERT INTO db_user.register VALUES (
  NULL ,'tom@qq.com ','tom','12345'
);
SELECT *FROM db_user.register;

SELECT EMAIL,PASSWORD
FROM db_user.register  WHERE ID=1;
-- -------用户发布留言-----
DROP TABLE IF EXISTS db_user.message;
CREATE TABLE db_user.message(
  ID INT AUTO_INCREMENT PRIMARY KEY COMMENT
  'ID PK',
  message TEXT COMMENT '留言内容',
  time DATETIME COMMENT '留言时间'
);
INSERT INTO db_user.message VALUES (
    NULL ,'好啊好好哈','2017-5-27 15:49:20'
);
ALTER TABLE db_user.message
  ADD CONSTRAINT
  fk_user_messageID
FOREIGN KEY (ID)
REFERENCES db_user.register(ID);
-- -------管理员查看所有留言-------
SELECT * FROM db_user.message;
-- 创建用户
CREATE USER db_user@'localhost' IDENTIFIED BY ' 1234';
GRANT DELETE ON db_user.message TO  db_user@'localhost';
