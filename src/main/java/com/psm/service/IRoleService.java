package com.psm.service;

import com.psm.dto.RoleInfo;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/23 20:35
 **/
public interface IRoleService {
    List<RoleInfo> selectAll();

    int insertRole(RoleInfo roleInfo);

    RoleInfo selectById(Integer roleId);

    int updateRole(RoleInfo role);

    int deleteById(Integer roleId);
}
