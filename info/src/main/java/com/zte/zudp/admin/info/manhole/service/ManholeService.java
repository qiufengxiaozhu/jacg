package com.zte.zudp.admin.info.manhole.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.manhole.dao.ManholeDao;
import com.zte.zudp.admin.info.manhole.entity.Manhole;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class ManholeService extends BusinessService<Manhole> {


    private ManholeDao manholeDao;
}
