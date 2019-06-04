package com.psm.service.impl;

import com.psm.dto.ClassDrom;
import com.psm.dto.DromInfo;
import com.psm.mapper.ClassDromMapper;
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
    @Autowired
    private ClassDromMapper classDromMapper;

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

    @Override
    public List<DromInfo> selectByClassId(Integer classId) {
        return dromInfoMapper.selectByClassId(classId);
    }

    @Override
    public void delectByDromIdAndClassId(Integer dromId, Integer classId) {
        classDromMapper.deleteByDromIdAndClassId(dromId,classId);
    }

    @Override
    public int insertDromForclass(ClassDrom classDrom) {
        return classDromMapper.insert(classDrom);
    }
}
