package com.zte.zudp.admin.mm.wxQueinvest.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.mm.queinvest.dao.MMQueinvestDao;
import com.zte.zudp.admin.mm.queinvest.entity.MMQueinvest;
import com.zte.zudp.admin.mm.wxQueinvest.dao.WXMMQueinvestDao;
import com.zte.zudp.admin.mm.wxQueinvest.entity.WXMMQueinvest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 问卷调查
 */


@Service
@Transactional
public class WXMMQueinvestService extends BusinessService<WXMMQueinvest> {

    @Autowired
    private WXMMQueinvestDao wxmmQueinvestDao;

    /**
     * 查询所有信息
     * @return
     */
    public List<WXMMQueinvest> selectAll() {
        return wxmmQueinvestDao.selectAll();
    }

    /**
     * 进入问卷
     * @param id
     * @return
     */
    public List<WXMMQueinvest> startQueinvest(String id) {
        return  wxmmQueinvestDao.startQueinvest(id);
    }

    /**
     * 根据所选答案，查询出所有的信息
     * @param str
     * @return
     */
    public WXMMQueinvest selectAllByAnswer(String str) {
        return  wxmmQueinvestDao.selectAllByAnswer(str);
    }

    /**
     * 将获得的答案 ，问卷id，题目id新增到答案表中
     * @param queinvestId
     * @param questionId
     * @param optContext
     */
    public void insertToAnswer(String id,String queinvestId, String questionId, String optContext) {
        wxmmQueinvestDao.insertToAnswer(id,queinvestId,questionId,optContext);
    }


}
