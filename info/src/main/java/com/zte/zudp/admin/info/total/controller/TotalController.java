package com.zte.zudp.admin.info.total.controller;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.complain.service.ComplainService;
import com.zte.zudp.admin.info.total.TotalMenu;
import com.zte.zudp.admin.info.total.entity.TotalEntity;
import com.zte.zudp.admin.info.total.service.TotalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description ${}
 * @Author DeptController
 * @Date 2019/11/26 11:45
 **/
@RestController
@EndpointModule(name = "公众线上投诉/建议管理", id = "publicTotal", parent = TotalMenu.class, order = 19, icon = "bookmark")
@RequestMapping("/publicTotal")
public class TotalController extends AbstractCRUDController<TotalEntity> {

    @Autowired
    private TotalService totalService;
//
//    @JSON(include = "id, department", type = TotalEntity.class)
//    @GetMapping(value = "/deptList")
//    @EndpointRest(id = "deptList", name = "种类下拉列表展示", authorizedType = AuthorizedType.LOGIN)
//    public List<TotalEntity> deptList() {
//        System.out.println(service().findList());
//        return service().findList();
//    }
//
//
//    @JSON
//
    @GetMapping(value = "/findList")
    @EndpointRest(id = "findTotal", name = "分组累计积分", authorizedType = AuthorizedType.LOGIN)
    public List<TotalEntity> findTotal() {
        return totalService.findTotal();
    }


}
