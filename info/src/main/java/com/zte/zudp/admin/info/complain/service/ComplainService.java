package com.zte.zudp.admin.info.complain.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.attachDoc.entity.AttachDoc;
import com.zte.zudp.admin.info.attachDoc.service.AttachDocService;
import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.info.complain.dao.ComplainDao;
import com.zte.zudp.admin.info.complain.entity.ComplainEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @Description ${}
 * @Author ComplainService
 * @Date 2019/11/26 19:19
 **/
@Service
@Transactional
public class ComplainService extends BusinessService<ComplainEntity> {

    @Autowired
    private AttachDocService attachDocService;

    private ComplainDao dao() {
        return (ComplainDao) dao;
    }


    public ComplainEntity getOne(String id) {
        ComplainEntity entity = dao().get(id);
        AttachDoc attachDoc = new AttachDoc();
        attachDoc.setBillid(id);
        List<AttachDoc> attachDocList = attachDocService.findList(attachDoc);
        int size = attachDocList.size();
        if (size > 0) {
            String[] attachPaths = new String[size];
            String[] attachNames = new String[size];
            for (int i = 0; i < size; i++) {
                AttachDoc tempAttachDoc = attachDocList.get(i);
                attachPaths[i] = tempAttachDoc.getPath();
                attachNames[i] = tempAttachDoc.getName();
            }
            entity.setAttachPaths(attachPaths);
            entity.setAttachNames(attachNames);
        }
        return entity;
    }
}