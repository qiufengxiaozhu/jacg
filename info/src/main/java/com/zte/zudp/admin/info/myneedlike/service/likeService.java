package com.zte.zudp.admin.info.myneedlike.service;

import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.info.myneedlike.dao.likeDao;
import com.zte.zudp.admin.info.myneedlike.entity.likeEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 我要点赞service
 * @author: lc
 * Date: 2019/12/05
 */
@Service
@Transactional(readOnly = false, rollbackFor = Exception.class)
public class likeService  extends FileBusinessService<likeEntity> {

    @Autowired
    private likeDao likeDao;

    private likeDao dao() {
        return (likeDao) dao;
    }

    /**
     * 初始化附件关联表名
     */
    public likeService(){
        super.setTableName("my_need_like");
    }

    //修改为发布状态
    public void updatePublish(String id){
      likeDao.updatePublish(id);
    }

    //修改未发布
    public void updateNoPublish(String id){
        likeDao.updateNoPublish(id);
    }

    //点赞数增加
    @Transactional(rollbackFor = Exception.class)
    public void updateLikeNum(String id){
        likeDao.updateLikeNum(id);
    }

    //有效时间段查询
     public List<likeEntity> findValidTime(likeEntity likeEntity){
        return  likeDao.findValidTime(likeEntity);
     }


}
