--mk_users 테이블(가입,로그인)
CREATE TABLE mk_users(
	id VARCHAR2(100) PRIMARY KEY, --아이디
	pwd VARCHAR2(100), --비밀번호
	email VARCHAR2(100), --이메일
	profile VARCHAR2(200), --프로필
	regdate DATE, --날짜
);

--mk_users 테이블 시퀀스
CREATE SEQUENCE mk_users_seq;

--mk_notice 테이블(공지사항)
CREATE TABLE mk_notice(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(30), --작성자
	title VARCHAR2(30), --제목
	content VARCHAR2(500), --내용
	viewcount NUMBER, --조회수
	regdate DATE --날짜
	
);
--mk_notice 테이블 시퀀스
CREATE SEQUENCE mk_notice_seq;

--mk_notice_comment 테이블(댓글)
CREATE TABLE mk_notice_comment(
	num NUMBER PRIMARY KEY, --댓글의 글번호
	writer VARCHAR2(30), --작성자
	content VARCHAR2(500), --내용
	target_id VARCHAR2(30), --댓글 대상자의 아이디
	ref_group NUMBER, --원글의 글번호
	comment_group NUMBER, --댓글의 그룹번호
	deleted CHAR(3) DEFAULT 'no', --삭제된 댓글인지 여부 'yes' or 'no'
	regdate DATE --댓글 작성일
);

--mk_notice_comment 테이블 시퀀스
CREATE SEQUENCE mk_notice_comment_seq;

--mk_comment 테이블(댓글)
CREATE TABLE mk_comment(
	num NUMBER PRIMARY KEY, --댓글의 글번호
	writer VARCHAR2(30), --작성자
	content VARCHAR2(500), --내용
	target_id VARCHAR2(30), --댓글 대상자의 아이디
	ref_group NUMBER, --원글의 글번호
	comment_group NUMBER, --댓글의 그룹번호
	deleted CHAR(3) DEFAULT 'no', --삭제된 댓글인지 여부 'yes' or 'no'
	regdate DATE --댓글 작성일
);

--mk_comment 테이블 시퀀스
CREATE SEQUENCE mk_comment_seq;

--mk_file 테이블(파일업로드,파일다운로드)
CREATE TABLE mk_file(
	num NUMBER PRIMARY KEY, --파일번호
	writer VARCHAR2(30), --작성자
	title VARCHAR2(30), --제목
	orgfilename VARCHAR2(100), --원본 파일이름
	savefilename VARCHAR2(100), --저장된 파일이름
	filesize NUMBER, --파일크기
	regdate DATE --날짜
);

--mk_file 테이블 시퀀스
CREATE SEQUENCE mk_file_seq;

--mk_gallery 테이블(이미지업로드)
CREATE TABLE mk_gallery(
	num NUMBER PRIMARY KEY, --이미지번호
	writer VARCHAR2(30), --작성자
	caption VARCHAR2(500), --설명
	content CLOB, -- 스마트에디터
	imagepath VARCHAR2(100), --이미지경로
	regdate DATE --날짜
);

--mk_gallery 테이블 시퀀스
CREATE SEQUENCE mk_gallery_seq;

--mk_board_cafe 테이블
CREATE TABLE mk_board_cafe(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(30), --작성자
	title VARCHAR2(30), --제목
	content CLOB, --내용
	viewcount NUMBER, --조회수
	regdate DATE --날짜
);

--mk_board_cafe 테이블 시퀀스
CREATE SEQUENCE mk_board_cafe_seq;

--mk_board_cafe_comment 테이블(댓글)
CREATE TABLE mk_board_cafe_comment(
	num NUMBER PRIMARY KEY, --댓글의 글번호
	writer VARCHAR2(30), --작성자
	content VARCHAR2(500), --내용
	target_id VARCHAR2(30), --댓글 대상자의 아이디
	ref_group NUMBER, --원글의 글번호
	comment_group NUMBER, --댓글의 그룹번호
	deleted CHAR(3) DEFAULT 'no', --삭제된 댓글인지 여부 'yes' or 'no'
	regdate DATE --댓글 작성일
);

--mk_board_cafe_comment 테이블 시퀀스
CREATE SEQUENCE mk_board_cafe_comment_seq;
