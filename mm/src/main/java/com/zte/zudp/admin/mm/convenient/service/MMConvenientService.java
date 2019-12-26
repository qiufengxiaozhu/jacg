package com.zte.zudp.admin.mm.convenient.service;

import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
import com.zte.zudp.admin.mm.convenient.dao.MMConvenientDao;
import com.zte.zudp.admin.mm.convenient.entity.MMConvenient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Description ${} 便民服务业务层
 * @Author ConvenientService
 * @Date 2019/12/16 8:38
 **/

@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class MMConvenientService extends FileBusinessService<MMConvenient> {

    @Autowired
    private MMConvenientDao mmConvenientDao;



    /**
     * 查询所有类别
     * @return
     */
        public List<Dictionary> getConvenientType(){
        return mmConvenientDao.getConvenientType();
    }

    /**
     * 根据类别查找服务
     * @return
     */
    public List<MMConvenient> getConvenientList(String id){
            return mmConvenientDao.getConvenientList(id);
    }

}
