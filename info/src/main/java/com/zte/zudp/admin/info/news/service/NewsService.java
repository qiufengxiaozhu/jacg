package com.zte.zudp.admin.info.news.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.info.news.dao.NewsDao;
import com.zte.zudp.admin.info.news.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 公众新闻业务层
 */
@Service
@Transactional
public class NewsService extends FileBusinessService<News>{

    @Autowired
    private NewsDao newsDao;

    /**
     * 初始化附件关联表名
     */
    public NewsService(){
        super.setTableName("qgq_news");
    }

    public int updateRelease(String id){
        return newsDao.updateRelease(id);
    };

    public int updateCancel(String id){
        return newsDao.updateCancel(id);
    };

    public boolean checkName(String name,String id) {
        return newsDao.checkName(name,id) == 0;
    }
    public boolean checkIdentification(String identification,String id) {
        return newsDao.checkIdentification(identification,id) == 0;
    }

    public int saveNews(News news) {
//        IDUtil.simpleId();
        int i = newsDao.insert(news);

        if (i > 0) {
            this.afterInsert(news);
    }
        return i;
    }

    public static void main(String[] args) {
        long l = IDUtil.simpleId();
        System.out.println(l);
    }
}
