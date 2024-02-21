package com.project3.placestation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project3.placestation.member.dto.CustomUserDetails;
import com.project3.placestation.member.dto.memberDTO;
import com.project3.placestation.repository.interfaces.MemberRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private MemberRepository repository;
	
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		memberDTO dto = repository.selectUser(username);
		
		// 아이디가 있다면 dto라는 객체 데이터를 아이디가 없다면 null을 리턴 한다.
		
		if(dto != null) {
			
			return new CustomUserDetails(dto);
		}
		
		
		return null;
	}

	
	
	
}
