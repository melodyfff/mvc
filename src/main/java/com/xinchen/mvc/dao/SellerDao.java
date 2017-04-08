package com.xinchen.mvc.dao;

import com.xinchen.mvc.model.XSeller;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/7 21:19.
 * @see 2017/4/7 21:19 Created
 ****************************************/

public interface SellerDao {
    /**
     * 根据ID查询Seller
     * @param id
     * @return
     */
    XSeller querySellerById(long id);

    /**
     * 根据sellerId查询seller
     * @param sellerId
     * @return
     */
    XSeller querySellerBySellerId(long sellerId);

    /**
     * 查询所有
     * @return
     */
    List<XSeller> queryAll();

    /**
     * 修改seller
     * @param xSeller
     * @return
     */
    int updateSeller(XSeller xSeller);

    /**
     * 删除seller
     * @param sellerId
     * @return
     */
    int deleteSeller(long sellerId);

    /**
     * 新增seller
     * @param xSeller
     * @return
     */
    int insertSeller(XSeller xSeller);

    /**
     * 分页查询
     * @param search
     * @return
     */
    List<XSeller> queryAllSeller(@Param("search") String search);

}
