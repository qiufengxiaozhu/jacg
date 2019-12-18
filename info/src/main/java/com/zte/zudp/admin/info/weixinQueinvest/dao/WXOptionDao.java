package com.zte.zudp.admin.info.weixinQueinvest.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.queinvest.entity.Options;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import com.zte.zudp.admin.info.weixinQueinvest.entity.WXOptions;
import org.apache.poi.ss.formula.functions.T;

/**
 * 选项 信息
 */
public interface WXOptionDao extends AbstractDao<WXOptions> {

    /**
     * 添加选项
     * @param t
     */
    Integer addOption(Options t);
}
