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
    @RequestMapping(value = "/findAllCases",method = RequestMethod.GET)
    public List<Map> findAllCases(String page,String startTime,String endTime,String description){
        int pages=Integer.valueOf(page);
        if(null != page && !"".equals(page)){
            pages = (pages -1) * 10;
        }
        //新增 (page-1)*5
        List<Map> list = casesService.findAllCases(pages,startTime,endTime,description);
        return list;

    }

    /**
     * 三级页面  详情
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/findCaseById",method = RequestMethod.GET)
    public Map findCaseById(String id){
        Map map = casesService.findCaseById(id);
        return map;
    }



}
