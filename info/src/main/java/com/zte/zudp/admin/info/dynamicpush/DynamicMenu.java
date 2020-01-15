package com.zte.zudp.admin.info.dynamicpush;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@EndpointModule(id="dynamicManage",name = "微信动态推送管理", order = 310,icon = "home")
@RequestMapping("/dynamicMenu")
public class DynamicMenu {
}
