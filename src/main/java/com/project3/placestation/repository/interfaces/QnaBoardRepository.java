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
	
	//QNA 리스트출력(조건/페이징처리)
	public List<QnaBoard> AdminQnaBoardListAll2(Criteria cri) throws Exception;
	
	
	
	//페이징처리 갯수세팅
	public int AdmincountQnaBoard() throws Exception;
	
	//메인페이지 갯수세팅
	public int mainQnaBoarCount(Criteria cri) throws Exception;
	
	
	//특정글조회(글번호사용)
	public QnaBoard detailQnaBoard(Integer qbno) throws Exception;
	
	
	//1:1문의등록(관리자)
	public Integer AdminUpdateQna(QnaBoard qnaboard) throws Exception;
	
	
	//1:1리스트출력(검색,페이징처리)
	public List<QnaBoard> AdminsearchQnaBoardlist(Criteria cri) throws Exception;
	
	
	//1:1숫자세기(검색,페이징처리)
	public int countAdminSearchQnalist(Criteria cri) throws Exception;
	
	// 1:1 문의 저장
	public int saveQna(QnaBoard board);
	
}
