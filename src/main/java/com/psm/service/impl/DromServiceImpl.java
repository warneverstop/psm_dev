package com.psm.service.impl;

import com.psm.dto.DromInfo;
import com.psm.mapper.DromInfoMapper;
import com.psm.service.IDromService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/24 18:59
 **/
@Service
public class DromServiceImpl implements IDromService {
    @Autowired
    private DromInfoMapper dromInfoMapper;

    @Override
    public List<DromInfo> selectAll() {
        return dromInfoMapper.selectAllInfo();
    }

    @Override
    public DromInfo selectById(Integer dromId) {
        return dromInfoMapper.selectByPrimaryKey(dromId);
    }

    @Override
    public int updateDrom(DromInfo dromInfo) {
        return dromInfoMapper.updateByPrimaryKey(dromInfo);
    }

    @Override
    public int insertDrom(DromInfo dromInfo) {
        return dromInfoMapper.insert(dromInfo);
    }
}
