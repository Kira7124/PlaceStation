package com.project3.placestation.product.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project3.placestation.product.dto.ProductInvalidDateDto;
import com.project3.placestation.product.dto.ProductValidDateTimeDto;
import com.project3.placestation.service.AdminProdHistoryService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/product")
public class ProductRestController {

	@Autowired
	AdminProdHistoryService adminProdHistoryService;

	@GetMapping("/valid-time")
	public ResponseEntity<?> getMethodName(@RequestParam(value = "date") String date,
			@RequestParam("prod-no") int prodNo) {
		try {
			// date 값과 같은 날짜인 start_time 과 end_time을 받아옵니다.
			List<ProductInvalidDateDto> list = adminProdHistoryService.findProductInvalidByProdNo(prodNo , date);
			log.info(date);
			log.info(list.toString());
			
			// 만약 객체가 있다면 시간 배열 가져오기
			if (!list.isEmpty()) {
				int[] resArray = adminProdHistoryService.conversionTime(date, list);
				log.info(Arrays.toString(resArray));
				return new ResponseEntity<>(resArray, HttpStatus.OK);
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
