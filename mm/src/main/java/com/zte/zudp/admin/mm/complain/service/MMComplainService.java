package com.zte.zudp.admin.mm.complain.service;

import com.zte.zudp.admin.common.persistence.Subject;
import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.mm.complain.dao.MMComplainDao;
import com.zte.zudp.admin.mm.complain.entity.MMComplainEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Description ${}
 * @Author ComplainService
 * @Date 2019/11/26 19:19
 **/
@Service
@Transactional(rollbackFor = Exception.class)
public class MMComplainService extends FileBusinessService<MMComplainEntity> {

    private MMComplainDao dao() {
        return (MMComplainDao) dao;
    }

    public MMComplainService() {
        super();
        this.setTableName("zzb_complain");
    }

    public int saveOne(MMComplainEntity entity) {
        int i = dao().insert(getEntity(entity));
        if (i >= 0) {
            this.afterInsert(entity);
        }
        return i;
    }

    /**
     * 通过 contactUser 得到当前用户的所有投诉信息
     * 被自身的业务父类实现了
     */
//    public List<MMComplainEntity> getAllByContactUser(String contactUser) {
//
//        return transform(dao().findList(contactUser));
//    }
//
//    public MMComplainEntity getOneById(String id) {
//        return dao().get(id);
//    }



    //模仿系统为字段注入 id
    private MMComplainEntity getEntity(MMComplainEntity entity) {
        entity.setId(String.valueOf(IDUtil.simpleId()));
        Subject user = SubjectUtil.getSubject();
        entity.setCreateUser(user);
        entity.setCreateDate(new Date());
        entity.setUpdateUser(user);
        entity.setUpdateDate(entity.getCreateDate());
        return entity;
    }
}