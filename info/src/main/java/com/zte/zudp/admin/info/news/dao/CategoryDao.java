package com.zte.zudp.admin.info.news.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.news.entity.Category;

import java.util.List;

public interface CategoryDao extends AbstractDao<Category> {

    //查询所有
    public List<Category> list();
}
