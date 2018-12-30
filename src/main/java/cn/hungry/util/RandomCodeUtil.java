package cn.hungry.util;

public class RandomCodeUtil {	
	private String randomCode = (int)((Math.random()*9+1)*100000)+"";
	public static String code;
	public String getRandomCode() {
		return randomCode;
	}
	
}
