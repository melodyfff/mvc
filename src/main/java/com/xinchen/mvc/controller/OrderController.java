package com.xinchen.mvc.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.xinchen.mvc.base.ResponseJson;
import com.xinchen.mvc.model.*;
import com.xinchen.mvc.service.OrderService;
import com.xinchen.mvc.service.SellerFoodService;
import com.xinchen.mvc.service.SellerService;
import com.xinchen.mvc.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @Autowired
    private SellerFoodService foodService;

    @Autowired
    private OrderService orderService;

    /**
     * 返回商品列表
     * @param id
     * @return
     */
    @RequestMapping("/orderlist")
    @ResponseBody
    public ModelAndView orderlist(@RequestParam("id")String id){
        logger.info("用户"+id+"--->进入商品选择页面");

        List<XSeller> sellers = sellerService.queryAll();

        ModelAndView mav = new ModelAndView("order/orderlist");
        mav.addObject("seller", sellers);
        mav.addObject("userid",id);
        return mav;
    }

    /**
     * 进入选择主页面
     * @param sellerId
     * @param userid
     * @return
     */
    @RequestMapping("/main")
    @ResponseBody
    public ModelAndView index(@RequestParam("sellerId")String sellerId,@RequestParam("userId")String userid){
        logger.info("用户"+userid+"--->进入商品选择页面");

        XUser xUser = userService.queryByUserId(Long.parseLong(userid));
        XRole xRole = userService.queryById(xUser.getRoleId());
        List<SellerFoodType> foodTypes = foodService.querySellerFoodTypeBySellerId(Long.parseLong(sellerId));
        List<SellerFood> foods = foodService.querySellerFoodBySellerId(Long.parseLong(sellerId));

        ModelAndView mav = new ModelAndView("order/orderpage");
        mav.addObject("seller", sellerService.querySellerBySellerId(Long.parseLong(sellerId)));
        mav.addObject("username",xUser.getUsername());
        mav.addObject("role",xRole.getRoleName());
        mav.addObject("foodTypes",foodTypes);
        mav.addObject("foods",foods);
        mav.addObject("userId",userid);
        return mav;
    }

    //===============================================
    //订单管理
    //===============================================
    @RequestMapping("/ordermanage")
    public ModelAndView forwardOrderManage(){
        ModelAndView mav = new ModelAndView("order/ordermanage");
        return mav;
    }

    /**
     * 新增订单
     * @param orderList
     * @return
     */
    @RequestMapping("/addOrderList")
    @ResponseBody
    public JSONObject addOrderList(OrderList orderList){
        logger.info(orderList);
        int result = orderService.insertOrderList(orderList);
        String msg = "新增成功";
        ResponseJson<OrderList> my = new ResponseJson<OrderList>();
        my.setStatus(result);
        my.setErrmsg(msg);
        JSONObject jsonStu = (JSONObject) JSON.toJSON(my);
        return jsonStu;
    }
}
