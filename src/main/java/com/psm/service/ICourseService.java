package com.psm.service;

import com.psm.dto.CourseInfo;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/25 10:56
 **/
public interface ICourseService {
    List<CourseInfo> selectAllInfo();

    CourseInfo selectById(Integer courseId);

    int insert(CourseInfo courseInfo);

    int update(CourseInfo courseInfo);

    CourseInfo selectByName(String courseName);
}
