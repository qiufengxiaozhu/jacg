package com.zte.zudp.admin.mm.ctrl;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.mm.PostMenu;
import com.zte.zudp.admin.mm.entity.PostEntity;
import com.zte.zudp.admin.mm.svr.PostService;

/**
 * 岗位管理controller
 * @author wlf
 * Date: 2019/1/16
 * Time: 15:38
 */
@RestController
@EndpointModule(name = "岗位管理", id = "post", parent = PostMenu.class, order = 19, icon = "bookmark")
@RequestMapping(value = "/post")
public class PostController extends AbstractCRUDController<PostEntity> {

    private PostService service(){return (PostService) service;}

    @JSON(include = "id,name", type = PostEntity.class)
    @GetMapping(value = "/plist")
    @EndpointRest(id = "plist", name = "岗位下拉列表展示", authorizedType = AuthorizedType.LOGIN)
    public List<PostEntity> userList() {
        return service().findList();

    }

    @JSON
    @GetMapping(value = "/checkName")
    @EndpointRest(id = "checkName", name = "校验名称是否存在", authorizedType = AuthorizedType.GUEST)
    public boolean checkName(String name,String id) {
        return service().checkName(name,id);
    }
    @JSON
    @GetMapping(value = "/checkIdenty")
    @EndpointRest(id = "checkIdenty", name = "校验岗位标识是否存在", authorizedType = AuthorizedType.GUEST)
    public boolean checkIdenty(String identy,String id) {
        return service().checkIdentification(identy,id);
    }
}
