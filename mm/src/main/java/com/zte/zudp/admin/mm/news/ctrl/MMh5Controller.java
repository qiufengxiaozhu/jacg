package com.zte.zudp.admin.mm.news.ctrl;

import com.zte.zudp.admin.info.report.entity.Report;
import com.zte.zudp.admin.info.report.svr.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: WZL
 * Date: 2019/12/4
 * Time: 21:36
 */


@Controller
@RequestMapping(value = "/mm/dz")
public class MMh5Controller {
    @GetMapping("/dzlist")
    public String dzlist(Model model) {
        return "/mm/dz/dzlist";
    }
    @GetMapping("/dzdetail")
    public String dzdetail(Model model) {
        return "/mm/dz/dzdetail";
    }
    @GetMapping("/cmanage")
    public String cmanage(Model model) {
        return "/mm/tj/cmanage";
    }
}
