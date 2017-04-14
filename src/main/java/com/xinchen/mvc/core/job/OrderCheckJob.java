package com.xinchen.mvc.core.job;

import com.xinchen.mvc.dao.OrderListDao;
import com.xinchen.mvc.model.OrderList;
import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by xinchen on 2017/4/13.
 */
public class OrderCheckJob implements Job {
    @Autowired
    private OrderListDao orderListDao;

    private final static Logger logger = Logger.getLogger(OrderCheckJob.class.getName());

    public void execute(JobExecutionContext context) throws JobExecutionException {
        //这里输入任务处理的内容
        logger.info("定时任务开始执行");
        List<OrderList> lists = orderListDao.queryAllOrderList("","",0,0);
    }

}

