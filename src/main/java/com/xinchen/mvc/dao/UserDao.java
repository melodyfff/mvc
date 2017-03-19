package com.xinchen.mvc.dao;

import com.xinchen.mvc.model.XUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/2/7 21:43.
 * @see 2017/2/7 21:43 Created
 ****************************************/

public interface UserDao {
    /**
     * 根据ID查询用户
     *
     * @param id
     * @return
     */
    XUser queryById(long id);

    /**
     * 根据用户名和密码查询
     *
     * @param username
     * @param password
     * @return
     */
    XUser queryUser(@Param("username") String username, @Param("password") String password);


    /**
     * 根据用户查找用户
     * @param username
     * @return
     */
    XUser queryByuserName(@Param("username") String username);

    /**
     * 查询所有用户
     * @return
     */
    List<XUser> queryAll();

}
