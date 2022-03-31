DROP TABLE t_member_hobbit;

CREATE TABLE t_member_hobbit (
	memberID CHAR(8) NOT NULL,
	hobbit_id INT(10) UNSIGNED NOT NULL,
	PRIMARY KEY (memberID, hobbit_id),
	FOREIGN KEY (memberID) REFERENCES membertbl(memberID),
	FOREIGN KEY (hobbit_id) REFERENCES t_hobbit_2(hobbit_id)
);

SELECT * FROM t_member_hobbit;

INSERT INTO  t_member_hobbit (memberid, hobbit_id) VALUES ('1', 1);
INSERT INTO  t_member_hobbit (memberid, hobbit_id) VALUES ('1', 2);
INSERT INTO  t_member_hobbit (memberid, hobbit_id) VALUES ('5', 3), ('5', 7), ('5', 8);
INSERT INTO  t_member_hobbit (memberid, hobbit_id) VALUES ('7', 6);

SELECT B.*, A.*, C.*
  FROM t_member_hobbit A
 INNER JOIN membertbl B
	 ON A.memberID = B.memberID
 INNER JOIN t_hobbit_2 C
	 ON A.hobbit_id = C.hobbit_id;
	 
USE `employees`;

-- 사원번호, 사원명, 부서이름, 직책

SELECT A.emp_no, A.first_name, A.last_name, B.title, D.dept_name
FROM employees A
INNER JOIN titles B
ON A.emp_no = B.emp_no
INNER JOIN dept_manager C
ON A.emp_no = C.emp_no
INNER JOIN departments_temp D
ON C.dept_no = D.dept_no;

-- 남녀 사원들의 평균 연봉
SELECT B.gender, AVG(A.salary)
FROM salaries A
INNER JOIN employees B
ON A.emp_no = B.emp_no
GROUP BY B.gender;

 -- 부서별 평균 연봉 높은 값
 SELECT avg(A.salary), B.dept_no
 FROM salaries A
 INNER JOIN dept_emp B
 ON A.emp_no = B.emp_no
 GROUP BY B.dept_no
 ORDER BY avg(A.salary);

-- 부서별 부서이름, 연봉 평균값, max값, min값 나오게 해주세요
 SELECT C.dept_name, avg(A.salary),max(A.salary),min(A.salary)
 FROM salaries A
 INNER JOIN dept_emp B
 ON A.emp_no = B.emp_no
 INNER JOIN departments C
 ON B.dept_no = C.dept_no
 GROUP BY B.dept_no, C.dept_name; -- mysql은 C.dept_name 생략가능 but 오라클은 불가능;
 
 -- 직무별 연봉 평균값
SELECT avg(A.salary), B.title
 FROM salaries A
 INNER JOIN titles B
 ON A.emp_no = B.emp_no
 GROUP BY B.title;

-- 개인마다 평균 연봉 구함 >  개인을 부서로 조인 >
-- 부서별로 그룹 묵음 > 가장 높은 평균연봉 값
SELECT Z.dept_no, MAX(avg_salary) AS max_salary, X.dept_name
FROM (
SELECT AVG(A.salary) AS avg_salary, dept_no
FROM salaries A
INNER JOIN dept_emp B
ON A.emp_no = B.emp_no
GROUP BY A.emp_no
) Z
INNER JOIN departments X
ON Z.dept_no = X.dept_no
GROUP BY Z.dept_no
ORDER BY max_salary DESC;
