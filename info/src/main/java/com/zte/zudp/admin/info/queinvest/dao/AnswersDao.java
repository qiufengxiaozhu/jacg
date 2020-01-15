package com.zte.zudp.admin.info.queinvest.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.queinvest.entity.Answers;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 答案管理
 */
public interface AnswersDao extends AbstractDao<Answers>{
    /**
     * 详情
     * @param id
     * @return
     */
    List<Map> getDetail(@Param("id") Object id,@Param("queName")Object queName);
}
