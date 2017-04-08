package com.xinchen.mvc.dao;

import com.xinchen.mvc.model.XSeller;
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
 * @date 2017/4/7 21:20.
 * @see 2017/4/7 21:20 Created
 ****************************************/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-base.xml"})
public class SellerDaoTest {
    private final static Logger logger = Logger.getLogger(SellerDaoTest.class.getName());
    @Resource
    private SellerDao sellerDao;
    @Test
    public void querySellerById() throws Exception {
        XSeller xSeller = new XSeller();
        xSeller.setSellerId(3);
        xSeller.setSellerName("sam1");
        xSeller.setSellerLogo("test2");
//       logger.info( sellerDao.querySellerById(1));
       logger.info(sellerDao.querySellerBySellerId(3));
//       logger.info(sellerDao.updateSeller(xSeller));
//       logger.info(sellerDao.deleteSeller(4));
    }

    @Test
    public void test2() throws Exception {
        XSeller xSeller = new XSeller();
        xSeller.setSellerId(3);
        xSeller.setSellerName("sam1");
        xSeller.setSellerLogo("test2");
//        logger.info(sellerDao.insertSeller(xSeller));
//        logger.info(sellerDao.queryAllSeller("sam2%"));
        logger.info(sellerDao.queryAll());
    }

}