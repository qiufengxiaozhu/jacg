package com.zte.zudp.admin.info.queinvest.controller;

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
@EndpointModule(name = "题干管理", id = "question", parent = QuestionMenu.class, order = 1, icon = "home")
@RequestMapping("/question")
public class QuestionContrller extends AbstractCRUDController<Questions>{

    @Autowired
    private QuestionService questionService;


/**
 * 下拉  题目类型
 */
@JSON
@GetMapping(value = "/getAllType")
@EndpointRest(id = "List01", name = "题目类型下拉", authorizedType = AuthorizedType.GUEST)
public List<Dictionary> getlist() {
    List<Dictionary> list = questionService.getList();
    return list;
}


    /**
     * 问卷下拉
     * @param id
     * @return
     */
//    @JSON
//    @GetMapping(value = "/getOneType")
//    @EndpointRest(id = "listAttach", name = "问卷下拉", authorizedType = AuthorizedType.GUEST)
//    public Questions getOneType(String id) {
//        Questions question= questionService.get(id);
////        if ((question.getQuestionType()).equals("0")) {
////            question.setQuestionType("单选题");
////        } else if ((question.getQuestionType()).equals("1")) {
////            question.setQuestionType("多选题");
////        } else if ((question.getQuestionType()).equals("2")) {
////            question.setQuestionType("判断题");
////        }
//        return question;
//    }

    /**
     * 成功题目之后更新题目状态
     * @param idJson
     */
    @PostMapping("/updateQuestionStatus")
    public void updateQuestionStatus(@RequestParam("idJson") String idJson){
         questionService.updateQuestionStatus(idJson);

    }



}