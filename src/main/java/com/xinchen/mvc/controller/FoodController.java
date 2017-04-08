package com.xinchen.mvc.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.xinchen.mvc.base.ResponseJson;
import com.xinchen.mvc.model.SellerFoodType;
import com.xinchen.mvc.model.XSeller;
import com.xinchen.mvc.model.XUser;
import com.xinchen.mvc.service.SellerFoodService;
import com.xinchen.mvc.service.SellerService;
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
 * @date 2017/4/8 18:55.
 * @see 2017/4/8 18:55 Created
 ****************************************/
@Controller
@RequestMapping("/food")
public class FoodController {
    private final static Logger logger = Logger.getLogger(FoodController.class.getName());
    @Autowired
    private SellerService sellerService;

    @Autowired
    private SellerFoodService sellerFoodService;

    @RequestMapping("main")
    public ModelAndView forwardFoodMain(@Param("sellerId")String sellerId){
        XSeller xSeller =  sellerService.querySellerBySellerId(Long.parseLong(sellerId));
        List<SellerFoodType> sellerFoodTypes = sellerFoodService.querySellerFoodTypeBySellerId(Long.parseLong(sellerId));
        ModelAndView mav = new ModelAndView("food/foodmain");
        logger.info(sellerFoodTypes);
        mav.addObject("sellerName",xSeller.getSellerName());
        mav.addObject("sellerId",sellerId);
        mav.addObject("sellerFoodTypes",sellerFoodTypes);
        return mav;
    }

    @RequestMapping("addFoodType")
    @ResponseBody
    public JSONObject addFoodType(SellerFoodType sellerFoodType){
        String msg = "成功";
        int result = sellerFoodService.insertSellerFoodType(sellerFoodType);
        if(result==0){msg="失败";}
        ResponseJson<XUser> my = new ResponseJson<XUser>();
        my.setErrmsg(msg);
        my.setStatus(result);
        JSONObject jsonStu = (JSONObject) JSON.toJSON(my);
        logger.info(sellerFoodType);
        return jsonStu;
    }
}
