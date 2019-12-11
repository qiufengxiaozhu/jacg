package com.zte.zudp.admin.mm.complain.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.mm.complain.entity.MMComplainEntity;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.formula.functions.T;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description 投诉表的增删查改
 * @Author TotalDao
 * @Date 2019/11/26 18:46
 **/
public interface MMComplainDao extends AbstractDao<MMComplainEntity> {

    List<MMComplainEntity> findList(@Param("contactUser") String contactUser);
}
