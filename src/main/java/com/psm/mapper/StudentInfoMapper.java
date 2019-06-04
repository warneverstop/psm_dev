package com.psm.mapper;

import com.psm.dto.StudentInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface StudentInfoMapper extends Mapper<StudentInfo> {

    List<StudentInfo> selectAllInfo();

    List<StudentInfo> selectByClassId(Integer classId);

    StudentInfo selectAllByStuId(Integer studentId);

    StudentInfo selectByStuNumber(Long stuNumber);

    List<StudentInfo> selectByDromId(Integer dromId);

    List<StudentInfo> selectInPostion();
}