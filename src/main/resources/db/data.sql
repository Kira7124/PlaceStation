 -- INSERT INTO product (prod_writer_no, prod_no, prod_title, prod_writer, prod_rdate, prod_start_time, prod_end_time, prod_space_info, prod_goods_info, prod_caution_info, prod_maximum_people, prod_address, prod_detailed_address, prod_price, file_path, prod_major_category_id, prod_subcategory_id, prod_full_address, prod_location_x, prod_location_y, prod_update_at, prod_delete_at, prod_delete_yn, prod_delete_reason)
 -- VALUES
 -- (1, 1, '더미 1', 'Writer 1', '2024-02-19 10:00:00', 9, 17, 'Space info 1', 'Goods info 1', 'Caution info 1', 10, 'Address 1', 'Detailed address 1', 10000, '/assets/images/product/image1.jpg', 1, 1, 'Full address 1', 37.1234, 127.5678, '2024-02-19 10:00:00', NULL, 'N', NULL),
 -- (2, 2, '더미 2', 'Writer 2', '2024-02-19 11:00:00', 10, 18, 'Space info 2', 'Goods info 2', 'Caution info 2', 5, 'Address 2', 'Detailed address 2', 20000, '/assets/images/product/image2.jpg', 1, 2, 'Full address 2', 37.2345, 127.6789, '2024-02-19 11:00:00', NULL, 'N', NULL),
 -- (3, 3, '더미 3', 'Writer 3', '2024-02-19 12:00:00', 11, 19, 'Space info 3', 'Goods info 3', 'Caution info 3', 15, 'Address 3', 'Detailed address 3', 30000, '/assets/images/product/image3.jpg', 2, 3, 'Full address 3', 37.3456, 127.7890, '2024-02-19 12:00:00', NULL, 'N', NULL),
 -- (4, 4, '더미 4', 'Writer 4', '2024-02-19 13:00:00', 12, 20, 'Space info 4', 'Goods info 4', 'Caution info 4', 20, 'Address 4', 'Detailed address 4', 40000, '/assets/images/product/image4.jpg', 2, 4, 'Full address 4', 37.4567, 127.8901, '2024-02-19 13:00:00', NULL, 'N', NULL);

