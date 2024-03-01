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
(1, 1, '리뷰 내용 3', 0, 'N', 2),
(2, 2, '리뷰 내용 4', 4, 'N', null);


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
('san2636', '$2a$10$2RC0sD8amY1GFavAs9eKkuv0y8iuXI4XTBRZqu95dKy/NEzIcGmn6', '49376부산 사하구 감내1로 7dsa', '이산하', '010-1111-1111', 'san2636@naver.com@null', 'ROLE_USER','BRONZE','M'),
('san26362', '$2a$10$2RC0sD8amY1GFavAs9eKkuv0y8iuXI4XTBRZqu95dKy/NEzIcGmn6', '49376부산 사하구 감내1로 7dsa', '이산하', '010-1111-1111', 'san2636@naver.com@null', 'ROLE_BIZ','BRONZE','M');

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
	28, 
    '[부산] 파뤼룸' ,
	1 ,
    24 ,
    '어서오세요! 이곳은 화려한 분위기와 편안한 분위기가 조화로운 파티룸입니다. 우리의 파티룸은 다양한 파티와 이벤트에 최적화된 공간입니다. 넓은 공간을 활용하여 친구들과의 즐거운 시간을 보낼 수 있으며, 모든 종류의 파티에 맞게 커스터마이징이 가능합니다.

파티룸 내부는 특별한 장식과 조명으로 장식되어 있으며, 음악이나 엔터테인먼트 시스템을 이용하여 분위기를 더욱 즐겁게 만들 수 있습니다. 또한, 고급스러운 의자와 테이블이 배치되어 있어 손님들이 편안하게 쉴 수 있도록 배려되었습니다.

파티룸은 주방과 바가 함께 있어 음식과 음료를 편리하게 제공할 수 있습니다. 다양한 메뉴와 음료 옵션을 선택할 수 있으며, 전문 셰프가 요리하는 맛있는 음식을 즐길 수 있습니다.

우리의 파티룸은 생일, 결혼식, 돌잔치, 기업 행사 등 다양한 이벤트에 완벽하게 적합합니다. 특별한 날을 기념하거나 소중한 순간을 함께 공유하기에 최적의 장소입니다. 저희 파티룸에서 최상의 서비스와 즐거운 경험을 만끽하세요!
.',
    '물품 대여에 관한 정보를 제공해드리겠습니다.
우리는 고객들의 다양한 요구에 부응하기 위해 다양한 물품을 대여해드립니다. 아래는 대표적인 대여품목 몇 가지입니다.

1. 의자 및 테이블: 다양한 종류의 의자와 테이블을 대여할 수 있습니다. 이는 손님들이 편안하게 앉아 이벤트를 즐길 수 있도록 도와줍니다.

2. 음향 및 조명 장비: 고품질의 음향 시스템과 조명 장비를 대여하여 이벤트 분위기를 더욱 화려하게 만들 수 있습니다.

3. 장식품: 풍부한 종류의 장식품을 대여하여 파티 공간을 더욱 화려하고 특별하게 꾸밀 수 있습니다. 풍선, 꽃다발, 테이블 러너 등이 있습니다.

4. 파티 테마 소품: 특정 주제나 테마에 맞게 다양한 소품을 대여할 수 있습니다. 예를 들어, 할로윈, 크리스마스, 해변 파티 등을 위한 소품이 있습니다.

5. 식기 및 음료 서빙용품: 식기 세트, 컵, 접시, 포크와 나이프 등을 대여하여 음식과 음료를 서빙할 때 필요한 모든 것을 갖추실 수 있습니다.

6. 위의 물품들은 고객들의 요구에 따라 조정 가능하며, 자세한 정보나 추가적인 물품들에 대한 문의사항이 있다면 언제든지 문의해주시기 바랍니다. 함께하는 특별한 순간을 더욱 특별하게 만들어드리겠습니다.
' ,
    '물품 대여를 예약할 때 주의해야 할 몇 가지 사항이 있습니다. 이를 아래와 같이 안내해드리겠습니다.

1. 사전 예약: 대여하고자 하는 물품은 가능한 빨리 사전 예약하는 것이 좋습니다. 특히 휴일이나 이벤트가 많은 날에는 물품의 수급이 부족할 수 있으므로, 사전 예약으로 원하는 물품을 확보할 수 있습니다.

2. 대여 기간 확인: 물품을 대여할 때 대여 기간을 명확하게 확인해야 합니다. 대여 시작일과 종료일을 정확히 지정하여 오차 없이 이용할 수 있도록 해야 합니다.

3. 요금 및 결제 조건: 대여 물품의 요금과 결제 조건을 확인해야 합니다. 대여료뿐만 아니라 보증금이나 추가적인 서비스 요금 등도 확인해야 합니다.

4. 취소 정책: 예기치 않은 상황으로 인해 예약을 취소해야 할 경우를 대비하여 취소 정책을 숙지해야 합니다. 미리 취소 시 수수료가 발생하는지, 환불 정책이 어떻게 되는지를 확인해야 합니다.

5. 물품 상태 확인: 대여하기 전에 물품의 상태를 반드시 확인해야 합니다. 어떠한 손상이나 결함이 있는지를 확인하여 기록해야 하며, 이를 대여 업체와 공유하는 것이 중요합니다.

