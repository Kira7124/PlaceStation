CREATE TABLE product (
	prod_cate_no INT AUTO_INCREMENT NOT NULL,
    prod_no INT AUTO_INCREMENT PRIMARY KEY,
    prod_title VARCHAR(50) NOT NULL,
    prod_content VARCHAR(255),
    prod_writer VARCHAR(20) NOT NULL,
    prod_rdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    prod_hit INT,
    prod_rating INT,
    prod_review INT,
    prod_wishlist INT,
    prod_complain INT,
    prod_address VARCHAR(50) NOT NULL,
    prod_price INT NOT NULL,
    regip VARCHAR(20) NOT NULL,
    file1 VARCHAR(255),
    file2 VARCHAR(255),
    file3 VARCHAR(255)
);

CREATE TABLE prod_cate (
	prod_cate_no INT AUTO_INCREMENT NOT NULL,
	prod_cate1 VARCHAR(10) NOT NULL,
	prod_cate2 VARCHAR(10) NOT NULL
);