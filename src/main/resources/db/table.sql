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
