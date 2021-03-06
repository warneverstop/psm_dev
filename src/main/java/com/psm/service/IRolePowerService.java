package com.psm.service;

import com.psm.dto.RolePowerInfo;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/23 22:01
 **/
public interface IRolePowerService {
    List<RolePowerInfo> selectAll();

    /**
     * 根据角色id查找该角色所拥有的所有权限
     * @param roleId
     * @return
     */
    List<RolePowerInfo> selectByRoleId(Integer roleId);

    /**
     * 更新权限，先删除该角色下的所有权限，然后再添加
     * @param powerIds
     * @param roleId
     * @return
     */
    boolean updateRolePower(Integer[] powerIds, Integer roleId);
}
