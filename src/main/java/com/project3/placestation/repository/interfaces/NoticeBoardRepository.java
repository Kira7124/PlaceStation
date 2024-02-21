package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.repository.entity.NoticeBoard;

@Mapper
public interface NoticeBoardRepository {
	
	
	
	// 공지사항리스트출력(페이징처리)
	public List<NoticeBoard> AdminNoticeBoardListAll(Criteria cri) throws Exception;
	
	//페이징처리 갯수세팅
	public int AdmincountNoticeBoard() throws Exception;
	
	//특정글조회(글번호사용)
	public NoticeBoard detailNoticeBoard(Integer nbno) throws Exception;
	
	//글조회수증가
	public void updateReadCnt(Integer nbno) throws Exception;
	
	
	
	
	
}
