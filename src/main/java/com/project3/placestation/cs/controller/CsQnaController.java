package com.project3.placestation.cs.controller;

import java.util.List;

import org.h2.store.fs.FilePath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ser.std.FileSerializer;
import com.project3.placestation.biz.handler.exception.CustomLoginRestfulException;
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.biz.model.util.BizDefine;
import com.project3.placestation.cs.dto.QnaBoardReqDto;
import com.project3.placestation.filedb.service.FiledbService;
import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.entity.QnaBoardCategory;
import com.project3.placestation.service.CsService;
import com.project3.placestation.service.QnaBoardCategoryService;
import com.project3.placestation.service.QnaBoardService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/cs/qna")
public class CsQnaController {

	@Autowired
	QnaBoardService qnaBoardService;

	@Autowired
	QnaBoardCategoryService boardCategoryService;

	@Autowired
	FiledbService filedbService;
	
	@Autowired
	HttpSession httpSession;
	
	/**
	 * 1 대 1 문의 태그폼 이동
	 * @param model
	 * @return
	 */
	@GetMapping("/qna-tag")
	public String qnaTagForm(Model model) {
		
		// 유저 로그인 수정 부분
		
		// 카테고리 태그 찾기
		List<QnaBoardCategory> tag = boardCategoryService.findAll();
		if(tag == null || tag.isEmpty()) {
			throw new CustomRestfulException("태그를 불러오는 도중 실패하셨습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		log.info(tag.toString());
		model.addAttribute("tag", tag);

		return "cs/cs_qna_tag";
	}
	
	/**
	 * 글쓰기 폼 이동
	 * @param model
	 * @param categoryId
	 * @return
	 */
	@GetMapping("/qna-write/{category-id}")
	public String qnaWriteForm(Model model , @PathVariable(value = "category-id") Integer categoryId) {
		// 1.유효성 검사
		Member member = (Member) httpSession.getAttribute("member");
		if (member == null) {
			throw new CustomLoginRestfulException(BizDefine.ACCOUNT_IS_NONE, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		model.addAttribute("categoryId" , categoryId);
		return "cs/cs_qna_write_form";
	}

	@PostMapping("/qna-post")
	public String qnaPost(QnaBoardReqDto boardReqDto) {
		log.info(boardReqDto.toString());
		// 유효성 검사
		if(boardReqDto.getCategoryId() == null || boardReqDto.getCategoryId() < 0) {
			throw new CustomRestfulException("카테고리를 다시 선택해주세요", HttpStatus.BAD_REQUEST);
		}
		if(boardReqDto.getTitle() == null || boardReqDto.getTitle().isEmpty()) {
			throw new CustomRestfulException("제목을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}
		if(boardReqDto.getContent() == null || boardReqDto.getContent().isEmpty()) {
			throw new CustomRestfulException("내용을 입력해주세요.", HttpStatus.BAD_REQUEST);
		}		
		
		
		// 파일 저장
		String path = filedbService.saveFiles(boardReqDto.getFile());
		if(path == null) {
			throw new CustomRestfulException("저장 도중 서버 에러가 발생하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		int userId = 1;
		qnaBoardService.saveQna(userId , boardReqDto.getContent() , boardReqDto.getTitle() , path , boardReqDto.getCategoryId());
		
		
		return "redirect:/cs/qna";
	}
	
}
