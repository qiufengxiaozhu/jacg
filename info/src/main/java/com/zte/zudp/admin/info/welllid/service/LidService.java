package com.zte.zudp.admin.info.welllid.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.welllid.dao.LidDao;
import com.zte.zudp.admin.info.welllid.entity.Lid;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 井盖管理service
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class LidService extends BusinessService<Lid> {
    @Resource
    private LidDao lidDao;
}
