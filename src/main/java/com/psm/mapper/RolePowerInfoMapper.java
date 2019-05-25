package com.psm.mapper;

import com.psm.dto.RolePowerInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface RolePowerInfoMapper extends Mapper<RolePowerInfo> {
    List<RolePowerInfo> selectByRoleId(Integer roleId);

    void deleteByRoleId(Integer roleId);
}