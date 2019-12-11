package com.zte.zudp.admin.info.news.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.news.entity.News;
import org.apache.ibatis.annotations.Param;

/**
 * 公众新闻持久层
 */
public interface NewsDao extends AbstractDao<News>{

    //根据id修改编辑状态
    public int updateRelease(String id);

    //根据id修改编辑状态
    public int updateCancel(String id);

    /**
     * 校验岗位名称是否重复
     * @param name
     * @param id
     * @return
     */
    int checkName(@Param("name") String name, @Param("id") String id);

    /**
     * 校验岗位标识是否存在
     * @param identification
     * @param id
     * @return
     */

    int checkIdentification(@Param("identification") String identification, @Param("id") String id);

    /**
     * 新增新闻
     */
    public int insertNews(News news);
}

