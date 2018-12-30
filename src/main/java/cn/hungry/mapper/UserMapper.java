package cn.hungry.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cn.hungry.pojo.User;

@Mapper
public interface UserMapper {
	List<User> list();
	
	User checkLogin(User user);
	
	int toRegister(User user);
	
	User checkExisPhone(String phone);
	
	User get(int id);
	
	boolean updateUsername(User user);
	
	boolean updatePassword(User user);

}
