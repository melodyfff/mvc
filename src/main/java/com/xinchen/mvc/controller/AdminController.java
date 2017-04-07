package com.xinchen.mvc.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xinchen.mvc.base.ResponseJson;
import com.xinchen.mvc.dto.UserList;
import com.xinchen.mvc.model.XUser;
import com.xinchen.mvc.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
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
    private final static Logger logger = Logger.getLogger(AdminController.class.getName());

    @Autowired
    private UserService userService;

    @RequestMapping("usermanage")
    public String forwardUserManage(){
        return "/user/usermanage";
    }

    @RequestMapping("userList")
    @ResponseBody
    public PageInfo getUserList(@Param("curr")String curr,@Param("search")String search){
        System.out.println(curr+"   "+search);
//        PageHelper.startPage(Integer.parseInt(curr),5);
        PageInfo pageInfo = userService.queryAllUser(Integer.parseInt(curr),search);
        return pageInfo;
    }

    @RequestMapping("adduserpage")
    public ModelAndView forwardAddUser(){
        ModelAndView mav = new ModelAndView("user/adduser");
        return mav;
    }
    @RequestMapping(value = "adduser")
    @ResponseBody
    public JSONObject addUser(XUser user){
        String msg = "成功";
        logger.info(user);

        int result = userService.insertUser(user);
        ResponseJson<XUser> my = new ResponseJson<XUser>();
        my.setData(user);
        my.setStatus(result);
        JSONObject jsonStu = (JSONObject) JSON.toJSON(my);
        return jsonStu;
    }

    @RequestMapping("updateuserpage")
    public ModelAndView forwardUpdateUser(@Param("updateid") String updateid){
        XUser user = userService.queryByUserId(Long.parseLong(updateid));
        ModelAndView mav = new ModelAndView("user/updateuser");
        mav.addObject("user",user);
        return mav;
    }

    @RequestMapping(value = "update")
    @ResponseBody
    public JSONObject updateUser(XUser user){
        String msg = "成功";
        logger.info(user);
        int result = userService.updateUser(user);
        ResponseJson<XUser> my = new ResponseJson<XUser>();
        my.setStatus(result);
        my.setErrmsg(msg);
        JSONObject jsonStu = (JSONObject) JSON.toJSON(my);
        return jsonStu;
    }

    @RequestMapping(value = "delete")
    @ResponseBody
    public JSONObject deleteUser(@Param("deleteid") String deleteid){
        String msg = "删除成功";
        int result = userService.deleteUser(Long.parseLong(deleteid));
        ResponseJson<XUser> my = new ResponseJson<XUser>();
        my.setStatus(result);
        my.setErrmsg(msg);
        JSONObject jsonStu = (JSONObject) JSON.toJSON(my);
        return jsonStu;
    }
    @RequestMapping(value = "isUserExist")
    @ResponseBody
    public int addUser(@Param("username")String username){
        logger.info(username);
        return userService.isUserExist(username);
    }
}
