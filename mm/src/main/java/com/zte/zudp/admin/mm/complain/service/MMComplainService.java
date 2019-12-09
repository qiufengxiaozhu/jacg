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
@Transactional
public class MMComplainService extends FileBusinessService<MMComplainEntity> {

    private MMComplainDao dao() {
        return (MMComplainDao) dao;
    }

    public int saveOne(MMComplainEntity entity) {
        return dao().insert(getEntity(entity));
    }

    /**
     * 通过 contactUser 得到当前用户的所有投诉信息
     * @param contactUser
     * @return
     */
    public List<MMComplainEntity> getAllByContactUser(String contactUser) {
        return transform(dao().getAllByContactUser(contactUser));
    }

    public MMComplainEntity getOneById(String id) {
        return dao().getOneById(id);
    }

    //字符串过长，裁切掉 ,修改时间格式
    private List<MMComplainEntity> transform(List<MMComplainEntity> list) {
        for (MMComplainEntity entity : list) {
            String title = entity.getTitle();
            if (title != null && !title.equals(""))
                if (title.length() > 12)
                    title = title.substring(0, 12) + "...";
            entity.setTitle(title);

            String description = entity.getDescription();
            if (description != null && !description.equals(""))
                if (description.length() > 12)
                    description = description.substring(0, 24) + "...";
            entity.setDescription(description);
        }
        return list;
    }

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