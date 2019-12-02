package com.zte.zudp.admin.info.total.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.complain.dao.ComplainDao;
import com.zte.zudp.admin.info.complain.entity.ComplainEntity;
import com.zte.zudp.admin.info.total.dao.TotalDao;
import com.zte.zudp.admin.info.total.entity.TotalEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Description ${}
 * @Author ComplainService
 * @Date 2019/11/26 19:19
 **/
@Service
@Transactional
public class TotalService extends BusinessService<TotalEntity> {

    @Autowired
    private TotalDao totalDao;

    //积分分组
    public List<TotalEntity> findTotal() {
        return totalDao.findTotal();
    }
}
