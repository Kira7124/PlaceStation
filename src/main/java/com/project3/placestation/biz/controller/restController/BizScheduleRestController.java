package com.project3.placestation.biz.controller.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project3.placestation.biz.model.dto.ScheduleDto;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.service.AdminProdHistoryService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/biz")
public class BizScheduleRestController {

	@Autowired
	AdminProdHistoryService adminProdHistoryService;
	
	@Autowired
	HttpSession httpSession;
	
	// http://localhost/biz/schedule-management
	@GetMapping("/schedule-management/rest")
	public ResponseEntity<?> scheduleManagementForm() {
		try {

			// 멤버 받기
			Member member = (Member) httpSession.getAttribute("member"); 
			if(member == null) {
				return new ResponseEntity<>(false , HttpStatus.BAD_REQUEST);
			}
		
		int userId = member.getUserno();
		List<ScheduleDto> dto = adminProdHistoryService.findScheduleByBizId(userId);
		ScheduleDto[] arr = dto.toArray(ScheduleDto[]::new);
		return new ResponseEntity<>(dto , HttpStatus.OK);
		
	} catch (Exception e) {
		log.info(e.getMessage());
		return new ResponseEntity<>(null , HttpStatus.INTERNAL_SERVER_ERROR);
	}
	}
}
