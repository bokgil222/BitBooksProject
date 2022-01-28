create table code_class(
	class_code char(3) NOT NULL PRIMARY KEY,
	class_name varchar(30)NOT NULL,
	use_yn char(1)NOT NULL DEFAULT 'Y',
	reg_date TIMESTAMP NOT NULL DEFAULT now(),
	upd_date TIMESTAMP DEFAULT now()
);
create table code_detail(
	code_value varchar(3) PRIMARY KEY,
    class_code char(3)NOT NULL,
    class_name varchar(30)NOT NULL,
    sort_seq int NOT NULL,
    use_yn char(1) NOT NULL DEFAULT 'Y',
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    upd_date TIMESTAMP DEFAULT now(),
    FOREIGN KEY(class_code) REFERENCES code_class(class_code)
);

 -- 회원 테이블
 CREATE TABLE member(
 user_no INT(10) AUTO_INCREMENT ,
 user_id VARCHAR(50) NOT NULL,
 user_pw VARCHAR(100) NOT NULL,
 user_name VARCHAR(100) NOT NULL,
 job VARCHAR(3) NOT NULL DEFAULT '00',
 coin INT(10)DEFAULT 0,
 reg_date TIMESTAMP DEFAULT now(),
 upd_date TIMESTAMP DEFAULT now(),
 enabled CHAR(1) DEFAULT'1',
 PRIMARY KEY(user_no)
 );
 
 -- 권한 테이블
 CREATE TABLE member_auth(
 user_no INT(10)NOT NULL,
 auth VARCHAR(50)NOT NULL,
  FOREIGN KEY(user_no) REFERENCES member(user_no)
 );
 
 
 ALTER TABLE member_auth ADD CONSTRAINT fk_member_auth_user_no
 FOREIGN KEY(user_no)REFERENCES member(user_no);
 
 -- 회원 게시판 테이블
 CREATE TABLE board(
 board_no INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
 user_no INT NOT NULL,
 title VARCHAR(200)NOT NULL,
 content TEXT,
 reg_date TIMESTAMP NOT NULL DEFAULT now(),
 FOREIGN KEY(user_no)REFERENCES member(user_no)
 );
 

 -- 공지사항 테이블
 CREATE TABLE notice(
 notice_no INT NOT NULL AUTO_INCREMENT,
 title VARCHAR(200) NOT NULL,
 content TEXT,
 reg_date TIMESTAMP NOT NULL DEFAULT now(),
 PRIMARY KEY(notice_no)
 );
 
 -- 상품 테이블
 CREATE TABLE item(
 item_id INT AUTO_INCREMENT PRIMARY KEY,
 code_value VARCHAR(3) NOT NULL,
 item_name VARCHAR(20),
 price INT,
 description VARCHAR(50),
 picture_url VARCHAR(200),
 FOREIGN KEY(code_value)REFERENCES code_detail(code_value)
 );
 
 -- 자료실 테이블
 CREATE TABLE pds(
 item_id INT(10)AUTO_INCREMENT,
 item_name VARCHAR(20),
 view_cnt INT(10) DEFAULT 0,
 descirption VARCHAR(50),
 PRIMARY KEY(item_id)
 );
 
 -- 파일 첨부 테이블
 CREATE TABLE pds_attach(
 fullName VARCHAR(150) NOT NULL PRIMARY KEY,
 item_id INT NOT NULL,
 down_cnt INT DEFAULT 0,
 regdate TIMESTAMP DEFAULT now(),
 FOREIGN KEY(item_id)REFERENCES pds(item_id)
 );
 
 
 
 
 