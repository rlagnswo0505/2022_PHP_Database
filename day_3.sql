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


