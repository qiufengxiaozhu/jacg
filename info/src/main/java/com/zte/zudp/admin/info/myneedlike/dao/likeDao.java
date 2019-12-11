package com.zte.zudp.admin.info.myneedlike.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.myneedlike.entity.likeEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 我要点赞dao
 * @author lc
 * @version 1.0.0
 * @serial on 2019-12-05
 */
public interface likeDao extends AbstractDao<likeEntity>{

    //发布
    void updatePublish (@Param("id")String  id);

    //撤销发布
    void updateNoPublish (@Param("id")String  id);

    //点赞数增加
    void updateLikeNum (@Param("id")String id);

    //有效时间段查询
    public List<likeEntity> findValidTime(likeEntity likeEntity);
}