INSERT INTO prod_Review (prod_no, user_no, prod_rev_content, prod_rev_star, prod_rev_delete_yn, parent_id)
VALUES 
(1, 1, '리뷰 내용 1', 5, 'N', null),
(1, 1, '리뷰 내용 2', 1, 'N', null),
(1, 1, '리뷰 내용 3', 4, 'N', null),
(1, 1, '리뷰 내용 4', 3, 'N', null),
(1, 1, '리뷰 내용 5', 4, 'N', null),
(1, 1, '2번 리뷰 답글', 0, 'N', 2),
(2, 2, '리뷰 내용', 4, 'N', null);



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
('test9', '1234', '울산광역시', '김진수10', '01089237128', 'afc2024@naver.com', 'USER','GOLD','F'),
('san2636', '$2a$10$2RC0sD8amY1GFavAs9eKkuv0y8iuXI4XTBRZqu95dKy/NEzIcGmn6', '49376부산 사하구 감내1로 7dsa', '이산하', '010-2518-7987', 'san2636@naver.com', 'ROLE_USER','BRONZE','M'),
('san26362', '$2a$10$2RC0sD8amY1GFavAs9eKkuv0y8iuXI4XTBRZqu95dKy/NEzIcGmn6', '49376부산 사하구 감내1로 7dsa', '이산하', '010-2518-7987', 'san2636@naver.com', 'ROLE_BIZ','BRONZE','M'),
('san123', '$2a$10$2RC0sD8amY1GFavAs9eKkuv0y8iuXI4XTBRZqu95dKy/NEzIcGmn6', '49376부산 사하구 감내1로 7dsa', '이산하', '010-2518-7986', 'san2634@naver.com', 'ROLE_ADMIN','BRONZE','M');

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
values (28 , '상호명' , 20000 , 'https://picsum.photos/200/300​' ,'010-1111-1111', 'imp05516285' , '2076220350658738' , 'UidsW7v862X8nxk9NnjaPvpxYuiwSiG67gLkAYzx0tMxRRbwVOIHBsYZZ7I3rz78gqgA3oroohDtXDlp');


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
    '[서울] 프리미어리그 축구 홀란드' ,
	1 ,
    24 ,
    '공간 소개',
    '물품 대여 소개' ,
    '예약시 주의 사항' ,
    6 ,
    '주소' ,
    '상세 주소' ,
    50000 ,
    '/assets/images/product/soccer.png' ,
    1,
    2,
    '전체 주소' ,
    125.026156153123,35.15165189498
),(
	2, 
    '[부산] 스포츠 센터 축구' ,
	1 ,
    24 ,
    '우리의 공간은 편안하고 모던한 분위기로 디자인되어 있습니다. 넓은 창문을 통해 햇살이 잘 들어오며, 아늑한 분위기가 특징입니다. 공간 내에는 편안한 소파와 의자, 작업 공간이 구비되어 있어 다양한 용도로 활용 가능합니다. 또한 무료 와이파이와 음료 서비스가 제공되어 있어 편안한 시간을 보내실 수 있습니다.',
    '우리는 다양한 물품을 대여해 드리고 있습니다. 회의용 의자와 테이블, 프로젝터 등이 준비되어 있어 비즈니스 모임이나 행사를 개최하기에 최적입니다. 또한 음향기기와 라이트 등의 장비도 대여 가능하며, 필요한 경우 특별한 요청에도 최대한 협조해 드립니다.' ,
    '예약을 하실 때 몇 가지 주의 사항이 있습니다. 먼저, 예약 시간을 정확히 지켜주셔야 합니다. 예약 시간을 지키지 않을 경우 추가 비용이 발생할 수 있습니다. 또한 공간 내에서는 흡연이 엄격히 금지되며, 반려동물의 출입이 허용되지 않습니다. 예약 전에 이러한 사항들을 반드시 확인해 주시기 바랍니다.' ,
    10 ,
    '부산 서구 망양로213번길 2-1' ,
    '상세 주소' ,
    50000 ,
    '/assets/images/product/soccer.png' ,
    1,
    2,
    '부산 서구 망양로213번길 2-1	상세주소' 
    ,129.02526756 , 35.1112677103576
),(
	3, 
    '[부산] 스포츠 센터 농구' ,
	1 ,
    24 ,
    '우리의 공간은 편안하고 모던한 분위기로 디자인되어 있습니다. 넓은 창문을 통해 햇살이 잘 들어오며, 아늑한 분위기가 특징입니다. 공간 내에는 편안한 소파와 의자, 작업 공간이 구비되어 있어 다양한 용도로 활용 가능합니다. 또한 무료 와이파이와 음료 서비스가 제공되어 있어 편안한 시간을 보내실 수 있습니다.',
    '우리는 다양한 물품을 대여해 드리고 있습니다. 회의용 의자와 테이블, 프로젝터 등이 준비되어 있어 비즈니스 모임이나 행사를 개최하기에 최적입니다. 또한 음향기기와 라이트 등의 장비도 대여 가능하며, 필요한 경우 특별한 요청에도 최대한 협조해 드립니다.' ,
    '예약을 하실 때 몇 가지 주의 사항이 있습니다. 먼저, 예약 시간을 정확히 지켜주셔야 합니다. 예약 시간을 지키지 않을 경우 추가 비용이 발생할 수 있습니다. 또한 공간 내에서는 흡연이 엄격히 금지되며, 반려동물의 출입이 허용되지 않습니다. 예약 전에 이러한 사항들을 반드시 확인해 주시기 바랍니다.' ,
    10 ,
    '부산 서구 망양로213번길 2-1' ,
    '상세 주소' ,
    50000 ,
    '/assets/images/product/basketball.webp' ,
    1,
    2,
    '부산 서구 망양로213번길 2-1	상세주소' 
    ,129.02526756 , 35.1112677103576
),(
	4, 
    '[부산] 야외 캠핑',
	1 ,
    24 ,
    '우리의 공간은 편안하고 모던한 분위기로 디자인되어 있습니다. 넓은 창문을 통해 햇살이 잘 들어오며, 아늑한 분위기가 특징입니다. 공간 내에는 편안한 소파와 의자, 작업 공간이 구비되어 있어 다양한 용도로 활용 가능합니다. 또한 무료 와이파이와 음료 서비스가 제공되어 있어 편안한 시간을 보내실 수 있습니다.',
    '우리는 다양한 물품을 대여해 드리고 있습니다. 회의용 의자와 테이블, 프로젝터 등이 준비되어 있어 비즈니스 모임이나 행사를 개최하기에 최적입니다. 또한 음향기기와 라이트 등의 장비도 대여 가능하며, 필요한 경우 특별한 요청에도 최대한 협조해 드립니다.' ,
    '예약을 하실 때 몇 가지 주의 사항이 있습니다. 먼저, 예약 시간을 정확히 지켜주셔야 합니다. 예약 시간을 지키지 않을 경우 추가 비용이 발생할 수 있습니다. 또한 공간 내에서는 흡연이 엄격히 금지되며, 반려동물의 출입이 허용되지 않습니다. 예약 전에 이러한 사항들을 반드시 확인해 주시기 바랍니다.' ,
    10 ,
    '부산 서구 망양로213번길 2-1' ,
    '상세 주소' ,
    50000 ,
    '/assets/images/product/camp1.jpg' ,
    1,
    2,
    '부산 서구 망양로213번길 2-1	상세주소' 
    ,129.02526756 , 35.1112677103576
),(
	5, 
    '[서울] 야외 캠핑' ,
	1 ,
    24 ,
    '우리의 공간은 편안하고 모던한 분위기로 디자인되어 있습니다. 넓은 창문을 통해 햇살이 잘 들어오며, 아늑한 분위기가 특징입니다. 공간 내에는 편안한 소파와 의자, 작업 공간이 구비되어 있어 다양한 용도로 활용 가능합니다. 또한 무료 와이파이와 음료 서비스가 제공되어 있어 편안한 시간을 보내실 수 있습니다.',
    '우리는 다양한 물품을 대여해 드리고 있습니다. 회의용 의자와 테이블, 프로젝터 등이 준비되어 있어 비즈니스 모임이나 행사를 개최하기에 최적입니다. 또한 음향기기와 라이트 등의 장비도 대여 가능하며, 필요한 경우 특별한 요청에도 최대한 협조해 드립니다.' ,
    '예약을 하실 때 몇 가지 주의 사항이 있습니다. 먼저, 예약 시간을 정확히 지켜주셔야 합니다. 예약 시간을 지키지 않을 경우 추가 비용이 발생할 수 있습니다. 또한 공간 내에서는 흡연이 엄격히 금지되며, 반려동물의 출입이 허용되지 않습니다. 예약 전에 이러한 사항들을 반드시 확인해 주시기 바랍니다.' ,
    10 ,
    '서울 서초구 망양로213번길 2-1' ,
    '상세 주소' ,
    50000 ,
    '/assets/images/product/camp2.jpg' ,
    1,
    2,
    '부산 서초구 망양로213번길 2-1	상세주소' 
    ,129.02526756 , 35.1112677103576
),(
	6, 
    '[부산] 북카페' ,
	1 ,
    24 ,
    '우리의 공간은 편안하고 모던한 분위기로 디자인되어 있습니다. 넓은 창문을 통해 햇살이 잘 들어오며, 아늑한 분위기가 특징입니다. 공간 내에는 편안한 소파와 의자, 작업 공간이 구비되어 있어 다양한 용도로 활용 가능합니다. 또한 무료 와이파이와 음료 서비스가 제공되어 있어 편안한 시간을 보내실 수 있습니다.',
    '우리는 다양한 물품을 대여해 드리고 있습니다. 회의용 의자와 테이블, 프로젝터 등이 준비되어 있어 비즈니스 모임이나 행사를 개최하기에 최적입니다. 또한 음향기기와 라이트 등의 장비도 대여 가능하며, 필요한 경우 특별한 요청에도 최대한 협조해 드립니다.' ,
    '예약을 하실 때 몇 가지 주의 사항이 있습니다. 먼저, 예약 시간을 정확히 지켜주셔야 합니다. 예약 시간을 지키지 않을 경우 추가 비용이 발생할 수 있습니다. 또한 공간 내에서는 흡연이 엄격히 금지되며, 반려동물의 출입이 허용되지 않습니다. 예약 전에 이러한 사항들을 반드시 확인해 주시기 바랍니다.' ,
    10 ,
    '부산 서구 망양로213번길 2-1' ,
    '상세 주소' ,
    50000 ,
    '/assets/images/product/bookcafe2.jpg' ,
    1,
    2,
    '부산 서구 망양로213번길 2-1	상세주소' 
    ,129.02526756 , 35.1112677103576
),(
	7, 
    '[양산] 양산 북카페' ,
	1 ,
    24 ,
    '우리의 공간은 편안하고 모던한 분위기로 디자인되어 있습니다. 넓은 창문을 통해 햇살이 잘 들어오며, 아늑한 분위기가 특징입니다. 공간 내에는 편안한 소파와 의자, 작업 공간이 구비되어 있어 다양한 용도로 활용 가능합니다. 또한 무료 와이파이와 음료 서비스가 제공되어 있어 편안한 시간을 보내실 수 있습니다.',
    '우리는 다양한 물품을 대여해 드리고 있습니다. 회의용 의자와 테이블, 프로젝터 등이 준비되어 있어 비즈니스 모임이나 행사를 개최하기에 최적입니다. 또한 음향기기와 라이트 등의 장비도 대여 가능하며, 필요한 경우 특별한 요청에도 최대한 협조해 드립니다.' ,
    '예약을 하실 때 몇 가지 주의 사항이 있습니다. 먼저, 예약 시간을 정확히 지켜주셔야 합니다. 예약 시간을 지키지 않을 경우 추가 비용이 발생할 수 있습니다. 또한 공간 내에서는 흡연이 엄격히 금지되며, 반려동물의 출입이 허용되지 않습니다. 예약 전에 이러한 사항들을 반드시 확인해 주시기 바랍니다.' ,
    10 ,
    '양산 서구 망양로213번길 2-1' ,
    '상세 주소' ,
    50000 ,
    '/assets/images/product/bookcafe3.jpg' ,
    1,
    2,
    '양산 서구 망양로213번길 2-1	상세주소' 
    ,129.02526756 , 35.1112677103576
),(
	8, 
    '[부산] 스포츠 센터 축구 농구' ,
	1 ,
    24 ,
    '우리의 공간은 편안하고 모던한 분위기로 디자인되어 있습니다. 넓은 창문을 통해 햇살이 잘 들어오며, 아늑한 분위기가 특징입니다. 공간 내에는 편안한 소파와 의자, 작업 공간이 구비되어 있어 다양한 용도로 활용 가능합니다. 또한 무료 와이파이와 음료 서비스가 제공되어 있어 편안한 시간을 보내실 수 있습니다.',
    '우리는 다양한 물품을 대여해 드리고 있습니다. 회의용 의자와 테이블, 프로젝터 등이 준비되어 있어 비즈니스 모임이나 행사를 개최하기에 최적입니다. 또한 음향기기와 라이트 등의 장비도 대여 가능하며, 필요한 경우 특별한 요청에도 최대한 협조해 드립니다.' ,
    '예약을 하실 때 몇 가지 주의 사항이 있습니다. 먼저, 예약 시간을 정확히 지켜주셔야 합니다. 예약 시간을 지키지 않을 경우 추가 비용이 발생할 수 있습니다. 또한 공간 내에서는 흡연이 엄격히 금지되며, 반려동물의 출입이 허용되지 않습니다. 예약 전에 이러한 사항들을 반드시 확인해 주시기 바랍니다.' ,
    10 ,
    '부산 서구 망양로213번길 2-1' ,
    '상세 주소' ,
    50000 ,
    '/assets/images/product/soccer.png' ,
    1,
    2,
    '부산 서구 망양로213번길 2-1	상세주소' 
    ,129.02526756 , 35.1112677103576
),(
	9, 
    '[부산] 스포츠 센터 야구' ,
	1 ,
    24 ,
    '우리의 공간은 편안하고 모던한 분위기로 디자인되어 있습니다. 넓은 창문을 통해 햇살이 잘 들어오며, 아늑한 분위기가 특징입니다. 공간 내에는 편안한 소파와 의자, 작업 공간이 구비되어 있어 다양한 용도로 활용 가능합니다. 또한 무료 와이파이와 음료 서비스가 제공되어 있어 편안한 시간을 보내실 수 있습니다.',
    '우리는 다양한 물품을 대여해 드리고 있습니다. 회의용 의자와 테이블, 프로젝터 등이 준비되어 있어 비즈니스 모임이나 행사를 개최하기에 최적입니다. 또한 음향기기와 라이트 등의 장비도 대여 가능하며, 필요한 경우 특별한 요청에도 최대한 협조해 드립니다.' ,
    '예약을 하실 때 몇 가지 주의 사항이 있습니다. 먼저, 예약 시간을 정확히 지켜주셔야 합니다. 예약 시간을 지키지 않을 경우 추가 비용이 발생할 수 있습니다. 또한 공간 내에서는 흡연이 엄격히 금지되며, 반려동물의 출입이 허용되지 않습니다. 예약 전에 이러한 사항들을 반드시 확인해 주시기 바랍니다.' ,
    10 ,
    '부산 서구 망양로213번길 2-1' ,
    '상세 주소' ,
    50000 ,
    '/assets/images/product/baseball.png' ,
    1,
    2,
    '부산 서구 망양로213번길 2-1	상세주소' 
    ,129.02526756 , 35.1112677103576
),(
	10, 
    '[부산] 캠핑장에 어서오세요' ,
	1 ,
    24 ,
    '우리의 공간은 편안하고 모던한 분위기로 디자인되어 있습니다. 넓은 창문을 통해 햇살이 잘 들어오며, 아늑한 분위기가 특징입니다. 공간 내에는 편안한 소파와 의자, 작업 공간이 구비되어 있어 다양한 용도로 활용 가능합니다. 또한 무료 와이파이와 음료 서비스가 제공되어 있어 편안한 시간을 보내실 수 있습니다.',
    '우리는 다양한 물품을 대여해 드리고 있습니다. 회의용 의자와 테이블, 프로젝터 등이 준비되어 있어 비즈니스 모임이나 행사를 개최하기에 최적입니다. 또한 음향기기와 라이트 등의 장비도 대여 가능하며, 필요한 경우 특별한 요청에도 최대한 협조해 드립니다.' ,
    '예약을 하실 때 몇 가지 주의 사항이 있습니다. 먼저, 예약 시간을 정확히 지켜주셔야 합니다. 예약 시간을 지키지 않을 경우 추가 비용이 발생할 수 있습니다. 또한 공간 내에서는 흡연이 엄격히 금지되며, 반려동물의 출입이 허용되지 않습니다. 예약 전에 이러한 사항들을 반드시 확인해 주시기 바랍니다.' ,
    10 ,
    '부산 서구 망양로213번길 2-1' ,
    '상세 주소' ,
    50000 ,
    '/assets/images/product/camp5.jpg' ,
    1,
    2,
    '부산 서구 망양로213번길 2-1	상세주소' 
    ,129.02526756 , 35.1112677103576
);





