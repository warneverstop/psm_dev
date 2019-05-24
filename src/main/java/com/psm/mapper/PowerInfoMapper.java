package com.psm.mapper;

import com.psm.dto.PowerInfo;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface PowerInfoMapper extends Mapper<PowerInfo> {
    List<PowerInfo> selectByRoleId(Integer roleId);
}