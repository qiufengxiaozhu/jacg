package com.zte.zudp.admin.mm.queinvest.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.queinvest.entity.Answers;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.mm.queinvest.entity.MMQueinvest;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

/**
 * 问卷调查
 */



public interface MMQueinvestDao extends AbstractDao<MMQueinvest> {


    List<MMQueinvest> selectAll(@Param("userPhone")Object userPhone);

    List<MMQueinvest> startQueinvest(@Param("id") String id);

    /**
     * 根据所选答案，查询出所有的信息
     * @param str
     * @return
     */
    MMQueinvest selectAllByAnswer(@Param("str") String str);

    /**
     * 将获得的答案 ，问卷id，题目id新增到答案表中
     * @param queinvestId
     * @param questionId
     * @param optContext
     */
    void insertToAnswer(@Param("id") String id,@Param("queinvestId") String queinvestId, @Param("questionId") String questionId, @Param("optContext") String optContext,@Param("userPhone")Object userPhone,@Param("userName")Object userName);
}
