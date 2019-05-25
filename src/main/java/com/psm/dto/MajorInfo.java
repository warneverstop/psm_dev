package com.psm.dto;

import javax.persistence.*;

@Table(name = "major_info")
public class MajorInfo {
    /**
     * 专业Id
     */
    @Id
    @Column(name = "major_id")
    @GeneratedValue(generator = "JDBC")
    private Integer majorId;

    /**
     * 专业名
     */
    @Column(name = "major_name")
    private String majorName;

    /**
     * 专业简介
     */
    private String profile;

    /**
     * 说明
     */
    private String remarks;

    /**
     * 删除状态，默认1，删除0
     */
    private Integer del;

    /**
     * 获取专业Id
     *
     * @return major_id - 专业Id
     */
    public Integer getMajorId() {
        return majorId;
    }

    /**
     * 设置专业Id
     *
     * @param majorId 专业Id
     */
    public void setMajorId(Integer majorId) {
        this.majorId = majorId;
    }

    /**
     * 获取专业名
     *
     * @return major_name - 专业名
     */
    public String getMajorName() {
        return majorName;
    }

    /**
     * 设置专业名
     *
     * @param majorName 专业名
     */
    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    /**
     * 获取专业简介
     *
     * @return profile - 专业简介
     */
    public String getProfile() {
        return profile;
    }

    /**
     * 设置专业简介
     *
     * @param profile 专业简介
     */
    public void setProfile(String profile) {
        this.profile = profile;
    }

    /**
     * 获取说明
     *
     * @return remarks - 说明
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * 设置说明
     *
     * @param remarks 说明
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