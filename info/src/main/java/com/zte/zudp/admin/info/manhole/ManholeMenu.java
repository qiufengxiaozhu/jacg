package com.zte.zudp.admin.info.manhole;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import com.zte.zudp.admin.info.news.MainMenu;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 岗位管理
 * User: wlf
 * Date: 2019/1/16
 * Time: 14:00
 */

@Controller
@RequestMapping("/manhole")
public class ManholeMenu {
    @Menu
    @GetMapping("/manholelist")
    @EndpointPage(id = "headManager", name = "井盖终端管理",parent =  HeadMenu.class, order = 1028 ,icon = "cogs")
    public String processModeler(Model model) {
        return "/info/manhole/manholelist";
    }
}
