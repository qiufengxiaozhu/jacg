package com.zte.zudp.admin.mm.bigscreen.dao;

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
    List<Map> findAllCases();
}
