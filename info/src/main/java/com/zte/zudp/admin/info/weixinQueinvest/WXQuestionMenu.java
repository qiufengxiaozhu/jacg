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
@EndpointModule(id = "wxquestionManager", name = "微信题目管理",parent =  WXQueMenu.class, order = 2 ,icon = "cogs")
@RequestMapping("/wxquestion")
public class WXQuestionMenu {
    @Menu
    @GetMapping("/wxquestionlist")
    @EndpointPage(id = "wxquestionlist", name = "微信题目列表", order = 2,icon = "cog")
    public String processModeler(Model model) {
        return "/info/wxqueinvest/wxquestion";
    }
}
