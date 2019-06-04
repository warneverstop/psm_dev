package com.psm.mapper;

import com.psm.dto.ActionInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ActionInfoMapper extends Mapper<ActionInfo> {
    List<ActionInfo> selectAllInfo();

    ActionInfo selectAllById(Integer actionId);

    List<ActionInfo> selectByStudentId(Integer stuId);

    List<ActionInfo> selectByClassId(Integer classId);

    List<ActionInfo> selectByStudentIdForParent(Integer stuId);
}