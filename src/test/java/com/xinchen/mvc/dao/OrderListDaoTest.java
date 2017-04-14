package com.xinchen.mvc.dao;

import com.xinchen.mvc.model.OrderList;
import com.xinchen.mvc.utils.DateUtils;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 23:08.
 * @see 2017/4/7 23:08 Created
 ****************************************/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-base.xml"})
public class OrderListDaoTest {
    private final static Logger logger = Logger.getLogger(OrderListDaoTest.class.getName());

    @Resource
    private OrderListDao orderListDao;

    @Test
    public void queryOrderListById() throws Exception {
        logger.info(orderListDao.queryOrderListById(1));
    }

    @Test
    public void queryOrderListBySellerId() throws Exception {
        logger.info(orderListDao.queryOrderListBySellerId(1));
    }

    @Test
    public void queryOrderListByUserId() throws Exception {
        logger.info(orderListDao.queryOrderListByUserId(1));
    }

    @Test
    public void insertOrderList() throws Exception {
        OrderList orderList = new OrderList();
        orderList.setSellerId(1);
        orderList.setUserId(1);
        orderList.setDate(new Date());
        logger.info(orderListDao.insertOrderList(orderList));
    }

    @Test
    public void updateOrderList() throws Exception {
        OrderList orderList = new OrderList();
        orderList.setId(2);
        orderList.setSellerId(1);
        orderList.setUserId(2);
        orderList.setDate(new Date());
        logger.info(orderListDao.updateOrderList(orderList));

    }

    @Test
    public void deleteOrderList() throws Exception {
        logger.info(orderListDao.deleteOrderList(2));
    }

    @Test
    public void fenye() throws Exception {
//        String startTime = "2017-04-09 17:09:56";
//        String endTime ="2017-04-09 19:32:38";
//        Date dt =new Date();
//        String formatDate = null;
//        DateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //HH表示24小时制；
//        formatDate = dFormat.format(dt);
//        System.out.println(formatDate);


        String startTime = "2000-01-01 00:00:00";

        String endTime = DateUtils.getDateString(new Date());
        long sellerId = 0;
        long userId = 0;
        List<OrderList> lists = orderListDao.queryAllOrderList(startTime, endTime, sellerId, userId);
        for (OrderList i:lists) {
            if(i.getState()==0){
                i.setState(1);
            }
            orderListDao.updateOrderList(i);
        }
        logger.info(lists);
    }

}