package com.zte.zudp.admin.info.weixinQueinvest.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.info.weixinQueinvest.WXQueinvestMenu;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXQueinvest;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXQuestions;
import com.zte.zudp.admin.info.weixinQueinvest.service.WXQueinvestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 *  问卷调查
 */
@RestController
@EndpointModule(name = "问卷调查", id = "queinvest", parent = WXQueinvestMenu.class, order = 1, icon = "home")
@RequestMapping("/wxqueinvest")
public class WXQueinvestContrller extends AbstractCRUDController<WXQueinvest> {
    @Autowired
    private WXQueinvestService wxQueinvestService;


    /**
     * 问卷类型的下拉  新建
     * @return
     */
    @JSON
    @GetMapping(value = "/getAllType")
    @EndpointRest(id = "List", name = "问卷类型下拉", authorizedType = AuthorizedType.GUEST)
    public List<Dictionary> getlist() {
        List<Dictionary> list = wxQueinvestService.getList();
        return list;
    }


    /**
     * 问卷类型下拉   编辑
     * @param id
     * @return
     */
    @JSON
    @GetMapping(value = "/getOneType")
    @EndpointRest(id = "listAttach", name = "问卷下拉", authorizedType = AuthorizedType.GUEST)
    public WXQueinvest getOneType(String id) {
        WXQueinvest wxQueinvest= wxQueinvestService.get(id);
        if ((wxQueinvest.getQueinvestType()).equals("0")) { //0：行政类 1：生活类 2：经济类
            wxQueinvest.setQueinvestType("行政类");
        } else if ((wxQueinvest.getQueinvestType()).equals("1")) {
            wxQueinvest.setQueinvestType("生活类");
        } else if ((wxQueinvest.getQueinvestType()).equals("2")) {
            wxQueinvest.setQueinvestType("经济类");
        }
        return wxQueinvest;
    }



    /**
     *
     * 查询所有的题目
     * @return
     */
    @JSON
    @PostMapping(value = "/addQuestion")
    @EndpointRest(id = "questionlist", name = "题目列表", authorizedType = AuthorizedType.LOGIN)
    public List<WXQuestions> addQuestion() {
        List<WXQuestions> list= wxQueinvestService.addQuestion();
        System.out.println(list);
        return list;

    }


    /**
     * 添加题目到问卷中去
     * @return
     */
    @JSON
    @PostMapping(value = "/updateQuestion")
    @EndpointRest(id = "updateList", name = "ddd" )
    public void updateQuestion(@RequestBody Map<String,Object> map)  {
       List <String> idsArr=(List<String>) map.get("idsJson");
        Object object02 = map.get("idJson");
        for (int i=0;i<idsArr.size();i++) {
            Object object= idsArr.get(i);
            wxQueinvestService.updateQuestion(object,object02);
        }

    }

    /**
     * 修改操作  发布
     */
    @JSON
    @PostMapping(value = "/updateStatus")
    @EndpointRest(id = "updateStatus", name = "", authorizedType = AuthorizedType.GUEST)

    public void updateStatus(@RequestBody String id){
        wxQueinvestService.updateStatus(id);
    }


    /**
     * 修改操作  撤销发布
     */
    @JSON
    @PostMapping(value = "/updateStatus02")
    @EndpointRest(id = "updateStatus02", name = "", authorizedType = AuthorizedType.GUEST)

    public void updateStatus02(@RequestBody String id){
        wxQueinvestService.updateStatus02(id);
    }



    /**
     * 修改操作  撤销发布
     */
    @JSON
    @PostMapping(value = "/findAllQuestion")
    @EndpointRest(id = "findAllQuestion", name = "", authorizedType = AuthorizedType.GUEST)

    public List<WXQuestions> findAllQuestion(@RequestBody String id){
       return  wxQueinvestService.findAllQuestion(id);
    }


    /**
     * 修改操作  撤销发布
     */
    @JSON
    @PostMapping(value = "/getDetail")
    @EndpointRest(id = "getDetail", name = "", authorizedType = AuthorizedType.GUEST)

    public WXQueinvest getDetail(@RequestBody String id){
        return  wxQueinvestService.getDetail(id);
    }

    /**
     * 查看详情
     * @param id
     * @return
     */
    @Override
    public WXQueinvest get(@PathVariable String id) {

        WXQueinvest wxQueinvest=wxQueinvestService.get(id);
        if(wxQueinvest.getStatus()!=null){ // 不为空
           if(wxQueinvest.getStatus().equals("0")){ // 如果是0  临时状态
               wxQueinvest.setStatus("临时状态");
           }
           if(wxQueinvest.getStatus().equals("1")){ // 如果是1   未发布
               wxQueinvest.setStatus("未发布");
           }
           if(wxQueinvest.getStatus().equals("2")){ // 2   发布
               wxQueinvest.setStatus("发布");

           }
        }
        return wxQueinvest;
    }
}



