package com.xinchen.mvc.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xinchen.mvc.dao.SellerDao;
import com.xinchen.mvc.model.XSeller;
import com.xinchen.mvc.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/8 11:14.
 * @see 2017/4/8 11:14 Created
 ****************************************/
@Service
public class SellerServiceImpl implements SellerService {
    @Autowired
    private SellerDao sellerDao;
    @Override
    public XSeller querySellerById(long id) {
        return sellerDao.querySellerById(id);
    }

    @Override
    public XSeller querySellerBySellerId(long sellerId) {
        return sellerDao.querySellerBySellerId(sellerId);
    }

    @Override
    public List<XSeller> queryAll() {
        return sellerDao.queryAll();
    }

    @Override
    public int updateSeller(XSeller xSeller) {
        return sellerDao.updateSeller(xSeller);
    }

    @Override
    public int deleteSeller(long sellerId) {
        return sellerDao.deleteSeller(sellerId);
    }

    @Override
    public int insertSeller(XSeller xSeller) {
        return sellerDao.insertSeller(xSeller);
    }

    @Override
    public PageInfo<XSeller> queryAllSeller(int start, String search) {
        PageHelper.startPage(start,10);
        search = search+"%";
        return new PageInfo<XSeller>(sellerDao.queryAllSeller(search));
    }
}
