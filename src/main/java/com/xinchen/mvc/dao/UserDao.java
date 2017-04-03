package com.xinchen.mvc.dao;

import com.xinchen.mvc.dto.UserList;
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
     * 判断用户是否存在
     * @param username
     * @return
     */
    int queryUserSize(@Param("username") String username);

    /**
     * 查询所有用户
     * @return
     */
    List<XUser> queryAll();

    /**
     * 查询用户和角色
     * @return
     */
    List<UserList> queryAllUser(@Param("search") String search);

    /**
     * 根据ID查询用户详情
     * @param id
     * @return
     */
    XUser queryUserDetailById(long id);

    /**
     * 新增用户
     * @param user
     * @return
     */
    int insertUser(@Param("xuser") XUser user);

    /**
     * 删除用户
     * @param id
     * @return
     */
    int deleteUser(long id);

    /**
     * 修改用户
     * @param user
     * @return
     */
    int updateUser(XUser user);

}
