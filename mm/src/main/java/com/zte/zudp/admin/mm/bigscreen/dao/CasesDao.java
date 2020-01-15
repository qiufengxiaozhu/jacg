package com.zte.zudp.admin.mm.bigscreen.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 案件
 */
public interface CasesDao {
    /**
     * 查询所有案件列表
     * @return
     */
    List<Map> findAllCases(@Param("pages") int pages,@Param("startTime")String startTime,@Param("endTime")String endTime,@Param("description")String description);

    /**
     * 三级页面  详情
     * @param id
     */
    Map findCaseById(@Param("id") String id);
}
