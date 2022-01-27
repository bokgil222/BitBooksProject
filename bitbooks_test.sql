create table code_class(
	class_code char(3)NOT NULL primary key,
	class_name varchar(30)NOT NULL,
	use_yn char(1)NOT NULL DEFAULT 'Y',
	reg_date TIMESTAMP NOT NULL DEFAULT now(),
	upd_date TIMESTAMP DEFAULT now()
);

describe code_class;


create table code_detail(
	code_value varchar(3) NOT NULL,
    class_code char(3)NOT NULL,
    class_name varchar(30)NOT NULL,
    sort_seq int(10) NOT NULL,
    use_yn char(1) NOT NULL DEFAULT 'Y',
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    upd_date TIMESTAMP DEFAULT now(),
    primary key(class_code)
    
);

describe code_detail;
