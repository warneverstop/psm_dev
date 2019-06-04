package com.psm.service.impl;

import com.psm.dto.ActionInfo;
import com.psm.mapper.ActionInfoMapper;
import com.psm.service.IActionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/30 10:11
 **/
@Service
public class ActionServiceImpl implements IActionService {
    @Autowired
    private ActionInfoMapper actionInfoMapper;

    @Override
    public List<ActionInfo> selectAll() {
        return actionInfoMapper.selectAllInfo();
    }

    @Override
    public ActionInfo selectById(Integer actionId) {
        return actionInfoMapper.selectAllById(actionId);
    }

    @Override
    public int insert(ActionInfo actionInfo) {
        return actionInfoMapper.insert(actionInfo);
    }

    @Override
    public int update(ActionInfo actionInfo) {
        return actionInfoMapper.updateByPrimaryKey(actionInfo);
    }

    @Override
    public int deleteById(Integer actionId) {
        return actionInfoMapper.deleteByPrimaryKey(actionId);
    }

    @Override
    public List<ActionInfo> selectByStudentId(Integer stuId) {
        return actionInfoMapper.selectByStudentId(stuId);
    }

    @Override
    public List<ActionInfo> selectAllByClassId(Integer classId) {
        return actionInfoMapper.selectByClassId(classId);
    }

    @Override
    public List<ActionInfo> selectByStudentIdForParent(Integer stuId) {
        return actionInfoMapper.selectByStudentIdForParent(stuId);
    }
}
