package com.psm.service;

import com.psm.dto.PowerInfo;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/23 10:23
 **/
public interface IPowerService {
    /**
     * 根据角色id查找权限列表
     * @param roleId
     * @return
     */
    List<PowerInfo> selectByRoleId(Integer roleId);
 }
