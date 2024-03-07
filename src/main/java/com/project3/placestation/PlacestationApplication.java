package com.project3.placestation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;


@SpringBootApplication(exclude = {ErrorMvcAutoConfiguration.class})
public class PlacestationApplication {

	public static void main(String[] args) {
		SpringApplication.run(PlacestationApplication.class, args);
	}
}