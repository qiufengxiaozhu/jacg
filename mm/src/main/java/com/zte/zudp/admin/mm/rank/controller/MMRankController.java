package com.zte.zudp.admin.mm.rank.controller;

import com.zte.zudp.admin.mm.rank.entity.MMRankEntity;
import com.zte.zudp.admin.mm.rank.service.serviceImp.MMRankServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 * @Description 排行榜前台
 * @Author DeptController
 **/
@Controller
@RequestMapping(value = "/mm/rank")
public class MMRankController {

    @Autowired
    private MMRankServiceImpl mmRankService;

    @GetMapping("ranklist")
    public String index(@RequestParam Map<String , Object> map, Model model) {
        String telephone = "";
        //没有参数就写死
        if (map.containsKey("telephone"))
            telephone = (String) map.get("telephone");
        else
            telephone = "45";

        List<MMRankEntity> mmRankEntityList = mmRankService.rankListOfLimit();
        MMRankEntity rankEntity = mmRankService.myRank(telephone);

        model.addAttribute("mmRankEntityList", mmRankEntityList);
        model.addAttribute("rankEntity", rankEntity);

        return "/mm/rank/ranklist";
    }
}
