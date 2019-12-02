package com.zte.zudp.admin.info.consultation.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.consultation.dao.ConsultCategoryDao;
import com.zte.zudp.admin.info.consultation.entity.ConsultCategory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 种类管理service
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class ConsultCategoryService extends BusinessService<ConsultCategory> {
    @Resource
    private ConsultCategoryDao consultCategoryDao;

    public List<ConsultCategory> showCategory(){
        return  consultCategoryDao.selCategory();
    }
}
