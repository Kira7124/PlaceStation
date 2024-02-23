package com.project3.placestation.member.dto;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;


@Data
public class CustomUserDetails implements UserDetails{
	
	
	private memberDTO dto;
	
	public CustomUserDetails(memberDTO dto) {
		
		this.dto = dto;
	}
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	
	// 사용자의 권한을 리턴
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> collection = new ArrayList<>();
		
		collection.add(new GrantedAuthority() {
			
			@Override
			public String getAuthority() {

				return dto.getRole();
			}
		});
		
		return null;
	}

	@Override
	public String getPassword() {

		System.out.println("커스텀유저 클래스 패스워드 함수호출"+dto.getUserPassword());
		
		return dto.getUserPassword();
	}

	@Override
	public String getUsername() {

		System.out.println("커스텀유저 클래스 유저네임 함수호출"+dto.getUserId());
		
		return dto.getUserId();
	}

	// 이 부분을 구현 할거면 db에 만료 여부를 정하는 컬럼을 만들어 체크 해야함 아마 트루 펄스 값 만들어서 if값으로 return 분기 하는듯
	
	@Override
	public boolean isAccountNonExpired() {

		return true;
	}

	@Override
	public boolean isAccountNonLocked() {

		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {

		return true;
	}

	@Override
	public boolean isEnabled() {

		return true;
	}

}
