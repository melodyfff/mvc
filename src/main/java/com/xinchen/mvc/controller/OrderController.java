package com.xinchen.mvc.controller;

import com.xinchen.mvc.model.XRole;
import com.xinchen.mvc.model.XSeller;
import com.xinchen.mvc.model.XUser;
import com.xinchen.mvc.service.SellerService;
import com.xinchen.mvc.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

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
    private final static Logger logger = Logger.getLogger(OrderController.class.getName());
    @Autowired
    private SellerService sellerService;
    @Autowired
    private UserService userService;

    @RequestMapping("/orderlist")
    @ResponseBody
    public ModelAndView orderlist(@Param("id")String id){
        logger.info("用户id="+id);
        ModelAndView mav = new ModelAndView("order/orderlist");
        List<XSeller> sellers = sellerService.queryAll();
        mav.addObject("seller", sellers);
        mav.addObject("id",id);
        return mav;
    }

    @RequestMapping("/main")
    @ResponseBody
    public ModelAndView index(@Param("sellerId")String sellerId,@Param("id")String id){
        logger.info("用户id="+id);
        XUser xUser = userService.queryByUserId(Long.parseLong(id));
        XRole xRole = userService.queryById(Long.parseLong(id));
        ModelAndView mav = new ModelAndView("order/orderpage");
        mav.addObject("seller", sellerService.querySellerBySellerId(Long.parseLong(sellerId)));
        mav.addObject("username",xUser.getUsername());
        mav.addObject("role",xRole.getRoleName());
        return mav;
    }
}
