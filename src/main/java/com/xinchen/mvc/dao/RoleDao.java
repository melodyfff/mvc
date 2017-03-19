package com.xinchen.mvc.dao;

import com.xinchen.mvc.model.XRole;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/2/7 22:15.
 * @see 2017/2/7 22:15 Created
 ****************************************/

public interface RoleDao {
    /**
     * 根据ID查找角色
     * @param id
     * @return
     */
    XRole queryById(long id);
}