insert into admin_prod_history (
	admin_his_no , 
    admin_his_prod_no, 
    admin_his_price ,
    admin_his_use_point ,
    admin_his_save_point ,
    admin_his_discount ,
    admin_his_prod_name ,
    admin_his_seller_id ,
    admin_his_confirm ,
    admin_his_buyer_id ,
    bank ,
    start_time ,
    end_time,
    people_count,
    purchase_date,
    cancel_reason,
    cancel_yn,
    cancel_amount ,
    admin_his_created_at ,
    ADMIN_HIS_CHARGE
) values ('OXDSAD-DNSKAN1' ,1,32100 ,0,0,0,'타이틀' , 28,true ,2 ,'부산은행',1,4,2,'2024-12-31',null,'N',0 , DATEADD('DAY', -1, CURRENT_TIMESTAMP()) , 100),
('OXDSAD-DNSKAN2' ,2,32100 ,0,0,0,'타이틀' , 28,true ,2 ,'부산은행',2,7,2,'2024-12-01',null,'N',0 , DATEADD('DAY', -2, CURRENT_TIMESTAMP()) , 5000),
('OXDSAD-DNSKAN3' ,3,54600 ,0,0,0,'타이틀' , 28,true ,2 ,'부산은행',3,9,2,'2024-05-12',null,'N',0 , DATEADD('DAY', -3, CURRENT_TIMESTAMP()) , 300),
('OXDSAD-DNSKAN4' ,4,76000 ,0,0,0,'타이틀' , 28,true ,2 ,'부산은행',1,8,2,'2024-12-12',null,'N',0, DATEADD('DAY', -15, CURRENT_TIMESTAMP()), 400),
('OXDSAD-DNSKAN5' ,5,32100 ,0,0,0,'타이틀' , 28,true ,2 ,'부산은행',12,14,2,'2024-12-05',null,'N',0 , DATEADD('DAY', -4, CURRENT_TIMESTAMP()), 10000),
('OXDSAD-DNSKAN6' ,6,76000 ,0,0,0,'타이틀' , 28,true ,2 ,'부산은행',2,14,2,'2024-11-30',null,'N',0 , DATEADD('DAY', -5, CURRENT_TIMESTAMP()) , 4200) ,
('OXDSAD-DNSKAN7' ,7,312500 ,0,0,0,'타이틀' , 28,true ,2 ,'부산은행',2,3,2,'2024-12-31',null,'N',0 , DATEADD('DAY', -6, CURRENT_TIMESTAMP()) , 5000),
('OXDSAD-DNSKAN8' ,8,76000 ,0,0,0,'타이틀' , 28,true ,2 ,'부산은행',7,21,2,'2024-12-31',null,'N',0 , DATEADD('DAY', -7, CURRENT_TIMESTAMP()) , 1000),
('OXDSAD-DNSKAN9' ,9,3000 ,0,0,0,'타이틀' , 28,true ,2 ,'부산은행',1,4,2,'2024-12-31',null,'N',0 , DATEADD('DAY', -8, CURRENT_TIMESTAMP()), 3200),
('OXDSAD-DSAFSA' ,10,54600 ,0,0,0,'타이틀' , 28,true ,2 ,'부산은행',5,8,2,'2024-12-31',null,'N',0 , DATEADD('DAY', -9, CURRENT_TIMESTAMP()), 3200) ,
('OXDSAD-VDDSAV' ,11,664500 ,0,0,0,'타이틀' , 28,true ,3 ,'부산은행',1,4,2,'2024-3-24',null,'N',0 , DATEADD('DAY', -50, CURRENT_TIMESTAMP()), 100),
('OXDSAD-FDSAFQEFQ' ,11,315000 ,0,0,0,'타이틀' , 28,true ,4 ,'부산은행',1,4,2,'2024-3-25',null,'N',0 , DATEADD('MONTH', -1, CURRENT_TIMESTAMP()), 5000),
('OXDSAD-DSAFASCVZ' ,11,413400 ,0,0,0,'타이틀' , 28,true ,5 ,'부산은행',1,4,2,'2024-3-22',null,'N',0 , DATEADD('DAY', -60, CURRENT_TIMESTAMP()), 100),
('OXDSAD-WQETRE' ,11,664500 ,0,0,0,'타이틀' , 28,true ,6 ,'부산은행',1,4,2,'2024-1-24',null,'N',0 , DATEADD('DAY', -24, CURRENT_TIMESTAMP()), 100),
('OXDSAD-KUYUMJH' ,11,100000 ,0,0,0,'타이틀' , 28,true ,7 ,'부산은행',1,4,2,'2024-6-12',null,'N',0 , DATEADD('DAY', -21, CURRENT_TIMESTAMP()), 3200),
('OXDSAD-JFHHGF' ,11,100000 ,0,0,0,'타이틀' , 28,true ,8 ,'부산은행',1,4,2,'2024-7-14',null,'N',0 , DATEADD('DAY', -25, CURRENT_TIMESTAMP()), 4200),
('OXDSAD-DSA' ,11,134120 ,0,0,0,'타이틀' , 28,true ,8 ,'부산은행',5,8,2,'2024-7-14',null,'N',0 , DATEADD('DAY', -34, CURRENT_TIMESTAMP()), 100),
('OXDSAD-VFDVFDSB' ,11,38200 ,0,0,0,'타이틀' , 28,true ,8 ,'부산은행',12,23,2,'2024-7-14',null,'N',0 , DATEADD('DAY', -31, CURRENT_TIMESTAMP()), 400),
('OXDSAD-DSAFQWWQ' ,11,321000 ,0,0,0,'타이틀' , 28,true ,8 ,'부산은행',1,4,2,'2024-7-16',null,'N',0 , DATEADD('MONTH', -2, CURRENT_TIMESTAMP()), 100),
('OXDSAD-vswqwe' ,11,76000 ,0,0,0,'타이틀' , 28,true ,8 ,'부산은행',1,4,2,'2024-03-02',null,'N',0 , DATEADD('MONTH', -3, CURRENT_TIMESTAMP()), 400),
('OXDSAD-rehytjjty' ,11,456100 ,0,0,0,'타이틀' , 28,true ,8 ,'부산은행',1,4,2,'2024-03-03',null,'N',0 , DATEADD('MONTH', -4, CURRENT_TIMESTAMP()), 100),
('OXDSAD-KJHGJHG' ,11,321000 ,0,0,0,'타이틀' , 28,true ,7 ,'부산은행',5,7,2,'2024-03-04',null,'N',0, DATEADD('MONTH', -4, CURRENT_TIMESTAMP()), 400),
('OXDSAD-FDSA' ,11,15616400 ,0,0,0,'타이틀' , 28,true ,8 ,'부산은행',1,4,2,'2023-11-04',null,'N',0 , DATEADD('MONTH', -6, CURRENT_TIMESTAMP()), 3200),
('OXDSAD-EWQQW' ,11,456100 ,0,0,0,'타이틀' , 28,true ,3 ,'부산은행',12,18,2,'2023-11-05',null,'N',0 , DATEADD('MONTH', -6, CURRENT_TIMESTAMP()), 100),
('OXDSAD-FDSFA' ,11,811600 ,0,0,0,'타이틀' , 28,true ,8 ,'부산은행',1,4,2,'2023-12-12',null,'N',0 , DATEADD('DAY', -76, CURRENT_TIMESTAMP()), 100),
('OXDSAD-FDSAGBF' ,11,100000 ,0,0,0,'타이틀' , 28,true ,8 ,'부산은행',4,5,2,'2023-03-05',null,'N',0 , DATEADD('DAY', -201, CURRENT_TIMESTAMP()), 3200),
('OXDSAD-NGFT' ,11,315000 ,0,0,0,'타이틀' , 28,true ,5 ,'부산은행',8,10,2,'2023-10-04',null,'N',0 , DATEADD('DAY', -204, CURRENT_TIMESTAMP()), 5000),
('OXDSAD-HTRHTRY' ,11,456100 ,0,0,0,'타이틀' , 28,true ,8 ,'부산은행',14,16,2,'2023-10-04',null,'N',0 , DATEADD('DAY', -301, CURRENT_TIMESTAMP()), 100),
('OXDSAD-EWRQWQD' ,11,100000 ,0,0,0,'타이틀' , 28,true ,1 ,'부산은행',23,24,2,'2023-10-04',null,'N',0 , DATEADD('DAY', -305, CURRENT_TIMESTAMP()), 100)
;







