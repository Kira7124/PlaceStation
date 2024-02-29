package com.project3.placestation.payment.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentFortOneKeyDto {
	private String impUid;
	private String impKey;
	private String impSecret;
}
