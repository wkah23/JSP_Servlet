-- ���̺� ��� ��ȸ
select * from tab;

drop table boardmember;
drop table memberboard;
drop SEQUENCE seq_board_num;
-- ȸ�� ���̺� ����
CREATE TABLE member(
    id VARCHAR2(10) not null,
    pass VARCHAR2(10) not null,
    name VARCHAR2(30) not null,
    regidate date DEFAULT sysdate not null,
    PRIMARY key (id)
);
-- ��1 ����� �Խ��� ���̺� ����
CREATE TABLE board (
    num number PRIMARY key,
    title VARCHAR2(200) not null,
    content VARCHAR2(2000) not null,
    id VARCHAR2(10) not null,
    postdate date DEFAULT sysdate not null,
    visitcount NUMBER(6)
);
-- �ܷ�Ű ����
alter TABLE board
    add CONSTRAINT board_mem_fk FOREIGN KEY (id)
    REFERENCES member (id);
    
-- ������ ����
CREATE SEQUENCE seq_board_num
    INCREMENT by 1  -- 1������
    START WITH 1    -- ���۰� 1 
    MINVALUE 1      -- �ּڰ� 1
    NOMAXVALUE      -- �ִ밪�� ���Ѵ�
    NOCYCLE         -- ��ȯ���� ����
    NOCACHE;        -- ĳ�� ����

-- ���̵����� �Է�
INSERT INTO member (id, pass, name) VALUES ('musthave', '1234',
    '�ӽ�Ʈ�غ�');
INSERT INTO board (num, title, content, id, postdate, visitcount)
    VALUES (seq_board_num.nextval, '����1�Դϴ�', '����1�Դϴ�',
        'musthave', sysdate, 0);

select count(*) from board where title like '%1%';
select * from board where title like '%1%' order by num desc;

INSERT INTO board VALUES (seq_board_num.nextval, '������ ���Դϴ�', '���ǿ���', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '������ �����Դϴ�', '�������', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '������ �����Դϴ�', '������ȭ', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '������ �ܿ��Դϴ�', '�ܿ￬��', 'musthave', sysdate, 0);
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
    values (seq_board_num.nextval, '������','�ڷ�� ����1 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '�庸��','�ڷ�� ����2 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '�̼���','�ڷ�� ����3 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '������','�ڷ�� ����4 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '������','�ڷ�� ����5 �Դϴ�.','����','1234');

commit;


--���̺� ���� (Member.sql ȸ������)
CREATE TABLE boardMember(
    Member_id VARCHAR2(15) PRIMARY KEY NOT NULL,
    Member_pw VARCHAR2(15),
    Member_name VARCHAR2(15),
    Member_age NUMBER,
    Member_gender VARCHAR2(5),
    Member_email VARCHAR2(30)
);

--���̺� ��ȸ
SELECT * FROM boardMember;


--���̺� ���� (Board.sql �Խ���)
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
--�������� �߰�
ALTER TABLE memberBoard
ADD CONSTRAINT pk_board_id FOREIGN KEY(Board_id)
REFERENCES boardMember(Member_id);

--���̺� ��ȸ
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

