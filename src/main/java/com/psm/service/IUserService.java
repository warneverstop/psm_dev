package com.psm.service;

import com.psm.dto.UserInfo;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/23 9:38
 **/
public interface IUserService {
    UserInfo selectOne(UserInfo userInfo);

    /**
     * 登录查询
     * @param userInfo
     * @return
     */
    UserInfo selctForLogin(UserInfo userInfo);

    /**
     * 更新用户信息
     * @param user
     */
    int updateUser(UserInfo user);

    int insertUser(UserInfo userInfo);

    UserInfo selectByUserId(Integer userId);

    int deleteById(Integer userId);

    List<UserInfo> selectAll();
}
