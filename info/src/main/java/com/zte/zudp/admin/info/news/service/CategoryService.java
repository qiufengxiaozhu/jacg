package com.zte.zudp.admin.info.news.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.news.dao.CategoryDao;
import com.zte.zudp.admin.info.news.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class CategoryService extends BusinessService<Category>{

    @Autowired
    private CategoryDao categoryDao;
}
