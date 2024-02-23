package com.project3.placestation.payment.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class CustomPaymentLoginPageException extends RuntimeException {
	
	// 상태코드
	private HttpStatus httpStatus;
	
	public CustomPaymentLoginPageException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}
	// 사용하는 시점에 활용가능
}