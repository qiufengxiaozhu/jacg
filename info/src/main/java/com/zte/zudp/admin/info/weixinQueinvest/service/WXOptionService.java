package com.zte.zudp.admin.info.weixinQueinvest.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.queinvest.dao.OptionDao;
import com.zte.zudp.admin.info.queinvest.dao.QuestionDao;
import com.zte.zudp.admin.info.queinvest.entity.Options;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import com.zte.zudp.admin.info.weixinQueinvest.dao.WXOptionDao;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXOptions;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WXOptionService extends BusinessService<WXOptions> {

    @Autowired
    private WXOptionDao wxOptionDao;

    public int addOption(Options t) {
        return wxOptionDao.addOption(t);
    }
}
