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

-- emp_no 10001의 모든 salary를 1,000 씩 올리고 싶다.
UPDATE salaries
SET salary = salary + 1000
WHERE emp_no = 10001;

SELECT * FROM salaries
WHERE emp_no = 10001;

-- insert ignore
SELECT * FROM t_hobbit_2;
INSERT ignore INTO t_hobbit_2 (hobbit_id, NAME) VALUES (7, '탁구');
INSERT ignore INTO t_hobbit_2 (hobbit_id, NAME) VALUES (8, '스키');

INSERT INTO t_hobbit_2 (hobbit_id, NAME) VALUES (7, '탁구')
ON DUPLICATE KEY UPDATE NAME = '수영';

DROP TABLE t_board;

CREATE table t_board (
	i_board INT UNSIGNED PRIMARY KEY,
	title VARCHAR(20) UNIQUE NOT NULL,
	hits INT UNSIGNED DEFAULT 0
);

SELECT * FROM t_board;

INSERT INTO t_board (i_board, title, hits) VALUES (2,'안녕', 0)
ON DUPLICATE KEY UPDATE hits = hits + 1;

WITH dept_emp_d001 (emp_no, from_date, to_date)
AS (
SELECT emp_no, from_date, to_date FROM dept_emp
WHERE dept_no = 'd001'
)SELECT * FROM dept_emp_d001;

SELECT A.* from (
SELECT emp_no, from_date, to_date FROM dept_emp
WHERE dept_no = 'd001'
) A;

/* 사람별 평균 급여에서의 평균값보다 큰 사람들만 나오게 해주세요*/

DROP TABLE t_order;
DROP TABLE t_customer;

CREATE TABLE t_order (
	o_no INT UNSIGNED PRIMARY KEY,
	cus_no INT UNSIGNED,
	o_date DATE DEFAULT NOW(),
	o_price INT DEFAULT 0,
	FOREIGN KEY (cus_no) REFERENCES t_customer(cus_no)
);
SELECT * FROM t_order;
SELECT * FROM t_customer;

CREATE TABLE t_customer (
	cus_no INT UNSIGNED PRIMARY KEY,
	nm VARCHAR(10) NOT null
);


INSERT INTO t_customer (cus_no, nm) 
VALUE (3, '홍길동'), (5, '이순신');

INSERT INTO t_order (o_no, cus_no, o_price) 
VALUE (1,3,55000), (2,5,70000), (3,3,60000); 

UPDATE t_customer
SET nm = '장보고'
WHERE cus_no = 5;

DELETE FROM t_order
WHERE o_no = 2;

SELECT * FROM t_customer;
SELECT * FROM t_order;

SELECT o_no, o_price FROM t_order
WHERE cus_no = 3;
