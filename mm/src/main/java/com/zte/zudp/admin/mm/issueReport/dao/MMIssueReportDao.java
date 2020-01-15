package com.zte.zudp.admin.mm.issueReport.dao;

        import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
        import com.zte.zudp.admin.mm.issueReport.entity.MMIssueReport;
        import com.zte.zudp.admin.mm.protalreport.entity.MMReport;
        import org.apache.ibatis.annotations.Param;
        import org.springframework.web.bind.annotation.PostMapping;

        import java.util.List;
        import java.util.Map;

public interface MMIssueReportDao extends AbstractDao<MMIssueReport>{

    /**
     * 插入上报信息
     * @param
     * @return
     */
    public int insReport(MMIssueReport mmIssueReport);

    /**
     * 查询全部上报列表
     * @return
     */
    public List<MMIssueReport> myReportList(@Param("phone") Object phone, @Param("name") Object name);

    /**
     * 去数据库中匹配电话和用户名称
     * @param userName
     * @param userPhone
     * @return
     */
//    List<Map> checkUserAndPhone();
}
