package common;

import org.apache.commons.lang3.RandomStringUtils;
import org.mindrot.jbcrypt.BCrypt;


public class Password {
	
	//Tao mat khau duoc ma hoa
	public String createPass(String password) {
		int workload = 12;
		String salt = BCrypt.gensalt(workload);
		String hashPass = BCrypt.hashpw(password, salt);
		
		return hashPass;
	}
	
	//Kiem tra mat khau nhap vao va mat khau da ma hoa trong database
	public boolean checkPass(String password, String hashed) {
		return BCrypt.checkpw(password, hashed);
	}
	
	//Reset password nguoi dung
	public String resetPass() {
		final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		int len = 8;
		return RandomStringUtils.random(len, chars);
	}
	
}
