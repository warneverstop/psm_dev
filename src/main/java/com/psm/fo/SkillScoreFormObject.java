package com.psm.fo;

/**
 * @author: su
 * @creat: 2019/5/28 12:53
 **/
public class SkillScoreFormObject {
    private Long stuNumber;
    private Integer skillId;

    public Integer getSkillId() {
        return skillId;
    }

    public void setSkillId(Integer skillId) {
        this.skillId = skillId;
    }

    public Long getStuNumber() {
        return stuNumber;
    }

    public void setStuNumber(Long stuNumber) {
        this.stuNumber = stuNumber;
    }

    @Override
    public String toString() {
        return "SkillScoreFormObject{" +
                "stuNumber='" + stuNumber + '\'' +
                ", skillId=" + skillId +
                '}';
    }
}
