package com.xinchen.mvc.service.Impl;

import com.xinchen.mvc.model.XUser;
import com.xinchen.mvc.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/2 21:22.
 * @see 2017/4/2 21:22 Created
 ****************************************/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-base.xml"})
public class UserServiceImplTest {

    @Autowired
    private UserService userService;
    @Test
    public void insertUser() throws Exception {
        XUser xUser= new XUser();
        xUser.setUsername("user2");
        xUser.setPassword("123");
        System.out.println(userService.insertUser(xUser));
    }

    @Test
    public void query() throws Exception {

        System.out.println(userService.queryByUserId(3));
    }

}