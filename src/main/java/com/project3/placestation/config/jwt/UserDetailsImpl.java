package com.project3.placestation.config.jwt;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.project3.placestation.repository.entity.Member;

//아래 @Override 이 부분이 인터페이스에서 정의한 함수로
//email 은 개발자가 추가한 정보이고,
//나머지 속성은 Spring Security에서 제공한 속성/함수 정보임
public class UserDetailsImpl implements UserDetails {

	private static final long serialVersionUID = 1L;
	
	private int userNo;
	
	private String name; // Spring Security

	// json 역직렬화 시 대상 속성 무시
	@JsonIgnore
	private String password; // Spring Security
	
	// 계정이 갖고 있는 권한 목록을 저장하는 속성
	private GrantedAuthority authority; // Spring Security

	// 개발자 추가 속성
	private String userId; 
	private String email; 
	private String userAddress; 
	private String userName; 
	private String userHp; 
	private String userEmail; 
	private String grade; 
	private int userPoin; 
	private Timestamp joinAt; 
	private String gender; 
	private String userOauth; 
	private String userRole; 




	public UserDetailsImpl(Integer userno, String userid, String userpassword, String username, String useremail,
			String useraddress, String userhp, Integer userpoint, String userrole, String gender, String grade,
			String oauth, Timestamp timestamp, GrantedAuthority authority) {
		this.userNo = userno;
		this.userId = userid;
		this.password = userpassword;
		this.userName = username;
		this.userEmail = useremail;
		this.userAddress = useraddress;
		this.userHp = userhp;
		this.userPoin = userpoint;
		this.userRole = userrole;
		this.gender = gender;
		this.grade = grade;
		this.userOauth = oauth;
		this.authority = authority;
		this.name = username;
		this.email = username;
		this.joinAt = timestamp;
	}


	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserHp() {
		return userHp;
	}

	public void setUserHp(String userHp) {
		this.userHp = userHp;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getUserPoin() {
		return userPoin;
	}

	public void setUserPoin(int userPoin) {
		this.userPoin = userPoin;
	}

	public Timestamp getJoinAt() {
		return joinAt;
	}

	public void setJoinAt(Timestamp joinAt) {
		this.joinAt = joinAt;
	}


	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUserOauth() {
		return userOauth;
	}

	public void setUserOauth(String userOauth) {
		this.userOauth = userOauth;
	}

	public static UserDetailsImpl build(Member user) {
// role.getName().name() : 롤 정보 ( ROLE_USER 등 )
// 권한 생성은 : new SimpleGrantedAuthority(권한문자열) 생성자를 호출 해서 생성
		GrantedAuthority authority = new SimpleGrantedAuthority(user.getUserrole());

        return new UserDetailsImpl(
        		user.getUserno(),
                user.getUserid(),
        		user.getUserpassword(),
                user.getUsername(),
                user.getUseremail(),
                user.getUseraddress(),
                user.getUserhp(),
                user.getUserpoint(),
                user.getUserrole(),
                user.getGender(),
                user.getGrade(),
                user.getOauth(),
                user.getJoinat(),
                authority);
    }
// 권한을 스프링 시큐리티의 권한 배열로 만들기
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {

		Set<GrantedAuthority> set = new HashSet<>();

		set.add(authority);

		return set;
	}

	// 계정이 갖고 있는 권한을 리턴하는 함수
	public GrantedAuthority getAuthority() {
		return authority;
	}

	public String getEmail() {
		return email;
	}

	@Override
	public String getPassword() {
		return password;
	}

	// 계정의 이름를 리턴 (주로 로그인 ID가 사용됨)
	@Override
	public String getUsername() {
		return name;
	}
	
	public int getUserNo() {
		return userNo;
	}

	
	// ===============

	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	// 계정이 만료되지 않았는지를 리턴( true 이면 만료되지 않았음을 의미 )
//아래는 만료 체크가 필요없어서 항상 true 를 리턴하게 되어 있음
//만약 필요하다면 DB에서 만료여부 컬럼을 관리하고 그 정보를 쿼리해서 사용하면 됨
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	// 계정이 잠겨있지 않은지를 리턴( true 이면 잠겨있지 않음을 의미 )
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	// 계정의 패스워드(Credential) 가 만료되지 않는지를 리턴( true 이면 패스워드가 만료되지 않음을 의미 )
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	// 계정이 사용 가능한 계정인지를 리턴( true 이면 사용 가능한 계정을 의미 )
	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		UserDetailsImpl userDto = (UserDetailsImpl) o;
		return Objects.equals(email, userDto.email);
	}


	@Override
	public String toString() {
		return "UserDetailsImpl [userNo=" + userNo + ", name=" + name + ", password=" + password + ", authority="
				+ authority + ", userId=" + userId + ", email=" + email + ", userAddress=" + userAddress + ", userName="
				+ userName + ", userHp=" + userHp + ", userEmail=" + userEmail + ", grade=" + grade + ", userPoin="
				+ userPoin + ", joinAt=" + joinAt + ", gender=" + gender + ", userOauth=" + userOauth + ", userRole="
				+ userRole + "]";
	}

	

}