package com.zte.zudp.admin.info.queinvest;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@EndpointModule(id = "queManager", name = "问卷调查管理", order = 300, icon = "home")
@RequestMapping("/queMenu")
public class QueMenu {

}
