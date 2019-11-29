package com.zte.zudp.admin.info.dynamicpush.ctrl;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.dynamicpush.DynamicPushMenu;
import com.zte.zudp.admin.info.dynamicpush.entity.DynamicPush;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 动态推送controller
 * @author 闵思迁
 */
@RestController
@EndpointModule(name = "动态推送列表", id = "dynamicPushList", parent = DynamicPushMenu.class, order = 1, icon = "bookmark")
@RequestMapping("/dynamicPush")
public class DynamicPushController extends AbstractCRUDController<DynamicPush> {

}
