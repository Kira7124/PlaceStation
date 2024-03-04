package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.repository.entity.CsNoticeBoard;

@Mapper
public interface CsNoticeBoardRepository {
	
	// 공지사항리스트출력(페이징처리)
	public List<CsNoticeBoard> CsNoticeBoardListAll(Criteria cri) throws Exception;
	
	// 페이징처리 갯수세팅
	public int CsNoticeBoardCount() throws Exception;
	
	// 특정글조회(글번호사용)
	public CsNoticeBoard DetailNoticeBoard(Integer nbno) throws Exception;
	
//	// 글조회수증가
//	public void UpdateReadCnt(Integer nbno) throws Exception;
	
	// 공지사항 숫자 세기(검색,페이징처리)
	public int countNoticeSearchlist(Criteria cri) throws Exception;

    // 카테고리에 따른 공지사항 수
	public int CsNoticeBoardCountByCategory(@Param("categoryid") Integer categoryid, @Param("cri") Criteria cri) throws Exception;
	
	// 카테고리에 따른 공지사항 리스트 출력
	public List<CsNoticeBoard> CsNoticeBoardListByCategory(@Param("categoryid") Integer categoryid, @Param("cri") Criteria cri) throws Exception;

	// 검색 결과에 따른 공지사항 리스트 출력
	public List<CsNoticeBoard> noticeSearchlist(Criteria cri) throws Exception;

	// 검색 결과에 따른 공지사항 수
	public int countNoticeSearchlistbySearch(Criteria cri) throws Exception;
}
