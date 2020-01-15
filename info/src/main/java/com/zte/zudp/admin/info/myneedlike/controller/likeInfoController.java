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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
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
    public List<likeInfoEntity> findInfoList(HttpSession session,String contentID){
        likeInfoEntity likeInfoEntity = new likeInfoEntity();
        likeInfoEntity.setLikeContentId(contentID);
        likeInfoEntity.setLikePID((String) session.getAttribute("userName"));
        likeInfoEntity.setLikePhone((String) session.getAttribute("userPhone"));
        List<likeInfoEntity> list = likeInfoService.findList(likeInfoEntity);
        if(list.toArray().length > 0){
            return likeInfoService.findList(likeInfoEntity);
        }
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
    public void commentSubmit(HttpSession session,String contentID,String matter){
        likeInfoEntity likeInfoEntity = new likeInfoEntity();
        likeInfoEntity.setId(String.valueOf(IDUtil.simpleId()));
//        likeInfoEntity.setLikeTime(new Date());
        likeInfoEntity.setLikeContentId(contentID);
        likeInfoEntity.setComment(matter);
        likeInfoEntity.setIcon("1");
        likeInfoEntity.setLikePID((String) session.getAttribute("userName"));
        likeInfoEntity.setLikePhone((String) session.getAttribute("userPhone"));
//        List<likeInfoEntity> list = likeInfoService.findList(likeInfoEntity);
//        if(list.toArray().length > 0){
//            for(int i=0;i<list.toArray().length;i++){
//                likeInfoEntity = list.get(i);
//                if(likeInfoEntity.getComment()==null & likeInfoEntity.getComment().equals("")){
//                    likeInfoService.insert(likeInfoEntity);
//                    return;
//                }
//            }
//            list.get(0)
//            return;
//        }
        likeInfoService.insert(likeInfoEntity);
    }






}
