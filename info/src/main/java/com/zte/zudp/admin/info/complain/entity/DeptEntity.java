package com.zte.zudp.admin.info.complain.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * @Description 本实体类用于投诉/建议 对应部门，所衍生出来的部门表
 * @Author DeptEntity
 * @Date 2019/11/26 10:03
 **/
public class DeptEntity extends DataEntity {

    /**
     * department 部门名
     */
    private String department;
    
    /**
     * deptno 部门编号
     */

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }



    @Override
    public String toString() {
        return "DeptEntity{" +
                "department='" + department + '\'' +
                '}';
    }
}
