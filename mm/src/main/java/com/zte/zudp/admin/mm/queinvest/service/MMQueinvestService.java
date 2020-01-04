package com.zte.zudp.admin.mm.queinvest.service;

import com.zte.zudp.admin.common.persistence.Subject;
import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.queinvest.entity.Answers;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.mm.queinvest.dao.MMQueinvestDao;
import com.zte.zudp.admin.mm.queinvest.entity.MMQueinvest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 问卷调查
 */


@Service
@Transactional
public class MMQueinvestService  extends BusinessService<MMQueinvest> {

    @Autowired
    private MMQueinvestDao mmQueinvestDao;

    /**
     * 查询所有信息
     * @return
     */
    public List<MMQueinvest> selectAll(Object userPhone) {
        return mmQueinvestDao.selectAll(userPhone);
    }

    /**
     * 进入问卷
     * @param id
     * @return
     */
    public List<MMQueinvest> startQueinvest(String id) {
        return  mmQueinvestDao.startQueinvest(id);
    }

    /**
     * 根据所选答案，查询出所有的信息
     * @param str
     * @return
     */
    public MMQueinvest selectAllByAnswer(String str) {
        return  mmQueinvestDao.selectAllByAnswer(str);
    }

    /**
     * 将获得的答案 ，问卷id，题目id新增到答案表中
     * @param queinvestId
     * @param questionId
     * @param optContext
     */
    public void insertToAnswer(String id,String queinvestId, String questionId, String optContext,Object userPhone,Object userName) {
        mmQueinvestDao.insertToAnswer(id,queinvestId,questionId,optContext,userPhone,userName);
    }


}
