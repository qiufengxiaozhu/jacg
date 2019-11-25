package com.zte.zudp.admin.modules.component.info.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.modules.component.info.entity.InfoReceiver;

/**
 * @author zzw
 * @version 1.0.0
 * @since on 2018/3/14.
 */
public interface InfoReceiverDao extends AbstractDao<InfoReceiver> {

    void batchInsert(@Param("list") List<InfoReceiver> list);

    void reader(String id);

    Integer getNotReaderCount(InfoReceiver infoReceiver);
}
