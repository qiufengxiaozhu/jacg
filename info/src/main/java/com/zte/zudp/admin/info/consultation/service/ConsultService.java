package com.zte.zudp.admin.info.consultation.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.consultation.dao.ConsultDao;
import com.zte.zudp.admin.info.consultation.entity.Consult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class ConsultService extends BusinessService<Consult>{
    @Resource
    private ConsultDao consultDao;

}
