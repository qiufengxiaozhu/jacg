package com.zte.zudp.admin.info.complain.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.complain.CategoryMenu;
import com.zte.zudp.admin.info.complain.entity.ComplainEntity;
import com.zte.zudp.admin.info.complain.entity.DeptEntity;
import com.zte.zudp.admin.info.complain.service.DeptService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Description ${}
 * @Author DeptController
 * @Date 2019/11/26 11:45
 **/
@RestController
@EndpointModule(name = "部门管理", id = "dept", parent = CategoryMenu.class, order = 19, icon = "bookmark")
@RequestMapping("/dept")
public class DeptController extends AbstractCRUDController<DeptEntity> {

    private DeptService service() {
        return (DeptService) service;
    }


    @JSON
    @GetMapping(value = "/checkDept")
    @EndpointRest(id = "checkDept", name = "校验 部门名称 是否存在", authorizedType = AuthorizedType.GUEST)
    public boolean checkDept(String department, String id) {
        return service().checkDept(department, id);
    }


    @JSON(include = "id,department,del", type = DeptEntity.class)
    @GetMapping(value = "/deptList")
    @EndpointRest(id = "deptList", name = "种类下拉列表展示", authorizedType = AuthorizedType.LOGIN)
    public List<DeptEntity> deptList() {
        System.out.println(service().findList());
        return service().findList();
    }

}
