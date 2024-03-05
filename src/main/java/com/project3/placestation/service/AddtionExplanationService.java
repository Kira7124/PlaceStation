package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.repository.interfaces.AdditionExplanationRepository;
import com.project3.placestation.repository.entity.AdditionExplanation;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AddtionExplanationService {

	@Autowired
	AdditionExplanationRepository additionExplanationRepository;
	
	
	public List<AdditionExplanation> findAll() {
		return additionExplanationRepository.findAll();
	}
}
