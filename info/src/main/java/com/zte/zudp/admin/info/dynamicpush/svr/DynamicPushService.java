package com.zte.zudp.admin.info.dynamicpush.svr;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.info.dynamicpush.dao.DynamicPushDao;
import com.zte.zudp.admin.info.dynamicpush.entity.DynamicPush;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DynamicPushService extends BusinessService<DynamicPush> {

    @Autowired
    private DynamicPushDao dynamicPushDao;

    @Override
    public int insert(DynamicPush dynamicPush) {
        long l = IDUtil.simpleId();
        String id = String.valueOf(l);
        dynamicPush.setId(id);
        return super.insert(dynamicPush);
    }

    /**
     * 查询详情
     * @param id
     * @return
     */
    public DynamicPush getDetail(String id) {
       return dynamicPushDao.getDetail(id);
    }

    /**
     * 推送
     * @param id
     */
    public void updateStatus(String id) {
        dynamicPushDao.updateStatus(id);
    }
    /**
     * 撤销推送
     * @param id
     */
    public void updateStatus02(String id) {
        dynamicPushDao.updateStatus02(id);
    }
}
