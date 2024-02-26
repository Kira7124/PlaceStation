package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.repository.entity.Grade;
import com.project3.placestation.repository.interfaces.GradeRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class GradeService {

	@Autowired
	GradeRepository gradeRepository;
	
	/**
	 * grade 이름 컬럼으로 모든 데이터 찾기
	 * @param grade
	 * @return
	 */
	public Grade findByGradeName(String grade) {
		return gradeRepository.findByGradeName(grade.toString());
	}
	
	/**
	 * 전체 조회
	 * @return
	 */
	public List<Grade> findAll() {
		return gradeRepository.findAll();
	}
}
