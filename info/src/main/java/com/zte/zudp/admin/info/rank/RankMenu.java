package com.zte.zudp.admin.info.rank;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description 排行榜
 * @Author RankMenu
 * @Date 2019/12/11 21:03
 **/
@Controller
@EndpointModule(id = "rankManager", name = "排行榜", order = 355, icon = "home")
@RequestMapping("/rank")
public class RankMenu {

    @Menu
    @GetMapping("/rankList")
    @EndpointPage(id = "rankList", name = "排行榜详情", order = 1,icon = "cog")
    public String processModeler(Model model) {
        return "/info/rank/ranklist";
    }
}
