package com.psm.dto;

import javax.persistence.*;

@Table(name = "phone_info")
public class PhoneInfo {
    @Id
    @Column(name = "phone_id")
    @GeneratedValue(generator = "JDBC")
    private Integer phoneId;

    /**
     * 电话
     */
    private String phone;

    /**
     * 电话对象
     */
    @Column(name = "phone_object")
    private String phoneObject;

    /**
     * @return phone_id
     */
    public Integer getPhoneId() {
        return phoneId;
    }

    /**
     * @param phoneId
     */
    public void setPhoneId(Integer phoneId) {
        this.phoneId = phoneId;
    }

    /**
     * 获取电话
     *
     * @return phone - 电话
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置电话
     *
     * @param phone 电话
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取电话对象
     *
     * @return phone_object - 电话对象
     */
    public String getPhoneObject() {
        return phoneObject;
    }

    /**
     * 设置电话对象
     *
     * @param phoneObject 电话对象
     */
    public void setPhoneObject(String phoneObject) {
        this.phoneObject = phoneObject;
    }
}