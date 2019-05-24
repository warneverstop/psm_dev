package com.psm.dto;

import javax.persistence.*;

@Table(name = "power_info")
public class PowerInfo {
    /**
     * 权限id
     */
    @Id
    @Column(name = "power_id")
    @GeneratedValue(generator = "JDBC")
    private Integer powerId;

    /**
     * 权限名
     */
    @Column(name = "power_name")
    private String powerName;

    /**
     * 权限说明
     */
    private String remark;

    /**
     * 获取权限id
     *
     * @return power_id - 权限id
     */
    public Integer getPowerId() {
        return powerId;
    }

    /**
     * 设置权限id
     *
     * @param powerId 权限id
     */
    public void setPowerId(Integer powerId) {
        this.powerId = powerId;
    }

    /**
     * 获取权限名
     *
     * @return power_name - 权限名
     */
    public String getPowerName() {
        return powerName;
    }

    /**
     * 设置权限名
     *
     * @param powerName 权限名
     */
    public void setPowerName(String powerName) {
        this.powerName = powerName;
    }

    /**
     * 获取权限说明
     *
     * @return remark - 权限说明
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置权限说明
     *
     * @param remark 权限说明
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
}