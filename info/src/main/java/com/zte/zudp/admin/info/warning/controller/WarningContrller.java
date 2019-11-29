/*
package com.zte.zudp.admin.info.warning.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.queinvest.QuestionMenu;
import com.zte.zudp.admin.info.warning.entity.Options;
import com.zte.zudp.admin.info.warning.service.WarningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

*/
/**
 *  问卷调查
 *//*

@RestController
@EndpointModule(name = "报警管理", id = "warning", parent = QuestionMenu.class, order = 1, icon = "home")
@RequestMapping(value = "/option")
public class WarningContrller extends AbstractCRUDController<Options>{

    @Autowired
    private WarningService optionService;

    */
/**
     * 添加选项
     *//*

   @JSON
    @RequestMapping(value = "/addOption", method =RequestMethod.POST )
    public Integer addOption(@RequestBody Options t) {
       int i=1;
//        Options option=new Options();
//        if(option.getId()==null) {
//            t.setId(UUID.randomUUID().toString());
                    optionService.addOption(t);
                    return 1;
//        }
    }



}*/
