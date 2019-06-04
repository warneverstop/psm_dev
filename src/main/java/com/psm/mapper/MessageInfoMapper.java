package com.psm.mapper;

import com.psm.dto.MessageInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface MessageInfoMapper extends Mapper<MessageInfo> {
    List<MessageInfo> selectByClassId(Integer classId);

    List<MessageInfo> selectByUserName(String userName);
}