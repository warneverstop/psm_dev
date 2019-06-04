package com.psm.dto;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.*;

@Table(name = "exercise_info")
public class ExerciseInfo {
    /**
     * 活动id
     */
    @Id
    @Column(name = "exercise_id")
    @GeneratedValue(generator = "JDBC")
    private Integer exerciseId;

    @Column(name = "happen_time")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date happenTime;

    /**
     * 主题
     */
    private String theme;

    /**
     * 内容
     */
    private String content;

    /**
     * 首图
     */
    @Column(name = "first_img_url")
    private String firstImgUrl;

    /**
     * 其他活动图片
     */
    @Column(name = "others_img_url")
    private String othersImgUrl;

    /**
     * 班级id
     */
    @Column(name = "class_id")
    private Integer classId;

    @Transient
    private String[] urls;

    public String[] getUrls() {
        return urls;
    }

    public void setUrls(String[] urls) {
        this.urls = urls;
    }

    /**
     * 获取活动id
     *
     * @return exercise_id - 活动id
     */
    public Integer getExerciseId() {
        return exerciseId;
    }

    /**
     * 设置活动id
     *
     * @param exerciseId 活动id
     */
    public void setExerciseId(Integer exerciseId) {
        this.exerciseId = exerciseId;
    }

    /**
     * @return happen_time
     */
    public Date getHappenTime() {
        return happenTime;
    }

    /**
     * @param happenTime
     */
    public void setHappenTime(Date happenTime) {
        this.happenTime = happenTime;
    }

    /**
     * 获取主题
     *
     * @return theme - 主题
     */
    public String getTheme() {
        return theme;
    }

    /**
     * 设置主题
     *
     * @param theme 主题
     */
    public void setTheme(String theme) {
        this.theme = theme;
    }

    /**
     * 获取内容
     *
     * @return content - 内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置内容
     *
     * @param content 内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取首图
     *
     * @return first_img_url - 首图
     */
    public String getFirstImgUrl() {
        return firstImgUrl;
    }

    /**
     * 设置首图
     *
     * @param firstImgUrl 首图
     */
    public void setFirstImgUrl(String firstImgUrl) {
        this.firstImgUrl = firstImgUrl;
    }

    /**
     * 获取其他活动图片
     *
     * @return others_img_url - 其他活动图片
     */
    public String getOthersImgUrl() {
        return othersImgUrl;
    }

    /**
     * 设置其他活动图片
     *
     * @param othersImgUrl 其他活动图片
     */
    public void setOthersImgUrl(String othersImgUrl) {
        this.othersImgUrl = othersImgUrl;
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