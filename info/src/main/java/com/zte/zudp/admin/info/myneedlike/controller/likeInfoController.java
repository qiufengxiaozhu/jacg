package com.zte.zudp.admin.info.myneedlike.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.myneedlike.entity.likeEntity;
import com.zte.zudp.admin.info.myneedlike.entity.likeInfoEntity;
import com.zte.zudp.admin.info.myneedlike.service.likeInfoService;
import com.zte.zudp.admin.info.myneedlike.service.likeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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
        likeEntity.setPublishStatus("1");
        return likeService.findList(likeEntity);
    }


    /*
    * 点赞评论列表
    * */
    @JSON
    @PostMapping(value = "/likeInfoList" )
    @EndpointRest(id = "likeInfoList", name = "", authorizedType = AuthorizedType.GUEST)
    public List<likeInfoEntity> findInfoList(String contentID){
        likeInfoEntity likeInfoEntity = new likeInfoEntity();
        likeInfoEntity.setLikeContentId(contentID);
        return  likeInfoService.findList(likeInfoEntity);
    }


    /*
    * 评论点赞数
    * */
    @JSON
    @PostMapping(value = "/updateLikeCNum" )
    @EndpointRest(id = "updateLikeCNum", name = "", authorizedType = AuthorizedType.GUEST)
    public likeInfoEntity updateLikeCNum(String id){
     likeInfoService.updateLikeCNum(id);
     return likeInfoService.get(id);
    }

    /*
    * 评论提交
    * */
    @JSON
    @GetMapping(value = "/commentSubmit" )
    @EndpointRest(id = "commentSubmit", name = "", authorizedType = AuthorizedType.GUEST)
    public void commentSubmit(String contentID,String matter){
        likeInfoEntity likeInfoEntity = new likeInfoEntity();
        likeInfoEntity.setId(String.valueOf(IDUtil.simpleId()));
        likeInfoEntity.setLikeTime(new Date());
        likeInfoEntity.setLikeContentId(contentID);
        likeInfoEntity.setLikePID("最帅的人");
        likeInfoEntity.setComment(matter);
        likeInfoEntity.setIcon("1");
       likeInfoService.insert(likeInfoEntity);
    }






}
