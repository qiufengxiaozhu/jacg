package com.zte.zudp.admin.info.consultation;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import com.zte.zudp.admin.info.consultation.entity.ConsultCategory;
import com.zte.zudp.admin.info.consultation.service.ConsultCategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * 公众咨询
 */
@Controller
@EndpointModule(id = "consultManager",name="公众咨询",order = 1030,icon = "cogs",parent = ZxMenu.class)
@RequestMapping("/consult")
public class ConsultMenu {
    @Resource
    private ConsultCategoryService consultCategoryService;

    @Menu
    @GetMapping("/category")
    @EndpointPage(id = "categorylist",name="种类管理",order = 1,icon = "cog")
    public String kindModeler(){
        return "/info/consultation/categorylist";
    }

    @Menu
    @GetMapping("/content")
    @EndpointPage(id = "contentlist",name="内容管理",order = 2,icon = "cog")
    public String contentModeler(){
        return "/info/consultation/contentlist";
    }


    @RequestMapping("/main")
    public String main(){
        return "/info/consultation/front/main";
    }

    @RequestMapping("/wyzx")
    public String showwyzx(Model model){
        List<ConsultCategory> categories = consultCategoryService.showCategory();
        model.addAttribute("list",categories);
        return "/info/consultation/front/wyzx";
    }
}
