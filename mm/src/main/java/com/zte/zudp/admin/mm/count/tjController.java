package com.zte.zudp.admin.mm.count;


import com.zte.zudp.admin.info.report.entity.Report;
import com.zte.zudp.admin.info.report.svr.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 *统计管理控制器
 *  @author  lc
 *
 */

@Controller
@RequestMapping(value = "/count")
public class tjController {

    @Autowired
    private ReportService reportService;

    @GetMapping("/countManage")
    @ResponseBody
    public List<Report> countManage(){
        return reportService.countManage();
    }
}
