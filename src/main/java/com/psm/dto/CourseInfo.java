package com.psm.dto;

import javax.persistence.*;

@Table(name = "course_info")
public class CourseInfo {
    /**
     * 课程id
     */
    @Id
    @Column(name = "course_id")
    @GeneratedValue(generator = "JDBC")
    private Integer courseId;

    /**
     * 课程名称
     */
    @Column(name = "course_name")
    private String courseName;

    /**
     * 属性
     */
    private String attribute;

    /**
     * 学分
     */
    private Integer credit;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 删除状态，默认1，删除0
     */
    private Integer del;

    @Transient
    private Integer passingNumber;
    @Transient
    private Integer noPassingNumber;

    public Integer getPassingNumber() {
        return passingNumber;
    }

    public void setPassingNumber(Integer passingNumber) {
        this.passingNumber = passingNumber;
    }

    public Integer getNoPassingNumber() {
        return noPassingNumber;
    }

    public void setNoPassingNumber(Integer noPassingNumber) {
        this.noPassingNumber = noPassingNumber;
    }

    /**
     * 获取课程id
     *
     * @return course_id - 课程id
     */
    public Integer getCourseId() {
        return courseId;
    }

    /**
     * 设置课程id
     *
     * @param courseId 课程id
     */
    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    /**
     * 获取课程名称
     *
     * @return course_name - 课程名称
     */
    public String getCourseName() {
        return courseName;
    }

    /**
     * 设置课程名称
     *
     * @param courseName 课程名称
     */
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    /**
     * 获取属性
     *
     * @return attribute - 属性
     */
    public String getAttribute() {
        return attribute;
    }

    /**
     * 设置属性
     *
     * @param attribute 属性
     */
    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    /**
     * 获取学分
     *
     * @return credit - 学分
     */
    public Integer getCredit() {
        return credit;
    }

    /**
     * 设置学分
     *
     * @param credit 学分
     */
    public void setCredit(Integer credit) {
        this.credit = credit;
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
     * 获取删除状态，默认1，删除0
     *
     * @return del - 删除状态，默认1，删除0
     */
    public Integer getDel() {
        return del;
    }

    /**
     * 设置删除状态，默认1，删除0
     *
     * @param del 删除状态，默认1，删除0
     */
    public void setDel(Integer del) {
        this.del = del;
    }
}