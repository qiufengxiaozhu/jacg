package com.zte.zudp.admin.mm.bigscreen.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.mm.bigscreen.entity.Screen;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 *
 * 吉安大屏数据连接层
 * @Description ${}
 * @Author ScreenDao
 * @Date 2019/12/24 15:10
 **/
@Repository
public interface ScreenDao extends AbstractDao<Screen> {

    /**
     * 趋势分析  统计记录
     * @param time
     * @return
     */
    List<Map> trendAnaly(@Param("time") String time);

    /**
     * 显示最近12个月数据，显示三条
     * @return
     */
    List<Screen> selectCase();

    /**
     * 统计2019年1月份所有区前十条案件
     * @return
     */
    List<Screen> selectAllCase();

    /**
     * 统计近一年每个区发生的事件有多少起
     *
     * @return
     */
    List<Screen> countCase();


    /**
     * 查询最大类型的案件数
     *
     * @return
     */
    public List<Map> findType();

    /**
     * 查询区域
     *
     * @return
     */
    public List<Map> findAreaList();


    /**
     * 查询区域 案件总数
     *
     * @return
     */
    public Integer findareacountList(@Param("area")String area,@Param("startdate")String startdate,@Param("enddate")String enddate);


    /**
     * 查询类型统计
     *
     * @return
     */
    public List<Map> getrightEvenType();


    /**
     *  区域案件报警
     *
     * @return
     */
    public List<Map> getrightCaseNum();

    /**
     *  区域案件类型报警
     *
     * @return
     */
    public List<Map> getrightCasetypeNum(@Param("name")String name,@Param("startdate")String startdate,@Param("enddate")String enddate);

    /**
     *  区域案件报警(社区 下钻)
     *
     * @return
     */
    public List<Map> glCommunityList(@Param("name")String name);


    /**
     *  案件坐标定位展示
     *
     * @return
     */
    public List<Map> glCaseList(String name);

    /**
     *  案件点击事件列表
     *
     * @return
     */
    public List<Map> glindexCaseList(@Param("name")String name,@Param("pages")int pages);

    /**
     *  案件点击事件列表(汇总)
     *
     * @return
     */
    public Integer glindexCaseListCount(String name);

}
