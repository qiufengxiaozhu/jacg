package com.zte.zudp.admin.mm.convenient.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.mm.convenient.entity.MMConvenient;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description ${}
 * @Author MMConvenientDao
 * @Date 2019/12/16 8:37
 **/

/**
 * 便民服务持久层
 */
@Repository
public interface MMConvenientDao extends AbstractDao<MMConvenient> {


    /**
     * 查询所有类别
     */
    public List<Dictionary> getConvenientType();

    /**
     * 根据类别查找服务
     * @return
     */
    public List<MMConvenient> getConvenientList(@Param("id") String id);
}
