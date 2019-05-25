package com.psm.service;

import com.psm.dto.TeacherInfo;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/24 19:31
 **/
public interface ITeacherService {
    List<TeacherInfo> selectAll();

    TeacherInfo selectById(Integer teacherId);

    int insertTeacher(TeacherInfo teacherInfo);

    int updateTeacher(TeacherInfo teacherInfo);
}
