package com.psm.controller;

import com.psm.dto.Msg;
import com.psm.dto.RoleInfo;
import com.psm.dto.UserInfo;
import com.psm.service.IRoleService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/23 21:22
 **/
@Controller
@RequestMapping("/role")
public class RoleController {
    private Logger logger = Logger.getLogger(RoleController.class);

    @Autowired
    private IRoleService roleService;

    @RequestMapping("/select")
    public String showInfo(Model model){
        List<RoleInfo> roleInfos = roleService.selectAll();
        model.addAttribute("roleList",roleInfos);
        return "manage/system/role_info";
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg saveRole(RoleInfo roleInfo, HttpServletRequest request){
        HttpSession session = request.getSession();
        UserInfo user = (UserInfo) session.getAttribute("user");
        try {
            if(roleInfo.getRoleId() == null){
                roleInfo.setAddTime(new Date());
                roleInfo.setAddUser(user.getUserName());
                roleService.insertRole(roleInfo);
            }else{
                RoleInfo role = roleService.selectById(roleInfo.getRoleId());
                role.setRoleName(roleInfo.getRoleName());
                role.setRemark(roleInfo.getRemark());
                role.setState(roleInfo.getState());
                roleService.updateRole(role);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/selectById")
    @ResponseBody
    public Msg selectById(Integer roleId){
        try {
            RoleInfo role = roleService.selectById(roleId);
            return Msg.success().add("roleInfo",role);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteById(Integer roleId){
        try {
            roleService.deleteById(roleId);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }



}
