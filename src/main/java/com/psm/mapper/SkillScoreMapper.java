package com.psm.mapper;

import com.psm.dto.SkillScore;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SkillScoreMapper extends Mapper<SkillScore> {
    List<SkillScore> selectScoreByClassId(Integer classId);

    List<SkillScore> selectScoreByCondition(@Param("classId") Integer classId,@Param("stuNumber") Long stuNumber,@Param("skillId") Integer skillId);

    List<SkillScore> selectByStudentId(Integer stuId);
}