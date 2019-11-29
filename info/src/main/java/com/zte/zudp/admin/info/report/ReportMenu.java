package com.zte.zudp.admin.info.report;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 公众上报管理
 * @author 闵思迁
 */

@Controller
@EndpointModule(id="reportManage",name = "公众上报管理", order = 2,icon = "home")
@RequestMapping("/reportMenu")
public class ReportMenu {

    /**
     *查看公共上报列表
     * @return 公共上报列表页面
     */
    @Menu
    @GetMapping("/report")
    @EndpointPage(id = "reprotlist", name = "公共上报列表", order = 1,icon = "cog")
    public String reportsList() {
        return "/info/report/reportlist";
    }

    /**
     * 跳转到前台H5页面
     * @return 公众上报页面
     */
    @GetMapping("/submit")
    public String submit()
    {
        return "/info/report/report";
    }
}
