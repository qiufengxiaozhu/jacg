package com.zte.zudp.admin.modules.component.info.controller;

import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.modules.sys.user.entity.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.persistence.Page;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.modules.component.info.entity.InfoSender;
import com.zte.zudp.admin.modules.sys.SystemMenu;
import com.zte.zudp.admin.modules.component.info.entity.InfoReceiver;
import com.zte.zudp.admin.modules.component.info.service.InfoReceiverService;

/**
 * @author zzw
 * @version 1.0.0
 * @since on 2018/3/14.
 */
@RestController
@EndpointModule(id = "info", name = "消息通知", order = 16, parent = SystemMenu.class, icon = "newspaper")
@RequestMapping(value = "/info")
public class InfoReceiverController extends AbstractCRUDController<InfoReceiver> {
    /**
     * 查询已读未读的字典的key
     */
    public static final String SYS_INFO_STATUS = "sys_info_status";
    /**
     * 查询重要程度的字典的key
     */
    public static final String SYS_INFO_LEVEL = "sys_info_level";
    /**
     * 查询消息类型的字典的key
     */
    public static final String SYS_INFO_TYPE = "sys_info_type";

    public InfoReceiverService service() {
        return (InfoReceiverService) service;
    }

    /**
     * 列表数据
     */
    @JSON()
    @GetMapping()
    @EndpointRest(id = "list", name = "列表查询", order = 1)
    public Page<InfoReceiver> index(InfoReceiver t) {
        if (isListAlsoCommonData()) {
            setCommonData(t);
        }
        t.setReceiver(new User(SubjectUtil.getSubject().getId()));
        return service.findPage(t);
    }

    @JSON()
    @GetMapping("/reader/{id}")
    @EndpointRest(id = "reader", name = "列表查询", order = 1)
    public InfoSender reader(@PathVariable("id") String id) {
        return service().readMessage(id);
    }


    @JSON
    @GetMapping("/notReaderMessageCount")
    @EndpointRest(id = "notReaderMessageCount", name = "获取未读消息个数", order = 5, authorizedType = AuthorizedType.LOGIN)
    public Integer getNotReaderCount() {
        return service().getNotReaderCount();
    }
}
