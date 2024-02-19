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
  origin_img VARCHAR(100) NULL DEFAULT 'default.jpg',
  upload_img VARCHAR(100) NULL,
  join_at DATETIME NULL DEFAULT now(),
  user_role VARCHAR(20) NOT NULL,
  grade VARCHAR(20) NULL DEFAULT '브론즈'
  );
  
create table biz (
	biz_no int primary key auto_increment,
    biz_id int ,
    biz_brand_name varchar(30),
    biz_balance int,
    file_path varchar (1000)
);
