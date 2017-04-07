package com.xinchen.mvc.model;

import java.util.Date;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 22:48.
 * @see 2017/4/7 22:48 Created
 ****************************************/

public class OrderList {
    //id
    private long id;
    //sellerid
    private long sellerId;
    //店铺名
    private String SellerName;
    //userid
    private long userId;
    //用户名
    private String userName;
    //电话
    private  String phone;
    //地址
    private String address;
    //备注
    private String note;
    //订单详情
    private String detail;
    //总价格
    private int price;
    //订单状态
    private int state;
    //订单时间
    private Date date;

    public OrderList() {
        this.state = 0;
    }

    @Override
    public String toString() {
        return "OrderList{" +
                "id=" + id +
                ", sellerId=" + sellerId +
                ", SellerName='" + SellerName + '\'' +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", note='" + note + '\'' +
                ", detail='" + detail + '\'' +
                ", price=" + price +
                ", state=" + state +
                ", date=" + date +
                '}';
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
        return SellerName;
    }

    public void setSellerName(String sellerName) {
        SellerName = sellerName;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
