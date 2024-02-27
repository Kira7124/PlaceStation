package com.project3.placestation.payment.model.dto;

import java.util.LinkedHashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PaymentTokenDto {
    public Integer code;
    public Object message;
    public ResponseToken response;
    private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();
}