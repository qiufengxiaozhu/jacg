package com.zte.zudp.admin.mm.convenient.controller;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.convenient.entity.Convenient;
import com.zte.zudp.admin.info.convenient.service.ConvenientService;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.mm.convenient.entity.MMConvenient;
import com.zte.zudp.admin.mm.convenient.service.MMConvenientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Description ${}
 * @Author ConvenientController
 * @Date 2019/12/16 8:42
 **/

@Controller
@RequestMapping(value = "/mm/mmConvenient")
public class MMConvenientController{

    @Autowired
    private MMConvenientService mmConvenientService;


    /**
     * 查询所有类别
     * @return
     */
    @GetMapping("/getConvenientType")
    public String getConvenientType(Model model){

        List<Dictionary> dictionaryList = mmConvenientService.getConvenientType();
        model.addAttribute("ListType", dictionaryList);

        return "/mm/news/convenience";
    }



}
