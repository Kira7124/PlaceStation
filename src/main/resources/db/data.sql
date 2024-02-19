
-- INSERT INTO product (prod_writer_no, prod_no, prod_title, prod_writer, prod_rdate, prod_start_time, prod_end_time, prod_space_info, prod_goods_info, prod_caution_info, prod_maximum_people, prod_address, prod_detailed_address, prod_price, file_path, prod_major_category_id, prod_subcategory_id, prod_full_address, prod_location_x, prod_location_y, prod_update_at, prod_delete_at, prod_delete_yn, prod_delete_reason)
-- VALUES
-- (1, 1, '더미 1', 'Writer 1', '2024-02-19 10:00:00', 9, 17, 'Space info 1', 'Goods info 1', 'Caution info 1', 10, 'Address 1', 'Detailed address 1', 10000, '/assets/images/product/image1.jpg', 1, 1, 'Full address 1', 37.1234, 127.5678, '2024-02-19 10:00:00', NULL, 'N', NULL),
-- (2, 2, '더미 2', 'Writer 2', '2024-02-19 11:00:00', 10, 18, 'Space info 2', 'Goods info 2', 'Caution info 2', 5, 'Address 2', 'Detailed address 2', 20000, '/assets/images/product/image2.jpg', 1, 2, 'Full address 2', 37.2345, 127.6789, '2024-02-19 11:00:00', NULL, 'N', NULL),
-- (3, 3, '더미 3', 'Writer 3', '2024-02-19 12:00:00', 11, 19, 'Space info 3', 'Goods info 3', 'Caution info 3', 15, 'Address 3', 'Detailed address 3', 30000, '/assets/images/product/image3.jpg', 2, 3, 'Full address 3', 37.3456, 127.7890, '2024-02-19 12:00:00', NULL, 'N', NULL),
-- (4, 4, '더미 4', 'Writer 4', '2024-02-19 13:00:00', 12, 20, 'Space info 4', 'Goods info 4', 'Caution info 4', 20, 'Address 4', 'Detailed address 4', 40000, '/assets/images/product/image4.jpg', 2, 4, 'Full address 4', 37.4567, 127.8901, '2024-02-19 13:00:00', NULL, 'N', NULL);

INSERT INTO prod_Review (prod_no, prod_rev_title, prod_rev_content, prod_rev_star, prod_rev_id, prod_rev_delete_yn, child_id, parent_id)
VALUES 
(1, '상품 리뷰 1', '리뷰 내용 1', 5, 1, 'N', 1, 1),
(2, '상품 리뷰 2', '리뷰 내용 2', 3, 1, 'N', 1, 1),
(2, '상품 리뷰 3', '리뷰 내용 3', 4, 2, 'N', 2, 2),
(4, '상품 리뷰 4', '리뷰 내용 4', 4, 2, 'N', 2, 2);

INSERT INTO member (user_id, user_password, user_address, user_name, user_hp, user_email, user_role,grade) 
VALUES 
('test1', '1234', '서울특별시', '김진수2', '01089237125', 'afc2016@naver.com', 'BIZ','실버'),
('test2', '1234', '대구광역시', '김진수3', '01089237126', 'afc2017@naver.com', 'USER','골드'),
('test3', '1234', '광주광역시', '김진수4', '01089237127', 'afc2018@naver.com', 'USER','실버'),
('test4', '1234', '울산광역시', '김진수5', '01089237128', 'afc2019@naver.com', 'USER','골드'),
('test5', '1234', '울산광역시', '김진수6', '01089237128', 'afc2020@naver.com', 'USER','브론즈'),
('test6', '1234', '울산광역시', '김진수7', '01089237128', 'afc2021@naver.com', 'USER','골드'),
('test7', '1234', '울산광역시', '김진수8', '01089237128', 'afc2022@naver.com', 'USER','실버'),
('test8', '1234', '울산광역시', '김진수9', '01089237128', 'afc2023@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','실버'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','실버'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','실버'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','실버'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','골드'),
('test10', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'BIZ','골드');


insert into biz (biz_id , biz_brand_name,biz_balance , file_path)
values (1 , '상호명' , 20000 , 'https://picsum.photos/200/300​');
insert into biz (biz_id , biz_brand_name,biz_balance , file_path)
values (13 , '상호명' , 20000 , 'https://picsum.photos/200/300​');

-- product
insert into product (
	prod_writer_no,
    prod_title ,
    prod_start_time ,
    prod_end_time , 
    prod_space_info,
    prod_goods_info ,
    prod_caution_info ,
    prod_maximum_people, 
    prod_address ,
    prod_detailed_address ,
    prod_price ,
    file_path ,
    prod_major_category_id ,
    prod_subcategory_id ,
    prod_full_address ,
    prod_location_x ,
    prod_location_y
) values (
	1, 
    '타이틀' ,
	1 ,
    24 ,
    '공간 소개',
    '물품 대여 소개' ,
    '예약시 주의 사항' ,
    6 ,
    '주소' ,
    '상세 주소' ,
    50000 ,
    'file_path' ,
    1,
    2,
    '전체 주소' ,
    125.026156153123,35.15165189498
);


insert into admin_prod_history (
	admin_his_no , 
    admin_his_prod_no, 
    admin_his_price ,
    admin_his_use_point ,
    admin_his_save_point ,
    admin_his_discount ,
    admin_his_charge ,
    admin_his_prod_name ,
    admin_his_seller_id ,
    admin_his_confirm ,
    admin_his_buyer_id ,
    bank ,
    start_time ,
    end_time,
    people_count
) values ('OXDSAD-DNSKAN1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2);

insert into prod_major_category (category_name) values ('스포츠');
insert into prod_major_category (category_name) values ('캠핑');
insert into prod_major_category (category_name) values ('스터디');

insert into prod_subcategory (main_category_id , subcategory_name) values (1, '농구');
insert into prod_subcategory (main_category_id , subcategory_name) values (1, '배구');
insert into prod_subcategory (main_category_id , subcategory_name) values (1, '야구');
insert into prod_subcategory (main_category_id , subcategory_name) values (2, '야외');
insert into prod_subcategory (main_category_id , subcategory_name) values (2, '실내');
insert into prod_subcategory (main_category_id , subcategory_name) values (3, '카페');
insert into prod_subcategory (main_category_id , subcategory_name) values (3, '도서관');


