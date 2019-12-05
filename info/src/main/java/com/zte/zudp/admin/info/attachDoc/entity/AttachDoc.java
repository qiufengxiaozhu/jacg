package com.zte.zudp.admin.info.attachDoc.entity;


import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * @program: 业务附件表
 * @create: 2019-01-04
 **/
public class AttachDoc  extends DataEntity {

    //业务id
    private String billid;
    //业务类型
    private String billtype;
    //附件名
    private String name;
    //路径
    private String path;

    public String getBillid() {
        return billid;
    }

    public void setBillid(String billid) {
        this.billid = billid;
    }

    public String getBilltype() {
        return billtype;
    }

    public void setBilltype(String billtype) {
        this.billtype = billtype;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
