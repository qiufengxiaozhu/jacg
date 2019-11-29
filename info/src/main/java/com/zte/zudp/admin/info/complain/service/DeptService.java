package com.zte.zudp.admin.info.complain.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.complain.dao.DeptDao;
import com.zte.zudp.admin.info.complain.entity.DeptEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description ${}
 * @Author DeptService
 * @Date 2019/11/26 11:12
 **/
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class DeptService extends BusinessService<DeptEntity> {

    private DeptDao dao() {
        return (DeptDao) dao;
    }

    public boolean checkDept(String department, String id) {
        return dao().checkDept(department, id) == 0;
    }

}
