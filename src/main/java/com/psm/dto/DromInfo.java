package com.psm.dto;

import javax.persistence.*;

@Table(name = "drom_info")
public class DromInfo {
    @Id
    @Column(name = "drom_id")
    @GeneratedValue(generator = "JDBC")
    private Integer dromId;

    /**
     * 宿舍号
     */
    @Column(name = "drom_name")
    private String dromName;

    /**
     * 宿舍地址
     */
    @Column(name = "drom_address")
    private String dromAddress;

    /**
     * 标准
     */
    private String standrad;

    /**
     * 已住人数
     */
    @Column(name = "already_lived")
    private Integer alreadyLived;

    /**
     * 宿舍简介
     */
    private String profile;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 删除状态，默认1，删除0
     */
    private Integer del;

    /**
     * @return drom_id
     */
    public Integer getDromId() {
        return dromId;
    }

    /**
     * @param dromId
     */
    public void setDromId(Integer dromId) {
        this.dromId = dromId;
    }

    /**
     * 获取宿舍号
     *
     * @return drom_name - 宿舍号
     */
    public String getDromName() {
        return dromName;
    }

    /**
     * 设置宿舍号
     *
     * @param dromName 宿舍号
     */
    public void setDromName(String dromName) {
        this.dromName = dromName;
    }

    /**
     * 获取宿舍地址
     *
     * @return drom_address - 宿舍地址
     */
    public String getDromAddress() {
        return dromAddress;
    }

    /**
     * 设置宿舍地址
     *
     * @param dromAddress 宿舍地址
     */
    public void setDromAddress(String dromAddress) {
        this.dromAddress = dromAddress;
    }

    /**
     * 获取标准
     *
     * @return standrad - 标准
     */
    public String getStandrad() {
        return standrad;
    }

    /**
     * 设置标准
     *
     * @param standrad 标准
     */
    public void setStandrad(String standrad) {
        this.standrad = standrad;
    }

    /**
     * 获取已住人数
     *
     * @return already_lived - 已住人数
     */
    public Integer getAlreadyLived() {
        return alreadyLived;
    }

    /**
     * 设置已住人数
     *
     * @param alreadyLived 已住人数
     */
    public void setAlreadyLived(Integer alreadyLived) {
        this.alreadyLived = alreadyLived;
    }

    /**
     * 获取宿舍简介
     *
     * @return profile - 宿舍简介
     */
    public String getProfile() {
        return profile;
    }

    /**
     * 设置宿舍简介
     *
     * @param profile 宿舍简介
     */
    public void setProfile(String profile) {
        this.profile = profile;
    }

    /**
     * 获取备注
     *
     * @return remarks - 备注
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * 设置备注
     *
     * @param remarks 备注
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    /**
     * 获取删除状态，默认1，删除0
     *
     * @return del - 删除状态，默认1，删除0
     */
    public Integer getDel() {
        return del;
    }

    /**
     * 设置删除状态，默认1，删除0
     *
     * @param del 删除状态，默认1，删除0
     */
    public void setDel(Integer del) {
        this.del = del;
    }
}