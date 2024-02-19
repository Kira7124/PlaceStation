create table `member` (
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
  
  
  
create table biz(
	biz_no int primary key auto_increment,
    biz_id int NOT NULL,
    biz_brand_name varchar(30) not null,
    file_path varchar(255),
    FOREIGN KEY(biz_id)
    REFERENCES member(user_id) ON UPDATE CASCADE
);
  
  
  
  
  

