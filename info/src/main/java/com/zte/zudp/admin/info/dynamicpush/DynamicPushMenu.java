package com.zte.zudp.admin.info.dynamicpush;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@EndpointModule(id = "dynamicPushManage",name = "动态推送管理",order = 3,icon = "home")
@RequestMapping("/dynamicPushMenu")
public class DynamicPushMenu {

    /**
     *查看动态推送列表
     * @return 动态推送列表
     */
    @Menu
    @GetMapping("/dynamicPush")
    @EndpointPage(id = "dynamicPush", name = "动态推送列表", order = 1,icon = "cog")
    public String reportsList() {
        return "/info/dynamicpush/dynamicPush";
    }
}
