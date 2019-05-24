package com.psm.mapper;

import com.psm.dto.UserInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserInfoMapper extends Mapper<UserInfo> {
    UserInfo selectForLogin(UserInfo userInfo);

    List<UserInfo> selectAllInfo();
}