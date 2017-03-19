package com.xinchen.mvc.controller;

/**
 * Created by wow on 2016/11/20.
 */
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
    protected static Logger logger = Logger.getLogger("controller");

    /**
     * 跳转到comminpage页面
     * @return
     */
    @RequestMapping("/security/common")
    public  String getCommonPage(){
        logger.debug("Received request to show common page");

        return "security/commonpage";
    }

    /**
     * 跳转到adminpage页面
     * @return
     */
    @RequestMapping("/security/admin")
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
