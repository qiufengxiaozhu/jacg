package com.zte.zudp.admin.info.convenient;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @Description ${}
 * @Author OneMenu
 * @Date 2019/12/13 11:17
 **/

@Controller
@EndpointModule(id = "OneManager", name = "便民服务", order = 201, icon = "home")
@RequestMapping("/OneMenu")
public class OneMenu {


}