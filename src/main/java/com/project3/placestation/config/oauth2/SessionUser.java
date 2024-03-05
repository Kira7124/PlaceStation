package com.project3.placestation.config.oauth2;

import java.io.Serializable;

import com.project3.placestation.repository.entity.Member;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class SessionUser implements Serializable{
	private String name;
    private String email;
    private String username;
    private String password;
    private String role;
    
    public SessionUser(Member user) {
        this.name = user.getUserid();
        this.email = user.getUseremail();
        this.username = user.getUsername();
        this.role = user.getUserrole();
        this.password = "";
    }
}
