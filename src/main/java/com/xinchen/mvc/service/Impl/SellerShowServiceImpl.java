package com.xinchen.mvc.service.Impl;

import com.xinchen.mvc.dao.SellerShowDao;
import com.xinchen.mvc.model.SellerShow;
import com.xinchen.mvc.service.SellerShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/12 13:18.
 * @see 2017/3/12 13:18 Created
 ****************************************/
@Service
public class SellerShowServiceImpl implements SellerShowService {
    @Autowired
    private SellerShowDao sellerShowDao;
    @Override
    public SellerShow queryById(long id) {
        return sellerShowDao.queryById(id);
    }

    @Override
    public List<SellerShow> getAll() {
        return sellerShowDao.queryAll();
    }
}
