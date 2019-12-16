package com.zte.zudp.admin.info.myneedlike.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.myneedlike.entity.likeEntity;
import com.zte.zudp.admin.info.myneedlike.entity.likeInfoEntity;
import com.zte.zudp.admin.info.myneedlike.likeMenu;
import com.zte.zudp.admin.info.myneedlike.service.likeInfoService;
import com.zte.zudp.admin.info.myneedlike.service.likeService;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * 我要点赞controller
 * @author lc
 * Date: 2019/12/05
 * Time: 13:38
 */
@RestController
@EndpointModule(name = "我要点赞", id = "like", parent = likeMenu.class, order = 19, icon = "bookmark")
@RequestMapping(value = "/like")
public class likeController extends AbstractCRUDController<likeEntity>{

    @Autowired
    private likeService likeService;

    @Autowired
    private likeInfoService likeInfoService;

    /*
    * 发布
    * */
    @JSON
    @PostMapping(value = "/updatePublish")
    @EndpointRest(id = "updatePublish", name = "", authorizedType = AuthorizedType.GUEST)
    public void updatePublish(@RequestBody String id ){
        likeService.updatePublish(id);
    }

    /*
     * 撤销发布
     * */
    @JSON
    @PostMapping(value = "/updateNoPublish" )
    @EndpointRest(id = "updateNoPublish", name = "", authorizedType = AuthorizedType.GUEST)
    public void updateNoPublish(@RequestBody String id ){
        likeService.updateNoPublish(id);
    }

    /*
    * 有效时间查询
    * */
    @JSON
    @PostMapping(value = "/findValidTime" )
    @EndpointRest(id = "findValidTime", name = "", authorizedType = AuthorizedType.GUEST)
    public List<likeEntity> findValidTime(likeEntity likeEntity){
       return  likeService.findValidTime(likeEntity);
    }

    /*
     * 点赞操作
     * */
    @JSON
    @PostMapping(value = "/likeNum" )
    @EndpointRest(id = "likeNum", name = "", authorizedType = AuthorizedType.GUEST)
    public likeEntity like(HttpSession session,String id, String comment){
        likeInfoEntity likeInfoEntity = new likeInfoEntity();
        likeInfoEntity.setId(String.valueOf(IDUtil.simpleId()));
        likeInfoEntity.setLikeTime(new Date());
        likeInfoEntity.setLikeContentId(id);
        likeInfoEntity.setLikePID((String) session.getAttribute("userName"));
        likeInfoEntity.setLikePhone((String) session.getAttribute("userPhone"));
        likeInfoEntity.setIcon("1");
        List<likeInfoEntity> list = likeInfoService.findList(likeInfoEntity);
        if(list.toArray().length > 0){
            return likeService.get(id);
        }
        likeInfoService.insert(likeInfoEntity);
        likeService.updateLikeNum(id);
        return   likeService.get(id);
    }

   /*
   *  手机端详情表单
   * */
    @JSON
    @PostMapping(value = "/getLikeInfo")
    @EndpointRest(id = "getLikeInfo", name = "", authorizedType = AuthorizedType.GUEST)
    public likeEntity getLikeInfo(String likeContentId) {
        likeEntity likeEntity  = likeService.get(likeContentId);
        return likeEntity;
    }
    /*
     * 手机端更新详情表单
     *
     * */
    @JSON
    @PostMapping(value = "/updataLikeInfo")
    @EndpointRest(id = "updataLikeInfo", name = "", authorizedType = AuthorizedType.GUEST)
    public void updataLikeInfo(likeEntity likeEntity) {
        System.out.println(likeEntity);
        likeService.update(likeEntity);
    }

    /*
    * 手机端标题框搜索
    * */
    @JSON
    @PostMapping(value  = "/searchTitle")
    @EndpointRest(id= "searchTitle",name = "", authorizedType = AuthorizedType.GUEST)
    public List<likeEntity> searchTitle(String title){
        likeEntity  likeEntity = new likeEntity();
        likeEntity.setTitle(title);
        return likeService.findList(likeEntity);
    }


    private likeService service(){
        return (likeService) service;
    }

}
