package com.psm.service.impl;

import com.psm.dto.PhoneInfo;
import com.psm.mapper.PhoneInfoMapper;
import com.psm.service.IPhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/30 10:48
 **/
@Service
public class PhoneService implements IPhoneService {
    @Autowired
    private PhoneInfoMapper phoneInfoMapper;
    @Override
    public List<PhoneInfo> selectAll() {
        return phoneInfoMapper.selectAll();
    }

    @Override
    public PhoneInfo selectById(Integer phoneId) {
        return phoneInfoMapper.selectByPrimaryKey(phoneId);
    }

    @Override
    public int insert(PhoneInfo phoneInfo) {
        return phoneInfoMapper.insert(phoneInfo);
    }

    @Override
    public int update(PhoneInfo phoneInfo) {
        return phoneInfoMapper.updateByPrimaryKey(phoneInfo);
    }

    @Override
    public int delete(Integer phoneId) {
        return phoneInfoMapper.deleteByPrimaryKey(phoneId);
    }
}
