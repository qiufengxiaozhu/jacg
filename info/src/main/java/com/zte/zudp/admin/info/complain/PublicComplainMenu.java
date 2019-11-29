package com.zte.zudp.admin.info.complain;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import com.zte.zudp.admin.info.complain.entity.DeptEntity;
import com.zte.zudp.admin.info.complain.service.ComplainService;
import com.zte.zudp.admin.info.complain.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @Description 部门管理
 * @Author DeptMenu
 * @Date 2019/11/26 11:26
 **/
@Controller
@EndpointModule(id = "pComplainManager", name = "投诉/建议管理",parent =  ComplainMenu.class, order = 2 ,icon = "cogs")
@RequestMapping("/pComplain")
public class PublicComplainMenu {

    @Autowired
    private ComplainService complainService;

    @Autowired
    private DeptService deptService;

    @Menu
    @GetMapping("/p")
    @EndpointPage(id = "pComplain", name = "公众投诉/建议", order = 2,icon = "cog")
    public String processModeler() {
        return "/info/complain/pComplain";
    }

    @Menu
    @GetMapping("/testPage")
    public ModelAndView testPage() {
        ModelAndView modelAndView = new ModelAndView("/info/complain/testPage");
//        modelAndView.addObject("number", "SUCCESS");
        return modelAndView;
    }


    @Menu
    @GetMapping("/complain")
    public ModelAndView complain() {
        ModelAndView modelAndView = new ModelAndView("/info/complain/complain");

        List<DeptEntity> deptList = deptService.findList();
        System.out.println("===================================================================");
        System.out.println("===================================================================");
        System.out.println("===================================================================");
        System.out.println("===================================================================");
        System.out.println("===================================================================");
        for (DeptEntity entity : deptList) {
            System.out.println(entity);
        }
        modelAndView.addObject("deptList", deptList);


//        modelAndView.addObject("number", "SUCCESS");
        return modelAndView;
    }
}
