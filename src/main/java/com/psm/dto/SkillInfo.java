package com.psm.dto;

import javax.persistence.*;

@Table(name = "skill_info")
public class SkillInfo {
    @Id
    @Column(name = "skill_id")
    @GeneratedValue(generator = "JDBC")
    private Integer skillId;

    /**
     * 名称
     */
    @Column(name = "skill_name")
    private String skillName;

    /**
     * 简介
     */
    private String profile;

    /**
     * 详情地址
     */
    private String url;

    private Integer del;

    public Integer getDel() {
        return del;
    }

    public void setDel(Integer del) {
        this.del = del;
    }

    /**
     * @return skill_id
     */
    public Integer getSkillId() {
        return skillId;
    }

    /**
     * @param skillId
     */
    public void setSkillId(Integer skillId) {
        this.skillId = skillId;
    }

    /**
     * 获取名称
     *
     * @return skill_name - 名称
     */
    public String getSkillName() {
        return skillName;
    }

    /**
     * 设置名称
     *
     * @param skillName 名称
     */
    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    /**
     * 获取简介
     *
     * @return profile - 简介
     */
    public String getProfile() {
        return profile;
    }

    /**
     * 设置简介
     *
     * @param profile 简介
     */
    public void setProfile(String profile) {
        this.profile = profile;
    }

    /**
     * 获取详情地址
     *
     * @return url - 详情地址
     */
    public String getUrl() {
        return url;
    }

    /**
     * 设置详情地址
     *
     * @param url 详情地址
     */
    public void setUrl(String url) {
        this.url = url;
    }
}