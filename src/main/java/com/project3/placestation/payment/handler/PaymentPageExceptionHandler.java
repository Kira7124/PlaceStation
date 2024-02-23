package com.project3.placestation.payment.handler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.project3.placestation.biz.handler.exception.CustomPageException;
import com.project3.placestation.payment.handler.exception.CustomPaymentPageException;


/**
 * View 렌더링을 위해 ModelView 객체를 반환 하도록 설정되어있다.
 * 예외처리 Page를 리턴 할 때 사용한다.
 */
@ControllerAdvice
public class PaymentPageExceptionHandler {
	
	// CustomPageException <-- 발생하면 이 함수를 동작시켜!
	@ExceptionHandler(CustomPaymentPageException.class)
	public ModelAndView handlerRuntimeException(CustomPageException e) {
		ModelAndView modelAndView = new ModelAndView("errorPage");
		modelAndView.addObject("statusCode", HttpStatus.NOT_FOUND.value());
		modelAndView.addObject("message", e.getMessage());
		return modelAndView; // 페이지 반환 + 데이터 내려줌
	}

}
