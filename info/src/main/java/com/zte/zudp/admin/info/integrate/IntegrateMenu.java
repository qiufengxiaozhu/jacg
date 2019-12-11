package com.zte.zudp.admin.info.integrate;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 积分管理
  */

@Controller
@EndpointModule(id = "integrateManager", name = "积分管理", order = 300, icon = "home")
@RequestMapping("/integrateMenu")
public class IntegrateMenu {

}
