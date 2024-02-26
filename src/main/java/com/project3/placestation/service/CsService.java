package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.repository.entity.CsFaqBoard;
import com.project3.placestation.repository.entity.CsNoticeBoard;
import com.project3.placestation.repository.entity.CsQnaBoard;
import com.project3.placestation.repository.interfaces.CsFaqBoardRepository;
import com.project3.placestation.repository.interfaces.CsNoticeBoardRepository;
import com.project3.placestation.repository.interfaces.CsQnaBoardRepository;

@Service
public class CsService {
	
	@Autowired
	private CsNoticeBoardRepository csNoticeBoardRepository;
	
	@Autowired
	private CsQnaBoardRepository csQnaBoardRepository;
	
	@Autowired
	private CsFaqBoardRepository csFaqBoardRepository;

	
		// 공지사항 리스트 출력
		public List<CsNoticeBoard> CsNoticeBoardListAll() throws Exception{
			List<CsNoticeBoard> result1 = csNoticeBoardRepository.CsNoticeBoardListAll();
			return result1;
		}
		
		
		// 공지사항 특정 글 조회(글 번호 사용)
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
		
		// 1:1 문의 리스트 출력
		public List<CsQnaBoard> CsQnaBoardListAll() throws Exception{
				List<CsQnaBoard> result2 = csQnaBoardRepository.CsQnaBoardListAll();
				return result2;
			}
			
		// 1:1 문의 특정 글 조회(글 번호 사용)
		public CsQnaBoard detailQnaBoard(Integer qbno) throws Exception{
			return csQnaBoardRepository.DetailQnaBoard(qbno);
		}
		
		// FAQ 리스트 출력
		public List<CsFaqBoard> CsFaqBoardListAll() throws Exception{
				List<CsFaqBoard> result3 = csFaqBoardRepository.CsFaqBoardListAll();
				return result3;
			}
			
		// FAQ 특정 글 조회(글 번호 사용)
		public CsFaqBoard detailFaqBoard(Integer qbno) throws Exception{
			return csFaqBoardRepository.DetailFaqBoard(qbno);
		}
			
	 
	
}
