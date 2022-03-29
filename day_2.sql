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
WHERE emp_no - 500000;

SELECT * FROM employees
WHERE emp_no = '500000';

DELETE from employees
WHERE left(hire_date, 4) >= '2020';
