package com.psm.service.impl;

import com.psm.dto.ParentInfo;
import com.psm.fo.ParentUpdatePwdForm;
import com.psm.mapper.ParentInfoMapper;
import com.psm.service.IParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/28 17:38
 **/
@Service
public class ParentServiceImpl  implements IParentService {

    @Autowired
    private ParentInfoMapper parentInfoMapper;

    @Override
    public List<ParentInfo> selectByStudentId(Integer studentId) {
        return parentInfoMapper.selectByStuId(studentId);
    }

    @Override
    public int insert(ParentInfo parentInfo) {
        return parentInfoMapper.insert(parentInfo);
    }

    @Override
    public boolean initData(Integer parentId) {
        try {
            ParentInfo parentInfo = parentInfoMapper.selectByPrimaryKey(parentId);
            parentInfo.setPassword("1234");
            parentInfoMapper.updateByPrimaryKey(parentInfo);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public ParentInfo selectForLogin(String userName, String password) {
        return parentInfoMapper.selectFroLogin(userName,password);
    }

    @Override
    public void update(ParentInfo parentInfo) {
        ParentInfo parentInfo1 = parentInfoMapper.selectByPrimaryKey(parentInfo.getParentId());
        parentInfo1.setParentName(parentInfo.getParentName());
        parentInfo1.setPhone(parentInfo.getPhone());
        parentInfo1.setRelation(parentInfo.getRelation());
        parentInfoMapper.updateByPrimaryKey(parentInfo1);
    }

    @Override
    public void updatePwd(ParentUpdatePwdForm form) {
        ParentInfo parentInfo = parentInfoMapper.selectByPrimaryKey(form.getParentId());
        parentInfo.setPassword(form.getNewPwd());
        parentInfoMapper.updateByPrimaryKey(parentInfo);
    }
}
