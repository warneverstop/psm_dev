package com.psm.service;

import com.psm.dto.SkillInfo;
import com.psm.dto.SkillScore;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/26 20:57
 **/
public interface ISkillService {
    List<SkillInfo> selectAll();

    SkillInfo selectById(Integer skillId);

    int insert(SkillInfo skillInfo);

    int update(SkillInfo skillInfo);

    /**
     * 根据班级号查找班级内的所有技能等级成绩
     * @param classId
     * @return
     */
    List<SkillScore> selectScoreByClassId(Integer classId);

    /**
     * 插入成绩数据
     * @param skillScore
     */
    int insertSkillScore(SkillScore skillScore);

    int deleteSkillScore(Integer id);

    /**
     * 查询本班符合条件的学生的成绩
     * @param classId
     * @param stuNumber
     * @param skillId
     * @return
     */
    List<SkillScore> selectScoreByCondition(Integer classId, Long stuNumber, Integer skillId);

    List<SkillScore> selectByStudentId(Integer stuId);
}
