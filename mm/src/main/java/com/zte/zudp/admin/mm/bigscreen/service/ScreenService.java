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


    /**
     * 查询最大类型的案件数
     *
     * @return
     */
    public List<Map> findType(){

        return screenDao.findType();
    }

    /**
     * 查询区域
     *
     * @return
     */
    public List<Map> findAreaList(){

        return screenDao.findAreaList();
    }

    /**
     * 查询区域 案件总数
     *
     * @return
     */
    public Integer findAreaCountList(String area,String type){
        String StartDate="";
        String EndDate="";
        if (type.equals("第一季度")){
            StartDate="2019-01";
            EndDate="2019-03";
        }else if (type.equals("第二季度")){
            StartDate="2019-04";
            EndDate="2019-06";
        }else if (type.equals("第三季度")){
            StartDate="2019-07";
            EndDate="2019-09";
        }else if (type.equals("第四季度")){
            StartDate="2019-10";
            EndDate="2019-12";
        }
        return screenDao.findareacountList(area,StartDate,EndDate);
    }

    /**
     * 查询类型统计
     *
     * @return
     */
    public List<Map> getrightEvenType(){

        return screenDao.getrightEvenType();
    }

    /**
     *  区域案件报警
     *
     * @return
     */
    public List<Map> getrightCaseNum(){

        return screenDao.getrightCaseNum();
    }

    /**
     *  区域案件类型报警
     *
     * @return
     */
    public List<Map> getrightCasetypeNum(String name,String type){

        String StartDate="";
        String EndDate="";
        if (type.equals("第一季度")){
            StartDate="2019-01";
            EndDate="2019-03";
        }else if (type.equals("第二季度")){
            StartDate="2019-04";
            EndDate="2019-06";
        }else if (type.equals("第三季度")){
            StartDate="2019-07";
            EndDate="2019-09";
        }else if (type.equals("第四季度")){
            StartDate="2019-10";
            EndDate="2019-12";
        }
        return screenDao.getrightCasetypeNum(name,StartDate,EndDate);
    }






}
