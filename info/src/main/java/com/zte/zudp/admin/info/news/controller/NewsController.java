package com.zte.zudp.admin.info.news.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.news.entity.News;
import com.zte.zudp.admin.info.news.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@EndpointModule(name = "新闻管理", id = "news", order = 19, icon = "bookmark")
@RequestMapping(value = "/news")
public class NewsController extends AbstractCRUDController<News> {

    @Autowired
    private NewsService newsService;

    @JSON
    @GetMapping(value = "/list")
    @EndpointRest(id = "newsList", name = " ", authorizedType = AuthorizedType.GUEST)
    public List<News> newsList() {

        return newsService.findList();
    }

    @JSON
    @GetMapping(value = "/get")
    @EndpointRest(id = "newsList1", name = " ", authorizedType = AuthorizedType.GUEST)
    public News getlist(String id) {
        return newsService.get(id);
    }




    // /api/news/1232312
//    @RequestMapping("/news/{id}", RequestMethod.get) //查

//    @RequestMapping("/news/{id}", RequestMethod.put)//改

//    @RequestMapping("/news/{id}", RequestMethod.delete)//删
/// RESTFUL
//    @RequestMapping("/news/{id}", RequestMethod.post)//增
//    public T get(@PathVariable("id") String id) {
//        return (DataEntity)this.service.get(id);
//}
}
