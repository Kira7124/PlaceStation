package com.project3.placestation.payment.handler.exception;

import org.springframework.http.HttpStatus;

public class CustomPaymentRestfulException extends RuntimeException {
	
	private HttpStatus httpStatus;
	
	public CustomPaymentRestfulException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}

}
