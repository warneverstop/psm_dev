package com.psm.dto;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import javax.persistence.*;

@Table(name = "student_info")
public class StudentInfo {
    /**
     * 主键id
     */
    @Id
    @Column(name = "stu_id")
    @GeneratedValue(generator = "JDBC")
    private Integer stuId;

    /**
     * 学号
     */
    @Column(name = "stu_number")
    private Long stuNumber;

    /**
     * 学生姓名
     */
    @Column(name = "stu_name")
    private String stuName;

    /**
     * 性别
     */
    private String genter;

    /**
     * 政治背景
     */
    private String background;

    /**
     * 出生日期
     */
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birthday;

    /**
     * 联系方式
     */
    private String phone;

    /**
     * 在校任职
     */
    private String position;

    /**
     * 现住址
     */
    @Column(name = "now_address")
    private String nowAddress;

    /**
     * 籍贯
     */
    private String address;

    /**
     * 教师评价
     */
    private String evaluate;

    /**
     * 状态
     */
    private String state;

    /**
     * 班级id
     */
    @Column(name = "class_id")
    private Integer classId;

    /**
     * 专业id
     */
    @Column(name = "major_id")
    private Integer majorId;

    /**
     * 宿舍id
     */
    @Column(name = "drom_id")
    private Integer dromId;

    /**
     * 班主任id
     */
    @Column(name = "teacher_id")
    private Integer teacherId;

    /**
     * 头像url地址
     */
    @Column(name = "img_url")
    private String imgUrl;

    /**
     * 备注
     */
    private String remarks;

    @Transient
    private String classNumber;
    @Transient
    private String majorName;
    @Transient
    private String dromName;
    @Transient
    private String teacherName;

    public String getClassNumber() {
        return classNumber;
    }

    public void setClassNumber(String classNumber) {
        this.classNumber = classNumber;
    }

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    public String getDromName() {
        return dromName;
    }

    public void setDromName(String dromName) {
        this.dromName = dromName;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    /**
     * 获取主键id
     *
     * @return stu_id - 主键id
     */
    public Integer getStuId() {
        return stuId;
    }

    /**
     * 设置主键id
     *
     * @param stuId 主键id
     */
    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    /**
     * 获取学号
     *
     * @return stu_number - 学号
     */
    public Long getStuNumber() {
        return stuNumber;
    }

    /**
     * 设置学号
     *
     * @param stuNumber 学号
     */
    public void setStuNumber(Long stuNumber) {
        this.stuNumber = stuNumber;
    }

    /**
     * 获取学生姓名
     *
     * @return stu_name - 学生姓名
     */
    public String getStuName() {
        return stuName;
    }

    /**
     * 设置学生姓名
     *
     * @param stuName 学生姓名
     */
    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    /**
     * 获取性别
     *
     * @return genter - 性别
     */
    public String getGenter() {
        return genter;
    }

    /**
     * 设置性别
     *
     * @param genter 性别
     */
    public void setGenter(String genter) {
        this.genter = genter;
    }

    /**
     * 获取政治背景
     *
     * @return background - 政治背景
     */
    public String getBackground() {
        return background;
    }

    /**
     * 设置政治背景
     *
     * @param background 政治背景
     */
    public void setBackground(String background) {
        this.background = background;
    }

    /**
     * 获取出生日期
     *
     * @return birthday - 出生日期
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * 设置出生日期
     *
     * @param birthday 出生日期
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
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
     * 获取在校任职
     *
     * @return position - 在校任职
     */
    public String getPosition() {
        return position;
    }

    /**
     * 设置在校任职
     *
     * @param position 在校任职
     */
    public void setPosition(String position) {
        this.position = position;
    }

    /**
     * 获取现住址
     *
     * @return now_address - 现住址
     */
    public String getNowAddress() {
        return nowAddress;
    }

    /**
     * 设置现住址
     *
     * @param nowAddress 现住址
     */
    public void setNowAddress(String nowAddress) {
        this.nowAddress = nowAddress;
    }

    /**
     * 获取籍贯
     *
     * @return address - 籍贯
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置籍贯
     *
     * @param address 籍贯
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取教师评价
     *
     * @return evaluate - 教师评价
     */
    public String getEvaluate() {
        return evaluate;
    }

    /**
     * 设置教师评价
     *
     * @param evaluate 教师评价
     */
    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate;
    }

    /**
     * 获取状态
     *
     * @return state - 状态
     */
    public String getState() {
        return state;
    }

    /**
     * 设置状态
     *
     * @param state 状态
     */
    public void setState(String state) {
        this.state = state;
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

    /**
     * 获取专业id
     *
     * @return major_id - 专业id
     */
    public Integer getMajorId() {
        return majorId;
    }

    /**
     * 设置专业id
     *
     * @param majorId 专业id
     */
    public void setMajorId(Integer majorId) {
        this.majorId = majorId;
    }

    /**
     * 获取宿舍id
     *
     * @return drom_id - 宿舍id
     */
    public Integer getDromId() {
        return dromId;
    }

    /**
     * 设置宿舍id
     *
     * @param dromId 宿舍id
     */
    public void setDromId(Integer dromId) {
        this.dromId = dromId;
    }

    /**
     * 获取班主任id
     *
     * @return teacher_id - 班主任id
     */
    public Integer getTeacherId() {
        return teacherId;
    }

    /**
     * 设置班主任id
     *
     * @param teacherId 班主任id
     */
    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    /**
     * 获取头像url地址
     *
     * @return img_url - 头像url地址
     */
    public String getImgUrl() {
        return imgUrl;
    }

    /**
     * 设置头像url地址
     *
     * @param imgUrl 头像url地址
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
}