package com.project3.placestation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.member.dto.noticeBoardDTO;
import com.project3.placestation.repository.interfaces.CsBoardRepository;

@Service
public class CsService {
	
	@Autowired
	private CsBoardRepository csBoardRepository;
	
//	 // notice CRUD 시작
//	public void insertNotice(noticeBoardDTO dto) {
//		return CsBoardRepository.insertNotice(dto);
//		
//	}
//	public void selectNotices() {
//		
//	}
//
//	public void updateNotice() {
//		
//	}
//	public void deleteNotice() {
//		
//	}
//	// CRUD 끝
	

}
