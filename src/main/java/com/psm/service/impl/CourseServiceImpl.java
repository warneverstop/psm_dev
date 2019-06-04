package com.psm.service.impl;

import com.psm.dto.CourseInfo;
import com.psm.mapper.CourseInfoMapper;
import com.psm.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/25 10:58
 **/
@Service
public class CourseServiceImpl implements ICourseService {

    @Autowired
    private CourseInfoMapper courseInfoMapper;

    @Override
    public List<CourseInfo> selectAllInfo() {
        return courseInfoMapper.selectAllInfo();
    }

    @Override
    public CourseInfo selectById(Integer courseId) {
        return courseInfoMapper.selectByPrimaryKey(courseId);
    }

    @Override
    public int insert(CourseInfo courseInfo) {
        return courseInfoMapper.insert(courseInfo);
    }

    @Override
    public int update(CourseInfo courseInfo) {
        return courseInfoMapper.updateByPrimaryKey(courseInfo);
    }

    @Override
    public CourseInfo selectByName(String courseName) {
        return courseInfoMapper.selectByName(courseName);
    }
}
