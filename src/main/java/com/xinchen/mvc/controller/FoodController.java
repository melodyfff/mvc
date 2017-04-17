package com.xinchen.mvc.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.xinchen.mvc.core.base.ResponseJson;
import com.xinchen.mvc.model.SellerFood;
import com.xinchen.mvc.model.SellerFoodType;
import com.xinchen.mvc.model.XSeller;
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
        List<SellerFood> sellerFood = sellerFoodService.querySellerFoodBySellerId(Long.parseLong(sellerId));
        List<SellerFoodType> sellerFoodTypes = sellerFoodService.querySellerFoodTypeBySellerId(Long.parseLong(sellerId));
        ModelAndView mav = new ModelAndView("food/foodmain");
        logger.info(sellerFoodTypes);
        mav.addObject("sellerName",xSeller.getSellerName());
        mav.addObject("sellerId",sellerId);
        mav.addObject("sellerFoodTypes",sellerFoodTypes);
        mav.addObject("sellerFood",sellerFood);
        return mav;
    }

    @RequestMapping("addFoodType")
    @ResponseBody
    public JSONObject addFoodType(SellerFoodType sellerFoodType){
        String msg = "成功";
        int result = sellerFoodService.insertSellerFoodType(sellerFoodType);
        if(result==0){msg="失败";}
        ResponseJson<SellerFoodType> my = new ResponseJson<SellerFoodType>();
        my.setErrmsg(msg);
        my.setStatus(result);
        JSONObject jsonStu = (JSONObject) JSON.toJSON(my);
        logger.info(sellerFoodType);
        return jsonStu;
    }

    @RequestMapping("addFood")
    @ResponseBody
    public JSONObject addFood(SellerFood sellerFood){
        String msg = "成功";
        logger.info(sellerFood);
        int result = sellerFoodService.insertSellerFood(sellerFood);
        if(result==0){msg="失败";}
        ResponseJson<SellerFood> my = new ResponseJson<SellerFood>();
        my.setErrmsg(msg);
        my.setStatus(result);
        JSONObject jsonStu = (JSONObject) JSON.toJSON(my);

        return jsonStu;
    }

    @RequestMapping(value = "deletefood")
    @ResponseBody
    public JSONObject deleteFood(@Param("deleteid") String deleteid){
        logger.info(deleteid);
        String msg = "删除成功";
        int result = sellerFoodService.deleteSellerFoodById(Long.parseLong(deleteid));
        ResponseJson<SellerFood> my = new ResponseJson<SellerFood>();
        my.setStatus(result);
        my.setErrmsg(msg);
        JSONObject jsonStu = (JSONObject) JSON.toJSON(my);
        return jsonStu;
    }

    @RequestMapping(value = "deletefoodtype")
    @ResponseBody
    public JSONObject deleteFoodType(@Param("sellerId") String sellerId,@Param("foodType") String foodType){
        logger.info(sellerId);
        String msg = "删除成功";
        int result = sellerFoodService.deleteSellerFoodType(Long.parseLong(sellerId),foodType);
        ResponseJson<SellerFood> my = new ResponseJson<SellerFood>();
        my.setStatus(result);
        my.setErrmsg(msg);
        JSONObject jsonStu = (JSONObject) JSON.toJSON(my);
        return jsonStu;
    }
}
