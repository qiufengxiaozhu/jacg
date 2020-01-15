package com.zte.zudp.admin.info.dynamicpush.ctrl;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.dynamicpush.DynamicPushMenu;
import com.zte.zudp.admin.info.dynamicpush.entity.DynamicPush;
import com.zte.zudp.admin.info.dynamicpush.svr.DynamicPushService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 动态推送controller
 * @author
 */
@RestController
@EndpointModule(name = "动态推送列表", id = "dynamicPushList", parent = DynamicPushMenu.class, order = 1, icon = "bookmark")
@RequestMapping("/dyPush")
public class DynamicPushController extends AbstractCRUDController<DynamicPush> {

    @Autowired
    private DynamicPushService dynamicPushService;

    @RequestMapping(value = "insert02",method = RequestMethod.POST)
    public void insert02(@RequestBody DynamicPush dynamicPush){
        System.out.println(dynamicPush);

        // 调用service层来实现新增
        dynamicPushService.insert(dynamicPush);
    }



    /**
     * 详情  富文本框
     * @param id
     */
    @RequestMapping(value = "/getDetail",method = RequestMethod.POST)
    @ResponseBody
    public DynamicPush getDetail(@RequestBody String id){

        // 调用service层来实现新增
        DynamicPush dynamicPush = dynamicPushService.getDetail(id);
        return dynamicPush;
    }



    @JSON
    @PostMapping(value = "/updateStatus")
    public void updateStatus(@RequestBody String id){
        dynamicPushService.updateStatus(id);

    }

    @JSON
    @PostMapping(value = "/updateStatus02")
    public void updateStatus02(@RequestBody String id){
        dynamicPushService.updateStatus02(id);
    }




}
