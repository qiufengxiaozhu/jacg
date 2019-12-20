package com.zte.zudp.admin.mm.issueReport.service;

import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.mm.issueReport.dao.MMIssueReportDao;
import com.zte.zudp.admin.mm.issueReport.entity.MMIssueReport;
import com.zte.zudp.admin.mm.protalreport.dao.MMReportDao;
import com.zte.zudp.admin.mm.protalreport.entity.MMReport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
@Transactional(rollbackFor = Exception.class)
public class MMIssueReportService extends FileBusinessService<MMIssueReport>{
    @Autowired
    private MMIssueReportDao mmIssueReportDao;
    /**
     * 初始化附件关联表名
     */
    public MMIssueReportService(){
        super.setTableName("jacg_issuereport");
    }

    /**
     * 插入上报信息
     * @param
     * @return
     */
    public int insConsult(MMIssueReport mmIssueReport) {
        long l = IDUtil.simpleId();
        String id = String.valueOf(l);
        mmIssueReport.setId(id);
        return mmIssueReportDao.insReport(mmIssueReport);
    }

    /**
     * 查询出我的问题上报列表
     * @param phone
     * @param name
     * @return
     */
    public List<MMIssueReport> myReportList(Object phone,Object name){
        return mmIssueReportDao.myReportList(phone,name);
    }

    @Override
    public synchronized void afterInsert(MMIssueReport mmIssueReport) {
        super.afterInsert(mmIssueReport);
    }

    /**
     * 去数据库中匹配电话和用户名称
     * @param userName
     * @param userPhone
     * @return
     */
//    public List<Map> checkUserAndPhone( ) {
//        return  mmReportDao.checkUserAndPhone( );
//    }
}
