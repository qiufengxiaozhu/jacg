package com.zte.zudp.admin.mm.protalconsult.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.mm.protalconsult.entity.MMConsult;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MMConsultDao extends AbstractDao<MMConsult>{
    /**
     * 查询所有咨询信息
     * @param mmConsult
     * @return
     */
    public List<MMConsult> selAll(MMConsult mmConsult);

    /**
     * 根据id查询咨询信息
     * @param id
     * @return
     */
    public MMConsult selById(String id);

    /**
     * 插入咨询
     * @param mmConsult
     * @return
     */
    public int insConsult(MMConsult mmConsult);

    /**
     * 去数据库中匹配电话和用户名称
     * @param
     * @param
     * @return
     */
    List<Map> checkUserAndPhone02(@Param("name") String name, @Param("phone") String phone);

    /**
     * 去数据库中匹配电话和用户名称
     * @param userName
     * @param userPhone
     * @return
     */
    List<MMConsult> showAndCheck(@Param("userName")Object userName,  @Param("userPhone")Object userPhone);
}
