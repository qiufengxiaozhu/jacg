package com.zte.zudp.admin.info.report.svr;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.info.consultation.entity.Consult;
import com.zte.zudp.admin.info.report.dao.MultimediaResourcesDao;
import com.zte.zudp.admin.info.report.dao.ReportDao;
import com.zte.zudp.admin.info.report.entity.Report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *公众上报service
 *@author
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class ReportService extends FileBusinessService<Report> {

    @Autowired
    private ReportDao reportDao;


    /*统计管理*/
    @Transactional
    public List<Report> countManage(){
        return reportDao.countManage();
    }

    
}
