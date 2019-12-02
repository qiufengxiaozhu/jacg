package com.zte.zudp.admin.info.complain.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.complain.dao.ComplainDao;
import com.zte.zudp.admin.info.complain.entity.ComplainEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description ${}
 * @Author ComplainService
 * @Date 2019/11/26 19:19
 **/
@Service
@Transactional
public class ComplainService extends BusinessService<ComplainEntity> {

    private ComplainDao dao() {
        return (ComplainDao) dao;
    }

    /**
     * 业务需求，tel == "", 不更改 reply_status 和 total
     * 如果有 tel , 判断 reply_status 的值，为1，不做操作，为0，赋值为 1，且 total = 3.
     * @param entity
     * @return
     */
    public int updateReply(ComplainEntity entity) {
        if (entity.getTel() != null && !entity.getTel().equals("")) {
            //如果 reply_status == 0, reply_status = 1, total = 3;
            //如果 reply_status == 1, 不变
            if (entity.getReplyStatus().equals("0")) {
                entity.setReplyStatus("1");
                entity.setTotal("3");
            }
        }
        int i = dao().update(entity);
        return i;
    }
}
