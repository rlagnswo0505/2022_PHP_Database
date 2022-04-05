/*
숫자데이터
주로 int를 많이 쓴다 약 -21억 ~ 21억
크기가 클 때는 BIGINT 를 쓴다

문자 데이터
CHAR 고정길이 문자형 1 ~ 255 BYTE
VARCHAR 가변길이 문자형 1 ~ 65535 BYTE

날짜와 시간 데이터
DATETIME 날짜와 시간을 같이 저장
DATE 날짜만 저장
*/

-- 데이터 형변환 CONVERT
SELECT '10';
SELECT CONVERT('10', INT) + CONVERT('10', INT);

-- DB는 자동형변환이 숫자 우선 프로그래밍 언어는 + 일 때 문자우선
SELECT '10' + '10';

SELECT CONVERT('10.1', FLOAT);

SELECT 10;
SELECT CONVERT(10, CHAR);

-- 데이터 형변화 CAST
SELECT CAST('10' AS INT);

-- TRUE는 1 FALSE는 0
SELECT 1 > '2MAGA';

-- 문자열 합치기 CONCAT
SELECT 'A1' + 'B2';
SELECT CONCAT('A1', '2B2', '가나다');

-- IF TRUE 면 앞에것 FALSE 면 뒤에것
SELECT if(100>200, '100은 200보다 크다', '100은 200보다 작다');

-- employees 테이블을 조회하는데 gender 값이 'm'이면 '남자', f = '여자'가 되도록 해주세요
SELECT gender,if(gender = 'm', '남자', '여자') FROM employees

-- 응용
SELECT 'm','f','a';
SELECT if('f' = 'm', '남자', if('f' = 'f','여자', '외계인'));

-- 응용2 (농구, 배구, 축구)
-- 농구 > basketball
-- 배구 > valleyball
-- 축구 > football

SELECT nm, if(nm = '농구', 'basketball', if(nm = '배구', 'valleyball','football')) AS 'eng'
FROM t_hobbit;

SELECT 
if(nm = '농구', 
	CONCAT(nm, ' basketball'), 
	if(nm = '배구', 
		CONCAT(nm, ' valleyball'),
		CONCAT(nm, ' football')
	)
) AS 'eng'
FROM t_hobbit;

SELECT CONCAT(nm, 
			if(nm = '농구', 'basketball', if(nm = '배구', 'valleyball','football'))
			) AS 'eng'
	FROM t_hobbit;
	
-- ifnull 수식1이 null이 아니면 수식1, null이면 수식2 (오라클 : nvl, sql-server : isnull)
SELECT *, IFNULL(memberaddress, '주소없음')
FROM membertbl;

-- nullif 수식1과 수식2가 같은면 null, 다르면 수식1
SELECT NULLIF('안녕', '안녕');
SELECT NULLIF('안녕1', '안녕2');

-- case 겂 when 비교값 then ...
SELECT
	nm,
	CASE nm 
		when '농구' then 'basketball'
		when '배구' then 'valleyball'
		when '축구' then 'football'
		ELSE '없음'
	END AS 'eng'
FROM t_hobbit;

-- case when 조건식 than...
SELECT
	nm,
	CASE 
		when nm = '농구' then 'basketball'
		when nm = '배구' then 'valleyball'
		when nm = '축구' then 'football'
		ELSE '없음'
	END AS 'eng'
FROM t_hobbit;

-- 아스키코드
SELECT ASCII('A'), CHAR(65);

-- 문자열 합치기 CONCAT, CONCAT_WS
SELECT CONCAT('A', '_', 'B', '_', 'C');
SELECT CONCAT_WS(', ', 'A', 'B', 'C');

-- 천단위에 (,)표시, 뒤에는 소수점 자리 
SELECT FORMAT(111122233.5234, 2);
SELECT FORMAT(floor(111122233.5234), 2);

-- FLOOR 무조건 내림, CEIL 무조건 올림,  반올림
SELECT FLOOR(11.5), CEIL(11.5), ROUND(11.5);
SELECT FLOOR(11.5), CEIL(11.5), ROUND(11.5);

-- INSERT 시작값 위치, 지우는 값
SELECT 
	INSERT('ABCDEFGHT', 3, 0, '@@@@'),
	INSERT('ABCDEFGHT', 3, 4, '@@@@');
	
-- LEFT, RIGHT
SELECT LEFT('ABCDEFG', 3), RIGHT('ABCDEFG', 3);

-- UPPER, LOWER DB는 자동형변화로 인해 비교가 안됨
SELECT 'aBc', 'Abc','aBc' = 'AbC',
 UPPER('aBc'), UPPER('Abc'),UPPER('aBc') = UPPER('AbC');
 
-- LTRIM, RTRIM 공백제거
SELECT '   A BC     ',LTRIM('   A BC     '), RTRIM('   A BC     ');
SELECT TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ');

-- date format
SELECT *, DATE_FORMAT(create_at, '%Y/%m/%d %p %h:%i')FROM t_hobbit_2;
