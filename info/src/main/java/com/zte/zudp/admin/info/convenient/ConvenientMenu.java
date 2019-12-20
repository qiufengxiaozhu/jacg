package com.zte.zudp.admin.info.convenient;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import com.zte.zudp.admin.info.convenient.service.ConvenientService;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Description ${}
 * @Author ConvenientMenu
 * @Date 2019/12/13 11:21
 **/

@Controller
@RequestMapping("/convenient")
public class ConvenientMenu {

    @Autowired
    private ConvenientService convenientService;

    @Menu
    @GetMapping("/convenientlist")
    @EndpointPage(id = "OneManager", name = "便民服务管理",parent =  OneMenu.class, order = 1028 ,icon = "cogs")
    public String processModeler(Model model) {

        /**
         * 查询所有类别
         * @return
         */
        List<Dictionary> dictionary = convenientService.getTypeList();
        model.addAttribute("ListType", dictionary);

        return "/info/convenient/convenientlist";
    }
}
