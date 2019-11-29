package com.zte.zudp.admin.info.analysis;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 统计分析菜单
 * @author 闵思迁
 */


@Controller
@EndpointModule(id="analysisManage",name = "统计分析",order = 100, icon = "home")
@RequestMapping("/analysisMenu")
public class AnalysisMenu {

    /**
     *查看统计分析页面
     * @return 统计分析页面
     */
    @Menu
    @GetMapping("/analysis")
    @EndpointPage(id = "analysis", name = "统计分析页面", order = 1,icon = "cog")
    public String reportsList() {
        return "/info/analysis/analysis";
    }


}
