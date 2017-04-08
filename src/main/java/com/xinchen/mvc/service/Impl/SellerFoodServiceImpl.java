package com.xinchen.mvc.service.Impl;

import com.xinchen.mvc.controller.FoodController;
import com.xinchen.mvc.dao.SellerFoodDao;
import com.xinchen.mvc.dao.SellerFoodTypeDao;
import com.xinchen.mvc.model.SellerFood;
import com.xinchen.mvc.model.SellerFoodType;
import com.xinchen.mvc.service.SellerFoodService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 23:35.
 * @see 2017/4/7 23:35 Created
 ****************************************/
@Service
public class SellerFoodServiceImpl implements SellerFoodService {
    private final static Logger logger = Logger.getLogger(SellerFoodServiceImpl.class.getName());
    @Autowired
    private SellerFoodTypeDao sellerFoodTypeDao;
    @Autowired
    private SellerFoodDao sellerFoodDao;

    //===================================================
    //食物类别操作
    //===================================================
    @Override
    public SellerFoodType querySellerFoodTypeById(long id) {
        return sellerFoodTypeDao.querySellerFoodTypeById(id);
    }

    @Override
    public List<SellerFoodType> querySellerFoodTypeBySellerId(long sellerId) {
        return sellerFoodTypeDao.querySellerFoodTypeBySellerId(sellerId);
    }

    @Override
    public int insertSellerFoodType(SellerFoodType sellerFoodType) {
        SellerFoodType result = sellerFoodTypeDao.querySellerFoodType(sellerFoodType.getSellerId(), sellerFoodType.getFoodType());
        if (result != null) {
            logger.error("该菜品已经存在");
            return 0;
        }
        return sellerFoodTypeDao.insertSellerFoodType(sellerFoodType);
    }

    @Override
    public int updateSellerFoodType(SellerFoodType sellerFoodType) {
        return sellerFoodTypeDao.updateSellerFoodType(sellerFoodType);
    }

    @Override
    public int deleteSellerFoodType(long sellerId, String foodType) {
        return sellerFoodTypeDao.deleteSellerFoodType(sellerId, foodType);
    }

    //===================================================
    //食物具体操作
    //===================================================
    @Override
    public SellerFood querySellerFoodById(long id) {
        return sellerFoodDao.querySellerFoodById(id);
    }

    @Override
    public List<SellerFood> querySellerFoodBySellerId(long sellerId) {
        return sellerFoodDao.querySellerFoodBySellerId(sellerId);
    }

    @Override
    public int insertSellerFood(SellerFood sellerFood) {
        return sellerFoodDao.insertSellerFood(sellerFood);
    }

    @Override
    public int updateSellerFood(SellerFood sellerFood) {
        return sellerFoodDao.updateSellerFood(sellerFood);
    }

    @Override
    public int deleteSellerFood(long sellerId, String foodName) {
        return sellerFoodDao.deleteSellerFood(sellerId, foodName);
    }
}
