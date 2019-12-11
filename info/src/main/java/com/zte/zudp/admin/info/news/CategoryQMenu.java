package com.zte.zudp.admin.info.news;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 新闻类别管理
 * User: wlf
 * Date: 2019/1/16
 * Time: 14:00
 */

@Controller
//@EndpointModule(id = "Manager", name = "新闻列表管理",parent =  MainMenu.class, order = 1028 ,icon = "cogs")
@RequestMapping("/category")
public class CategoryQMenu {

    @Menu
    @GetMapping("/categorylist")
    @EndpointPage(id = "categoryManager", name = "新闻类别管理",parent =  MainMenu.class, order = 1028 ,icon = "cogs")
    public String processModeler(Model model) {
        return "/info/news/categorylist";
    }
}
