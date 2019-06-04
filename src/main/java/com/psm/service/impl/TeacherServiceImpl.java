package com.psm.service.impl;

import com.psm.dto.TeacherInfo;
import com.psm.mapper.TeacherInfoMapper;
import com.psm.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/24 19:33
 **/
@Service
public class TeacherServiceImpl implements ITeacherService {

    @Autowired
    private TeacherInfoMapper teacherInfoMapper;

    @Override
    public List<TeacherInfo> selectAll() {
        return teacherInfoMapper.selectAllInfo();
    }

    @Override
    public TeacherInfo selectById(Integer teacherId) {
        return teacherInfoMapper.selectByPrimaryKey(teacherId);
    }

    @Override
    public int insertTeacher(TeacherInfo teacherInfo) {
        return teacherInfoMapper.insert(teacherInfo);
    }

    @Override
    public int updateTeacher(TeacherInfo teacherInfo) {
        return teacherInfoMapper.updateByPrimaryKey(teacherInfo);
    }

    @Override
    public TeacherInfo selectByTeacherNumber(Integer teacherNumber) {
        return teacherInfoMapper.selectByTeacherNumber(teacherNumber);
    }
}
