package com.zte.zudp.admin.info.welllid.controller;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.welllid.WellLidMenu;
import com.zte.zudp.admin.info.welllid.entity.Lid;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EndpointModule(name = "井盖管理", id = "lid", parent = WellLidMenu.class, order = 18, icon = "bookmark")
@RequestMapping("/lid")
public class LidController extends AbstractCRUDController<Lid> {

}
