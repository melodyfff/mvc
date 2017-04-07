package com.xinchen.mvc.dao;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/11 15:17.
 * @see 2017/3/11 15:17 Created
 ****************************************/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-base.xml"})
public class SellerShowDaoTest {
    private final static Logger logger = Logger.getLogger(SellerShowDaoTest.class.getName());
    @Resource
    private SellerShowDao sellerShowDao;

    @Test
    public void test(){
        System.out.println(sellerShowDao.queryById(64));
        System.out.println(sellerShowDao.queryAll());
        logger.info(sellerShowDao.queryBySellerId(2));

    }
}
