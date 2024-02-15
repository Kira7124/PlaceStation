package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.dto.Criteria;
import com.project3.placestation.repository.entity.User;

@Mapper
public interface UserRepository {
	
	
	//회원명단출력 (페이징처리)
	public List<User> listAll(Criteria cri) throws Exception;
	
	//회원숫자세기 (페이징처리)
	public int countUser() throws Exception;
	
	
}
