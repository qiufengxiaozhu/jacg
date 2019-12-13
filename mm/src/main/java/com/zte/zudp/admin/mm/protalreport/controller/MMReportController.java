package com.zte.zudp.admin.mm.protalreport.controller;

import com.zte.zudp.admin.common.persistence.Subject;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.integrate.service.IntegrateService;
import com.zte.zudp.admin.mm.integrate.ctrl.MMIntegrateController;
import com.zte.zudp.admin.mm.integrate.service.MMIntegrateService;
import com.zte.zudp.admin.mm.protalreport.entity.MMReport;
import com.zte.zudp.admin.mm.protalreport.service.MMReportService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Date;

@Controller
@RequestMapping(value = "/report")
public class MMReportController {
    @Resource
    private MMReportService mmReportService;

    @Resource
    private IntegrateService integrateService;

    /**
     * 添加上报信息
     * @param mmReport
     * @return
     */
    @RequestMapping("/addreport")
    public String addAdvisory(MMReport mmReport){
        mmReport=getEntity(mmReport);
        integrateService.insertToIntegrate("1",mmReport.getId(),mmReport.getTelephone());
        int i = mmReportService.insConsult(mmReport);
        mmReportService.afterInsert(mmReport);
        if (i>0){
                return "redirect:/mm/news/index";
        }
        return null;
    }

    /**
     * 随机生成id
     * @param
     * @return
     */
    private MMReport getEntity(MMReport mmReport) {
        mmReport.setId(String.valueOf(IDUtil.simpleId()));
        Subject user = SubjectUtil.getSubject();
        mmReport.setCreateUser(user);
        mmReport.setUpdateUser(user);
        mmReport.setCreateDate(new Date());
        mmReport.setUpdateDate(mmReport.getCreateDate());
        return mmReport;
    }
}
