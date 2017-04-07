package com.xinchen.mvc.model;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 22:35.
 * @see 2017/4/7 22:35 Created
 ****************************************/

public class SellerFoodType {
    //ID
    private long id;
    //sellerId
    private long sellerId;
    //食物种类
    private String foodType;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getSellerId() {
        return sellerId;
    }

    public void setSellerId(long sellerId) {
        this.sellerId = sellerId;
    }

    public String getFoodType() {
        return foodType;
    }

    public void setFoodType(String foodType) {
        this.foodType = foodType;
    }

    @Override
    public String toString() {
        return "SellerFoodType{" +
                "id=" + id +
                ", sellerId=" + sellerId +
                ", foodType='" + foodType + '\'' +
                '}';
    }
}
