package com.psm.mapper;

import com.psm.dto.SkillInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SkillInfoMapper extends Mapper<SkillInfo> {

    List<SkillInfo> selectAllInfo();
}