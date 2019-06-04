package com.psm.dto;

import javax.persistence.*;

@Table(name = "action_info")
public class ActionInfo {
    @Id
    @Column(name = "action_id")
    @GeneratedValue(generator = "JDBC")
    private Integer actionId;

    /**
     * 行为标题
     */
    @Column(name = "action_title")
    private String actionTitle;

    /**
     * 行为内容
     */
    @Column(name = "action_content")
    private String actionContent;

    /**
     * 学生id
     */
    @Column(name = "stu_id")
    private Integer stuId;

    @Transient
    private String stuName;
    @Transient
    private Long stuNumber;

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public Long getStuNumber() {
        return stuNumber;
    }

    public void setStuNumber(Long stuNumber) {
        this.stuNumber = stuNumber;
    }

    /**
     * @return action_id
     */
    public Integer getActionId() {
        return actionId;
    }

    /**
     * @param actionId
     */
    public void setActionId(Integer actionId) {
        this.actionId = actionId;
    }

    /**
     * 获取行为标题
     *
     * @return action_title - 行为标题
     */
    public String getActionTitle() {
        return actionTitle;
    }

    /**
     * 设置行为标题
     *
     * @param actionTitle 行为标题
     */
    public void setActionTitle(String actionTitle) {
        this.actionTitle = actionTitle;
    }

    /**
     * 获取行为内容
     *
     * @return action_content - 行为内容
     */
    public String getActionContent() {
        return actionContent;
    }

    /**
     * 设置行为内容
     *
     * @param actionContent 行为内容
     */
    public void setActionContent(String actionContent) {
        this.actionContent = actionContent;
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
}