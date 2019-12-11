package com.zte.zudp.admin.info.integrate.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.Page;
import com.zte.zudp.admin.common.persistence.Result;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.integrate.IntegrateDataMenu;
import com.zte.zudp.admin.info.integrate.entity.Integrate;
import com.zte.zudp.admin.info.integrate.service.IntegrateService;
import com.zte.zudp.admin.info.queinvest.QuestionMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@EndpointModule(name = "积分管理", id = "integrate", parent = IntegrateDataMenu.class, order = 1, icon = "home")
@RequestMapping(value = "/integrate")
public class IntegrateContrller extends AbstractCRUDController<Integrate>{

    @Autowired
    private IntegrateService integrateService;


    /**
     * 新增举报信息()到积分表
     */
    @PostMapping("/insertToIntegrate")
    public Result insertToIntegrate(@RequestParam String type,
                                    @RequestParam String fId,
                                    @RequestParam String tel){ //type：0-投诉 1-...

        try {
            // 新增到积分表中
            integrateService.insertToIntegrate(type, fId, tel);
        }catch (Exception e){
            e.printStackTrace();
        }
        // 成功返回成功提示语
        return Result.success("success","");

    }




}
