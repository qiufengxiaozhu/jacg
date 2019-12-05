package com.zte.zudp.admin.mm.svr;

import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.mm.dao.PostDao;
import com.zte.zudp.admin.mm.entity.PostEntity;

/**
 * 岗位管理service
 * @author: wlf
 * Date: 2019/1/16
 * Time: 14:15
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class PostService extends FileBusinessService<PostEntity> {

    private PostDao dao(){return (PostDao)dao;}

    /**
     * 初始化附件关联表名
     */
    public PostService(){
        super.setTableName("oa_post");
    }

    public boolean checkName(String name,String id) {
        return dao().checkName(name,id) == 0;
    }
    public boolean checkIdentification(String identification,String id) {
        return dao().checkIdentification(identification,id) == 0;
    }
}
