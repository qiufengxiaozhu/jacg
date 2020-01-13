package com.zte.zudp.admin.info.queinvest.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.common.persistence.dao.BaseDao;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.formula.functions.T;

import java.util.List;
import java.util.Map;

/**
 *
 */
public interface QueinvestDao extends AbstractDao<Queinvest> {

    /**
     * 下拉  问卷类型
     * @return
     */
    List<Dictionary> getList();


    List<Questions> addQuestion();



    /**
     * 发布
     * @param id
     */
    int updateStatus(@Param("id")String  id);
    /**
     * 撤销发布
     * @param id
     */
    void updateStatus02(@Param("id")String id);

    List<Questions> findAllQuestion(String id);

    void updateQuestion(@Param("queinId") String  queinId, @Param("questionId") String questionId);

    Queinvest getDetail(@Param("id") String id);

    /**
     * 预览
     * @return
     */
    List<Map> overView(@Param("id")String id);

    /**
     * 删除问卷里面的题目
     * @param delId
     */
    void delQuestion(@Param("delId") String delId);
}
