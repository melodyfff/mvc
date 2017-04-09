package com.xinchen.mvc.service;

import com.xinchen.mvc.model.SellerFood;
import com.xinchen.mvc.model.SellerFoodType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 23:33.
 * @see 2017/4/7 23:33 Created
 ****************************************/

public interface SellerFoodService {
    //===================================================
    //食物类别操作
    //===================================================
    /**
     * 根据ID查询食物
     * @param id
     * @return
     */
    SellerFoodType querySellerFoodTypeById(long id);
    /**
     * 根据SellerId查询食物
     * @param sellerId
     * @return
     */
    List<SellerFoodType> querySellerFoodTypeBySellerId(long sellerId);

    /**
     * 插入食物列表
     * @param sellerFoodType
     * @return
     */
    int insertSellerFoodType(SellerFoodType sellerFoodType);

    /**
     * 修改食物
     * @param sellerFoodType
     * @return
     */
    int updateSellerFoodType(SellerFoodType sellerFoodType);

    /**
     * 删除食物
     * @param sellerId
     * @param foodType
     * @return
     */
    int deleteSellerFoodType(@Param("sellerId") long sellerId, @Param("foodType") String foodType);
    /**
     * 删除商家种类
     * @param sellerId
     * @return
     */
    int deleteSellerFoodTypeAll(long sellerId);
    //===================================================
    //食物具体操作
    //===================================================
    /**
     * 根据ID查询食物
     * @param id
     * @return
     */
    SellerFood querySellerFoodById(long id);
    /**
     * 根据SellerId查询食物
     * @param sellerId
     * @return
     */
    List<SellerFood> querySellerFoodBySellerId(long sellerId);

    /**
     * 插入食物列表
     * @param sellerFood
     * @return
     */
    int insertSellerFood(SellerFood sellerFood);

    /**
     * 修改食物
     * @param sellerFood
     * @return
     */
    int updateSellerFood(SellerFood sellerFood);

    /**
     * 删除食物
     * @param sellerId
     * @param foodName
     * @return
     */
    int deleteSellerFood(long sellerId,String foodName);
    /**
     * 根据ID删除食物
     * @param id
     * @return
     */
    int deleteSellerFoodById(long id);

    /**
     * 删除商家食物
     * @param sellerId
     * @return
     */
    int deleteSellerFoodAll(long sellerId);
}
