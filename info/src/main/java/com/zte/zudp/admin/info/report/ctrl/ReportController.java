package com.zte.zudp.admin.info.report.ctrl;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.report.ReportMenu;
import com.zte.zudp.admin.info.report.entity.Report;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 公众上报controller
 * @author 闵思迁
 */
@RestController
@EndpointModule(name = "公众上报管理", id = "report", parent = ReportMenu.class, order = 1, icon = "bookmark")
@RequestMapping("/report")
public class ReportController  extends AbstractCRUDController<Report> {

}
