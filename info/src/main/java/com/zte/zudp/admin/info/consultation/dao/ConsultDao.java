package com.zte.zudp.admin.info.consultation.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.consultation.entity.Consult;

import java.util.List;

public interface ConsultDao extends AbstractDao<Consult> {
    /**
     * 获取咨询信息附件
     * @param id
     * @return
     */
    public Consult getFj(String id);
}
