package com.zte.zudp.admin.info.queinvest.controller;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 *  答案管理
 */
@RestController
@EndpointModule(name = "答案管理", id = "answer", parent = AnswerMenu.class, order = 1, icon = "home")
@RequestMapping(value = "/answer")
public class AnswerContrller extends AbstractCRUDController<Answers>{

    @Autowired
    private AnswerService answerService;

    /**
     * 查询出详情
     *
     */
    @ResponseBody
    @RequestMapping(value = "/getDetail",method = RequestMethod.POST)
    public List<Map> getDetail(@RequestBody Object id ){
        List<Map> list = answerService.getDetail(id);
        return list;
    }




}