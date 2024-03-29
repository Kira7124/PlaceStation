package com.project3.placestation.config.jwt;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.project3.placestation.config.oauth2.SessionUser;
import com.project3.placestation.repository.entity.Member;

import lombok.extern.log4j.Log4j2;

//아래 @Override 이 부분이 인터페이스에서 정의한 함수로
//email 은 개발자가 추가한 정보이고,
//나머지 속성은 Spring Security에서 제공한 속성/함수 정보임
@Log4j2
public class UserDetailsImpl implements UserDetails, OAuth2User {

	private static final long serialVersionUID = 1L;
	
	//private final Oauth2Response oauth2Response;
	
	private int userno;
	
	private String name; // Spring Security

	// json 역직렬화 시 대상 속성 무시
	@JsonIgnore
	private String password; // Spring Security
	
	private Member member
	;
	private Map<String, Object> attributes;
	
	private boolean isOAuthUser;
	
	// 계정이 갖고 있는 권한 목록을 저장하는 속성
	private GrantedAuthority authority; // Spring Security

	// 개발자 추가 속성
	private String userid; 
	private String email; 
	private String useraddress; 
	private String username; 
	private String userhp; 
	private String useremail; 
	private String grade; 
	private int userpoin; 
	private Timestamp joinat; 
	private String gender; 
	private String oauth; 
	private String userrole; 
	private String filePath;


	public UserDetailsImpl() {
		
	};

	public UserDetailsImpl(Integer userno, String userid, String userpassword, String username, String useremail,
			String useraddress, String userhp, Integer userpoint, String userrole, String gender, String grade,
			String oauth, Timestamp timestamp, String filePath,  GrantedAuthority authority) {
		this.userno = userno;
		this.userid = userid;
		this.password = userpassword;
		this.username = username;
		this.useremail = useremail;
		this.useraddress = useraddress;
		this.userhp = userhp;
		this.userpoin = userpoint;
		this.userrole = userrole;
		this.gender = gender;
		this.grade = grade;
		this.oauth = oauth;
		this.authority = authority;
		this.name = username;
		this.email = username;
		this.joinat = timestamp;
		this.filePath = filePath;
		
		
		this.isOAuthUser = false;
	}


	public String getUserAddress() {
		return useraddress;
	}

	public void setUserAddress(String userAddress) {
		this.useraddress = userAddress;
	}

	public String getUserName() {
		return username;
	}

	public void setUserName(String userName) {
		this.username = userName;
	}

	public String getUserHp() {
		return userhp;
	}

	public void setUserHp(String userHp) {
		this.userhp = userHp;
	}

	public String getUserEmail() {
		return useremail;
	}

	public void setUserEmail(String userEmail) {
		this.useremail = userEmail;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getUserPoin() {
		return userpoin;
	}

	public void setUserPoin(int userPoin) {
		this.userpoin = userPoin;
	}

	public Timestamp getJoinAt() {
		return joinat;
	}

	public void setJoinAt(Timestamp joinAt) {
		this.joinat = joinAt;
	}


	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUserOauth() {
		return oauth;
	}

	public void setUserOauth(String userOauth) {
		this.oauth = userOauth;
	}

	public static UserDetailsImpl build(Member user) {
// role.getName().name() : 롤 정보 ( ROLE_USER 등 )
// 권한 생성은 : new SimpleGrantedAuthority(권한문자열) 생성자를 호출 해서 생성
		log.info("유저 디테일 메서드에서 유저 권한 호출:!!!!!!!!!!!!!!!!!!!!!!!!"+ user.getUserrole());
		GrantedAuthority authority = new SimpleGrantedAuthority(user.getUserrole());

		System.out.println("유저 디테일 서비스 빌드 메서드 호출: " + user.getUserrole());
		
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
                user.getFilepath(),
                authority);
    }
// 권한을 스프링 시큐리티의 권한 배열로 만들기
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {

		
		 List<GrantedAuthority> authorities = new ArrayList<>(); 
		 if(!isOAuthUser) { 
		 // 일반 로그인
		 authorities.add(authority);
		 
		 }else { // 소셜 로그인
		 authorities.add(new GrantedAuthority() {
		 
		 @Override public String getAuthority() { 
			 
			 return member.getUserrole(); } 
		 	}); 
		 }
		 
		 return authorities;
		 
		
 	/*	Set<GrantedAuthority> set = new HashSet<>();
		
		set.add(authority);
		set.add(attributes.set권한);
		 return set;
		*/
		
/*
 * Collection<GrantedAuthority> collection = new ArrayList<>();
 * 
 * collection.add(new GrantedAuthority() {
 * 
 * @Override public String getAuthority() { // TODO Auto-generated method stub
 * log.info("유저 임플리 겟 어소리티 로그%%%%%%%%%%%%: "+authority.getAuthority()); return
 * authority.getAuthority(); } });
 * return collection;
 */

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
		return userno;
	}

	
	// ===============

	public String getUserId() {
		return userid;
	}


	public void setUserId(String userId) {
		this.userid = userId;
	}
	
	public String getFilePath() {
		return this.filePath;
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
		
		/*
		 * // 탈퇴된 계정 if(member.getOutyn() != null || member.getOutyn() > 1) { return
		 * false; }
		 */
		
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

	/*
	 * @Override public boolean equals(Object o) { if (this == o) return true; if (o
	 * == null || getClass() != o.getClass()) return false; UserDetailsImpl userDto
	 * = (UserDetailsImpl) o; return Objects.equals(email, userDto.email); }
	 */


	@Override
	public String toString() {
		return "UserDetailsImpl [userno=" + userno + ", name=" + name + ", password=" + password + ", authority="
				+ authority + ", userid=" + userid + ", email=" + email + ", useraddress=" + useraddress + ", username="
				+ username + ", userhp=" + userhp + ", useremail=" + useremail + ", grade=" + grade + ", userpoin="
				+ userpoin + ", joinat=" + joinat + ", gender=" + gender + ", oauth=" + oauth + ", userrole="
				+ userrole + "]";
	}

	
	
	



	// OAuth2 로그인 생성자
    public UserDetailsImpl(Member member, Map<String, Object> attributes, boolean isOAuthUser) {
        this.member = member;
        this.attributes = attributes;
        this.isOAuthUser = true;
    }
    
	// OAuth2 사용자의 속성
	@Override
	public Map<String, Object> getAttributes() {
		// TODO Auto-generated method stub
		return attributes;
	}
	
	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return member.getUsername();
	}
	
 
}