package com.psm.controller;

import com.psm.dto.RolePowerInfo;
import com.psm.service.IRolePowerService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/23 21:50
 **/
@Controller
@RequestMapping("/power")
public class PowerController {
    private Logger logger = Logger.getLogger(PowerController.class);

    @Autowired
    private IRolePowerService rolePowerService;

    @RequestMapping("/select")
    public String showPowerManage(Integer roleId, Model model){
        List<RolePowerInfo> powerList = rolePowerService.selectByRoleId(roleId);
        model.addAttribute("powerList",powerList);
        return "manage/system/power_manage";
    }
}
