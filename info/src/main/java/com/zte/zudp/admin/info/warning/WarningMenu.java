package com.zte.zudp.admin.info.warning;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@EndpointModule(id = "warningManager", name = "报警管理", order = 300, icon = "home")
@RequestMapping("/warningMenu")
public class WarningMenu {

}
