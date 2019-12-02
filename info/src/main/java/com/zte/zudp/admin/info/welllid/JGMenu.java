package com.zte.zudp.admin.info.welllid;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 井盖监控菜单<br />
 * 本类存放 <strong>井盖管理</strong> 相关的所有页面跳转
 *
 */
@Controller
@EndpointModule(id = "jgManager", name = "井盖监控", order =301, icon = "home")
@RequestMapping("/jgMenu")
public class JGMenu {


}
