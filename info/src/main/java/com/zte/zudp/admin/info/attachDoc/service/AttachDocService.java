package com.zte.zudp.admin.info.attachDoc.service;


import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.attachDoc.dao.AttachDocDao;
import com.zte.zudp.admin.info.attachDoc.entity.AttachDoc;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @program: 业务附件表
 * @create: 2019-01-04
 **/
@Service
@Transactional
public class AttachDocService extends BusinessService<AttachDoc> {

    private AttachDocDao dao() {
        return (AttachDocDao) dao;
    }

//    public AttachDoc  findSame(AttachDoc attachDoc){
//        return dao().findSame(attachDoc);
//    };
}
