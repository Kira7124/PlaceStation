package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.repository.entity.NoticeBoard;
import com.project3.placestation.repository.entity.QnaBoard;

@Mapper
public interface QnaBoardRepository {

	//QNA 리스트출력(페이징처리)
	public List<QnaBoard> AdminQnaBoardListAll(Criteria cri) throws Exception;
	
	
	//페이징처리 갯수세팅
	public int AdmincountQnaBoard() throws Exception;
	
	
	//특정글조회(글번호사용)
	public QnaBoard detailQnaBoard(Integer qbno) throws Exception;
	
	
	//1:1문의등록(관리자)
	public Integer AdminUpdateQna(QnaBoard qnaboard) throws Exception;
	
	
	
	
	
	
}
