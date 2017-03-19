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

public interface OrderService {
    SellerShow queryById(long id);

    List<SellerShow> getAll();
}
