# 核心功能
/*
5. 专题 collection
6. 关注 follow
7. 收藏 bookmarks
8. 打赏 pay
*/
DROP DATABASE IF EXISTS db_jianshu;
CREATE DATABASE db_jianshu;
USE db_jianshu;

DROP TABLE IF EXISTS db_jianshu.user;
CREATE TABLE db_jianshu.user (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  rname    VARCHAR(225) NOT NULL
  COMMENT '名字',
  tall     VARCHAR(225) NOT NULL
  COMMENT '手机',
  password VARCHAR(225) NOT NULL
  COMMENT '密码'
)
  COMMENT '用户注册表';

DROP TABLE IF EXISTS db_jianshu.notebook;
CREATE TABLE db_jianshu.notebook (
  id         INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name       TEXT COMMENT '名称',
  userId INT COMMENT 'FK 用户ID '
)
  COMMENT '文集表';

DROP TABLE IF EXISTS db_jianshu.note;
CREATE TABLE db_jianshu.note (
  id        INT      AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  comment   TEXT COMMENT '内容',
  time      DATETIME DEFAULT now()
  COMMENT '时间',
  views     INT      DEFAULT 0
  COMMENT '阅读次数',
  likes     INT      DEFAULT 0
  COMMENT '喜欢次数',
  notebookId INT      DEFAULT 0
  COMMENT 'FK 文集 ID'
)
  COMMENT '文章表';

DROP TABLE IF EXISTS db_jianshu.comment;
CREATE TABLE db_jianshu.comment(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  comment TEXT NOT NULL COMMENT '内容',
  time DATETIME DEFAULT now() COMMENT '时间',
  noteId INT COMMENT 'FK 文章 ID',
  userId INT COMMENT 'FK 用户 ID',
  commentId INT COMMENT 'FK 评论 ID'
)COMMENT '评论表';

ALTER TABLE db_jianshu.notebook
    ADD CONSTRAINT
 notebook_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user(id);

ALTER TABLE db_jianshu.note
  ADD CONSTRAINT
  note_fk_notebookId
FOREIGN KEY (notebookId)
REFERENCES db_jianshu.notebook(Id);

ALTER TABLE db_jianshu.comment
  ADD CONSTRAINT
  comment_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user(id);

ALTER TABLE db_jianshu.comment
  ADD CONSTRAINT
  comment_fk_noteId
FOREIGN KEY (noteId)
REFERENCES db_jianshu.user(id);

ALTER TABLE db_jianshu.comment
  ADD CONSTRAINT
comment_fk_commentId
FOREIGN KEY (commentId)
REFERENCES db_jianshu.comment(id);

INSERT INTO