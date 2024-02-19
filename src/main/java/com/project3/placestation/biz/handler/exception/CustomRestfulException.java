package com.project3.placestation.biz.handler.exception;

import org.springframework.http.HttpStatus;

public class CustomRestfulException extends RuntimeException {
	
	private HttpStatus httpStatus;
	
	public CustomRestfulException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}

}
