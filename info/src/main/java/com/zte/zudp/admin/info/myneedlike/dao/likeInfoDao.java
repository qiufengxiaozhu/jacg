package com.zte.zudp.admin.info.myneedlike.dao;


import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.myneedlike.entity.likeInfoEntity;
import org.apache.ibatis.annotations.Param;

/**
 * 点赞详情dao
 * @author lc
 * @version 1.0.0
 * @serial on 2019-12-05
 */
public interface likeInfoDao extends AbstractDao<likeInfoEntity> {

    //评论点赞数增加
    void updateLikeCNum(@Param("id") String id);

}
