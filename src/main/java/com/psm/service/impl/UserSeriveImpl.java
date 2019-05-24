package com.psm.service.impl;

import com.psm.dto.PowerInfo;
import com.psm.dto.UserInfo;
import com.psm.mapper.PowerInfoMapper;
import com.psm.mapper.UserInfoMapper;
import com.psm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/23 9:39
 **/
@Service
public class UserSeriveImpl implements IUserService {
    @Autowired
    private UserInfoMapper userInfoMapper;
    @Autowired
    private PowerInfoMapper powerInfoMapper;

    @Override
    public UserInfo selectOne(UserInfo userInfo) {
        return userInfoMapper.selectOne(userInfo);
    }

    @Override
    public UserInfo selctForLogin(UserInfo userInfo) {
        UserInfo user = null;
        user = userInfoMapper.selectForLogin(userInfo);
        if(user != null){
            List<PowerInfo> powerInfoList = powerInfoMapper.selectByRoleId(user.getRoleId());
            user.setPowerInfoList(powerInfoList);
        }
        return user;
    }

    @Override
    public int updateUser(UserInfo user) {
        return userInfoMapper.updateByPrimaryKey(user);
    }

    @Override
    public int insertUser(UserInfo userInfo) {
        return userInfoMapper.insert(userInfo);
    }

    @Override
    public UserInfo selectByUserId(Integer userId) {
        return userInfoMapper.selectByPrimaryKey(userId);
    }

    @Override
    public int deleteById(Integer userId) {
        return userInfoMapper.deleteByPrimaryKey(userId);
    }

    @Override
    public List<UserInfo> selectAll() {
        return userInfoMapper.selectAllInfo();
    }
}
