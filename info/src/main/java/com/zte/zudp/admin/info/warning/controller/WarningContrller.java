package com.zte.zudp.admin.info.warning.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.queinvest.QuestionMenu;
import com.zte.zudp.admin.info.warning.entity.Warning;
import com.zte.zudp.admin.info.warning.service.WarningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@EndpointModule(name = "报警管理", id = "warning", parent = QuestionMenu.class, order = 1, icon = "home")
@RequestMapping(value = "/warning")
public class WarningContrller extends AbstractCRUDController<Warning>{

    @Autowired
    private WarningService warningService;

    /**
     * 修改操作
     */
    @JSON
    @PostMapping(value = "/updateStatus")
    @EndpointRest(id = "updateStatus", name = "", authorizedType = AuthorizedType.GUEST)

    public void updateStatus(String id){
        warningService.updateStatus(id);
    }

    }
