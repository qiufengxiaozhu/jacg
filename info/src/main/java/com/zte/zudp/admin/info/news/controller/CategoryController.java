package com.zte.zudp.admin.info.news.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.news.entity.Category;
import com.zte.zudp.admin.info.news.service.CategoryService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 公众新闻类别控制器
 */
@RestController
@EndpointModule(name = "岗位管理", id = "category", order = 19, icon = "bookmark")
@RequestMapping(value = "/category")
public class CategoryController extends AbstractCRUDController<Category> {

    private CategoryService service() {
        return (CategoryService) service;
    }

//    @Autowired
//    private CategoryService categoryService;

    @JSON(include = "id,category", type = Category.class)
    @GetMapping(value = "/clist")
    @EndpointRest(id = "clist", name = "新闻种类下拉列表展示", authorizedType = AuthorizedType.LOGIN)
    public List<Category> userList() {
        return service().findList();

    }

    @JSON
    @GetMapping(value = "/findList")
    @EndpointRest(id = "List", name = " ", authorizedType = AuthorizedType.GUEST)
    public List<Category> getlist() {
        return service().findList();
    }
}
