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
    XUser queryByuserName(String username);
    XRole queryById(long id);
    PageInfo<UserList> queryAllUser(int start);
}
