package com.project3.placestation.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.project3.placestation.service.MemberService;

@Controller
public class mailController {
    @Autowired
    private MemberService service;


    
    
    
    
    @GetMapping("/mail/sendMail")
    public String sendEamil(){

        String to = "jyj0298@naver.com";
        String subject = "Test Email with Attachment";
        String text = "Hello! This is a test email with an attachment. 걍 메일 테스트임";

        try {
            service.sendEmail(to, subject, text);
            return "";
        } catch (Exception e) {
            return "Error sending email: " + e.getMessage();
        }

    }
}
