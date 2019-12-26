package com.zte.zudp.admin.mm.bigscreen.service;

import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.mm.bigscreen.dao.ScreenDao;
import com.zte.zudp.admin.mm.bigscreen.entity.Screen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 *
 * 吉安大屏业务处理层
 * @Description ${}
 * @Author ScreenService
 * @Date 2019/12/24 15:11
 **/

@Service
@Transactional
public class ScreenService extends FileBusinessService<Screen> {

    @Autowired
    private ScreenDao screenDao;


    /**
     * 趋势分析  统计记录
     * @param time
     * @return
     */
    public List<Map> trendAnaly(String time) {
        return screenDao.trendAnaly(time);
    }


    /**
     * 显示最近一个月数据，显示三条
     * @return
     */
    public List<Screen> selectCase() {
        return screenDao.selectCase();
    }

    /**
     * 统计每个区的最近一个月数据
     *
     * @return
     */
    public List<Screen> countCase(){

        return screenDao.countCase();
    }
}
