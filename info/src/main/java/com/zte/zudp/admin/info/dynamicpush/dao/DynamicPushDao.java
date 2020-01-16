package com.zte.zudp.admin.info.dynamicpush.dao;


import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.dynamicpush.entity.DynamicPush;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DynamicPushDao  extends AbstractDao<DynamicPush> {

    /**
     * 详情
     * @param id
     * @return
     */
    DynamicPush getDetail(@Param("id") String id);

    /**
     * 推送
     * @param id
     */
    void updateStatus(@Param("id") String id);

    /**
     * 撤销推送
     * @param id
     */
    void updateStatus02(@Param("id") String id);

    /**
     * 编辑后保存
     * @param contents
     * @param contentsText
     * @param title
     */
    void update02(DynamicPush dynamicPush);
}
