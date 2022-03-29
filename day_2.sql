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
('500000', '1990-10-10','Gildong','Hong','M','2022-03-29');
