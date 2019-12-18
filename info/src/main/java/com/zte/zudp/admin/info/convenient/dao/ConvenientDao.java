package com.zte.zudp.admin.info.convenient.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.convenient.entity.Convenient;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;

import java.util.List;

/**
 * @Description ${}
 * @Author ConvenientDao
 * @Date 2019/12/16 8:37
 **/

/**
 * 便民服务持久层
 */
public interface ConvenientDao extends AbstractDao<Convenient> {


    /**
     * 查询所有类别
     */
    public List<Dictionary> getTypeList();

    /**
     * 根据类别查找服务
     * @return
     */
//    public List<Convenient> getConvenientList(String id);
}
