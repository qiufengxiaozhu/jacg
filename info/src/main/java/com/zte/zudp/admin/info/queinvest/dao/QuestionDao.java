package com.zte.zudp.admin.info.queinvest.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 *
 */
public interface QuestionDao extends AbstractDao<Questions> {
    void saveContents(Questions questions);


    List<Dictionary> getList();

    /**
     * 修改题目状态
     * @param idJson
     */
    void updateQuestionStatus(@RequestParam("idJson") String idJson);
}
