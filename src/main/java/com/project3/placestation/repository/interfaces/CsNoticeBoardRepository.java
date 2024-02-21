package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.CsNoticeBoard;

@Mapper
public interface CsNoticeBoardRepository {
	
	// 공지사항리스트출력(페이징처리)
	public List<CsNoticeBoard> CsNoticeBoardListAll() throws Exception;
	
//	//페이징처리 갯수세팅
//	public int CountNoticeBoard() throws Exception;
	
	//특정글조회(글번호사용)
	public CsNoticeBoard DetailNoticeBoard(Integer nbno) throws Exception;
	
	//글조회수증가
	public void UpdateReadCnt(Integer nbno) throws Exception;

	
}
