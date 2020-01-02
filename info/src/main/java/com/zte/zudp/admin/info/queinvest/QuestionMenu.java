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
@EndpointModule(id = "questionManager", name = "题目管理",parent =  QueMenu.class, order = 2 ,icon = "cogs")
@RequestMapping("/question")
public class QuestionMenu{
    @Menu
    @GetMapping("/questionlist")
    @EndpointPage(id = "questionlist", name = "题目列表", order = 2,icon = "cog")
    public String processModeler(Model model) {
        return "/info/queinvest/question";
    }
}
