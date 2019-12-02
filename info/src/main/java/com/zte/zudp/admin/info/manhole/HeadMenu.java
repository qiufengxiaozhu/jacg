package com.zte.zudp.admin.info.manhole;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 系统管理菜单<br />
 * 本类存放 <strong>系统管理</strong> 相关的所有页面跳转
 *
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-02-05.
 */
@Controller
@EndpointModule(id = "headManager", name = "井盖终端", order = 100, icon = "home")
@RequestMapping("/headMenu")
public class HeadMenu {


}
