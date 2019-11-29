package com.zte.zudp.admin.info.queinvest.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.queinvest.entity.Options;
import com.zte.zudp.admin.info.queinvest.entity.Questions;
import org.apache.poi.ss.formula.functions.T;

/**
 *
 */
public interface OptionDao extends AbstractDao<Options> {

    /**
     * 添加选项
     * @param t
     */
    Integer addOption(Options t);
}