6. 안전 규정 준수: 물품을 안전하게 사용하고 보관해야 합니다. 대여 조건에 따라 사용 시 주의사항이 있을 수 있으므로, 이를 잘 숙지하고 준수해야 합니다.

이러한 주의사항을 준수하면 대여 과정이 원활하게 진행되고, 이용하는 동안 불편함이 최소화됩니다.' ,
    10 ,
    '부산 서구 망양로213번길 2-1' ,
    '상세 주소' ,
    50000 ,
    null ,
    1,
    2,
    '부산 서구 망양로213번길 2-1	상세주소' 
   ,35.1112677103576 ,129.02526756 
),(
	1, 
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
    null ,
    1,
    2,
    '부산 서구 망양로213번길 2-1	상세주소' 
    , 35.1112677103576,129.02526756 
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
) values ('OXDSAD-DNSKAN1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2) ,
('OXDSAD-Dvdska' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSAD-Djpwdqjpo' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSAD-Dewqjdq' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSAD-DNSKAdsds1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSAdsaD-DNSdsaKds1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSAD-DNSKdss1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSdsaAD-DNSdKds1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSAD-DNvSKds1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('aOXDdsaSAD-DNSKds1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSAD-DNSxzKds1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSdAD-DNSKds1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSdsaAD-DNSKds1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSAdasD-DNSKds1dsa' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSADdsa-DNSKds1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OasXDSAD-cDNSKds1' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2),
('OXDSAD-qweniqo' ,1,100000 ,0,0,0,0,'타이틀' , 1,true ,2 ,'부산은행',1,4,2);




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
) values ('OXDS231AD-csacsaxasa' ,2,150000 ,0,0,0,0,'타이틀' ,28,true ,2 ,'한화은행',1,2,3 , '2024-02-23');
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
) values ('OXDS231AD-SAACSA' ,1,150000 ,0,0,0,0,'타이틀' ,28,true ,1 ,'한화은행',5,6,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
) values ('OXDS231AD-FSACSA' ,4,350000 ,0,0,0,0,'타이틀' ,28,true ,2 ,'한화은행',3,4,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
) values ('OXDS231AD-VDACSA' ,1,150000 ,0,0,0,0,'타이틀' ,28,true ,1 ,'한화은행',7,8,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
) values ('OXDS231AD-DSANKLN' ,1,3000 ,0,0,0,0,'타이틀' ,28,true ,1 ,'한화은행',9,10,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
) values ('OXDS231AD-KOPKP' ,1,30000 ,0,0,0,0,'타이틀' ,28,true ,3 ,'한화은행',11,12,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
) values ('OXDS231AD-KOBFDM' ,1,30000 ,0,0,0,0,'타이틀' , 28,true ,1 ,'한화은행',13,14,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
) values ('OXDS231AD-KODSAM' ,1,31000 ,0,0,0,0,'타이틀' ,28,true ,3 ,'한화은행',20,21,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));
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
) values ('OXDSCAVD-KOBFDM' ,10,31000 ,0,0,0,0,'타이틀' , 28,true ,2 ,'한화은행',23,24,3 , '2024-02-23' , TO_CHAR(TIMESTAMP '2024-02-23 02:31', 'YYYY-MM-DD HH24:MI'));

insert into qna_board(q_writer,q_content,q_title)
values(1,'첫번째내용입니다','0번째qna글1'),
(1,'2번째내용입니다','1번째qna글1'),
(1,'3번째내용입니다','2번째qna글1'),
(1,'4번째내용입니다','3번째qna글1'),
(1,'5번째내용입니다','4번째qna글1'),
(1,'6번째내용입니다','5번째qna글1'),
(1,'7번째내용입니다','6번째qna글1'),
(1,'8번째내용입니다','7번째qna글1'),
(1,'9번째내용입니다','8번째qna글1'),
(1,'10번째내용입니다','9번째qna글1'),
(1,'11번째내용입니다','10번째qna글1'),
(1,'12번째내용입니다','11번째qna글1');


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

insert into banner (ban_name)
values('1번배너'),('2번배너'),('3번배너'),('4번배너'),('5번배너'),('6번배너'),('7번배너'),('8번배너'),('9번배너'),('10번배너');

INSERT INTO QNA_BOARD_CATEGORY(category_name , category_description , file_path) values ('계정' ,'계정에 필요한 문의가 가능합니다.' , '/assets/images/qna/icon1.png');
INSERT INTO QNA_BOARD_CATEGORY(category_name, category_description ,file_path) values ('예약' , '예약 확인 , 취소에 대한 문의가 가능합니다.' ,'/assets/images/qna/icon4.png');
INSERT INTO QNA_BOARD_CATEGORY(category_name, category_description ,file_path) values ('상품' , '상품에 대한 문의가 가능합니다.' , '/assets/images/qna/icon3.png');
INSERT INTO QNA_BOARD_CATEGORY(category_name, category_description ,file_path) values ('포인트' , '자신의 포인트에 대한 문의가 가능합니다.' , '/assets/images/qna/icon2.png');
INSERT INTO QNA_BOARD_CATEGORY(category_name, category_description ,file_path) values ('결제' ,'결제에 실패하였거나 환불이 필요한 경우 문의가 가능합니다.'  , '/assets/images/qna/icon7.png');
