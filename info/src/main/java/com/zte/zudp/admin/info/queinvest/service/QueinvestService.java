package com.zte.zudp.admin.info.queinvest.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.queinvest.dao.QueinvestDao;
import com.zte.zudp.admin.info.queinvest.dao.QuestionDao;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class QueinvestService extends BusinessService<Queinvest> {


    @Autowired
    private QueinvestDao queinvestDao;
    /**
     *  下拉 问卷类型
     * @return
     */
    public List<Queinvest> getList() {
        return queinvestDao.getList();
    }


}
