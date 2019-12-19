package com.zte.zudp.admin.info.weixinQueinvest.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.queinvest.dao.AnswersDao;
import com.zte.zudp.admin.info.queinvest.entity.Answers;
import com.zte.zudp.admin.info.weixinQueinvest.dao.WXAnswersDao;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXAnswers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 答案管理
 */
@Service
@Transactional
public class WXAnswerService extends BusinessService<WXAnswers> {
    @Autowired
    private WXAnswersDao wxAnswersDao;
}
