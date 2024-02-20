package com.project3.placestation.member.dto;

import java.sql.Timestamp;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
public class memberDTO {

	private int userNo;
	@NotBlank(message = "아이디를 입력해 주세요", groups= NotBlank.class)
	@Pattern(regexp = "/^[A-Za-z0-9]$/;", message="아이디는 영어와 숫자로 작성해 주세요",groups = Pattern.class)
	@Size(min = 5, max =15, message = "아이디는 최소 5자 최대 15자 까지 작성 가능합니다.", groups = Size.class)
	private String userId;
	@NotBlank(message = "비밀번호를 입력해 주세요", groups= NotBlank.class)
	@Pattern(regexp = "/^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;", message="비밀 번호는 영어,숫자,특수 문자를 포함한 8~20자리로 작성해 주세요",groups = Pattern.class)
	private String userPassword;
	private String userAddress;
	@NotBlank(message = "이름을 입력해 주세요", groups= NotBlank.class)
	@Pattern(regexp = "/^[가-힣]*$/;", message="이름은 한글로 작성해 주세요",groups = Pattern.class)
	@Size(min = 2, max =20, message = "이름은 2자 이상 작성해야 합니다.", groups = Size.class)
	private String userName;
	@NotBlank(message = "전화 번호를 입력해 주세요", groups= NotBlank.class)
	@Pattern(regexp = "/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;", message="전화 번호형식에 어긋 납니다",groups = Pattern.class)
	private String userHp;
	@NotBlank(message = "이메일을 입력해 주세요", groups= NotBlank.class)
	@Pattern(regexp = "/([\\w-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([\\w-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$/;", message="이메일을 형식에 맞게 입력해 주세요",groups = Pattern.class)
	private String userEmail;
	private String grade;
	private int userPoin;
	private Timestamp joinAt;
	private Timestamp outAt;
	private String outYn;
	private String filePath;
	private String userOauth;
	
}