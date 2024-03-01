package com.project3.placestation.biz.controller.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.project3.placestation.biz.model.dto.ReqProdSubcategoryDto;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.service.ProdSubcategoryService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/biz/product")
public class BizProductRestController {

	@Autowired
	ProdSubcategoryService prodSubcategoryService;

	@Autowired
	HttpSession httpSession;
	/**
	 * AJAX 서브카테고리 전송
	 * @param param
	 * @return
	 */
	@GetMapping("/subcategory")
	public ResponseEntity<?> getMethodName(@RequestParam(value = "main-category") Integer param) {

		try {
			// 멤버 받기
			Member member = (Member) httpSession.getAttribute("member"); 
			if(member == null || member.getToken() == null || member.getToken().isEmpty()) {
				return new ResponseEntity<>(false , HttpStatus.BAD_REQUEST);
			}
			
			log.info(param.toString());
			List<ReqProdSubcategoryDto> list = prodSubcategoryService.findByMainCategoryId(param);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

}
