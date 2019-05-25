package com.psm.mapper;

import com.psm.dto.MajorInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface MajorInfoMapper extends Mapper<MajorInfo> {
    List<MajorInfo> selectAllInfo();
}