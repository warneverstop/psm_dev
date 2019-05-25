package com.psm.mapper;

import com.psm.dto.TeacherInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface TeacherInfoMapper extends Mapper<TeacherInfo> {
    List<TeacherInfo> selectAllInfo();
}