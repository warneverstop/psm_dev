package com.psm.controller;

import com.psm.dto.MajorInfo;
import com.psm.dto.Msg;
import com.psm.service.IMajorService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/24 18:38
 **/
@Controller
@RequestMapping("/major")
public class MajorController {
    private Logger logger = Logger.getLogger(ClassController.class);

    @Autowired
    private IMajorService majorService;

    @RequestMapping("/select")
    public String showPage(Model model){
        List<MajorInfo> majorInfoList = majorService.selectAll();
        model.addAttribute("majorList",majorInfoList);
        return "manage/basicData/major_info";
    }

    @RequestMapping("/selectById")
    @ResponseBody
    public Msg selectById(Integer majorId){
        try {
            MajorInfo majorInfo = majorService.selectById(majorId);
            return Msg.success().add("majorInfo",majorInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg saveObject(MajorInfo majorInfo){
        try {
            if(majorInfo.getMajorId() == null){
                majorInfo.setDel(1);
                majorService.insertMajor(majorInfo);
            }else{
                MajorInfo major = majorService.selectById(majorInfo.getMajorId());
                major.setMajorName(majorInfo.getMajorName());
                major.setProfile(majorInfo.getProfile());
                major.setRemarks(majorInfo.getRemarks());
                majorService.updateMajor(major);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteById(Integer majorId){
        try {
            MajorInfo majorInfo = majorService.selectById(majorId);
            majorInfo.setDel(0);
            majorService.updateMajor(majorInfo);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }


}
