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
 * @Date 2018/12/24 15:11
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
    public List<Screen> selectAllCase() {
        return screenDao.selectAllCase();
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
     * 效能分析
     */
    public List<Screen> analysis(){

        return screenDao.analysis();
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
    public Integer findareacountList(String fdid,String type){
        String StartDate="";
        String EndDate="";
        if (type.equals("第一季度")){
            StartDate="2018-01";
            EndDate="2018-03";
        }else if (type.equals("第二季度")){
            StartDate="2018-04";
            EndDate="2018-06";
        }else if (type.equals("第三季度")){
            StartDate="2018-07";
            EndDate="2018-09";
        }else if (type.equals("第四季度")){
            StartDate="2018-10";
            EndDate="2018-12";
        }
        return screenDao.findareacountList(fdid,StartDate,EndDate);
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
     * 查询类型统计
     *
     * @return
     */
    public List<Map> getrightEvenTypes(){

        return screenDao.getrightEvenTypes();
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
    public List<Map> getrightCasetypeNum(String type){

        String StartDate="";
        String EndDate="";
        if (type.equals("第一季度")){
            StartDate="2018-01";
            EndDate="2018-03";
        }else if (type.equals("第二季度")){
            StartDate="2018-04";
            EndDate="2018-06";
        }else if (type.equals("第三季度")){
            StartDate="2018-07";
            EndDate="2018-09";
        }else if (type.equals("第四季度")){
            StartDate="2018-10";
            EndDate="2018-12";
        }
        return screenDao.getrightCasetypeNum(StartDate,EndDate);
    }


    /**
     *  区域案件报警(社区 下钻)
     *
     * @return
     */
    public List<Map> glCommunityList(String name){

        return screenDao.glCommunityList(name);
    }



    /**
     *  案件坐标定位展示
     *
     * @return
     */
    public List<Map> glCaseList(String name){

        return screenDao.glCaseList(name);
    }


    /**
     *  案件点击事件列表
     *
     * @return
     */
    public List<Map> glindexCaseList(String name,int pages){

        return screenDao.glindexCaseList(name,pages);
    }

    /**
     *  案件点击事件列表(汇总)
     *
     * @return
     */
    public Integer glindexCaseListCount(String name){

        return screenDao.glindexCaseListCount(name);
    }

    /**
     *  案件点击事件查看
     *
     * @return
     */
    public Map glindexCaseid(String id){

        return screenDao.glindexCaseid(id);
    }


    /**
     *  井盖
     *
     * @return
     */
    public List<Map> glindexManholeis(){

        return screenDao.glindexManholeis();
    }


    /**
     *  查询季度类型总数
     *
     * @return
     */
    public List<Map> findTypeJdCount(){

        return screenDao.findTypeJdCount();
    }



    /**
     *  大类最大 每个季度大类总量
     *
     * @return
     */
    public List<Map> findTypeJdSum(){

        return screenDao.findTypeJdSum();
    }




}
