package com.psm.dto;

import javax.persistence.*;

@Table(name = "parent_info")
public class ParentInfo {
    @Id
    @Column(name = "parent_id")
    @GeneratedValue(generator = "JDBC")
    private Integer parentId;

    /**
     * 家长姓名
     */
    @Column(name = "parent_name")
    private String parentName;

    /**
     * 学生id
     */
    @Column(name = "stu_id")
    private Integer stuId;

    /**
     * 关系
     */
    private String relation;

    /**
     * 联系方式
     */
    private String phone;

    /**
     * 登录用户名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 登录密码
     */
    private String password;

    /**
     * @return parent_id
     */
    public Integer getParentId() {
        return parentId;
    }

    /**
     * @param parentId
     */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    /**
     * 获取家长姓名
     *
     * @return parent_name - 家长姓名
     */
    public String getParentName() {
        return parentName;
    }

    /**
     * 设置家长姓名
     *
     * @param parentName 家长姓名
     */
    public void setParentName(String parentName) {
        this.parentName = parentName;
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
     * 获取关系
     *
     * @return relation - 关系
     */
    public String getRelation() {
        return relation;
    }

    /**
     * 设置关系
     *
     * @param relation 关系
     */
    public void setRelation(String relation) {
        this.relation = relation;
    }

    /**
     * 获取联系方式
     *
     * @return phone - 联系方式
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置联系方式
     *
     * @param phone 联系方式
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取登录用户名
     *
     * @return user_name - 登录用户名
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置登录用户名
     *
     * @param userName 登录用户名
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取登录密码
     *
     * @return password - 登录密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置登录密码
     *
     * @param password 登录密码
     */
    public void setPassword(String password) {
        this.password = password;
    }
}