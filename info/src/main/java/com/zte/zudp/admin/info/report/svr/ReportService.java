package com.zte.zudp.admin.info.report.svr;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.report.dao.MultimediaResourcesDao;
import com.zte.zudp.admin.info.report.dao.ReportDao;
import com.zte.zudp.admin.info.report.entity.Report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *公众上报service
 *@author 闵思迁
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class ReportService extends BusinessService<Report> {

    @Autowired
    private ReportDao reportDao;

    @Autowired
    private MultimediaResourcesDao multimediaResourcesDao;

    public String report(Report report){


        return "";
    }



}
