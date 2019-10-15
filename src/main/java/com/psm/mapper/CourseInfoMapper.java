package com.psm.mapper;

import com.psm.dto.CourseInfo;
import com.psm.dto.ScoreInfo;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface CourseInfoMapper extends Mapper<CourseInfo> {
    List<CourseInfo> selectAllInfo();

    CourseInfo selectByName(String courseName);

}