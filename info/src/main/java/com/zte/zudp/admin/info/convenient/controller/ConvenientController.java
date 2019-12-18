package com.zte.zudp.admin.info.convenient.controller;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.convenient.entity.Convenient;
import com.zte.zudp.admin.info.convenient.service.ConvenientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description ${}
 * @Author ConvenientController
 * @Date 2019/12/16 8:42
 **/

@RestController
@EndpointModule(name = "便民服务", id = "convenient", order = 16, icon = "bookmark")
@RequestMapping(value = "/convenient")
public class ConvenientController extends AbstractCRUDController<Convenient> {

    @Autowired
    private ConvenientService convenientService;

//    //点击类型列表查询该列表所有
//    @RequestMapping("/getConvenientList")
//    public List<Convenient> getConvenientList(@RequestParam("id")String id){
//
//
//        List<Convenient> convenientList = convenientService.getConvenientList(id);
//
//        for(int i=0;i<convenientList.size();i++){
//
//            System.out.println(convenientList.get(i).toString());
//        }
////
////        // 放入转发参数
////        model.addAttribute("ListType", convenientList);
////        // 放入jsp路径
////        mav.setViewName("/info/convenient/convenientlist");
//
//        return convenientList;
//    }



}
