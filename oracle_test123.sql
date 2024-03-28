-- 테이블 생성
create table member(no int not null, id varchar(20) primary key, pw varchar(300), name varchar(100), birth timestamp, email varchar(300));
-- 시퀀스 생성
create sequence c##test123.mem_seq increment by 1 start with 1 minvalue 1 maxvalue 9999 nocycle; 
-- 데이터 추가
insert into member values (mem_seq.nextval, 'cho', '1234', '조우진', '1996-12-12', 'jwj4546@naver.com'); 
insert into member values (mem_seq.nextval, 'park', '1004', '박동수', '1998-03-25', 'park@naver.com'); 
insert into member values (mem_seq.nextval, 'kim', '9876', '김응원', '1988-01-21', 'kim@naver.com');
insert into member values (mem_seq.nextval, 'jung', '1287', '정도준', '1998-02-13', 'jung@naver.com'); 
insert into member values (mem_seq.nextval, 'han', '0313', '한태역', '1998-03-13', 'han@naver.com');
insert into member values (mem_seq.nextval, 'bae', '0909', '배곤희', '1999-03-26', 'bae@gmail.com');
select * from member;