package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.CsFaqBoard;

@Mapper
public interface CsFaqBoardRepository {
	
	// FAQ 리스트 출력(페이징 처리)
	public List<CsFaqBoard> CsFaqBoardListAll(); 
	
	
	// 특정 글 조회(글 번호 사용)
	public CsFaqBoard DetailFaqBoard(Integer fbno);

}
