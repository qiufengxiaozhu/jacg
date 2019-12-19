package com.zte.zudp.admin.info.dynamicpush;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import com.zte.zudp.admin.info.integrate.IntegrateMenu;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@EndpointModule(id = "dynamicManager", name = "动态推送信息",parent =  DynamicMenu.class, order = 1029 ,icon = "cogs")
@RequestMapping("/dynamicPushData")
public class DynamicPushMenu {
    @Menu
    @GetMapping("/dylist")
    @EndpointPage(id = "dylist", name = "动态推送查询", order = 1,icon = "cog")
    public String processModeler(Model model) {
        return "/info/dynamicpush/dyPush";
    }
}
