package com.zte.zudp.admin.info.report;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 公众上报管理
 * @author 闵思迁
 */

@Controller
@EndpointModule(id="reportManage",name = "公众上报", order = 30,icon = "home")
@RequestMapping("/reportMenu")
public class ReportMenu {

    /**
     *查看公共上报列表
     * @return 公共上报列表页面
     */
    @Menu
    @GetMapping("/report")
    @EndpointPage(id = "reprotlist", name = "公众上报列表", order = 1,icon = "cog")
    public String reportsList() {
        return "/info/report/reportlist";
    }


    /*@GetMapping("/submit")
    public String submit()
    {
        return "/info/report/report";
    }*/
}
