package com.psm.controller;

import com.psm.dto.Msg;
import com.psm.dto.PowerInfo;
import com.psm.dto.RolePowerInfo;
import com.psm.service.IPowerService;
import com.psm.service.IRolePowerService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @Autowired
    private IPowerService powerService;

    @RequestMapping("/select")
    public String showPowerManage(Integer roleId, Model model){
        List<RolePowerInfo> havePowerList = rolePowerService.selectByRoleId(roleId);
        List<PowerInfo> powerList = powerService.selectAll();

        model.addAttribute("powerList",powerList);
        model.addAttribute("havePowerList",havePowerList);
        model.addAttribute("roleId",roleId);
        return "manage/system/power_manage";
    }

    @RequestMapping("/updateRolePower")
    @ResponseBody
    public Msg updateRolePower(Integer[] powerIds,Integer roleId){
        try {
            if(rolePowerService.updateRolePower(powerIds,roleId)){
                return Msg.success();
            }else {
                return Msg.fail();
            }

        }catch (Exception e){
            return Msg.fail();
        }
    }
}
