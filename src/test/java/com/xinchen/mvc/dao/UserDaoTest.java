package com.xinchen.mvc.dao;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xinchen.mvc.controller.LoginController;
import com.xinchen.mvc.model.XUser;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/20 19:17.
 * @see 2017/3/20 19:17 Created
 ****************************************/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-base.xml"})
public class UserDaoTest {
    private final static Logger logger = Logger.getLogger(UserDaoTest.class.getName());
    @Resource
    private UserDao userDao;
    @Test
    public void query(){
        System.out.println(userDao.queryAllUser());
    }
    @Test
    public void queryAll() throws Exception {
        PageHelper.startPage(1,1);
        List<XUser> list = userDao.queryAll();
        PageInfo<XUser> p = new PageInfo<XUser>(list);
        System.out.println(list);
        System.out.println(p.getList().get(0));
    }
    @Test
    public void queryUserByName(){
//        System.out.println(userDao.queryByuserName("sam"));
        System.out.println(userDao.queryUserDetailById(1));
        XUser xUser = new XUser();
        xUser.setId(30);
        xUser.setUsername("mytest2");
        xUser.setPassword("aaa");
        xUser.setRole("2");
        xUser.setName("张三1");
        xUser.setCreateTime(new Date());
//        System.out.println(userDao.insertUser(xUser));
//        System.out.println(userDao.updateUser(xUser));
        System.out.println(userDao.queryUserSize("mytest"));

    }

    @Test
    public void log(){
        logger.info("test");
        logger.warn("test");
    }

}