package com.zte.zudp.admin.info.myneedlike.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.myneedlike.dao.likeInfoDao;
import com.zte.zudp.admin.info.myneedlike.entity.likeInfoEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 我要点赞详情service
 * @author: lc
 * Date: 2019/12/07
 */
@Service
@Transactional(readOnly = false, rollbackFor = Exception.class)
public class likeInfoService extends BusinessService<likeInfoEntity> {

    @Autowired
    private likeInfoDao likeInfoDao;

    private likeInfoDao dao() {
        return (likeInfoDao) dao;
    }

    //评论点赞数更新
    @Transactional(rollbackFor = Exception.class)
    public void updateLikeCNum(String id){
        likeInfoDao.updateLikeCNum(id);
    }



}
