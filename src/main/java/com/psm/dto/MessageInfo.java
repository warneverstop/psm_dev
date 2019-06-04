package com.psm.dto;

import java.util.Date;
import javax.persistence.*;

@Table(name = "message_info")
public class MessageInfo {
    @Id
    @Column(name = "message_id")
    @GeneratedValue(generator = "JDBC")
    private Integer messageId;

    /**
     * 用户名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 标题
     */
    private String title;

    /**
     * 内容
     */
    private String content;

    /**
     * 添加时间
     */
    @Column(name = "add_time")
    private Date addTime;

    /**
     * 默认0未回复，1回复
     */
    private Integer state;

    /**
     * 回复内容
     */
    @Column(name = "reply_content")
    private String replyContent;

    /**
     * 回复时间
     */
    @Column(name = "reply_time")
    private Date replyTime;

    /**
     * 班级Id
     */
    @Column(name = "class_id")
    private Integer classId;

    /**
     * @return message_id
     */
    public Integer getMessageId() {
        return messageId;
    }

    /**
     * @param messageId
     */
    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    /**
     * 获取用户名
     *
     * @return user_name - 用户名
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置用户名
     *
     * @param userName 用户名
     */
    public void setUserName(String userName) {
        this.userName = userName;
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
     * 获取默认0未回复，1回复
     *
     * @return state - 默认0未回复，1回复
     */
    public Integer getState() {
        return state;
    }

    /**
     * 设置默认0未回复，1回复
     *
     * @param state 默认0未回复，1回复
     */
    public void setState(Integer state) {
        this.state = state;
    }

    /**
     * 获取回复内容
     *
     * @return reply_content - 回复内容
     */
    public String getReplyContent() {
        return replyContent;
    }

    /**
     * 设置回复内容
     *
     * @param replyContent 回复内容
     */
    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    /**
     * 获取回复时间
     *
     * @return reply_time - 回复时间
     */
    public Date getReplyTime() {
        return replyTime;
    }

    /**
     * 设置回复时间
     *
     * @param replyTime 回复时间
     */
    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    /**
     * 获取班级Id
     *
     * @return class_id - 班级Id
     */
    public Integer getClassId() {
        return classId;
    }

    /**
     * 设置班级Id
     *
     * @param classId 班级Id
     */
    public void setClassId(Integer classId) {
        this.classId = classId;
    }
}