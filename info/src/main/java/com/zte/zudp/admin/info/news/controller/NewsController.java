package com.zte.zudp.admin.info.news.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.Result;
import com.zte.zudp.admin.common.persistence.Subject;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.news.entity.News;
import com.zte.zudp.admin.info.news.service.NewsService;
import org.omg.CORBA.OBJECT_NOT_EXIST;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import static javafx.application.Platform.exit;

/**
 * 公众新闻控制器
 */
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

    @JSON
    @GetMapping(value = "/update_release")
    @EndpointRest(id = "newsList2", name = " ", authorizedType = AuthorizedType.GUEST)
    public int updateRelease(String id) {
        return newsService.updateRelease(id);
    }

    @JSON
    @GetMapping(value = "/update_cancel")
    @EndpointRest(id = "newsList3", name = " ", authorizedType = AuthorizedType.GUEST)
    public int updateCancel(String id) {
        return newsService.updateCancel(id);
    }

    @JSON
    @GetMapping(value = "/checkName")
    @EndpointRest(id = "checkName", name = "校验名称是否存在", authorizedType = AuthorizedType.GUEST)
    public boolean checkName(String name,String id) {
        return newsService.checkName(name,id);
    }
    @JSON
    @GetMapping(value = "/checkIdenty")
    @EndpointRest(id = "checkIdenty", name = "校验岗位标识是否存在", authorizedType = AuthorizedType.GUEST)
    public boolean checkIdenty(String identy,String id) {
        return newsService.checkIdentification(identy,id);
    }

    /**
     * 新建新闻
     * @param news
     * @return
     */
    @JSON
    @PostMapping("/saveNews")
    @ResponseBody
    public Result saveNews(@RequestBody News news) {


        int i = newsService.saveNews(news);
        return Result.success("yes", "");//data 不能为 null，一定有对象
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
