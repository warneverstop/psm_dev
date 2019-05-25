package com.psm.dto;

import javax.persistence.*;

@Table(name = "teacher_info")
public class TeacherInfo {
    /**
     * 教师id
     */
    @Id
    @Column(name = "teacher_id")
    @GeneratedValue(generator = "JDBC")
    private Integer teacherId;

    /**
     * 教师编号
     */
    @Column(name = "teacher_number")
    private String teacherNumber;

    /**
     * 教师姓名
     */
    @Column(name = "teacher_name")
    private String teacherName;

    /**
     * 性别（M男W女）
     */
    private String genter;

    /**
     * 职务
     */
    private String job;

    /**
     * 政治面貌
     */
    private String background;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 联系方式
     */
    private String phone;

    /**
     * 办公室地址
     */
    @Column(name = "office_address")
    private String officeAddress;

    /**
     * 住址
     */
    private String address;

    /**
     * 个人简介
     */
    @Column(name = "personal_profile")
    private String personalProfile;

    /**
     * 学科
     */
    private String subject;

    /**
     * 头像地址
     */
    @Column(name = "img_url")
    private String imgUrl;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 删除标志，默认1，删除0
     */
    private Integer del;

    /**
     * 获取教师id
     *
     * @return teacher_id - 教师id
     */
    public Integer getTeacherId() {
        return teacherId;
    }

    /**
     * 设置教师id
     *
     * @param teacherId 教师id
     */
    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    /**
     * 获取教师编号
     *
     * @return teacher_number - 教师编号
     */
    public String getTeacherNumber() {
        return teacherNumber;
    }

    /**
     * 设置教师编号
     *
     * @param teacherNumber 教师编号
     */
    public void setTeacherNumber(String teacherNumber) {
        this.teacherNumber = teacherNumber;
    }

    /**
     * 获取教师姓名
     *
     * @return teacher_name - 教师姓名
     */
    public String getTeacherName() {
        return teacherName;
    }

    /**
     * 设置教师姓名
     *
     * @param teacherName 教师姓名
     */
    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    /**
     * 获取性别（M男W女）
     *
     * @return genter - 性别（M男W女）
     */
    public String getGenter() {
        return genter;
    }

    /**
     * 设置性别（M男W女）
     *
     * @param genter 性别（M男W女）
     */
    public void setGenter(String genter) {
        this.genter = genter;
    }

    /**
     * 获取职务
     *
     * @return job - 职务
     */
    public String getJob() {
        return job;
    }

    /**
     * 设置职务
     *
     * @param job 职务
     */
    public void setJob(String job) {
        this.job = job;
    }

    /**
     * 获取政治面貌
     *
     * @return background - 政治面貌
     */
    public String getBackground() {
        return background;
    }

    /**
     * 设置政治面貌
     *
     * @param background 政治面貌
     */
    public void setBackground(String background) {
        this.background = background;
    }

    /**
     * 获取邮箱
     *
     * @return email - 邮箱
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置邮箱
     *
     * @param email 邮箱
     */
    public void setEmail(String email) {
        this.email = email;
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
     * 获取办公室地址
     *
     * @return office_address - 办公室地址
     */
    public String getOfficeAddress() {
        return officeAddress;
    }

    /**
     * 设置办公室地址
     *
     * @param officeAddress 办公室地址
     */
    public void setOfficeAddress(String officeAddress) {
        this.officeAddress = officeAddress;
    }

    /**
     * 获取住址
     *
     * @return address - 住址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置住址
     *
     * @param address 住址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取个人简介
     *
     * @return personal_profile - 个人简介
     */
    public String getPersonalProfile() {
        return personalProfile;
    }

    /**
     * 设置个人简介
     *
     * @param personalProfile 个人简介
     */
    public void setPersonalProfile(String personalProfile) {
        this.personalProfile = personalProfile;
    }

    /**
     * 获取学科
     *
     * @return subject - 学科
     */
    public String getSubject() {
        return subject;
    }

    /**
     * 设置学科
     *
     * @param subject 学科
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * 获取头像地址
     *
     * @return img_url - 头像地址
     */
    public String getImgUrl() {
        return imgUrl;
    }

    /**
     * 设置头像地址
     *
     * @param imgUrl 头像地址
     */
    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    /**
     * 获取备注
     *
     * @return remarks - 备注
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * 设置备注
     *
     * @param remarks 备注
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    /**
     * 获取删除标志，默认1，删除0
     *
     * @return del - 删除标志，默认1，删除0
     */
    public Integer getDel() {
        return del;
    }

    /**
     * 设置删除标志，默认1，删除0
     *
     * @param del 删除标志，默认1，删除0
     */
    public void setDel(Integer del) {
        this.del = del;
    }
}