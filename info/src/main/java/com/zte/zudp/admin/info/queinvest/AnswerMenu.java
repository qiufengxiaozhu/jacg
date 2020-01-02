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
@EndpointModule(id = "answerManager", name = "答案管理",parent =  QueMenu.class, order = 3 ,icon = "cogs")
@RequestMapping("/answer")
public class AnswerMenu {
    @Menu
    @GetMapping("/alist")
    @EndpointPage(id = "answerlist", name = "答案列表", order = 3,icon = "cog")
    public String processModeler(Model model) {
        return "/info/queinvest/answerlist";
    }
}