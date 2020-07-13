package com.znzz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.znzz.pojo.User;

public interface UserMapper {
	
  public List<User> list();//查询所有用户.
  
  public void delete(int id );//根据id删除用户.
   
  public int update(User user );//根据user修改用户。
  
  public int add(User user );//增加用户.
  
  public User get(int id );
  
  public List<User> getAllUserByPage(
			@Param(value = "startRecord") Integer startRecord,
			@Param(value = "pageSize") Integer pageSize,
			@Param(value = "name") String name,
			@Param(value = "phone") String phone);
  
  
  public int userCount(@Param(value = "name") String name, 
			@Param(value = "phone") String phone);

  
  public User getUserByPhone(String phone);
}
