package com.zte.zudp.admin.info.queinvest;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 问卷调查管理
 */

@Controller
@EndpointModule(id = "queinvestManager", name = "问卷管理",parent =  QueMenu.class, order = 1 ,icon = "cogs")
@RequestMapping("/queinvest")
public class QueinvestMenu {
    @Menu
    @GetMapping("/qlist")
    @EndpointPage(id = "queinvestlist", name = "问卷列表", order = 1,icon = "cog")
    public String processModeler(Model model) {
        return "/info/queinvest/queinvestlist";
    }
}