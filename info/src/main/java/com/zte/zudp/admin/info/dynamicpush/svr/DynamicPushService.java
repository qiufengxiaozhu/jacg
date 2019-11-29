package com.zte.zudp.admin.info.dynamicpush.svr;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.dynamicpush.entity.DynamicPush;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class DynamicPushService extends BusinessService<DynamicPush> {

}
