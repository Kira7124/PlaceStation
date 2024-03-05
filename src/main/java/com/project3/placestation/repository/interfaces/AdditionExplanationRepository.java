package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.repository.entity.AdditionExplanation;

@Mapper
public interface AdditionExplanationRepository {

	public List<AdditionExplanation> findAll();
}
