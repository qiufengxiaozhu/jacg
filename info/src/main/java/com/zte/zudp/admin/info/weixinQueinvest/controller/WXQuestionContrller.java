package com.zte.zudp.admin.info.weixinQueinvest.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.Result;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.queinvest.QueinvestMenu;
import com.zte.zudp.admin.info.queinvest.QuestionMenu;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import com.zte.zudp.admin.info.queinvest.service.QuestionService;
import com.zte.zudp.admin.info.weixinQueinvest.WXQuestionMenu;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXQuestions;
import com.zte.zudp.admin.info.weixinQueinvest.service.WXQueinvestService;
import com.zte.zudp.admin.info.weixinQueinvest.service.WXQuestionService;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 *  问卷调查
 */
@RestController
@EndpointModule(name = "题干管理", id = "wxquestion", parent = WXQuestionMenu.class, order = 1, icon = "home")
@RequestMapping("/wxquestion")
public class WXQuestionContrller extends AbstractCRUDController<WXQuestions>{

    @Autowired
    private WXQuestionService wxQuestionService;


/**
 * 下拉  题目类型
 */
@JSON
@GetMapping(value = "/getAllType")
@EndpointRest(id = "List01", name = "题目类型下拉", authorizedType = AuthorizedType.GUEST)
public List<Dictionary> getlist() {
    List<Dictionary> list = wxQuestionService.getList();
    return list;
}


    /**
     * 问卷下拉
     * @param id
     * @return
     */
    @JSON
    @GetMapping(value = "/getOneType")
    @EndpointRest(id = "listAttach", name = "问卷下拉", authorizedType = AuthorizedType.GUEST)
    public WXQuestions getOneType(String id) {
        WXQuestions  wxQuestions= wxQuestionService.get(id);
        if ((wxQuestions.getQuestionType()).equals("0")) {
            wxQuestions.setQuestionType("单选题");
        } else if ((wxQuestions.getQuestionType()).equals("1")) {
            wxQuestions.setQuestionType("多选题");
        } else if ((wxQuestions.getQuestionType()).equals("2")) {
            wxQuestions.setQuestionType("判断题");
        }
        return wxQuestions;
    }

    /**
     * 成功题目之后更新题目状态
     * @param idJson
     */
    @PostMapping("/updateQuestionStatus")
    public void updateQuestionStatus(@RequestParam("idJson") String idJson){
        wxQuestionService.updateQuestionStatus(idJson);

    }



}