package com.zte.zudp.admin.mm;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
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
@EndpointModule(id = "postManager", name = "子测试管理",parent =  OaMenu.class, order = 1029 ,icon = "cogs")
@RequestMapping("/post")
public class PostMenu {
    @Menu
    @GetMapping("/plist")
    @EndpointPage(id = "postlist", name = "子测试列表", order = 1,icon = "cog")
    public String processModeler(Model model) {
        return "/modules/mm/postlist";
    }
}
