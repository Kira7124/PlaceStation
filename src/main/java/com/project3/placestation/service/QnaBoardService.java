package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.admin.dto.AdminQnaDTO;
import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.repository.entity.NoticeBoard;
import com.project3.placestation.repository.entity.QnaBoard;
import com.project3.placestation.repository.interfaces.QnaBoardRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaBoardService {

	@Autowired
	private QnaBoardRepository qnaBoardRepository;
	
	//Qna리스트출력(페이징처리)
	public List<QnaBoard> AdminQnaBoardListAll(Criteria cri) throws Exception{
		List<QnaBoard> result = qnaBoardRepository.AdminQnaBoardListAll(cri);
		return result;
		
	}
	
	//Qna리스트출력2(조건/페이징처리)
	public List<QnaBoard> AdminQnaBoardListAll2(Criteria cri) throws Exception{
		List<QnaBoard> result = qnaBoardRepository.AdminQnaBoardListAll2(cri);
		return result;
	}
	
	
	
	
	//페이징처리갯수세팅(페이징)
	public int AdmincountQnaBoard() throws Exception{
		return qnaBoardRepository.AdmincountQnaBoard();
	}
	
	
	//특정글조회(글번호사용)
	public QnaBoard detailQnaBoard(Integer qbno) throws Exception{
		return qnaBoardRepository.detailQnaBoard(qbno);
	}
	
	
	
	//1:1문의등록(관리자)
	@Transactional
	public void AdminUpdateQna(AdminQnaDTO dto) throws Exception{
		
		QnaBoard qnaboard = QnaBoard.builder()
				.qbno(dto.getQbno())
				.qreply(dto.getQreply())
				.qstatus(dto.getQstatus())
				.qwriter(dto.getQwriter())
				.qtitle(dto.getQtitle())
				.qcontent(dto.getQcontent())
				.build();
		
		Integer result = qnaBoardRepository.AdminUpdateQna(qnaboard);
		
	}
	
	
	//1:1 검색리스트출력(페이징)
	public List<QnaBoard> AdminsearchQnaBoardlist(Criteria cri) throws Exception{
		List<QnaBoard> result = qnaBoardRepository.AdminsearchQnaBoardlist(cri);
		return result;
	}

	
	//1:1 검색 숫자세기(페이징)
	public int countAdminSearchQnalist(Criteria cri) throws Exception{
		return qnaBoardRepository.countAdminSearchQnalist(cri);
	}
	
	
	//1:1 메인진행숫자세기
	public int mainQnaBoarCount(Criteria cri) throws Exception{
		return qnaBoardRepository.mainQnaBoarCount(cri);
	}
	
	
	// 1 : 1 문의 저장
	@Transactional
	public int saveQna(int writer, String content, String title, String filePath, int categoryId) {

		QnaBoard board = QnaBoard.builder().qwriter(writer).qcontent(content).qtitle(title).filepath(filePath)
				.categoryid(categoryId).build();

		int result = qnaBoardRepository.saveQna(board);
		log.info("결과 : " + result);
		if (result < 1) {
			throw new CustomRestfulException("저장 시 서버 에러가 발생하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	
}
