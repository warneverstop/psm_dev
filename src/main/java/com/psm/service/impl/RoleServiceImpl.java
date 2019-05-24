package com.psm.service.impl;

import com.psm.dto.RoleInfo;
import com.psm.mapper.RoleInfoMapper;
import com.psm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/23 20:36
 **/
@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private RoleInfoMapper roleInfoMapper;

    @Override
    public List<RoleInfo> selectAll() {
        return roleInfoMapper.selectAll();
    }

    @Override
    public int insertRole(RoleInfo roleInfo) {
        return roleInfoMapper.insert(roleInfo);
    }

    @Override
    public RoleInfo selectById(Integer roleId) {
        return roleInfoMapper.selectByPrimaryKey(roleId);
    }

    @Override
    public int updateRole(RoleInfo role) {
        return roleInfoMapper.updateByPrimaryKey(role);
    }

    @Override
    public int deleteById(Integer roleId) {
        return roleInfoMapper.deleteByPrimaryKey(roleId);
    }
}
