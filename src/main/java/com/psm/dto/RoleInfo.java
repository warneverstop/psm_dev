package com.psm.dto;

import java.util.Date;
import javax.persistence.*;

@Table(name = "role_info")
public class RoleInfo {
    /**
     * 角色id
     */
    @Id
    @Column(name = "role_id")
    @GeneratedValue(generator = "JDBC")
    private Integer roleId;

    /**
     * 角色名
     */
    @Column(name = "role_name")
    private String roleName;

    /**
     * 角色说明
     */
    private String remark;

    /**
     * 角色状态
     */
    private String state;

    /**
     * 添加人
     */
    @Column(name = "add_user")
    private String addUser;

    /**
     * 添加时间
     */
    @Column(name = "add_time")
    private Date addTime;

    /**
     * 获取角色id
     *
     * @return role_id - 角色id
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * 设置角色id
     *
     * @param roleId 角色id
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    /**
     * 获取角色名
     *
     * @return role_name - 角色名
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * 设置角色名
     *
     * @param roleName 角色名
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    /**
     * 获取角色说明
     *
     * @return remark - 角色说明
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置角色说明
     *
     * @param remark 角色说明
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取角色状态
     *
     * @return state - 角色状态
     */
    public String getState() {
        return state;
    }

    /**
     * 设置角色状态
     *
     * @param state 角色状态
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * 获取添加人
     *
     * @return add_user - 添加人
     */
    public String getAddUser() {
        return addUser;
    }

    /**
     * 设置添加人
     *
     * @param addUser 添加人
     */
    public void setAddUser(String addUser) {
        this.addUser = addUser;
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
}