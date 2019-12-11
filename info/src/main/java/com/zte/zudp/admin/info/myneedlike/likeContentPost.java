package com.zte.zudp.admin.info.myneedlike;


import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@EndpointModule(id = "likeContent", name = "内容发布",parent =  likeMenu.class, order = 1029 ,icon = "cogs")
@RequestMapping("/likeContentPost")
public class likeContentPost {
    @Menu
    @GetMapping("/likeList")
    @EndpointPage(id = "likeList", name = "内容列表", order = 1,icon = "cog")
    public String processModeler(Model model) {
        return "/info/myneedlike/likeContentPost";
    }

}
