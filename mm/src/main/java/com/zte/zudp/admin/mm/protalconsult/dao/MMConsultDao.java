package com.zte.zudp.admin.mm.protalconsult.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.mm.protalconsult.entity.MMConsult;

import java.util.List;

public interface MMConsultDao extends AbstractDao<MMConsult>{
    /**
     * 查询所有咨询信息
     * @param mmConsult
     * @return
     */
    public List<MMConsult> selAll(MMConsult mmConsult);

    /**
     * 根据id查询咨询信息
     * @param id
     * @return
     */
    public MMConsult selById(String id);

    /**
     * 插入咨询
     * @param mmConsult
     * @return
     */
    public int insConsult(MMConsult mmConsult);
}
