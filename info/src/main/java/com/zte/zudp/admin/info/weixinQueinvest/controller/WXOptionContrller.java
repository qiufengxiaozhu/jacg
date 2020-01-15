package com.zte.zudp.admin.info.weixinQueinvest.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.queinvest.QuestionMenu;
import com.zte.zudp.admin.info.queinvest.dao.OptionDao;
import com.zte.zudp.admin.info.queinvest.entity.Options;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import com.zte.zudp.admin.info.queinvest.service.OptionService;
import com.zte.zudp.admin.info.queinvest.service.QuestionService;
import com.zte.zudp.admin.info.weixinQueinvest.WXQuestionMenu;
import com.zte.zudp.admin.info.weixinQueinvest.service.WXOptionService;
import com.zte.zudp.admin.info.weixinQueinvest.service.WXQuestionService;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;
import java.util.UUID;

/**
 *  问卷调查
 */
@RestController
@EndpointModule(name = "题干管理", id = "wxoption", parent = WXQuestionMenu.class, order = 1, icon = "home")
@RequestMapping(value = "/wxoption")
public class WXOptionContrller extends AbstractCRUDController<Options>{

    @Autowired
    private WXOptionService wxOptionService;

    @Autowired
    private WXQuestionService wxQuestionService;

    /**
     * 添加选项
     */
   @JSON
    @RequestMapping(value = "/addOption", method =RequestMethod.POST )
    public void addOption(@RequestBody Options t) {
       String idJson = t.getIdJson();
       if(t.getId()==null){// 如果为空
           String uuid =UUID.randomUUID().toString();
           t.setId(uuid);

           System.out.println(t.getId());

       }
       wxOptionService.addOption(t);
       wxQuestionService.updateQuestionStatus(idJson);

    }



}