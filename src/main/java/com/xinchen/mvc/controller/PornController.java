//package com.xinchen.mvc.controller;
//
//import com.xinchen.mvc.utils.RedisUtils;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import java.util.List;
//
///**
// *
// * Created by xinchen on 2017/4/15.
// */
//@Controller
//@RequestMapping("porn")
//public class PornController {
//
//    private RedisUtils redisUtils = new RedisUtils();
//    @RequestMapping("main")
//    public ModelAndView forwardindex(){
//        List<String> list = redisUtils.getkeys();
//        ModelAndView mav = new ModelAndView("porn/index");
//        mav.addObject("list",list);
//        return mav;
//    }
//    @RequestMapping("porntime")
//    public ModelAndView forwardporntime(@RequestParam("title")String title){
//        String result =  redisUtils.get(title);
//        ModelAndView mav = new ModelAndView("porn/porntime");
//        mav.addObject("title",title);
//        mav.addObject("content",result);
//        return mav;
//    }
//}
