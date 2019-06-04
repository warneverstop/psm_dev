package com.psm.controller;

import com.psm.dto.*;
import com.psm.service.IMajorService;
import com.psm.service.IStudentService;
import com.psm.service.ITeacherService;
import com.psm.service.IClassService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    @Autowired
    private IStudentService studentService;


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


    /**
     * 显示班级信息维护界面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/showClassDefent")
    public String showClassDefent(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        ClassInfo classInfo = (ClassInfo) session.getAttribute("classInfo");
        List<StudentInfo> studentInfoList = studentService.selectByClassId(classInfo.getClassId());

        model.addAttribute("studentList",studentInfoList);
        model.addAttribute("classInfo",classInfo);
        return "manage/studentInfo/class_info_defent";
    }

    /**
     * 班级信息维护界面的保存更新
     * @param classInfo
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Msg updateClassInfo(ClassInfo classInfo,HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            ClassInfo classInfo2 = (ClassInfo) session.getAttribute("classInfo");
            classInfo2.setSumPeople(classInfo.getSumPeople());
            classInfo2.setStudentId(classInfo.getStudentId());

            ClassInfo classInfo1 = classService.selectById(classInfo.getClassId());
            classInfo1.setSumPeople(classInfo.getSumPeople());
            classInfo1.setStudentId(classInfo.getStudentId());
            classService.update(classInfo1);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/updateProfile")
    @ResponseBody
    public Msg updateClassProfile(Integer classId,String profile,HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            ClassInfo classInfo = (ClassInfo) session.getAttribute("classInfo");
            classInfo.setProfile(profile);


            ClassInfo classInfo1 = classService.selectById(classId);
            classInfo1.setProfile(profile);
            classService.update(classInfo1);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }


}
