package com.zte.zudp.admin.mm.bigscreen.service;

import com.zte.zudp.admin.mm.bigscreen.dao.TheMostDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TheMostService {
    @Autowired
    private TheMostDao theMostDao;

    /**
     * 最新
     * @return
     */
    public List<Map> findMostNew() {
        return theMostDao.findMostNew();
    }

    /**
     *最长
     * @return
     */
    public List<Map> findMostLength() {
        return theMostDao.findMostLength();
    }

    /**
     * 最频繁
     * @return
     */
    public List<Map> findMostFrequent() {
        return theMostDao.findMostFrequent();
    }
}
