package com.psm.service.impl;

import com.psm.dto.SkillInfo;
import com.psm.dto.SkillScore;
import com.psm.mapper.SkillInfoMapper;
import com.psm.mapper.SkillScoreMapper;
import com.psm.service.ISkillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/27 20:18
 **/
@Service
public class SkillServiceImpl implements ISkillService {

    @Autowired
    private SkillInfoMapper skillInfoMapper;
    @Autowired
    private SkillScoreMapper skillScoreMapper;

    @Override
    public List<SkillInfo> selectAll() {
        return skillInfoMapper.selectAllInfo();
    }

    @Override
    public SkillInfo selectById(Integer skillId) {
        return skillInfoMapper.selectByPrimaryKey(skillId);
    }

    @Override
    public int insert(SkillInfo skillInfo) {
        return skillInfoMapper.insert(skillInfo);
    }

    @Override
    public int update(SkillInfo skillInfo) {
        return skillInfoMapper.updateByPrimaryKey(skillInfo);
    }

    @Override
    public List<SkillScore> selectScoreByClassId(Integer classId) {
        return skillScoreMapper.selectScoreByClassId(classId);
    }

    @Override
    public int insertSkillScore(SkillScore skillScore) {
        return skillScoreMapper.insert(skillScore);
    }

    @Override
    public int deleteSkillScore(Integer id) {
        return skillScoreMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<SkillScore> selectScoreByCondition(Integer classId, Long stuNumber, Integer skillId) {
        return skillScoreMapper.selectScoreByCondition(classId,stuNumber,skillId);
    }

    @Override
    public List<SkillScore> selectByStudentId(Integer stuId) {
        return skillScoreMapper.selectByStudentId(stuId);
    }
}
