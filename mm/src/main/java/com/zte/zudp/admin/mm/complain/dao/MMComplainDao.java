package com.zte.zudp.admin.mm.complain.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.mm.complain.entity.MMComplainEntity;

import java.util.List;

/**
 * @Description 投诉表的增删查改
 * @Author TotalDao
 * @Date 2019/11/26 18:46
 **/
public interface MMComplainDao extends AbstractDao<MMComplainEntity> {

    //findList() -- List<T>

    //get(int id) -- T

    //insert(T t) -- int

    //update(T t) -- int

    //delete(int id) --int

    //batchDelete(String[] id) -- int

    List<MMComplainEntity> getAllByContactUser(String contactUser);
    MMComplainEntity getOneById(String id);
}
