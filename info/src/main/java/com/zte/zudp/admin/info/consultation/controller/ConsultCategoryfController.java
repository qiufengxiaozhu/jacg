package com.zte.zudp.admin.info.consultation.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.consultation.ConsultMenu;
import com.zte.zudp.admin.info.consultation.entity.ConsultCategory;
import com.zte.zudp.admin.info.consultation.service.ConsultCategoryService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@EndpointModule(name = "种类管理", id = "consultCategory", parent = ConsultMenu.class, order = 18, icon = "bookmark")
@RequestMapping("/consultCategory")
public class ConsultCategoryfController extends AbstractCRUDController<ConsultCategory> {
    @Resource
    private ConsultCategoryService consultCategoryService;


    @JSON(include = "id,name", type = ConsultCategory.class)
    @GetMapping(value = "/clist")
    @EndpointRest(id = "clist", name = "种类下拉列表展示", authorizedType = AuthorizedType.LOGIN)
    public List<ConsultCategory> categoryList() {
        return consultCategoryService.findList();

    }

    @JSON(include = "id,name", type = ConsultCategory.class)
    @GetMapping(value = "/getcategory")
    @EndpointRest(id = "getcategory", name = "获取种类", authorizedType = AuthorizedType.LOGIN)
    public ConsultCategory getcategory(String id) {
        return consultCategoryService.get(id);

    }




}
