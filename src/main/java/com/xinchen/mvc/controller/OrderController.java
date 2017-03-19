package com.xinchen.mvc.controller;

import com.xinchen.mvc.service.OrderService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/12 10:47.
 * @see 2017/3/12 10:47 Created
 ****************************************/
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @RequestMapping("/orderlist")
    public ModelAndView orderlist(){
        ModelAndView mav = new ModelAndView("order/orderlist");
        mav.addObject("seller",orderService.getAll());
        return mav;
    }

    @RequestMapping("/main")
    public ModelAndView index(@Param("sellerId")String sellerId){
        ModelAndView mav = new ModelAndView("order/orderpage");
        System.out.println(sellerId);
        System.out.println(orderService.queryById(Long.parseLong(sellerId)));
        mav.addObject("seller",orderService.queryById(Long.parseLong(sellerId)));
        return mav;
    }
}
