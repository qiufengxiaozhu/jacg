package com.zte.zudp.admin.mm.protalreport.service;

import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.mm.protalreport.dao.MMReportDao;
import com.zte.zudp.admin.mm.protalreport.entity.MMReport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional(rollbackFor = Exception.class)
public class MMReportService  extends FileBusinessService<MMReport>{
    @Resource
    private MMReportDao mmReportDao;
    /**
     * 初始化附件关联表名
     */
    public MMReportService(){
        super.setTableName("zmj_report");
    }

    /**
     * 插入上报信息
     * @param mmReport
     * @return
     */
    public int insConsult(MMReport mmReport) {
        return mmReportDao.insReport(mmReport);
    }

    @Override
    public synchronized void afterInsert(MMReport mmReport) {
        super.afterInsert(mmReport);
    }
}