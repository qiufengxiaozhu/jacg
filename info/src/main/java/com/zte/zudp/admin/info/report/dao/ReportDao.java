package com.zte.zudp.admin.info.report.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.consultation.entity.Consult;
import com.zte.zudp.admin.info.report.entity.Report;

import java.util.List;

/**
 *公众上报dao
 *@author
 */
public interface ReportDao extends AbstractDao<Report> {

    //统计管理
    List<Report> countManage();
}
