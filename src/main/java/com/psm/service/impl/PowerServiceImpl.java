package com.psm.service.impl;

import com.psm.dto.PowerInfo;
import com.psm.mapper.PowerInfoMapper;
import com.psm.service.IPowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/23 10:24
 **/
@Service
public class PowerServiceImpl implements IPowerService {
    @Autowired
    private PowerInfoMapper powerInfoMapper;
    @Override
    public List<PowerInfo> selectByRoleId(Integer roleId) {
        return powerInfoMapper.selectByRoleId(roleId);
    }

    @Override
    public List<PowerInfo> selectAll() {
        return powerInfoMapper.selectAll();
    }
}
