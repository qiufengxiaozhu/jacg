package com.zte.zudp.admin.info.convenient.service;

import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.info.convenient.dao.ConvenientDao;
import com.zte.zudp.admin.info.convenient.entity.Convenient;
import com.zte.zudp.admin.info.queinvest.entity.Dictionary;
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
public class ConvenientService extends FileBusinessService<Convenient> {

    @Autowired
    private ConvenientDao convenientDao;

    /**
     * 初始化附件关联表名
     */
    public ConvenientService(){
        super.setTableName("qgq_convenient");
    }

    /**
     * 查询所有类别
     * @return
     */
        public List<Dictionary> getTypeList(){
        return convenientDao.getTypeList();
    }

    /**
     * 根据类别查找服务
     * @return
     */
//    public List<Convenient> getConvenientList(String id){
//            return convenientDao.getConvenientList(id);
//    }

}
