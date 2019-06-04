package com.psm.dto;

import javax.persistence.*;

@Table(name = "class_drom")
public class ClassDrom {
    @Id
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    /**
     * 班级id
     */
    @Column(name = "class_id")
    private Integer classId;

    /**
     * 宿舍id
     */
    @Column(name = "drom_id")
    private Integer dromId;

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
}