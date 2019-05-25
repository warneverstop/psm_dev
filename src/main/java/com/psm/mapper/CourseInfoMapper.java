package com.psm.mapper;

import com.psm.dto.CourseInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface CourseInfoMapper extends Mapper<CourseInfo> {
    List<CourseInfo> selectAllInfo();
}