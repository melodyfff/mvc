package com.xinchen.mvc.service.Impl;

import com.xinchen.mvc.dao.OrderListDao;
import com.xinchen.mvc.model.OrderList;
import com.xinchen.mvc.service.OrderService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 23:30.
 * @see 2017/4/7 23:30 Created
 ****************************************/
@Service
public class OrderServiceImpl implements OrderService {
    private final static Logger logger = Logger.getLogger(OrderServiceImpl.class.getName());
    @Autowired
    private OrderListDao orderListDao;
    @Override
    public List<OrderList> queryOrderListBySellerId(long id) {
        return orderListDao.queryOrderListBySellerId(id);
    }

    @Override
    public List<OrderList> queryOrderListByUserId(long id) {
        return orderListDao.queryOrderListByUserId(id);
    }

    @Override
    public int insertOrderList(OrderList orderList) {
        return orderListDao.insertOrderList(orderList);
    }

    @Override
    public int updateOrderList(OrderList orderList) {
        return orderListDao.updateOrderList(orderList);
    }

    @Override
    public int deleteOrderList(long id) {
        return orderListDao.deleteOrderList(id);
    }
}
