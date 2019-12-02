package com.zte.zudp.admin.info.queinvest.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.common.persistence.dao.BaseDao;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    void updateQuestion(@Param("idJson") String idJson);

    /**
     * 发布
     * @param id
     */
    void updateStatus(@Param("id")String  id);
    /**
     * 撤销发布
     * @param id
     */
    void updateStatus02(@Param("id")String id);

    List<Questions> findAllQuestion(String id);
}
