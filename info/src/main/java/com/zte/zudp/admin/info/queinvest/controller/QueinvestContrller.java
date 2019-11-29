package com.zte.zudp.admin.info.queinvest.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.queinvest.QueinvestMenu;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.info.queinvest.service.QueinvestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 *  问卷调查
 */
@RestController
@EndpointModule(name = "问卷调查", id = "queinvest", parent = QueinvestMenu.class, order = 1, icon = "home")
@RequestMapping("/queinvest")
public class QueinvestContrller extends AbstractCRUDController<Queinvest> {
    @Autowired
    private QueinvestService queinvestService;


    @JSON
    @GetMapping(value = "/getAllType")
    @EndpointRest(id = "List", name = "问卷类型下拉", authorizedType = AuthorizedType.GUEST)
    public List<Queinvest> getlist() {
        List<Queinvest> list = queinvestService.getList();
//        for (int i = 0; i < list.size(); i++) {
//            if (list.get(i).getQueinvestType().equals("0")) { //0：行政类 1：生活类 2：经济类
//                list.get(i).setQueinvestType("行政类");
//            } else if (list.get(i).getQueinvestType().equals("1")) {
//                list.get(i).setQueinvestType("生活类");
//            } else if (list.get(i).getQueinvestType().equals("2")) {
//                list.get(i).setQueinvestType("经济类");
//            }
//        }
        return list;
    }


    @JSON
    @GetMapping(value = "/getOneType")
    @EndpointRest(id = "listAttach", name = "问卷下拉", authorizedType = AuthorizedType.GUEST)
    public Queinvest getOneType(String id) {
        Queinvest queinvest= queinvestService.get(id);
        if ((queinvest.getQueinvestType()).equals("0")) { //0：行政类 1：生活类 2：经济类
            queinvest.setQueinvestType("行政类");
        } else if ((queinvest.getQueinvestType()).equals("1")) {
            queinvest.setQueinvestType("生活类");
        } else if ((queinvest.getQueinvestType()).equals("2")) {
            queinvest.setQueinvestType("经济类");
        }
        return queinvest;
    }

}



