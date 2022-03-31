CREATE TABLE t_memeber_hobbit  (
	memberid CHAR(8) NOT NULL,
	i_hobbit INT(10) UNSIGNED NOT NULL,
	PRIMARY KEY(memberid,i_hobbit),
	FOREIGN KEY memberID REFERENCES membertbl(memberid),
	FOREIGN KEY i_hobbit REFERENCES t_hobbit(i_hobbit)
);

INSERT INTO membertbl 
(memberid, membername)
VALUES
(5, '신사임당'),
(6, '유관순'),
(7, '나이팅게일');

INSERT INTO membertbl 
(memberid, membername)
VALUES(3, '홍길동');

SELECT * FROM t_member_hobbit;

