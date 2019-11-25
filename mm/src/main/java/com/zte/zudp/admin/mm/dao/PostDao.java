package com.zte.zudp.admin.mm.dao;

import org.apache.ibatis.annotations.Param;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.mm.entity.PostEntity;

/**
 * 岗位管理dao
 * @author : wlf
 * Date: 2019/1/16
 * Time: 14:13
 */
public interface PostDao extends AbstractDao<PostEntity> {
    /**
     * 校验岗位名称是否重复
     * @param name
     * @param id
     * @return
     */
    int checkName(@Param("name") String name, @Param("id") String id);

    /**
     * 校验岗位标识是否存在
     * @param identification
     * @param id
     * @return
     */

    int checkIdentification(@Param("identification") String identification, @Param("id") String id);
}
