package com.zte.zudp.admin.info.weixinQueinvest.controller;

import com.sun.jmx.snmp.Timestamp;
import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.queinvest.AnswerMenu;
import com.zte.zudp.admin.info.queinvest.QuestionMenu;
import com.zte.zudp.admin.info.queinvest.entity.Answers;
import com.zte.zudp.admin.info.queinvest.entity.Options;
import com.zte.zudp.admin.info.queinvest.service.AnswerService;
import com.zte.zudp.admin.info.queinvest.service.OptionService;
import com.zte.zudp.admin.info.weixinQueinvest.WXAnswerMenu;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXAnswers;
import com.zte.zudp.admin.info.weixinQueinvest.service.WXAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 *  答案管理
 */
@RestController
@EndpointModule(name = "答案管理", id = "wxanswer", parent = WXAnswerMenu.class, order = 1, icon = "home")
@RequestMapping(value = "/wxanswer")
public class WXAnswerContrller extends AbstractCRUDController<WXAnswers>{

    @Autowired
    private WXAnswerService wxAnswerService;

    /**
     * 查询出详情
     *
     */
    @ResponseBody
    @RequestMapping(value = "/getDetail",method = RequestMethod.POST)
    public List<Map> getDetail(@RequestBody Map map ){
        Object id = map.get("id");
        Object queName = map.get("queName");
        List<Map> list = wxAnswerService.getDetail(id,queName);
        return list;
    }



}