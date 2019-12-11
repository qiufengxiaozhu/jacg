package com.zte.zudp.admin.mm.news.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.mm.news.entity.MMNews;

import java.util.ArrayList;

public interface MMNewsDao extends AbstractDao<MMNews>{

    /**
     * 查询前三条数据
     */

    public ArrayList<MMNews> find_threeNews();

    /**
     * 根据id查找新闻
     */
    public MMNews find_news(String id);

    /**
     * 查询所有
     */
    public ArrayList<MMNews> find_allNews();

    /**
     * 根据发布时间查找新闻
     */
    public ArrayList<MMNews> find_newsTime(String newsDate);

    /**
     * 将该新闻的点击量+1
     */
    public void add_newsClicks(String id);

}
