package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.repository.entity.CsQnaBoard;

@Mapper
public interface CsQnaBoardRepository {

	// 1:1 문의 리스트 출력
	public List<CsQnaBoard> CsQnaBoardListAll(Criteria cri) throws Exception;

	// 페이징처리 갯수세팅
	public int CsQnaBoardCount() throws Exception;
	
	// 1:1 문의 특정 글 조회(글번호사용)
	public CsQnaBoard DetailQnaBoard(Integer qbno) throws Exception;
	
}
