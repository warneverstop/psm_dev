package com.psm.service;

import com.psm.dto.ScoreInfo;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/28 19:13
 **/
public interface IScoreService {
    List<ScoreInfo> selectByClassId(Integer classId);

    /**
     * 按条件查询班级成绩
     * @param classId
     * @param courseName
     * @param attribute
     * @param schoolYear
     * @param grade
     * @param stuNumber
     * @return
     */
    List<ScoreInfo> selectByCondition(Integer classId, String courseName, String attribute, String schoolYear, Integer grade, Long stuNumber);

    int insert(ScoreInfo scoreInfo);

    int update(ScoreInfo scoreInfo);

    ScoreInfo selectById(Integer scoreId);

    int deleteById(Integer scoreId);

    List<ScoreInfo> selectByStudentId(Integer stuId);

    List<ScoreInfo> selectPeopleAnalyse(Integer classId,String schoolYear);
}
