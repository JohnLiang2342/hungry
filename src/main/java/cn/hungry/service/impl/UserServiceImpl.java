package cn.hungry.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hungry.mapper.UserMapper;
import cn.hungry.miaodiyun.AccountInfo;
import cn.hungry.miaodiyun.IndustrySMS;
import cn.hungry.pojo.User;
import cn.hungry.service.UserService;
import cn.hungry.util.RandomCodeUtil;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper userMapper;

	@Override
	public void sendSMS(String phone) {
		RandomCodeUtil randomCode = new RandomCodeUtil();
		RandomCodeUtil.code = randomCode.getRandomCode();
		// 获取开发者账号信息
		AccountInfo.execute();
		// 验证码通知短信接口
		IndustrySMS.execute(phone,RandomCodeUtil.code);
		
	}

	@Override
	public User checkLogin(User user) {
		
		return userMapper.checkLogin(user);
	}

	@Override
	public int toRegister(User user) {		
		return userMapper.toRegister(user);
	}

	@Override
	public User get(int id) {
		// TODO Auto-generated method stub
		return userMapper.get(id);
	}

	@Override
	public User checkExisPhone(String phone) {
		return userMapper.checkExisPhone(phone);
	}

	@Override
	public boolean updateUsername(User user) {
		return userMapper.updateUsername(user);
	}

	@Override
	public boolean updatePassword(User user) {
		return userMapper.updatePassword(user);
	}

	@Override
	public List<User> list() {
		return userMapper.list();
	}

}
