package com.psm.service;

import com.psm.dto.ClassInfo;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/24 19:45
 **/
public interface IClassService {
    List<ClassInfo> selectAll();

    ClassInfo selectById(Integer classId);

    int insert(ClassInfo classInfo);

    int update(ClassInfo classInfo);

}
