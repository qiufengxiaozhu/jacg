package com.zte.zudp.admin.info.warning;

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
@EndpointModule(id = "dataManager", name = "报警信息",parent =  WarningMenu.class, order = 1029 ,icon = "cogs")
@RequestMapping("/data")
public class WarningDataMenu {
    @Menu
    @GetMapping("/dlist")
    @EndpointPage(id = "datalist", name = "报警信息列表", order = 1,icon = "cog")
    public String processModeler(Model model) {
        return "/info/warning/warninglist";
    }
}