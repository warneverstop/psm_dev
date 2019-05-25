package com.psm.mapper;

import com.psm.dto.ClassInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ClassInfoMapper extends Mapper<ClassInfo> {
    List<ClassInfo> selectAllInfo();
}