package com.psm.mapper;

import com.psm.dto.DromInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DromInfoMapper extends Mapper<DromInfo> {
    List<DromInfo> selectAllInfo();
}