package com.zte.zudp.admin.mm.rank.entity;

/**
 * @Description ${}
 * @Author RankEntity
 * @Date 2019/12/11 21:21
 **/
public class MMRankEntity {

    /**
     * id : 主键
     */
    private String id;

    /**
     * points : 用户积分数
     */
    private String points;

    /**
     * telephone : 用户账户信息的 id ，电话号码就是唯一id
     */
    private String telephone;

    /**
     * rank : 用户积分排名
     */
    private String rank;

    /**
     * name : 用户姓名，根据用户 telephone 查询用户信息表得到用户姓名（暂时没有对接用户信息表）
     */
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPoints() {
        return points;
    }

    public void setPoints(String points) {
        this.points = points;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "MMRankEntity{" +
                "id='" + id + '\'' +
                ", points='" + points + '\'' +
                ", telephone='" + telephone + '\'' +
                ", rank='" + rank + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
