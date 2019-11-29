package com.zte.zudp.admin.info.news.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.news.dao.NewsDao;
import com.zte.zudp.admin.info.news.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class NewsService extends BusinessService<News>{

    @Autowired
    private NewsDao newsDao;
}
