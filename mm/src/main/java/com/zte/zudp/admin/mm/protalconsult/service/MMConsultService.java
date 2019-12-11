package com.zte.zudp.admin.mm.protalconsult.service;

import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.mm.protalconsult.dao.MMConsultDao;
import com.zte.zudp.admin.mm.protalconsult.entity.MMConsult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Service
@Transactional(rollbackFor = Exception.class)
public class MMConsultService extends FileBusinessService<MMConsult> {
    @Resource
    private MMConsultDao mmConsultDao;

   /* private MMConsultService dao() {
        return (MMConsultService) dao;
    }*/

    /**
     * 初始化附件关联表名
     */
    public MMConsultService(){
        super.setTableName("zmj_consult");
    }

    /**
     * 查询所有咨询信息
     * @param mmConsult
     * @return
     */
    @Transactional(readOnly = true)
    public List<MMConsult> show(MMConsult mmConsult) {
        return mmConsultDao.selAll(mmConsult);
    }

    /**
     * 通过id查询咨询信息
     * @param id
     * @return
     */
    @Transactional(readOnly = true)
    public MMConsult selById(String id) {
        return mmConsultDao.selById(id);
    }

    /**
     * 插入咨询信息
     * @param mmConsult
     * @return
     */
    public int insConsult(MMConsult mmConsult) {
        return mmConsultDao.insConsult(mmConsult);
    }

    /**
     * 重写父类的方法(protected)
     * 便于控制器直接调用
     * @param mmConsult
     */
    @Override
    public synchronized void afterInsert(MMConsult mmConsult) {
        super.afterInsert(mmConsult);
    }
}
