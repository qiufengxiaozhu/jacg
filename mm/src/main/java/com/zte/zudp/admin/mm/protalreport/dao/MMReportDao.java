package com.zte.zudp.admin.mm.protalreport.dao;

        import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
        import com.zte.zudp.admin.mm.protalreport.entity.MMReport;

        import java.util.List;

public interface MMReportDao extends AbstractDao<MMReport>{

    /**
     * 插入上报信息
     * @param mmReport
     * @return
     */
    public int insReport(MMReport mmReport);

    /**
     * 查询全部上报信息
     * @return
     */
    public List<MMReport> selAll();
}
