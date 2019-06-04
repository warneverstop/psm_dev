package com.psm.service.impl;

import com.psm.dto.ExerciseInfo;
import com.psm.mapper.ExerciseInfoMapper;
import com.psm.service.IExerciseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/31 10:19
 **/
@Service
public class ExerciseServiceImpl implements IExerciseService {
    @Autowired
    private ExerciseInfoMapper exerciseInfoMapper;

    @Override
    public List<ExerciseInfo> selectByClassId(Integer classId) {
        return exerciseInfoMapper.selectByCalssId(classId);
    }

    @Override
    public int insert(ExerciseInfo exerciseInfo) {
        return exerciseInfoMapper.insert(exerciseInfo);
    }

    @Override
    public int delete(Integer exerciseId) {
        return exerciseInfoMapper.deleteByPrimaryKey(exerciseId);
    }

    @Override
    public List<ExerciseInfo> selectByClassIdForParent(Integer classId) {
        return exerciseInfoMapper.selectByClassIdForParent(classId);
    }
}
