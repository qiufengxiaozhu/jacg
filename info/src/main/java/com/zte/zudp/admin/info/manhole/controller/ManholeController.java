package com.zte.zudp.admin.info.manhole.controller;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.manhole.entity.Manhole;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EndpointModule(name = "井盖终端管理", id = "manhole", order = 17, icon = "bookmark")
@RequestMapping(value = "/manhole")
public class ManholeController extends AbstractCRUDController<Manhole> {

}
