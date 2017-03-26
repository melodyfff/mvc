package com.xinchen.mvc.dao;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xinchen.mvc.model.XUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
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
@ContextConfiguration({"classpath:spring-base.xml","classpath:springmvc-context.xml"})
public class UserDaoTest {
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

}