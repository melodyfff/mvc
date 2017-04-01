package com.xinchen.mvc.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xinchen.mvc.dao.RoleDao;
import com.xinchen.mvc.dao.UserDao;
import com.xinchen.mvc.dto.UserList;
import com.xinchen.mvc.model.XRole;
import com.xinchen.mvc.model.XUser;
import com.xinchen.mvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/20 20:22.
 * @see 2017/3/20 20:22 Created
 ****************************************/
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;

    /**
     * 根据名字查询用户
     * @param username
     * @return
     */
    public XUser queryByuserName(String username) {
        return userDao.queryByuserName(username);
    }

    /**
     * 根据ID查询角色
     * @param id
     * @return
     */
    public XRole queryById(long id) {
        return roleDao.queryById(id);
    }

    @Override
    public PageInfo<UserList> queryAllUser(int start) {
        PageHelper.startPage(start,10);
        return new PageInfo<UserList>(userDao.queryAllUser());
    }


}
