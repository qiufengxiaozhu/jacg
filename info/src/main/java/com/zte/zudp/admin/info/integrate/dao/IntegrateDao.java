package com.zte.zudp.admin.info.integrate.dao;

        import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
        import com.zte.zudp.admin.info.integrate.entity.Integrate;
        import org.apache.ibatis.annotations.Param;


public interface IntegrateDao extends AbstractDao<Integrate> {


    /**
     * 新增到积分表中数据
     * @param type
     * @param fId
     * @param tel
     */
    void insertToIntegrate(@Param("type") String type,@Param("fId") String fId, @Param("tel") String tel,@Param("id") String id);
}
