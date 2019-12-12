package com.zte.zudp.admin.mm.rank.service.serviceImp;

import com.zte.zudp.admin.mm.rank.dao.MMRankDao;
import com.zte.zudp.admin.mm.rank.entity.MMRankEntity;
import com.zte.zudp.admin.mm.rank.service.MMRankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Description ${}
 * @Author MMRankServiceImpl
 * @Date 2019/12/12 11:30
 **/
@Service
@Transactional(rollbackFor = Exception.class)
public class MMRankServiceImpl implements MMRankService {

    private static final String NUMBER = "50";

    @Autowired
    private MMRankDao mmRankDao;

    /**
     * 根据自己的 唯一身份 id ，这里是 电话号码 telephone
     * 得到自己积分排名，根据上面的表作为结果集表
     * @param telephone
     * @return
     */
    @Override
    public MMRankEntity myRank(String telephone) {
        return mmRankDao.myRank(telephone);
    }

    /**
     * 使用默认的显示 排行榜前五十名
     * 得到所有人的积分排行，根据电话号码累计积分并限制查询数据条数 只查询 number 条数据
     * @return
     */
    @Override
    public List<MMRankEntity> rankListOfLimit() {
        return mmRankDao.rankListOfLimit(NUMBER);
    }
}
