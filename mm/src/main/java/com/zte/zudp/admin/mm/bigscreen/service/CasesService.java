package com.zte.zudp.admin.mm.bigscreen.service;

import com.zte.zudp.admin.mm.bigscreen.dao.CasesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 案件
 */
@Service
public class CasesService {
    // 注入dao层
    @Autowired
    private CasesDao casesDao;

    public List<Map> findAllCases(int pages,String startTime,String endTime,String description) {
        return casesDao.findAllCases(pages,startTime,endTime,description);
    }

    /**
     * 三级页面  详情
     * @param id
     * @return
     */
    public Map findCaseById(String id) {
      return  casesDao.findCaseById(id);
    }
}
