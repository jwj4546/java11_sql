use kh;

-- TB_MEMBER table 생성
create table TB_MEMBER (MEMBER_ID varchar(10), MEMBER_PWD varchar(10), MEMBER_NAME varchar(10), GRADE int, AREA_CODE varchar(3));
desc TB_MEMBER;

-- TB_MEMBER data 추가
insert into TB_MEMBER values('hong01', 'pass01', '홍길동', 10, '02');
insert into TB_MEMBER values('leess99', 'pass02', '이순신', 10, '032');
insert into TB_MEMBER values('ss50000', 'pass03', '신사임당', 30, '031');
insert into TB_MEMBER values('iu93', 'pass04', '아이유', 30, '02');
insert into TB_MEMBER values('pcs1234', 'pass05', '박철수', 20, '031');
insert into TB_MEMBER values('you_js', 'pass06', '유재석', 10, '02');
insert into TB_MEMBER values('kyh9876', 'pass07', '김영희', 20, '031');

select * from TB_MEMBER;

-- TB_GRADE table 생성
create table TB_GRADE (GRADE_CODE int, GRADE_NAME varchar(8));
desc TB_GRADE;

-- TB_GRADE data 추가
insert into TB_GRADE values (10, '일반회원');
insert into TB_GRADE values (20, '우수회원');
insert into TB_GRADE values (30, '특별회원');

select * from TB_GRADE;

-- TB_AREA table 생성
create table TB_AREA (AREA_CODE varchar(3), AREA_NAME varchar(5));
desc TB_AREA;

-- TB_AREA data 추가
insert into TB_AREA values('02', '서울');
insert into TB_AREA values('031', '경기');
insert into TB_AREA values('032', '인천');

select * from TB_AREA;

-- 1-1 김영희 회원과 같은 지역에 사는 회원들의 지역명, 아이디, 이름, 등급명을 이름 오름차순으로 조회
select area_name 지역명, member_id 아이디, member_name 이름, grade_name 등급명 from tb_member
join tb_grade on (tb_member.grade=tb_grade.grade_code)					-- 앞에 table name 추가
join tb_area using (area_code) 														-- using으로 변경
where area_code = (select area_code from tb_member where member_name='김영희') order by member_name asc;
-- ()안에는 이름이라는 alias가 없기 때문에 인식이 불가능
-- asc

-- 1-2 아이디에 1234가 포함되는 회원과 같은 등급, 같은지역인 회원들의 아이디, 비밀번호, 이름, 등급명, 지역명을 아이디 내림차순으로 조회
SELECT MEMBER_ID 아이디, MEMBER_PWD 비밀번호, MEMBER_NAME 이름, GRADE_NAME 등급명
FROM TB_MEMBER
JOIN TB_GRADE USING(GRADE_CODE)
JOIN TB_AREA USING(AREA_CODE)
WHERE (GRADE, AREA_CODE) =
(SELECT GRADE, AREA_CODE FROM TB_MEMBER
WHERE MEMBER_ID = '1234')
ORDER BY MEMBER_ID DESC;
