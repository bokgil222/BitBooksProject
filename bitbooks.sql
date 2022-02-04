-- 코드 그룹 테이블
create table code_class(
	class_code char(3) NOT NULL PRIMARY KEY,
	class_name varchar(30) NOT NULL,
	use_yn char(1) NOT NULL DEFAULT 'Y',
	reg_date TIMESTAMP NOT NULL DEFAULT now(),
	upd_date TIMESTAMP DEFAULT now()
);

-- 코드 테이블
create table code_detail(
	code_value varchar(3) PRIMARY KEY,
    class_code char(3) NOT NULL,
    code_name varchar(30) NOT NULL,
    sort_seq int NOT NULL,
    use_yn char(1) NOT NULL DEFAULT 'Y',
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    upd_date TIMESTAMP DEFAULT now()
    
);
-- 서비스 성능 로그 테이블
CREATE TABLE performance_log (  
 log_no INT NOT NULL AUTO_INCREMENT,  
 signature_name VARCHAR(50) NOT NULL, 
 signature_type_name VARCHAR(100) NOT NULL, 
 duration_time INT DEFAULT 0, 
 reg_date TIMESTAMP NOT NULL DEFAULT now(), 
 PRIMARY KEY (log_no) 
 ); 
 
-- 사용자 상품 테이블
create table user_item(
	user_item_no INT AUTO_INCREMENT PRIMARY KEY, 
    item_id INT NOT NULL,
    user_no INT NOT NULL,
    reg_date TIMESTAMP DEFAULT now(),
    amount INT,
    FOREIGN KEY(item_id) REFERENCES item(item_id),
    FOREIGN KEY(user_no) REFERENCES member(user_no)
);

 -- 회원 테이블
 CREATE TABLE member(
 user_no INT AUTO_INCREMENT ,
 user_id VARCHAR(50) NOT NULL,
 user_pw VARCHAR(100) NOT NULL,
 user_name VARCHAR(100) NOT NULL,
 job VARCHAR(3) DEFAULT '00',
 coin INT DEFAULT 0,
 reg_date TIMESTAMP NOT NULL DEFAULT  now(),
 upd_date TIMESTAMP DEFAULT now(),
 enabled CHAR(1) DEFAULT'1',
 PRIMARY KEY(user_no)
 );
 

 -- 권한 테이블
 CREATE TABLE member_auth(
 user_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 auth VARCHAR(50) NOT NULL,
  FOREIGN KEY(user_no) REFERENCES member(user_no)
 );
 
 -- 로그인 기록
 create table login_log(
	user_no INT,
    remote_addr VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY(user_no),
    FOREIGN KEY(user_no) REFERENCES member(user_no)
);

-- 충전 내역 테이블
create table charge_coin_history(
	history_no INT PRIMARY KEY AUTO_INCREMENT,
    user_no INT NOT NULL,
    amount INT NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    FOREIGN KEY(user_no) REFERENCES member(user_no)
);

 -- 회원 게시판 테이블
 CREATE TABLE board(
 board_no INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
 user_no INT NOT NULL,
 title VARCHAR(200) NOT NULL,
 content TEXT,
 writer VARCHAR(50) NOT NULL,
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

 -- 댓글 테이블
 create table comment(
	idx INT PRIMARY KEY AUTO_INCREMENT,
    user_no INT, 
    board_no INT,
    comment TEXT,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    FOREIGN KEY (user_no) REFERENCES member(user_no),
    FOREIGN KEY (board_no) REFERENCES board(board_no)
);
 
 -- 상품 테이블
 CREATE TABLE item(
 item_id INT AUTO_INCREMENT PRIMARY KEY,
 item_name VARCHAR(20),
 price INT,
 description VARCHAR(50),
 picture_url VARCHAR(200),
 preview_url VARCHAR(200)
 );
  
 -- 자료실 테이블
 CREATE TABLE pds(
 item_id INT AUTO_INCREMENT,
 item_name VARCHAR(20),
 view_cnt INT DEFAULT 0,
 descirption VARCHAR(50),
 PRIMARY KEY(item_id)
 );
 -- 로그인 유지 테이블
 CREATE TABLE persistent_logins (  
 username VARCHAR(64) NOT NULL,  
 series VARCHAR(64) NOT NULL, 
 token VARCHAR(64) NOT NULL, 
 last_used TIMESTAMP NOT NULL, 
 PRIMARY KEY (series)   
 ); 
 
 -- 접근로그 테이블
 CREATE TABLE access_log (  
 log_no INT NOT NULL AUTO_INCREMENT, 
 request_uri VARCHAR(200) NOT NULL,  
 class_name VARCHAR(100) NOT NULL,  
 class_simple_name VARCHAR(50) NOT NULL,  
 method_name VARCHAR(100) NOT NULL, 
 remote_addr VARCHAR(50) NOT NULL,  
 reg_date TIMESTAMP NOT NULL DEFAULT now(), 
 PRIMARY KEY (log_no) 
 ); 
  -- 자료실 테이블
 CREATE TABLE pds( 
 item_id INT(5) AUTO_INCREMENT, 
 item_name VARCHAR(20),  
 view_cnt INT(6) DEFAULT 0, 
 description VARCHAR(50),  
 PRIMARY KEY (item_id)  
 );     
 

 -- 파일 첨부 테이블
 CREATE TABLE pds_attach(
 fullName VARCHAR(150) NOT NULL PRIMARY KEY,
 item_id INT NOT NULL,
 down_cnt INT DEFAULT 0,
 regdate TIMESTAMP DEFAULT now(),
 FOREIGN KEY(item_id)REFERENCES pds(item_id)
 );
 -- 결제 내역 테이블
 CREATE TABLE pay_coin_history ( 
 history_no INT AUTO_INCREMENT, 
 user_no INT(5) NOT NULL,  
 item_id INT(5) NOT NULL, 
 amount INT(5) NOT NULL, 
 reg_date TIMESTAMP DEFAULT now(), 
 PRIMARY KEY (history_no)  
 );
 
 INSERT INTO code_detail (class_code, code_value, code_name, sort_seq) VALUES ('A01','00', '---', 1);  
 INSERT INTO code_detail (class_code, code_value, code_name, sort_seq) VALUES ('A01','01', 'Developer', 2); 
 INSERT INTO code_detail (class_code, code_value, code_name, sort_seq) VALUES ('A01','02', 'Designer', 3); 
 INSERT INTO code_detail (class_code, code_value, code_name, sort_seq) VALUES ('A01','03', 'Architect', 4);    
 INSERT INTO code_detail (class_code, code_value, code_name, sort_seq) VALUES ('A02','00', '---', 1); 
 INSERT INTO code_detail (class_code, code_value, code_name, sort_seq) VALUES ('A02','01', 'Movie', 2); 
 INSERT INTO code_detail (class_code, code_value, code_name, sort_seq) VALUES ('A02','02', 'Music', 3);  
INSERT INTO code_detail (class_code, code_value, code_name, sort_seq) VALUES ('A02','03', 'Sports', 4);
 
drop table code_class;
drop table code_detail;
drop table performance_log;
drop table user_item;
drop table member;
drop table member_auth;
drop table login_log;
drop table charge_coin_history;
drop table board;
drop table notice;
drop table comment;
drop table item;
drop table pds;
drop table persistent_logins;
drop table access_log;
drop table pds_attach;
drop table pay_coin_history ;
drop table code_class;
