package com.psm.controller;

import com.psm.dto.DromInfo;
import com.psm.dto.Msg;
import com.psm.service.IDromService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/24 18:37
 **/
@Controller
@RequestMapping("/drom")
public class DromController {
    private Logger logger = Logger.getLogger(ClassController.class);

    @Autowired
    private IDromService dromService;

    @RequestMapping("/select")
    public String showPage(Model model){
        List<DromInfo> dromInfoList = dromService.selectAll();
        model.addAttribute("dromList",dromInfoList);
        return "manage/basicData/drom_info";
    }

    @RequestMapping("/selectById")
    @ResponseBody
    public Msg selectById(Integer dromId){
        try {
            DromInfo dromInfo = dromService.selectById(dromId);
            return Msg.success().add("dromInfo",dromInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg saveObject(DromInfo dromInfo){
        try {
            if(dromInfo.getDromId() == null){
                dromInfo.setDel(1);
                dromService.insertDrom(dromInfo);
            }else {
                DromInfo drom = dromService.selectById(dromInfo.getDromId());
                drom.setAlreadyLived(dromInfo.getAlreadyLived());
                drom.setDromAddress(dromInfo.getDromAddress());
                drom.setDromName(dromInfo.getDromName());
                drom.setProfile(dromInfo.getProfile());
                drom.setRemarks(dromInfo.getRemarks());
                drom.setStandrad(dromInfo.getStandrad());
                dromService.updateDrom(drom);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteById(Integer dromId){
        try {
            DromInfo dromInfo = dromService.selectById(dromId);
            dromInfo.setDel(0);
            dromService.updateDrom(dromInfo);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }


}
