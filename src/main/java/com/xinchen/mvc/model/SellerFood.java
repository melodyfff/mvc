package com.xinchen.mvc.model;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 22:05.
 * @see 2017/4/7 22:05 Created
 ****************************************/

public class SellerFood {
    //ID
    private long id;
    //sellerID
    private long sellerId;
    //店名
    private String sellerName;
    //食物种类
    private String foodType;
    //食物名
    private String foodName;
    //食物价格
    private int foodPrice;

    public SellerFood() {
        this.foodPrice = 0;
    }

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

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getFoodType() {
        return foodType;
    }

    public void setFoodType(String foodType) {
        this.foodType = foodType;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public int getFoodPrice() {
        return foodPrice;
    }

    public void setFoodPrice(int foodPrice) {
        this.foodPrice = foodPrice;
    }

    @Override
    public String toString() {
        return "SellerFood{" +
                "id=" + id +
                ", sellerId=" + sellerId +
                ", sellerName='" + sellerName + '\'' +
                ", foodType='" + foodType + '\'' +
                ", foodName='" + foodName + '\'' +
                ", foodPrice='" + foodPrice + '\'' +
                '}';
    }
}
