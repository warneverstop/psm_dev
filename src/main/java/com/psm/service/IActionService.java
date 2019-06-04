package com.psm.service;

import com.psm.dto.ActionInfo;

import javax.swing.*;
import java.util.List;

/**
 * @author su
 * @creat: 2019/5/30 10:08
 **/
public interface IActionService {
    List<ActionInfo> selectAll();

    ActionInfo selectById(Integer actionId);

    int insert(ActionInfo actionInfo);

    int update(ActionInfo actionInfo);

    int deleteById(Integer actionId);

    List<ActionInfo> selectByStudentId(Integer stuId);

    List<ActionInfo> selectAllByClassId(Integer classId);

    List<ActionInfo> selectByStudentIdForParent(Integer stuId);
}
