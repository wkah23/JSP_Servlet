-- 테이블 목록 조회
select * from tab;

drop table boardmember;
drop table memberboard;
drop SEQUENCE seq_board_num;
-- 회원 테이블 생성
CREATE TABLE member(
    id VARCHAR2(10) not null,
    pass VARCHAR2(10) not null,
    name VARCHAR2(30) not null,
    regidate date DEFAULT sysdate not null,
    PRIMARY key (id)
);
-- 모델1 방식의 게시판 테이블 생성
CREATE TABLE board (
    num number PRIMARY key,
    title VARCHAR2(200) not null,
    content VARCHAR2(2000) not null,
    id VARCHAR2(10) not null,
    postdate date DEFAULT sysdate not null,
    visitcount NUMBER(6)
);
-- 외래키 설정
alter TABLE board
    add CONSTRAINT board_mem_fk FOREIGN KEY (id)
    REFERENCES member (id);
    
-- 시퀀스 생성
CREATE SEQUENCE seq_board_num
    INCREMENT by 1  -- 1씩증가
    START WITH 1    -- 시작값 1 
    MINVALUE 1      -- 최솟값 1
    NOMAXVALUE      -- 최대값은 무한대
    NOCYCLE         -- 순환하지 않음
    NOCACHE;        -- 캐시 안함

-- 더미데이터 입력
INSERT INTO member (id, pass, name) VALUES ('musthave', '1234',
    '머스트해브');
INSERT INTO board (num, title, content, id, postdate, visitcount)
    VALUES (seq_board_num.nextval, '제목1입니다', '내용1입니다',
        'musthave', sysdate, 0);

select count(*) from board where title like '%1%';
select * from board where title like '%1%' order by num desc;

INSERT INTO board VALUES (seq_board_num.nextval, '지금은 봄입니다', '봄의왈츠', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 여름입니다', '여름향기', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 가을입니다', '가을동화', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 겨울입니다', '겨울연가', 'musthave', sysdate, 0);
commit;

desc member;
select * from member;

select id, pass, rownum from member;

select * from (
    select Tb.*, rownum rNum from (
        select * from board
        order by num desc)Tb) 
        where rNum BETWEEN 1 and 10;
        
drop table myfile;
create table myfile (
    idx number primary key,
    name VARCHAR2(50) not null,
    title VARCHAR2(200)  not null,
    cate VARCHAR2(100),
    ofile VARCHAR2(100) not null,
    sfile VARCHAR2(30) not null,
    postdate date default sysdate not null);

drop table mvcboard;
create table mvcboard (
    idx number primary key,
    name varchar2(50) not null,
    title VARCHAR2(200) not null,
    content VARCHAR2(2000) not null,
    postdate date default sysdate not null,
    ofile VARCHAR2(200),
    sfile VARCHAR2(30),
    downcount number(5) default 0 not null,
    pass VARCHAR2(50) not null,
    visitcount number default 0 not null);

insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '김유신','자료실 제목1 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '장보고','자료실 제목2 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '이순신','자료실 제목3 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '강감찬','자료실 제목4 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '대조영','자료실 제목5 입니다.','내용','1234');

commit;


--테이블 생성 (Member.sql 회원관리)
CREATE TABLE boardMember(
    Member_id VARCHAR2(15) PRIMARY KEY NOT NULL,
    Member_pw VARCHAR2(15),
    Member_name VARCHAR2(15),
    Member_age NUMBER,
    Member_gender VARCHAR2(5),
    Member_email VARCHAR2(30)
);

--테이블 조회
SELECT * FROM boardMember;


--테이블 생성 (Board.sql 게시판)
CREATE TABLE memberBoard(
    Board_num NUMBER PRIMARY KEY NOT NULL,
    Board_id VARCHAR2(15),
    Board_subject VARCHAR2(50),
    Board_content VARCHAR2(2000),
    Board_file VARCHAR2(20),
    Board_re_ref NUMBER,
    Board_re_lev NUMBER,
    Board_re_seq NUMBER,
    Board_readcount NUMBER,
    Board_date DATE
);
desc memberBoard;
--제약조건 추가
ALTER TABLE memberBoard
ADD CONSTRAINT pk_board_id FOREIGN KEY(Board_id)
REFERENCES boardMember(Member_id);

--테이블 조회
SELECT * FROM memberBoard;
-- 1.
SELECT * FROM memberBoard ORDER BY board_num DESC, board_re_seq ASC;
-- 2.
SELECT ROWNUM rnum, board_num, board_id, board_subject, 
board_content, board_file, board_re_ref, board_re_lev, board_re_seq, board_readcount, board_date
    FROM (
         SELECT * FROM memberBoard ORDER BY board_num DESC, board_re_seq ASC
    );
-- 3.
SELECT * 
FROM (
    SELECT ROWNUM rnum, board_num, board_id, board_subject, board_content, board_file, board_re_ref, board_re_lev, board_re_seq, board_readcount, board_date
    FROM (
         SELECT * FROM memberBoard ORDER BY board_num DESC, board_re_seq ASC
    )
) WHERE rnum >= 1 and rnum <= 5;

