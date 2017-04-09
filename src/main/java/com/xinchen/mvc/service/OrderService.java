package com.xinchen.mvc.service;

import com.github.pagehelper.PageInfo;
import com.xinchen.mvc.model.OrderList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Description:订单管理
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 23:28.
 * @see 2017/4/7 23:28 Created
 ****************************************/

public interface OrderService {
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
     * 分页查询订单详情
     * @param startTime
     * @param endTime
     * @param sellerId
     * @param userId
     * @return
     */
    PageInfo<OrderList> queryAllOrderList(int start, String startTime,
                                          String endTime,
                                          long sellerId,
                                          long userId);
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
