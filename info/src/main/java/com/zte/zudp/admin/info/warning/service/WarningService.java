package com.zte.zudp.admin.info.warning.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.warning.dao.WarningDao;
import com.zte.zudp.admin.info.warning.entity.Warning;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WarningService extends BusinessService<Warning> {


    @Autowired
    private WarningDao warningDao;

    public void updateStatus(String id) {
        warningDao.updateStatus(id);
    }
}
