package com.project3.placestation.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ExchangeService <T>{

	public String exchangeToStringFromList(List<T> list) {
		String str = "";
		for(T i : list) {
			str += i + ",";
		}
		str = str.substring(0, str.length() - 1); // 마지막 , 제거
		
		return str;
	}
	
	public String[] exchangeToArrayFromString(String str) {
		
		String[] array = {};
		
		if(str == null || str.isEmpty()) {
			return array;
		}
		
		return str.split(",");
	}
}
