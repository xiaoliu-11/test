package com.znzz.service;

import java.util.List;


import com.znzz.pojo.User;

public interface UserService {
      List<User> list();
    void delete(User u);
      void add(User u);
     void update(User u);
     User get(int id);
     
     
     public List<User> getAllUserByPage(Integer startRecord,Integer pageSize,String name,String phone);
 	
 	public int userCount(String name,String phone);
 	
    public User checkLogin(String phone, String password);
}
