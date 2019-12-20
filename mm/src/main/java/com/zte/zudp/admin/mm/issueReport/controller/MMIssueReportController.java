package com.zte.zudp.admin.mm.issueReport.controller;

import com.zte.zudp.admin.common.persistence.Subject;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.integrate.service.IntegrateService;
import com.zte.zudp.admin.mm.complain.entity.MMComplainEntity;
import com.zte.zudp.admin.mm.integrate.ctrl.MMIntegrateController;
import com.zte.zudp.admin.mm.integrate.service.MMIntegrateService;
import com.zte.zudp.admin.mm.issueReport.entity.MMIssueReport;
import com.zte.zudp.admin.mm.issueReport.service.MMIssueReportService;
import com.zte.zudp.admin.mm.protalreport.entity.MMReport;
import com.zte.zudp.admin.mm.protalreport.service.MMReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/mm/issueReport")
public class MMIssueReportController {
    @Autowired
    private MMIssueReportService mmIssueReportService;




    @GetMapping("/toMyIndex")
    public String toMyIndex(){
        return "/mm/issueReport/addissueReport";
    }

    /**
     * 添加上报信息
     * @param
     * @return
     */
    @RequestMapping("/addIssueReport")
    public String addAdvisory(MMIssueReport mmIssueReport){

//        integrateService.insertToIntegrate("1",mmReport.getId(),mmReport.getTelephone());
        int i = mmIssueReportService.insConsult(mmIssueReport);
        mmIssueReportService.afterInsert(mmIssueReport);
        if (i>0){
                return "redirect:/mm/news/index";
        }
        return null;
    }

    @RequestMapping("/toMyReportList")
    public String myReportList(Model model,HttpServletRequest request){
        // 传入电话号码 、用户名称，进行校验
        Object name = request.getSession().getAttribute("userName");
        Object phone = request.getSession().getAttribute("userPhone");

        List<MMIssueReport> reportList = mmIssueReportService.myReportList(phone,name);
        model.addAttribute("reportList",reportList);
        return "/mm/issueReport/myIssueReport";
    }

    /**
     * 我的问题上报详情查询   (只能查询到已回复的详情)
     * @param map
     * @param model
     * @return
     */
    @RequestMapping(value = "/reportDetail", method = RequestMethod.POST)
    public String reportDetail(@RequestParam Map<String, Object> map,
                                 Model model) {
        // 获取到本次的上报的id,根据id来进行查询
        String id = (String) map.get("id");
        MMIssueReport mmIssueReport = mmIssueReportService.get(id);
        model.addAttribute("mmIssueReport",mmIssueReport);
        return "/mm/issueReport/issueReportDetail";
    }


}
