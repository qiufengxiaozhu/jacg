package com.zte.zudp.admin.info.complain.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.complain.dao.ComplainDao;
import com.zte.zudp.admin.info.complain.entity.ComplainEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description ${}
 * @Author ComplainService
 * @Date 2019/11/26 19:19
 **/
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class ComplainService extends BusinessService<ComplainEntity> {

    private ComplainDao dao() {
        return (ComplainDao) dao;
    }
}
