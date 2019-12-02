package com.zte.zudp.admin.info.consultation.dao;


import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.consultation.entity.ConsultCategory;

import java.util.List;

/**
 * 种类管理dao
 */
public interface ConsultCategoryDao extends AbstractDao<ConsultCategory> {
    List<ConsultCategory> selCategory();
}