insert into biz (biz_id,biz_brand_name,biz_hp,biz_tel,biz_email,biz_balance)
values
(1,'직방','01012341234','021231234','dabang@naver.com',50000),
(2,'다방','01012341234','021231234','dabang@naver.com',50000),
(3,'올리브영','01012341234','021231234','dabang@naver.com',50000),
(4,'삼성','01012341234','021231234','dabang@naver.com',50000),
(5,'현대','01012341234','021231234','dabang@naver.com',50000),
(6,'요기어때','01012341234','021231234','dabang@naver.com',50000),
(7,'하나투어','01012341234','021231234','dabang@naver.com',50000),
(8,'모두투어','01012341234','021231234','dabang@naver.com',50000),
(9,'노랑풍선','01012341234','021231234','dabang@naver.com',50000),
(10,'대한항공','01012341234','021231234','dabang@naver.com',50000),
(11,'대한항공','01012341234','021231234','dabang@naver.com',50000),
(12,'대한항공','01012341234','021231234','dabang@naver.com',50000),
(13,'대한항공','01012341234','021231234','dabang@naver.com',50000),
(14,'대한항공','01012341234','021231234','dabang@naver.com',50000),
(15,'대한항공','01012341234','021231234','dabang@naver.com',50000),
(16,'대한항공','01012341234','021231234','dabang@naver.com',50000),
(17,'대한항공','01012341234','021231234','dabang@naver.com',50000),
(18,'대한항공','01012341234','021231234','dabang@naver.com',50000),
(19,'대한항공','01012341234','021231234','dabang@naver.com',50000),
(20,'대한항공','01012341234','021231234','dabang@naver.com',50000),
(21,'대한항공','01012341234','021231234','dabang@naver.com',50000),
(22,'아시아나','01012341234','021231234','dabang@naver.com',50000);

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




