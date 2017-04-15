package com.xinchen.mvc.core.job;

import com.xinchen.mvc.dao.OrderListDao;
import com.xinchen.mvc.model.OrderList;
import com.xinchen.mvc.utils.ApplicationUtil;
import com.xinchen.mvc.utils.DateUtils;
import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * Created by xinchen on 2017/4/13.
 */
@Component
public class OrderCheckJob implements Job {

    private final static Logger logger = Logger.getLogger(OrderCheckJob.class.getName());

    public void execute(JobExecutionContext context) throws JobExecutionException {
        OrderListDao OrderListDao = (OrderListDao) ApplicationUtil.getBean("orderListDao");
        //这里输入任务处理的内容
        logger.info("**************************");
        logger.info("定时任务开始执行");
        String startTime = "2000-01-01 00:00:00";

        String endTime = DateUtils.getDateString(new Date());
        long sellerId = 0;
        long userId = 0;
        List<OrderList> lists = OrderListDao.queryAllOrderList(startTime, endTime, sellerId, userId);
        for (OrderList i:lists) {
            if(i.getState()==0){
                i.setState(1);
            }
            OrderListDao.updateOrderList(i);
            logger.info("订到号："+i.getId()+"--->状态修改成功");
        }
        logger.info("定时任务执行完毕");
        logger.info("**************************");
    }

}

