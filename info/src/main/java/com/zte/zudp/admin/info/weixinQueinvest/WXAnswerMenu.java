package com.zte.zudp.admin.info.weixinQueinvest;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import com.zte.zudp.admin.info.queinvest.QueMenu;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 微信问卷调查管理
 */

@Controller
@EndpointModule(id = "wxanswerManager", name = "答案管理",parent =  WXQueMenu.class, order = 1029 ,icon = "cogs")
@RequestMapping("/wxanswer")
public class WXAnswerMenu {
    @Menu
    @GetMapping("/wxalist")
    @EndpointPage(id = "wxanswerlist", name = "答案列表", order = 1,icon = "cog")
    public String processModeler(Model model) {
        return "/info/wxqueinvest/wxanswerlist";
    }
}