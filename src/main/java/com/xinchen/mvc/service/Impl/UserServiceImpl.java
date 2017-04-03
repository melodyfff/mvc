package com.xinchen.mvc.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xinchen.mvc.controller.LoginController;
import com.xinchen.mvc.dao.RoleDao;
import com.xinchen.mvc.dao.UserDao;
import com.xinchen.mvc.dto.UserList;
import com.xinchen.mvc.model.XRole;
import com.xinchen.mvc.model.XUser;
import com.xinchen.mvc.service.UserService;
import com.xinchen.mvc.utils.MD5Utils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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
    private final static Logger logger = Logger.getLogger(UserServiceImpl.class.getName());
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
    public XUser queryByUserId(long id) {
        return userDao.queryById(id);
    }

    /**
     * 分页查询
     * @param start
     * @return
     */
    public PageInfo<UserList> queryAllUser(int start,String search) {
        PageHelper.startPage(start,10);
        search = search+"%";
        return new PageInfo<UserList>(userDao.queryAllUser(search));
    }

    /**
     * 新增用户
     * @param user
     * @return
     */
    public int insertUser(XUser user) {
        String un = user.getUsername();

        if (userDao.queryUserSize(un) != 0) {
            logger.error("新建用户失败，用户已经存在");
            return 0;
        }
        String role = roleDao.queryById(user.getRoleId()).getRoleName();
        String pwd = user.getPassword();
        user.setPassword(MD5Utils.getPwd(pwd));
        user.setCreateTime(new Date());
        user.setRole(role);
        return userDao.insertUser(user);
    }

    @Override
    public int isUserExist(String username) {

        return userDao.queryUserSize(username);
    }

    @Override
    public int updateUser(XUser user) {
        XUser temp = userDao.queryById(user.getId());
        if (!temp.getPassword().equals(user.getPassword())){
            System.out.println(temp.getPassword()+"  "+user.getPassword());
            user.setPassword(MD5Utils.getPwd(user.getPassword()));
        }
        return userDao.updateUser(user);
    }

    @Override
    public int deleteUser(long id) {
        return userDao.deleteUser(id);
    }


}
