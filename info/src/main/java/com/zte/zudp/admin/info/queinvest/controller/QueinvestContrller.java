package com.zte.zudp.admin.info.queinvest.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.queinvest.QueinvestMenu;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import com.zte.zudp.admin.info.queinvest.service.QueinvestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 *  问卷调查
 */
@RestController
@EndpointModule(name = "问卷调查", id = "queinvest", parent = QueinvestMenu.class, order = 1, icon = "home")
@RequestMapping("/queinvest")
public class QueinvestContrller extends AbstractCRUDController<Queinvest> {
    @Autowired
    private QueinvestService queinvestService;


    /**
     * 问卷类型的下拉  新建
     * @return
     */
    @JSON
    @GetMapping(value = "/getAllType")
    @EndpointRest(id = "List", name = "问卷类型下拉", authorizedType = AuthorizedType.GUEST)
    public List<Dictionary> getlist() {
        List<Dictionary> list = queinvestService.getList();
//        for (int i = 0; i < list.size(); i++) {
//            if (list.get(i).getQueinvestType().equals("0")) { //0：行政类 1：生活类 2：经济类
//                list.get(i).setQueinvestType("行政类");
//            } else if (list.get(i).getQueinvestType().equals("1")) {
//                list.get(i).setQueinvestType("生活类");
//            } else if (list.get(i).getQueinvestType().equals("2")) {
//                list.get(i).setQueinvestType("经济类");
//            }
//        }
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
    public Queinvest getOneType(String id) {
        Queinvest queinvest= queinvestService.get(id);
        if ((queinvest.getQueinvestType()).equals("0")) { //0：行政类 1：生活类 2：经济类
            queinvest.setQueinvestType("行政类");
        } else if ((queinvest.getQueinvestType()).equals("1")) {
            queinvest.setQueinvestType("生活类");
        } else if ((queinvest.getQueinvestType()).equals("2")) {
            queinvest.setQueinvestType("经济类");
        }
        return queinvest;
    }



    /**
     *
     * 查询所有的题目
     * @return
     */
    @JSON
    @PostMapping(value = "/addQuestion")
    @EndpointRest(id = "questionlist", name = "题目列表", authorizedType = AuthorizedType.LOGIN)
    public List<Questions> addQuestion() {
        List<Questions> list= queinvestService.addQuestion();
        System.out.println(list);
        return list;

    }


    /**
     * 添加题目到问卷中去
     * @return
     */
    @PostMapping(value = "/updateQuestion")
    public void updateQuestion(@RequestBody Map<String,Object> map)  {
        // 题目id数组
       List <String> idsArr=(List<String>) map.get("idsJson");
       // 问卷id
       String queinId = map.get("idJson").toString();
        for (int i=0;i<idsArr.size();i++) {
            String questionId= idsArr.get(i).toString();
            queinvestService.updateQuestion(questionId,queinId);
        }

    }

    /**
     * 修改操作  发布
     */
    @JSON
    @PostMapping(value = "/updateStatus")
    @EndpointRest(id = "updateStatus", name = "", authorizedType = AuthorizedType.GUEST)

    public int updateStatus(@RequestBody String id){
       return queinvestService.updateStatus(id);
    }


    /**
     * 修改操作  撤销发布
     */
    @JSON
    @PostMapping(value = "/updateStatus02")
    @EndpointRest(id = "updateStatus02", name = "", authorizedType = AuthorizedType.GUEST)

    public void updateStatus02(@RequestBody String id){
        queinvestService.updateStatus02(id);
    }



    /**
     * 修改操作  撤销发布
     */
    @JSON
    @PostMapping(value = "/findAllQuestion")
    @EndpointRest(id = "findAllQuestion", name = "", authorizedType = AuthorizedType.GUEST)

    public List<Questions> findAllQuestion(@RequestBody String id){
       return  queinvestService.findAllQuestion(id);
    }


    /**
     * 修改操作  撤销发布
     */
    @JSON
    @PostMapping(value = "/getDetail")
    @EndpointRest(id = "getDetail", name = "", authorizedType = AuthorizedType.GUEST)

    public Queinvest getDetail(@RequestBody String id){
        return  queinvestService.getDetail(id);
    }

    /**
     * 查看详情
     * @param id
     * @return
     */
    @Override
    public Queinvest get(@PathVariable String id) {

        Queinvest queinvest=queinvestService.get(id);
        if(queinvest.getStatus()!=null){ // 不为空
           if(queinvest.getStatus().equals("0")){ // 如果是0  临时状态
               queinvest.setStatus("临时状态");
           }
           if(queinvest.getStatus().equals("1")){ // 如果是1   未发布
               queinvest.setStatus("未发布");
           }
           if(queinvest.getStatus().equals("2")){ // 2   发布
               queinvest.setStatus("发布");

           }
        }
        return queinvest;
    }
}



