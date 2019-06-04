package com.psm.dto;

import java.util.Date;
import javax.persistence.*;

@Table(name = "notice_info")
public class NoticeInfo {
    /**
     * 通知id
     */
    @Id
    @Column(name = "notice_id")
    @GeneratedValue(generator = "JDBC")
    private Integer noticeId;

    /**
     * 标题
     */
    private String title;

    /**
     * 添加时间
     */
    @Column(name = "add_time")
    private Date addTime;

    /**
     * 简介
     */
    private String profile;

    /**
     * 内容
     */
    private String context;

    /**
     * 标签
     */
    private String label;

    /**
     * 类别
     */
    private String category;

    /**
     * 访问量
     */
    @Column(name = "visit_count")
    private Integer visitCount;

    /**
     * 作者
     */
    private String author;

    /**
     * 班级id
     */
    @Column(name = "class_id")
    private Integer classId;

    /**
     * 获取通知id
     *
     * @return notice_id - 通知id
     */
    public Integer getNoticeId() {
        return noticeId;
    }

    /**
     * 设置通知id
     *
     * @param noticeId 通知id
     */
    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    /**
     * 获取标题
     *
     * @return title - 标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置标题
     *
     * @param title 标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取添加时间
     *
     * @return add_time - 添加时间
     */
    public Date getAddTime() {
        return addTime;
    }

    /**
     * 设置添加时间
     *
     * @param addTime 添加时间
     */
    public void setAddTime(Date addTime) {
        this.addTime = addTime;
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
     * 获取内容
     *
     * @return context - 内容
     */
    public String getContext() {
        return context;
    }

    /**
     * 设置内容
     *
     * @param context 内容
     */
    public void setContext(String context) {
        this.context = context;
    }

    /**
     * 获取标签
     *
     * @return label - 标签
     */
    public String getLabel() {
        return label;
    }

    /**
     * 设置标签
     *
     * @param label 标签
     */
    public void setLabel(String label) {
        this.label = label;
    }

    /**
     * 获取类别
     *
     * @return category - 类别
     */
    public String getCategory() {
        return category;
    }

    /**
     * 设置类别
     *
     * @param category 类别
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * 获取访问量
     *
     * @return visit_count - 访问量
     */
    public Integer getVisitCount() {
        return visitCount;
    }

    /**
     * 设置访问量
     *
     * @param visitCount 访问量
     */
    public void setVisitCount(Integer visitCount) {
        this.visitCount = visitCount;
    }

    /**
     * 获取作者
     *
     * @return author - 作者
     */
    public String getAuthor() {
        return author;
    }

    /**
     * 设置作者
     *
     * @param author 作者
     */
    public void setAuthor(String author) {
        this.author = author;
    }

    /**
     * 获取班级id
     *
     * @return class_id - 班级id
     */
    public Integer getClassId() {
        return classId;
    }

    /**
     * 设置班级id
     *
     * @param classId 班级id
     */
    public void setClassId(Integer classId) {
        this.classId = classId;
    }
}