insert into qna_board(q_writer,q_content,q_title)
values(1,'첫번째내용입니다','0번째qna글1'),
(2,'2번째내용입니다','1번째qna글1'),
(3,'3번째내용입니다','2번째qna글1'),
(4,'4번째내용입니다','3번째qna글1'),
(5,'5번째내용입니다','4번째qna글1'),
(6,'6번째내용입니다','5번째qna글1'),
(7,'7번째내용입니다','6번째qna글1'),
(8,'8번째내용입니다','7번째qna글1'),
(9,'9번째내용입니다','8번째qna글1'),
(10,'10번째내용입니다','9번째qna글1'),
(11,'11번째내용입니다','10번째qna글1'),
(12,'12번째내용입니다','11번째qna글1');


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
insert into prod_subcategory (main_category_id , subcategory_name) values (3, '북카페');

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



INSERT INTO FAQ_BOARD(F_BNO, F_WRITER, F_CONTENT, F_TITLE)VALUES (1, 1, '로그인 하고 싶어요', '로그인이 안 돼요');

Insert into notice_board (n_writer, n_content, n_title, category_id) 
values ('yb','111111111111','0번  aaaaa', 0),
('yb','2222222222','0번 bbbbbbbbb', 0),
('yb','333333333333','0번 cccccccccc', 0),
('yb','4444444444444','0번 ddddddd', 0),
('yb','55555555555','0번 eeeeeee', 0),
('yb','666666666666','0번 ffffffff', 0),
('yb','777777777777','0번 gggggggg', 0),
('yb','88888888888','0번 hhhhhhhhh', 0),
('by','111111111111','1번aaaaaaa', 1),
('by','2222222222','1번 bbbbbbbbb', 1),
('by','333333333333','1번cccccccccc', 1),
('by','4444444444444','1번ddddddd', 1),
('by','55555555555','1번eeeeeee', 1),
('by','666666666666','1번 ffffffff', 1),
('by','777777777777','1번gggggggg', 1),
('by','88888888888','1번hhhhhhhhh', 1);

