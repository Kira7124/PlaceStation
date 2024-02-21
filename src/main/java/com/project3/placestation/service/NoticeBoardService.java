package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.repository.entity.NoticeBoard;
import com.project3.placestation.repository.interfaces.NoticeBoardRepository;

@Service
public class NoticeBoardService {
	
		@Autowired
		private NoticeBoardRepository noticeBoardRepository;
	
		
		// 공지사항리스트출력(페이징처리)
		public List<NoticeBoard> AdminNoticeBoardListAll(Criteria cri) throws Exception{
			List<NoticeBoard> result = noticeBoardRepository.AdminNoticeBoardListAll(cri);
			return result;
		}
		
		
		//특정글조회(글번호사용)
		public NoticeBoard detailNoticeBoard(Integer nbno) throws Exception{
			return noticeBoardRepository.detailNoticeBoard(nbno);
		}
		
		
		//페이징처리 갯수세팅(페이징)
		public int AdmincountNoticeBoard() throws Exception{
			return noticeBoardRepository.AdmincountNoticeBoard();
		}
		
		//글조회수증가
		public void updateReadCnt(Integer nbno) throws Exception{
			noticeBoardRepository.updateReadCnt(nbno);
		}
	
	
	
	
	
	
	
	
}