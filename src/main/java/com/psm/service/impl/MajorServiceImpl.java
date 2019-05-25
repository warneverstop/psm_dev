package com.psm.service.impl;

import com.psm.dto.MajorInfo;
import com.psm.mapper.MajorInfoMapper;
import com.psm.service.IMajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/24 19:23
 **/
@Service
public class MajorServiceImpl implements IMajorService {

    @Autowired
    private MajorInfoMapper majorInfoMapper;

    @Override
    public List<MajorInfo> selectAll() {
        return majorInfoMapper.selectAllInfo();
    }

    @Override
    public MajorInfo selectById(Integer majorId) {
        return majorInfoMapper.selectByPrimaryKey(majorId);
    }

    @Override
    public int insertMajor(MajorInfo majorInfo) {
        return majorInfoMapper.insert(majorInfo);
    }

    @Override
    public int updateMajor(MajorInfo majorInfo) {
        return majorInfoMapper.updateByPrimaryKey(majorInfo);
    }
}
