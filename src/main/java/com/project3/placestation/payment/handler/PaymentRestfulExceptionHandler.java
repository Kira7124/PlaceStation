package com.project3.placestation.payment.handler;

import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.payment.handler.exception.CustomPaymentRestfulException;


@Order(1)
@RestControllerAdvice
public class PaymentRestfulExceptionHandler {
	
	// 모든 예외 클래스 설정 
	@ExceptionHandler(Exception.class)
	public void exception(Exception e) {
		System.out.println("--------------");
		System.out.println(e.getClass().getName());
		System.out.println(e.getMessage());
		System.out.println("--------------");
	}
	
	@ExceptionHandler(CustomPaymentRestfulException.class)
	public String basicException(CustomPaymentRestfulException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('" + e.getMessage() + "');");
		sb.append("window.history.back();");	// 뒤로가기
		sb.append("</script>");
		return sb.toString();
	}
	
}