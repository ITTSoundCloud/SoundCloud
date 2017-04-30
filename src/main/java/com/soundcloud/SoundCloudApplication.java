package com.soundcloud;

import java.util.Arrays;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.model.Countries;
import com.validators.PasswordValidator;

@SpringBootApplication
public class SoundCloudApplication {

	public static void main(String[] args) {
		SpringApplication.run(SoundCloudApplication.class, args);

		
	}
	
	public static String countriesToString() {
	    return Stream.of(Countries.values()).
	                map(Countries::name).
	                collect(Collectors.joining(" "));
	}
}
