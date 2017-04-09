package com.xinchen.mvc.dao;

import com.xinchen.mvc.model.SellerFoodType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 22:36.
 * @see 2017/4/7 22:36 Created
 ****************************************/

public interface SellerFoodTypeDao {
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
     * 检查是否重复
     * @param sellerId
     * @return
     */
    SellerFoodType querySellerFoodType(@Param("sellerId")long sellerId,@Param("foodType")String foodType);

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
     * 删除商家
     * @param sellerId
     * @return
     */
    int deleteSellerFoodTypeAll(long sellerId);
}
