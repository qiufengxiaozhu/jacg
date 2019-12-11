package com.zte.zudp.admin.info.myneedlike.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.myneedlike.entity.likeEntity;
import com.zte.zudp.admin.info.myneedlike.entity.likeInfoEntity;
import com.zte.zudp.admin.info.myneedlike.service.likeInfoService;
import com.zte.zudp.admin.info.myneedlike.service.likeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * 点赞详情controller
 * @author lc
 * Date: 2019/12/07
 * Time: 13:38
 */
@RestController
@EndpointModule(name = "点赞详情", id = "likeInfo" )
@RequestMapping(value = "/likeInfo")
public class likeInfoController extends AbstractCRUDController<likeInfoEntity> {

    @Autowired
    private likeInfoService likeInfoService;

    @Autowired
    private likeService likeService;

    private likeInfoService service(){
        return (likeInfoService) service;
    }

    /*
    * 手机端我要点赞查询
    * */
    @PostMapping(value = "/findList")
    public List<likeEntity> findList(likeEntity likeEntity){
        return likeService.findList(likeEntity);
    }


    /*
    * 点赞评论列表
    * */
    @JSON
    @PostMapping(value = "/likeInfoList" )
    @EndpointRest(id = "likeInfoList", name = "", authorizedType = AuthorizedType.GUEST)
    public List<likeInfoEntity> findInfoList(String contentId){
        likeInfoEntity likeInfoEntity = new likeInfoEntity();
        likeInfoEntity.setLikeContentId(contentId);
        return  likeInfoService.findList(likeInfoEntity);
    }








}
