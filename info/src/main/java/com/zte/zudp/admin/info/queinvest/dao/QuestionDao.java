package com.zte.zudp.admin.info.queinvest.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.info.queinvest.entity.Questions;

import java.util.List;

/**
 *
 */
public interface QuestionDao extends AbstractDao<Questions> {
    void saveContents(Questions questions);


    List<Questions> getList();
}
