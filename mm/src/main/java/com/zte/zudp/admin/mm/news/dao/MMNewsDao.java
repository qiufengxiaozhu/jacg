package com.zte.zudp.admin.mm.news.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.mm.news.entity.MMNews;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface MMNewsDao extends AbstractDao<MMNews>{

    /**
     * 查询前三条数据
     */

    public ArrayList<MMNews> find_threeNews();

    /**
     * 根据时区查询前三条数据
     */
    public ArrayList<MMNews> find_threeNewsTime(String TimeZone);


    /**
     * 根据id查找新闻
     */
    public MMNews find_news(String id);


    /**
     * 查询所有
     */
    public ArrayList<MMNews> find_allNews();

    /**
     * 根据发布时间及时区查找新闻
     */
    public ArrayList<MMNews> find_newsTime(@Param("newsDate") String newsDate,@Param("TimeZone") String TimeZone);

    /**
     * 将该新闻的点击量+1
     */
    public void add_newsClicks(String id);

    /**
     * 根据时区查询所有
     */
    ArrayList<MMNews> find_allNewsList(@Param("timeZone") String timeZone);

    /**
     * 根据发布时间查找新闻
     */
    ArrayList<MMNews> find_newsList(@Param("newsDate")String newsDate);

    /**
     * 根据手机号 查询出用户名
     * @param phone
     * @return
     */
    String findNameByTel(@Param("phone") String phone);
}
