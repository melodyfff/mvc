package com.xinchen.mvc.dao;

import com.xinchen.mvc.model.SellerFood;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 22:10.
 * @see 2017/4/7 22:10 Created
 ****************************************/

public interface SellerFoodDao {
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
    int deleteSellerFood(@Param("sellerId") long sellerId,@Param("foodName") String foodName);

    /**
     * 根据ID删除食物
     * @param id
     * @return
     */
    int deleteSellerFoodById(long id);

    /**
     * 根据商家ID和食物种类删除
     * @param sellerId
     * @param foodType
     * @return
     */
    int deleteType(@Param("sellerId")long sellerId,@Param("foodType")String foodType);

    /**
     * 删除商家
     * @param sellerId
     * @return
     */
    int deleteSellerFoodAll(long sellerId);
}
