package com.psm.mapper;

import com.psm.dto.ExerciseInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ExerciseInfoMapper extends Mapper<ExerciseInfo> {
    List<ExerciseInfo> selectByCalssId(Integer classId);

    List<ExerciseInfo> selectByClassIdForParent(Integer classId);
}