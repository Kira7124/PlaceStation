package com.project3.placestation.config.jwt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.repository.entity.Member;
import com.project3.placestation.repository.interfaces.MemberRepository;

//유저 인증을 위한 클래스
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
@Autowired
MemberRepository userRepository;

//유저 인증을 위한 함수
//DB에 있는 지 확인해서 있으면 UserDetailsImpl 로 UserDto 객체 생성
@Override
@Transactional
public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
 //  유저 인증을 위한 함수 ( DB 확인 ) : 기본키 (이메일)
 Member user = userRepository.selectByIsUserId(id);
 
  System.out.println("DB를 확인합니다. : "  + user.toString());
 // 이메일로 유저 정보가 없을 때 처리되는 에러 처리
//     .orElseThrow(() -> new UsernameNotFoundException("User Not Found with email: " + email));

 //  DB에 있는 지 확인해서 있으면 UserDetailsImpl 로 User 객체 생성
 return UserDetailsImpl.build(user);
}

}