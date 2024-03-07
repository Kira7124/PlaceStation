package com.project3.placestation.config.error;

import java.util.Arrays;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.resource.NoResourceFoundException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class CustomErrorController implements ErrorController {

	private static final String ERROR_PATH = "/error";
	private static final String ERROR_PAGE_PATH = "error/error";

	@GetMapping("/error")
	
	public String handleError(HttpServletRequest request, Model model) {

		// 에러 코드를 획득한다.
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

		// 에러 코드에 대한 상태 정보
		HttpStatus httpStatus = HttpStatus.valueOf(Integer.valueOf(status.toString()));

		if (status != null) {
		
			// HttpStatus와 비교해 페이지 분기를 나누기 위한 변수
			int statusCode = Integer.valueOf(status.toString());

			String strStatusCode = String.valueOf(statusCode);
			int[] array = new int[strStatusCode.length()];

			for (int i = 0; i < strStatusCode.length(); i++) {
				char c = strStatusCode.charAt(i);
				array[i] = Character.getNumericValue(c);
			}

			log.info("배열 : " + Arrays.toString(array));
			model.addAttribute("code", statusCode);
		} else {
			model.addAttribute("code", 404);
		}

		// 에러 페이지 처리 로직을 구현합니다.
		return ERROR_PAGE_PATH; // 에러 페이지의 뷰 이름을 반환합니다.
	}
	


	public String getErrorPath() {
		return ERROR_PATH;
	}
}