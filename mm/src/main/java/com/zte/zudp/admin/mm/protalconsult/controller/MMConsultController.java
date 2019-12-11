package com.zte.zudp.admin.mm.protalconsult.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.persistence.Subject;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.mm.protalconsult.entity.MMConsult;
import com.zte.zudp.admin.mm.protalconsult.service.MMConsultService;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/consult")
public class MMConsultController {
    @Resource
    private MMConsultService mmConsultService;

    /**
     * 主页跳转我的咨询
     * 显示所有咨询
     * @param model
     * @return
     */
    @RequestMapping("/myadvisory")
    public String myadvisory(Model model){
        //所有咨询
        List<MMConsult> list = mmConsultService.show(null);
        model.addAttribute("list",list);
        return "/mm/consult/my-advisory";
        /*String path = "/mm/consult/my-advisory";
        return Result.success("", path);*/
    }

    /**
     * 点击其中一条咨询跳转到这个控制器
     * 通过id查询咨询的详细信息并跳转到详细页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/zxdetail/{id}")
    public String zxdetail(@PathVariable("id") String id, Model model){
        //当前咨询的所有信息,包含附件
        MMConsult mmConsult = mmConsultService.get(id);
        model.addAttribute("mm",mmConsult);
        return "/mm/consult/zxdetail";
    }

    /**
     * 新建咨询控制器
     * 成功返回我的咨询界面
     * @param mmConsult
     * @return
     */
    @RequestMapping("/addadvisory")
    public String addAdvisory(MMConsult mmConsult){
        mmConsult=getEntity(mmConsult);
        //插入咨询
        int i = mmConsultService.insConsult(mmConsult);
        //插入咨询附件
        mmConsultService.afterInsert(mmConsult);
        if (i>0){
            return "/consult/myadvisory";
        }
        return null;
    }

    /**
     * 随机生成id
     * @param mmConsult
     * @return
     */
    private MMConsult getEntity(MMConsult mmConsult) {
        mmConsult.setId(String.valueOf(IDUtil.simpleId()));
        Subject user = SubjectUtil.getSubject();
        mmConsult.setCreateUser(user);
        mmConsult.setUpdateUser(user);
        mmConsult.setCreateDate(new Date());
        mmConsult.setUpdateDate(mmConsult.getCreateDate());
        return mmConsult;
    }

}
