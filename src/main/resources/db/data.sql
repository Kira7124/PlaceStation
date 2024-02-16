INSERT INTO product (prod_cate_no, prod_no, prod_title, prod_content, prod_writer, prod_rdate, prod_hit, prod_rating, prod_review, prod_wishlist, prod_complain, prod_address, prod_price, regip, file1, file2, file3)
VALUES
    ( 1, 1, '상품 제목 1', '상품 내용 1', '작성자 1', NOW(), 100, 4, 20, 50, 5, '주소 1', 50000, '192.168.0.1','/assets/images/product/image1.jpg',NULL,NULL),
    ( 2, 2, '상품 제목 2', '상품 내용 2', '작성자 2', NOW(), 150, 3, 15, 30, 3, '주소 2', 75000, '192.168.0.2','/assets/images/product/image2.jpg',NULL,NULL),
    ( 3, 3, '상품 제목 3', '상품 내용 3', '작성자 3', NOW(), 200, 5, 25, 60, 7, '주소 3', 100000, '192.168.0.3','/assets/images/product/image3.jpg',NULL,NULL),
    ( 4, 4, '상품 제목 4', '상품 내용 4', '작성자 4', NOW(), 120, 4, 18, 40, 4, '주소 4', 60000, '192.168.0.4','/assets/images/product/image4.jpg',NULL,NULL),
    ( 5, 5, '상품 제목 5', '상품 내용 5', '작성자 5', NOW(), 180, 3, 12, 35, 2, '주소 5', 80000, '192.168.0.5','/assets/images/product/image5.jpg',NULL,NULL);