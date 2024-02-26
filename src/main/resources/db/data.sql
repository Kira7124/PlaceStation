 -- INSERT INTO product (prod_writer_no, prod_no, prod_title, prod_writer, prod_rdate, prod_start_time, prod_end_time, prod_space_info, prod_goods_info, prod_caution_info, prod_maximum_people, prod_address, prod_detailed_address, prod_price, file_path, prod_major_category_id, prod_subcategory_id, prod_full_address, prod_location_x, prod_location_y, prod_update_at, prod_delete_at, prod_delete_yn, prod_delete_reason)
 -- VALUES
 -- (1, 1, '더미 1', 'Writer 1', '2024-02-19 10:00:00', 9, 17, 'Space info 1', 'Goods info 1', 'Caution info 1', 10, 'Address 1', 'Detailed address 1', 10000, '/assets/images/product/image1.jpg', 1, 1, 'Full address 1', 37.1234, 127.5678, '2024-02-19 10:00:00', NULL, 'N', NULL),
 -- (2, 2, '더미 2', 'Writer 2', '2024-02-19 11:00:00', 10, 18, 'Space info 2', 'Goods info 2', 'Caution info 2', 5, 'Address 2', 'Detailed address 2', 20000, '/assets/images/product/image2.jpg', 1, 2, 'Full address 2', 37.2345, 127.6789, '2024-02-19 11:00:00', NULL, 'N', NULL),
 -- (3, 3, '더미 3', 'Writer 3', '2024-02-19 12:00:00', 11, 19, 'Space info 3', 'Goods info 3', 'Caution info 3', 15, 'Address 3', 'Detailed address 3', 30000, '/assets/images/product/image3.jpg', 2, 3, 'Full address 3', 37.3456, 127.7890, '2024-02-19 12:00:00', NULL, 'N', NULL),
 -- (4, 4, '더미 4', 'Writer 4', '2024-02-19 13:00:00', 12, 20, 'Space info 4', 'Goods info 4', 'Caution info 4', 20, 'Address 4', 'Detailed address 4', 40000, '/assets/images/product/image4.jpg', 2, 4, 'Full address 4', 37.4567, 127.8901, '2024-02-19 13:00:00', NULL, 'N', NULL);

INSERT INTO prod_Review (prod_no, user_no, prod_rev_content, prod_rev_star, prod_rev_delete_yn, parent_id)
VALUES 
(1, 1, '리뷰 내용 1', 5, 'N', 1),
(1, 1, '리뷰 내용 2', 1, 'N', 2),
(1, 1, '리뷰 내용 3', 4, 'N', 1),
(2, 2, '리뷰 내용 4', 4, 'N', 4);


INSERT INTO member (user_id, user_password, user_address, user_name, user_hp, user_email, user_role,grade,gender) 
VALUES 
('test1', '1234', '서울특별시', '김진수2', '01089237125', 'afc2016@naver.com', 'BIZ','BRONZE','M'),
('test2', '1234', '대구광역시', '김진수3', '01089237126', 'afc2017@naver.com', 'USER','GOLD','F'),
('test3', '1234', '광주광역시', '김진수4', '01089237127', 'afc2018@naver.com', 'USER','SILVER','F'),
('test4', '1234', '울산광역시', '김진수5', '01089237128', 'afc2019@naver.com', 'USER','GOLD','F'),
('test5', '1234', '울산광역시', '김진수6', '01089237128', 'afc2020@naver.com', 'USER','BRONZE','F'),
('test6', '1234', '울산광역시', '김진수7', '01089237128', 'afc2021@naver.com', 'USER','GOLD','F'),
('test7', '1234', '울산광역시', '김진수8', '01089237128', 'afc2022@naver.com', 'USER','SILVER','F'),
('test8', '1234', '울산광역시', '김진수9', '01089237128', 'afc2023@naver.com', 'USER','GOLD','F'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','F'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','SILVER','F'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','F'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','M'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','SILVER','M'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','SILVER','M'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','SILVER','M'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','M'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','M'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','M'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','F'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','F'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','F'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','F'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','F'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','F'),
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','F'),
('test10', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'BIZ','GOLD','F');

insert into notice_board (n_writer,n_content,n_title)
values('kira','12121212121','rerere'),
('kira2','12121212121','rerere'),
('kira3','12121212121','rerere'),
('kira4','12121212121','rerere'),
('kira5','12121212121','rerere'),
('kira6','12121212121','rerere'),
('kira7','12121212121','rerere'),
('kira8','12121212121','rerere'),
('kira9','12121212121','rerere'),
('kira10','12121212121','rerere'),
('kira11','12121212121','rerere');

insert into biz (biz_id , biz_brand_name,biz_balance , file_path , biz_tel , imp_uid , imp_key , imp_secret)
values (1 , '상호명' , 20000 , 'https://picsum.photos/200/300​' ,'010-1111-1111', 'imp05516285' , '2076220350658738' , 'UidsW7v862X8nxk9NnjaPvpxYuiwSiG67gLkAYzx0tMxRRbwVOIHBsYZZ7I3rz78gqgA3oroohDtXDlp');
insert into biz (biz_id , biz_brand_name,biz_balance , file_path ,biz_tel)
values (13 , '상호명' , 20000 , 'https://picsum.photos/200/300​','010-1111-1111');


