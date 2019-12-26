package com.zte.zudp.admin.mm.bigscreen.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.mm.bigscreen.entity.Screen;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 * 吉安大屏数据连接层
 * @Description ${}
 * @Author ScreenDao
 * @Date 2019/12/24 15:10
 **/
public interface ScreenDao extends AbstractDao<Screen> {

    /**
     * 趋势分析  统计记录
     * @param time
     * @return
     */
    List<Map> trendAnaly(@Param("time") String time);
}
