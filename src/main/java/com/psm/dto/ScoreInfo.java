package com.psm.dto;

import javax.persistence.*;

@Table(name = "score_info")
public class ScoreInfo {
    @Id
    @Column(name = "score_id")
    @GeneratedValue(generator = "JDBC")
    private Integer scoreId;

    /**
     * 学生id
     */
    @Column(name = "stu_id")
    private Integer stuId;

    /**
     * 课程id
     */
    @Column(name = "course_id")
    private Integer courseId;

    /**
     * 成绩
     */
    private Integer grade;

    @Column(name = "school_year")
    private String schoolYear;


    /**
     * 备注
     */
    private String remarks;

    @Transient
    private String courseName;
    @Transient
    private String attribute;
    @Transient
    private Integer credit;
    @Transient
    private Long stuNumber;
    @Transient
    private String stuName;
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

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public Long getStuNumber() {
        return stuNumber;
    }

    public void setStuNumber(Long stuNumber) {
        this.stuNumber = stuNumber;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    /**
     * @return score_id
     */
    public Integer getScoreId() {
        return scoreId;
    }

    /**
     * @param scoreId
     */
    public void setScoreId(Integer scoreId) {
        this.scoreId = scoreId;
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
     * 获取成绩
     *
     * @return grade - 成绩
     */
    public Integer getGrade() {
        return grade;
    }

    /**
     * 设置成绩
     *
     * @param grade 成绩
     */
    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    /**
     * @return school_year
     */
    public String getSchoolYear() {
        return schoolYear;
    }

    /**
     * @param schoolYear
     */
    public void setSchoolYear(String schoolYear) {
        this.schoolYear = schoolYear;
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

    @Override
    public String toString() {
        return "ScoreInfo{" +
                "scoreId=" + scoreId +
                ", stuId=" + stuId +
                ", courseId=" + courseId +
                ", grade=" + grade +
                ", schoolYear='" + schoolYear + '\'' +
                ", remarks='" + remarks + '\'' +
                ", courseName='" + courseName + '\'' +
                ", attribute='" + attribute + '\'' +
                ", credit=" + credit +
                ", stuNumber=" + stuNumber +
                ", stuName='" + stuName + '\'' +
                '}';
    }
}