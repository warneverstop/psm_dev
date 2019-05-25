package com.psm.dto;

import javax.persistence.*;

@Table(name = "class_info")
public class ClassInfo {
    @Id
    @Column(name = "class_id")
    @GeneratedValue(generator = "JDBC")
    private Integer classId;

    /**
     * 班级
     */
    @Column(name = "class_number")
    private String classNumber;

    /**
     * 总人数
     */
    @Column(name = "sum_people")
    private Integer sumPeople;

    /**
     * 专业Id
     */
    @Column(name = "major_id")
    private Integer majorId;

    /**
     * 学院
     */
    private String college;

    /**
     * 班主任Id
     */
    @Column(name = "teacher_id")
    private Integer teacherId;

    /**
     * 班长id
     */
    @Column(name = "student_id")
    private Integer studentId;

    /**
     * 简介
     */
    private String profile;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 标记状态，默认1，删除0
     */
    private Integer del;

    @Transient
    private String majorName;
    @Transient
    private String teacherName;
    @Transient
    private String studentName;

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    /**
     * @return class_id
     */
    public Integer getClassId() {
        return classId;
    }

    /**
     * @param classId
     */
    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    /**
     * 获取班级
     *
     * @return class_number - 班级
     */
    public String getClassNumber() {
        return classNumber;
    }

    /**
     * 设置班级
     *
     * @param classNumber 班级
     */
    public void setClassNumber(String classNumber) {
        this.classNumber = classNumber;
    }

    /**
     * 获取总人数
     *
     * @return sum_people - 总人数
     */
    public Integer getSumPeople() {
        return sumPeople;
    }

    /**
     * 设置总人数
     *
     * @param sumPeople 总人数
     */
    public void setSumPeople(Integer sumPeople) {
        this.sumPeople = sumPeople;
    }

    /**
     * 获取专业Id
     *
     * @return major_id - 专业Id
     */
    public Integer getMajorId() {
        return majorId;
    }

    /**
     * 设置专业Id
     *
     * @param majorId 专业Id
     */
    public void setMajorId(Integer majorId) {
        this.majorId = majorId;
    }

    /**
     * 获取学院
     *
     * @return college - 学院
     */
    public String getCollege() {
        return college;
    }

    /**
     * 设置学院
     *
     * @param college 学院
     */
    public void setCollege(String college) {
        this.college = college;
    }

    /**
     * 获取班主任Id
     *
     * @return teacher_id - 班主任Id
     */
    public Integer getTeacherId() {
        return teacherId;
    }

    /**
     * 设置班主任Id
     *
     * @param teacherId 班主任Id
     */
    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    /**
     * 获取班长id
     *
     * @return student_id - 班长id
     */
    public Integer getStudentId() {
        return studentId;
    }

    /**
     * 设置班长id
     *
     * @param studentId 班长id
     */
    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    /**
     * 获取简介
     *
     * @return profile - 简介
     */
    public String getProfile() {
        return profile;
    }

    /**
     * 设置简介
     *
     * @param profile 简介
     */
    public void setProfile(String profile) {
        this.profile = profile;
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
     * 获取标记状态，默认1，删除0
     *
     * @return del - 标记状态，默认1，删除0
     */
    public Integer getDel() {
        return del;
    }

    /**
     * 设置标记状态，默认1，删除0
     *
     * @param del 标记状态，默认1，删除0
     */
    public void setDel(Integer del) {
        this.del = del;
    }
}