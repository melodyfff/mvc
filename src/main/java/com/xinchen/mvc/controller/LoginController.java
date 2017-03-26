package com.xinchen.mvc.controller;

import com.xinchen.mvc.model.XRole;
import com.xinchen.mvc.model.XUser;
import com.xinchen.mvc.service.UserService;
import com.xinchen.mvc.utils.MD5Utils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/20 19:32.
 * @see 2017/3/20 19:32 Created
 ****************************************/
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserService userService;


    @RequestMapping("/main")
    public String forwardLogin() {
        return "user/login";
    }

    @RequestMapping("/forwardMain")
    public ModelAndView forwardMain(@Param("userName") String userName, @Param("passWord") String passWord) {
        XUser user = userService.queryByuserName(userName);
        XRole role = new XRole();

        if (null != user && user.getPassword().equals(MD5Utils.getPwd(passWord))) {
            role = userService.queryById(user.getRoleId());
            if(role.getId()==1){
                ModelAndView mav = new ModelAndView("user/admin");
                mav.addObject("userName", userName);
                mav.addObject("role", role.getRoleName());
                return mav;
            }
        }else {
            return new ModelAndView("redirect:/500");
        }

        System.out.println(userName);
        System.out.println(passWord);
        ModelAndView mav = new ModelAndView("garden/index");
        mav.addObject("userName", userName);
        mav.addObject("role", role.getRoleName());
        return mav;
    }
}
