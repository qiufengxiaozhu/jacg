package com.zte.zudp.admin.info.integrate.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.integrate.dao.IntegrateDao;
import com.zte.zudp.admin.info.integrate.entity.Integrate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class IntegrateService extends BusinessService<Integrate> {


    @Autowired
    private IntegrateDao integrateDao;

    /**
     * 新增到积分表中数据
     * @param type
     * @param fId
     * @param tel
     */
    public void insertToIntegrate(String type, String fId, String tel) {
        // 生成一个无序的id值
        long l = IDUtil.simpleId();
        String id = String.valueOf(l);
        integrateDao.insertToIntegrate(type,fId,tel,id);
    }
}
