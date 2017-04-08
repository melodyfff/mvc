package com.xinchen.mvc.model;

import java.util.Date;

/**
 * Created by xinchen on 2017/4/5.
 */
public class XSeller {

    private long id;
    //卖家ID
    private long sellerId;
    //卖家店铺名
    private String sellerName;
    //卖家图标
    private String sellerLogo;
    //送货时间
    private int sendTime;
    //起送价格
    private int startPrice;
    //起送价格
    private int sendPrice;
    //成立时间
    private Date createTime;
    //评分
    private String scoreNum;

    public XSeller() {
        this.scoreNum="4";
        this.sendTime = 30;
        this.startPrice = 0;
        this.sendPrice=0;
//        this.createTime=new Date();
    }

    public int getSendPrice() {
        return sendPrice;
    }

    public void setSendPrice(int sendPrice) {
        this.sendPrice = sendPrice;
    }

    public String getScoreNum() {
        return scoreNum;
    }

    public void setScoreNum(String scoreNum) {
        this.scoreNum = scoreNum;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getSendTime() {
        return sendTime;
    }

    public void setSendTime(int sendTime) {
        this.sendTime = sendTime;
    }

    public int getStartPrice() {
        return startPrice;
    }

    public void setStartPrice(int startPrice) {
        this.startPrice = startPrice;
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

    public String getSellerLogo() {
        return sellerLogo;
    }

    public void setSellerLogo(String sellerLogo) {
        this.sellerLogo = sellerLogo;
    }

    @Override
    public String toString() {
        return "XSeller{" +
                "id=" + id +
                ", sellerId=" + sellerId +
                ", sellerName='" + sellerName + '\'' +
                ", sellerLogo='" + sellerLogo + '\'' +
                ", sendTime=" + sendTime +
                ", startPrice=" + startPrice +
                ", sendPrice=" + sendPrice +
                ", createTime=" + createTime +
                ", scoreNum='" + scoreNum + '\'' +
                '}';
    }
}
