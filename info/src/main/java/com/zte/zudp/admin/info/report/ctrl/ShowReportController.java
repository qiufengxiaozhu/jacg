package com.zte.zudp.admin.info.report.ctrl;

import com.zte.zudp.admin.info.report.entity.Report;
import com.zte.zudp.admin.info.report.svr.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/reports")
public class ShowReportController {

//    @Autowired
//    private ReportService reportService;
//
//    @PostMapping("upload")
//    public void submit(Report report) {
//        System.out.println("上传成功！");
////        return Result.success("操作成功！");
//    }
}
