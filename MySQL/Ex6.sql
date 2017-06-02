DROP DATABASE IF EXISTS db_work;
CREATE DATABASE db_work;
USE db_work;
-- ------用户注册表-----
DROP TABLE IF EXISTS db_work.register;
CREATE TABLE db_work.register(
  ID INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  rtname VARCHAR(225)COMMENT '姓名',
  password VARCHAR(225)COMMENT '密码',
  packers    VARCHAR(225)COMMENT '组别:one-第一组，tow-第二组，there-第三组',
  type VARCHAR(224)COMMENT '类型：emp-组员，leader-组长'
)COMMENT '注册表';

-- -----留言表-------
DROP TABLE IF EXISTS db_work.message;
CREATE TABLE db_work.message(
  ID INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  content TEXT NOT NULL COMMENT '内容',
  time DATE NOT NULL    COMMENT '时间',
  wordID INT NOT NULL COMMENT 'PK 用户ID'
)COMMENT '留言表';
ALTER TABLE db_work.message
    ADD CONSTRAINT
message_fk_registerId
FOREIGN KEY (ID)
  REFERENCES db_work.register(ID) ;


#注册时选择组别（第一组；第二组；第三组）以及员工或组长身份
INSERT INTO db_work.register VALUES (
    NULL ,'tom','123','one','emp');
SELECT * FROM db_work.register;
#员工登录可以发布当天的工作日志，并可以查看自己的所有日志
INSERT INTO db_work.message(ID, content,wordID,time)
  VALUE ( NULL ,'留言内容1。。。', 1,'2015-5-31');
INSERT INTO db_work.message (content, wordID,time)
  VALUE ('留言内容2。。。', 1,'2015-6-1');
SELECT * FROM db_work.message;
SELECT *FROM db_work.message WHERE wordID=1;
#组长登录可以发布当天的工作日志，并可以查看本组的所有日志
INSERT  INTO  db_work.register VALUES (
    NULL ,'rou','456','one','leader'
);

SELECT
  r.rtname,
  m.content,
  m.time
FROM db_work.register r  LEFT OUTER JOIN db_work.message m -- ***
    ON r.id = m.Id
WHERE r. packers = 'one';

#组长可以按姓名和日期进行日志查询
SELECT
  r.rtname,
  m.content,
  m.time
FROM db_work.register r INNER JOIN db_work.message m
    ON r.ID = m.wordID
WHERE  r.packers= 'one' AND r.rtname = 'emp' AND m.time = '2017-5-31';
