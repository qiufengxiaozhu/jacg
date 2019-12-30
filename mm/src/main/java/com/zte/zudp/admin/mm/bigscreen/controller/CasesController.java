package com.zte.zudp.admin.mm.bigscreen.controller;

import com.zte.zudp.admin.mm.bigscreen.service.CasesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 案件
 */
@Controller
@RequestMapping("/mm/screen")
public class CasesController {

    // 注入service
    @Autowired
    private CasesService casesService;
    /**
     * 查询所有的案件列表
     */
    @ResponseBody
    @RequestMapping(value = "/findAllCases",method = RequestMethod.POST)
    public List<Map> findAllCases(){
        List<Map> caseList = casesService.findAllCases();
        return caseList;
    }
}
