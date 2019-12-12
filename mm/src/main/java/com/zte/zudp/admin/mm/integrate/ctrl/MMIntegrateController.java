package com.zte.zudp.admin.mm.integrate.ctrl;

import com.zte.zudp.admin.mm.integrate.entity.MMIntegrate;
import com.zte.zudp.admin.mm.integrate.service.MMIntegrateService;
import com.zte.zudp.admin.mm.queinvest.entity.MMQueinvest;
import com.zte.zudp.admin.mm.queinvest.service.MMQueinvestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 积分管理  前台
 */

@Controller
@RequestMapping(value = "/mm/integrate")
public class MMIntegrateController {

    @Autowired
    private MMIntegrateService mmIntegrateService;


    /**
     * 积分列表
     * @param model
     * @return
     */
    @RequestMapping("/integrateList")
    public String survey(Model model) {
        // 查询出所有的积分信息
        List<MMIntegrate> integrateList=mmIntegrateService.selectAll();
        model.addAttribute("integrateList",integrateList);
        return "mm/integrate/integrateList";
    }




}
