package com.zte.zudp.admin.info.welllid;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 井盖信息
 */
@Controller
@EndpointModule(id = "lidManager",name="井盖信息管理",order = 1030,icon = "cogs",parent = JGMenu.class)
@RequestMapping("/welllid")
public class WellLidMenu {
    @Menu
    @GetMapping("/lid")
    @EndpointPage(id = "lidlist",name="井盖信息",order = 1,icon = "cog")
    public String LidModeler(){
        return "/info/welllid/lid";
    }
}
