package com.zte.zudp.admin.info.complain.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.complain.CategoryMenu;
import com.zte.zudp.admin.info.complain.entity.ComplainEntity;
import com.zte.zudp.admin.info.complain.entity.DeptEntity;
import com.zte.zudp.admin.info.complain.service.ComplainService;
import com.zte.zudp.admin.info.complain.service.DeptService;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description ${}
 * @Author DeptController
 * @Date 2019/11/26 11:45
 **/
@RestController
@EndpointModule(name = "公众线上投诉/建议管理", id = "public", parent = CategoryMenu.class, order = 19, icon = "bookmark")
@RequestMapping("/p")
public class ComplainController extends AbstractCRUDController<ComplainEntity> {

    private ComplainService service() {
        return (ComplainService) service;
    }

    @JSON(include = "id, department", type = ComplainEntity.class)
    @GetMapping(value = "/deptList")
    @EndpointRest(id = "deptList", name = "种类下拉列表展示", authorizedType = AuthorizedType.LOGIN)
    public List<ComplainEntity> deptList() {
        System.out.println(service().findList());
        return service().findList();
    }


    @JSON
    @GetMapping({"/getAttach/{id}"})
    public ComplainEntity getAttach(@PathVariable("id") String id) {
        return service().getOne(id);
    }

}
