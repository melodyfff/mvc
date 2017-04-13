package com.xinchen.mvc.dao;

import com.xinchen.mvc.model.OrderList;
import org.apache.ibatis.annotations.Param;

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
     *
     * @param id
     * @return
     */
    OrderList queryOrderListById(long id);

    /**
     * 根据商家ID查询订单
     *
     * @param id
     * @return
     */
    List<OrderList> queryOrderListBySellerId(long id);

    /**
     * 根据用户ID查询订单
     *
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
    List<OrderList> queryAllOrderList(@Param("startTime") String startTime,
                                      @Param("endTime") String endTime,
                                      @Param("sellerId") long sellerId,
                                      @Param("userId") long userId);

    /**
     * 插入订单
     *
     * @param orderList
     * @return
     */
    int insertOrderList(OrderList orderList);

    /**
     * 修改订单
     *
     * @param orderList
     * @return
     */
    int updateOrderList(OrderList orderList);

    /**
     * 删除订单
     *
     * @param id
     * @return
     */
    int deleteOrderList(long id);

    /**
     * 修改订单状态
     * @return
     */
    int updateOrderState(long id);

}