insert into admin_todo(todo_title,todo_content)
values('1번할일','어드민페이지완성'),
('2번할일','어드민페이지완성2'),
('3번할일','어드민페이지완성3'),
('4번할일','어드민페이지완성4');


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
    null ,
    1,
    2,
    '전체 주소' ,
    125.026156153123,35.15165189498
),(
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
    '전체 주소' 
    ,35.15165189498 , 125.026156153123
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



insert into biz (biz_id,biz_brand_name,biz_hp,biz_tel,biz_email)
values
(1111,'직방','01012341234','021231234','dabang@naver.com'),
(2222,'다방','01012341234','021231234','dabang@naver.com'),
(3333,'올리브영','01012341234','021231234','dabang@naver.com'),
(4444,'삼성','01012341234','021231234','dabang@naver.com'),
(5555,'현대','01012341234','021231234','dabang@naver.com'),
(6666,'요기어때','01012341234','021231234','dabang@naver.com'),
(7777,'하나투어','01012341234','021231234','dabang@naver.com'),
(8888,'모두투어','01012341234','021231234','dabang@naver.com'),
(9999,'노랑풍선','01012341234','021231234','dabang@naver.com'),
(1234,'대한항공','01012341234','021231234','dabang@naver.com'),
(1234,'대한항공','01012341234','021231234','dabang@naver.com'),
(1234,'대한항공','01012341234','021231234','dabang@naver.com'),
(1234,'대한항공','01012341234','021231234','dabang@naver.com'),
(1234,'대한항공','01012341234','021231234','dabang@naver.com'),
(1234,'대한항공','01012341234','021231234','dabang@naver.com'),
(1234,'대한항공','01012341234','021231234','dabang@naver.com'),
(1234,'대한항공','01012341234','021231234','dabang@naver.com'),
(1234,'대한항공','01012341234','021231234','dabang@naver.com'),
(1234,'대한항공','01012341234','021231234','dabang@naver.com'),
(1234,'대한항공','01012341234','021231234','dabang@naver.com'),
(1234,'대한항공','01012341234','021231234','dabang@naver.com'),
(1235,'아시아나','01012341234','021231234','dabang@naver.com');

insert into notice_board (n_writer,n_content,n_title)
values('kira','12121212121','rerere'),
('kira2','12121212121','rerere'),
('kira3','12121212121','rerere'),
('kira4','12121212121','rerere'),
('kira5','12121212121','rerere'),
('kira6','12121212121','rerere'),
('kira7','12121212121','rerere'),
('kira8','12121212121','rerere'),
('kira9','12121212121','rerere'),
('kira10','12121212121','rerere'),
('kira11','12121212121','rerere');


insert into admin_todo(todo_title,todo_content)
values('1번할일','어드민페이지완성'),
('2번할일','어드민페이지완성2'),
('3번할일','어드민페이지완성3'),
('4번할일','어드민페이지완성4'),
('5번할일','어드민페이지완성5'),
('6번할일','어드민페이지완성6'),
('7번할일','어드민페이지완성7'),
('8번할일','어드민페이지완성8');

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
    people_count ,
    purchase_date
) values ('OXDS231AD-csacsaxasa' ,1,150000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'한화은행',1,2,3 , '2024-02-23');
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
    people_count ,
    purchase_date ,
    admin_his_created_at
) values ('OXDS231AD-SAACSA' ,1,150000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'한화은행',5,6,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
    people_count ,
    purchase_date ,
    admin_his_created_at
) values ('OXDS231AD-FSACSA' ,1,150000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'한화은행',3,4,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
    people_count ,
    purchase_date ,
    admin_his_created_at
) values ('OXDS231AD-VDACSA' ,1,150000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'한화은행',7,8,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
    people_count ,
    purchase_date ,
    admin_his_created_at
) values ('OXDS231AD-DSANKLN' ,1,3000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'한화은행',9,10,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
    people_count ,
    purchase_date ,
    admin_his_created_at
) values ('OXDS231AD-KOPKP' ,1,30000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'한화은행',11,12,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
    people_count ,
    purchase_date ,
    admin_his_created_at
) values ('OXDS231AD-KOBFDM' ,1,30000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'한화은행',13,14,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
    people_count ,
    purchase_date ,
    admin_his_created_at
) values ('OXDS231AD-KODSAM' ,1,31000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'한화은행',20,21,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
    people_count ,
    purchase_date ,
    admin_his_created_at
) values ('OXDSCAVD-KOBFDM' ,1,31000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'한화은행',23,24,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));

insert into qna_board(q_writer,q_content,q_title)
values('키라1','첫번째내용입니다','0번째qna글1'),
('키라1','2번째내용입니다','1번째qna글1'),
('키라1','3번째내용입니다','2번째qna글1'),
('키라1','4번째내용입니다','3번째qna글1'),
('키라1','5번째내용입니다','4번째qna글1'),
('키라1','6번째내용입니다','5번째qna글1'),
('키라1','7번째내용입니다','6번째qna글1'),
('키라1','8번째내용입니다','7번째qna글1'),
('키라1','9번째내용입니다','8번째qna글1'),
('키라1','10번째내용입니다','9번째qna글1'),
('키라1','11번째내용입니다','10번째qna글1'),
('키라1','12번째내용입니다','11번째qna글1');


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

insert into charge values (10);
insert into grade values ('BRONZE' , 3 , 999 , 1);
insert into grade values ('SILVER' , 5 , 10000 , 2);
insert into grade values ('GOLD' , 7 , 100000 , 3);


insert into company values ('PlaceStation' , '부산광역시 부산진구 중앙대로 688, 한준빌딩 2층',
'010-1111-1111' ,
'김진수' ,
'greenAcademi@naver.com',
'2024-PlaceStation-0056호' ,
'사업 소개',
'오전 9시 ~ 오후 6시' ,
0
);



