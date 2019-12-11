package com.zte.zudp.admin.info.consultation.controller;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.consultation.ConsultMenu;
import com.zte.zudp.admin.info.consultation.entity.Consult;
import com.zte.zudp.admin.info.consultation.service.ConsultService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
@RestController
@EndpointModule(name = "咨询管理",id = "consult",parent = ConsultMenu.class,order =19,icon ="bookmark")
@RequestMapping("/consult")
public class ConsultController extends AbstractCRUDController<Consult> {
    @Resource
    private ConsultService consultService;

    /**
     * 获取咨询信息附件
     * @param id
     * @return
     */
    @RequestMapping("/getFj")
    @ResponseBody
    public Consult getFj(String id){
        return consultService.getFj(id);
    }
}
