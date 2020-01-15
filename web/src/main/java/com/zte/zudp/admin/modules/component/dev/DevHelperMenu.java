package com.zte.zudp.admin.modules.component.dev;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zte.zudp.admin.common.Constants;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import com.zte.zudp.admin.common.enums.AuthorizedType;

/**
 * 开发助手 Menu
 *
 * @author DW
 * @version 1.0.0
 * @since 2018/4/2 14:36
 */
@Controller
@RequestMapping("/dev")
@EndpointModule(id = "devHelper", name = "开发助手", order = 10000, icon = "tripadvisor",
        authorizedType = AuthorizedType.SUBJECT, authorized = {Constants.Permission.SUPER_ADMIN})
public class DevHelperMenu {

    @Menu
    @GetMapping("/endpointTreeDetail")
    @EndpointPage(id = "endpointTree", name = "功能端点参考", order = 1, icon = "cubes")
    public String showEndpointTree() {
        return "/component/dev/endpointTree";
    }
}
