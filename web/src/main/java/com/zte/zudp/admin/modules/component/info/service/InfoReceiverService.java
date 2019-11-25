package com.zte.zudp.admin.modules.component.info.service;

import java.util.List;

import com.zte.zudp.admin.modules.sys.user.entity.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.modules.component.info.dao.InfoReceiverDao;
import com.zte.zudp.admin.modules.component.info.entity.InfoReceiver;
import com.zte.zudp.admin.modules.component.info.entity.InfoSender;

/**
 * @author zzw
 * @version 1.0.0
 * @since on 2018/3/14.
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class InfoReceiverService extends BusinessService<InfoReceiver> {

    private InfoReceiverDao dao() {
        return (InfoReceiverDao) dao;
    }

    @Transactional(rollbackFor = Exception.class)
    public void batchInsert(List<InfoReceiver> infoReceiver) {
        dao().batchInsert(infoReceiver);
    }


    @Transactional(rollbackFor = Exception.class)
    public InfoSender readMessage(String id) {
        InfoReceiver infoReceiver = dao.get(id);
        if (infoReceiver.getStatus() == 1) {
            dao().reader(infoReceiver.getId());
        }
        return infoReceiver.getInfoSender();
    }

    @Transactional(rollbackFor = Exception.class)
    public Integer getNotReaderCount() {
        InfoReceiver infoReceiver = new InfoReceiver();
        infoReceiver.setReceiver(new User(SubjectUtil.getSubject().getId()));
        return dao().getNotReaderCount(infoReceiver);
    }
}
