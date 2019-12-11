package com.zte.zudp.admin.info.report.ctrl;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.consultation.entity.Consult;
import com.zte.zudp.admin.info.report.ReportMenu;
import com.zte.zudp.admin.info.report.entity.Report;
import com.zte.zudp.admin.info.report.svr.ReportService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 公众上报controller
 * @author
 */
@RestController
@EndpointModule(name = "公众上报管理", id = "report", parent = ReportMenu.class, order = 1, icon = "bookmark")
@RequestMapping("/report")
public class ReportController  extends AbstractCRUDController<Report> {
    @Resource
    private ReportService reportService;
    /**
     * 获取上报信息附件
     * @param id
     * @return
     */
    @RequestMapping("/getFj")
    @ResponseBody
    public Report getFj(String id){
        return reportService.get(id);
    }
}
