package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.admin.dto.AdminQnaDTO;
import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.repository.entity.NoticeBoard;
import com.project3.placestation.repository.entity.QnaBoard;
import com.project3.placestation.repository.interfaces.QnaBoardRepository;

@Service
public class QnaBoardService {

	@Autowired
	private QnaBoardRepository qnaBoardRepository;
	
	//Qna리스트출력(페이징처리)
	public List<QnaBoard> AdminQnaBoardListAll(Criteria cri) throws Exception{
		List<QnaBoard> result = qnaBoardRepository.AdminQnaBoardListAll(cri);
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
	
	
	
	
	
	
	
}