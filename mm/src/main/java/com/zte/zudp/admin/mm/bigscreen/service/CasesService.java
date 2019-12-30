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

    public List<Map> findAllCases() {
        return casesDao.findAllCases();
    }
}
