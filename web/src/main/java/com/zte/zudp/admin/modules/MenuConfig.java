package com.zte.zudp.admin.modules;

import org.springframework.stereotype.Controller;

import com.zte.zudp.admin.common.Constants;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;

/**
 * 功能点树的根节点
 *
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-17.
 */
@Controller
@EndpointModule(id = Constants.ROOT_ID, name = Constants.ROOT_NAME, order = 1, parent = void.class)
public class MenuConfig {
}
