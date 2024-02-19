CREATE TABLE product (
    prod_writer_no INT(5),
    prod_no INT(5) PRIMARY KEY,
    prod_title VARCHAR(50),
    prod_writer VARCHAR(20),
    prod_rdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    prod_start_time INT,
    prod_end_time INT,
    prod_space_info VARCHAR(1000),
    prod_goods_info VARCHAR(1000),
    prod_caution_info VARCHAR(1000),
    prod_maximum_people INT(2),
    prod_address VARCHAR(50),
    prod_detailed_address VARCHAR(50),
    prod_price INT,
    file_path VARCHAR(255),
    prod_major_category_id INT,
    prod_subcategory_id INT,
    prod_full_address VARCHAR(255),
    prod_location_x DOUBLE,
    prod_location_y DOUBLE,
    prod_update_at TIMESTAMP,
    prod_delete_at TIMESTAMP,
    prod_delete_yn VARCHAR(1),
    prod_delete_reason VARCHAR(1000)
);

CREATE TABLE prod_Review (
    prod_rev_no INT AUTO_INCREMENT PRIMARY KEY,
    prod_no INT NOT NULL,
    prod_rev_title VARCHAR(50) NOT NULL,
    prod_rev_content VARCHAR(1000),
    prod_rev_star INT NOT NULL,
    prod_rev_create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    prod_rev_id INT NOT NULL,
    prod_rev_update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    prod_rev_delete_yn VARCHAR(1) DEFAULT 'N',
    prod_rev_delete_at TIMESTAMP,
    child_id INT NOT NULL,
    parent_id INT NOT NULL
);

CREATE TABLE prod_major_category (
    category_id INT PRIMARY KEY NOT NULL,
    category_name VARCHAR(40) NOT NULL
);

CREATE TABLE prod_subcategory (
	category_id INT PRIMARY KEY NOT NULL,
    main_category_id INT NOT NULL,
    subcategory_name VARCHAR(40) NOT NULL
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