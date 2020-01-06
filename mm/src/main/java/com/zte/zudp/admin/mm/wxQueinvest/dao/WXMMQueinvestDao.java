package com.zte.zudp.admin.mm.wxQueinvest.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.mm.queinvest.entity.MMQueinvest;
import com.zte.zudp.admin.mm.wxQueinvest.entity.WXMMQueinvest;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 问卷调查
 */



public interface WXMMQueinvestDao extends AbstractDao<WXMMQueinvest> {


    List<WXMMQueinvest> selectAll(@Param("userPhone")Object userPhone);

    List<WXMMQueinvest> startQueinvest(@Param("id") String id);

    /**
     * 根据所选答案，查询出所有的信息
     * @param str
     * @return
     */
    WXMMQueinvest selectAllByAnswer(@Param("str") String str,@Param("queId")String queId);

    /**
     * 将获得的答案 ，问卷id，题目id新增到答案表中
     * @param queinvestId
     * @param questionId
     * @param optContext
     */
    void insertToAnswer(@Param("id") String id, @Param("queinvestId") String queinvestId, @Param("questionId") String questionId, @Param("optContext") String optContext,@Param("userPhone")Object userPhone,@Param("userName")Object userName);
}