insert into banner (ban_name)
values('1번배너'),('2번배너'),('3번배너'),('4번배너'),('5번배너'),('6번배너'),('7번배너'),('8번배너'),('9번배너'),('10번배너');

INSERT INTO QNA_BOARD_CATEGORY(category_name , category_description , file_path) values ('계정' ,'계정에 필요한 문의가 가능합니다.' , '/assets/images/qna/icon1.png');
INSERT INTO QNA_BOARD_CATEGORY(category_name, category_description ,file_path) values ('예약' , '예약 확인 , 취소에 대한 문의가 가능합니다.' ,'/assets/images/qna/icon4.png');
INSERT INTO QNA_BOARD_CATEGORY(category_name, category_description ,file_path) values ('상품' , '상품에 대한 문의가 가능합니다.' , '/assets/images/qna/icon3.png');
INSERT INTO QNA_BOARD_CATEGORY(category_name, category_description ,file_path) values ('포인트' , '자신의 포인트에 대한 문의가 가능합니다.' , '/assets/images/qna/icon2.png');
INSERT INTO QNA_BOARD_CATEGORY(category_name, category_description ,file_path) values ('결제' ,'결제에 실패하였거나 환불이 필요한 경우 문의가 가능합니다.'  , '/assets/images/qna/icon7.png');


