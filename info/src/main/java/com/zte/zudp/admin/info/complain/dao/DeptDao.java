package com.zte.zudp.admin.info.complain.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.complain.entity.DeptEntity;
import org.apache.ibatis.annotations.Param;

/**
 * @Description dept 部门表的增删查改
 * @Author DeptDao
 * @Date 2019/11/26 10:17
 **/
public interface DeptDao extends AbstractDao<DeptEntity> {
    /**
     * 实现以下的 XXXDao.xml
     */
    //findList() --List<DeptEntity> ---已完成

    //insert(T t) --int     --已完成

    //update(T t) --int

    //delete(String var1) --void

    //batchDelete(String[] var1) --void

    /**
     * 确定 department 的唯一性
     * @param department
     * @param id
     * @return
     */
    int checkDept(@Param("department") String department, @Param("id") String id);


//    //测试代码，用于测试 UserEntity 类
//    int saveUser();
}
