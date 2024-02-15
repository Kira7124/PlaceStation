package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.placestation.dto.Criteria;
import com.project3.placestation.repository.entity.User;
import com.project3.placestation.repository.interfaces.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	
	//회원정보리스트(페이징) 출력
	public List<User> listAll(Criteria cri) throws Exception{
		List<User> result = userRepository.listAll(cri);
		return result;

	} 
	
	//회원숫자세기(페이징)
	public int countUser() throws Exception{
		return userRepository.countUser();
	}
	
	
	
	
	
	
	
	
	
}
