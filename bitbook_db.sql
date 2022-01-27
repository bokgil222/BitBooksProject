create table code_class(
	class_code char(3) NOT NULL PRIMARY KEY,
	class_name varchar(30)NOT NULL,
	use_yn char(1)NOT NULL DEFAULT 'Y',
	reg_date TIMESTAMP NOT NULL DEFAULT now(),
	upd_date TIMESTAMP DEFAULT now()
);
drop table code_class;
describe code_class;


create table code_detail(
	code_value varchar(3) PRIMARY KEY,
    class_code char(3)NOT NULL,
    class_name varchar(30)NOT NULL,
    sort_seq int(10) NOT NULL,
    use_yn char(1) NOT NULL DEFAULT 'Y',
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    upd_date TIMESTAMP DEFAULT now(),
    FOREIGN KEY(class_code) REFERENCES code_class(class_code)
);

drop table code_detail;
describe code_detail;

create table item(
	item_id  INT(10) AUTO_INCREMENT,
    code_value VARCHAR(3),
    item_name VARCHAR(20),
    price INT(10),
    description VARCHAR(50),
    picture_url VARCHAR(200),
	PRIMARY KEY(item_id),
    FOREIGN KEY(code_value) REFERENCES code_detail(code_value)
);
describe code_detail;

create table user_item(
	user_item_no INT(10) AUTO_INCREMENT, 
    item_id INT(10) NOT NULL,
    user_no INT(1) NOT NULL,
    reg_date TIMESTAMP DEFAULT now(),
    amount INT(10),
    PRIMARY KEY(user_item_no),
    FOREIGN KEY(item_id) REFERENCES item(item_id)
);
describe user_item;


create table member(
	user_no INT(10) AUTO_INCREMENT,
    user_id VARCHAR(50) NOT NULL,
    user_pw VARCHAR(100) NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    job VARCHAR(3) NOT NULL DEFAULT 00,
    coin INT(10) DEFAULT 0,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    upd_date TIMESTAMP DEFAULT now(),
    enabled CHAR(1) DEFAULT 1,
    PRIMARY KEY(user_no)
);
describe member;


create table login_log(
	user_no INT(10),
    remote_addr VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY(user_no),
    FOREIGN KEY(user_no) REFERENCES member(user_no)
);
describe login_log;

create table member_auth(
	user_no INT(10) PRIMARY KEY AUTO_INCREMENT,
    auth VARCHAR(50) NOT NULL
);
describe member_auth;

create table charge_coin_hist(
	history_no INT(10) PRIMARY KEY AUTO_INCREMENT,
    user_no INT(10) NOT NULL,
    amount INT(10) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    FOREIGN KEY(user_no) REFERENCES member(user_no)
  
);
describe charge_coin_hist;

create table board(
	board_no INT(10) PRIMARY KEY AUTO_INCREMENT,
    user_no INT(10) NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    Foreign key (user_no) REFERENCES member(user_no)
);
describe board;

create table comment(
	idx INT(10) PRIMARY KEY AUTO_INCREMENT,
    user_no INT(10), 
    board_no INT(10),
    comment TEXT,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    FOREIGN KEY (user_no) REFERENCES member(user_no),
    FOREIGN KEY (board_no) REFERENCES board(board_no)
);
drop table comment;
describe comment;

create table pds(
		item_id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
        item_name VARCHAR(20),
        view_cnt INT(10) DEFAULT 0,
        description VARCHAR(50)
);
describe pds;

create table pds_attach(
	fullName VARCHAR(150) NOT NULL PRIMARY KEY,
    item_id INT(5) NOT NULL,
    down_cnt INT(6) default 0,
    regdate TIMESTAMP DEFAULT now(),
    FOREIGN KEY (item_id) REFERENCES item(item_id)
);
describe pds_attach;

create table notice(
	notice_no INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    reg_date TIMESTAMP NOT NULL DEFAULT now()
);
describe notice;



