package com.project3.placestation.main.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {

    private static final String ERROR_PATH = "/error";

    @RequestMapping(ERROR_PATH)
    public String handleError() {
        // 에러 페이지 처리 로직을 구현합니다.
        return "error/error"; // 에러 페이지의 뷰 이름을 반환합니다.
    }

    public String getErrorPath() {
        return ERROR_PATH;
    }
}