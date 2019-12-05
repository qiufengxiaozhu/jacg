package com.zte.zudp.admin.info.total.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.complain.entity.ComplainEntity;
import com.zte.zudp.admin.info.total.entity.TotalEntity;

import java.util.List;

/**
 * @Description 投诉表的增删查改
 * @Author TotalDao
 * @Date 2019/11/26 18:46
 **/
public interface TotalDao extends AbstractDao<TotalEntity> {

    //findList() -- List<T>

    //get(int id) -- T

    //insert(T t) -- int

    //update(T t) -- int

    //delete(int id) --int

    //batchDelete(String[] id) -- int

    List<TotalEntity> findTotal();
}
