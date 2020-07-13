package com.znzz.userserviceipml;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.znzz.mapper.UserMapper;

import com.znzz.pojo.User;
import com.znzz.service.UserService;
import com.znzz.util.Pager;

@Service
public class UserSerivceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	public List<User> list() {
		// TODO Auto-generated method stub
		return userMapper.list();
	}
	
	  
	  public void delete(User u) {
		  // TODO Auto-generated method stub
	  userMapper.delete(u.getId()); 
	  }
	  
	  public void add(User u) {
	  
	  userMapper.add(u); 
	  }
	  
	  public void update(User u) {
	  
	  userMapper.update(u); 
	  }
	  
	  public User get(int id) {
	  
	  return userMapper.get(id); 
	  
	  }


	public List<User> getAllUserByPage(Integer startRecord, Integer pageSize, String name, String phone) {
		// TODO Auto-generated method stub
		return userMapper.getAllUserByPage(startRecord, pageSize, name, phone);
	}


	public int userCount(String name, String phone) {
		// TODO Auto-generated method stub
		return userMapper.userCount(name, phone);
	}


	public User checkLogin(String phone, String password) {
		// TODO Auto-generated method stub
		User  user = userMapper.getUserByPhone(phone);
		if(user != null && password.equals(user.getPassword())) {
			return user;
	 	}
		   return null;
		
		
	}


	


}
