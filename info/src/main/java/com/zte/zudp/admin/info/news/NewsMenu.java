package com.zte.zudp.admin.info.news;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 新闻管理
 * User: wlf
 * Date: 2019/1/16
 * Time: 14:00
 */

@Controller
//@EndpointModule(id = "newsManager", name = "新闻列表管理",parent =  MainMenu.class, order = 1029 ,icon = "cogs")
@RequestMapping("/news")
public class NewsMenu {
    @Menu
    @GetMapping("/newslist")
    @EndpointPage(id = "newsManager", name = "新闻资讯",parent =  MainMenu.class, order = 1029 ,icon = "cogs")
    public String processModeler(Model model) {
        return "/info/news/newslist";
    }
}
