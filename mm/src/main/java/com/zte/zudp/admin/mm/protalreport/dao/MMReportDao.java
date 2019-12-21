package com.zte.zudp.admin.mm.protalreport.dao;

        import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
        import com.zte.zudp.admin.mm.protalreport.entity.MMReport;
        import org.apache.ibatis.annotations.Param;
        import org.springframework.web.bind.annotation.PostMapping;

        import java.util.List;
        import java.util.Map;

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
    public List<MMReport> selAll(@Param("phone") Object phone,@Param("name") Object name);

    /**
     * 查询全部上报信息(无参)
     * @return
     */
    public List<MMReport> selAll();
//
//    /**
//     * 去数据库中匹配电话和用户名称
//     * @param userName
//     * @param userPhone
//     * @return
//     */
//    List<Map> checkUserAndPhone( );
}
