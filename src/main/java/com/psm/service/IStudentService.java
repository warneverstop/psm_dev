package com.psm.service;

import com.psm.dto.StudentInfo;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/26 13:03
 **/
public interface IStudentService {
    List<StudentInfo> selectAll();

    StudentInfo selectByStuId(Integer stuId);

    int insert(StudentInfo studentInfo);

    int update(StudentInfo studentInfo);

    int delete(Integer stuId);

    /**
     * 根据班级id查找在本班的学生
     * @param classId
     * @return
     */
    List<StudentInfo> selectByClassId(Integer classId);

    /**
     * 根据id查找学生所有信息
     * @param studentId
     * @return
     */
    StudentInfo selectAllByStuId(Integer studentId);

    /**
     * 根据学号查找学生信息
     * @param stuNumber
     * @return
     */
    StudentInfo selectByStuNumber(Long stuNumber);

    /**
     * 根据宿舍号，查找该宿舍的所有学生
     * @param dromId
     * @return
     */
    List<StudentInfo> selectByDromId(Integer dromId);

    /**
     * 查询班委信息
     * @return
     */
    List<StudentInfo> selectInPostion();

    boolean addPicture(String s, int stuId);
}
