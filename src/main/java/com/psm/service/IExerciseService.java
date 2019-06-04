package com.psm.service;

import com.psm.dto.ExerciseInfo;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/31 10:15
 **/
public interface IExerciseService {
    List<ExerciseInfo> selectByClassId(Integer classId);

    int insert(ExerciseInfo exerciseInfo);

    int delete(Integer exerciseId);

    /**
     * 查找前四条
     * @param classId
     * @return
     */
    List<ExerciseInfo> selectByClassIdForParent(Integer classId);
}
