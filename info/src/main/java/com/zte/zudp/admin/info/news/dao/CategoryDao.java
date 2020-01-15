package com.zte.zudp.admin.info.news.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.news.entity.Category;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 公众新闻类别持久层
 */
@Repository
public interface CategoryDao extends AbstractDao<Category> {

    //查询所有
    public List<Category> list();

    //检验名称是否重复
    int checkName(@Param("category") String category,@Param("id") String id);
}
