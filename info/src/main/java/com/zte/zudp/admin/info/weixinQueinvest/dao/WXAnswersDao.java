package com.zte.zudp.admin.info.weixinQueinvest.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.queinvest.entity.Answers;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXAnswers;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 答案管理
 */
public interface WXAnswersDao extends AbstractDao<WXAnswers>{
    /**
     * 查询详情
     * @param id
     * @param queName
     * @return
     */
    List<Map> getDetail(@Param("id") Object id,@Param("queName") Object queName);
}
