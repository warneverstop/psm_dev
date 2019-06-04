package com.psm.service;

import com.psm.dto.ParentInfo;
import com.psm.fo.ParentUpdatePwdForm;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/28 17:37
 **/
public interface IParentService {
    List<ParentInfo> selectByStudentId(Integer studentId);

    int insert(ParentInfo parentInfo);

    boolean initData(Integer parentId);

    ParentInfo selectForLogin(String userName, String password);

    void update(ParentInfo parentInfo);

    void updatePwd(ParentUpdatePwdForm form);
}
