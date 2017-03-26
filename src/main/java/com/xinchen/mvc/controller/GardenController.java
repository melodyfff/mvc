package com.xinchen.mvc.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/4 19:32.
 * @see 2017/3/4 19:32 Created
 ****************************************/
@Controller
@RequestMapping("/garden")
public class GardenController {
    @RequestMapping("/world")
    public ModelAndView index(String userName,String passWord){
        ModelAndView mav = new ModelAndView("garden/index");

        System.out.println(userName+" "+passWord);
        return mav;
    }
    @RequestMapping("/main")
    public String main(){
        return "garden/main";
    }

    @RequestMapping("/hot")
    public String hot(){
        return "garden/hotfood";
    }

    @RequestMapping("/orderpage")
    public String orderPage(){
        return "garden/orderpage";
    }
//    @ResponseBody
//    @RequestMapping("/keys")
//    public List<String> txtindex(){
//
//        return redisUtils.getkeys();
//    }
//
//    @ResponseBody
//    @RequestMapping("/get")
//    public ModelAndView txtindex(@RequestParam("name")String name){
//        ModelAndView modelAndView = new ModelAndView("/context");
//        String content = redisUtils.get(name);
//        modelAndView.addObject("content",content);
//        System.out.println(name);
//        return modelAndView;
//    }
}
