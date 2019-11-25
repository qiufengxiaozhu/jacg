package com.zte.zudp.admin.modules.component.dev.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointHelper;
import com.zte.zudp.admin.common.persistence.EndpointItem;

/**
 * 帮助开发相关Service 接口
 *
 * @author DW
 * @version 1.0.0
 * @since 2018/4/2 16:04
 */
@Service
public class DevService {

    /**
     * 获取所有的功能端点Item
     *
     * @return
     */
    public List<EndpointItem> getAllEndpoint() {
        EndpointHelper helper = EndpointHelper.getHelper();
        Map<String, EndpointItem> allItemMap = helper.getAllItemMap();
        return new ArrayList<>(allItemMap.values());
    }
}
