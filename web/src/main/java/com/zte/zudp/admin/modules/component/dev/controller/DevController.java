package com.zte.zudp.admin.modules.component.dev.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zte.zudp.admin.common.Constants;
import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.EndpointItem;
import com.zte.zudp.admin.modules.component.dev.service.DevService;
import com.zte.zudp.admin.modules.sys.SystemMenu;

/**
 * 帮助开发使用有关的Controller
 *
 * @author DW
 * @version 1.0.0
 * @since 2018/4/2 16:12
 */
@RestController
@RequestMapping("/dev")
@EndpointModule(id = "dev", name = "系统开发", order = 20, parent = SystemMenu.class,
        authorizedType = AuthorizedType.SUBJECT, authorized = {Constants.Permission.SUPER_ADMIN})
public class DevController {

    @Autowired
    private DevService service;

    /**
     * @api {GET} /dev/showAllFunItems 获取所有的功能端点
     * @apiGroup Dev
     * @apiVersion 1.0.0
     * @apiDescription 展示系统所有的功能端点
     * @apiUse returnResult
     * @apiSuccess (200) {Boolean} data 菜单树树信息
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/dev/showAllFunItems
     * @apiSuccessExample {json} 返回样例:
     *                {"success":true,"msg":null,"code":0,"data":...} //data 中的数据为菜单树
     */
    @EndpointRest(id = "showAllFunItems", name = "获取所有的功能端点")
    @GetMapping("/showAllFunItems")
    @JSON(include = "id,name,parentId,href,parentIds,authorizedType,authorized,weight", type = EndpointItem.class)
    public List<EndpointItem> getAllFunItems() {
        return service.getAllEndpoint();
    }
}