insert into addition_explanation (file_path , name) values ('/assets/images/biz/aircon.png' , '에어컨'),
('/assets/images/biz/copymachine.png','복사기/인쇄기'),
('/assets/images/biz/box.png','택배 발송 서비스'),
('/assets/images/biz/concent.png','콘센트'),
('/assets/images/biz/openall.png','24시 운영'),
('/assets/images/biz/mail.png','메일 서비스'),
('/assets/images/biz/parking.png','실내 주차장'),
('/assets/images/biz/whiteboard.png','화이트보드'),
('/assets/images/biz/storage.png','창고 서비스'),
('/assets/images/biz/fax.png','팩스'),
('/assets/images/biz/heating.png','난방기'),
('/assets/images/biz/openall2.png','연중 무휴'),
('/assets/images/biz/tv.png','TV'),
('/assets/images/biz/projecter.png','프로젝터'),
('/assets/images/biz/wifi.png','인터넷 / wifi'),
('/assets/images/biz/water.png','정수기'),
('/assets/images/biz/speaker.png','블루투스 스피커'),
('/assets/images/biz/sliper.png','실내화'),
('/assets/images/biz/tripod.png','삼각대');



insert into product_views values 
(0,1),
(0,2),
(0,3),
(0,4),
(0,5),
(0,6),
(0,7),
(0,8);

