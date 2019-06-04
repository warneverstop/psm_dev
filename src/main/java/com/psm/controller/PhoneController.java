package com.psm.controller;

import com.psm.dto.ActionInfo;
import com.psm.dto.Msg;
import com.psm.dto.PhoneInfo;
import com.psm.service.IPhoneService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/30 10:50
 **/
@Controller
@RequestMapping("/phone")
public class PhoneController {
    private Logger logger = Logger.getLogger(ClassController.class);

    @Autowired
    private IPhoneService phoneService;

    @RequestMapping("/select")
    public String showPage(Model model){
        List<PhoneInfo> phoneInfoList = phoneService.selectAll();
        model.addAttribute("phoneList",phoneInfoList);
        return "manage/notification/phone_info";
    }

    @RequestMapping("/selectById")
    @ResponseBody
    public Msg selectById(Integer phoneId){
        try {
            PhoneInfo phoneInfo = phoneService.selectById(phoneId);
            return Msg.success().add("phoneInfo",phoneInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg saveObject(PhoneInfo phoneInfo){
        try {
            if(phoneInfo.getPhoneId() == null){
                phoneService.insert(phoneInfo);
            }else{
                PhoneInfo phoneInfo1 = phoneService.selectById(phoneInfo.getPhoneId());
                phoneInfo1.setPhone(phoneInfo.getPhone());
                phoneInfo1.setPhoneObject(phoneInfo.getPhoneObject());
                phoneService.update(phoneInfo1);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteById(Integer phoneId){
        try {
            phoneService.delete(phoneId);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

}
