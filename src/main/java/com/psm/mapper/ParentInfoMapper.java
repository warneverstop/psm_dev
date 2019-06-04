package com.psm.mapper;

import com.psm.dto.ParentInfo;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ParentInfoMapper extends Mapper<ParentInfo> {
    List<ParentInfo> selectByStuId(Integer studentId);

    ParentInfo selectFroLogin(@Param("userName") String userName,@Param("password") String password);
}