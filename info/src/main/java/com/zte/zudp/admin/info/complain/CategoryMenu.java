package com.zte.zudp.admin.info.complain;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description 部门管理
 * @Author DeptMenu
 * @Date 2019/11/26 11:26
 **/
@Controller
@EndpointModule(id = "categoryManager", name = "种类管理",parent =  ComplainMenu.class, order = 1 ,icon = "cogs")
@RequestMapping("/category")
public class CategoryMenu {

    @Menu
    @GetMapping("/dept")
    @EndpointPage(id = "deptManager", name = "部门管理", order = 1,icon = "cog")
    public String processModeler() {
        return "/info/complain/dept";
    }
}
