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


CREATE TABLE biz (
  biz_no INT NOT NULL AUTO_INCREMENT,
  biz_id INT NOT NULL,
  biz_brand_name VARCHAR(30) NOT NULL,
  biz_hp VARCHAR(20) NULL,
  biz_email VARCHAR(45) NULL,
  biz_balance INT NULL,
  file_path VARCHAR(100) NULL,
  join_at DATETIME NULL DEFAULT now(),
  out_at DATETIME NULL,
  file_no INT NULL,
  biz_tel VARCHAR(20) NULL,
  PRIMARY KEY (`biz_no`)
  );
  
  
  
  
  
  

