package com.zte.zudp.admin.mm.bigscreen.dao;

import java.util.List;
import java.util.Map;

public interface TheMostDao {
    /**
     * 最新
     * @return
     */
    List<Map> findMostNew();

    /**
     * 最长
     * @return
     */
    List<Map> findMostLength();

    /**
     * 最频繁
     * @return
     */
    List<Map> findMostFrequent();
}
