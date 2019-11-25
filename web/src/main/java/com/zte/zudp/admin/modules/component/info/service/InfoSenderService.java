package com.zte.zudp.admin.modules.component.info.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.modules.component.info.entity.InfoReceiver;
import com.zte.zudp.admin.modules.component.info.entity.InfoSender;

/**
 * @author zzw
 * @version 1.0.0
 * @since on 2018/3/14.
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class InfoSenderService extends BusinessService<InfoSender> {

    @Autowired
    private InfoReceiverService infoReceiverService;

    /**
     * 给多个人发送消息
     *
     * @param infoSender   发送
     * @param infoReceiver 接收
     */
    @Transactional(rollbackFor = Exception.class)
    public void sendMessage(InfoSender infoSender, List<InfoReceiver> infoReceiver) {
        dao.insert(infoSender);
        infoReceiverService.batchInsert(infoReceiver);
    }

    /**
     * 给单个人发送消息
     *
     * @param infoSender
     * @param infoReceiver
     */
    @Transactional(rollbackFor = Exception.class)
    public void sendOneMessage(InfoSender infoSender, InfoReceiver infoReceiver) {
        dao.insert(infoSender);
        infoReceiverService.insert(infoReceiver);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insert(InfoSender infoSender) {
        infoSender.setCreateDate(new Date());
        return dao.insert(infoSender);
    }
}
