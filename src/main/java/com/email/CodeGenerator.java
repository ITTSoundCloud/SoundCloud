package com.email;

import java.security.SecureRandom;

public class CodeGenerator {
	
	private static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	private static SecureRandom rnd = new SecureRandom();
	private static final int LEN =  5;
	
	public static String createCode(){
	   StringBuilder sb = new StringBuilder(LEN);
	   for( int i = 0; i < LEN; i++ ) 
	      sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
	   return sb.toString();
	}
}
