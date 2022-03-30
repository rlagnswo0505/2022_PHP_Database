-- dept_emp 테이블에서 dept_no 종류가 몇개가 있는지?
-- distinct 중복된 것은 하나만 보여주기
SELECT DISTINCT dept_no FROM dept_emp;

-- 사원의 직무가 무엇이 있는지 select 해주시오.

SELECT DISTINCT title 
FROM titles 
ORDER BY title;

-- Limit ? ////////////// Limit ?, ?
-- 값을 한개 적었을때는 처음부터 개수
SELECT * FROM employees
LIMIT 30;

-- 값을 2개 적었을때는 첫번째 값 부터 두번째 값 개수
SELECT * FROM employees
LIMIT 0, 10;

/* 가장 많은 연봉을 반은 금액 3개만 나오도록 해주세요 */
SELECT * FROM salaries
ORDER BY salary DESC
LIMIT 3;

/* 연봉 5~10위만 나오도록 */
SELECT * FROM salaries
ORDER BY salary DESC
LIMIT 4, 6;

-- 테이블 컬럼, 데이터타입, 레코드 복사
CREATE TABLE departments_temp2 AS
SELECT * FROM departments;

-- 테이블 스키마 복사 (레코드 X)
CREATE TABLE departments_temp3
LIKE departments;

-- 데이터를 넣어줌
INSERT INTO departments_temp3
SELECT * FROM departments;

-- 그룹 함수 min, max, sum, avg, count

-- group by 를 사용 안 했을 때는 전체에서 값을 가져온다.
SELECT MIN(salary),MAX(salary), SUM(salary), AVG(salary), COUNT(emp_no) FROM salaries;


SELECT emp_no, MIN(salary),MAX(salary), SUM(salary), AVG(salary),COUNT(*)
FROM salaries
GROUP BY emp_no;

/* 부서별 사원 수*/
SELECT dept_no, COUNT(*)
FROM dept_emp
GROUP BY dept_no;

-- GROUP BY 다음에 HAVING 절을 사용하면 GROUP BY에 조건문을 쓰는것
/* 부서별 사원 수, 부서별 사원수가 20,000명 이상인 부서만 나오도록 한다.*/
SELECT dept_no, COUNT(*)
FROM dept_emp
GROUP BY dept_no
HAVING COUNT(*) >= 20000
ORDER BY COUNT(*) DESC;

/* 가장 적은 salary를 받은 사람의 이름이 나오도록 해주세요*/
SELECT * FROM employees
WHERE emp_no =
(
SELECT emp_no FROM salaries
WHERE salary = (SELECT MIN(salary) FROM salaries)
);

SELECT emp_no FROM salaries
ORDER BY salary LIMIT 1;

-- auto_increment
USE `test`;

CREATE TABLE t_hobbit(
i_hobbit INT UNSIGNED AUTO_INCREMENT,
nm VARCHAR(10) UNIQUE NOT NULL,
PRIMARY KEY (i_hobbit)
);

INSERT INTO t_hobbit (nm)
VALUES ('농구');

INSERT INTO t_hobbit (nm)
VALUES ('축구');

INSERT INTO t_hobbit (nm)
VALUES ('배구');

SELECT * FROM t_hobbit;

CREATE TABLE t_hobbit_2 (
hobbit_id INT UNSIGNED PRIMARY KEY,
NAME VARCHAR(20) NOT NULL,
create_at DATETIME DEFAULT NOW()
);

INSERT INTO t_hobbit_2 
(hobbit_id, NAME)
VALUES
(1, '핸드볼');

INSERT INTO t_hobbit_2 
(hobbit_id, NAME, create_at)
VALUES
(2, '핸드볼', '2022-02-10');

UPDATE t_hobbit_2
set NAME = '등산'
WHERE hobbit_id = 2;


INSERT INTO t_hobbit_2 
(hobbit_id, NAME, create_at)
VALUES
(3, '독서', '2022-02-10 12:12:13');

SELECT * FROM t_hobbit;
SELECT * FROM t_hobbit_2;

INSERT INTO t_hobbit_2
(hobbit_id, NAME)
SELECT i_hobbit + 3, nm FROM t_hobbit;
