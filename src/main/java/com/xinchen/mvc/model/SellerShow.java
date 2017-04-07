package com.xinchen.mvc.model;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/11 15:06.
 * @see 2017/3/11 15:06 Created
 ****************************************/

public class SellerShow {
    //商家id
    private int id;
    //商家名字
    private String sellerName;
    //商家URL地址
    private String sellerUrl;
    //商家图标
    private String sellerLogo;
    //评分
    private String scoreNum;
    //起送价格
    private int startPrice;
    //送达时间
    private int sendTime;
    //配送费
    private int sendPrice;
    //商家用户id
    private int sellerId;

    @Override
    public String toString() {
        return "SellerShow{" +
                "id=" + id +
                ", sellerName='" + sellerName + '\'' +
                ", sellerUrl='" + sellerUrl + '\'' +
                ", sellerLogo='" + sellerLogo + '\'' +
                ", scoreNum='" + scoreNum + '\'' +
                ", startPrice=" + startPrice +
                ", sendTime=" + sendTime +
                ", sendPrice=" + sendPrice +
                ", sellerId=" + sellerId +
                '}';
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getSellerUrl() {
        return sellerUrl;
    }

    public void setSellerUrl(String sellerUrl) {
        this.sellerUrl = sellerUrl;
    }

    public String getSellerLogo() {
        return sellerLogo;
    }

    public void setSellerLogo(String sellerLogo) {
        this.sellerLogo = sellerLogo;
    }

    public String getScoreNum() {
        return scoreNum;
    }

    public void setScoreNum(String scoreNum) {
        this.scoreNum = scoreNum;
    }

    public int getStartPrice() {
        return startPrice;
    }

    public void setStartPrice(int startPrice) {
        this.startPrice = startPrice;
    }

    public int getSendTime() {
        return sendTime;
    }

    public void setSendTime(int sendTime) {
        this.sendTime = sendTime;
    }

    public int getSendPrice() {
        return sendPrice;
    }

    public void setSendPrice(int sendPrice) {
        this.sendPrice = sendPrice;
    }

}
