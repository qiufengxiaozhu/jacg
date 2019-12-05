package com.zte.zudp.admin.info.warning.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.warning.entity.Warning;


public interface WarningDao extends AbstractDao<Warning> {


    void updateStatus(String id);
}
