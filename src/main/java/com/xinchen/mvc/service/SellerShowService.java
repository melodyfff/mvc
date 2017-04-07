package com.xinchen.mvc.service;

import com.xinchen.mvc.model.SellerShow;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/12 13:16.
 * @see 2017/3/12 13:16 Created
 ****************************************/

public interface SellerShowService {
    /**
     * 根据ID查询商家展示详情
     * @param id
     * @return
     */
    SellerShow queryById(long id);

    /**
     * 获取所有商家展示
     * @return
     */
    List<SellerShow> getAll();
}
