package com.zte.zudp.admin.info.queinvest.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.queinvest.dao.QuestionDao;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class QuestionService extends BusinessService<Questions> {

    @Autowired
    private QuestionDao questionDao;
    /**
     * 新增简单题
     * @param questions
     */
    public void saveContents(Questions questions) {
        questionDao.saveContents(questions);

    }

    /**
     *
     * @return
     */
    public List<Dictionary> getList() {
        return  questionDao.getList();
    }

    /**
     * 修改题目状态
     * @param idJson
     */
    public void updateQuestionStatus(String idJson) {
        questionDao.updateQuestionStatus(idJson);
    }
}
