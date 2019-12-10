package com.zte.zudp.admin.info.queinvest.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.queinvest.dao.AnswersDao;
import com.zte.zudp.admin.info.queinvest.entity.Answers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 答案管理
 */
@Service
@Transactional
public class AnswerService extends BusinessService<Answers> {
    @Autowired
    private AnswersDao answersDao;
}
