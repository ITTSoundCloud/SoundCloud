package com.soundcloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.validators.PasswordValidator;

@SpringBootApplication
public class SoundCloudApplication {

	public static void main(String[] args) {
		SpringApplication.run(SoundCloudApplication.class, args);

		
	}
}
