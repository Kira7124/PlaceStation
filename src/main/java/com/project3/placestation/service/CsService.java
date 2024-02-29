package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.admin.dto.Criteria;
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


// 공지사항	
	// 공지사항 리스트 출력
	public List<CsNoticeBoard> CsNoticeBoardListAll(Criteria cri) throws Exception {
		List<CsNoticeBoard> result1 = csNoticeBoardRepository.CsNoticeBoardListAll(cri);
		return result1;
	}

	// 공지사항 특정 글 조회(글 번호 사용)
	public CsNoticeBoard detailNoticeBoard(Integer nbno) throws Exception {
		return csNoticeBoardRepository.DetailNoticeBoard(nbno);
	}

	// 페이징 처리 갯수 세팅(페이징)
	public int CsNoticeBoardCount() throws Exception {
		return csNoticeBoardRepository.CsNoticeBoardCount();
	}

//		//글 조회수 증가
//		public void updateReadCnt(Integer nbno) throws Exception{
//			CsNoticeBoardRepository.UpdateReadCnt(nbno);
//		}

	// 1:1 문의	
		// 1:1 문의 리스트 출력
		public List<CsQnaBoard> CsQnaBoardListAll(Criteria cri) throws Exception {
			List<CsQnaBoard> result2 = csQnaBoardRepository.CsQnaBoardListAll(cri);
			return result2;
		}
	
// 1:1 문의	
	// 1:1 문의 리스트 출력
	public List<CsQnaBoard> CsQnaBoardListByUserId(String search , int userId , Criteria cri) throws Exception {
		List<CsQnaBoard> result2 = csQnaBoardRepository.CsQnaBoardListByUserId(search , userId , cri);
		return result2;
	}

	// 1:1 문의 특정 글 조회(글 번호 사용)
	public CsQnaBoard detailQnaBoard(Integer qbno) throws Exception {
		return csQnaBoardRepository.DetailQnaBoard(qbno);
	}

	public int countCsQnaBoardListByUserId(String search , int userId , Criteria cri) throws Exception {
		int result = csQnaBoardRepository.countCsQnaBoardListByUserId(search , userId , cri);
		return result;
	}
	
	// 페이징 처리 갯수 세팅(페이징)
	public int CsQnaBoardCount() throws Exception {
		return csQnaBoardRepository.CsQnaBoardCount();
	}

// FAQ		
	// FAQ 리스트 출력
	public List<CsFaqBoard> CsFaqBoardListAll(Criteria cri) throws Exception {
		List<CsFaqBoard> result3 = csFaqBoardRepository.CsFaqBoardListAll(cri);
		return result3;
	}

	// FAQ 특정 글 조회(글 번호 사용)
	public CsFaqBoard detailFaqBoard(Integer fbno) throws Exception {
		return csFaqBoardRepository.DetailFaqBoard(fbno);
	}

	// 페이징 처리 갯수 세팅(페이징)
	public int CsFaqBoardCount() throws Exception {
		return csFaqBoardRepository.CsFaqBoardCount();
	}


}
