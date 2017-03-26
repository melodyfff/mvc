package com.xinchen.mvc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xinchen.mvc.dto.UserList;
import com.xinchen.mvc.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/21 20:49.
 * @see 2017/3/21 20:49 Created
 ****************************************/
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;

    @RequestMapping("userList")
    @ResponseBody
    public PageInfo getUserList(@Param("curr")String curr){
        System.out.println(curr);
//        PageHelper.startPage(Integer.parseInt(curr),5);
        PageInfo pageInfo = userService.queryAllUser(Integer.parseInt(curr));
        return pageInfo;
    }
}
