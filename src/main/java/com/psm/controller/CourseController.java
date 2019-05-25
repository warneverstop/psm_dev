package com.psm.controller;

import com.psm.dto.CourseInfo;
import com.psm.dto.DromInfo;
import com.psm.dto.Msg;
import com.psm.service.ICourseService;
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
 * @creat: 2019/5/25 11:01
 **/
@Controller
@RequestMapping("/course")
public class CourseController {

    private Logger logger = Logger.getLogger(ClassController.class);

    @Autowired
    private ICourseService courseService;

    @RequestMapping("/select")
    public String showPage(Model model){
        List<CourseInfo> courseInfoList = courseService.selectAllInfo();
        model.addAttribute("courseList",courseInfoList);
        return "manage/basicData/course_info";
    }

    @RequestMapping("/selectById")
    @ResponseBody
    public Msg selectById(Integer courseId){
        try {
            CourseInfo courseInfo = courseService.selectById(courseId);
            return Msg.success().add("courseInfo",courseInfo);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg saveObject(CourseInfo courseInfo){
        try {
            if(courseInfo.getCourseId() == null){
                courseInfo.setDel(1);
                courseService.insert(courseInfo);
            }else {
                CourseInfo course = courseService.selectById(courseInfo.getCourseId());
                course.setAttribute(courseInfo.getAttribute());
                course.setCourseName(courseInfo.getCourseName());
                course.setCredit(courseInfo.getCredit());
                course.setRemarks(courseInfo.getRemarks());
                courseService.update(course);
            }
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteById(Integer courseId){
        try {
            CourseInfo courseInfo = courseService.selectById(courseId);
            courseInfo.setDel(0);
            courseService.update(courseInfo);
            return Msg.success();
        }catch (Exception e){
            return Msg.fail();
        }
    }

}
