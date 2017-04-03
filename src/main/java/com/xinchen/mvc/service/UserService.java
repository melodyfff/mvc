package com.xinchen.mvc.service;

import com.github.pagehelper.PageInfo;
import com.xinchen.mvc.dto.UserList;
import com.xinchen.mvc.model.XRole;
import com.xinchen.mvc.model.XUser;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/20 20:22.
 * @see 2017/3/20 20:22 Created
 ****************************************/

public interface UserService {
    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    XUser queryByuserName(String username);

    /**
     * 根据ID查找角色
     * @param id
     * @return
     */
    XRole queryById(long id);
    /**
     * 根据ID查找用户
     * @param id
     * @return
     */
    XUser queryByUserId(long id);

    /**
     * 分页查询
     * @param start
     * @return
     */
    PageInfo<UserList> queryAllUser(int start,String search);

    /**
     * 新增用户
     * @param user
     * @return
     */
    int insertUser(XUser user);
    /**
     * 判断用户是否存在
     * @param username
     * @return
     */
    int isUserExist(String username);

    /**
     * 更新用户
     * @param user
     * @return
     */
    int updateUser(XUser user);

    /**
     * 删除用户
     * @param id
     * @return
     */
    int deleteUser(long id);
}
