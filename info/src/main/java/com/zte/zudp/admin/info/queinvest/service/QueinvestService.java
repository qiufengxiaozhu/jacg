package com.zte.zudp.admin.info.queinvest.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.queinvest.dao.QueinvestDao;
import com.zte.zudp.admin.info.queinvest.dao.QuestionDao;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class QueinvestService extends BusinessService<Queinvest> {


    @Autowired
    private QueinvestDao queinvestDao;
    /**
     *  下拉 问卷类型
     * @return
     */
    public List<Dictionary> getList() {
        return queinvestDao.getList();
    }


    public List<Questions> addQuestion() {
        return queinvestDao.addQuestion();
    }


    /**
     * 发布
     * @param id
     */
    public int updateStatus(String id) {
      return   queinvestDao.updateStatus(id);
    }
    /**
     * 撤销发布
     * @param id
     */
    public void updateStatus02(String id) {
        queinvestDao.updateStatus02(id);
    }

    public List<Questions> findAllQuestion(String id) {
      return   queinvestDao.findAllQuestion(id);
    }

    public void updateQuestion(String questionId, String queinId) {
        queinvestDao.updateQuestion(questionId,queinId);
    }

    public Queinvest getDetail(String id) {
      return   queinvestDao.getDetail(id);

    }

    /**
     * 预览
     * @return
     */
    public List<Map> overView(String id) {
       return queinvestDao.overView(id);
    }

    /**
     * 删除问卷里面的题目
     * @param delId
     */
    public void delQuestion(String delId) {
        queinvestDao.delQuestion(delId);
    }
}
