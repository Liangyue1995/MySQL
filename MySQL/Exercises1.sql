# 1. 返回拥有员工的部门名、部门号
SELECT
  d.DNAME,
  d.DEPTNO
FROM scott.emp e INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;
# 2. 工资多于 scott 的员工信息
SELECT e1.*
FROM scott.emp e1 INNER JOIN scott.emp e2
    ON e1.sal + ifnull(e1.COMM, 0) > e2.sal + ifnull(e2.COMM, 0)
WHERE e2.ENAME = 'scott';
# 3. 返回员工和所属经理的姓名
SELECT
  el.ENAME manager,
  e2.ENAME employee
FROM scott.emp el INNER JOIN scott.emp e2
    ON el.MGR = e2.EMPNO;
# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名
# 5. 返回员工姓名及其所在的部门名称
SELECT
  e.ENAME,
  d.DEPTNO
FROM scott.emp e INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;
# 6. 返回从事 clerk 工作的员工姓名和所在部门名称
/*SELECT
e.ENAME,
d.DEPTNO
FROM scott.emp e INNER JOIN scott.dept d
ON e.ENAME=d.DEPTNO
WHERE e.JOB = 'clerk';
*/
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO
WHERE e.JOB = 'clerk';
# 7. 返回部门号及其本部门的最低工资
# 8. 返回销售部 sales 所有员工的姓名
SELECT e.ENAME
FROM scott.emp e INNER
  JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO
WHERE d.DNAME = 'sales';
# 9. 返回工资多于平均工资的员工
SELECT
  SAL,
  ENAME
FROM scott.emp
WHERE SAL + ifnull(COMM, 0) > (SELECT avg(SAL + ifnull(COMM, 0))
                               FROM scott.emp);
# 10. 返回与 scott 从事相同工作的员工
SELECT
  e1.*
FROM
  scott.emp e1 INNER JOIN scott.emp e2
    ON e1.JOB = e2.JOB
WHERE e2.ENAME = 'scott';
# 11. 返回比 30 部门员工平均工资高的员工姓名与工资
SELECT ENAME,SAL
FROM scott.emp
WHERE SAL > (SELECT avg(SAL)
             FROM scott.emp
             WHERE SAL = 30);
# 12. 返回工资高于30部门所有员工工资水平的员工信息

# 13. 返回部门号、部门名、部门所在位置及其每个部门的员工总数
# 14. 返回员工的姓名、所在部门名及其工资
SELECT *

# 15. 返回雇员表中不在同一部门但是从事相同工作的员工信息
# 16. 返回员工的详细信息，包括部门名
# 17. 返回员工工作及其从事此工作的最低工资
# 18. 返回不同部门经理的最低工资
# 19. 计算出员工的年薪，并且以年薪排序
# 20. 返回工资处于第 4 级别的员工的姓名
;
START TRANSACTION ; -- 创建一次事务
DELETE FROM scott.emp;
SELECT * FROM scott.emp;
ROLLBACK ;-- 回滚
UPDATE scott.emp
    SET  SAL=SAL-1000
WHERE ENAME='allen';
SAVEPOINT a;
UPDATE scott.emp
    SET  SAL=SAL+1000
WHERE ENAME='ward';
SAVEPOINT b;
  UPDATE scott.emp
    SET  ENAME='allen new'
  WHERE EMPNO=7499;
ROLLBACK TO a;
ROLLBACK TO b;
COMMIT -- 提交