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

	
	  // 공지사항 리스트 출력
		public List<CsNoticeBoard> CsNoticeBoardListAll() throws Exception{
			List<CsNoticeBoard> result = csNoticeBoardRepository.CsNoticeBoardListAll();
			return result;
		}
		
		
		//특정 글 조회(글 번호 사용)
		public CsNoticeBoard detailNoticeBoard(Integer nbno) throws Exception{
			return csNoticeBoardRepository.DetailNoticeBoard(nbno);
		}
		
		
//		//페이징 처리 갯수 세팅(페이징)
//		public int AdmincountNoticeBoard() throws Exception{
//			return csNoticeBoardRepository.CountNoticeBoard();
//		}
		
//		//글 조회수 증가
//		public void updateReadCnt(Integer nbno) throws Exception{
//			CsNoticeBoardRepository.UpdateReadCnt(nbno);
//		}
	 
	
}
