package com.zte.zudp.admin.mm.integrate.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.mm.integrate.dao.MMIntegrateDao;
import com.zte.zudp.admin.mm.integrate.entity.MMIntegrate;
import com.zte.zudp.admin.mm.queinvest.dao.MMQueinvestDao;
import com.zte.zudp.admin.mm.queinvest.entity.MMQueinvest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 问卷调查
 */


@Service
@Transactional
public class MMIntegrateService extends BusinessService<MMIntegrate> {

    @Autowired
    private MMIntegrateDao mmIntegrateDao;

    /**
     * 查询所有的积分信息
     * @return
     */
    public List<MMIntegrate> selectAll() {
        return mmIntegrateDao.selectAll();
    }




}
