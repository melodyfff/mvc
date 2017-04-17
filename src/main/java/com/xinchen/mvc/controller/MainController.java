package com.xinchen.mvc.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("security")
public class MainController {
	 protected static Logger logger = Logger.getLogger("controller");

	 /**
	  * 跳转到comminpage页面
	  * @return
	  */
	 @RequestMapping("common")
	 public  String getCommonPage(){
		 logger.debug("Received request to show common page");  
		
		 return "security/commonpage";
	 }
	 
	 /**
	  * 跳转到adminpage页面
	  * @return
	  */
	 @RequestMapping("admin")
	 public String getAdminPage(){
		 logger.debug("Received request to show admin page");
		 return "security/adminpage";
	 }
	 
	/* @RequestMapping("loginok")
	 public @ResponseBody String loginOk(){
		 System.out.println("login success"); 
		 UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
				    .getAuthentication()
				    .getPrincipal();
		 userDetails.getUsername();
		 return "success";
	 }
	
	 @RequestMapping("mypermission")
	 public @ResponseBody List<String> loadPermission(){
		 List<String> permission=new ArrayList<String>();
		 UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
				    .getAuthentication()
				    .getPrincipal();
		String username= userDetails.getUsername();
		if("admin".equals(username)){
			permission.add("index");
			permission.add("admin");
		}else{
			permission.add("index");
		}
		System.out.println(permission);
		 return permission;
	 } */
	 
}
