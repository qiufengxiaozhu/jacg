package com.zte.zudp.admin.info.weixinQueinvest.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.common.persistence.dao.BaseDao;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXQueinvest;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXQuestions;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


/**
 * 微信 公众调查
 */
@Repository
public interface WXQueinvestDao extends AbstractDao<WXQueinvest> {

/**
     * 下拉  问卷类型
     * @return
   */

    List<Dictionary> getList();


    List<WXQuestions> addQuestion();



/**
     * 发布
     * @param id
 */

    int updateStatus(@Param("id") String id);
/*
     * 撤销发布
     * @param id
 */

    void updateStatus02(@Param("id") String id);

    List<WXQuestions> findAllQuestion(String id);

    void updateQuestion(@Param("object") Object object, @Param("object02") Object object02);

    WXQueinvest getDetail(@Param("id") String id);

    /**
     * 预览
     * @param id
     * @return
     */
    List<Map> overView(@Param("id") String id);

    /**
     * 删除题目
     * @param delId
     */
    void delQuestion(@Param("delId") String delId);
}
