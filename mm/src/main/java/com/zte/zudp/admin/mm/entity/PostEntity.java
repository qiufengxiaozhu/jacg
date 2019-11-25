package com.zte.zudp.admin.mm.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 岗位信息实体类
 * User: wlf
 * Date: 2019/1/16
 * Time: 14:03
 */
public class PostEntity extends DataEntity{

    /**
	 * 
	 */
	private static final long serialVersionUID = 2456247955948607105L;
	private String name;//岗位名称
    private String mark;//岗位描述
    private String identification;//岗位标识
    

    public String getIdentification() {
		return identification;
	}

	public void setIdentification(String identification) {
		this.identification = identification;
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }
}
