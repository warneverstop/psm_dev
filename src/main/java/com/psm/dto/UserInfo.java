package com.psm.dto;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.*;

@Table(name = "user_info")
public class UserInfo {
    @Id
    @Column(name = "user_id")
    @GeneratedValue(generator = "JDBC")
    private Integer userId;

    @Column(name = "user_name")
    private String userName;

    private String phone;

    private String genter;

    private String address;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birthday;

    @Column(name = "add_time")
    private Date addTime;

    @Column(name = "add_user")
    private String addUser;

    private String state;

    private String remarks;

    private String password;

    @Column(name = "role_id")
    private Integer roleId;

    private String email;

    /**
     * 头像图片地址
     */
    @Column(name = "img_url")
    private String imgUrl;

    @Transient
    private String roleName;
    @Transient
    List<PowerInfo> powerInfoList = new ArrayList<>();
    @Transient
    List<String> powerNames = new ArrayList<>();

    public List<String> getPowerNames() {
        return powerNames;
    }

    public void setPowerNames(List<String> powerNames) {
        this.powerNames = powerNames;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public List<PowerInfo> getPowerInfoList() {
        return powerInfoList;
    }

    public void setPowerInfoList(List<PowerInfo> powerInfoList) {
        this.powerInfoList = powerInfoList;
    }

    /**
     * @return user_id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * @param userId
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * @return user_name
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return genter
     */
    public String getGenter() {
        return genter;
    }

    /**
     * @param genter
     */
    public void setGenter(String genter) {
        this.genter = genter;
    }

    /**
     * @return address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * @return add_time
     */
    public Date getAddTime() {
        return addTime;
    }

    /**
     * @param addTime
     */
    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    /**
     * @return add_user
     */
    public String getAddUser() {
        return addUser;
    }

    /**
     * @param addUser
     */
    public void setAddUser(String addUser) {
        this.addUser = addUser;
    }

    /**
     * @return state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * @return remarks
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * @param remarks
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    /**
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return role_id
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * @param roleId
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    /**
     * 获取头像图片地址
     *
     * @return img_url - 头像图片地址
     */
    public String getImgUrl() {
        return imgUrl;
    }

    /**
     * 设置头像图片地址
     *
     * @param imgUrl 头像图片地址
     */
    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
}