package com.zte.zudp.admin.info;


import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 其他模块菜单
 */
@Controller
@EndpointModule(id = "otherManager", name = "其他模块", order = 999, icon = "home")
@RequestMapping("/OtherMenu")
public class OtherMenu {


}
