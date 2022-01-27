create table code_class(
	class_code char(3) primary key,
	class_name varchar(30)NOT NULL,
	use_yn char(1)NOT NULL DEFAULT 'Y',
	reg_date TIMESTAMP NOT NULL DEFAULT now(),
	upd_date TIMESTAMP DEFAULT now()
);
drop table code_class;
describe code_class;


create table code_detail(
	code_value varchar(3) primary key,
    class_code char(3)NOT NULL,
    class_name varchar(30)NOT NULL,
    sort_seq int(10) NOT NULL,
    use_yn char(1) NOT NULL DEFAULT 'Y',
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    upd_date TIMESTAMP DEFAULT now(),
    CONSTRAINT class_code FOREIGN KEY(class_code) REFERENCES code_class(class_code)
);

describe code_detail;
