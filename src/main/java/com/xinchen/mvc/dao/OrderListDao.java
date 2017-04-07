package com.xinchen.mvc.dao;

import com.xinchen.mvc.model.OrderList;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 22:56.
 * @see 2017/4/7 22:56 Created
 ****************************************/

public interface OrderListDao {
    /**
     * 根据ID查找订单
     * @param id
     * @return
     */
    OrderList queryOrderListById(long id);

    /**
     * 根据商家ID查询订单
     * @param id
     * @return
     */
    List<OrderList> queryOrderListBySellerId(long id);

    /**
     * 根据用户ID查询订单
     * @param id
     * @return
     */
    List<OrderList> queryOrderListByUserId(long id);

    /**
     * 插入订单
     * @param orderList
     * @return
     */
    int insertOrderList(OrderList orderList);

    /**
     * 修改订单
     * @param orderList
     * @return
     */
    int updateOrderList(OrderList orderList);

    /**
     * 删除订单
     * @param id
     * @return
     */
    int deleteOrderList(long id);

}