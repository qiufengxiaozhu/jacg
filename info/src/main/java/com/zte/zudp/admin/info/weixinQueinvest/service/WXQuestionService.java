package com.zte.zudp.admin.info.weixinQueinvest.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.queinvest.dao.QuestionDao;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import com.zte.zudp.admin.info.weixinQueinvest.dao.WXQuestionDao;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXQuestions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class WXQuestionService extends BusinessService<WXQuestions> {

    @Autowired
    private WXQuestionDao wxQuestionDao;
    /**
     * 新增简单题
     * @param questions
     */
    public void saveContents(WXQuestions wxQuestions) {
        wxQuestionDao.saveContents(wxQuestions);

    }

    /**
     *
     * @return
     */
    public List<Dictionary> getList() {
        return  wxQuestionDao.getList();
    }

    /**
     * 修改题目状态
     * @param idJson
     */
    public void updateQuestionStatus(String idJson) {
        wxQuestionDao.updateQuestionStatus(idJson);
    }
}
