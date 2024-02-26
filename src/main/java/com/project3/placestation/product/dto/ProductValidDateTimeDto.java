package com.project3.placestation.product.dto;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ProductValidDateTimeDto {

	public int[] conversionTime(String onclickDate , List<ProductInvalidDateDto> list) {

		 // 구매일과 일치하는 요소만 필터링하여 리스트로 반환
	    List<ProductInvalidDateDto> conversionList = list.stream()
	                                          .filter(e -> e.getPurchaseDate().equals(onclickDate))
	                                          .collect(Collectors.toList());
	    

	    // 일치 확인 또는 리턴
	    if(conversionList.isEmpty()) {
	    	return null;
	    }
	    
	    String strTime = "";
	    
	    // 시간 뽑아내기
	    for(ProductInvalidDateDto dto : conversionList) {	
	    	for(int i = dto.getStartTime(); i <= dto.getEndTime(); i++) {
	    		strTime += i + ",";
	    	}
	    }
	    
	    // 배열로 교체
	    String[] strArrayTime = strTime.split(",");
	    
        // String 배열을 int 배열로 변환하여 반환
        int[] timeArray = new int[strArrayTime.length];
        for (int i = 0; i < strArrayTime.length; i++) {
        	// strArrayTime 의 주소값을 복사(얇은 복사)
        	timeArray[i] = Integer.parseInt(strArrayTime[i]);
        }
        
        Arrays.sort(timeArray);

        log.info(Arrays.toString(timeArray));
        // 리턴
        return timeArray;
 	}
		
}
