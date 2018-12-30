package cn.hungry.service;

import java.util.List;

import cn.hungry.pojo.User;

public interface UserService {
	
	List<User> list();
	
	void sendSMS(String phone);
	
	User get(int id);
	
	User checkLogin(User user);
	
	int toRegister(User user);
	
	User checkExisPhone(String phone);
	
	boolean updateUsername(User user);
	
	boolean updatePassword(User user);
}
