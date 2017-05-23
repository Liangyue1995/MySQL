DROP DATABASE IF EXISTS db_university; -- 如果存在数据库先删除
CREATE DATABASE db_university; -- 创建一个数据库
-- --------学生表----------
DROP TABLE IF EXISTS db_university.student; -- 如果存在的表先删除
CREATE TABLE db_university.student (-- 创建一个表
  ID     INT AUTO_INCREMENT PRIMARY KEY -- ID设置为自动增长，并主键约束
  COMMENT 'ID PK',
  sno    VARCHAR(10) COMMENT '学号',
  name   VARCHAR(225) NOT NULL
  COMMENT '姓名', -- NOT NULL 姓名值不能为空
  intro  TEXT COMMENT '简介',
  gender VARCHAR(255) COMMENT '性别',
  age    INT UNSIGNED COMMENT '年龄', -- unsigned 无符号的整数
  height DOUBLE(4, 1) COMMENT '身高', -- 4位数，包含小数点后一位
  price  DECIMAL(10, 3) COMMENT '价格',
  dob    DATE COMMENT '出生日期',
  tiom   DATETIME COMMENT '时间'-- time of enrollment 入学时间
);

SHOW DATABASES; -- 显示所有数据库
SHOW TABLE STATUS FROM db_university; -- 显示这个数据库所有信息
SHOW FULL COLUMNS FROM db_university.student; -- 显示当前表格所有列的所有详细信息
INSERT INTO db_university.student VALUES (NULL, '2017001', 'rous', '本科', 'man', 18, 175.6,
                                          6000.80, '1993-10-3', '2015-08-20 10:30:00');
INSERT INTO db_university.student VALUES (NULL, '2017002', 'tom', '硕士', 'woman', 24, 155.6,
                                          8000.66, '1996-10-17', '2015-10-10 9:40:12');
INSERT INTO db_university.student VALUES (NULL, '2017003', 'ada', '硕士', 'man', 28, 175.6,
                                          8000.66, '1993-10-17', '2015-1-10 9:40:12');
SELECT *
FROM db_university.student;
-- -------课程表-------
DROP TABLE IF EXISTS db_university.course;
CREATE TABLE db_university.course (
  ID     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title  VARCHAR(225) UNICODE COMMENT '课程名',
  credit INT COMMENT '学分'
);
SELECT *
FROM db_university.course;
-- DELETE FROM db_university.student WHERE ID=2;
-- ----------选课表-----课程---
DROP TABLE IF EXISTS db_university.student_course;
CREATE TABLE db_university.student_course (
  ID        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  studentID INT COMMENT '学生',
  courseID  INT COMMENT '课程',
  score     INT COMMENT '考试成绩'
);
TRUNCATE TABLE db_university.student_course;
SELECT *
FROM db_university.student_course;
SELECT *
FROM db_university.course;

INSERT INTO db_university.course VALUES (NULL, 'java SE', 80);
INSERT INTO db_university.course VALUES (NULL, 'java EE', 70);
INSERT INTO db_university.course VALUES (NULL, 'MySql', 50);

INSERT INTO db_university.student_course VALUES (NULL, 1, 1, NULL);
INSERT INTO db_university.student_course VALUES (NULL, 1, 2, NULL);
INSERT INTO db_university.student_course VALUES (NULL, 2, 1, NULL);
INSERT INTO db_university.student_course VALUES (NULL, 2, 3, NULL);

INSERT INTO db_university.student_course (score) VALUE (100);
-- 在选课表内插入新列值
-- ------------------- FOREIGN KEY  外键 -----------------------------------------

--  注意： 外键状态覆盖！！！！！！！
-- 外键状态下，带 ON 状态的，可以覆盖不带状态的，但是无状态的不能覆盖 ON 状态的
-- 这种情况下，用 DROP 语句先删除外键，然后用 ON DELETE RESTRICT； 可以重新添加外键
-- 添加外键时，不显式声明外键别名， InnoDB 引擎会自动加上。
-- 主键、外键 数据类型必须一致 ！
SHOW CREATE TABLE db_university.student_course; -- 可以查看表中的详细定义，可以查看系统默认的外键别名
ALTER TABLE db_university.student_course
  ADD CONSTRAINT
FOREIGN KEY (studentID)
REFERENCES db_university.student (ID);

ALTER TABLE db_university.student_course
  ADD CONSTRAINT
FOREIGN KEY (courseID)
REFERENCES db_university.course (ID);
-- 追加外键，只是影响到 删除表格时的操作。删除主表时，会提示有外键关联，所以要删除主表，必须先删除从表。
-- 但是主表删除数据，不会提示错误，不过从表的关联数据不会消失，依然存在。从表关联的数据属于 错误数据。
ALTER TABLE db_university.student_course
  ADD CONSTRAINT
  fk_student_course_studentID
FOREIGN KEY (studentID)
REFERENCES db_university.student (ID);

ALTER TABLE db_university.student_course
  ADD CONSTRAINT
  fk_student_course_courseID
FOREIGN KEY (courseID)
REFERENCES db_university.course (ID);

SELECT *
FROM db_university.student;

CREATE VIEW db_university.student_view AS
  SELECT
    ID,
    name,
    dob,
    age
  FROM db_university.student;

SELECT *
FROM db_university.student_view;

DROP VIEW db_university.student_view;
UPDATE db_university.student_view
SET age = 23
WHERE name='tom';