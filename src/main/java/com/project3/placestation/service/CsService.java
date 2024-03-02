package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.cs.controller.CsController;
import com.project3.placestation.repository.entity.CsFaqBoard;
import com.project3.placestation.repository.entity.CsNoticeBoard;
import com.project3.placestation.repository.entity.CsQnaBoard;
import com.project3.placestation.repository.interfaces.CsFaqBoardRepository;
import com.project3.placestation.repository.interfaces.CsNoticeBoardRepository;
import com.project3.placestation.repository.interfaces.CsQnaBoardRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CsService {
	
	@Autowired
	private CsNoticeBoardRepository csNoticeBoardRepository;
	
	@Autowired
	private CsQnaBoardRepository csQnaBoardRepository;
	
	@Autowired
	private CsFaqBoardRepository csFaqBoardRepository;

// 공지사항	
		// 공지사항 리스트 출력
		public List<CsNoticeBoard> CsNoticeBoardListAll(Criteria cri) throws Exception{
			List<CsNoticeBoard> result1 = csNoticeBoardRepository.CsNoticeBoardListAll(cri);
			return result1;
		}
		
		// 공지사항 특정 글 조회(글 번호 사용)
		public CsNoticeBoard detailNoticeBoard(Integer nbno) throws Exception{
			return csNoticeBoardRepository.DetailNoticeBoard(nbno);
		}
		
		
		// 페이징 처리 갯수 세팅(페이징)
		public int CsNoticeBoardCount() throws Exception{
			return csNoticeBoardRepository.CsNoticeBoardCount();
		}
		
	   // 카테고리에 따른 공지사항 수
		public int CsNoticeBoardCountByCategory(Integer categoryid, Criteria cri) throws Exception{
			log.info("categoryid: " + categoryid);
			return csNoticeBoardRepository.CsNoticeBoardCountByCategory(categoryid, cri);
		}
		
		// 카테고리에 따른 공지사항 리스트 출력
		public List<CsNoticeBoard> CsNoticeBoardListByCategory(Integer categoryid, Criteria cri) throws Exception {
			List<CsNoticeBoard> result1 = csNoticeBoardRepository.CsNoticeBoardListByCategory(categoryid, cri);
			log.info("categoryid: " + categoryid);
			return result1;
		}

		
		// 공지사항 검색 수 (페이징)
		public int countNoticeSearchlist(Criteria cri) throws Exception {
			return csNoticeBoardRepository.countNoticeSearchlist(cri);
		}
		
		// 공지사항 검색 목록
		

// 1:1 문의	
		// 1:1 문의 리스트 출력
		public List<CsQnaBoard> CsQnaBoardListAll(Criteria cri) throws Exception{
			List<CsQnaBoard> result2 = csQnaBoardRepository.CsQnaBoardListAll(cri);
			return result2;
			}
			
		// 1:1 문의 특정 글 조회(글 번호 사용)
		public CsQnaBoard detailQnaBoard(Integer qbno) throws Exception{
			return csQnaBoardRepository.DetailQnaBoard(qbno);
		}

		// 페이징 처리 갯수 세팅(페이징)
		public int CsQnaBoardCount() throws Exception{
			return csQnaBoardRepository.CsQnaBoardCount();
		}

// FAQ		
		// FAQ 리스트 출력
		public List<CsFaqBoard> CsFaqBoardListAll(Criteria cri) throws Exception{
			List<CsFaqBoard> result3 = csFaqBoardRepository.CsFaqBoardListAll(cri);
			return result3;
			}
			
		// FAQ 특정 글 조회(글 번호 사용)
		public CsFaqBoard detailFaqBoard(Integer fbno) throws Exception{
			return csFaqBoardRepository.DetailFaqBoard(fbno);
		}

		// 페이징 처리 갯수 세팅(페이징)
		public int CsFaqBoardCount() throws Exception{
			return csFaqBoardRepository.CsFaqBoardCount();
		}
			
	 
	
}
