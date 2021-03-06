-- DCL (데이터 제어어) (유저 만들고, 유저 권한 주고)
-- 아직 안 배울꺼임!

-- DDL (데이터 정의어)
CREATE DATABASE test;
DROP DATABASE test;

CREATE TABLE membertbl (
	memberID char(8) NOT NULL PRIMARY KEY,
	memberName CHAR(5) NOT NULL,
	memberAddress CHAR(20) NULL
);
/*
 unique, not null, index
*/
-- sdfsdlkfjslkdfjlskjfdklsjfklasjklfjlka

DROP TABLE membertbl;
DROP TABLE membert_bl;

DROP TABLE productTBL;
CREATE TABLE productTBL(
	productName CHAR(4) PRIMARY KEY,
	cost INT NOT NULL,
	MAKEDATE DATE,
	company CHAR(5),
	amount INT NOT null
);

-- CRUD, DML(데이터 조작어) (insert, select, update, delete)
-- Create (insert문)
/*
INSERT INTO 테이블명
(값을 넣고 싶은 컬럼명들)
VALUES
(값들)
*/
INSERT INTO membertbl 
(memberid,membername, memberaddress)
VALUES(1, '홍길동','서울시');

INSERT INTO membertbl 
(memberid,membername, memberaddress)
VALUES(2, '홍길동','서울시');

INSERT INTO membertbl 
(memberid, membername)
VALUES(3, '홍길동');

-- membername은 not null 이기 때문에 에러가 발생
INSERT INTO membertbl 
(memberid)
VALUES(4);

INSERT INTO membertbl 
(memberid, membername)
VALUES
(5, '신사임당'),
(6, '유관순'),
(7, '나이팅게일');

INSERT INTO membertbl 
(membername, memberid)
VALUES('구구단', 9);

-- 컬럼명 생략하는 방법은 안 쓰는게 좋다.
INSERT INTO membertbl 
VALUES
(1, '사나이', '부산시');

-- Read (select문)
/* (문법)
SELECT 보고싶은 컬러명들 FROM 테이블명
[ JOIN 테이블 연결 ]
[ WHERE 보고싶은 조건 ]
[ GROUP BY 그룹으로 묶는 조건]
[ HAVING 그룹으로 묶는 조건에서의 조건 ]
[ ORDER BY 레코드 순서 지정 ] 
[ LIMIT 보고싶은 레코드 수 ]
*/
SELECT memberID, membername, memberaddress FROM membertbl;
SELECT * FROM membertbl;
SELECT memberID, membername FROM membertbl;
SELECT membername FROM membertbl;

SELECT * FROM membertbl
WHERE memberid = '1';

SELECT * FROM membertbl
WHERE membername = '홍길동';

SELECT * FROM membertbl
WHERE memberaddress = '서울시';


SELECT * FROM membertbl
WHERE memberaddress != '서울시'
OR memberaddress is NULL;
;

SELECT * FROM membertbl
WHERE memberaddress is NULL;

-- 주소가 '부산시'이면서 이름이 '사나이'인 레코드를 나타나게 하시오.
SELECT * 
  FROM membertbl
 WHERE memberaddress = '부산시' 
   AND membername = '사나이';
   
-- LIKE문은 문자열 포함된 레코드를 찾을 때.

-- 팅이 들어가면 찾는다
SELECT * FROM membertbl
WHERE membername LIKE '%팅%';

-- 사로 시작하면 찾는다
SELECT * FROM membertbl
WHERE membername LIKE '사%';

SELECT * FROM membertbl
WHERE membername LIKE '나%';

-- 다로 끝나면 찾는다.
SELECT * FROM membertbl
WHERE membername LIKE '%다';

-- Update (update문)
/*
	UPDATE 테이블명
	SET 수정하고 싶은 컬럼명 = 변경하고 싶은 값
	WHERE 레코드 선택
*/

-- 보통 where절에 PK가 들어간다
UPDATE membertbl
SET membername = '게일'
WHERE memberid = '7';

UPDATE membertbl
SET membername = 'gugu'
, memberaddress = '강원도'
WHERE memberid = '9';


UPDATE membertbl
SET memberName = '111'
, memberAddress = '222'
WHERE memberId = 'a';



/*
	my name is hong

 camel case 			: myNameIsHong
 pascal case 			: MyNameIsHong
 snake case 			: my_name_is_hong
 cabob case (케밥)   : my-name-is-hong
*/

-- Delete (delete문)
/*  DELETE FROM 테이블명 WHERE 절 */
-- 주소가 null 레코드 전부 삭제
DELETE FROM membertbl 
WHERE memberAddress IS NULL;

DELETE FROM membertbl
WHERE memberId = '12';

DELETE FROM membertbl
WHERE memberId = '0';


