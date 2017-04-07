package com.xinchen.mvc.dao;

import com.xinchen.mvc.model.SellerFood;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 22:14.
 * @see 2017/4/7 22:14 Created
 ****************************************/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-base.xml"})
public class SellerFoodDaoTest {
    private final static Logger logger = Logger.getLogger(SellerFoodDaoTest.class.getName());
    @Resource
    private SellerFoodDao sellerFoodDao;
    @Test
    public void querySellerFoodById() throws Exception {
        logger.info(sellerFoodDao.querySellerFoodById(1));
    }

    @Test
    public void querySellerFoodBySellerId() throws Exception {
        logger.info(sellerFoodDao.querySellerFoodBySellerId(1));
    }

    @Test
    public void insertSellerFood() throws Exception {
        SellerFood sellerFood = new SellerFood();
        sellerFood.setSellerId(2);
        sellerFood.setFoodType("222222");
        sellerFood.setFoodName("222222");
        sellerFood.setSellerName("213");
//        logger.info(sellerFoodDao.insertSellerFood(sellerFood));
//        logger.info(sellerFoodDao.updateSellerFood(sellerFood));
        logger.info(sellerFoodDao.deleteSellerFood(2,"222222"));
    }

}