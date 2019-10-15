package com.psm.service.impl;

import com.psm.dto.ScoreInfo;
import com.psm.mapper.CourseInfoMapper;
import com.psm.mapper.ScoreInfoMapper;
import com.psm.service.IScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/28 19:14
 **/
@Service
public class ScoreServiceImpl implements IScoreService {

    @Autowired
    private ScoreInfoMapper scoreInfoMapper;
    @Autowired
    private CourseInfoMapper courseInfoMapper;


    @Override
    public List<ScoreInfo> selectByClassId(Integer classId) {
        return scoreInfoMapper.selectByClassId(classId);
    }

    @Override
    public List<ScoreInfo> selectByCondition(Integer classId, String courseName, String attribute, String schoolYear, Integer grade, Long stuNumber) {
        return scoreInfoMapper.selectByCondition(classId,courseName,attribute,schoolYear,grade,stuNumber);
    }

    @Override
    public int insert(ScoreInfo scoreInfo) {
        return scoreInfoMapper.insert(scoreInfo);
    }

    @Override
    public int update(ScoreInfo scoreInfo) {
        ScoreInfo score = scoreInfoMapper.selectByPrimaryKey(scoreInfo.getScoreId());
        score.setGrade(scoreInfo.getGrade());
        score.setRemarks(scoreInfo.getRemarks());
        return scoreInfoMapper.updateByPrimaryKey(score);
    }

    @Override
    public ScoreInfo selectById(Integer scoreId) {
        return scoreInfoMapper.selectByScoreId(scoreId);
    }

    @Override
    public int deleteById(Integer scoreId) {
        return scoreInfoMapper.deleteByPrimaryKey(scoreId);
    }

    @Override
    public List<ScoreInfo> selectByStudentId(Integer stuId) {
        return scoreInfoMapper.selectByStudentId(stuId);
    }

    @Override
    public List<ScoreInfo> selectPeopleAnalyse(Integer classId ,String schoolYear) {
        return scoreInfoMapper.selectPeopleAnalyse(classId,schoolYear);
    }
}
