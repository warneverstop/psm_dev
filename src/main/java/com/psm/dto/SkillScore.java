package com.psm.dto;

import javax.persistence.*;

@Table(name = "skill_score")
public class SkillScore {
    @Id
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    /**
     * 学生id
     */
    @Column(name = "stu_id")
    private Integer stuId;

    /**
     * 技能id
     */
    @Column(name = "skill_id")
    private Integer skillId;

    /**
     * 状态，0未通过，1通过
     */
    private Integer state;

    @Transient
    private String StuName;
    @Transient
    private String skillName;
    @Transient
    private String profile;
    @Transient
    private String stuNumber;
    @Transient
    private String url;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getStuNumber() {
        return stuNumber;
    }

    public void setStuNumber(String stuNumber) {
        this.stuNumber = stuNumber;
    }

    public String getStuName() {
        return StuName;
    }

    public void setStuName(String stuName) {
        StuName = stuName;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取学生id
     *
     * @return stu_id - 学生id
     */
    public Integer getStuId() {
        return stuId;
    }

    /**
     * 设置学生id
     *
     * @param stuId 学生id
     */
    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    /**
     * 获取技能id
     *
     * @return skill_id - 技能id
     */
    public Integer getSkillId() {
        return skillId;
    }

    /**
     * 设置技能id
     *
     * @param skillId 技能id
     */
    public void setSkillId(Integer skillId) {
        this.skillId = skillId;
    }

    /**
     * 获取状态，0未通过，1通过
     *
     * @return state - 状态，0未通过，1通过
     */
    public Integer getState() {
        return state;
    }

    /**
     * 设置状态，0未通过，1通过
     *
     * @param state 状态，0未通过，1通过
     */
    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "SkillScore{" +
                "id=" + id +
                ", stuId=" + stuId +
                ", skillId=" + skillId +
                ", state=" + state +
                ", StuName='" + StuName + '\'' +
                ", skillName='" + skillName + '\'' +
                ", profile='" + profile + '\'' +
                ", stuNumber='" + stuNumber + '\'' +
                '}';
    }
}