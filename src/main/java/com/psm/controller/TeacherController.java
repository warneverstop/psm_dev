package com.psm.controller;

import com.psm.dto.Msg;
import com.psm.dto.TeacherInfo;
import com.psm.service.ITeacherService;
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
@RequestMapping("/teacher")
public class TeacherController {
    private Logger logger = Logger.getLogger(ClassController.class);

    @Autowired
    private ITeacherService teacherService;

    @RequestMapping("/select")
    public String showPage(Model model){
        List<TeacherInfo> teacherInfoList = teacherService.selectAll();
        model.addAttribute("teacherList",teacherInfoList);
        return "manage/basicData/teacher_info";
    }

    @RequestMapping("/selectById")
    @ResponseBody
    public Msg selectById(Integer teacherId){
        try {
            TeacherInfo teacherInfo = teacherService.selectById(teacherId);
            return Msg.success().add("teacherInfo",teacherInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg saveObject(TeacherInfo teacherInfo){
        try {
            if(teacherInfo.getTeacherId() == null){
                teacherInfo.setDel(1);
                teacherService.insertTeacher(teacherInfo);
            }else{
                TeacherInfo teacher = teacherService.selectById(teacherInfo.getTeacherId());
                teacher.setTeacherNumber(teacherInfo.getTeacherNumber());
                teacher.setTeacherName(teacherInfo.getTeacherName());
                teacher.setGenter(teacherInfo.getGenter());
                teacher.setJob(teacherInfo.getJob());
                teacher.setBackground(teacherInfo.getBackground());
                teacher.setEmail(teacherInfo.getEmail());
                teacher.setPhone(teacherInfo.getPhone());
                teacher.setOfficeAddress(teacherInfo.getOfficeAddress());
                teacher.setAddress(teacherInfo.getAddress());
                teacher.setSubject(teacherInfo.getSubject());
                teacher.setRemarks(teacherInfo.getRemarks());
                teacherService.updateTeacher(teacher);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteById(Integer teacherId){
        try {
            TeacherInfo teacherInfo = teacherService.selectById(teacherId);
            teacherInfo.setDel(0);
            teacherService.updateTeacher(teacherInfo);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }


}
