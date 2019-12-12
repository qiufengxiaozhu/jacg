package com.zte.zudp.admin.mm.integrate.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.mm.integrate.entity.MMIntegrate;
import com.zte.zudp.admin.mm.queinvest.entity.MMQueinvest;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 积分管理
 */



public interface MMIntegrateDao extends AbstractDao<MMIntegrate> {


    List<MMIntegrate> selectAll();

}
