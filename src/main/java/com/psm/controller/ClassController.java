package com.psm.controller;

import com.psm.dto.ClassInfo;
import com.psm.dto.MajorInfo;
import com.psm.dto.Msg;
import com.psm.dto.TeacherInfo;
import com.psm.service.IMajorService;
import com.psm.service.ITeacherService;
import com.psm.service.IClassService;
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
@RequestMapping("/class")
public class ClassController {
    private Logger logger = Logger.getLogger(ClassController.class);

    @Autowired
    private IClassService classService;
    @Autowired
    private ITeacherService teacherService;
    @Autowired
    private IMajorService majorService;

    @RequestMapping("/select")
    public String showPage(Model model){
        List<ClassInfo> classInfoList = classService.selectAll();
        List<TeacherInfo> teacherInfoList = teacherService.selectAll();
        List<MajorInfo> majorInfoList = majorService.selectAll();

        model.addAttribute("teacherList",teacherInfoList);
        model.addAttribute("majorList",majorInfoList);
        model.addAttribute("classList",classInfoList);
        return "manage/basicData/class_info";
    }

    @RequestMapping("/selectById")
    @ResponseBody
    public Msg selectById(Integer classId){
        try {
            ClassInfo classInfo = classService.selectById(classId);
            return Msg.success().add("classInfo",classInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg saveObject(ClassInfo classInfo){
        try {
            if(classInfo.getClassId() == null){
                classInfo.setDel(1);
                classService.insert(classInfo);
            }else{
                ClassInfo classInfo1 = classService.selectById(classInfo.getClassId());
                classInfo1.setClassNumber(classInfo.getClassNumber());
                classInfo1.setCollege(classInfo.getCollege());
                classInfo1.setMajorId(classInfo.getMajorId());
                classInfo1.setTeacherId(classInfo.getTeacherId());
                classInfo1.setStudentId(classInfo.getStudentId());
                classInfo1.setSumPeople(classInfo.getSumPeople());
                classInfo1.setRemarks(classInfo.getRemarks());
                classService.update(classInfo1);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteById(Integer classId){
        try {
            ClassInfo classInfo = classService.selectById(classId);
            classInfo.setDel(0);
            classService.update(classInfo);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }
}
