package com.zte.zudp.admin.info.weixinQueinvest;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 微信公众调查后台   主菜单
 */
@Controller
@EndpointModule(id = "wxqueManager", name = "微信公众调查管理", order = 300, icon = "home")
@RequestMapping("/wxqueMenu")
public class WXQueMenu {

}
