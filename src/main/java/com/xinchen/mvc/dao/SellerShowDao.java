package com.xinchen.mvc.dao;

import com.xinchen.mvc.model.SellerShow;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/11 15:13.
 * @see 2017/3/11 15:13 Created
 ****************************************/

public interface SellerShowDao {
    /**
     * 根据商家ID查询
     * @param id
     * @return
     */
    SellerShow queryById(long id);

    /**
     * 查询所有
     * @return
     */
    List<SellerShow> queryAll();
}
