package com.psm.dto;

import javax.persistence.*;

@Table(name = "user_status")
public class UserStatus {
    @Id
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    @Column(name = "user_id")
    private String userId;

    /**
     * 身份id
     */
    @Column(name = "status_id")
    private Integer statusId;

    /**
     * 身份名，学生和老师
     */
    private String status;

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
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * 获取身份id
     *
     * @return status_id - 身份id
     */
    public Integer getStatusId() {
        return statusId;
    }

    /**
     * 设置身份id
     *
     * @param statusId 身份id
     */
    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    /**
     * 获取身份名，学生和老师
     *
     * @return status - 身份名，学生和老师
     */
    public String getStatus() {
        return status;
    }

    /**
     * 设置身份名，学生和老师
     *
     * @param status 身份名，学生和老师
     */
    public void setStatus(String status) {
        this.status = status;
    }
}