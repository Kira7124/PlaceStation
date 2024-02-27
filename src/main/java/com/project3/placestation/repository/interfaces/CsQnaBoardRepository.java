package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.CsNoticeBoard;
import com.project3.placestation.repository.entity.CsQnaBoard;

@Mapper
public interface CsQnaBoardRepository {

	// 1:1 문의 리스트 출력
	public List<CsQnaBoard> CsQnaBoardListAll();
}
