USE empolyees;

SELECT * FROM departments;

/*
department 테이블에 값을 입력해주세요.
dept_no : d010
dept_name : 'business'
*/

INSERT INTO departments
(dept_no, dept_name)
VALUES
('d011', 'HoonJae');

DELETE from departments
WHERE dept_no = 'd011';


/* 
employees 테이블에 근로자 등록
emp_no : 500000
birth_date:1990-10-10
first_name:Gildong
last_name:Hong
gender:M
hire_date:2022-03-29
*/
INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES
(500000, '1990-10-10','Gildong','Hong','M','2022-03-29');

SELECT * FROM employees
WHERE emp_no = 500000;

delete FROM employees
WHERE emp_no = 500000;

/*
employees 테이블에서 여자면서 last_name 'ch'가
포함되어 있는 사람들 모두 select하시오.
*/

SELECT * FROM employees
WHERE gender = 'f' and
last_name like '%ch%';

/*
함수 사용 (left,right,mid)
*/

SELECT * FROM employees
where left(birth_date, 4) >= '1960';

SELECT * FROM employees
WHERE birth_date LIKE '1952%';

SELECT * FROM employees
WHERE birth_date LIKE '____-09-__';

SELECT birth_date, RIGHT(birth_date, 2), MID(birth_date, 6,2)
FROM employees;

/*
employees 테이블에서
emp_no : 500000 사원의 성별을 여성으로 바꾸고, hire_date 2021-03-29로 바꾸고,
first_name은 Jindong으로 변경
*/


UPDATE employees
SET gender = 'f',
hire_date = '2021-03-29',
first_name = 'Jindong'
WHERE emp_no = '500000';

SELECT * FROM employees
WHERE emp_no = '500000';

DELETE from employees
WHERE left(hire_date, 4) >= '2020';

SELECT * FROM employees
WHERE left(hire_date, 4) >= '2020';

-- dos로 mysql 사용할테 테이블 확인
DESC employees;

SELECT 1+1 as ddd;

-- 보여줄때만 이름 잠시 바꾸기
-- as 로 이름을 바꿀때 공백이 있으면 ''로 감싸줘야 한다.
SELECT emp_no AS 'my_no' FROM employees AS `a`
WHERE left(hire_date, 4) >= '2020';

/* emp_no = 499613와 생년월일이 같은 사람을 찾자 */

SELECT * FROM employees
WHERE birth_date = '1953-06-09';

SELECT birth_date FROM employees
WHERE emp_no = 499613;

-- subQuery 쿼리문 안에 쿼리문이 있다.
SELECT * FROM employees
WHERE birth_date = (SELECT birth_date FROM employees
WHERE emp_no = 499613);

/*
emp-no  = 499619
사람과 같은 성별을 갖고 있는 사람만 나타나도록 해주세요
*/

-- = 과 서브쿼리를 사용할 때는 값이 단 1개만(스칼라값) 와야한다.
SELECT * FROM employees
WHERE gender = (SELECT gender FROM employees
WHERE emp_no = 499619) AND emp_no != 499619;

-- some과 any는 동일하다. 최소조건
-- 786,848 결과물
SELECT * FROM salaries
WHERE salary = any(SELECT salary FROM salaries WHERE emp_no = 10010);

-- = any 와 같은 말이기 때문에 in 쓰면 된다.
SELECT * FROM salaries
WHERE salary in(SELECT salary FROM salaries WHERE emp_no = 10010);

-- all은 모든 조건 만족
-- 480,870 결과물
SELECT * FROM salaries
WHERE salary >= all(SELECT salary FROM salaries WHERE emp_no = 10010);

-- 오름차순 (위에서 아래로 값이 커진다.) ASC 기본값
-- 내림차순 (위에서 아래로 값디 작아진다.) DESC
SELECT * FROM salaries
WHERE emp_no IN (499988, 499987, 499986)
ORDER BY emp_no DESC, salary DESC;


SELECT * FROM employees
ORDER BY birth_date desc, gender desc;
