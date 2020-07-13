package com.znzz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.znzz.pojo.User;
import com.znzz.service.UserService;
import com.znzz.util.Pager;

@Controller
public class UserController {
	@Autowired
	 UserService userService;
	 private Pager pager;
	private User user;
	
	
	  @RequestMapping("addUserSucc") 
	  public ModelAndView addUser(User user ) {
	     userService.add(user); 
	  ModelAndView mav = new ModelAndView("redirect:/listUser");
	  return mav; 
	  }
	 
	
	@RequestMapping("addUser")
	public String addUser() {
		return "addUser";
	}
	
	@RequestMapping("editUser")
	public ModelAndView editCategory(User user){
		User c= userService.get(user.getId());
		ModelAndView mav = new ModelAndView("editUser");
		mav.addObject("c", c);
		return mav;
	}	
	
	 @RequestMapping("updateUser") 
	  public ModelAndView updateUser(User user ) {
	     userService.update(user); 
	  ModelAndView mav = new ModelAndView("redirect:/listUser");
	  return mav; 
	  }
	 
	 @RequestMapping("deleteUser") 
	  public ModelAndView deleteUser(User user ) {
	     userService.delete(user);
	  ModelAndView mav = new ModelAndView("redirect:/listUser");
	  return mav; 
	  }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	
	 @RequestMapping("listUser")
		public ModelAndView listUser(ModelAndView mav,User user, Pager pager,HttpServletRequest request ) {
		 if (pager == null) {
				pager = new Pager();
			}
		 
		 pager.setTotal(userService.userCount(user.getName(), user.getPhone()));
			List<User> findAll = userService.getAllUserByPage(
					pager.getStartRecord(), pager.getPageSize(),
					user.getName(), user.getPhone());
			mav.addObject("user",user);
			request.setAttribute("userList", findAll);
			request.setAttribute("pager", pager);
			mav.setViewName("listUser");
			return mav;
		
		}
	 
	 public Pager getPager() {
			return pager;
		}

		public void setPager(Pager pager) {
			this.pager = pager;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		
		
		
		
		
		@RequestMapping(value = "/login")
		public ModelAndView login(ModelAndView mav) {
		 mav.setViewName("/login");
			return mav;
		}
		
		//用户注册验证
		@RequestMapping("/validateUser")
	    public void validateUser(HttpServletRequest request,
	            HttpServletResponse response) throws Exception {
			String phone = request.getParameter("phone");

	        // 2.调用service层判断用户名是否存在

	        // 期望服务器响应回的数据格式：
	        // {"userExsit":true,"msg":"此用户名太受欢迎,请更换一个"}
	        // {"userExsit":false,"msg":"用户名可用"}

	        // 设置响应的数据格式为json
	        response.setContentType("application/json;charset=utf-8");
	        Map<String,Object> map = new HashMap<String,Object>();
	        if("1111111".equals(phone)){
	            // 存在
	            map.put("userExsit",true);
	            map.put("msg","此用户名太受欢迎,请更换一个");
	        }else{
	            // 不存在
	            map.put("userExsit",false);
	            map.put("msg","∨");
	        }

	        //将map转为json，并且传递给客户端
	        ObjectMapper mapper = new ObjectMapper();
	        mapper.writeValue(response.getWriter(),map);
		          
		}
		
		
		
          //登录验证
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView Login(ModelAndView model, String phone,
				String password, HttpServletRequest request, HttpSession session,HttpServletResponse response ) throws Exception{
			User user = userService.checkLogin(phone, password);
			 
			if (user != null) {
//				model.addObject("msg", "suc");
//				session.setAttribute("user", user);
//				
				model.setViewName("/success");
				return model;
				
			} else {
			//model.addObject("msg", "error");
			model.setViewName("/error");		
//				  Map<String, Object> map = new HashMap<>();
//				  map.put("code", 1);
//		          map.put("errorInfo","登录失败，请重新登录");
//		          //将map转为json，并且传递给客户端
//		          ObjectMapper mapper = new ObjectMapper();
//		          mapper.writeValue(response.getWriter(),map);
			}
			return model;
		}

		
}
