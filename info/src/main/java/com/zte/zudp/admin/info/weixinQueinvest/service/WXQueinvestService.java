package com.zte.zudp.admin.info.weixinQueinvest.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.queinvest.dao.QueinvestDao;
import com.zte.zudp.admin.info.queinvest.dao.QuestionDao;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import com.zte.zudp.admin.info.weixinQueinvest.dao.WXQueinvestDao;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXQueinvest;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXQuestions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 微信公众调查
 */
@Service
@Transactional
public class WXQueinvestService extends BusinessService<WXQueinvest> {


    @Autowired
    private WXQueinvestDao wxQueinvestDao;
    /**
     *  下拉 问卷类型
     * @return
     */
    public List<Dictionary> getList() {
        return wxQueinvestDao.getList();
    }


    public List<WXQuestions> addQuestion() {
        return wxQueinvestDao.addQuestion();
    }


    /**
     * 发布
     * @param id
     */
    public int updateStatus(String id) {
       return wxQueinvestDao.updateStatus(id);
    }
    /**
     * 撤销发布
     * @param id
     */
    public void updateStatus02(String id) {
        wxQueinvestDao.updateStatus02(id);
    }

    public List<WXQuestions> findAllQuestion(String id) {
      return   wxQueinvestDao.findAllQuestion(id);
    }

    public void updateQuestion(Object object, Object object02) {
        wxQueinvestDao.updateQuestion(object,object02);
    }

    public WXQueinvest getDetail(String id) {
      return   wxQueinvestDao.getDetail(id);

    }

    /**
     * 预览
     * @param id
     * @return
     */
    public List<Map> overView(String id) {
        return wxQueinvestDao.overView(id);
    }

    /**
     * 删除题目
     * @param delId
     */
    public void delQuestion(String delId) {
        wxQueinvestDao.delQuestion(delId);
    }
}
