package com.zte.zudp.admin.info.integrate;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@EndpointModule(id = "dataManager", name = "积分信息",parent =  IntegrateMenu.class, order = 1029 ,icon = "cogs")
@RequestMapping("/integrateData")
public class IntegrateDataMenu {
    @Menu
    @GetMapping("/dlist")
    @EndpointPage(id = "dlist", name = "积分查询", order = 1,icon = "cog")
    public String processModeler(Model model) {
        return "/info/integrate/integratelist";
    }
}
