package com.psm.service.impl;

import com.psm.dto.StudentInfo;
import com.psm.mapper.StudentInfoMapper;
import com.psm.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/26 13:05
 **/
@Service
public class StudentServiceImpl implements IStudentService {

    @Autowired
    private StudentInfoMapper studentInfoMapper;

    @Override
    public List<StudentInfo> selectAll() {
        return studentInfoMapper.selectAllInfo();
    }

    @Override
    public StudentInfo selectByStuId(Integer stuId) {
        return studentInfoMapper.selectByPrimaryKey(stuId);
    }

    @Override
    public int insert(StudentInfo studentInfo) {
        return studentInfoMapper.insert(studentInfo);
    }

    @Override
    public int update(StudentInfo studentInfo) {
        return studentInfoMapper.updateByPrimaryKey(studentInfo);
    }

    @Override
    public int delete(Integer stuId) {
        return studentInfoMapper.deleteByPrimaryKey(stuId);
    }

    @Override
    public List<StudentInfo> selectByClassId(Integer classId) {
        return studentInfoMapper.selectByClassId(classId);
    }

    @Override
    public StudentInfo selectAllByStuId(Integer studentId) {
        return studentInfoMapper.selectAllByStuId(studentId);
    }

    @Override
    public StudentInfo selectByStuNumber(Long stuNumber) {
        return studentInfoMapper.selectByStuNumber(stuNumber);
    }

    @Override
    public List<StudentInfo> selectByDromId(Integer dromId) {
        return studentInfoMapper.selectByDromId(dromId);
    }

    @Override
    public List<StudentInfo> selectInPostion() {
        return studentInfoMapper.selectInPostion();
    }

    @Override
    public boolean addPicture(String s, int stuId) {
        try {
            StudentInfo studentInfo = studentInfoMapper.selectByPrimaryKey(stuId);
            studentInfo.setImgUrl(s);
            studentInfoMapper.updateByPrimaryKey(studentInfo);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
