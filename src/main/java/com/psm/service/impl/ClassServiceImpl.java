package com.psm.service.impl;

import com.psm.dto.ClassInfo;
import com.psm.mapper.ClassInfoMapper;
import com.psm.service.IClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/24 19:47
 **/
@Service
public class ClassServiceImpl implements IClassService {

    @Autowired
    private ClassInfoMapper classInfoMapper;

    @Override
    public List<ClassInfo> selectAll() {
        return classInfoMapper.selectAllInfo();
    }

    @Override
    public ClassInfo selectById(Integer classId) {
        return classInfoMapper.selectByPrimaryKey(classId);
    }

    @Override
    public int insert(ClassInfo classInfo) {
        return classInfoMapper.insert(classInfo);
    }

    @Override
    public int update(ClassInfo classInfo) {
        return classInfoMapper.updateByPrimaryKey(classInfo);
    }
}
