package com.zte.zudp.admin.mm.bigscreen.controller;

import com.zte.zudp.admin.mm.bigscreen.service.TheMostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 之最
 */
@Controller
@RequestMapping("/mm/screen")
public class TheMostController {

    @Autowired
    private TheMostService theMostService;
    /**
     * 最新 最长 最频繁
     */
    @ResponseBody
    @RequestMapping(value = "/findTheMost",method = RequestMethod.POST)
    public Map findTheMost(){

        // 创建map
        Map map = new  HashMap();
        // 查询最新
        List<Map> list01 = theMostService.findMostNew();
        // 查询最长
        List<Map> list02 = theMostService.findMostLength();
        // 查询最频繁
        List<Map> list03 = theMostService.findMostFrequent();

        // 最新
        map.put("list01",list01);
        // 最长
        map.put("list02",list02);
        // 最频繁
        map.put("list03",list03);
        return map;

    }
}
