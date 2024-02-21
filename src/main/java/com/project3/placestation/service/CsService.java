package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.repository.entity.CsNoticeBoard;
import com.project3.placestation.repository.interfaces.CsNoticeBoardRepository;

@Service
public class CsService {
	
	@Autowired
	private CsNoticeBoardRepository csNoticeBoardRepository;

	
	  // 공지사항리스트출력
		public List<CsNoticeBoard> CsNoticeBoardListAll() throws Exception{
			List<CsNoticeBoard> result = CsNoticeBoardRepository.CsNoticeBoardListAll();
			return result;
		}
		
		
		//특정글조회(글번호사용)
		public CsNoticeBoard detailNoticeBoard(Integer nbno) throws Exception{
			return CsNoticeBoardRepository.detailNoticeBoard(nbno);
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
