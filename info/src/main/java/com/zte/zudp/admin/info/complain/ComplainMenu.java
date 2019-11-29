package com.zte.zudp.admin.info.complain;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description 系统菜单管理
 *              本类存放 complain 公众投诉/建议模块 相关页面跳转
 * @Author ComplainMenu
 * @Date 2019/11/26 11:20
 **/
@Controller
@EndpointModule(id = "complainManager", name = "公众投诉/建议管理", order = 299, icon = "home")
@RequestMapping("/complain")
public class ComplainMenu {

}
