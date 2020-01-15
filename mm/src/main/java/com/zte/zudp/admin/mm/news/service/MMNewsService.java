package com.zte.zudp.admin.mm.news.service;

import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.mm.news.dao.MMNewsDao;
import com.zte.zudp.admin.mm.news.entity.MMNews;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
@Transactional
public class MMNewsService extends FileBusinessService<MMNews> {

    @Autowired
    public MMNewsDao newsDao;

    //查询前三条数据
    public ArrayList<MMNews> find_threeNews(){
        return newsDao.find_threeNews();
    }

    //根据时区查询前三条数据
    public ArrayList<MMNews> find_threeNewsTime(String TimeZone){
        return newsDao.find_threeNewsTime(TimeZone);
    }

    /**
     * 根据id查找新闻
     */
    public MMNews find_news(String id){
        return newsDao.find_news(id);
    }

    /**
     * 将该新闻的点击量+1
     */
    public void add_newsClicks(String id){ newsDao.add_newsClicks(id);
    }

    /**
     * 查询所有
     */
    public ArrayList<MMNews> find_allNews(){
        return newsDao.find_allNews();
    }

    /**
     * 根据发布时间及时区查找新闻
     */
    public ArrayList<MMNews> find_newsTime(String newsDate,String TimeZone){
        return newsDao.find_newsTime(newsDate,TimeZone);
    }

    /**
     * 根据时区查询所有
     */
    public ArrayList<MMNews> find_allNewsList(String timeZone) {
        return newsDao.find_allNewsList(timeZone);
    }

    /**
     * 根据发布时间查找新闻
     */
    public ArrayList<MMNews> find_newsList(String newsDate) {
        return newsDao.find_newsList(newsDate);
    }

    /**
     * 根据电话号码 查询出名称
     * @param phone
     * @return
     */
    public String findNameByTel(String phone) {
      return  newsDao.findNameByTel(phone);
    }
}
