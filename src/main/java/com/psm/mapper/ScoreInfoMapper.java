package com.psm.mapper;

import com.psm.dto.ScoreInfo;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ScoreInfoMapper extends Mapper<ScoreInfo> {
    List<ScoreInfo> selectByClassId(Integer classId);

    List<ScoreInfo> selectByCondition(@Param("classId") Integer classId,
                                      @Param("courseName") String courseName,
                                      @Param("attribute")String attribute,
                                      @Param("schoolYear")String schoolYear,
                                      @Param("grade")Integer grade,
                                      @Param("stuNumber")Long stuNumber);

    ScoreInfo selectByScoreId(Integer scoreId);

    List<ScoreInfo> selectByStudentId(Integer stuId);

    List<ScoreInfo> selectPeopleAnalyse(@Param("classId") Integer classId,@Param("schoolYear") String schoolYear);
}