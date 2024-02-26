
CREATE TABLE prod_Review (
    prod_rev_no INT AUTO_INCREMENT PRIMARY KEY,
    prod_no INT NOT NULL,
    user_no INT NOT NULL,
    prod_rev_content VARCHAR(1000),
    prod_rev_star INT NOT NULL,
    prod_rev_create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    prod_rev_update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    prod_rev_delete_yn VARCHAR(1) DEFAULT 'N',
    prod_rev_delete_at TIMESTAMP,
    parent_id INT NOT NULL AUTO_INCREMENT
);

create table product_views (
	prod_views INT NOT NULL,
    prod_no INT PRIMARY KEY NOT NULL
);

create table wish_list (
	w_no INT PRIMARY KEY NOT NULL,
    prod_no INT NOT NULL,
    user_no INT NOT NULL
);

create table product (
	prod_no int (5) primary key auto_increment,
    prod_writer_no int (5) ,
    prod_title varchar (100) ,
    prod_start_time int (2) ,
    prod_end_time int (2),
    prod_space_info varchar (1000),
    prod_goods_info varchar (1000),
    prod_caution_info varchar (1000),
    prod_maximum_people int (2),
    prod_address varchar ( 100 ),
    prod_detailed_address varchar ( 100 ),
    prod_price int (7),
    file_path varchar (1000),
    prod_major_category_id int (2),
    prod_subcategory_id int (2),
    prod_full_address varchar (200),
    prod_location_x double,
    prod_location_y double,
	prod_rdate timestamp default now(),
	prod_update_at timestamp ,
    prod_delete_at timestamp ,
	prod_delete_reason varchar (1000),
    prod_delete_yn varchar (1) default 'N'
);

create table filedb (
	uuid varchar (100) primary key,
    original_file_name varchar(400) ,
    file_data MEDIUMBLOB -- 16MB
);

create table member (
  user_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(100) NOT NULL,
  user_password VARCHAR(100) NOT NULL,
  user_address VARCHAR(100) NOT NULL,
  user_name VARCHAR(30) NOT NULL,
  user_hp VARCHAR(20) NOT NULL,
  user_email VARCHAR(30) NOT NULL,
  user_point INT NULL DEFAULT 10,
  file_path VARCHAR(100) NULL DEFAULT 'default.jpg',
  join_at DATETIME NULL DEFAULT now(),
  user_role VARCHAR(20) NOT NULL,
  grade VARCHAR(20) NULL DEFAULT '브론즈',
  gender varchar (1)
  );

CREATE TABLE notice_board (
  n_bno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  n_writer VARCHAR(45) NOT NULL,
  n_content VARCHAR(400) NOT NULL,
  n_title VARCHAR(200) NOT NULL,
  file_path VARCHAR(400) NULL,
  n_regdate DATETIME NULL DEFAULT now(),
  n_updatedate DATETIME,
  category_id INT NULL,
  n_delete_yn CHAR NULL,
  n_delete_at DATETIME NULL,
  n_readcount INT NULL DEFAULT 0
  );
  
CREATE TABLE admin_todo (
  todo_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  todo_title VARCHAR(45) NOT NULL,
  todo_content VARCHAR(100) NOT NULL,
  todo_regdate DATETIME NULL DEFAULT now()
  );

create table biz (
	biz_no int primary key auto_increment,
    biz_id int ,
    biz_brand_name varchar(30),
    biz_balance int,
    file_path varchar (1000),
    biz_tel varchar (20),
    biz_hp varchar(20),
    biz_email varchar(20),
    joinat datetime default now()
);


create table admin_prod_history (
	admin_his_no varchar(20) primary key,
	admin_his_prod_no int (5) not null,
    admin_his_price int (7) not null,
    admin_his_use_point int (7) default 0,
    admin_his_save_point int (7) default 0,
    admin_his_discount int (7) default 0,
    admin_his_charge int (3) default 0,
    admin_his_prod_name varchar (100) not null,
    admin_his_seller_id int not null,
    admin_his_confirm boolean default false,
    admin_his_created_at timestamp default now(),
    admin_his_buyer_id int not null,
    bank varchar (100) ,
    start_time int (2) ,
    end_time int (2) ,
    cancel_yn varchar (1) default 'N',
    cancel_at timestamp ,
    cancel_amount int (7) ,
    people_count int (3),
    purchase_date varchar (100)
);

create table prod_major_category (
	category_id int primary key auto_increment ,
    category_name varchar(40)
);

create table prod_subcategory (
	category_id int auto_increment primary key ,
    main_category_id int ,
    subcategory_name varchar (40)
);

CREATE TABLE qna_board (
  q_bno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  q_writer VARCHAR(45) NOT NULL,
  q_content VARCHAR(400) NOT NULL,
  q_title VARCHAR(200) NOT NULL,
  file_path VARCHAR(400) NULL,
  q_regdate DATETIME NULL DEFAULT now(),
  q_updatedate DATETIME NULL DEFAULT now(),
  category_id INT NULL,
  q_delete_yn CHAR(1) NULL DEFAULT 'N',
  q_delete_at DATETIME NULL,
  q_status VARCHAR(10) NULL DEFAULT '진행',
  q_reply VARCHAR(400) NULL
  );


CREATE TABLE banner (
  ban_no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ban_name varchar(50),
  file_path varchar(100) DEFAULT 'defaultbanner.jpg'
);



