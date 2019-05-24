package com.psm.service.impl;

import com.psm.dto.RolePowerInfo;
import com.psm.mapper.RolePowerInfoMapper;
import com.psm.service.IRolePowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/23 22:02
 **/
@Service
public class RolePowerServiceImpl implements IRolePowerService {
    @Autowired
    private RolePowerInfoMapper rolePowerInfoMapper;

    @Override
    public List<RolePowerInfo> selectAll() {
        return rolePowerInfoMapper.selectAll();
    }

    @Override
    public List<RolePowerInfo> selectByRoleId(Integer roleId) {
        return rolePowerInfoMapper.selectByRoleId(roleId);
    }
}
