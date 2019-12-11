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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
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




}