package com.zte.zudp.admin.info.queinvest.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.common.persistence.dao.BaseDao;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;

import java.util.List;

/**
 *
 */
public interface QueinvestDao extends AbstractDao<Queinvest> {

    /**
     * 下拉  问卷类型
     * @return
     */
    List<Queinvest> getList();


}
