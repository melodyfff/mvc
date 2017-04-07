package com.xinchen.mvc.dao;

import com.xinchen.mvc.model.SellerFoodType;
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
 * @date 2017/4/7 22:42.
 * @see 2017/4/7 22:42 Created
 ****************************************/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-base.xml"})
public class SellerFoodTypeDaoTest {
    private final static Logger logger = Logger.getLogger(SellerFoodDaoTest.class.getName());
    @Resource
    private SellerFoodTypeDao sellerFoodTypeDao;
    @Test
    public void querySellerFoodTypeById() throws Exception {
        logger.info(sellerFoodTypeDao.querySellerFoodTypeById(1));
    }

    @Test
    public void querySellerFoodTypeBySellerId() throws Exception {
        logger.info(sellerFoodTypeDao.querySellerFoodTypeBySellerId(1));
    }

    @Test
    public void insertSellerFoodType() throws Exception {
        SellerFoodType sellerFoodType = new SellerFoodType();
        sellerFoodType.setSellerId(2);
        sellerFoodType.setFoodType("test");
        logger.info(sellerFoodTypeDao.insertSellerFoodType(sellerFoodType));
    }

    @Test
    public void updateSellerFoodType() throws Exception {
        SellerFoodType sellerFoodType = new SellerFoodType();
        sellerFoodType.setSellerId(2);
        sellerFoodType.setFoodType("test2");
        logger.info(sellerFoodTypeDao.updateSellerFoodType(sellerFoodType));
    }

    @Test
    public void deleteSellerFoodType() throws Exception {
        logger.info(sellerFoodTypeDao.deleteSellerFoodType(2,"test2"));
    }

}