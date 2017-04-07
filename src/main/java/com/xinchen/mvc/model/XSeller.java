package com.xinchen.mvc.model;

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
                '}';
    }
}
