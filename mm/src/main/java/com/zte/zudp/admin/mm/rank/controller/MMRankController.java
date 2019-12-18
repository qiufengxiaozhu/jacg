package com.zte.zudp.admin.mm.rank.controller;

import com.zte.zudp.admin.mm.rank.entity.MMRankEntity;
import com.zte.zudp.admin.mm.rank.service.serviceImp.MMRankServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
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
    public String index(@RequestParam Map<String , Object> map, Model model,HttpServletRequest request,@RequestParam("phone")String phone) {
        String telephone = "";
        //没有参数就写死
//        System.out.println(request.getSession().getAttribute("userPhone"));
        if (map.containsKey(phone))
            telephone = (String) map.get(phone);
        else
            telephone = "110";

        List<MMRankEntity> mmRankEntityList = mmRankService.rankListOfLimit();
        MMRankEntity rankEntity = mmRankService.myRank(phone);

        model.addAttribute("mmRankEntityList", mmRankEntityList);
        model.addAttribute("rankEntity", rankEntity);

        return "/mm/rank/ranklist";
    }
}
